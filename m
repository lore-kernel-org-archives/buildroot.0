From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 20:22:03 +0200
Subject: [Buildroot] [git commit] package/iputils: use capabilities if
 possible
Message-ID: <20190801181958.131FE8B4EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9440f3554b6d986dee45fa6af0b0634553200447
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If support for extended attributes is enabled, then we can use them to
store capabilities. If not, we keep using the setuid bit.

arping does not get a capability, as it can be used for arp poisoning.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[yann.morin.1998 at free.fr:
  - resort to using q full-fledged conditional block
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
