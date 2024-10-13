Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3BECF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 08:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF998817C0;
	Sun, 13 Oct 2024 08:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yLtsHgOJ3zZ; Sun, 13 Oct 2024 08:27:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB4F181AC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB4F181AC4;
	Sun, 13 Oct 2024 08:27:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA5F1BF37F
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 08:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4729F606C4
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 08:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kElIY-gyVBaQ for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 08:27:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F04B1606BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F04B1606BF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F04B1606BF
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 08:27:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b41f.dip0.t-ipconnect.de [84.161.180.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 36181A4C02DD
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:27:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51266)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sztwM-000000008NR-436U
 for buildroot@buildroot.org; Sun, 13 Oct 2024 08:27:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 10:27:02 +0200
Message-Id: <20241013082702.19600-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241013082702.19600-1-bernd@kuhls.net>
References: <20241013082702.19600-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1728808023;
 bh=nG97Ze4WX1QXvXc4v7rMpvtiGqLWGCPdTOzlsoLFSAE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=wLndX+fc+2Su0LLdOXzemvytKMi3aTGFFkBygDz1diDqdryq14Tj4QbCrKeDi22gX
 O3aphvlpn2V99/db2YrBT61fzWHxHjena2lZmgpeBG0XsR4GGYX0XlKwI7eWUssInI
 6AsZSdo27rrcydb816BikOflbcPXrAYSe+FCqqQemt42fa+qBnjlVKJXMl8lJ42lhE
 x1IBxWnzTq3gHNzU0OofkQgqyQWYvfJHpJT1EeSF+5Z82rFalkH7Id8KLSizCQax7w
 KX7a0ilFBfZ8f7Cx9y44VPUvdQhz+oBOIEZCDiL7k8FUz1pfQ1ya38KZJU/bHyLonC
 gMiD401hhzEuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=wLndX+fc
Subject: [Buildroot] [PATCH 2/2] package/kodi-inputstream-adaptive: bump
 version to 21.5.5-Omega
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
index d1b64055bb..f38a02db45 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  022a85b8e5323d841c8786484f49d69f6cb4571e9752b74f39abe54fad8e3ec0  kodi-inputstream-adaptive-21.5.4-Omega.tar.gz
+sha256  43a65b6673442fff79febeb40f033482f1c3a9e335f15d7d821ed4442f9baec6  kodi-inputstream-adaptive-21.5.5-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 6ef2d69997..0db7423974 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.4-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.5-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
