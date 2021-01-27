From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Jan 2021 22:35:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: Fix build with
 Postgresql 13
In-Reply-To: <20210125074058.786498-1-fido_max@inbox.ru>
References: <20210125074058.786498-1-fido_max@inbox.ru>
Message-ID: <20210127213542.GH2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxim, All,

On 2021-01-25 10:40 +0300, Maxim Kochetkov via buildroot spake thusly:
> Add missed patch for PG13 build.
> 
> Fixes: 5cff0c8a2d1c ("package/timescaledb: bump to version 2.0.0")
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, after adding a reference to an autobuild failure,
thanks.

Regards,
Yann E. MORIN.

> ---
>  ...just-code-to-PG13-tuptoaster-changes.patch | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 package/timescaledb/0019-Adjust-code-to-PG13-tuptoaster-changes.patch
> 
> diff --git a/package/timescaledb/0019-Adjust-code-to-PG13-tuptoaster-changes.patch b/package/timescaledb/0019-Adjust-code-to-PG13-tuptoaster-changes.patch
> new file mode 100644
> index 0000000000..0793bf1d26
> --- /dev/null
> +++ b/package/timescaledb/0019-Adjust-code-to-PG13-tuptoaster-changes.patch
> @@ -0,0 +1,70 @@
> +From 42ac10738119c7d31892d8c3f45d525ad5bda756 Mon Sep 17 00:00:00 2001
> +From: Sven Klemm <sven@timescale.com>
> +Date: Sat, 26 Sep 2020 02:19:56 +0200
> +Subject: [PATCH] Adjust code to PG13 tuptoaster changes
> +
> +PG13 split tuptoaster.c into three separate files. This patch also
> +removes unnecesary tuptoaster.h includes.
> +
> +https://github.com/postgres/postgres/commit/8b94dab066
> +
> +Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> +Fetch from: https://github.com/timescale/timescaledb/commit/2bef612c04435cdb5257d40373c4955a0d617c39.patch
> +---
> + tsl/src/remote/async.c       | 1 -
> + tsl/src/remote/stmt_params.c | 1 -
> + tsl/src/reorder.c            | 7 ++++++-
> + 3 files changed, 6 insertions(+), 3 deletions(-)
> +
> +diff --git a/tsl/src/remote/async.c b/tsl/src/remote/async.c
> +index f3462809..0d55deb7 100644
> +--- a/tsl/src/remote/async.c
> ++++ b/tsl/src/remote/async.c
> +@@ -13,7 +13,6 @@
> + #include <fmgr.h>
> + #include <utils/lsyscache.h>
> + #include <catalog/pg_type.h>
> +-#include <access/tuptoaster.h>
> + 
> + #include "compat.h"
> + #if PG12_GE
> +diff --git a/tsl/src/remote/stmt_params.c b/tsl/src/remote/stmt_params.c
> +index 0f315f37..1682d476 100644
> +--- a/tsl/src/remote/stmt_params.c
> ++++ b/tsl/src/remote/stmt_params.c
> +@@ -6,7 +6,6 @@
> + #include <postgres.h>
> + #include <catalog/pg_type.h>
> + #include <access/htup_details.h>
> +-#include <access/tuptoaster.h>
> + #include <utils/lsyscache.h>
> + #include <utils/syscache.h>
> + #include <utils/builtins.h>
> +diff --git a/tsl/src/reorder.c b/tsl/src/reorder.c
> +index c4b42c12..7f301b2b 100644
> +--- a/tsl/src/reorder.c
> ++++ b/tsl/src/reorder.c
> +@@ -19,7 +19,6 @@
> + #include <access/relscan.h>
> + #include <access/rewriteheap.h>
> + #include <access/transam.h>
> +-#include <access/tuptoaster.h>
> + #include <access/xact.h>
> + #include <access/xlog.h>
> + #include <catalog/catalog.h>
> +@@ -58,6 +57,12 @@
> + #include <utils/tqual.h>
> + #endif
> + 
> ++#if PG13_LT
> ++#include <access/tuptoaster.h>
> ++#else
> ++#include <access/toast_internals.h>
> ++#endif
> ++
> + #include "chunk.h"
> + #include "chunk_index.h"
> + #include "hypertable_cache.h"
> +-- 
> +2.29.2
> +
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
