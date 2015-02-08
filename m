From: Jens Zettelmeyer <zettelmeyerj@gmail.com>
Date: Sun, 8 Feb 2015 11:58:01 +0000
Subject: [Buildroot] Batctl Package try 2
Message-ID: <CAFNoKatfchjqJaQ11rgBWbh02jdiDnSUGU6=B-AMP6AaGbroww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

after a review from Yann E. MORIN i made some adjustments to the package. I
this version is ok i'll use git send mail to send in an propper patch.

Thank you
Jens

diff --git a/package/batctl/Config.in b/package/batctl/Config.in
new file mode 100644
index 0000000..56badd3
--- /dev/null
+++ b/package/batctl/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_BATCTL
+ bool "batctl"
+ depends on BR2_INET_IPV6
+ depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+ select BR2_PACKAGE_LIBNL
+ help
+  Batctl is the configuration and debugging tool for batman-adv.
+
+  http://www.open-mesh.org/projects/batman-adv/wiki/Using-batctl
diff --git a/package/batctl/batctl.hash b/package/batctl/batctl.hash
new file mode 100644
index 0000000..663e602
--- /dev/null
+++ b/package/batctl/batctl.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 77509ed70232ebc0b73e2fa9471ae13b12d6547d167dda0a82f7a7fad7252c36
 batctl-2014.4.0.tar.gz
diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
new file mode 100644
index 0000000..a65a5cd
--- /dev/null
+++ b/package/batctl/batctl.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# batman-adv control
+#
+################################################################################
+
+BATCTL_VERSION = 2014.4.0
+BATCTL_SOURCE = batctl-$(BATCTL_VERSION).tar.gz
+BATCTL_SITE =
http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
+BATCTL_LICENSE = GPLv2
+BATCTL_DEPENDENCIES += libnl
+
+define BATCTL_BUILD_CMDS
+ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
+ CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3" \
+ LDFLAGS="$(TARGET_LDFLAGS)"
+endef
+
+define BATCTL_INSTALL_TARGET_CMDS
+ $(INSTALL) -m 755 -D $(@D)/batctl $(TARGET_DIR)/usr/sbin/batctl
+endef
+
+$(eval $(generic-package))
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150208/00c797ff/attachment.html>
