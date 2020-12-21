From: Adam Wujek <dev_public@wujek.eu>
Date: Mon, 21 Dec 2020 11:25:34 +0000
Subject: [Buildroot] [PATCH 1/1] package/netsnmp: fix memory leak in IP-MIB
 when running without IPv6
Message-ID: <1608549912-29585-1-git-send-email-dev_public@wujek.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In a Linux system without IPv6 support (or booted with "ipv6.disable=1")
file /proc/net/snmp6 is not present. If such file is not present an allocated
memory is not freed. Memory leak occurs even without snmp queries.

Problem seen at least since netsnmp 5.7.3 (probably even v5.6.1).
Patch backported from netsnmp 5.9, where the problem does not appear any more.

Signed-off-by: Adam Wujek <dev_public@wujek.eu>
---
 ...-Linux-Fix-a-memory-leak-in-an-error-path.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/netsnmp/0006-IP-MIB-Linux-Fix-a-memory-leak-in-an-error-path.patch

diff --git a/package/netsnmp/0006-IP-MIB-Linux-Fix-a-memory-leak-in-an-error-path.patch b/package/netsnmp/0006-IP-MIB-Linux-Fix-a-memory-leak-in-an-error-path.patch
new file mode 100644
index 0000000..fb68e17
--- /dev/null
+++ b/package/netsnmp/0006-IP-MIB-Linux-Fix-a-memory-leak-in-an-error-path.patch
@@ -0,0 +1,37 @@
+From 7c073e3a1b736689135fd2ed44ede5b83790bd37 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Mon, 26 Aug 2019 18:32:08 -0700
+Subject: IP-MIB, Linux: Fix a memory leak in an error path
+
+When a Linux system is booted with "ipv6.disable=1" in the kernel command
+line, the file "/proc/net/snmp6" is not created. Fix the memory leak in
+_systemstats_v6_load_systemstats() that is triggered with IPv6 disabled.
+
+See also https://sourceforge.net/p/net-snmp/bugs/2976/.
+
+Reported-by: Mark E Rusk <marker55@users.sourceforge.net>
+---
+ agent/mibgroup/ip-mib/data_access/systemstats_linux.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
+index e28ff93..f68d122 100644
+--- a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
++++ b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
+@@ -560,10 +560,12 @@ _systemstats_v6_load_systemstats(netsnmp_container* container, u_int load_flags)
+      * try to open file. If we can't, that's ok - maybe the module hasn't
+      * been loaded yet.
+      */
+-    if (!(devin = fopen(filename, "r"))) {
++    devin = fopen(filename, "r");
++    if (!devin) {
+         DEBUGMSGTL(("access:systemstats",
+                 "Failed to load Systemstats Table (linux1), cannot open %s\n",
+                 filename));
++        netsnmp_access_systemstats_entry_free(entry);
+         return 0;
+     }
+     
+-- 
+2.7.4
+
-- 
2.7.4
