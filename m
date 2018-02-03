From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Feb 2018 22:34:59 +0100
Subject: [Buildroot] [PATCH v2] package/lynx: depends on dynamic lib
In-Reply-To: <20180203184656.2101-1-mlang@blind.guru> (Mario Lang's message of
 "Sat, 3 Feb 2018 19:46:56 +0100")
References: <20180203184656.2101-1-mlang@blind.guru>
Message-ID: <87fu6h21vg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mario" == Mario Lang <mlang@blind.guru> writes:

 > This fixes the following autobuild errors:
 >   http://autobuild.buildroot.net/results/9a7b37264d592add75dd2a0f233a2de4eba4f489
 >   http://autobuild.buildroot.net/results/d3ecc533b5c5a33a9385e7f1f689ddf9bfa6fd43

Hmm, but this happens when building a host utility. The real problem
seems to be that src/chrtrans/makefile.in mixes up compiler flags for
the build and for the target - E.G. it uses LDFLAGS and BUILD_LDFLAGS,
and LDFLAGS contains --static.

How about fixing that instead?


 > Signed-off-by: Mario Lang <mlang@blind.guru>
 > ---
 > v2:
 >   * Add "depends on BR2_USE_MMU" to the comment
 >   * Reorder dependencies such that hardware deps come first

 >  package/lynx/Config.in | 5 +++++
 >  1 file changed, 5 insertions(+)

 > diff --git a/package/lynx/Config.in b/package/lynx/Config.in
 > index a338f83616..e1acc428be 100644
 > --- a/package/lynx/Config.in
 > +++ b/package/lynx/Config.in
 > @@ -1,9 +1,14 @@
 >  config BR2_PACKAGE_LYNX
 >  	bool "lynx"
 >  	depends on BR2_USE_MMU
 > +	depends on !BR2_STATIC_LIBS
 >  	select BR2_PACKAGE_SLANG if !BR2_PACKAGE_NCURSES
 >  	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
 >  	help
 >  	  The Text Web-Browser.
 
 >  	  http://lynx.invisible-island.net/
 > +
 > +comment "lynx needs a toolchain w/ dynamic lib"
 > +	depends on BR2_USE_MMU
 > +	depends on BR2_STATIC_LIBS
 > -- 
 > 2.15.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
