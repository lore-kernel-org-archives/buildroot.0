From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  3 Mar 2018 17:55:56 +0100
Subject: [Buildroot] [PATCH] package/systemd: create groups required for
 udevd
Message-ID: <20180303165556.25630-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

udevd needs extra groups for its bundled rules:

    Mar 03 12:21:30 buildroot systemd-udevd[732]: Specified group 'render' unknown
    Mar 03 12:21:30 buildroot systemd-udevd[732]: Specified group 'kvm' unknown

Add those missing groups.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Julius Kriukas <julius@kriukas.lt>
Cc: Trent Piepho <tpiepho@impinj.com>
Cc: Adam Duskett <aduskett@gmail.com>
---
 package/systemd/systemd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 793b966ff5..22384c648b 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -343,6 +343,8 @@ SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 define SYSTEMD_USERS
 	- - input -1 * - - - Input device group
 	- - systemd-journal -1 * - - - Journal
+	- - render -1 * - - - DRI rendering nodes
+	- - kvm -1 * - - - kvm nodes
 	systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus messages to/from a bus
 	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
 	systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
-- 
2.14.1
