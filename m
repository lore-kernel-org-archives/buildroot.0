From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 24 Jul 2011 21:21:26 +0200
Subject: [Buildroot] ccache directory
In-Reply-To: <87zkk3wtmy.fsf@macbook.be.48ers.dk>
References: <CAAXf6LUROj4Pg2TLKETfo5SNYuC=teuFbcHEyhELuvmmTNTwvw@mail.gmail.com>
 <20110720181955.36911f14@skate>
 <87livs1xv4.fsf@macbook.be.48ers.dk>
 <20110721075819.5a535238@skate>
 <CAAXf6LUHjWVv794Voi40DPOy+QAaZNpdVKp8Z-k=yFcRtxay-Q@mail.gmail.com>
 <874o2byhax.fsf@macbook.be.48ers.dk>
 <87zkk3wtmy.fsf@macbook.be.48ers.dk>
Message-ID: <CAAXf6LW+awPoagLehXSVccwgGO4qJf8goaVZEoNaKeD+Q2fi1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, Jul 24, 2011 at 6:06 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:
>
> Hi,
>
> ?Thomas> Another solution is to remove the hardcoded cache directory,
> ?Thomas> use the CCACHE_DIR environment variable, but let buildroot set
> ?Thomas> that variable based on BR2_CCACHE_DIR (a configuration
> ?Thomas> option). This addresses Thomas' point regarding mixing
> ?Thomas> environment variables and configuration options, and my request
> ?Thomas> of being able to change the cache directory and making sure
> ?Thomas> these changes are automatically in effect.
>
> ?Thomas> What do you think?
>
> ?Peter> Yes, something like:
>
> ?Peter> # use BR setting if not set in environment
> ?Peter> ifndef CCACHE_DIR
> ?Peter> CCACHE_DIR:=$(call qstrip,BR2_CCACHE_DIR)
> ?Peter> endif
>
> ?Peter> export CCACHE_DIR
>
> ?Peter> in the toplevel Makefile.
>
> Except that doesn't work. The GENTARGETS stuff for ccache already
> creates a CCACHE_DIR variable for the ccache build directory, and the
> export line only gets evaluated just before the targets are executed :/
>
> As variables are automatically reexported when they were set in the
> environment, this also means that we would always clutter the CCACHE_DIR
> environment setting.
>
> It's furthermore not easy to handle a BR_CCACHE_DIR variable containing
> shell variables (like $HOME) that should get expanded before make
> handles it.

What exactly is the problem here? Other configuration options can use
shell variables like $(USER) without problem. The only thing to keep
in mind is to write these variables in make syntax with parentheses,
rather than in shell syntax with either curly braces or nothing.

>
> So that leaves either:
>
> - Keep things like they are
>
> - Add a BR2_CCACHE_DIR but tell people that they cannot use $VAR in it

How would you pass it to ccache then, given the restriction you
mentioned above? On each compiler command-line?

Or were you thinking of compiling this variable hardcoded in ccache
using the existing patch?

>
> - Patch ccache to look for another environment variable
>
> - Rework GENTARGETS to not use <pkg>_DIR, but several packages would
> ?need to be updated, and users might rely on it for local packages

In itself I'm not sure whether this is a problem. With
buildroot-2011.05, the board support also changed significantly, which
required some rework in non-mainstream projects. Moreover, the change
would be nothing more than a variable rename.

>
> - Rename ccache package to something else, breaking existing .configs
>
> I think option two (defaulting to ~/.buildroot-ccache or perhaps
> ~/.ccache) is probably the best option, followed by 1.
>
> --
> Bye, Peter Korsgaard
