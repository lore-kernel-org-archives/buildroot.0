Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B55FD3E778
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 21:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 133CE80F1E;
	Tue,  5 Nov 2024 21:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wjd37KWEoDj; Tue,  5 Nov 2024 21:58:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23E178115E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23E178115E;
	Tue,  5 Nov 2024 21:58:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EAECB8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 21:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CDEE60881
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 21:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r4ygTAyYNDrO for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 21:58:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F241D6089F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F241D6089F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F241D6089F
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 21:58:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0255.dip0.t-ipconnect.de [91.58.2.85])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9F063A4C2E59
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 22:57:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51816)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t8RYf-000000008M3-3TzT
 for buildroot@buildroot.org; Tue, 05 Nov 2024 21:57:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 22:57:51 +0100
Message-Id: <20241105215753.3077420-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730843874;
 bh=cdWFjb0m9IbRjTcn4hHxwcoUqNMg+EdbcB8SLZNLOHA=;
 h=From:To:Subject:Date:From;
 b=o/GaH4l/JhmFjNkIjeke/3h21ESHajlWLLCa+jURzN6jgj8ULx5DdrXtw9OzHkNO6
 gsCzFiae8AqkuggkwTa76SiFfuKP0hIJ5oY6nYk30kGIHvDzo0432RFLQGKlK6PZ2N
 URfCqkkczrSj1mleUE9/vcwPP0BSl/eNfb0R2Nxrb8211geTEZLPrwU8c0l15FAyf0
 LqXWZAfaXkbegpUHSqnQcmZdw1/TxuprxpKoOwrrAtQEs/5032E9LlgzUeTsJOHRGZ
 ET3N6TmKVltvb+ixbwhR88yAKQ9m+MvO77jY984oc1JUhAQewoDd49N26k075PYl2s
 lWwKr0YL4izcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=o/GaH4l/
Subject: [Buildroot] [PATCH 1/3] package/kodi-inputstream-adaptive: bump
 version to 21.5.6-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index f38a02db45..a80c87124b 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  43a65b6673442fff79febeb40f033482f1c3a9e335f15d7d821ed4442f9baec6  kodi-inputstream-adaptive-21.5.5-Omega.tar.gz
+sha256  8bd781ba3012966f6ef45a085d6e09d7feee1cefe582d96563c7661affb68551  kodi-inputstream-adaptive-21.5.6-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 0db7423974..96ae071745 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.5-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.6-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
