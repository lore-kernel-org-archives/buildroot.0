From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 10 Sep 2018 17:45:47 +0000
Subject: [Buildroot] [PATCH] Fix issue with printvars executing giant
 shell command
In-Reply-To: <20180829204929.GA2617@scaer>
References: <20180817231548.29867-1-tpiepho@impinj.com>
 <20180829204929.GA2617@scaer>
Message-ID: <1536601546.22056.12.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2018-08-29 at 22:49 +0200, Yann E. MORIN wrote:
> On 2018-08-17 16:15 -0700, Trent Piepho spake thusly:
> > 
> > The solution here is to use $(strip $(foreach ...)), so the command
> > expands to "@:", which make is smart enough to not even execute and
> > wouldn't exceed any limits if it did.

> > --- a/Makefile
> > +++ b/Makefile
> > @@ -988,13 +988,13 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
> >  # displayed.
> >  .PHONY: printvars
> >  printvars:
> > -	@:$(foreach V, \
> > +	@:$(strip $(foreach V, \
> 
> Why do we even need an actual command here? It works exactly the same
> without a rule, and this indeed also gets rid of a call to a shell (and
> consequently won't exceed the command line length limit).

Not quite exactly the same.  There's no longer a recipe at all, only
the definition of a dependency for printvars, so the output will
include:

make[1]: Nothing to be done for 'printvars'.

Which isn't expected output for something that was parsing printvars.

I'll also mention that we saw this error running buildroot in certain
docker containers, but not everywhere.  Whether or not make will pass a
giant sequence of whitespace to a shell ends up not being so simple,
and I couldn't find any precise rules that govern it.  So just because
it works as desired in one test doesn't mean is must work that way
everywhere.

However, it is clearly defined that strip will convert a sequence of
whitespace to an empty string, so I figured better to relay on that.
