From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Apr 2020 19:27:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/open-lldp: bump version to
 b71bfb87fefb31c4b1a6a7ae351791c90966c3a8
Message-ID: <20200411172706.861234-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch site to github
- Remove first patch (already in version)
- Update second patch
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ions-work-with-both-gnu11-and-gnu89.patch} | 27 +++----------------
 ...tool-fixed-compile-error-for-getline.patch | 27 -------------------
 ... => 0002-Makefile.am-disable-Werror.patch} |  0
 ...ch => 0003-fixed-unknown-type-pid_t.patch} |  1 +
 package/open-lldp/Config.in                   |  2 +-
 package/open-lldp/open-lldp.hash              |  4 +--
 package/open-lldp/open-lldp.mk                |  4 +--
 7 files changed, 9 insertions(+), 56 deletions(-)
 rename package/open-lldp/{0002-get-inline-functions-work-with-both-gnu11-and-gnu89.patch => 0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch} (64%)
 delete mode 100644 package/open-lldp/0001-vdptool-fixed-compile-error-for-getline.patch
 rename package/open-lldp/{0003-Makefile.am-disable-Werror.patch => 0002-Makefile.am-disable-Werror.patch} (100%)
 rename package/open-lldp/{0004-fixed-unknown-type-pid_t.patch => 0003-fixed-unknown-type-pid_t.patch} (94%)

diff --git a/package/open-lldp/0002-get-inline-functions-work-with-both-gnu11-and-gnu89.patch b/package/open-lldp/0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch
similarity index 64%
rename from package/open-lldp/0002-get-inline-functions-work-with-both-gnu11-and-gnu89.patch
rename to package/open-lldp/0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch
index 57a23b2a70..a0980e8e6f 100644
--- a/package/open-lldp/0002-get-inline-functions-work-with-both-gnu11-and-gnu89.patch
+++ b/package/open-lldp/0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch
@@ -17,35 +17,14 @@ After gcc upgraded to gcc5, and if the codes are compiled without optimization(-
 gcc5 defaults to -std=gnu11 instead of -std=gnu89, and it requires that exactly one C source file has the callable copy of the inline function.
 
 Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>
+[Fabrice: patch updated so it applies after
+https://github.com/intel/openlldp/commit/7ad7a2f2adc70d8e9213f8bf511bf3374d64b034]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  include/lldp_8021qaz.h | 6 ------
  lldp_8021qaz.c         | 4 ++--
  2 files changed, 2 insertions(+), 8 deletions(-)
 
-diff --git a/include/lldp_8021qaz.h b/include/lldp_8021qaz.h
-index 55353b8..09dee20 100644
---- a/include/lldp_8021qaz.h
-+++ b/include/lldp_8021qaz.h
-@@ -218,9 +218,6 @@ int ieee8021qaz_mod_app(struct app_tlv_head *head, int peer,
- 			u8 prio, u8 sel, u16 proto, u32 ops);
- int ieee8021qaz_app_sethw(char *ifname, struct app_tlv_head *head);
- 
--inline int get_prio_map(u32 prio_map, int tc);
--inline void set_prio_map(u32 *prio_map, u8 prio, int tc);
--
- struct ieee8021qaz_tlvs *ieee8021qaz_data(const char *);
- 
- int ieee8021qaz_tlvs_rxed(const char *ifname);
-@@ -234,9 +231,6 @@ int ieee8021qaz_rchange(struct port *port, struct lldp_agent *,
- void ieee8021qaz_ifup(char *ifname, struct lldp_agent *);
- void ieee8021qaz_ifdown(char *ifname, struct lldp_agent *);
- u8 ieee8021qaz_mibDeleteObject(struct port *port, struct lldp_agent *);
--inline int ieee8021qaz_clif_cmd(void *data, struct sockaddr_un *from,
--				socklen_t fromlen, char *ibuf, int ilen,
--				char *rbuf);
- int ieee8021qaz_check_operstate(void);
- int get_dcbx_hw(const char *ifname, __u8 *dcbx);
- 
 diff --git a/lldp_8021qaz.c b/lldp_8021qaz.c
 index 094676d..f154317 100644
 --- a/lldp_8021qaz.c
diff --git a/package/open-lldp/0001-vdptool-fixed-compile-error-for-getline.patch b/package/open-lldp/0001-vdptool-fixed-compile-error-for-getline.patch
deleted file mode 100644
index c20267786e..0000000000
--- a/package/open-lldp/0001-vdptool-fixed-compile-error-for-getline.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 3c7887bb8a61a3b49a2989329c756a038023c544 Mon Sep 17 00:00:00 2001
-From: Laurent Charpentier <laurent_pubs@yahoo.com>
-Date: Fri, 12 Jan 2018 12:25:41 +0100
-Subject: [PATCH] vdptool: fixed compile error for getline()
-
-vdptool.c was generating an error: implicit declaration for the getline() function.
-
-Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>
----
- vdptool.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/vdptool.c b/vdptool.c
-index b805372..4930f6a 100644
---- a/vdptool.c
-+++ b/vdptool.c
-@@ -36,6 +36,7 @@
-  * set and query VSI profile settings.
-  */
- 
-+#define _GNU_SOURCE
- #include <stdlib.h>
- #include <stdio.h>
- #include <unistd.h>
--- 
-2.14.3
-
diff --git a/package/open-lldp/0003-Makefile.am-disable-Werror.patch b/package/open-lldp/0002-Makefile.am-disable-Werror.patch
similarity index 100%
rename from package/open-lldp/0003-Makefile.am-disable-Werror.patch
rename to package/open-lldp/0002-Makefile.am-disable-Werror.patch
diff --git a/package/open-lldp/0004-fixed-unknown-type-pid_t.patch b/package/open-lldp/0003-fixed-unknown-type-pid_t.patch
similarity index 94%
rename from package/open-lldp/0004-fixed-unknown-type-pid_t.patch
rename to package/open-lldp/0003-fixed-unknown-type-pid_t.patch
index 2d3b9148e0..9391a04bf4 100644
--- a/package/open-lldp/0004-fixed-unknown-type-pid_t.patch
+++ b/package/open-lldp/0003-fixed-unknown-type-pid_t.patch
@@ -7,6 +7,7 @@ Fixed 'unknown type pid_t' gcc compile error in dcbtool_cmds.c and
 lldptool_cmds.c
 
 Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>
+[Upstream status: https://github.com/intel/openlldp/pull/46]
 ---
  dcbtool_cmds.c  | 1 +
  lldptool_cmds.c | 1 +
diff --git a/package/open-lldp/Config.in b/package/open-lldp/Config.in
index b40bff8996..5bf363ef15 100644
--- a/package/open-lldp/Config.in
+++ b/package/open-lldp/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_OPEN_LLDP
 	  configuration tool for Intel LLDP Agent with Enhanced Ethernet
 	  support for the Data Center.
 
-	  http://open-lldp.org/
+	  https://github.com/intel/openlldp/
 
 comment "open-lldp needs a toolchain w/ dynamic library, threads"
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/open-lldp/open-lldp.hash b/package/open-lldp/open-lldp.hash
index fdd85fed4f..c3a99c5a1d 100644
--- a/package/open-lldp/open-lldp.hash
+++ b/package/open-lldp/open-lldp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 f2c8a3307970374b01ad832ea18cf6d9abce6f00b3d8aed9305aa1428ad8252d  open-lldp-036e314bd93602f7388262cc37faf8b626980af1.tar.gz
-sha256 67af5abeb092213cd9c53781503320f635ba28b641e0c3f24d367e8e93a9839b  COPYING
+sha256  112c26241b3fc01496ce4affda4c870122c5343b0505f0a044445ee8056a2106  open-lldp-b71bfb87fefb31c4b1a6a7ae351791c90966c3a8.tar.gz
+sha256  67af5abeb092213cd9c53781503320f635ba28b641e0c3f24d367e8e93a9839b  COPYING
diff --git a/package/open-lldp/open-lldp.mk b/package/open-lldp/open-lldp.mk
index c9fd958a4f..efaaa7bdfe 100644
--- a/package/open-lldp/open-lldp.mk
+++ b/package/open-lldp/open-lldp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPEN_LLDP_VERSION = 036e314bd93602f7388262cc37faf8b626980af1
-OPEN_LLDP_SITE = git://open-lldp.org/open-lldp.git
+OPEN_LLDP_VERSION = b71bfb87fefb31c4b1a6a7ae351791c90966c3a8
+OPEN_LLDP_SITE = $(call github,intel,openlldp,$(OPEN_LLDP_VERSION))
 OPEN_LLDP_DEPENDENCIES = readline libnl libconfig host-pkgconf
 OPEN_LLDP_LICENSE = GPL-2.0
 OPEN_LLDP_LICENSE_FILES = COPYING
-- 
2.25.1
