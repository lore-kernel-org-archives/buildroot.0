From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Nov 2016 11:00:34 +0100
Subject: [Buildroot] [git commit] package/udisks: fix daemon path in systemd
	service file
Message-ID: <20161119100132.573AB80301@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=320d73ab1bb56aa7505dfe800770f15ca3aa5fc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/udisks/0002-Fix-systemd-service-file.patch | 33 ++++++++++++++++++++++
 package/udisks/udisks.mk                           |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/package/udisks/0002-Fix-systemd-service-file.patch b/package/udisks/0002-Fix-systemd-service-file.patch
new file mode 100644
index 0000000..ea347ae
--- /dev/null
+++ b/package/udisks/0002-Fix-systemd-service-file.patch
@@ -0,0 +1,33 @@
+From bf8b4362cef24a6f747e4329305a4939c8f585d1 Mon Sep 17 00:00:00 2001
+From: David King <amigadave@amigadave.com>
+Date: Thu, 2 Jul 2015 13:49:22 +0100
+Subject: [PATCH] Fix systemd service file
+
+udisks-daemon is installed to $(libexecdir), not $(prefix)/lib/udisks.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1238664
+https://bugs.freedesktop.org/show_bug.cgi?id=91191
+
+[This patch has been backported from upstream:
+https://cgit.freedesktop.org/udisks/commit/?h=udisks1&id=bf8b4362cef24a6f747e4329305a4939c8f585d1]
+Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
+---
+ data/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/data/Makefile.am b/data/Makefile.am
+index 411ea0f..08af5f4 100644
+--- a/data/Makefile.am
++++ b/data/Makefile.am
+@@ -31,7 +31,7 @@ systemdservicedir       = $(systemdsystemunitdir)
+ systemdservice_DATA     = $(systemdservice_in_files:.service.in=.service)
+ 
+ $(systemdservice_DATA): $(systemdservice_in_files) Makefile
+-	@sed -e "s|\@libexecdir\@|$(prefix)/lib/udisks|" $< > $@
++	@sed -e "s|\@libexecdir\@|$(libexecdir)|" $< > $@
+ endif
+ 
+ udevrulesdir = $(slashlibdir)/udev/rules.d
+-- 
+2.7.4
+
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index eea79e5..4d3ede7 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -8,6 +8,8 @@ UDISKS_VERSION = 1.0.5
 UDISKS_SITE = http://hal.freedesktop.org/releases
 UDISKS_LICENSE = GPLv2+
 UDISKS_LICENSE_FILES = COPYING
+# For 0002-Fix-systemd-service-file.patch
+UDISKS_AUTORECONF = YES
 
 UDISKS_DEPENDENCIES = 	\
 	sg3_utils	\
