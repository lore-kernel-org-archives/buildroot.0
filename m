From: Anssi Hannula <anssi.hannula@bitwise.fi>
Date: Thu,  8 Mar 2018 16:25:09 +0200
Subject: [Buildroot] [PATCH] systemd: do not use host system-uid/gid ranges
Message-ID: <20180308142509.26795-1-anssi.hannula@bitwise.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd meson.build uses values from host /etc/login.defs if
system-uid-max and system-gid-max build options are not explicitly
specified.

Avoid that by setting system-uid-max and system-gid-max to 999 which is
the systemd default if SYSTEM_UID_MAX and SYSTEM_GID_MAX are not set in
/etc/login.defs.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
---
 package/systemd/systemd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8c22c08..3bc322c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -40,6 +40,8 @@ SYSTEMD_CONF_OPTS += \
 	-Dldconfig=false \
 	-Ddefault-dnssec=no \
 	-Dtests=false \
+	-Dsystem-uid-max=999 \
+	-Dsystem-gid-max=999 \
 	-Dtelinit-path=$(TARGET_DIR)/sbin/telinit \
 	-Dkill-path=/usr/bin/kill \
 	-Dkmod-path=/usr/bin/kmod \
-- 
2.8.3
