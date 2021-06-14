From: John Keeping <john@metanate.com>
Date: Mon, 14 Jun 2021 11:42:10 +0100
Subject: [Buildroot] [PATCH] package/cryptsetup: fix tmpfiles.d setup
Message-ID: <20210614104210.2100899-1-john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script uses pkg-config to detect the location of
tmpfiles.d but imposes an unspecified ordering dependency with systemd.
Instead of relying on systemd being built before cryptsetup, set the
directory path explcitly, and ensure it is not set when systemd-tmpfiles
is disabled.

Signed-off-by: John Keeping <john@metanate.com>
---
 package/cryptsetup/cryptsetup.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index cd5883d0b4..eee84a7958 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -33,6 +33,12 @@ else
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_TMPFILES),y)
+CRYPTSETUP_CONF_OPTS += --with-tmpfilesdir=/usr/lib/tmpfiles.d
+else
+CRYPTSETUP_CONF_OPTS += --with-tmpfilesdir=no
+endif
+
 HOST_CRYPTSETUP_DEPENDENCIES = \
 	host-pkgconf \
 	host-lvm2 \
-- 
2.32.0
