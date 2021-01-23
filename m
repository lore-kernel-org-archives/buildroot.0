From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2021 21:42:15 +0100
Subject: [Buildroot] [git commit] package/mrouted: ensure multicast routing
 is enabled in kernel
Message-ID: <20210123202257.609627FAFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5583a23f157997be294e540f115c19f6478181c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

IP_MULTICAST depends on CONFIG_NET and CONFIG_INET, but those are really
depp-core symbols, and anyone enabling mrouted will be expected to
already have networking and TCP/IP supports enabled already in their
kernel configuraiton.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[yann.morin.1998 at free.fr:
  - add comment about NET and INET,
  - update commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mrouted/mrouted.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 6005066577..2ee3c15aea 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -18,4 +18,11 @@ define MROUTED_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/mrouted.service
 endef
 
+# We will asume that CONFIG_NET and CONFIG_INET are already
+# set in the kernel configuration provided by the user.
+define MROUTED_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MULTICAST)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MROUTE)
+endef
+
 $(eval $(autotools-package))
