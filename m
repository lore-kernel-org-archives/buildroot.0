From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Fri, 11 Jul 2008 05:42:51 -0700 (PDT)
Subject: [Buildroot] Makefile.autotools.in problems
In-Reply-To: <18402911.post@talk.nabble.com>
References: <18377517.post@talk.nabble.com>
	<87y74aqiyy.fsf@macbook.be.48ers.dk>
	<20080711081729.GB11051@mx.loc> <18399520.post@talk.nabble.com>
	<18402911.post@talk.nabble.com>
Message-ID: <18402988.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Oops, wrong patch :-( 
Heres the correct patch:
diff -urN buildroot-20080708.orig/buildroot/package/Makefile.autotools.in
buildroot-20080708/buildroot/package/Makefile.autotools.in
--- buildroot-20080708.orig/buildroot/package/Makefile.autotools.in
2008-07-08 13:47:19.000000000 +0100
+++ buildroot-20080708/buildroot/package/Makefile.autotools.in	2008-07-11
13:39:36.000000000 +0100
@@ -170,12 +170,16 @@
 	$(if $($(PKG)_PATCH),toolchain/patch-kernel.sh $(@D) $(DL_DIR)
$($(PKG)_PATCH))
 	$(Q)( \
 	if test -d $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME); then \
+	  if test -d
$($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/patches-$($(PKG)_VERSION); then \
+	    toolchain/patch-kernel.sh $(@D)
$($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/patches-$($(PKG)_VERSION)/ \*.patch
\*.patch.$(ARCH) || exit 1; \
+	  else \
 	  if test "$(wildcard
$($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER)*.patch*)"; then \
 	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)
$(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
 	  else \
 	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)
$($(PKG)_NAME)\*.patch $($(PKG)_NAME)\*.patch.$(ARCH) || exit 1; \
 	    if test -d package/$($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER);
then \
 	      toolchain/patch-kernel.sh $(@D)
$($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH) ||
exit 1; \
+	      fi; \
 	    fi; \
 	  fi; \
 	fi; \

Any thoughts?
-- 
View this message in context: http://www.nabble.com/Makefile.autotools.in-problems-tp18377517p18402988.html
Sent from the BuildRoot mailing list archive at Nabble.com.
