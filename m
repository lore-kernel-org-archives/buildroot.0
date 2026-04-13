Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21732EBFD30
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 10:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1D7A60BC6;
	Mon, 13 Apr 2026 10:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lGAlMvYwivJV; Mon, 13 Apr 2026 10:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D967160BE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776076417;
	bh=fGBC4D0uV8pKuijcLBmRXP66uz+CbcrK8LNh/T/miTQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ds/RL3wKveudslFCP8Jrw570O/2kxhqnGF65kgWUYSvOjkMYOothwuh4Kb+PskYvs
	 icH3Xpf9mmbw/8YGglhhKmrtIKiBcqN0J90oFZsZOSgMpVjtpoosXIrzBlvCIwKYWZ
	 6e8S75WlfoEfzdiXVlzuAXG5ruzmAqnUW6GxCdRI/KtGmrKtkxuXOW/FNqRJeNG49/
	 BNE9Lc88CrIVt+We9VUIEcHhlZZ75Nyi7MA5/+gNugKJOfsBHUOOrCVZoDDPzZss72
	 4aY5m2M7zWFvoGCzDFXTvTua6sLdcPAFKMESDEJhLRA8hX+lPjHnDqSiqcqdL6eR4g
	 CbI73BQKkXSUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D967160BE1;
	Mon, 13 Apr 2026 10:33:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7168C237
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 10:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5716260BE1
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 10:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOeh4Gr3wVau for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 10:33:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 87D0660BC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87D0660BC6
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87D0660BC6
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 10:33:33 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id CEbiwl023wf0DCEbiw1WHK; Mon, 13 Apr 2026 12:33:30 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 13 Apr 2026 12:33:29 +0200
Message-ID: <20260413103329.2557294-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNECOISa3FjR3Q3nEBUH30rKr1LO5qcbxqznIRUJ1xLhsRGFD8HrO5PTvHbxPMHLED69e2/QWMY6L8DT+fylUp4+6L6UmVobqsnRML00T12c2cJpejA2
 PZvV7eg3NcMHeAQ2cOz/wk6zWCPahHjEGZNohb85l1hoQiIKg/ibPvCyb9j6nHfEdOI7l4AMxH7DO1Fi/sSm4sinAuIwQ1hLS9MR1B6N2Bw+GmgReNbOo3YY
 vHo5wWqYVWVlChKNkn+n5+Be/raVCY6gbxMSVXWC2VQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1776076410; bh=er5dFql0kUwRYlcd+QkIYktijlGpoAhtaeGnPtBG0ic=;
 h=From:To:Subject:Date:MIME-Version;
 b=L2a/UEEhyl8ejtq4zWvclXwbXiUeekipE58JPoHsADkJ/XSnfjYtVFnsvtZjr6ZF8
 dYroBbSjqXCVD52l24rQ6RzB4e0HuK6RxxaPLSRGWQEx9bZqqYqh7lctUwbG7DmTte
 /g8LRetC+VsKkLCx/1q+6SUCbgUs/ZMPBllZ/WMXfzaoL7SLAvNuHiOI2B8LU78e7m
 GlZSmZXstPBFj8tpuLO8kFJfbtGXbtomCKRjANEtLBXcXDI3BjQQTZFe9U5AzyorsO
 jfOF8Ly5EW7wzJ3baW3muhACDLLOFyj5ToKho+qMtaPYYweu0v24/mnMGl2X2S6glz
 2cM24++EmKtjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=L2a/UEEh
Subject: [Buildroot] [PATCH] package/esp-hosted: bump to version 1.0.6
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

Release notes:
https://github.com/espressif/esp-hosted/releases/tag/release%2Fng-1.0.6

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/esp-hosted/esp-hosted.hash | 2 +-
 package/esp-hosted/esp-hosted.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index 65083fff70..b478d412f4 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  15e634c6181b32c39c1274917efcefc78a8123cc52e72475f71b512625a30ef1  ng-v1.0.5.0.3.tar.gz
+sha256  b8baa6d1c8576f5453e382333bc4aafef1293b4705f073dff5b08d900d10d68c  ng-v1.0.6.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  esp_hosted_ng/host/LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 15603b9679..3de8f24123 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = 1.0.5.0.3
+ESP_HOSTED_VERSION = 1.0.6
 ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,release/ng-$(ESP_HOSTED_VERSION))
 ESP_HOSTED_SOURCE = ng-v$(ESP_HOSTED_VERSION).tar.gz
 ESP_HOSTED_DEPENDENCIES = linux
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
