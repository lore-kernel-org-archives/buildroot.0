From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Jul 2011 18:06:13 +0200
Subject: [Buildroot] ccache directory
In-Reply-To: <874o2byhax.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
 of "Sun, 24 Jul 2011 14:49:42 +0200")
References: <CAAXf6LUROj4Pg2TLKETfo5SNYuC=teuFbcHEyhELuvmmTNTwvw@mail.gmail.com>
 <20110720181955.36911f14@skate> <87livs1xv4.fsf@macbook.be.48ers.dk>
 <20110721075819.5a535238@skate>
 <CAAXf6LUHjWVv794Voi40DPOy+QAaZNpdVKp8Z-k=yFcRtxay-Q@mail.gmail.com>
 <874o2byhax.fsf@macbook.be.48ers.dk>
Message-ID: <87zkk3wtmy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

Hi,

 Thomas> Another solution is to remove the hardcoded cache directory,
 Thomas> use the CCACHE_DIR environment variable, but let buildroot set
 Thomas> that variable based on BR2_CCACHE_DIR (a configuration
 Thomas> option). This addresses Thomas' point regarding mixing
 Thomas> environment variables and configuration options, and my request
 Thomas> of being able to change the cache directory and making sure
 Thomas> these changes are automatically in effect.

 Thomas> What do you think?

 Peter> Yes, something like:

 Peter> # use BR setting if not set in environment
 Peter> ifndef CCACHE_DIR
 Peter> CCACHE_DIR:=$(call qstrip,BR2_CCACHE_DIR)
 Peter> endif

 Peter> export CCACHE_DIR

 Peter> in the toplevel Makefile.

Except that doesn't work. The GENTARGETS stuff for ccache already
creates a CCACHE_DIR variable for the ccache build directory, and the
export line only gets evaluated just before the targets are executed :/

As variables are automatically reexported when they were set in the
environment, this also means that we would always clutter the CCACHE_DIR
environment setting.

It's furthermore not easy to handle a BR_CCACHE_DIR variable containing
shell variables (like $HOME) that should get expanded before make
handles it.

So that leaves either:

- Keep things like they are

- Add a BR2_CCACHE_DIR but tell people that they cannot use $VAR in it

- Patch ccache to look for another environment variable

- Rework GENTARGETS to not use <pkg>_DIR, but several packages would
  need to be updated, and users might rely on it for local packages

- Rename ccache package to something else, breaking existing .configs

I think option two (defaulting to ~/.buildroot-ccache or perhaps
~/.ccache) is probably the best option, followed by 1.

-- 
Bye, Peter Korsgaard
