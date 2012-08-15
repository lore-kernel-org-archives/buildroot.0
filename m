From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 15 Aug 2012 16:38:24 +0200
Subject: [Buildroot] [PATCH 02/12] microperl: how to test it ?
In-Reply-To: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
References: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1345041514-31539-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/microperl/Config.in    |    9 +++++++++
 package/microperl/microperl.mk |   12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/microperl/Config.in b/package/microperl/Config.in
index 256e271..54df7e2 100644
--- a/package/microperl/Config.in
+++ b/package/microperl/Config.in
@@ -15,6 +15,15 @@ config BR2_PACKAGE_MICROPERL_MODULES
 	  Module dependencies are not automatic so check your needs.
 	  You can't use XS modules like IO.
 
+config BR2_PACKAGE_MICROPERL_INSTALL_TESTSUITE
+	bool "install testsuite"
+	help
+	  Install the test suite on target.
+		# cd /root/microperl/t
+		# rm -f perl
+		# ln -s /usr/bin/microperl perl
+		# ./perl TEST base/*.t cmd/*.t
+
 menu "module bundles"
 
 config BR2_PACKAGE_MICROPERL_BUNDLE_CGI
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index b2a912a..0269b3f 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -144,8 +144,20 @@ define MICROPERL_INSTALL_TARGET_CMDS
 	# Remove test files
 	find $(TARGET_DIR)/$(MICROPERL_MODS_DIR) -type f -name *.t \
 		-exec rm -f {} \;
+	$(MICROPERL_INSTALL_TESTSUITE)
 endef
 
+ifdef BR2_PACKAGE_MICROPERL_INSTALL_TESTSUITE
+define MICROPERL_INSTALL_TESTSUITE
+	$(INSTALL) -m644 -D $(@D)/t/TEST                $(TARGET_DIR)/root/microperl/t/TEST
+	$(INSTALL) -m644 -D $(@D)/t/harness             $(TARGET_DIR)/root/microperl/t/harness
+	cp -r $(@D)/lib         $(TARGET_DIR)/root/microperl/lib
+	cp -r $(@D)/t/base      $(TARGET_DIR)/root/microperl/t/base
+	cp -r $(@D)/t/cmd       $(TARGET_DIR)/root/microperl/t/cmd
+	echo "BEGIN { chdir 't' if -d 't'; @INC = ('../lib', '.'); } 1;" > $(TARGET_DIR)/root/microperl/TestInit.pm
+endef
+endif
+
 define MICROPERL_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/perl
 	rm -f $(TARGET_DIR)/usr/bin/microperl
-- 
1.7.9.5
