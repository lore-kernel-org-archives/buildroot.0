Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954B0E7DEEE
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EE61606BD;
	Mon,  2 Feb 2026 14:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5VGj158tKd0; Mon,  2 Feb 2026 14:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A12A6072C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770042516;
	bh=XECesCFjG5qxu7W+s9NDEYGw79uL5bCTAEyjOdbLqas=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fffGVjMAZvS2HrB44LEzbwxD/5hFgem7OOpFYE13GS7F2YKGSeQsFj9vGmTEEcEjl
	 Wame0FilfseQhCj3rh3WKpZpwdvl4DmI6/fl9LeDVTM72PNUgba4OvyUZWZ7yZb1xJ
	 e0nclC3TRRdD9qKtc/U9Nb5DY5rQYZ+StYzL8wA6H4bG14i6/iXHkq54p98zoe47mu
	 C9vEqyPrA/0d/qILfF4Vvh6Y/2yIuw/58VMNfbq7UmH/jEYGeu8xHuqKtxVOJ0VFz/
	 2TT5P0Mv2tohQW6YW86UrQvbG4PzSQGzXZlgaxvJoKe844Ft8nL42a/veoOKEguqsP
	 +esJMrd5muMyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A12A6072C;
	Mon,  2 Feb 2026 14:28:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FAAB23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 027AC820E1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gx0OgPId8JGl for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:28:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.90.104.147;
 helo=esa2.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFCFE81F1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFCFE81F1A
Received: from esa2.hc555-34.eu.iphmx.com (esa2.hc555-34.eu.iphmx.com
 [23.90.104.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFCFE81F1A
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:28:32 +0000 (UTC)
X-CSE-ConnectionGUID: heh8Bv5cTCCfrBKXAzX7fA==
X-CSE-MsgGUID: 1tBgm21VQTO8/qDVd66o+Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
 by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 16:28:31 +0200
X-CSE-ConnectionGUID: 0lLQ+oGBT6Kj3J6mDt8DDA==
X-CSE-MsgGUID: mhhvFDnDRbGMs+JukHuXPA==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.2])
 by ces04_data.me-crop.lan with SMTP; 02 Feb 2026 16:30:38 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Mon, 02 Feb 2026 16:28:29 +0200
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Mon,  2 Feb 2026 16:28:25 +0200
Message-ID: <20260202142825.2804939-2-jimmy.wesolowski@mobileye.com>
In-Reply-To: <20260202142825.2804939-1-jimmy.wesolowski@mobileye.com>
References: <20260202142825.2804939-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1770042513; x=1801578513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ReWSzsWNmwrHijSSbZOveB5bU2a2APPg3zGQ76nHW2o=;
 b=UcP56l9/rOtMDeOeFqxYZRLpuTbrCPxxIInm4Hpw/0nDbUmc7tc0Y+dy
 3uMcKGYMT94ax04Zze2IDw3GkTGryf9lqpr9HJ5vgbPz2l57S5343slE8
 7jf4p5ijwhU/J+6DkFHBnDZyFE3n13aiRaIVwH5xv8bkzd5uoL2/+002T
 DVZDnGgvPccA26bRj6S5MPinuq6LfNmdRs3JpSdBNrzlw9mIvLHXADiFj
 KLsLgnR5GNZECJb1PcOM3c01xrDkihGJYJijSatih27eW/JFlXCg6y+kt
 T/E6lpLGt8WYokaM7jlxJynNgCl1PUVfTSnUKEKTd8ujVNgNDFkce417A
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH 2/2] package/pkg-kconfig: add step_start and
 step_end
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds the step_start and step_end calls to enable the
GLOBAL_INSTRUMENTATION_HOOKS on kconfig packages kconfig-fixup stage.

Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
 package/pkg-kconfig.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 136fe6c490..0af4ab09e6 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -174,8 +174,10 @@ $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG): | $$($(2)_KCONFIG_DEPENDENCIES)
 # In order to get a usable, consistent configuration, some fixup may be needed.
 # The exact rules are specified by the package .mk file.
 define $(2)_FIXUP_DOT_CONFIG
+	@$$(call step_start,kconfig-fixup)
 	$$($(2)_KCONFIG_FIXUP_CMDS)
 	$$(call kconfig-package-regen-dot-config,$(2))
+	@$$(call step_end,kconfig-fixup)
 	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
 endef
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
