From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Jan 2021 22:32:58 +0100
Subject: [Buildroot] [git commit] package/timescaledb: Fix build with
 Postgresql 13
Message-ID: <20210127211422.1263283E28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59d119b36ae02a8e58a0a044f3a31f9613ea7b1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missed patch for PG13 build.

Fixes;
    http://autobuild.buildroot.org/results/0e5/0e534ed0a5206856fad7272008b12205811f098a/build-end.log

Fixes: 5cff0c8a2d1c ("package/timescaledb: bump to version 2.0.0")
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
[yann.morin.1998 at free.fr: add reference to autobuilder failure]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...19-Adjust-code-to-PG13-tuptoaster-changes.patch | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/package/timescaledb/0019-Adjust-code-to-PG13-tuptoaster-changes.patch b/package/timescaledb/0019-Adjust-code-to-PG13-tuptoaster-changes.patch
new file mode 100644
index 0000000000..0793bf1d26
--- /dev/null
+++ b/package/timescaledb/0019-Adjust-code-to-PG13-tuptoaster-changes.patch
@@ -0,0 +1,70 @@
+From 42ac10738119c7d31892d8c3f45d525ad5bda756 Mon Sep 17 00:00:00 2001
+From: Sven Klemm <sven@timescale.com>
+Date: Sat, 26 Sep 2020 02:19:56 +0200
+Subject: [PATCH] Adjust code to PG13 tuptoaster changes
+
+PG13 split tuptoaster.c into three separate files. This patch also
+removes unnecesary tuptoaster.h includes.
+
+https://github.com/postgres/postgres/commit/8b94dab066
+
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
+Fetch from: https://github.com/timescale/timescaledb/commit/2bef612c04435cdb5257d40373c4955a0d617c39.patch
+---
+ tsl/src/remote/async.c       | 1 -
+ tsl/src/remote/stmt_params.c | 1 -
+ tsl/src/reorder.c            | 7 ++++++-
+ 3 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/tsl/src/remote/async.c b/tsl/src/remote/async.c
+index f3462809..0d55deb7 100644
+--- a/tsl/src/remote/async.c
++++ b/tsl/src/remote/async.c
+@@ -13,7 +13,6 @@
+ #include <fmgr.h>
+ #include <utils/lsyscache.h>
+ #include <catalog/pg_type.h>
+-#include <access/tuptoaster.h>
+ 
+ #include "compat.h"
+ #if PG12_GE
+diff --git a/tsl/src/remote/stmt_params.c b/tsl/src/remote/stmt_params.c
+index 0f315f37..1682d476 100644
+--- a/tsl/src/remote/stmt_params.c
++++ b/tsl/src/remote/stmt_params.c
+@@ -6,7 +6,6 @@
+ #include <postgres.h>
+ #include <catalog/pg_type.h>
+ #include <access/htup_details.h>
+-#include <access/tuptoaster.h>
+ #include <utils/lsyscache.h>
+ #include <utils/syscache.h>
+ #include <utils/builtins.h>
+diff --git a/tsl/src/reorder.c b/tsl/src/reorder.c
+index c4b42c12..7f301b2b 100644
+--- a/tsl/src/reorder.c
++++ b/tsl/src/reorder.c
+@@ -19,7 +19,6 @@
+ #include <access/relscan.h>
+ #include <access/rewriteheap.h>
+ #include <access/transam.h>
+-#include <access/tuptoaster.h>
+ #include <access/xact.h>
+ #include <access/xlog.h>
+ #include <catalog/catalog.h>
+@@ -58,6 +57,12 @@
+ #include <utils/tqual.h>
+ #endif
+ 
++#if PG13_LT
++#include <access/tuptoaster.h>
++#else
++#include <access/toast_internals.h>
++#endif
++
+ #include "chunk.h"
+ #include "chunk_index.h"
+ #include "hypertable_cache.h"
+-- 
+2.29.2
+
