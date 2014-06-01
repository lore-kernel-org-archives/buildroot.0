From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jun 2014 23:08:40 +0200
Subject: [Buildroot] [PATCH] ncurses: enable parallel build
In-Reply-To: <1401307959-19956-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 28 May 2014 17:12:39 -0300")
References: <1401307959-19956-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wqd01go7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Using a trick taken from gentoo enable parallel build when building for
 > the target to reduce the build time for my test case from about 54s to
 > 32s on a dual-core laptop.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

I'm personally not convinced that the extra complexity is worth the
10-20s faster build in the context of a 30m-1h Buildroot build - But ok,
you guys do and atleast it is selfcontained.

 > ---
 >  package/ncurses/ncurses.mk | 4 +++-
 >  1 file changed, 3 insertions(+), 1 deletion(-)

 > diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
 > index 9805113..8e4b9e7 100644
 > --- a/package/ncurses/ncurses.mk
 > +++ b/package/ncurses/ncurses.mk
 > @@ -46,7 +46,9 @@ NCURSES_CONF_OPT += --without-debug
 >  endif

I've added a comment above explaining where this magic comes from and
committed, thanks.
 
 >  define NCURSES_BUILD_CMDS
 > -	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR)
 > +	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) sources
 > +	rm -rf $(@D)/misc/pc-files
 > +	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR)
 >  endef
 
 >  ifneq ($(BR2_PREFER_STATIC_LIB),y)
 > -- 
 > 1.8.5.5

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
