Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871D1D3B7EA
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 09:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8489E849F6;
	Tue,  9 Dec 2025 09:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBn-xTt81Izx; Tue,  9 Dec 2025 09:41:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCFA08497D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765273304;
	bh=bOQqyE+G4MvWGtOUMMkXz3+uuSx1lpin2PceYSjZArA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iX+VHtWMAO+b1yZOIaUlpmwuc1uQEyKcPTgn9DySvCUx32MoTiEDyWBQBxLSB9PC2
	 up5B91mHKvCaeWyMz+7FoG89VosUJy7XibkXFx6ks/bYrKr4d/1YTh7pkA+FSgsgTL
	 y+lnqklbFJsxptWiAgFUucwDHYxABxRMCuSTI144iS4zmt5gg4aOKKFgq3vdq3Y3Nm
	 vZ9RUBW5D6PBbladcezqEnd7pPmu94no6HIhn7BGbW6CfymxCVdI52CxeJ1l9LDfT6
	 cm1QIYRYeSLQyBLGCWvgN5HFUJ+of35ZBYKrlTkx2+Gs1JTzhz06OFxFFeP5oYFbFO
	 LnUEkHWDerD8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCFA08497D;
	Tue,  9 Dec 2025 09:41:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C68C151
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 09:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DB6C61226
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 09:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIn1huJXISf9 for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 09:41:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.87;
 helo=smtpcmd0987.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3EABB610D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EABB610D9
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EABB610D9
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 09:41:39 +0000 (UTC)
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba SMTP with ESMTPSA
 id SuDwvt2W94bDkSuDxvjJtE; Tue, 09 Dec 2025 10:41:37 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  9 Dec 2025 10:41:35 +0100
Message-ID: <20251209094135.653478-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEwVlIplUcHFa3ply9mbe7/L4EOFHhBfMQu+mLXA0YrotWKjlQ4P5zK6jRwl02azwrHUZBz3Ncr6waibTcUaBjfwnkOTHl2Av2svjty13A3d2u+LxM+C
 TmVRCxIEsY38EzUK7cOjq0Hfz1ifnYAT1rmgnKJ9MfcKufUx+KRRXRHVvzy/Zm3LuInhgviwk823DlgIt8i6LHYRVtPQHUQT+C1XbcjuQnRWyAnI63AzSa8t
 NqV/3Z7ne8KIAEX0HWZwF0zH3dFrt5Jm1jwP5zZuNDskf5sHbDMOhNPnnwBS8a7ZmMQcw3BQuVNTZsxCdEEHd0DTcyeci6BnbuDFGdDY84w=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765273297; bh=x34HwzxamCWIqVZ/XdpKe9rwOX31UAXTgmFV8r13OIE=;
 h=From:To:Subject:Date:MIME-Version;
 b=PL4npOwn4jaIIR6l2c3Gvsj0jNQO1+31im+6ufU2NTre+q99lmIW0j1VVpRW+4WYp
 fB777sd57sTbxFoOs71IlBHr8O4Q4ZEpfUnVM8YA6KXKzcwOzCqp+gNsZF/4yRXm+6
 3hj/lv/lpPmuPO0F/njYzxu8+Ml29Bn3qsWfGwy3z4kuSzNVpCJavsgX8fTkg3Fb8h
 RPy2OIV4vQuWRDXnLKP67XFgOfM8geQJ3F2upVW+WZUHCPcUeKvESYoNduoWqekEs7
 r51xpomoLwErGrgAPbmfs71goWOUw1mSZMyljZI308ebCpHi/CGN3NUcNm0uPu/McW
 xwIgClrjuAkAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=PL4npOwn
Subject: [Buildroot] [PATCH] package/rtl8723ds: bump to version 2025-12-09
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

Fixes:
https://autobuild.buildroot.org/results/52081e3a500dd2566af145e8c6d793df7f72d025/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723ds/rtl8723ds.hash | 2 +-
 package/rtl8723ds/rtl8723ds.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index c2691402bd..580f5d09f6 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  338f0fe08acdd1352428d86f88366935e1b967b134f252ac9a3e50cc8922fe14  rtl8723ds-546ffb2cb735e0c33e765936721bd66dd58e6893.tar.gz
+sha256  a04bc28cbaead30aca2894633ffa93d4bf0bf407a8c5b7120dd9832ceaf0310e  rtl8723ds-122a574f780da32bb0de760bf089a3a9ec1e8f87.tar.gz
 sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index 14938daaf6..d8072f14bc 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = 546ffb2cb735e0c33e765936721bd66dd58e6893
+RTL8723DS_VERSION = 122a574f780da32bb0de760bf089a3a9ec1e8f87
 RTL8723DS_SITE = $(call github,benetti-engineering,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 RTL8723DS_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
