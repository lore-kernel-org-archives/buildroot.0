From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 31 Jul 2019 22:09:33 +0200
Subject: [Buildroot] [RFC PATCH v5 2/2] iputils: add capability for
 clockdiff, ping, traceroute6
In-Reply-To: <20190731200933.3487-1-petr.vorel@gmail.com>
References: <20190731200933.3487-1-petr.vorel@gmail.com>
Message-ID: <20190731200933.3487-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

and fallback to setuid if xattr not enabled.

Not setting xattr on arping as it can be used for ARP Poisoning.

Use cap_net_raw+p (drop +e) as upstream sets that via
cap_set_flag(), see https://github.com/iputils/iputils/issues/194

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v4->v5:
* fallback to setuid if xattr (suggested by Yann by Yann)
BTW I wasn't able to use ifeq.. ,y.

Kind regards,
Petr

 package/iputils/iputils.mk | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 8e6a3e2fc5..e5a2690aac 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -73,11 +73,16 @@ IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_CREATE_PING6_SYMLINK
 
 # handle permissions ourselves
 IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
+MAYBE_SUID = $(if $(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),0,4)
+
 define IPUTILS_PERMISSIONS
-	/usr/sbin/arping      f 4755 0 0 - - - - -
-	/usr/bin/clockdiff    f 4755 0 0 - - - - -
-	/bin/ping             f 4755 0 0 - - - - -
-	/usr/bin/traceroute6  f 4755 0 0 - - - - -
+	/usr/sbin/arping      f $(MAYBE_SUID)755 0 0 - - - - -
+	/usr/bin/clockdiff    f $(MAYBE_SUID)755 0 0 - - - - -
+	|xattr cap_net_raw+p
+	/bin/ping             f $(MAYBE_SUID)755 0 0 - - - - -
+	|xattr cap_net_raw+p
+	/usr/bin/traceroute6  f $(MAYBE_SUID)755 0 0 - - - - -
+	|xattr cap_net_raw+p
 endef
 
 $(eval $(meson-package))
-- 
2.22.0
