Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0C8FF886F
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 04:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E13B849ED;
	Thu, 30 Apr 2026 04:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YSTA4QSG6SQW; Thu, 30 Apr 2026 04:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1698A849EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777524057;
	bh=pRTqxlDGrSJptK7/5B7xmHwBV78YXs7X6U/AX1XWxXA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V1wNgdribJJ6E42LfIP4WZjTGZkjKFh4awAuFYKP2Ejqlln3+SooPZ9rjliDUp3p2
	 IYV812V/0DZmLS9qCnvXUuN9knDq2BZwJrKKkUZRXttolvobK4Rw134ks0LcOtpUc7
	 TS9xrplrYUncy6JN/oF1J543Ab8rYZbr/OhLdiRtBcOKqD87O7PXPnrCCKjOa426OB
	 UMbyY/0zYlzbWoieNbCXVbAbrheI7lJVaUU/tkAz+Gme3HVGE+7iwnUmmNecZUQNyZ
	 qtaWnIBPdGM6dJtetD1cJbk5nXyT1Z4jWWIgIzl0t0xzuYwvpxb2/p66qqQw95WAUg
	 QrXsUoWCzGtKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1698A849EE;
	Thu, 30 Apr 2026 04:40:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16DE418E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 087FC4045B
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-vr_eMmQgQL for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 04:40:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45DC240257
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45DC240257
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45DC240257
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:40:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb47.dip0.t-ipconnect.de [84.161.187.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C85D3A4C1429
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 06:40:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37186)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIJCj-000000006uE-3fKO
 for buildroot@buildroot.org; Thu, 30 Apr 2026 04:40:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 06:40:50 +0200
Message-ID: <20260430044050.7637-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430044050.7637-1-bernd@kuhls.net>
References: <20260430044050.7637-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777524050;
 bh=osvwF3whNgtlnaW0UK+CGwxAk6BfkQT6xZTiW+F4Ip0=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=rz+WZiU5iufzlQW2PU3QoqX2bzOBwlPgJRlDuS8hFYlDhJ58QWVpMVqGLhctJaHfA
 pd2y7tXmbwFfkilfHsGgOmUNdlYN3RjV5MBe1PLYD+gYxQ9EsUrNmbbBUctocCIvLZ
 waEfa3ca9fearXh/EYWOvRaYczPIqnpNFUrLpD7UA7OmKC4Jm8g4q535V8dMVdlCgn
 47Wf2KlVaRmF6SfaKvRYFaTzbFTCYe8pT6uDjl9B/s4lP6UQDD6JNfeG589SCp21k9
 kR/B1Swim0kMetcwVfTl96DqVUa9GpQQpnLLn6AqQjqbi+cc6dU8fZudlUnpj2YtSt
 3nuOTRxvVrPuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=rz+WZiU5
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 26.2.0
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

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.2.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index ae00cb8fba..f7a2bcbc8c 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  41456ec8bff819b29a69601aeaffec72fd408ea6c79ab0e4184cc11b6b04f1ba  intel-vpl-gpu-rt-26.1.6.tar.gz
+sha256  597e72a77e9eba8d6efc79a083a775ac0cc47801b2bb7572749ec84acebb1917  intel-vpl-gpu-rt-26.2.0.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 973ba6299b..4dd563d1bc 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.1.6
+INTEL_VPL_GPU_RT_VERSION = 26.2.0
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
