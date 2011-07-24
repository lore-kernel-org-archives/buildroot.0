From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Jul 2011 22:07:52 +0200
Subject: [Buildroot] ccache directory
In-Reply-To: <CAAXf6LW+awPoagLehXSVccwgGO4qJf8goaVZEoNaKeD+Q2fi1w@mail.gmail.com>
 (Thomas De Schampheleire's message of "Sun, 24 Jul 2011 21:21:26
 +0200")
References: <CAAXf6LUROj4Pg2TLKETfo5SNYuC=teuFbcHEyhELuvmmTNTwvw@mail.gmail.com>
 <20110720181955.36911f14@skate> <87livs1xv4.fsf@macbook.be.48ers.dk>
 <20110721075819.5a535238@skate>
 <CAAXf6LUHjWVv794Voi40DPOy+QAaZNpdVKp8Z-k=yFcRtxay-Q@mail.gmail.com>
 <874o2byhax.fsf@macbook.be.48ers.dk>
 <87zkk3wtmy.fsf@macbook.be.48ers.dk>
 <CAAXf6LW+awPoagLehXSVccwgGO4qJf8goaVZEoNaKeD+Q2fi1w@mail.gmail.com>
Message-ID: <87ipqrwig7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 >> It's furthermore not easy to handle a BR_CCACHE_DIR variable
 >> containing shell variables (like $HOME) that should get expanded
 >> before make handles it.

 Thomas> What exactly is the problem here? Other configuration options
 Thomas> can use shell variables like $(USER) without problem. The only
 Thomas> thing to keep in mind is to write these variables in make
 Thomas> syntax with parentheses, rather than in shell syntax with
 Thomas> either curly braces or nothing.

Indeed, that's the (potential) problem. People need to write the patch
in make syntax rather than shell, which may or may not be a problem if
they expect something similar to the CCACHE_DIR shell environment
variable.

 >> - Add a BR2_CCACHE_DIR but tell people that they cannot use $VAR in it

 Thomas> How would you pass it to ccache then, given the restriction you
 Thomas> mentioned above? On each compiler command-line?

 Thomas> Or were you thinking of compiling this variable hardcoded in ccache
 Thomas> using the existing patch?

Hardcode it like it is now would be simplest option.


 >> - Rework GENTARGETS to not use <pkg>_DIR, but several packages would
 >> ?need to be updated, and users might rely on it for local packages

 Thomas> In itself I'm not sure whether this is a problem. With
 Thomas> buildroot-2011.05, the board support also changed
 Thomas> significantly, which required some rework in non-mainstream
 Thomas> projects. Moreover, the change would be nothing more than a
 Thomas> variable rename.

True - It would still mean that we would have to fix up a number of
packages though, E.G.:

git grep '([A-Z0-9]*_DIR)' package/**/*.mk | \
    egrep -v 'STAGING_|BUILD_|TARGET_|HOST_|DL_' | \
    cut -f1 -d: | sort -u | wc -l
34

-- 
Bye, Peter Korsgaard
