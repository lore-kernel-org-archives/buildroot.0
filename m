From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 10 Jan 2011 09:28:40 -0500
Subject: [Buildroot] [PATCH 2/7] busybox: let buildroot handle stripping
In-Reply-To: <1294669725-5379-1-git-send-email-vapier@gentoo.org>
References: <1294669718-5339-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-1-git-send-email-vapier@gentoo.org>
Message-ID: <1294669725-5379-2-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some ABI's (like FLAT), we cannot strip busybox as the file format
does not support it and strip will abort with errors like 'File format
not recognized'.  Since the toplevel already takes care of stripping
things, simply disable the busybox step.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/busybox/busybox.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 342819a..38897f7 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -21,7 +21,8 @@ BUSYBOX_MAKE_OPTS = \
 	PREFIX="$(TARGET_DIR)" \
 	EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	CONFIG_PREFIX="$(TARGET_DIR)"
+	CONFIG_PREFIX="$(TARGET_DIR)" \
+	SKIP_STRIP=y
 
 ifndef BUSYBOX_CONFIG_FILE
 	BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
-- 
1.7.4.rc1
