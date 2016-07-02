From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 18:50:36 +0200
Subject: [Buildroot] [git commit] package/samba4: Change tmpfiles path
Message-ID: <20160702165040.DA18C81908@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3768a98f21d33d53f6358568388e6a3228bec291
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Per the documentation:
https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html

The order of path by priorites is:
/etc/tmpfiles.d/*.conf
/run/tmpfiles.d/*.conf
/usr/lib/tmpfiles.d/*.conf

For the user to be able to override our tmpfiles easily, it's better to
place our files in /usr/lib/tmpfiles.d/

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/samba4.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 9f2bb0d..9ac72f5 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -156,8 +156,8 @@ define SAMBA4_INSTALL_INIT_SYSTEMD
 	ln -sf ../../../../usr/lib/systemd/system/winbind.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/winbind.service
 	$(INSTALL) -D -m 644 $(@D)/packaging/systemd/samba.conf.tmp \
-		$(TARGET_DIR)/etc/tmpfiles.d/samba.conf
-	printf "d /var/log/samba  755 root root\n" >>$(TARGET_DIR)/etc/tmpfiles.d/samba.conf
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/samba.conf
+	printf "d /var/log/samba  755 root root\n" >>$(TARGET_DIR)/usr/lib/tmpfiles.d/samba.conf
 endef
 
 $(eval $(generic-package))
