From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 10 Sep 2015 11:44:50 +0100
Subject: [Buildroot] [PATCH] mtd: add missing -lintl from util-linux when
	building statically
Message-ID: <1441881890-6521-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mtd depends on util-linux when BR2_PACKAGE_MTD_MKFSUBIFS is selected.
Also, util-linux depends on gettext and will need to link with -lintl if
BR2_NEEDS_GETTEXT_IF_LOCALE is selected. So, when mtd tries to link with
util-linux's uuid (-luuid) it should add -lintl as well, but it fails
when building statically. The uuid.pc file lists -lintl as one of the
needed libraries, but since mtd package doesn't have a configure phase
we can't do the following:

MTD_DEPENDENCIES += host-pkgconf
MTD_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs uuid"`

So, in further investigations I have seen that mtd hardcodes the libs
for mkfs.ubifs in the Makefile, in a variable called LDLIBS_mkfs.ubifs,
and that variable can't be overwritten by passing options or environment
variables to make.

So, to fix the problem, we use a sed command to append -lintl to the
LDLIBS_mkfs.ubifs variable only when building statically, because it's
the case when it fails, and only when BR2_NEEDS_GETTEXT_IF_LOCALE is
selected, because is the case when you also need -lintl when linking
with util-linux.

Fixes:

  http://autobuild.buildroot.net/results/2dd/2ddd714446d9eb75701bd48c117dc5bbbd291a76/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/mtd/mtd.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 0fb9fc2..a34c840 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -18,6 +18,12 @@ endif
 
 ifeq ($(BR2_PACKAGE_MTD_MKFSUBIFS),y)
 MTD_DEPENDENCIES += util-linux zlib lzo
+ifeq ($(BR2_STATIC_LIBS)$(BR2_NEEDS_GETTEXT_IF_LOCALE),yy)
+define MTD_ADD_MISSING_LINTL
+	$(SED) '/^LDLIBS_mkfs\.ubifs/ s/$$/ -lintl/' $(@D)/Makefile
+endef
+MTD_PRE_BUILD_HOOKS += MTD_ADD_MISSING_LINTL
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
1.7.1
