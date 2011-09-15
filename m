From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 16 Sep 2011 01:03:23 +0200
Subject: [Buildroot] [PATCH 2 of 2 v2] Add xenomai real-time Framework
	to buildroot
In-Reply-To: <201109160058.52668.arnout@mind.be>
References: <patchbomb.1316004973@localhost6.localdomain6>
 <5dda8d37e2dd82f821ee.1316004975@localhost6.localdomain6>
 <201109160058.52668.arnout@mind.be>
Message-ID: <201109160103.24630.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Friday 16 September 2011 00:58:49, Arnout Vandecappelle wrote:
>  I used a patch which solves the underlying issue (at some point, sudo is 
> called instead of $SUDO) and I use
> XENOMAI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install-user
> XENOMAI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-user

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43

---
Fix use of sudo instead of $sudo

Signed-of-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
--
diff -ru xenomai-2.5.6.orig/Makefile.am xenomai-2.5.6/Makefile.am
--- xenomai-2.5.6.orig/Makefile.am	2011-02-16 15:26:01.000000000 +0100
+++ xenomai-2.5.6/Makefile.am	2011-06-16 13:31:43.000000000 +0200
@@ -37,7 +37,7 @@
 	   done ; \
 	else if test -d $(DESTDIR)/etc/udev/rules.d ; then \
 	      for f in $(srcdir)/ksrc/nucleus/udev/*.rules ; do \
-		 sudo cp $$f $(DESTDIR)/etc/udev/rules.d/ ; \
+		 $$sudo cp $$f $(DESTDIR)/etc/udev/rules.d/ ; \
 	      done ; \
 	   fi ; \
 	fi ; \
diff -ru xenomai-2.5.6.orig/Makefile.in xenomai-2.5.6/Makefile.in
--- xenomai-2.5.6.orig/Makefile.in	2011-02-16 15:26:01.000000000 +0100
+++ xenomai-2.5.6/Makefile.in	2011-06-16 13:31:53.000000000 +0200
@@ -705,7 +705,7 @@
 	   done ; \
 	else if test -d $(DESTDIR)/etc/udev/rules.d ; then \
 	      for f in $(srcdir)/ksrc/nucleus/udev/*.rules ; do \
-		 sudo cp $$f $(DESTDIR)/etc/udev/rules.d/ ; \
+		 $$sudo cp $$f $(DESTDIR)/etc/udev/rules.d/ ; \
 	      done ; \
 	   fi ; \
 	fi ; \
