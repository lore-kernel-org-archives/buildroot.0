From: Jeff Rhyason <jrhyason@gmail.com>
Date: Wed, 27 Sep 2006 11:26:11 -0600
Subject: [Buildroot] patch for syntax error in package/xorg/xorg.mk
Message-ID: <2f6b5adb0609271026w2348bf32g70f1a6becedba19a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I had trouble building the latest version of buildroot:

% make
package/xorg/xorg.mk:54: Extraneous text after `else' directive
package/xorg/xorg.mk:56: Extraneous text after `else' directive
package/xorg/xorg.mk:56: *** only one `else' per conditional. Stop.
% make --version
GNU Make 3.80
[...]

I made these changes to gmake-3.80-compatible syntax:

Index: package/xorg/xorg.mk
=================================--- package/xorg/xorg.mk (revision 16236)
+++ package/xorg/xorg.mk (working copy)
@@ -51,23 +51,39 @@
# figure out Xorg's idea of corresponding architecture name
ifeq ($(BR2_alpha),y)
XARCH=Alpha
-else ifeq ($(BR2_arm),y)
+else
+ifeq ($(BR2_arm),y)
XARCH=Arm32
-else ifeq ($(BR2_armeb),y)
+else
+ifeq ($(BR2_armeb),y)
XARCH=Arm32
-else ifeq ($(BR2_i386),y)
+else
+ifeq ($(BR2_i386),y)
XARCH=i386A
-else ifeq ($(BR2_mips),y)
+else
+ifeq ($(BR2_mips),y)
XARCH=Mips
-else ifeq ($(BR2_mipsel),y)
+else
+ifeq ($(BR2_mipsel),y)
XARCH=Mips
-else ifeq ($(BR2_powerpc),y)
+else
+ifeq ($(BR2_powerpc),y)
XARCH=Ppc
-else ifeq ($(BR2_sparc),y)
+else
+ifeq ($(BR2_sparc),y)
XARCH=Sparc
-else ifeq ($(BR2_x86_64),y)
+else
+ifeq ($(BR2_x86_64),y)
XARCH=AMD64
endif
+endif
+endif
+endif
+endif
+endif
+endif
+endif
+endif
$(DL_DIR)/$(XORG_SOURCE):
$(WGET) -P $(DL_DIR) $(XORG_SITE)/$(XORG_SOURCE)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20060927/ffbbaf45/attachment.htm 
