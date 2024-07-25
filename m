Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F30C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 21:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 863B640ED7;
	Thu, 25 Jul 2024 21:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAxUBhxeUidB; Thu, 25 Jul 2024 21:28:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAAC4405A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAAC4405A7;
	Thu, 25 Jul 2024 21:28:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CDD11BF2B1
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 21:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 497DC81F38
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 21:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxCK8L3PT_Bb for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 21:28:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 74D4881F34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74D4881F34
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74D4881F34
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 21:28:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c1e9.dip0.t-ipconnect.de [79.214.193.233])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 41879A4C30CF;
 Thu, 25 Jul 2024 23:28:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41690)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sX60K-0000000075H-18ER;
 Thu, 25 Jul 2024 21:28:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 23:28:03 +0200
Message-Id: <20240725212804.1039110-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1721942885;
 bh=OR4eZ2u2Cq79HjGiwZuVyvQ9EcPxkWfURY8Lb9u46SY=;
 h=From:To:Cc:Subject:Date:From;
 b=uoKb9PTn/L/Lo88CPtEMW1x8W5aNshuLhELlApjPjb16QVcT1CGZQzPtkftvANxQf
 ch6lTRvv1ujAM6hlixbiQl7Q/WhV0DiattTli9T275/fwlcF/mDnGwBAuSTlT4ykRz
 s/dqXfQlmYNpG86yKQm3Agup6EvS7Q0F2y5kNddAU6Mnb0slxw77saLduB0qrb3p3S
 ErpyEXPCGlluJMei4UIjBkkw5jA21ewSlkYyt0R7m1D/ECl1szVtn1tZPwTbbPYYNP
 hCijHFXJxOU2fwyLurENlg8+NpJgGMYT02WtYhmNS7BwNfxvYB1EKg7Z3vCJJ8oFRT
 KbMB7BOTW6gyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=uoKb9PTn
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 24.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added upstream fix for build issues with GCC 14.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Refactor-for-build-issue.patch       | 142 ++++++++++++++++++
 .../intel-mediadriver/intel-mediadriver.hash  |   2 +-
 .../intel-mediadriver/intel-mediadriver.mk    |   2 +-
 3 files changed, 144 insertions(+), 2 deletions(-)
 create mode 100644 package/intel-mediadriver/0001-Refactor-for-build-issue.patch

diff --git a/package/intel-mediadriver/0001-Refactor-for-build-issue.patch b/package/intel-mediadriver/0001-Refactor-for-build-issue.patch
new file mode 100644
index 0000000000..5badc985cc
--- /dev/null
+++ b/package/intel-mediadriver/0001-Refactor-for-build-issue.patch
@@ -0,0 +1,142 @@
+From 47bae3c809c9f5b11793b76b5edfd7704adb4080 Mon Sep 17 00:00:00 2001
+From: Chen_Ke <ke3.chen@intel.com>
+Date: Fri, 12 Jul 2024 11:42:04 +0800
+Subject: [PATCH] [VP] Refactor for build issue
+
+Refactor for build issue: Avoid storing the address of local variable
+
+Upstream: https://github.com/intel/media-driver/commit/47bae3c809c9f5b11793b76b5edfd7704adb4080
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ media_common/agnostic/common/hw/mhw_render.h      |  1 +
+ media_common/agnostic/common/hw/mhw_state_heap.h  |  2 --
+ .../agnostic/common/hw/mhw_render_cmdpar.h        |  1 +
+ .../shared/packet/media_render_cmd_packet.cpp     |  4 ++--
+ .../shared/packet/media_render_cmd_packet.h       |  4 ++--
+ .../common/vp/hal/packet/vp_render_kernel_obj.cpp | 15 +++++----------
+ .../common/vp/hal/packet/vp_render_kernel_obj.h   |  3 ++-
+ 7 files changed, 13 insertions(+), 17 deletions(-)
+
+diff --git a/media_common/agnostic/common/hw/mhw_render.h b/media_common/agnostic/common/hw/mhw_render.h
+index b551ab1337..36c895c299 100644
+--- a/media_common/agnostic/common/hw/mhw_render.h
++++ b/media_common/agnostic/common/hw/mhw_render.h
+@@ -312,6 +312,7 @@ typedef struct _MHW_GPGPU_WALKER_PARAMS
+ 
+     bool                       hasBarrier;
+     PMHW_INLINE_DATA_PARAMS    inlineDataParamBase;
++    uint32_t                   inlineDataParamSize;
+ 
+ } MHW_GPGPU_WALKER_PARAMS, *PMHW_GPGPU_WALKER_PARAMS;
+ 
+diff --git a/media_common/agnostic/common/hw/mhw_state_heap.h b/media_common/agnostic/common/hw/mhw_state_heap.h
+index 49add60823..2f9afff0af 100644
+--- a/media_common/agnostic/common/hw/mhw_state_heap.h
++++ b/media_common/agnostic/common/hw/mhw_state_heap.h
+@@ -83,8 +83,6 @@ typedef struct MHW_BLOCK_MANAGER *PMHW_BLOCK_MANAGER;
+ 
+ #define MHW_INVALID_SYNC_TAG            0xFFFFFFFF
+ 
+-#define MAX_INLINE_DATA_PARAMS          32
+-
+ enum MW_RENDER_ENGINE_ADDRESS_SHIFT
+ {
+     MHW_STATE_HEAP_SURFACE_STATE_SHIFT = 0
+diff --git a/media_softlet/agnostic/common/hw/mhw_render_cmdpar.h b/media_softlet/agnostic/common/hw/mhw_render_cmdpar.h
+index 4c01d351ce..a8004bbbb9 100644
+--- a/media_softlet/agnostic/common/hw/mhw_render_cmdpar.h
++++ b/media_softlet/agnostic/common/hw/mhw_render_cmdpar.h
+@@ -65,6 +65,7 @@ struct MHW_HEAPS_RESOURCE
+ {
+     PMOS_RESOURCE          presInstructionBuffer = nullptr;
+     PMHW_INLINE_DATA_PARAMS inlineDataParamsBase   = nullptr;
++    uint32_t                inlineDataParamSize   = 0;
+ };
+ 
+ enum MHW_VFE_SLICE_DISABLE
+diff --git a/media_softlet/agnostic/common/shared/packet/media_render_cmd_packet.cpp b/media_softlet/agnostic/common/shared/packet/media_render_cmd_packet.cpp
+index dc9d6896ba..c18cbf4b4f 100644
+--- a/media_softlet/agnostic/common/shared/packet/media_render_cmd_packet.cpp
++++ b/media_softlet/agnostic/common/shared/packet/media_render_cmd_packet.cpp
+@@ -1264,8 +1264,8 @@ MOS_STATUS RenderCmdPacket::PrepareComputeWalkerParams(KERNEL_WALKER_PARAMS para
+ 
+     gpgpuWalker.SLMSize           = params.slmSize;
+     gpgpuWalker.hasBarrier        = params.hasBarrier;
+-    gpgpuWalker.inlineDataParamBase   = params.inlineDataParams;
+-
++    gpgpuWalker.inlineDataParamBase   = params.inlineDataParamBase;
++    gpgpuWalker.inlineDataParamSize = params.inlineDataParamSize;
+     return MOS_STATUS_SUCCESS;
+ }
+ 
+diff --git a/media_softlet/agnostic/common/shared/packet/media_render_cmd_packet.h b/media_softlet/agnostic/common/shared/packet/media_render_cmd_packet.h
+index 89ac89d9a5..7e6b0aa8a1 100644
+--- a/media_softlet/agnostic/common/shared/packet/media_render_cmd_packet.h
++++ b/media_softlet/agnostic/common/shared/packet/media_render_cmd_packet.h
+@@ -120,8 +120,8 @@ typedef struct _KERNEL_WALKER_PARAMS
+ 
+     bool                                hasBarrier;
+     uint32_t                            slmSize;
+-    MHW_INLINE_DATA_PARAMS              inlineDataParams[MAX_INLINE_DATA_PARAMS];
+-    uint32_t                            inlineDataParamNum;
++    PMHW_INLINE_DATA_PARAMS             inlineDataParamBase;
++    uint32_t                            inlineDataParamSize;
+ }KERNEL_WALKER_PARAMS, * PKERNEL_WALKER_PARAMS;
+ 
+ typedef struct _KERNEL_PACKET_RENDER_DATA
+diff --git a/media_softlet/agnostic/common/vp/hal/packet/vp_render_kernel_obj.cpp b/media_softlet/agnostic/common/vp/hal/packet/vp_render_kernel_obj.cpp
+index d6630cbd5f..dbd5b12d1d 100644
+--- a/media_softlet/agnostic/common/vp/hal/packet/vp_render_kernel_obj.cpp
++++ b/media_softlet/agnostic/common/vp/hal/packet/vp_render_kernel_obj.cpp
+@@ -740,7 +740,7 @@ void VpRenderKernelObj::DumpSurface(VP_SURFACE* pSurface, PCCHAR fileName)
+ #endif
+ }
+ 
+-MOS_STATUS VpRenderKernelObj::SetInlineDataParameter(KERNEL_WALKER_PARAMS &walkerParam, KRN_ARG args, RENDERHAL_INTERFACE *renderhal)
++MOS_STATUS VpRenderKernelObj::SetInlineDataParameter(KRN_ARG args, RENDERHAL_INTERFACE *renderhal)
+ {
+     VP_FUNC_CALL();
+     MHW_INLINE_DATA_PARAMS inlineDataPar = {};
+@@ -762,15 +762,10 @@ MOS_STATUS VpRenderKernelObj::SetInlineDataParameter(KERNEL_WALKER_PARAMS &walke
+     {
+         inlineDataPar.isPtrType = false;
+     }
+-    if (walkerParam.inlineDataParamNum < MAX_INLINE_DATA_PARAMS)
+-    {
+-        walkerParam.inlineDataParams[walkerParam.inlineDataParamNum] = inlineDataPar;
+-        walkerParam.inlineDataParamNum++;
+-    }
+-    else
+-    {
+-        VP_RENDER_ASSERTMESSAGE("Exceed max inline data params!");
+-    }
++
++    // walkerParam.inlineDataParamBase will add m_inlineDataParams.data() in each kernel
++    // walkerParam.inlineDataParamSize will add m_inlineDataParams.size() in each kernel
++    m_inlineDataParams.push_back(inlineDataPar);
+ 
+     return MOS_STATUS_SUCCESS;
+ }
+\ No newline at end of file
+diff --git a/media_softlet/agnostic/common/vp/hal/packet/vp_render_kernel_obj.h b/media_softlet/agnostic/common/vp/hal/packet/vp_render_kernel_obj.h
+index 8b9abf9dca..8d095730cd 100644
+--- a/media_softlet/agnostic/common/vp/hal/packet/vp_render_kernel_obj.h
++++ b/media_softlet/agnostic/common/vp/hal/packet/vp_render_kernel_obj.h
+@@ -537,7 +537,7 @@ class VpRenderKernelObj
+ 
+     virtual MOS_STATUS InitRenderHalSurfaceCMF(MOS_SURFACE* src, PRENDERHAL_SURFACE renderHalSurface);
+ 
+-    virtual MOS_STATUS SetInlineDataParameter(KERNEL_WALKER_PARAMS &walkerParam, KRN_ARG args, RENDERHAL_INTERFACE *renderhal);
++    virtual MOS_STATUS SetInlineDataParameter(KRN_ARG args, RENDERHAL_INTERFACE *renderhal);
+ 
+     virtual MOS_STATUS UpdateBindlessSurfaceResource(SurfaceType surf, std::set<uint32_t> surfStateOffset)
+     {
+@@ -617,6 +617,7 @@ class VpRenderKernelObj
+     bool                                                    m_useIndependentSamplerGroup = false; //true means multi kernels has their own stand alone sampler states group. only can be true when m_isAdvKernel is true.
+ 
+     std::shared_ptr<mhw::vebox::Itf>                        m_veboxItf = nullptr;
++    std ::vector<MHW_INLINE_DATA_PARAMS>                    m_inlineDataParams = {};
+ 
+ MEDIA_CLASS_DEFINE_END(vp__VpRenderKernelObj)
+ };
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 89aaab8721..4fa24fba7a 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dec2210c1f824a721e4ea6f66f5899e300801b3e7fae232d3f8a94db38c2edd1  intel-media-24.2.5.tar.gz
+sha256  b6728607e4d05739bce27124605993011b468781043ce34bb1a51919196f2d15  intel-media-24.3.0.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 84b29c1f9a..9a52002672 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 24.2.5
+INTEL_MEDIADRIVER_VERSION = 24.3.0
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
