From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Sep 2020 09:11:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdb: add patch for fixing build
 gdb 9.2 with gcc 10 on ppc arch
In-Reply-To: <20200911112240.3222531-1-fido_max@inbox.ru>
References: <20200911112240.3222531-1-fido_max@inbox.ru>
Message-ID: <20200927071123.GF11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxim, All,

On 2020-09-11 14:22 +0300, Maxim Kochetkov spake thusly:
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master (I justslightly tweaaked the commit title for purely
personal tastes). Thanks!

Regards,
Yann E. MORIN.

> ---
>  ...ppc-Fix-linker-error-with-fno-common.patch | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 package/gdb/9.2/0006-sim-ppc-Fix-linker-error-with-fno-common.patch
> 
> diff --git a/package/gdb/9.2/0006-sim-ppc-Fix-linker-error-with-fno-common.patch b/package/gdb/9.2/0006-sim-ppc-Fix-linker-error-with-fno-common.patch
> new file mode 100644
> index 0000000000..813a1054a5
> --- /dev/null
> +++ b/package/gdb/9.2/0006-sim-ppc-Fix-linker-error-with-fno-common.patch
> @@ -0,0 +1,101 @@
> +From ad8464f799a4c96c7ab8bdfec3f95846cf54f9b0 Mon Sep 17 00:00:00 2001
> +From: Sebastian Huber <sebastian.huber@embedded-brains.de>
> +Date: Wed, 1 Jul 2020 19:29:55 +0200
> +Subject: [PATCH] sim/ppc: Fix linker error with -fno-common
> +
> +GCC 10 enables -fno-common by default.  This resulted in a multiple
> +definition linker error since global variables were declared and defined
> +in a header file:
> +
> +  ld: ld-insn.o:sim/ppc/ld-insn.h:221: multiple definition of
> +  `max_model_fields_len'; igen.o:sim/ppc/ld-insn.h:221: first defined here
> +
> +sim/ppc
> +
> +	* ld-insn.h (last_model, last_model_data, last_model_function,
> +	last_model_internal, last_model_macro, last_model_static):
> +	Delete.
> +	(max_model_fields_len, model_data, model_functions,
> +	model_internal, model_macros, model_static, models): Declare, but do not
> +	define.
> +	* ld-insn.c (last_model, last_model_data, last_model_function,
> +	last_model_internal, last_model_macro, last_model_static,
> +	max_model_fields_len, model_data, model_functions,
> +	model_internal, model_macros, model_static, models): Define.
> +
> +Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> +Fetch from: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=ad8464f799a4c96c7ab8bdfec3f95846cf54f9b0
> +---
> + sim/ppc/ld-insn.c | 18 ++++++++++++++++++
> + sim/ppc/ld-insn.h | 24 +++++++-----------------
> + 2 files changed, 25 insertions(+), 17 deletions(-)
> +
> +diff --git a/sim/ppc/ld-insn.c b/sim/ppc/ld-insn.c
> +index e39131ca133..585071a861f 100644
> +--- a/sim/ppc/ld-insn.c
> ++++ b/sim/ppc/ld-insn.c
> +@@ -28,6 +28,24 @@
> + 
> + #include "igen.h"
> + 
> ++static model *last_model;
> ++
> ++static insn *last_model_macro;
> ++static insn *last_model_function;
> ++static insn *last_model_internal;
> ++static insn *last_model_static;
> ++static insn *last_model_data;
> ++
> ++model *models;
> ++
> ++insn *model_macros;
> ++insn *model_functions;
> ++insn *model_internal;
> ++insn *model_static;
> ++insn *model_data;
> ++
> ++int max_model_fields_len;
> ++
> + static void
> + update_depth(insn_table *entry,
> + 	     lf *file,
> +diff --git a/sim/ppc/ld-insn.h b/sim/ppc/ld-insn.h
> +index 88318ffa2b3..52baeaa2d84 100644
> +--- a/sim/ppc/ld-insn.h
> ++++ b/sim/ppc/ld-insn.h
> +@@ -200,25 +200,15 @@ extern insn_table *load_insn_table
> +  table_include *includes,
> +  cache_table **cache_rules);
> + 
> +-model *models;
> +-model *last_model;
> ++extern model *models;
> + 
> +-insn *model_macros;
> +-insn *last_model_macro;
> ++extern insn *model_macros;
> ++extern insn *model_functions;
> ++extern insn *model_internal;
> ++extern insn *model_static;
> ++extern insn *model_data;
> + 
> +-insn *model_functions;
> +-insn *last_model_function;
> +-
> +-insn *model_internal;
> +-insn *last_model_internal;
> +-
> +-insn *model_static;
> +-insn *last_model_static;
> +-
> +-insn *model_data;
> +-insn *last_model_data;
> +-
> +-int max_model_fields_len;
> ++extern int max_model_fields_len;
> + 
> + extern void insn_table_insert_insn
> + (insn_table *table,
> +-- 
> +2.18.4
> +

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
