From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  1 Aug 2019 18:22:33 +0200
Subject: [Buildroot] [PATCH 2/2 v7] package/iputils: use capabilities if
 possible
In-Reply-To: <cover.1564676540.git.yann.morin.1998@free.fr>
References: <cover.1564676540.git.yann.morin.1998@free.fr>
Message-ID: <7357ef816dae35990f461175f35135fb4996eb54.1564676540.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Petr Vorel <petr.vorel@gmail.com>

If support for extended attributes is enabled, then we can use them to
store capabilities. If not, we keep using the setuid bit.

arping does not get a capability, as it can be used for arp poisoning.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[yann.morin.1998 at free.fr:
  - resort to using q full-fledged conditional block
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v6 -> v7:
  - use a full if-block
---
 package/iputils/iputils.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 7482bbdca1..cbcce89684 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -79,11 +79,23 @@ IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_CREATE_PING6_SYMLINK
 
 # handle permissions ourselves
 IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
+ifeq ($(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),y)
+define IPUTILS_PERMISSIONS
+	/usr/sbin/arping      f 755 0 0 - - - - -
+	/usr/bin/clockdiff    f 755 0 0 - - - - -
+	|xattr cap_net_raw+p
+	/bin/ping             f 755 0 0 - - - - -
+	|xattr cap_net_raw+p
+	/usr/bin/traceroute6  f 755 0 0 - - - - -
+	|xattr cap_net_raw+p
+endef
+else
 define IPUTILS_PERMISSIONS
 	/usr/sbin/arping      f  755 0 0 - - - - -
 	/usr/bin/clockdiff    f 4755 0 0 - - - - -
 	/bin/ping             f 4755 0 0 - - - - -
 	/usr/bin/traceroute6  f 4755 0 0 - - - - -
 endef
+endif
 
 $(eval $(meson-package))
-- 
2.20.1
