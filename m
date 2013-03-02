From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  2 Mar 2013 11:38:59 +0100
Subject: [Buildroot] [PATCH 2/3] cpanminus: works with arm & mips
In-Reply-To: <1362220740-17593-1-git-send-email-francois.perrad@gadz.org>
References: <1362220740-17593-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1362220740-17593-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cpanminus/Config.in    |   15 +++++++++++----
 package/cpanminus/cpanminus.mk |    2 +-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/cpanminus/Config.in b/package/cpanminus/Config.in
index b10d211..cf93a7e 100644
--- a/package/cpanminus/Config.in
+++ b/package/cpanminus/Config.in
@@ -1,9 +1,16 @@
 config BR2_PACKAGE_CPANMINUS
 	bool "cpanminus"
-	# Requires host-qemu, which cannot work properly due to kernel
-	# headers mismatch between the build environment and the
-	# target.
-	depends on BR2_BROKEN
+	# host-qemu doesn't work for the following platforms
+	depends on !BR2_avr32
+	depends on !BR2_bfin
+	depends on !BR2_sh2
+	depends on !BR2_sh2a
+	depends on !BR2_sh3
+	depends on !BR2_sh3eb
+	depends on !BR2_sh64
+	# host-qemu doesn't support system() on the following platforms
+	depends on !BR2_i386
+	depends on !BR2_x86_64
 	help
 	  cpanminus is a script to get, unpack, build and install Perl modules
 	  from CPAN.
diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
index e7e3f29..f815199 100644
--- a/package/cpanminus/cpanminus.mk
+++ b/package/cpanminus/cpanminus.mk
@@ -36,7 +36,7 @@ define CPANMINUS_INSTALL_TARGET_CMDS
 		--no-man-pages \
 		$(CPANMINUS_MIRROR) \
 		$(call qstrip,$(BR2_PACKAGE_CPANMINUS_MODULES))
-	-find $(CPANMINUS_PERL_SITEARCH) -type f -name *.bs -exec rm -f {} \;
+	-find $(CPANMINUS_PERL_SITELIB) -type f -name *.bs -exec rm -f {} \;
 endef
 else
 define CPANMINUS_INSTALL_TARGET_CMDS
-- 
1.7.9.5
