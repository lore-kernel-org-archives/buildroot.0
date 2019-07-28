From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 28 Jul 2019 21:53:46 +0200
Subject: [Buildroot] [PATCH 1/1] iputils: Add capability for clockdiff, ping,
 traceroute6
Message-ID: <20190728195346.31201-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NOTE: not setting for arping as it can be used for ARP Poisoning

NOTE: use cap_net_raw+p (drop +e) as upstream sets that via
cap_set_flag(), see https://github.com/iputils/iputils/issues/194

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/iputils/iputils.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 8e6a3e2fc5..2ffa8da554 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -73,11 +73,17 @@ IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_CREATE_PING6_SYMLINK
 
 # handle permissions ourselves
 IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
+ifeq ($(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),y)
+IPUTILS_CAPABILITY = |xattr cap_net_raw+p
+endif
 define IPUTILS_PERMISSIONS
 	/usr/sbin/arping      f 4755 0 0 - - - - -
 	/usr/bin/clockdiff    f 4755 0 0 - - - - -
+	$(IPUTILS_CAPABILITY)
 	/bin/ping             f 4755 0 0 - - - - -
+	$(IPUTILS_CAPABILITY)
 	/usr/bin/traceroute6  f 4755 0 0 - - - - -
+	$(IPUTILS_CAPABILITY)
 endef
 
 $(eval $(meson-package))
-- 
2.22.0
