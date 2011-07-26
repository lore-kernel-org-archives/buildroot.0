From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 26 Jul 2011 09:38:13 +0200
Subject: [Buildroot] ccache directory
In-Reply-To: <87ipqrwig7.fsf@macbook.be.48ers.dk>
References: <CAAXf6LUROj4Pg2TLKETfo5SNYuC=teuFbcHEyhELuvmmTNTwvw@mail.gmail.com>
 <20110720181955.36911f14@skate>
 <87livs1xv4.fsf@macbook.be.48ers.dk>
 <20110721075819.5a535238@skate>
 <CAAXf6LUHjWVv794Voi40DPOy+QAaZNpdVKp8Z-k=yFcRtxay-Q@mail.gmail.com>
 <874o2byhax.fsf@macbook.be.48ers.dk>
 <87zkk3wtmy.fsf@macbook.be.48ers.dk>
 <CAAXf6LW+awPoagLehXSVccwgGO4qJf8goaVZEoNaKeD+Q2fi1w@mail.gmail.com>
 <87ipqrwig7.fsf@macbook.be.48ers.dk>
Message-ID: <CAAXf6LX_tGtwWWkD6z0SaYu84OAx3cekN_bRNwN6o82PtUtuQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Jul 24, 2011 at 10:07 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:
>
> Hi,
>
> ?>> It's furthermore not easy to handle a BR_CCACHE_DIR variable
> ?>> containing shell variables (like $HOME) that should get expanded
> ?>> before make handles it.
>
> ?Thomas> What exactly is the problem here? Other configuration options
> ?Thomas> can use shell variables like $(USER) without problem. The only
> ?Thomas> thing to keep in mind is to write these variables in make
> ?Thomas> syntax with parentheses, rather than in shell syntax with
> ?Thomas> either curly braces or nothing.
>
> Indeed, that's the (potential) problem. People need to write the patch
> in make syntax rather than shell, which may or may not be a problem if
> they expect something similar to the CCACHE_DIR shell environment
> variable.
>
> ?>> - Add a BR2_CCACHE_DIR but tell people that they cannot use $VAR in it
>
> ?Thomas> How would you pass it to ccache then, given the restriction you
> ?Thomas> mentioned above? On each compiler command-line?
>
> ?Thomas> Or were you thinking of compiling this variable hardcoded in ccache
> ?Thomas> using the existing patch?
>
> Hardcode it like it is now would be simplest option.

But has the disadvantage of not picking up changes in BR2_CCACHE_DIR
automatically; you have to force a rebuild of host-ccache.
Do you have any objection against passing the CCACHE_DIR on the CC /
CCX command-line? This does not interfere with gentargets, but does
allow for easy changing of the config option.

>
>
> ?>> - Rework GENTARGETS to not use <pkg>_DIR, but several packages would
> ?>> ?need to be updated, and users might rely on it for local packages
>
> ?Thomas> In itself I'm not sure whether this is a problem. With
> ?Thomas> buildroot-2011.05, the board support also changed
> ?Thomas> significantly, which required some rework in non-mainstream
> ?Thomas> projects. Moreover, the change would be nothing more than a
> ?Thomas> variable rename.
>
> True - It would still mean that we would have to fix up a number of
> packages though, E.G.:
>
> git grep '([A-Z0-9]*_DIR)' package/**/*.mk | \
> ? ?egrep -v 'STAGING_|BUILD_|TARGET_|HOST_|DL_' | \
> ? ?cut -f1 -d: | sort -u | wc -l
> 34
>
> --
> Bye, Peter Korsgaard
>
