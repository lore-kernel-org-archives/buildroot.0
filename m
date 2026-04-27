Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EACFF8860
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 06:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7983742EAB;
	Mon, 27 Apr 2026 06:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pK3_mSkfF7Ls; Mon, 27 Apr 2026 06:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A38C342EA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777270611;
	bh=S8mvDD4Mquqt1eLD+hq2738B/LurPn8PdJrdXtLZgNs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hq2L3yEGbEJsRW3ypdFTN09VBibis6hV7F8VmvJpndcWkzG1PCwI8+iWpnhMYEAXB
	 B5RwVsavblUuwiM+UkmwoL+s25XtaOIagVSax6XdiddEIOQWPDueGcfWq3n4VzsvWE
	 mOsaLZ4J5aEqE0e1IvSoBlOav4eH4MbRevC6dsvsUBq+wm0kWgr5nOcWkuAR/pKgP5
	 owmBiMYt/duqGD9lYUqExYbeGuMdRAjzP8sAmJTJ/q0dlfxEfUrXxSJ5rRiYtwxPLS
	 1WXp3pDccANVE2ALokU3YFh1NEcndgDCLLY49wlurQE1g5zXe0+jGWoKSUiBNckV0W
	 JM39lYvW+IOLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A38C342EA3;
	Mon, 27 Apr 2026 06:16:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E091A1B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 06:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5CB342581
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 06:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODEbDeGU8ur1 for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 06:16:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B6477400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6477400B8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6477400B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 06:16:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C0F0A4C084C
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 08:16:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53336)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wHFGw-0000000017h-2rKI
 for buildroot@buildroot.org; Mon, 27 Apr 2026 06:16:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 27 Apr 2026 08:16:47 +0200
Message-ID: <20260427061647.390951-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777270607;
 bh=zl7+Sj4OHuStj3SqGetJm1KgJvfNd34rI7et75ftY3Y=;
 h=From:To:Subject:Date:From;
 b=uIGSGdXcD19XTBFO6dbiHhBhFUE4D2vFXMpvi5IyR1+LjpBiV1yfG4WzQRB8n0ntl
 Q2GamcLcBOrgYUtPX3bBDVMJepo1bT40tX2l7l/2rkbgBXEZzc3dfsnghpCcjwJx+U
 XdSyTr55ey1F98oRUIooCno/Y/wN/lubiMZENFhIpXXL9uy1aHnPgKIO8FPnOMV01V
 phVvWPjChh+wuLTVrxD4g00HOFBTT33lA1EB4Z18DuODTgGcy8ZHozdXmnNX/6Zu/q
 YjmtIlS74XrfuZ3+fr4Zxc87VCS6W8RtZP1LuSzVjpncs/dA7zY6DoJSqYgOleJpCB
 QQjhcMuy971hQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=uIGSGdXc
Subject: [Buildroot] [PATCH 1/1] package/libunibreak: bump version to 7.0
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

https://github.com/adah1972/libunibreak/blob/libunibreak_7_0/NEWS

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libunibreak/libunibreak.hash | 3 ++-
 package/libunibreak/libunibreak.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libunibreak/libunibreak.hash b/package/libunibreak/libunibreak.hash
index 8f1e7d292a..ce3cdfd8a5 100644
--- a/package/libunibreak/libunibreak.hash
+++ b/package/libunibreak/libunibreak.hash
@@ -1,3 +1,4 @@
+# From https://github.com/adah1972/libunibreak/releases/tag/libunibreak_7_0
+sha256  8c9a6e121736cd0d5c890ae3ae96f3f4010a19aa040f1dbded833a62a87717d3  libunibreak-7.0.tar.gz
 # Locally computed
-sha256  cc4de0099cf7ff05005ceabff4afed4c582a736abc38033e70fdac86335ce93f  libunibreak-6.1.tar.gz
 sha256  0c57e2ec42ece17791a75d2f9b2f8e0663181be008667a507f765b3ef22522db  LICENCE
diff --git a/package/libunibreak/libunibreak.mk b/package/libunibreak/libunibreak.mk
index de3ea0fefc..d508f19eec 100644
--- a/package/libunibreak/libunibreak.mk
+++ b/package/libunibreak/libunibreak.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNIBREAK_VERSION = 6.1
+LIBUNIBREAK_VERSION = 7.0
 LIBUNIBREAK_SITE = https://github.com/adah1972/libunibreak/releases/download/libunibreak_$(subst .,_,$(LIBUNIBREAK_VERSION))
 LIBUNIBREAK_INSTALL_STAGING = YES
 LIBUNIBREAK_LICENSE = Zlib
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
