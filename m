From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Oct 2017 15:08:42 +0200
Subject: [Buildroot] Discussion on per-package logging
In-Reply-To: <20171011105809.2bf05267@windsurf.lan>
References: <20171011105809.2bf05267@windsurf.lan>
Message-ID: <20171011130842.GA2659@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-10-11 10:58 +0200, Thomas Petazzoni spake thusly:
> I am currently trying to revive a former effort from Gustavo to
> implement top-level parallel build (i.e the ability to build several
> packages in parallel).
> 
> One first issue with top-level parallel build is simple: the build
> output of several packages is mixed up, making the overall build output
> mostly unreadable.

In my opinion, we can't do and should not do anything about it.

Either the user wants a fast build, and then it is acceptable that the
output gets mangled, or he is trying to debug the build and thus is not
doing parallel build to start with.

So, mangled output should not be a major concern, I think.

As we've seen, the SHELL and .ONESHELL hacks are not entirely working,
so we should just ignore the issue, which is not really a problem.

If the user wants a cleaner output, let him pass one of the various
--output-sync values.

Regards,
Yann E. MORIN.

> Therefore, an idea is to log the build output in log
> files per package, and only keep the ">>> foo 1.0 Building" messages on
> the standard output. It turns out this is not as easy as it sounds, and
> it seems like there is no good solution for that.
> 
> I will document below the two approaches that have been tried. Many
> thanks to Gustavo for the initial work on the "shell wrapper" approach,
> and thanks to Yann for the very useful discussion on IRC.
> 
> Shell wrapper approach
> ======================
> 
> This is the original approach taken by Gustavo, which can be seen at
> http://repo.or.cz/buildroot-gz.git/commitdiff/833e8fa7c7437931f1356b5b03a6b3810a3db586.
> 
> Basically, the idea is to override the SHELL variable and make it point
> to a wrapper script instead of pointing to bash directly. This wrapper
> script then re-executes the command under bash, but also redirects the
> output to a logfile. The core of the script is:
> 
>   exec ${BASH} "$@ > >(tee -a ${BR2_PACKAGE_LOGFILE}) 2> >(tee -a ${BR2_PACKAGE_LOGFILE} >&2)"
> 
> Note that we cannot just redirect the output, we need to use "tee" to
> keep the output both in the log file and on stdout, because  if you
> capture stdout, all the make commands such as:
> 
> HOSTCC_VERSION := $(shell $(HOSTCC_NOCCACHE) --version | \
>         sed -n -r 's/^.* ([0-9]*)\.([0-9]*)\.([0-9]*)[ ]*.*/\1 \2/p')
> 
> no longer have their output, and therefore HOSTCC_VERSION is empty.
> 
> But that's fine: we can use "tee" here, and then at a higher level
> redirect stdout to /dev/null, except the ">>>" messages. I did this
> inside the top-level make invocation that we already have calling
> ourselves as a sub-make to solve the umask and canonical directory
> issues.
> 
> However, where this solution falls apart is because make does *not*
> guarantee that all commands are executed through a sub-shell. As the
> make documentation says:
> 
>    When it is time to execute recipes to update a target, they are executed
>    by invoking a new sub-shell for each line of the recipe, unless the
>    '.ONESHELL' special target is in effect (*note Using One Shell: One
>    Shell.) (In practice, 'make' may take shortcuts that do not affect the
>    results.)
> 
> And Yann has indeed been able to easily create make targets that do not
> invoke a sub-shell to run a command. The output of such commands would
> not be captured. I had a brief look at make's source code to see what
> is the criteria, and my understanding is that make doesn't use a
> sub-shell, unless there are some specific keywords (such as while, for,
> etc.) in the command or specific characters (such as ; etc.).
> 
> Therefore this solution is not 100% correct. From my quick testing, it
> does capture all the output, but it is not 100% guaranteed. The
> question is: is it a big problem? It some sense it is, because it means
> that the per-package log files are not complete. But on the other hand
> it doesn't make the build incorrect.
> 
> Perhaps we could keep this approach, but make it optional?
> 
> Explicit redirect approach
> ==========================
> 
> The other approach I've investigated is adding explicit redirects to a
> log file in the package infrastructure itself. I.e, something like:
> 
>  $(BUILD_DIR)/%/.stamp_built::
>         @$(call step_start,build)
>         @$(call MESSAGE,"Building")
> -       $(foreach hook,$($(PKG)_PRE_BUILD_HOOKS),$(call $(hook))$(sep))
> -       +$($(PKG)_BUILD_CMDS)
> -       $(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
> +       @$(foreach hook,$($(PKG)_PRE_BUILD_HOOKS),$(call $(hook)) >> $(LOGFILE) 2>&1 $(sep))
> +       $(Q)+$($(PKG)_BUILD_CMDS) >> $(LOGFILE) 2>&1
> +       @$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook)) >> $(LOGFILE) 2>&1 $(sep))
>         @$(call step_end,build)
>         $(Q)touch $@
> 
> The problem with this is that if the variable <pkg>_BUILD_CMDS contains
> multiple commands (which is very often the case), then only the output
> of the last command is redirected. Indeed if you have:
> 
> define FOO_BUILD_CMDS
> 	$(MAKE) foo
> 	$(MAKE) bar
> endef
> 
> Then what gets executed is:
> 
> 	$(MAKE) foo
> 	$(MAKE) bar >> $(LOGFILE)
> 
> Obviously, we cannot patch all the package .mk files one by one to add
> a >> $(LOGFILE) to each and every command. It would make the
> package .mk files horrible to read and write.
> 
> One option would be to use the .ONESHELL make statements, that asks
> make to run all commands in a target under a single shell invocation.
> Unfortunately, this will break a lot of things in our packages. For
> example, something like:
> 
> define FOO_BUILD_CMDS
> 	cd $(@D)/bar; $(MAKE) blabla
> 	$(MAKE) foo
> endef
> 
> Will no longer work, because the second command $(MAKE) foo will be
> executed from $(@D)/bar, which is not currently the case since each
> command runs in a separate sub-shell. This would require changing a lot
> of packages, and it would be somewhat "unconventional" to have commands
> that depend on each other.
> 
> Conclusion
> ==========
> 
> None of the two approaches are completely convincing. The second
> approach looks totally unworkable to me. The first approach could be
> acceptable if we see that in practice, most commands are executed in a
> sub-shell.
> 
> Suggestions? Comments? Alternative proposals?
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
