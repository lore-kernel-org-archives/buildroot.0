Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5B7C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 22:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6005740B7C;
	Fri, 18 Sep 2026 22:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IbODMpnpZUr; Fri, 18 Sep 2026 22:22:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 61D0F40A90
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789770148;
	b=OgcoDu4aqYgOHIY+xYO3H81MLj4rFwXZJ+wOeHg+E50RgyE3KCqdQWnYpjoMMjKWJF4t
	 HmLYb25PTUXhsUqBu3TVgOv6x+mha5m6l9i7ReASXgGFt5FtH8ZnciScLoXBbfAVVeejY
	 IoYr99ObovDdGFqNEEM5rHisYY8Jxyq/6s+DkYqrCZGnM4XcK3jvOgMy4TcPqWl/Wzx1A
	 NsMuGaQ+D3Y1jFZAJN8DtVbNMAuxZCnkivk2w1QgUMCYy3XnpFLV96ln8uuSYF2WSvDbb
	 NpoqXcJ9iKSB5gPkbud8N1fuz2pSJ+VOguDkKEkJKLBoqyy9gzOJd575SLuu15E0tog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789770148;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=525copdUmgzCbsRR4CKkWlpY77SnYWQBF3pX6JNQUc0=;
	b=ss4CFJtcRW1mzyx7Pt72cv88Yt5/c/5dP3TRHVfWNBh8DrO99SM7JWBQkN4VE0blPDrQ
	 9RQUCwQAuxWlh/5k4TrafFljoznWx73IXHH4Sq7/MsB/olfPXVDy7RDdomVD6EO/vNssr
	 hLxPSvBRjZk1r5TQyGkeC5pdJG9Lbd2R+JnzzfieE5YKV75VoxrhylvxqBU/r11uS9mag
	 cA7w1vjpjERg4M2FyDKuVVl4MYNvDgJWBMxA922piGfnLdUsWSWX1rEUBqBgoOSmaeaRz
	 nr27mTharkRGms64Kt9jxCeB6rcRFFSiFlc7ka4NPVshL9UQyOL5x9b4asN5kao1GAQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=YTpo9IDS;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789770148;
	bh=525copdUmgzCbsRR4CKkWlpY77SnYWQBF3pX6JNQUc0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qns4UUK07ocr6m1UGneoaGqvfkmAIibfO62uU/TWdX7tTFe2x6VYhEVCYXTP7w51E
	 7MvT66VhsnxZxEuQWdBEzMBqJfytnOrxwRuTyL4vKsRz89BUaDKmdqGCYL8lngYoFM
	 FjVQNBrQ/WkufbBAODE5RHdWLfaGpc/56TgkbDOADQb3Gjtu4zpYLtcb3vbUNqXxhx
	 VmU1aPgolKVoVPUcDiBQ/pYnanRFM0fdgUBw2l12c37JesUO22+n7FJEh2Yz/lt7BL
	 MmNlDDFsiVuf8ee6GcLpsLLQ+y8kdPvv4I0KhIQgBEufmgnJmeOPEw3nR6zGry45FH
	 39dStKHMTb0xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61D0F40A90;
	Fri, 18 Sep 2026 22:22:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59CBB29B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 22:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FBF940A90
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 22:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFAuhoBZKoR7 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 22:22:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E52F440A73
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789770146;
 b=N8LIy2WrZ9LOVmou43uAaCXf1v8kD9Vy/gKV5kwwkCPFm0Cqm8CmDdCdffGEiRdWW7P8
 wdIaAvgoHBjYW2xXwQHOGvW1daNj9Cgq15u5XvgBqJ05wYgzE6jVfzKs9Xog+Js/rP8Zh
 pDLt21OtBhlnPA49b6BA8NPOJphgYskulw8tjp6gg9GifOgNrdaYrAJFoQVw9fwhlhEeq
 HDrnU/OAvnoUnSKU1fDYTAYeOcrYTxHLw1egpAYahskF/LlKxiDk28XV3rsxloLiF+8zQ
 W4Eb+Gpy4PF/PDKasZAEpBqSIrqnsCK+QnJrxATDsiHFaKTtWpcJiB28KHg37+RuhLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789770146;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=pYi9RCtNvqa3GGZphElXaHjitkimde8djcC3pNf8LOs=;
 b=UaoQr4EiE1BMlYd7tDm3HOkDc/ipdj4dasjdegLbbxvtLL/4rSGSYMAc8oB/hyToLiDh
 5GkW0Wt0JkNLhFciLznzErFyjBrEuDH4MqCvSOvIIcIMeZh102dZBAYhT74U0w1QzSGzC
 NX5A3I9wi8F8zo9qdJWq6z+kjqGx8VRO9kho4WPAi41iHiz5haIv7X5UBJ1KQDVT4mt+G
 87qouPtMOK+OSgBUryU5klmTobXwlAog7bLXDCCcReQ6L0bxoN7Rm7MhZk1SP/wyWAvtV
 iQcln7/mMRF/lsN2JWz8j8QWFJStADblKmZMp0MoMkS8sIZJdsSuhoDbRgDCRO28MVw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YTpo9IDS; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YTpo9IDS
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E52F440A73
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 22:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789770140;
 bh=pYi9RCtNvqa3GGZphElXaHjitkimde8djcC3pNf8LOs=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=YTpo9IDSC6yN3ETg33aPBEAH4m/CKIRmB0eM1TBPjI8win5U2eIWeaVy+dZVoKQn+
 aaD4fCNc8zYENSifkzVhW/ukoSPDeHCTd11aav9BXF+nRuAarI6eYyF+JKP+er/s7P
 E1T0ntwmZtmCyJ83vJwFL77c3bSeI7w26rs5yY+1z5lLEAZyE8TPzcGrb5mMlkItFj
 6siZs9Rcm8OvtqROY3c5D7+7jFKnsOxKpf5NQGGQlvSzq2wtxlMMVNcOHbFoKpJeQI
 vB0dtg87EtlUU+EKz7lcpXbMlIpa7UVoYBqECmMh3HUbH4vIQ8eSlv/BvrMISHCHEC
 Lgrkt1P56o7Pw==
X-KAS-Sym: v3:f51bdf72230551df:kPCeqCksVmqjmwTAKqnT69Meb9SisD38n8JUkILamLW999TYjleoZerhLOgutHfjXRTCWyWaJFelpGs6t3XqWhskIK15noH3ylN0vGuCb7IplL2RkJD6H0wT6iHRwf4luO5yQAedAExsB3LXAU0986Web1gKaZQm88Lbp0QWxN371qvWwHH9GetgAzhFNhJDdu37BtgdSitw2YwdhMC6rdG6a1JJxHhrSGTmm+2WaJ5clpzrrLLQOO7dguMqZxFT9Uo3amDUEr7jLcw9kkKH/vs1XdCwV5BqG+sHfkkSC6UstymMW/xg3Tv2A+GfI8eQcWwtmrnPFim4yyJ2fUJnSw==:XWgquluXy8o3Q+/IrgQvDldfRi2iWa+ovdz12Q1Rd+4bGemCeGuSWNgWjnlEb0NW5yuyr8B/ffVePunbVgDnB5mSSD9hhT3a+kIu6Hr9LDwM56oy5Rn9EBAwqA5GBmACjDgoqmX95onqDm8+qbxJK36fJ+446/GfME+9ZhhvJ6jqoU2jiLdj0TyYWVsoRiNBTz1/tYuoBp117dGvvpJ3bozHehYW6F956IwXzTVRWe2+PUef1dPogygjvPUCpgzP98h33JXJggS/P+zusVGd40R3HhMFmhZNZqKZ5f/0QzhihuUy2CDEiItEdOMyO8rKeUjKeNh8Lh9C+L46KfS+z4ybVw11eDggcSDmGYkTRxd5Cg3MzfnWb1zwsDH4PJK61mWL6v7mNepO71Hf8C5JRpvOv2IxmrYLpyZteOm9Lptly+pUfZn0BhWXTr0ocDFhub4rSDN6Zc3JHqeFjK5r42urXh3leufBCe40ThIQDxJ2R0O5lcWYLrpQ/+Vdvr+2kf+hSXw200mnbptNjQYpluHr8c2AT0Tk6YNzXOUuEuUJiJPputbDm2noJz/VFgIOphatJitpnUUQMtKyF/wVtBSn63QY
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D0F8FA4C4202
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 00:22:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55708)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7gyK-000000004wh-2LlE
 for buildroot@buildroot.org; Fri, 18 Sep 2026 22:22:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 00:22:20 +0200
Message-ID: <20260918222220.3573878-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918222220.3573878-1-bernd@kuhls.net>
References: <20260918222220.3573878-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 26.3.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.3.5
https://github.com/intel/vpl-gpu-rt/compare/intel-onevpl-26.3.4...intel-onevpl-26.3.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/894b0c9e1e5a0f7fa1400dce3f8a1fdd5993beb3

 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index ed08ef3926..76d18cd3dd 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  afd7c1cda2a5e9f96c21c333ef1b471d97e6325153d31f3ab468617afab0133e  intel-vpl-gpu-rt-26.3.4.tar.gz
+sha256  92867a0f8c09d81419102a61713e9f98dfd2af3fc9c91c6f4fb6d0c784c8e442  intel-vpl-gpu-rt-26.3.5.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 56e77cda12..9bbac624cd 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.3.4
+INTEL_VPL_GPU_RT_VERSION = 26.3.5
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
