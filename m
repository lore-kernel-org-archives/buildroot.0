Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69087D2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F01E81260;
	Mon, 12 Jan 2026 08:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1ShuaVD0ozP; Mon, 12 Jan 2026 08:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6555083F70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207668;
	bh=mjQfcT6B1aVz0/RiaGMJruX55BysMgHtH4Vshds16d4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fj0CaRaVlYnxjWTXhX9dD/Nwn52kXQB+5e2CkZQPZDdVz24rboJKl7yayCJbx4o+/
	 bYPyBOqKffJTBjVDXj+e4oSD2IGZimtih7xMCtw7y0Rv9jvVYC7kK8j8nao+8UNfms
	 3kxMRRNB5SmxQ5PYr8Amz48PlZXGDBeuuJVPXPrMw2TSrAu9jEnrR/dt+fUJi76km8
	 h9y//9ot4gRT5NKPq988roccj7UqKX1hH48MkG103ugRS97HLYQXuvspd75cs8Zlvd
	 CWj4I3dLlAf97oJm7BdWCOkz/pSJ4RKhsNIyvbBCpC/L3JuqjxMzNTUhtYGLeC+jsl
	 ocuD2tM1i1H5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6555083F70;
	Mon, 12 Jan 2026 08:47:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EC5F18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44D9E415BD
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nv1yrZArQdS2 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:47:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D365415BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D365415BC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D365415BC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:47:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6B82BA4C40EA
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJD-000000007z0-2REP
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:50 +0100
Message-ID: <20260112082950.2528445-42-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206669;
 bh=+iSdlR3IzL08W00vO6SXRtSJGjoyg1Lp74MuM9iv21U=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=F61oPdpjgW2a0kvg9WkkFJmZoNlVIGv/v8qZXsY8jxISEsPSZ88TX1TBISOLqxf4C
 eCAMxT8KNHWURblNTG3rMZ8ZZHuaFVDH/Lf1nA1Kv0fRGFRNZJOymRgI1MoAfLUirQ
 ZBjnMxiWorNOfODtlNXTD5O6iy2C8mplx1ordRw0IH2nHCxqpatSyU7Arg9J+fGd6T
 Rlt96NmqgC6N+OosNwlwEBjQkC/t2CeFmRanPAe9OALgW1e+zJD2tdLMcaDpMUUxNf
 c/GqaLiLC1wXrNlYZMSJCGPiudhp6snd2bsRuXPpSaIIimwOPkTo51Axd4vFMCmcBk
 cWR3bgYAIOlfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=F61oPdpj
Subject: [Buildroot] [PATCH 042/102] package/x11r7/xapp_fslsfonts: bump
 version to 1.0.7
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

https://lists.x.org/archives/xorg-announce/2024-December/003563.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash | 6 +++---
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
index 20573576c9..cc25b854b2 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-September/003210.html
-sha256  01cb0c5a7dbddadef846ca3b52c2ab9c60f2c32c3f16584cd97a6c7f293341ee  fslsfonts-1.0.6.tar.xz
-sha512  1181a8e6cc820410d1deac98b3e5097506e4168c6515307b6b9aaf705cb57193a009cb331a51d46ce68e9548712f122b5c942d5a1bc1e01bdd191b7b1beab09e  fslsfonts-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003563.html
+sha256  67cddb1aa7fccab5d107beef32fa2c143e8a132a2b974a557557b24c6f306b63  fslsfonts-1.0.7.tar.xz
+sha512  e907e3fc1fdbfe72b7c1a502ab479ee2ff4d8577dc0c86152dee5ee48471e514d7c5749707ceb936027cbd93c68a79a0be30334aeb1f812549907c2726e38dd0  fslsfonts-1.0.7.tar.xz
 # Locally computed
 sha256  fbdfcafb5755565ad688bf3f7f808109d358040ec83ed3de496155105451fdf4  COPYING
diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
index 1b8d630124..cee58ec7a5 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_FSLSFONTS_VERSION = 1.0.6
+XAPP_FSLSFONTS_VERSION = 1.0.7
 XAPP_FSLSFONTS_SOURCE = fslsfonts-$(XAPP_FSLSFONTS_VERSION).tar.xz
 XAPP_FSLSFONTS_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_FSLSFONTS_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
