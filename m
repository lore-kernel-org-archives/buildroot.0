From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Sep 2018 20:18:37 +0200
Subject: [Buildroot] [PATCH] Fix issue with printvars executing giant
 shell command
In-Reply-To: <1536601546.22056.12.camel@impinj.com>
References: <20180817231548.29867-1-tpiepho@impinj.com>
 <20180829204929.GA2617@scaer>
 <1536601546.22056.12.camel@impinj.com>
Message-ID: <20180910181837.GG2674@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trent, All,

On 2018-09-10 17:45 +0000, Trent Piepho spake thusly:
> On Wed, 2018-08-29 at 22:49 +0200, Yann E. MORIN wrote:
> > On 2018-08-17 16:15 -0700, Trent Piepho spake thusly:
> > > 
> > > The solution here is to use $(strip $(foreach ...)), so the command
> > > expands to "@:", which make is smart enough to not even execute and
> > > wouldn't exceed any limits if it did.
> 
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -988,13 +988,13 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
> > >  # displayed.
> > >  .PHONY: printvars
> > >  printvars:
> > > -	@:$(foreach V, \
> > > +	@:$(strip $(foreach V, \
> > 
> > Why do we even need an actual command here? It works exactly the same
> > without a rule, and this indeed also gets rid of a call to a shell (and
> > consequently won't exceed the command line length limit).
> 
> Not quite exactly the same.  There's no longer a recipe at all, only
> the definition of a dependency for printvars, so the output will
> include:
> 
> make[1]: Nothing to be done for 'printvars'.

So what about:

diff --git a/Makefile b/Makefile
index 2c6af12989..57e776056c 100644
--- a/Makefile
+++ b/Makefile
@@ -988,7 +988,8 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
 # displayed.
 .PHONY: printvars
 printvars:
-	@:$(foreach V, \
+	@:
+	$(foreach V, \
 		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
 		$(if $(filter-out environment% default automatic, \
 				$(origin $V)), \

> Which isn't expected output for something that was parsing printvars.

Which should probably have already called it with 'make -s' because
that is what is also needed when printvars is called from an
out-of-tree build, by the way.

> I'll also mention that we saw this error running buildroot in certain
> docker containers, but not everywhere.  Whether or not make will pass a
> giant sequence of whitespace to a shell ends up not being so simple,
> and I couldn't find any precise rules that govern it.  So just because
> it works as desired in one test doesn't mean is must work that way
> everywhere.

Before my suggested hange:

    $ strace -ff -s 1048576 -o n.log -e trace=process -- make printvars >/dev/null
    $ grep execve n.log* |grep '                  '
    --> hit!

With the above change:

    $ strace -ff -s 1048576 -o n.log -e trace=process -- make printvars >/dev/null
    $ grep execve n.log* |grep '                  '
    --> no hit!

In a recipe, a command line that contains only spaces will not be executed
by make.

So with the above, you get the silence from a rule, and no long-shell
commands that break.

> However, it is clearly defined that strip will convert a sequence of
> whitespace to an empty string, so I figured better to relay on that.

I'm just trying to keep it simple.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
