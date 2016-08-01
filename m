From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 1 Aug 2016 23:23:30 +0200
Subject: [Buildroot] [PATCH] gdb: fix sim support for ARM
In-Reply-To: <20160731112751.GA26681@waldemar-brodkorb.de>
References: <20160731112751.GA26681@waldemar-brodkorb.de>
Message-ID: <9bb51696-e686-aa3a-2180-6bcc2e2bb8d6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

Le 31/07/2016 ? 13:27, Waldemar Brodkorb a ?crit :
> It seems the old fix breaks compilation for other
> architectures then bfin.
> Fixes:
> http://autobuild.buildroot.net/results/3b82c44ee853fab0e0c63881f0705bb659412917/
> http://autobuild.buildroot.net/results/dafbb93ab38a4285ce42436219d552cceb14828b/

[Tested in a chroot squeeze with gcc 4.4.5]
Tested-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> 
> @Thomas Petazzoni: Can you check if it still works on your old
> Debian system with gcc 4.4 on the host. Thanks.
> 
> ---
>  package/gdb/7.10.1/0005-fix-sim-compile.patch |   16 ----------------
>  package/gdb/7.10.1/0006-fix-sim-compile.patch |   22 ++++++++++++++++++++++
>  package/gdb/7.11.1/0001-fix-sim-compile.patch |   18 ++++++++++++------
>  3 files changed, 34 insertions(+), 22 deletions(-)
>  delete mode 100644 package/gdb/7.10.1/0005-fix-sim-compile.patch
>  create mode 100644 package/gdb/7.10.1/0006-fix-sim-compile.patch
> 
> diff --git a/package/gdb/7.10.1/0005-fix-sim-compile.patch b/package/gdb/7.10.1/0005-fix-sim-compile.patch
> deleted file mode 100644
> index c886363..0000000
> --- a/package/gdb/7.10.1/0005-fix-sim-compile.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Fix compile on older systems with gcc 4.4.x.
> -
> -Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> -
> -diff -Nur gdb-7.10.1.orig//sim/common/sim-base.h gdb-7.10.1/sim/common/sim-base.h
> ---- gdb-7.10.1.orig//sim/common/sim-base.h	2015-05-13 13:03:56.000000000 -0500
> -+++ gdb-7.10.1/sim/common/sim-base.h	2016-07-08 07:44:17.000000000 -0500
> -@@ -72,8 +72,6 @@
> - #define INVALID_INSTRUCTION_ADDRESS ((address_word)0 - 1)
> - #endif
> - 
> --/* TODO: Probably should just delete SIM_CPU.  */
> --typedef struct _sim_cpu SIM_CPU;
> - typedef struct _sim_cpu sim_cpu;
> - 
> - #include "sim-module.h"
> diff --git a/package/gdb/7.10.1/0006-fix-sim-compile.patch b/package/gdb/7.10.1/0006-fix-sim-compile.patch
> new file mode 100644
> index 0000000..4d365b9
> --- /dev/null
> +++ b/package/gdb/7.10.1/0006-fix-sim-compile.patch
> @@ -0,0 +1,22 @@
> +Fix compile on older systems with gcc 4.4.x.
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +
> +diff -Nur gdb-7.10.1.orig/sim/common/sim-base.h gdb-7.10.1/sim/common/sim-base.h
> +--- gdb-7.10.1.orig/sim/common/sim-base.h	2015-05-13 20:03:56.000000000 +0200
> ++++ gdb-7.10.1/sim/common/sim-base.h	2016-07-31 12:37:36.103814690 +0200
> +@@ -72,8 +72,13 @@
> + #define INVALID_INSTRUCTION_ADDRESS ((address_word)0 - 1)
> + #endif
> + 
> +-/* TODO: Probably should just delete SIM_CPU.  */
> ++/* GCC 4.4 and older should not define this.  */
> ++#define GCC_VERSION (__GNUC__ * 10000 \
> ++                               + __GNUC_MINOR__ * 100 \
> ++                               + __GNUC_PATCHLEVEL__)
> ++#if __GCC_VERSION > 40400
> + typedef struct _sim_cpu SIM_CPU;
> ++#endif
> + typedef struct _sim_cpu sim_cpu;
> + 
> + #include "sim-module.h"
> diff --git a/package/gdb/7.11.1/0001-fix-sim-compile.patch b/package/gdb/7.11.1/0001-fix-sim-compile.patch
> index ecb0514..4d365b9 100644
> --- a/package/gdb/7.11.1/0001-fix-sim-compile.patch
> +++ b/package/gdb/7.11.1/0001-fix-sim-compile.patch
> @@ -1,16 +1,22 @@
> -Fix compile on older systems with gcc 4.4.x
> +Fix compile on older systems with gcc 4.4.x.
>  
>  Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>  
> -diff -Nur gdb-7.11.1.orig//sim/common/sim-base.h gdb-7.11.1/sim/common/sim-base.h
> ---- gdb-7.11.1.orig//sim/common/sim-base.h	2016-02-09 21:19:39.000000000 -0600
> -+++ gdb-7.11.1/sim/common/sim-base.h	2016-07-08 08:02:09.000000000 -0500
> -@@ -72,8 +72,6 @@
> +diff -Nur gdb-7.10.1.orig/sim/common/sim-base.h gdb-7.10.1/sim/common/sim-base.h
> +--- gdb-7.10.1.orig/sim/common/sim-base.h	2015-05-13 20:03:56.000000000 +0200
> ++++ gdb-7.10.1/sim/common/sim-base.h	2016-07-31 12:37:36.103814690 +0200
> +@@ -72,8 +72,13 @@
>   #define INVALID_INSTRUCTION_ADDRESS ((address_word)0 - 1)
>   #endif
>   
>  -/* TODO: Probably should just delete SIM_CPU.  */
> --typedef struct _sim_cpu SIM_CPU;
> ++/* GCC 4.4 and older should not define this.  */
> ++#define GCC_VERSION (__GNUC__ * 10000 \
> ++                               + __GNUC_MINOR__ * 100 \
> ++                               + __GNUC_PATCHLEVEL__)
> ++#if __GCC_VERSION > 40400
> + typedef struct _sim_cpu SIM_CPU;
> ++#endif
>   typedef struct _sim_cpu sim_cpu;
>   
>   #include "sim-module.h"
> 
