From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 19 Sep 2019 21:35:13 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-09-17
In-Reply-To: <20190918061626.A01A88614D@whitealder.osuosl.org>
References: <20190918061626.A01A88614D@whitealder.osuosl.org>
Message-ID: <20190919213513.25780de0@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Sep 2019 06:16:20 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> Autobuild statistics for 2019-09-17
> ===============================
[...]
>   powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/eb3a59a78dbb0c83cff78aac2384edea890af830 |     
>   powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/f1360435f0a198ac35bcfd965650da1e204576bf |     

Fails with:

  cpu.c:57:10: fatal error: sys/auxv.h: No such file or directory
   #include <sys/auxv.h>
            ^~~~~~~~~~~~
  compilation terminated.

From build/flac-1.3.3/src/libFLAC/cpu.c:

 56 #if defined FLAC__CPU_PPC
 57 #include <sys/auxv.h>
 58 #endif

236 static void
237 ppc_cpu_info (FLAC__CPUInfo *info)
238 {
239 #if defined FLAC__CPU_PPC
240 #ifndef PPC_FEATURE2_ARCH_3_00
241 #define PPC_FEATURE2_ARCH_3_00          0x00800000
242 #endif
243 
244 #ifndef PPC_FEATURE2_ARCH_2_07
245 #define PPC_FEATURE2_ARCH_2_07          0x80000000
246 #endif
247 
248         if (getauxval(AT_HWCAP2) & PPC_FEATURE2_ARCH_3_00) {
249                 info->ppc.arch_3_00 = true;
250         } else if (getauxval(AT_HWCAP2) & PPC_FEATURE2_ARCH_2_07) {
251                 info->ppc.arch_2_07 = true;
252         }
253 #else
254         info->ppc.arch_2_07 = false;
255         info->ppc.arch_3_00 = false;
256 #endif
257 }

Could be fixed by the following flac configure.ac patch (check for sys/auxv.h before
defining FLAC__CPU_PPC):

diff --git a/configure.ac b/configure.ac
index 0228a12..64cb3f2 100644
--- a/configure.ac
+++ b/configure.ac
@@ -144,7 +144,7 @@ case "$host_cpu" in
        powerpc64|powerpc64le)
                cpu_ppc64=true
                cpu_ppc=true
-               AC_DEFINE(FLAC__CPU_PPC)
+               AC_CHECK_HEADER(sys/auxv.h, AC_DEFINE(FLAC__CPU_PPC))
                AH_TEMPLATE(FLAC__CPU_PPC, [define if building for PowerPC])
                AC_DEFINE(FLAC__CPU_PPC64)
                AH_TEMPLATE(FLAC__CPU_PPC64, [define if building for PowerPC64])
@@ -152,7 +152,7 @@ case "$host_cpu" in
                ;;
        powerpc|powerpcle)
                cpu_ppc=true
-               AC_DEFINE(FLAC__CPU_PPC)
+               AC_CHECK_HEADER(sys/auxv.h, AC_DEFINE(FLAC__CPU_PPC))
                AH_TEMPLATE(FLAC__CPU_PPC, [define if building for PowerPC])
                asm_optimisation=$asm_opt
                ;;

Regards,
Peter
