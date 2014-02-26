From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2014 21:24:49 +0100
Subject: [Buildroot] [git commit branch/next] package/ti-gfx: number and fix
	the new-clk-api patch
Message-ID: <20140226205417.1524B9BB17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a52145ac3a0099f1882dc3a0713f2efa160d0a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a sequence number to the newclkapi patch.
Rebase it ontop of the 5.01.00.01 release.

Note: this is barely tested. It applies neatly, but I can't test it,
since I do not have the hardware. I bumped the patch by basically
renaming the problematic functions like the previous patch did:
    s/clk_enable/clk_prepare_enable/
    s/clk_disable/clk_disable_unprepare/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...newclkapi.patch => ti-gfx-0000-newclkapi.patch} |   83 +++++++-------------
 1 files changed, 29 insertions(+), 54 deletions(-)

diff --git a/package/ti-gfx/ti-gfx-newclkapi.patch b/package/ti-gfx/ti-gfx-0000-newclkapi.patch
similarity index 57%
rename from package/ti-gfx/ti-gfx-newclkapi.patch
rename to package/ti-gfx/ti-gfx-0000-newclkapi.patch
index 8f50c7e..69574c1 100644
--- a/package/ti-gfx/ti-gfx-newclkapi.patch
+++ b/package/ti-gfx/ti-gfx-0000-newclkapi.patch
@@ -2,15 +2,15 @@ This patch adjusts the omap3630 portion of the powervr driver to use the new
 clk kernel api.
 
 Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
-----
-Index: ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
-===================================================================
---- ti-gfx-4_09_00_01.orig/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c	2013-06-28 13:44:06.352701522 -0500
-+++ ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c	2013-06-28 13:45:12.364702727 -0500
-@@ -153,6 +153,49 @@
- 	psTimingInfo->ui32ActivePowManLatencyms = SYS_SGX_ACTIVE_POWER_LATENCY_MS;
- }
+[yann.morin.1998 at free.fr: rebased ontop of 5.01.00.01]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+diff -durN ti-gfx-5_01_00_01.orig/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c ti-gfx-5_01_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
+--- ti-gfx-5_01_00_01.orig/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c	2013-12-23 15:44:20.000000000 +0100
++++ ti-gfx-5_01_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c	2014-02-26 19:17:39.829571846 +0100
+@@ -182,6 +182,49 @@
+  @Return   PVRSRV_ERROR
  
+ ******************************************************************************/
 +#if LINUX_VERSION_CODE < KERNEL_VERSION(3,2,0)
 +int clk_disable_unprepare(struct clk *clk)
 +{
@@ -57,50 +57,25 @@ Index: ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
  PVRSRV_ERROR EnableSGXClocks(SYS_DATA *psSysData)
  {
  #if !defined(NO_HARDWARE)
-@@ -167,19 +210,19 @@
- 
- 	PVR_DPF((PVR_DBG_MESSAGE, "EnableSGXClocks: Enabling SGX Clocks"));
- 	
--	res=clk_enable(psSysSpecData->psSGX_FCK);
-+	res=clk_prepare_enable(psSysSpecData->psSGX_FCK);
- 	if (res < 0)
-         {
-                 PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable SGX functional clock (%d)", res));
-                 return PVRSRV_ERROR_UNABLE_TO_ENABLE_CLOCK;
-         }
+@@ -198,7 +241,7 @@
  
--	res=clk_enable(psSysSpecData->psSGX_ICK);
-+	res=clk_prepare_enable(psSysSpecData->psSGX_ICK);
+ #if !defined(PM_RUNTIME_SUPPORT)
+         PVR_DPF((PVR_DBG_MESSAGE, "EnableSGXClocks: Enabling SGX Clocks"));
+-        res=clk_enable(psSysSpecData->psSGX_FCK);
++        res=clk_prepare_enable(psSysSpecData->psSGX_FCK);
          if (res < 0)
          {
-                 PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable SGX interface clock (%d)", res));
- 
--                clk_disable(psSysSpecData->psSGX_FCK);
-+                clk_disable_unprepare(psSysSpecData->psSGX_FCK);
-                 return PVRSRV_ERROR_UNABLE_TO_ENABLE_CLOCK;
-         }
- 
-@@ -233,7 +276,6 @@
- 	return PVRSRV_OK;
- }
+                 PVR_DPF((PVR_DBG_ERROR, "EnableSGXClocks: Couldn't enable SGX functional clock (%d)", res));
+@@ -324,7 +367,7 @@
  
--
- IMG_VOID DisableSGXClocks(SYS_DATA *psSysData)
- {
- #if !defined(NO_HARDWARE)
-@@ -246,9 +288,9 @@
- 	
  	PVR_DPF((PVR_DBG_MESSAGE, "DisableSGXClocks: Disabling SGX Clocks"));
- 	
--	clk_disable(psSysSpecData->psSGX_FCK);
-+	clk_disable_unprepare(psSysSpecData->psSGX_FCK);
- 
--	clk_disable(psSysSpecData->psSGX_ICK);
-+	clk_disable_unprepare(psSysSpecData->psSGX_ICK);
- 
- //	SysDisableSGXInterrupts(psSysData);
+ #if !defined(PM_RUNTIME_SUPPORT)
+-        clk_disable(psSysSpecData->psSGX_FCK);
++        clk_disable_unprepare(psSysSpecData->psSGX_FCK);
+ #endif
+ 	SysDisableSGXInterrupts(psSysData);
  
-@@ -374,14 +416,14 @@
+@@ -540,14 +583,14 @@
  	rate = clk_get_rate(psSysSpecData->psGPT11_FCK);
  	PVR_TRACE(("GPTIMER11 clock is %dMHz", HZ_TO_MHZ(rate)));
  
@@ -117,27 +92,27 @@ Index: ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
  	if (res < 0)
  	{
  		PVR_DPF((PVR_DBG_ERROR, "EnableSystemClocks: Couldn't enable GPTIMER11 interface clock (%d)", res));
-@@ -444,9 +486,9 @@
+@@ -610,9 +653,9 @@
  
  ExitDisableGPT11ICK:
- #if defined(PVR_OMAP3_TIMING_PRCM)
+ #if defined(PVR_OMAP4_TIMING_PRCM)
 -	clk_disable(psSysSpecData->psGPT11_ICK);
 +	clk_disable_unprepare(psSysSpecData->psGPT11_ICK);
  ExitDisableGPT11FCK:
 -	clk_disable(psSysSpecData->psGPT11_FCK);
 +	clk_disable_unprepare(psSysSpecData->psGPT11_FCK);
  ExitError:
- #endif	
+ #endif	/* defined(PVR_OMAP4_TIMING_PRCM) */
  	eError = PVRSRV_ERROR_CLOCK_REQUEST_FAILED;
-@@ -490,9 +532,9 @@
+@@ -664,9 +707,9 @@
+ 	psSysSpecData->sTimerRegPhysBase.uiAddr = 0;
  #endif
- 
- #if defined(PVR_OMAP3_TIMING_PRCM)
+ #if defined(PVR_OMAP4_TIMING_PRCM)
 -	clk_disable(psSysSpecData->psGPT11_ICK);
 +	clk_disable_unprepare(psSysSpecData->psGPT11_ICK);
  
 -	clk_disable(psSysSpecData->psGPT11_FCK);
 +	clk_disable_unprepare(psSysSpecData->psGPT11_FCK);
- #endif	
+ #endif	/* defined(PVR_OMAP4_TIMING_PRCM) */
  }
- #endif	
+ #endif	/* PVR_OMAP_USE_DM_TIMER_API */
