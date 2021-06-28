From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 28 Jun 2021 18:47:09 +0200
Subject: [Buildroot] Trouble with u-boot on a ZynqMP board
In-Reply-To: <62bea3e6-dfdd-d230-e833-80775f065f83@lucaceresoli.net>
References: <CAM+bi4s4Nueb96Xyo5dY7vwDhJO1xFnzcdrky5U3qsBBNf8EHQ@mail.gmail.com>
 <1ae87e6c-9b70-9492-6efd-b67d06d91433@lucaceresoli.net>
 <CAM+bi4sU71gkigZ_-T-AXKYtqYOA1cn+0bU=_TiThf94K2C4yQ@mail.gmail.com>
 <62bea3e6-dfdd-d230-e833-80775f065f83@lucaceresoli.net>
Message-ID: <07bd6c4b-ad67-bf4c-b32c-aff2d5d7637b@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alvaro,

On 24/06/21 23:51, Luca Ceresoli wrote:
[...]
>>> I haven't been working on zynqmp recently but back at the times
>>> (2018~2019) one needed to have the various booting components "in sync",
>>> expecially pmufw, U-Boot and SPL or FSBL. I don't remember whether ATF
>>> was critical too in that respect. By "in sync" I mean the major version
>>> number (the year) should be the same.
>>>
>>> Here you are using a 2018 pmufw and 2021 U-Boot so you muight want to
>>> build a more recent pmufw and see if you get any improvements.
>>
>> Great, that's a nice idea, thank you!
> 
> Try that, which seems to be required:
> https://forums.xilinx.com/t5/Embedded-Linux/problem-on-u-boot-quot-Synchronous-Abort-quot-handler-esr/m-p/1060937/highlight/true#M39206

Did you make any progress?

I was able to build and test more recent versions of pmufw (2019.2 amd
2020.1) and pushed them to [0]. They are tested and working. Not sure
it's useful, but that's what I can provide at the moment.

I generated them with an unmodified zynqmp-pmufw-builder. You can do the
same to generate similar images but with debug messages enabled. Here's
a dirty patch to apply to the 'embeddedsw' submodule to enable _lots_ of
messages:

----------------------------8<----------------------------
diff --git a/lib/sw_apps/zynqmp_pmufw/src/pm_common.h
b/lib/sw_apps/zynqmp_pmufw/src/pm_common.h
index 1bed98e76630..3a06a15b62dc 100644
--- a/lib/sw_apps/zynqmp_pmufw/src/pm_common.h
+++ b/lib/sw_apps/zynqmp_pmufw/src/pm_common.h
@@ -52,6 +52,7 @@ typedef struct PmNode PmNode;
 #define PM_ERROR	2U
 #define PM_WARNING	3U
 #define PM_INFO		4U
+#define PM_LOG_LEVEL 4U /////////////////////////////////

 #if defined(PM_LOG_LEVEL) && (PM_LOG_LEVEL >= PM_INFO)
 	#define PmInfo(...)	pm_printf(__VA_ARGS__)
diff --git a/lib/sw_apps/zynqmp_pmufw/src/xpfw_config.h
b/lib/sw_apps/zynqmp_pmufw/src/xpfw_config.h
index 4816a2dfd06b..2420a7a47493 100644
--- a/lib/sw_apps/zynqmp_pmufw/src/xpfw_config.h
+++ b/lib/sw_apps/zynqmp_pmufw/src/xpfw_config.h
@@ -17,8 +17,8 @@ extern "C" {

 /* PMUFW print levels */
 #define XPFW_PRINT_VAL (1U)
-#define XPFW_DEBUG_ERROR_VAL (0U)
-#define XPFW_DEBUG_DETAILED_VAL (0U)
+#define XPFW_DEBUG_ERROR_VAL (1U)
+#define XPFW_DEBUG_DETAILED_VAL (1U)

 /**
  * PMUFW Debug options
----------------------------8<----------------------------

[0] https://github.com/lucaceresoli/zynqmp-pmufw-binaries/

-- 
Luca
