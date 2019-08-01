From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu,  1 Aug 2019 17:15:58 +0200
Subject: [Buildroot] [RFC PATCH v6 1/1] iputils: Add capability for
 clockdiff, ping, traceroute6
Message-ID: <20190801151558.12221-1-petr.vorel@gmail.com>
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
Hi,

hope this is the final version :).

Kind regards,
Petr

* devices_table.txt for xattrs enabled:
 	/usr/sbin/arping      f 4755 0 0 - - - - -
	/usr/bin/clockdiff    f 0755 0 0 - - - - -
	|xattr cap_net_raw+p
	/bin/ping             f 0755 0 0 - - - - -
	|xattr cap_net_raw+p
	/usr/bin/traceroute6  f 0755 0 0 - - - - -
	|xattr cap_net_raw+p

* devices_table.txt for setuid:
...
 	/usr/sbin/arping      f 4755 0 0 - - - - -
	/usr/bin/clockdiff    f 4755 0 0 - - - - -
	
	/bin/ping             f 4755 0 0 - - - - -
	
	/usr/bin/traceroute6  f 4755 0 0 - - - - -
	
...

 package/iputils/iputils.mk | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 8e6a3e2fc5..e353e821f9 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -73,11 +73,20 @@ IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_CREATE_PING6_SYMLINK
 
 # handle permissions ourselves
 IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
+ifeq ($(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),y)
+IPUTILS_CAPABILITY = |xattr cap_net_raw+p
+MAYBE_SUID = 0
+else
+MAYBE_SUID = 4
+endif
 define IPUTILS_PERMISSIONS
 	/usr/sbin/arping      f 4755 0 0 - - - - -
-	/usr/bin/clockdiff    f 4755 0 0 - - - - -
-	/bin/ping             f 4755 0 0 - - - - -
-	/usr/bin/traceroute6  f 4755 0 0 - - - - -
+	/usr/bin/clockdiff    f $(MAYBE_SUID)755 0 0 - - - - -
+	$(IPUTILS_CAPABILITY)
+	/bin/ping             f $(MAYBE_SUID)755 0 0 - - - - -
+	$(IPUTILS_CAPABILITY)
+	/usr/bin/traceroute6  f $(MAYBE_SUID)755 0 0 - - - - -
+	$(IPUTILS_CAPABILITY)
 endef
 
 $(eval $(meson-package))
-- 
2.22.0
