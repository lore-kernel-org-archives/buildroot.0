From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 23:48:42 +0200
Subject: [Buildroot] [git commit] package/cryptsetup: fix tmpfiles.d setup
Message-ID: <20210720211443.B861B87316@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=a2e93a802cbdbcd42b504c26596a076fbc4c86d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script uses pkg-config to detect the location of
tmpfiles.d but imposes an unspecified ordering dependency with systemd.
Instead of relying on systemd being built before cryptsetup, set the
directory path explcitly, and ensure it is not set when systemd-tmpfiles
is disabled.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cryptsetup/cryptsetup.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index cd5883d0b4..b816dc2f22 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -33,6 +33,12 @@ else
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_TMPFILES),y)
+CRYPTSETUP_CONF_OPTS += --with-tmpfilesdir=/usr/lib/tmpfiles.d
+else
+CRYPTSETUP_CONF_OPTS += --without-tmpfilesdir
+endif
+
 HOST_CRYPTSETUP_DEPENDENCIES = \
 	host-pkgconf \
 	host-lvm2 \
