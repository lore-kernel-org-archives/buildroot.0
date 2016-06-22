From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jun 2016 21:07:41 +0200
Subject: [Buildroot] [PATCH 19/24 v2] system: split skeleton
In-Reply-To: <cover.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <9e2788b68e636c59be89be5cf056b92f70f67427.1466622379.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the sysv-related parts to separate skeletons.

The network-related parts of the skeleton will also be useable by the
systemd skeleton (but only when systemd-networkd is not enabled), so we
also split that out into its own skeleton.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/skeleton-sysv/skeleton-sysv.mk                             | 7 +++++++
 .../network/if-up.d => skeleton-net/etc/network/if-down.d}/.empty  | 0
 .../{skeleton => skeleton-net}/etc/network/if-post-down.d/.empty   | 0
 .../{skeleton => skeleton-net}/etc/network/if-pre-up.d/wait_iface  | 0
 .../network/if-down.d => skeleton-net/etc/network/if-up.d}/.empty  | 0
 system/{skeleton => skeleton-sysv}/dev/log                         | 0
 system/{skeleton/dev/shm => skeleton-sysv/dev/pts}/.empty          | 0
 system/{skeleton/dev/pts => skeleton-sysv/dev/shm}/.empty          | 0
 system/{skeleton => skeleton-sysv}/etc/fstab                       | 0
 system/{skeleton => skeleton-sysv}/etc/resolv.conf                 | 0
 system/{skeleton => skeleton-sysv}/var/cache                       | 0
 system/{skeleton => skeleton-sysv}/var/lib/misc                    | 0
 system/{skeleton => skeleton-sysv}/var/lock                        | 0
 system/{skeleton => skeleton-sysv}/var/log                         | 0
 system/{skeleton => skeleton-sysv}/var/run                         | 0
 system/{skeleton => skeleton-sysv}/var/spool                       | 0
 system/{skeleton => skeleton-sysv}/var/tmp                         | 0
 system/skeleton/dev/.empty                                         | 0
 18 files changed, 7 insertions(+)
 rename system/{skeleton/etc/network/if-up.d => skeleton-net/etc/network/if-down.d}/.empty (100%)
 rename system/{skeleton => skeleton-net}/etc/network/if-post-down.d/.empty (100%)
 rename system/{skeleton => skeleton-net}/etc/network/if-pre-up.d/wait_iface (100%)
 rename system/{skeleton/etc/network/if-down.d => skeleton-net/etc/network/if-up.d}/.empty (100%)
 rename system/{skeleton => skeleton-sysv}/dev/log (100%)
 rename system/{skeleton/dev/shm => skeleton-sysv/dev/pts}/.empty (100%)
 rename system/{skeleton/dev/pts => skeleton-sysv/dev/shm}/.empty (100%)
 rename system/{skeleton => skeleton-sysv}/etc/fstab (100%)
 rename system/{skeleton => skeleton-sysv}/etc/resolv.conf (100%)
 rename system/{skeleton => skeleton-sysv}/var/cache (100%)
 rename system/{skeleton => skeleton-sysv}/var/lib/misc (100%)
 rename system/{skeleton => skeleton-sysv}/var/lock (100%)
 rename system/{skeleton => skeleton-sysv}/var/log (100%)
 rename system/{skeleton => skeleton-sysv}/var/run (100%)
 rename system/{skeleton => skeleton-sysv}/var/spool (100%)
 rename system/{skeleton => skeleton-sysv}/var/tmp (100%)
 create mode 100644 system/skeleton/dev/.empty

diff --git a/package/skeleton-sysv/skeleton-sysv.mk b/package/skeleton-sysv/skeleton-sysv.mk
index 6e15b15..ee9e670 100644
--- a/package/skeleton-sysv/skeleton-sysv.mk
+++ b/package/skeleton-sysv/skeleton-sysv.mk
@@ -29,6 +29,13 @@ SKELETON_SYSV_INSTALL_STAGING = YES
 # - SKELETON_SET_NETWORK_IFUPDOWN_LOOPBACK
 # - SKELETON_SET_NETWORK_IFUPDOWN_DHCP
 
+# Even without a configured DHCP interface, we still need the network part
+# of the skeleton, because it is used to configure the loopback interface.
+define SKELETON_SYSV_INSTALL_TARGET_CMDS
+	$(call SKELETON_RSYNC,system/skeleton-sysv,$(TARGET_DIR))
+	$(call SKELETON_RSYNC,system/skeleton-net,$(TARGET_DIR))
+endef
+
 define SKELETON_SYSV_SET_NETWORK
 	mkdir -p $(TARGET_DIR)/etc/network/
 	$(SKELETON_SET_NETWORK_IFUPDOWN_LOOPBACK)
diff --git a/system/skeleton/etc/network/if-up.d/.empty b/system/skeleton-net/etc/network/if-down.d/.empty
similarity index 100%
rename from system/skeleton/etc/network/if-up.d/.empty
rename to system/skeleton-net/etc/network/if-down.d/.empty
diff --git a/system/skeleton/etc/network/if-post-down.d/.empty b/system/skeleton-net/etc/network/if-post-down.d/.empty
similarity index 100%
rename from system/skeleton/etc/network/if-post-down.d/.empty
rename to system/skeleton-net/etc/network/if-post-down.d/.empty
diff --git a/system/skeleton/etc/network/if-pre-up.d/wait_iface b/system/skeleton-net/etc/network/if-pre-up.d/wait_iface
similarity index 100%
rename from system/skeleton/etc/network/if-pre-up.d/wait_iface
rename to system/skeleton-net/etc/network/if-pre-up.d/wait_iface
diff --git a/system/skeleton/etc/network/if-down.d/.empty b/system/skeleton-net/etc/network/if-up.d/.empty
similarity index 100%
rename from system/skeleton/etc/network/if-down.d/.empty
rename to system/skeleton-net/etc/network/if-up.d/.empty
diff --git a/system/skeleton/dev/log b/system/skeleton-sysv/dev/log
similarity index 100%
rename from system/skeleton/dev/log
rename to system/skeleton-sysv/dev/log
diff --git a/system/skeleton/dev/shm/.empty b/system/skeleton-sysv/dev/pts/.empty
similarity index 100%
rename from system/skeleton/dev/shm/.empty
rename to system/skeleton-sysv/dev/pts/.empty
diff --git a/system/skeleton/dev/pts/.empty b/system/skeleton-sysv/dev/shm/.empty
similarity index 100%
rename from system/skeleton/dev/pts/.empty
rename to system/skeleton-sysv/dev/shm/.empty
diff --git a/system/skeleton/etc/fstab b/system/skeleton-sysv/etc/fstab
similarity index 100%
rename from system/skeleton/etc/fstab
rename to system/skeleton-sysv/etc/fstab
diff --git a/system/skeleton/etc/resolv.conf b/system/skeleton-sysv/etc/resolv.conf
similarity index 100%
rename from system/skeleton/etc/resolv.conf
rename to system/skeleton-sysv/etc/resolv.conf
diff --git a/system/skeleton/var/cache b/system/skeleton-sysv/var/cache
similarity index 100%
rename from system/skeleton/var/cache
rename to system/skeleton-sysv/var/cache
diff --git a/system/skeleton/var/lib/misc b/system/skeleton-sysv/var/lib/misc
similarity index 100%
rename from system/skeleton/var/lib/misc
rename to system/skeleton-sysv/var/lib/misc
diff --git a/system/skeleton/var/lock b/system/skeleton-sysv/var/lock
similarity index 100%
rename from system/skeleton/var/lock
rename to system/skeleton-sysv/var/lock
diff --git a/system/skeleton/var/log b/system/skeleton-sysv/var/log
similarity index 100%
rename from system/skeleton/var/log
rename to system/skeleton-sysv/var/log
diff --git a/system/skeleton/var/run b/system/skeleton-sysv/var/run
similarity index 100%
rename from system/skeleton/var/run
rename to system/skeleton-sysv/var/run
diff --git a/system/skeleton/var/spool b/system/skeleton-sysv/var/spool
similarity index 100%
rename from system/skeleton/var/spool
rename to system/skeleton-sysv/var/spool
diff --git a/system/skeleton/var/tmp b/system/skeleton-sysv/var/tmp
similarity index 100%
rename from system/skeleton/var/tmp
rename to system/skeleton-sysv/var/tmp
diff --git a/system/skeleton/dev/.empty b/system/skeleton/dev/.empty
new file mode 100644
index 0000000..e69de29
-- 
2.7.4
