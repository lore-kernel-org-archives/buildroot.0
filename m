From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Dec 2020 09:37:11 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/netsnmp: fix
 memory leak in IP-MIB when running without IPv6
Message-ID: <20201224083318.46FCB888C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f457f8323dd71a6f8fcfb45d0b9ec16748a06e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

In a Linux system without IPv6 support (or booted with "ipv6.disable=1")
file /proc/net/snmp6 is not present. If such file is not present an allocated
memory is not freed. Memory leak occurs even without snmp queries.

Problem seen at least since netsnmp 5.7.3 (probably even v5.6.1).
Patch backported from netsnmp 5.9, where the problem does not appear any more.

Signed-off-by: Adam Wujek <dev_public@wujek.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5e6f6e074508ece2207b02545a8ede5a296978c9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Linux-Fix-a-memory-leak-in-an-error-path.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/netsnmp/0006-IP-MIB-Linux-Fix-a-memory-leak-in-an-error-path.patch b/package/netsnmp/0006-IP-MIB-Linux-Fix-a-memory-leak-in-an-error-path.patch
new file mode 100644
index 0000000000..fb68e175e5
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
