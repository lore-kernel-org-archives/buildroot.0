Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3EFCD4F3C
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAD61606A6;
	Mon, 18 May 2026 18:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKYLdHwVfOMg; Mon, 18 May 2026 18:07:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B816F60693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779127651;
	bh=/p0ScDSewlp7vF8uKHH06L5biH2ild1t63zSnTrFM7Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lNJyEjtt0bOForfrGT9aOBhsRa6WD2S9qXUWoLbfSBtm943sDGIN9ivgIiEwj7UOT
	 +vXClXqQBZPwkOaYP9qlr7KRFFyBFhIEQTOxxmuWfv2clSsN8n85qisjhm8WbBrMc8
	 Fd4n4onLUNL/2/0DgO1mZqygKd+AXgRD9E7pzC6hNyc0eydEDIuGKzeH6tqLi4wsI1
	 hXQqL0/pXNaseCfT1cg+B6sRQOgDd+gn8q9oQIKyX78U+IxGRJRjROUMMetBrHYilE
	 YP+NQyWH6OzqyrJ0/DwgWkt4xcmsghigsDHkPAV8FHS2NYLJjLLqJLrmUO/GBTK3ne
	 dxDgyyK1aeGyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B816F60693;
	Mon, 18 May 2026 18:07:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C51B1B2
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02CB04060F
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVVV7XyRJJOl for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:07:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F06BA40619
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F06BA40619
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F06BA40619
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:07:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b8c8.dip0.t-ipconnect.de [84.161.184.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C78EA4C02BC
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:07:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48348)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wP2NC-000000007KJ-1FIP
 for buildroot@buildroot.org; Mon, 18 May 2026 18:07:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 20:07:26 +0200
Message-ID: <20260518180726.110871-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779127646;
 bh=i5dstftVCO8q8HUEuQym3haUZMiASXuwICpnLMVCPNg=;
 h=From:To:Subject:Date:From;
 b=qGbvHnavUL0qcER/ljOThEKr4W5YJ74+LkQdxEAiRhbU3wxh8mbR0eaY+VQSqR0UQ
 hjMIT6PmZTdCx8QOiZRYlCj2B9+cI1v0iEwg5Cblem6cQl/b9tbBemKwzS+wgApkaR
 GzV+XUVKGki/AroZ6CGfK2S+LFZJoHR6QUW2O4cB144pJ4ZbdUieR3pxObYv27iETR
 uaa/VFiEDQ8GH8tKQTdpDaCNqkG8gJcYnQ+hbgRdVxsVXwEajYUPVOdW0NeX/mtgj8
 fzuzoKeweom29P/WN51bMKEMkjKo6Pal22O+OFPvbNn5WcqNsro7ISWeap2bNBWG4O
 8GTU1pmuM7FZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=qGbvHnav
Subject: [Buildroot] [PATCH/next 1/1] package/utfcpp: bump version to 4.1.0
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

https://github.com/nemtrif/utfcpp/releases/tag/v4.1.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/utfcpp/utfcpp.hash | 2 +-
 package/utfcpp/utfcpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utfcpp/utfcpp.hash b/package/utfcpp/utfcpp.hash
index 4b43eb330b..bde4a223f4 100644
--- a/package/utfcpp/utfcpp.hash
+++ b/package/utfcpp/utfcpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  397a9a2a6ed5238f854f490b0177b840abc6b62571ec3e07baa0bb94d3f14d5a  utfcpp-4.0.9.tar.gz
+sha256  9a45cbeefacf512879971eaf57fe52133b73a0152d5354f3adeaf8d103cff0f3  utfcpp-4.1.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
index 72a590eeb3..de6d6f6f86 100644
--- a/package/utfcpp/utfcpp.mk
+++ b/package/utfcpp/utfcpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTFCPP_VERSION = 4.0.9
+UTFCPP_VERSION = 4.1.0
 UTFCPP_SITE = $(call github,nemtrif,utfcpp,v$(UTFCPP_VERSION))
 UTFCPP_LICENSE = BSL-1.0
 UTFCPP_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
