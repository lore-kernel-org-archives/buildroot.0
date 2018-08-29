From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Aug 2018 22:49:29 +0200
Subject: [Buildroot] [PATCH] Fix issue with printvars executing giant
 shell command
In-Reply-To: <20180817231548.29867-1-tpiepho@impinj.com>
References: <20180817231548.29867-1-tpiepho@impinj.com>
Message-ID: <20180829204929.GA2617@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trent, All,

On 2018-08-17 16:15 -0700, Trent Piepho spake thusly:
> The underlying problem is that $(foreach V,1 2 3,) does not evaluate to
> an empty string.  It evaluates to "? ", three empty strings separated by
> whitespace.
> 
> A construct of this format, with a giant list in the foreach, is part of
> the printvars command.  This means that "@:$(foreach ....)", which is
> intended to expand to a null command, in fact expands to "@:       "
> with a great deal of whitespace.  Make chooses to execute this command
> with:
>     execve("/bin/sh", ["/bin/sh", "-c", ":       "]
> 
> But with far more whitespace.  So much that it can exceed shell command
> line length limits.
> 
> The solution here is to use $(strip $(foreach ...)), so the command
> expands to "@:", which make is smart enough to not even execute and
> wouldn't exceed any limits if it did.
> 
> In some cases, make will not invoke a command via "sh -c" and will exec
> it directly.  In this case make does command line argument parsing and
> will swallow all the whitespace without overflowing a /bin/sh limit.  It
> proved difficult to write a command that ensured make would do this.
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 0115c4dfcc..b396c56042 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -988,13 +988,13 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
>  # displayed.
>  .PHONY: printvars
>  printvars:
> -	@:$(foreach V, \
> +	@:$(strip $(foreach V, \

Why do we even need an actual command here? It works exactly the same
without a rule, and this indeed also gets rid of a call to a shell (and
consequently won't exceed the command line length limit).

I.e. the following:

    diff --git a/Makefile b/Makefile
    index 413ec921cd..b7b1257ea6 100644
    --- a/Makefile
    +++ b/Makefile
    @@ -977,7 +977,7 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
     # displayed.
     .PHONY: printvars
     printvars:
    -	@:$(foreach V, \
    +	$(foreach V, \
     		$(sort $(if $(VARS),$(fil		ter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
     		$(if $(filter-out environment% default automatic, \
     				$(origin $V)), \

Do you see a case where that would not work?

FTR I tried to strace it to find the shells;

    $ strace -o m.log -ff -e trace=process -- make -s printvars >/dev/null
    $ grep execve m.log* |grep '                  '
    --> nothing

(before the patch above, there was one hit on the grep.)

Regards,
Yann E. MORIN.

>  		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
>  		$(if $(filter-out environment% default automatic, \
>  				$(origin $V)), \
>  		$(if $(QUOTED_VARS),\
>  			$(info $V='$(subst ','\'',$(if $(RAW_VARS),$(value $V),$($V)))'), \
> -			$(info $V=$(if $(RAW_VARS),$(value $V),$($V))))))
> +			$(info $V=$(if $(RAW_VARS),$(value $V),$($V)))))))
>  # ' Syntax colouring...
>  
>  .PHONY: clean
> -- 
> 2.14.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
