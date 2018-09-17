From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 17 Sep 2018 18:02:50 +0000
Subject: [Buildroot] [PATCH] Fix issue with printvars executing giant
 shell command
In-Reply-To: <20180910181837.GG2674@scaer>
References: <20180817231548.29867-1-tpiepho@impinj.com>
 <20180829204929.GA2617@scaer> <1536601546.22056.12.camel@impinj.com>
 <20180910181837.GG2674@scaer>
Message-ID: <1537207369.7736.6.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2018-09-10 at 20:18 +0200, Yann E. MORIN wrote:
> On 2018-09-10 17:45 +0000, Trent Piepho spake thusly:
> > On Wed, 2018-08-29 at 22:49 +0200, Yann E. MORIN wrote:
> > > On 2018-08-17 16:15 -0700, Trent Piepho spake thusly:
> > > > 
> > > > The solution here is to use $(strip $(foreach ...)), so the command
> > > > expands to "@:", which make is smart enough to not even execute and
> > > > wouldn't exceed any limits if it did.
> > > > 
> So what about:
> 
> diff --git a/Makefile b/Makefile
> index 2c6af12989..57e776056c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -988,7 +988,8 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
>  # displayed.
>  .PHONY: printvars
>  printvars:
> -	@:$(foreach V, \
> +	@:
> +	$(foreach V, \
>  		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
>  		$(if $(filter-out environment% default automatic, \
>  				$(origin $V)), \
> 
> In a recipe, a command line that contains only spaces will not be executed
> by make.
> 
> So with the above, you get the silence from a rule, and no long-shell
> commands that break.
> 
> > However, it is clearly defined that strip will convert a sequence of
> > whitespace to an empty string, so I figured better to relay on that.
> 
> I'm just trying to keep it simple.

Ok, if you like that better.  My thought was "strip eats whitespace" is
simple, but "a recipe line starting with a tab and containing only
whitespace is skipped" is more obscure.  In fact, while it does appear
to be true, I haven't found anything in the make docs clearly stating
this.
