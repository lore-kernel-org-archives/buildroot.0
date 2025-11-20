Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF3ACFA441
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 20:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55A566F532;
	Thu, 20 Nov 2025 20:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psDo3f2rkwHh; Thu, 20 Nov 2025 20:52:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E66FD60644
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E66FD60644;
	Thu, 20 Nov 2025 20:52:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB569117
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD3724279D
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TjtHpd3_18oM for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 20:51:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 149DE41111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 149DE41111
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 149DE41111
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:51:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca64.dip0.t-ipconnect.de [79.214.202.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 47C58A4C753E;
 Thu, 20 Nov 2025 21:51:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48018)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMBdB-000000008Nb-379f;
 Thu, 20 Nov 2025 20:51:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 20 Nov 2025 21:51:53 +0100
Message-ID: <20251120205153.1089946-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763671914;
 bh=B2aUJ31bXHOWVoprdw7VdH0XVhrK/szTPPkFe1YFKK4=;
 h=From:To:Cc:Subject:Date:From;
 b=u49XH0uydrU1EiEYmDAdAXbZ/jS3fglZEUUfKH8QgvqHBYFXFo9qg9UAzTVIvt/nO
 XCrgzuCJOuBjCHUnKm5hmDwgdfmxwLg1kb3tbKUEQn77hoQxIh6ZIWYgJArKKl/r6T
 +rul4ronKVuZj0TsJUybrzUIoyPv9cUTdRBhBBLM3esNfiLOczE5b4DArxcPiTrf4E
 yLGt73qIGmJBVQmUSZCubZY0m+qAceR/2sauGtxtDWtZzbRJRHCfIFfFiBMBuBdpA9
 T86O5GYUQsInVIdMWyD+/0JtkJWk0wVo1dmAdJytSdzOlVUFWbdo3Zu2ZesITi0oqD
 M7Zzp7qu9xAHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=u49XH0uy
Subject: [Buildroot] [PATCH 1/1] package/php-xdebug: bump version to 3.4.7
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

Changelog: https://xdebug.org/updates#x_3_4_7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php-xdebug/php-xdebug.hash | 2 +-
 package/php-xdebug/php-xdebug.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-xdebug/php-xdebug.hash b/package/php-xdebug/php-xdebug.hash
index 251b79ab77..9470a7d4e8 100644
--- a/package/php-xdebug/php-xdebug.hash
+++ b/package/php-xdebug/php-xdebug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4eb4ee270bbcc5f14195c38f6ee58580e007cf4886ce32e11430318ab5bc2315  xdebug-3.3.1.tgz
+sha256  7592923501e3fdb9741ad35b90e08fc6b3c5dd31eadc4c83b7b3c9dda0627b24  xdebug-3.4.7.tgz
 sha256  bc2aee27f3f0806be39e329d284ddbbfb14602a49af261df305dd6122d988eb0  LICENSE
diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index 771b96534a..272d331f7b 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_XDEBUG_VERSION = 3.3.1
+PHP_XDEBUG_VERSION = 3.4.7
 PHP_XDEBUG_SOURCE = xdebug-$(PHP_XDEBUG_VERSION).tgz
 PHP_XDEBUG_SITE = https://xdebug.org/files
 PHP_XDEBUG_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
