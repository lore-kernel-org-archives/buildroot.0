From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue,  8 Mar 2016 22:40:54 +0100
Subject: [Buildroot] [PATCH] hostapd: fix musl issues
Message-ID: <1457473254-30014-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add two patches to fix build issues with the musl libc.

The first patch "0003-vlan-fix-musl-build-error" fixes the undefined __caddr_t
build error. __caddr_t is a legacy BSD type and should be avoided in modern
implementations.

The second patch "0004-vlan-fix-musl-libc-conflict-with-Linux-kernel-header"
fixes a typical musl libc header conflict with the Linux kernel header. We avoid
including the conflicting Linux header file by defining the needed macros
directly in the needing hostapd source file.

Fixes:
http://autobuild.buildroot.net/results/c26/c265cfada20621a631e9d118b9633df80b0e4864/
http://autobuild.buildroot.net/results/658/658c5e2fe6e3a4ad74ca47c926426e95eac0b9ec/
http://autobuild.buildroot.net/results/578/5787805b3e1487c4f85c3a367ed88e8730078b8e/
http://autobuild.buildroot.net/results/42d/42d8be008dcb07e9ec26ce10c797deb43ed86568/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../hostapd/0003-vlan-fix-musl-build-error.patch   | 60 ++++++++++++++++++++++
 ...sl-libc-conflict-with-Linux-kernel-header.patch | 60 ++++++++++++++++++++++
 2 files changed, 120 insertions(+)
 create mode 100644 package/hostapd/0003-vlan-fix-musl-build-error.patch
 create mode 100644 package/hostapd/0004-vlan-fix-musl-libc-conflict-with-Linux-kernel-header.patch

diff --git a/package/hostapd/0003-vlan-fix-musl-build-error.patch b/package/hostapd/0003-vlan-fix-musl-build-error.patch
new file mode 100644
index 0000000..da1ffcb
--- /dev/null
+++ b/package/hostapd/0003-vlan-fix-musl-build-error.patch
@@ -0,0 +1,60 @@
+From 67ba6ed9871b2cab16eeee93818f05d9c49ccbab Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 8 Mar 2016 12:05:01 +0100
+Subject: [PATCH] vlan: fix musl build error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+caddr_t is legacy BSD and should be avoided [1].
+
+This fixes compile errors with the musl libc:
+
+../src/ap/vlan_init.c: In function 'br_delif':
+../src/ap/vlan_init.c:218:18: error: '__caddr_t' undeclared (first use in this function)
+  ifr.ifr_data = (__caddr_t) args;
+
+Upstream status: Pending [2]
+
+[1] http://stackoverflow.com/questions/6381526/what-is-the-significance-of-caddr-t-and-when-is-it-used
+[2] http://lists.infradead.org/pipermail/hostap/2016-March/035350.html
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ src/ap/vlan_init.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/ap/vlan_init.c b/src/ap/vlan_init.c
+index fd1c8dd..1670c0d 100644
+--- a/src/ap/vlan_init.c
++++ b/src/ap/vlan_init.c
+@@ -215,7 +215,7 @@ static int br_delif(const char *br_name, const char *if_name)
+ 	args[1] = if_index;
+ 
+ 	os_strlcpy(ifr.ifr_name, br_name, sizeof(ifr.ifr_name));
+-	ifr.ifr_data = (__caddr_t) args;
++	ifr.ifr_data = (void *) args;
+ 
+ 	if (ioctl(fd, SIOCDEVPRIVATE, &ifr) < 0 && errno != EINVAL) {
+ 		/* No error if interface already removed. */
+@@ -266,7 +266,7 @@ static int br_addif(const char *br_name, const char *if_name)
+ 	args[1] = if_index;
+ 
+ 	os_strlcpy(ifr.ifr_name, br_name, sizeof(ifr.ifr_name));
+-	ifr.ifr_data = (__caddr_t) args;
++	ifr.ifr_data = (void *) args;
+ 
+ 	if (ioctl(fd, SIOCDEVPRIVATE, &ifr) < 0) {
+ 		if (errno == EBUSY) {
+@@ -394,7 +394,7 @@ static int br_getnumports(const char *br_name)
+ 
+ 	os_memset(ifindices, 0, sizeof(ifindices));
+ 	os_strlcpy(ifr.ifr_name, br_name, sizeof(ifr.ifr_name));
+-	ifr.ifr_data = (__caddr_t) arg;
++	ifr.ifr_data = (void *) arg;
+ 
+ 	if (ioctl(fd, SIOCDEVPRIVATE, &ifr) < 0) {
+ 		wpa_printf(MSG_ERROR, "VLAN: %s: BRCTL_GET_PORT_LIST "
+-- 
+2.7.2
+
diff --git a/package/hostapd/0004-vlan-fix-musl-libc-conflict-with-Linux-kernel-header.patch b/package/hostapd/0004-vlan-fix-musl-libc-conflict-with-Linux-kernel-header.patch
new file mode 100644
index 0000000..3e753d6
--- /dev/null
+++ b/package/hostapd/0004-vlan-fix-musl-libc-conflict-with-Linux-kernel-header.patch
@@ -0,0 +1,60 @@
+From 71a517e922c91e2c6cad28d339a081b5f6de0932 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 8 Mar 2016 21:07:12 +0100
+Subject: [PATCH] vlan: fix musl libc conflict with Linux kernel headers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Due to both <netinet/in.h> (in "utils/includes.h") and <linux/in6.h> (in
+<linux/if_bridge.h>) being included, the in6_addr is being redefined: once from
+the C library headers and once from the Linux kernel headers. This causes some
+build failures with for example the musl C library:
+
+In file included from /usr/include/linux/if_bridge.h:18,
+                 from ../src/ap/vlan_init.c:17:
+/usr/include/linux/in6.h:32: error: redefinition of 'struct in6_addr'
+/usr/include/linux/in6.h:49: error: redefinition of 'struct sockaddr_in6'
+/usr/include/linux/in6.h:59: error: redefinition of 'struct ipv6_mreq'
+
+Mixing C library and Linux kernel headers is a bit problematic [1] and should be
+avoided if possible [2]. In order to fix this, define just the macros needed
+from <linux/if_bridge.h> as done in Busybox for the brctl applet [3].
+
+Upstream status: Pending [4]
+
+[1] https://sourceware.org/bugzilla/show_bug.cgi?id=15850
+[2] http://www.openwall.com/lists/musl/2015/10/06/1
+[3] https://git.busybox.net/busybox/commit/?id=5fa6d1a632505789409a2ba6cf8e112529f9db18
+[4] http://lists.infradead.org/pipermail/hostap/2016-March/035357.html
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ src/ap/vlan_init.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/ap/vlan_init.c b/src/ap/vlan_init.c
+index 1670c0d..f2e3da0 100644
+--- a/src/ap/vlan_init.c
++++ b/src/ap/vlan_init.c
+@@ -14,7 +14,16 @@
+ #include <sys/ioctl.h>
+ #include <linux/sockios.h>
+ #include <linux/if_vlan.h>
+-#include <linux/if_bridge.h>
++/* From <linux/if_bridge.h> */
++#define BRCTL_GET_VERSION 0
++#define BRCTL_GET_BRIDGES 1
++#define BRCTL_ADD_BRIDGE 2
++#define BRCTL_DEL_BRIDGE 3
++#define BRCTL_ADD_IF 4
++#define BRCTL_DEL_IF 5
++#define BRCTL_GET_BRIDGE_INFO 6
++#define BRCTL_GET_PORT_LIST 7
++#define BRCTL_SET_BRIDGE_FORWARD_DELAY 8
+ #endif /* CONFIG_FULL_DYNAMIC_VLAN */
+ 
+ #include "utils/common.h"
+-- 
+2.7.2
+
-- 
2.7.2
