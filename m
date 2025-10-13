Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF8ECCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 18:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 861B5413E9;
	Mon, 13 Oct 2025 18:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdbL-6Fqb1UV; Mon, 13 Oct 2025 18:50:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADA74413E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADA74413E4;
	Mon, 13 Oct 2025 18:50:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02ABBBC
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD0BF40A35
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qq6fK2cT9SW5 for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 18:50:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DABB7404C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DABB7404C8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DABB7404C8
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:50:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1338EA4C6880
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:50:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35646)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8NcP-000000006gD-1iYJ
 for buildroot@buildroot.org; Mon, 13 Oct 2025 18:50:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 20:50:01 +0200
Message-ID: <20251013185001.3619271-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760381402;
 bh=wVCa3+D3dJbGZ43mqqXboz7f+oWO8DDgJCE127AJV/8=;
 h=From:To:Subject:Date:From;
 b=0noKBtZM6BaciLbUaYNitxxoockeYSKIeWO52WSIqSJJTG114Y2UEyoVAoZewb5Lx
 tsdrlJ/q/LrMHZVncr9GV87V5vmHnCSyNbnjTOCF+VrAuXRvwV/yYyhJe6zIm6ex3k
 RxL9XTLUZ3bn9Jn1LAKRfz/L/8O7L8sbxPRVIHJyAGnM+ai6HeRFlwTy/SkVldaNxU
 J9oBTYNsh6swAnpI35CmF9G3yQV5JfRksAcc6rymMXAZNVN6vomws2P60qa2/ziVJx
 NJxLMMDb8aae8nstCkI7OmXIXxmsIWp13MOlNDkTWEWEH4ur7NbRtn3Ti55ulta9J7
 F7cTJr2Qg5Lrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=0noKBtZM
Subject: [Buildroot] [PATCH 1/1] package/utfcpp: bump version to 4.0.8
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

Release notes: https://github.com/nemtrif/utfcpp/releases/tag/v4.0.8

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/utfcpp/utfcpp.hash | 2 +-
 package/utfcpp/utfcpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utfcpp/utfcpp.hash b/package/utfcpp/utfcpp.hash
index 65b3ad2a88..d995899165 100644
--- a/package/utfcpp/utfcpp.hash
+++ b/package/utfcpp/utfcpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6920a6a5d6a04b9a89b2a89af7132f8acefd46e0c2a7b190350539e9213816c0  utfcpp-4.0.6.tar.gz
+sha256  f808b26d8c3a59def27fea207182ece77a8930bd121a69f80d328ecf3cfef925  utfcpp-4.0.8.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
index 3a4613841e..d3d7896813 100644
--- a/package/utfcpp/utfcpp.mk
+++ b/package/utfcpp/utfcpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTFCPP_VERSION = 4.0.6
+UTFCPP_VERSION = 4.0.8
 UTFCPP_SITE = $(call github,nemtrif,utfcpp,v$(UTFCPP_VERSION))
 UTFCPP_LICENSE = BSL-1.0
 UTFCPP_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
