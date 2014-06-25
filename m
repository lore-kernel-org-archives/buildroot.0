From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Jun 2014 23:32:07 +0200
Subject: [Buildroot] [PATCH] crda: bump to version 3.13
In-Reply-To: <1403631190-9354-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 24 Jun 2014 14:33:10 -0300")
References: <1403631190-9354-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a990smjs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  ...d-DESTDIR-support-in-install-libreg-rules.patch | 37 ++++++++++++++++++++++
 >  package/crda/crda.mk                               |  6 ++--
 >  2 files changed, 40 insertions(+), 3 deletions(-)
 >  create mode 100644 package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch

 > diff --git a/package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch b/package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch
 > new file mode 100644
 > index 0000000..ab25b38
 > --- /dev/null
 > +++ b/package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch
 > @@ -0,0 +1,37 @@
 > +From 2cabb2588da56735369131b709f191453c080be0 Mon Sep 17 00:00:00 2001
 > +From: "John W. Linville" <linville@tuxdriver.com>
 > +Date: Fri, 14 Feb 2014 13:58:44 -0500
 > +Subject: [PATCH 1/4] crda: Add DESTDIR support in install-libreg* rules in
 > + Makefile
 > +
 > +Signed-off-by: John W. Linville <linville@tuxdriver.com>
 > +Signed-off-by: Luis R. Rodriguez <mcgrof@do-not-panic.com>
 > +---
 > + Makefile | 8 ++++----
 > + 1 file changed, 4 insertions(+), 4 deletions(-)
 > +
 > +diff --git a/Makefile b/Makefile
 > +index 0b2f0d7..1f25509 100644
 > +--- a/Makefile
 > ++++ b/Makefile
 > +@@ -120,13 +120,13 @@ $(LIBREG): regdb.h reglib.h reglib.c
 > + 
 > + install-libreg-headers:
 > + 	$(NQ) '  INSTALL  libreg-headers'
 > +-	$(Q)mkdir -p $(INCLUDE_DIR)
 > +-	$(Q)cp *.h $(INCLUDE_DIR)/
 > ++	$(Q)mkdir -p $(DESTDIR)/$(INCLUDE_DIR)
 > ++	$(Q)cp *.h $(DESTDIR)/$(INCLUDE_DIR)/
 > + 
 > + install-libreg:
 > + 	$(NQ) '  INSTALL  libreg'
 > +-	$(Q)mkdir -p $(LIBDIR)
 > +-	$(Q)cp $(LIBREG) $(LIBDIR)/
 > ++	$(Q)mkdir -p $(DESTDIR)/$(LIBDIR)
 > ++	$(Q)cp $(LIBREG) $(DESTDIR)/$(LIBDIR)/
 > + 	$(Q)ldconfig

I also dropped the ldconfig call as it otherwise fails here:

 GZIP regdbdump.8
make[1]: ldconfig: Command not found
Makefile:127: recipe for target 'install-libreg' failed
make[1]: *** [install-libreg] Error 127
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory '/home/peko/source/buildroot/output/build/crda-3.13'

Perhaps a better fix for upstream is to do ldconfig || true or
something?

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
