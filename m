From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 17:18:33 +0100
Subject: [Buildroot] [git commit] poco: add patches to fix pcre link issue
	and library installation
Message-ID: <20151103162113.BFC8081DBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8527eb3c017c74c861db8b21f8a0def55988382
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds two patches for poco to fix two issues:

 - A link issue caused by the fact that Buildroot uses the "unbundled"
   mode for pcre, which is broken due to Poco poking into internal
   pcre symbols. A Gentoo patch is adapted to work around this
   problem.

 - A link and runtime issue caused by the fact that the shared
   libraries are simply not installed due to a bug in the Makefile. An
   upstream Poco commit is backported to solve this problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reported-by: Benno Schweikert <b.schweikert@prosystems.de>
---
 package/poco/0004-fix-unbundled-pcre-usage.patch   |   72 ++++++++++++++++++++
 .../0005-add-missing-LIBPREFIX-definition.patch    |   29 ++++++++
 2 files changed, 101 insertions(+), 0 deletions(-)

diff --git a/package/poco/0004-fix-unbundled-pcre-usage.patch b/package/poco/0004-fix-unbundled-pcre-usage.patch
new file mode 100644
index 0000000..4c6c8b4
--- /dev/null
+++ b/package/poco/0004-fix-unbundled-pcre-usage.patch
@@ -0,0 +1,72 @@
+From 75636a750ecd93305eabe226ad95d2a58e65117f Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 3 Nov 2015 16:33:33 +0100
+Subject: [PATCH] Fix build with unbundled pcre
+
+Poco supports two modes for the pcre library: bundled (the default)
+and unbundled. In bundled mode, an internal copy of the pcre library
+is used by Poco. Since this isn't really nice, Buildroot uses the
+"unbundled" mode. However, Poco pokes into some internal symbols of
+pcre, which doesn't play well with unbundled.
+
+To solve this, this commit is an adaptation of the Gentoo patch at
+https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/poco/files/poco-1.4.4-patch-for-libpcre-8.32.patch?revision=1.1
+to make such symbols available internally in Poco, by using parts of
+the bundled Pcre copy.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Foundation/Makefile            |  1 +
+ Foundation/src/pcre_internal.h | 17 +++++++++++++++++
+ 2 files changed, 18 insertions(+)
+
+diff --git a/Foundation/Makefile b/Foundation/Makefile
+index a347daa..9231c51 100644
+--- a/Foundation/Makefile
++++ b/Foundation/Makefile
+@@ -46,6 +46,7 @@ pcre_utf8_objects = pcre_ucd pcre_tables
+ 
+ ifdef POCO_UNBUNDLED
+ 	SYSLIBS += -lpcre -lz
++	objects += $(pcre_utf8_objects)
+ else
+ 	objects += $(zlib_objects) $(pcre_objects) $(pcre_utf8_objects)
+ endif
+diff --git a/Foundation/src/pcre_internal.h b/Foundation/src/pcre_internal.h
+index f3e69fc..c6f1d44 100644
+--- a/Foundation/src/pcre_internal.h
++++ b/Foundation/src/pcre_internal.h
+@@ -2636,6 +2636,17 @@ typedef struct {
+ } ucp_type_table;
+ 
+ 
++/* renamed to avoid clashes with system pcre */
++#define _pcre_utf8_table1      _poco__pcre_utf8_table1
++#define _pcre_utf8_table1_size _poco__pcre_utf8_table1_size
++#define _pcre_utf8_table2      _poco__pcre_utf8_table2
++#define _pcre_utf8_table3      _poco__pcre_utf8_table3
++#define _pcre_utf8_table4      _poco__pcre_utf8_table4
++#define _pcre_utt              _poco__pcre_utt
++#define _pcre_utt_size         _poco__pcre_utt_size
++#define _pcre_utt_names        _poco__pcre_utt_names
++#define _pcre_OP_lengths       _poco__pcre_OP_lengths
++
+ /* Internal shared data tables. These are tables that are used by more than one
+ of the exported public functions. They have to be "external" in the C sense,
+ but are not part of the PCRE public API. The data for these tables is in the
+@@ -2749,6 +2760,12 @@ typedef struct {
+   pcre_int32 other_case; /* offset to other case, or zero if none */
+ } ucd_record;
+ 
++/* renamed to avoid clashes with system pcre */
++#define _pcre_ucd_records _poco__pcre_ucd_records
++#define _pcre_ucd_stage1 _poco__pcre_ucd_stage1
++#define _pcre_ucd_stage2 _poco__pcre_ucd_stage2
++#define _pcre_ucp_gentype _poco__pcre_ucp_gentype
++
+ extern const pcre_uint32 PRIV(ucd_caseless_sets)[];
+ extern const ucd_record  PRIV(ucd_records)[];
+ extern const pcre_uint8  PRIV(ucd_stage1)[];
+-- 
+2.6.2
+
diff --git a/package/poco/0005-add-missing-LIBPREFIX-definition.patch b/package/poco/0005-add-missing-LIBPREFIX-definition.patch
new file mode 100644
index 0000000..bfdfad7
--- /dev/null
+++ b/package/poco/0005-add-missing-LIBPREFIX-definition.patch
@@ -0,0 +1,29 @@
+From c2a49cbc635d8dc894763624c061be5ae8a1a01c Mon Sep 17 00:00:00 2001
+From: Guenter Obiltschnig <guenter.obiltschnig@appinf.com>
+Date: Mon, 30 Mar 2015 16:21:01 +0200
+Subject: [PATCH] add missing LIBPREFIX definition
+
+Backport from upstream commit c2a49cbc635d8dc894763624c061be5ae8a1a01c
+to ensure libraries are properly installed.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 49318a3..7ee99d8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -20,6 +20,8 @@ ifndef POCO_BUILD
+ export POCO_BUILD=$(POCO_BASE)
+ endif
+ 
++LIBPREFIX ?= lib
++
+ .PHONY: poco all libexecs cppunit tests samples cleans clean distclean install
+ 
+ # TESTS and SAMPLES are set in config.make
+-- 
+2.6.2
+
