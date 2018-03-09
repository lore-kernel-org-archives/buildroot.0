From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Mar 2018 22:35:21 +0100
Subject: [Buildroot] [git commit] systemd: do not use host system-uid/gid
 ranges
Message-ID: <20180309213813.9DBD182895@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=183d2097ffef5d8d7e1ac07d3b613ecacdd8c876
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd meson.build uses values from host /etc/login.defs if
system-uid-max and system-gid-max build options are not explicitly
specified.

Avoid that by setting system-uid-max and system-gid-max to 999 which is
the systemd default if SYSTEM_UID_MAX and SYSTEM_GID_MAX are not set in
/etc/login.defs.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 34b70c754a..76b7e8382f 100644
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
