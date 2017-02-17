From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Feb 2017 16:32:01 +0100
Subject: [Buildroot] [git commit] ebtables: enable for musl
Message-ID: <20170301170421.F103D82288@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30c4b5843f1e15f4103e60c994cdc2328b8fa2d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add two patches that fix build with musl. The first patch is upstream. The
second patch uses the Buildroot workaround to suppress conflicting struct
ethhdr definitions.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...h-Remove-C-specific-compiler-hint-macro-_.patch | 50 ++++++++++++++++++++++
 package/ebtables/0002-Fix-musl-compatibility.patch | 30 +++++++++++++
 package/ebtables/Config.in                         |  2 -
 3 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/package/ebtables/0001-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch b/package/ebtables/0001-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch
new file mode 100644
index 0000000..bd7bead
--- /dev/null
+++ b/package/ebtables/0001-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch
@@ -0,0 +1,50 @@
+From f8079671326e9fd079391d24911a9a8a77f1d6fd Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sat, 16 May 2015 12:31:58 +0200
+Subject: [PATCH] ethernetdb.h: Remove C++ specific compiler hint macro _THROW
+
+Fixes compilation with musl libc
+
+Signed-off-by: Felix Janda <felix.janda@posteo.de>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit f8079671326e9fd0
+
+ include/ethernetdb.h | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/include/ethernetdb.h b/include/ethernetdb.h
+index 46d8bfd1b7e5..1683abe01987 100644
+--- a/include/ethernetdb.h
++++ b/include/ethernetdb.h
+@@ -38,21 +38,20 @@ struct ethertypeent {
+ 
+ /* Open ethertype data base files and mark them as staying open even
+    after a later search if STAY_OPEN is non-zero.  */
+-extern void setethertypeent(int __stay_open) __THROW;
++extern void setethertypeent(int __stay_open);
+ 
+ /* Close ethertype data base files and clear `stay open' flag.  */
+-extern void endethertypeent(void) __THROW;
++extern void endethertypeent(void);
+ 
+ /* Get next entry from ethertype data base file.  Open data base if
+    necessary.  */
+-extern struct ethertypeent *getethertypeent(void) __THROW;
++extern struct ethertypeent *getethertypeent(void);
+ 
+ /* Return entry from ethertype data base for network with NAME.  */
+-extern struct ethertypeent *getethertypebyname(__const char *__name)
+-    __THROW;
++extern struct ethertypeent *getethertypebyname(__const char *__name);
+ 
+ /* Return entry from ethertype data base which number is PROTO.  */
+-extern struct ethertypeent *getethertypebynumber(int __ethertype) __THROW;
++extern struct ethertypeent *getethertypebynumber(int __ethertype);
+ 
+ 
+ #endif				/* ethernetdb.h */
+-- 
+2.11.0
+
diff --git a/package/ebtables/0002-Fix-musl-compatibility.patch b/package/ebtables/0002-Fix-musl-compatibility.patch
new file mode 100644
index 0000000..5e9f534
--- /dev/null
+++ b/package/ebtables/0002-Fix-musl-compatibility.patch
@@ -0,0 +1,30 @@
+From 138e7efdc8cad6453620c6366e6fa5e786593f7f Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 16 Feb 2017 14:41:48 +0200
+Subject: [PATCH] Fix musl compatibility
+
+Include netinet/ether.h before kernel headers to suppress the conflicting
+definition of struct ethhdr.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: not upstreamable; depends on Buildroot local musl patch
+---
+ include/ebtables_u.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/ebtables_u.h b/include/ebtables_u.h
+index 35a5bcc54c86..268b1fd599d2 100644
+--- a/include/ebtables_u.h
++++ b/include/ebtables_u.h
+@@ -24,6 +24,7 @@
+ #ifndef EBTABLES_U_H
+ #define EBTABLES_U_H
+ #include <netinet/in.h>
++#include <netinet/ether.h>
+ #include <linux/netfilter_bridge/ebtables.h>
+ #include <linux/netfilter/x_tables.h>
+ 
+-- 
+2.11.0
+
diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
index fa123b1..2fdac06 100644
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_EBTABLES
 	bool "ebtables"
-	depends on !BR2_TOOLCHAIN_USES_MUSL # mixes userspace and kernel headers
 	depends on BR2_USE_MMU # fork()
 	help
 	  Ethernet bridge frame table administration
@@ -8,5 +7,4 @@ config BR2_PACKAGE_EBTABLES
 	  http://ebtables.netfilter.org/
 
 comment "ebtables needs a glibc or uClibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU
