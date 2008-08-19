From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 19 Aug 2008 02:40:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/haserl
Message-ID: <20080819094021.772263C84B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-19 02:40:20 -0700 (Tue, 19 Aug 2008)
New Revision: 23104

Log:
haserl: don't install unneeded examples for 0.8.0 to target

Modified:
   trunk/buildroot/package/haserl/haserl.mk


Changeset:
Modified: trunk/buildroot/package/haserl/haserl.mk
===================================================================
--- trunk/buildroot/package/haserl/haserl.mk	2008-08-19 09:40:18 UTC (rev 23103)
+++ trunk/buildroot/package/haserl/haserl.mk	2008-08-19 09:40:20 UTC (rev 23104)
@@ -12,7 +12,6 @@
 HASERL_INSTALL_STAGING:=NO
 HASERL_INSTALL_TARGET:=YES
 HASERL_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) STRIPPROG='$(STRIPCMD)' install-strip
-HASERL_UNINSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) uninstall
 
 # force haserl 0.8.0 to use install-sh so stripping works
 HASERL_CONF_ENV = ac_cv_path_install=./install-sh
@@ -20,3 +19,8 @@
 HASERL_DEPENDENCIES:=uclibc
 
 $(eval $(call AUTOTARGETS,package,haserl))
+
+# haserl 0.8.0 installs unneeded examples to /usr/share/haserl - remove them
+$(HASERL_HOOK_POST_INSTALL): $(HASERL_TARGET_INSTALL_TARGET)
+	rm -rf $(TARGET_DIR)/usr/share/haserl
+	touch $@
