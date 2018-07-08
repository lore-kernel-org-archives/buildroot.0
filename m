From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jul 2018 11:45:26 +0200
Subject: [Buildroot] [PATCH 01/50 v2] package/busybox: update to 1.29.0
In-Reply-To: <cover.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <a4758f31d7bbdee7569e4aa3582ec01ebfbb0954.1531043163.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The two patches are still needed, with the second needing a slight
refresh around the edge.

Since upstream has now full support to perform a noclobber install, drop
of our hook and use the new install rule.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>

---
Notes: Matt, I did not carry your reviewd-by tag, as the patch entirely
changed since you reviewed it. Thanks for your initial review! :-)

---
Changes v1?-> v2;
  - bump version now it is released  (Baruch)
---
 ...akefile.flags-strip-non-l-arguments-returned-by-pkg.patch |  4 +++-
 package/busybox/busybox.hash                                 | 10 +++-------
 package/busybox/busybox.mk                                   | 12 ++++--------
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch b/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
index a5da3a251e..8375ae0531 100644
--- a/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
+++ b/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
@@ -4,6 +4,8 @@ Date: Mon, 25 Nov 2013 22:51:53 +0100
 Subject: [PATCH] Makefile.flags: strip non -l arguments returned by pkg-config
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[yann.morin.1998 at free.fr: refresh for 1.29.0]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
  Makefile.flags | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
@@ -22,7 +24,7 @@ index 307afa7..885e323 100644
 +       $(SELINUX_PC_MODULES:lib%=%))
  endif
  
- ifeq ($(CONFIG_EFENCE),y)
+ ifeq ($(CONFIG_FEATURE_NSLOOKUP_BIG),y)
 -- 
 1.8.1.2
 
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 066817aefb..26194be3a9 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,7 +1,3 @@
-# From https://busybox.net/downloads/busybox-1.28.4.tar.bz2.sign
-md5 5661d013c9ef7cc31a453640c320f56b  busybox-1.28.4.tar.bz2
-sha1 acd0558a659b795da1dfbd7e0ed5353d6836fa37  busybox-1.28.4.tar.bz2
-
-# Locally calculated
-sha256 e3c14a3699dc7e82fed397392957afc78e37bdf25398ac38ead6e84621b2ae6a  busybox-1.28.4.tar.bz2
-sha256	bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548	LICENSE
+# From https://busybox.net/downloads/busybox-1.29.0.tar.bz2.sha256
+sha256 c8115612f0be640644e7c35098766ddaac4a88b773c4c4f0e43564982f660c82  busybox-1.29.0.tar.bz2
+sha256 bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index ba5a16b5b7..948a8313c3 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.28.4
+BUSYBOX_VERSION = 1.29.0
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0
@@ -253,12 +253,6 @@ define BUSYBOX_INSTALL_ADD_TO_SHELLS
 endef
 BUSYBOX_TARGET_FINALIZE_HOOKS += BUSYBOX_INSTALL_ADD_TO_SHELLS
 
-# Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
-# full-blown versions of apps installed by other packages with sym/hard links.
-define BUSYBOX_NOCLOBBER_INSTALL
-	$(SED) 's/^noclobber="0"$$/noclobber="1"/' $(@D)/applets/install.sh
-endef
-
 define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_MMU)
 	$(BUSYBOX_PREFER_STATIC)
@@ -280,7 +274,9 @@ define BUSYBOX_BUILD_CMDS
 endef
 
 define BUSYBOX_INSTALL_TARGET_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
+	# Use the 'noclobber' install rule, to prevent BusyBox from overwriting
+	# any full-blown versions of apps installed by other packages.
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install-noclobber
 	$(BUSYBOX_INSTALL_INITTAB)
 	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
-- 
2.14.1
