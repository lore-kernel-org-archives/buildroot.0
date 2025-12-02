Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6E5CFD2F6
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 07:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B2FB60B1B;
	Tue,  2 Dec 2025 07:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldeXMQLkDLbq; Tue,  2 Dec 2025 07:26:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C045A60B7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C045A60B7B;
	Tue,  2 Dec 2025 07:26:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E59551BD
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 07:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6C5F60B7B
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 07:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 791iiFnnRO8d for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 07:26:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D85B860B1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D85B860B1B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D85B860B1B
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 07:26:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EBF8BA4C78E5;
 Tue,  2 Dec 2025 08:26:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQKmA-000000000XP-0ohj;
 Tue, 02 Dec 2025 07:26:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Tue,  2 Dec 2025 08:26:17 +0100
Message-ID: <20251202072618.958699-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764660378;
 bh=f1DHyePf/MzT/1D46svb51GAlFPWqteiV0d36Y3j7ig=;
 h=From:To:Cc:Subject:Date:From;
 b=fL48MecawVR34KASYrCo38bxHj7sRitCKDgPtfVSh+HYV4KsZBIOQ9Q8nKAebTYPT
 MWFD+CM/abjUbDr1Lxq61gCN5vOgvjfNEekmQuGTDS2WyUa/xqjXc/fBbxWeG5tFAQ
 0X1z6v9uqpza9COXJeNjHbnJaUXHeI1NnNHCSueE5LW6KSHFV6XB57DZnoVdBwGCfg
 MXNr5b4UCC6lhVcfVHDg18rFS+sXNfrFEr2jV7ci6mhGqK65yzFQ57BGSO2PZBaqUx
 e8VrKQw9Z4p88rLqNtBkDUImW359lhdEmoOjTDO6JFXe90AN/tvV7fwosD3+OJUDXH
 5wGfyq4WGrA2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=fL48Meca
Subject: [Buildroot] [PATCH/next 1/2] package/go: bump to version 1.25.4
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
https://go.dev/doc/devel/release#go1.25.minor
https://groups.google.com/g/golang-announce/c/tVVHm9gnwl8

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 1dc1b99756..2d59d74eb2 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  a81a4ba593d0015e10c51e267de3ff07c7ac914dfca037d9517d029517097795  go1.25.3.src.tar.gz
-sha256  acb585c13e7acb10e3b53743c39a7996640c745dffd7d828758786bde92f44ca  go1.25.3.linux-386.tar.gz
-sha256  0335f314b6e7bfe08c3d0cfaa7c19db961b7b99fb20be62b0a826c992ad14e0f  go1.25.3.linux-amd64.tar.gz
-sha256  1d42ebc84999b5e2069f5e31b67d6fc5d67308adad3e178d5a2ee2c9ff2001f5  go1.25.3.linux-arm64.tar.gz
-sha256  3992bd28316484be0af36494124588581aa27e0659a436d607b11d534045bc1f  go1.25.3.linux-armv6l.tar.gz
-sha256  68d1a08bf3567f330717d821b266a0be1c5080bd05dc238b5a43a24ca0c47d7c  go1.25.3.linux-ppc64le.tar.gz
-sha256  a0b5ccd631743f01230030412fdc9252b18d96b4e63d44ba1c4e9469e79cfcb1  go1.25.3.linux-s390x.tar.gz
+sha256  160043b7f17b6d60b50369436917fda8d5034640ba39ae2431c6b95a889cc98c  go1.25.4.src.tar.gz
+sha256  0cf5f721ab7c5e7a170dedb2b51d9b1fedfe6ef1b2c626bf7a47fb9a613c5d96  go1.25.4.linux-386.tar.gz
+sha256  9fa5ffeda4170de60f67f3aa0f824e426421ba724c21e133c1e35d6159ca1bec  go1.25.4.linux-amd64.tar.gz
+sha256  a68e86d4b72c2c2fecf7dfed667680b6c2a071221bbdb6913cf83ce3f80d9ff0  go1.25.4.linux-arm64.tar.gz
+sha256  ff86a6406310d840edb170f539a51a7efac0ac2b2f84527b1b2bf5935fc4ab6d  go1.25.4.linux-armv6l.tar.gz
+sha256  38c8ac8463537c99fbc1ef368f243b626144446c09db71b1d20634a4237c966d  go1.25.4.linux-ppc64le.tar.gz
+sha256  2482e7b3b924348b120b6d7d7c13035905c009c2a3ecc0c8dc56bf0fd3184a58  go1.25.4.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 85a40d4d36..6a280ef425 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.25.3
+GO_VERSION = 1.25.4
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
