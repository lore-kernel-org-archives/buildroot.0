Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B328CD6E57
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 19:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A2A8610BE;
	Tue,  2 Jun 2026 19:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZQt_1hm_HSt; Tue,  2 Jun 2026 19:00:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AC14610B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780426853;
	bh=Wd3DIZbIc1+qQbCZG8KXu4b0/Bv6L7+aSTi8zV+bWaA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MLmRwdsFpzcLiEXhVZm2MMtvW915qey5RuYCKZfc3z1EFzio9lJ55YRQ6xttECvPx
	 MVnrMKaN2f/OfOH2tUu0yx5sJzLdyTHQ9n70yfES+w8SAGIWzDqOD3RX0uG3WcsEEs
	 sCxvmugcwxyHTPPJJDdNsSLtpavaz2kZViI5y2K+nKmPLgGkvz2oVuKmynEsAXVXzH
	 JCOKvpk+YGn59hael3yUwFoa6Xc2YHIHIfXwm9P8+Ejo5vlZTRWAZnhbQklb7pC0CN
	 UQNO0IFUJMBrGX8YEtH0tvvAvq/pvJ57u4mRwuw2PKCOSMUQFQvcYEb0Xr29TjG1CD
	 5FJE3Jer2h7Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AC14610B5;
	Tue,  2 Jun 2026 19:00:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 23550187
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09B2C610B7
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ud9B7kzpmXlq for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 19:00:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E716D60E5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E716D60E5E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E716D60E5E
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:00:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08ef.dip0.t-ipconnect.de [91.58.8.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E0712A4C3A9E
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 21:00:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49772)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wUUM4-000000005yG-0UYl
 for buildroot@buildroot.org; Tue, 02 Jun 2026 19:00:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 21:00:48 +0200
Message-ID: <20260602190048.2035264-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260602190048.2035264-1-bernd@kuhls.net>
References: <20260602190048.2035264-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780426848;
 bh=ITlYhI5VJ6+W1qjv+j9AcFFsKTwqqje7h+VBPcsLLvU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=WHVnjnoG/qPxQBQG0+yIHyfW5tstlhW+x3ngJCBJA4ki+vehMNiVxuuNcfoYMWlO1
 hStU+FZ71VV9KKkmMsjtXQFfGyU5jMEIhdcZoPJTfLIqrJz00NXK9jlrw1jlhDYXFN
 sJutdh+tl3aBRxh0hxv9C4m1FAWIZ921YQIabXdiOPzPa6duK1eXYaId9TfJLTzb93
 V7ckNIDHTxM/4cMOoEB1dVXhMPxTuef1vTLGl/RPtqSckg5lhZy+HFUg0nL2dVvFBK
 mK4Hb1Eyww/QSbat2YXW7dXOqnQskikPlbqya4J8TMU2q36RF4pPpPq0RuYLq8knPn
 waAaKxMlXY6kw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WHVnjnoG
Subject: [Buildroot] [PATCH/next 2/2] package/intel-vpl-gpu-rt: bump version
 to 26.2.1
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

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.2.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/5f1eee2b3125380a045021fee62a017c1881dbc0

 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index f7a2bcbc8c..d1e4c58fda 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  597e72a77e9eba8d6efc79a083a775ac0cc47801b2bb7572749ec84acebb1917  intel-vpl-gpu-rt-26.2.0.tar.gz
+sha256  b9a84d5d2255cbea8586019a3bd03165f0269e06dba03e9c6f6cdf363b6b2fab  intel-vpl-gpu-rt-26.2.1.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 4dd563d1bc..e812ca31cf 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.2.0
+INTEL_VPL_GPU_RT_VERSION = 26.2.1
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
