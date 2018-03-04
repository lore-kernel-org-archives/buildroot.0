From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Mar 2018 11:42:12 +0100
Subject: [Buildroot] [git commit] package/systemd: create groups required
 for udevd
Message-ID: <20180304104629.390BE811B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f208cf296c2c7c049d11d15b6d0546214c4d0357
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

udevd needs extra groups for its bundled rules:

    Mar 03 12:21:30 buildroot systemd-udevd[732]: Specified group 'render' unknown
    Mar 03 12:21:30 buildroot systemd-udevd[732]: Specified group 'kvm' unknown

Add those missing groups.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Julius Kriukas <julius@kriukas.lt>
Cc: Trent Piepho <tpiepho@impinj.com>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
