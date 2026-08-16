Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA4AC5DF6A
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 07:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 986BE605E6;
	Sun, 16 Aug 2026 07:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZsRqhxCtyUly; Sun, 16 Aug 2026 07:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD6E2605EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786866766;
	bh=waOdlIa+XyuZEknhOhyYDjnS8xWjeJQGJ7jFPhQZjKA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T325MxiYZneyfn9vE7LoJ/gaUDmHwg5eKw44FgPbvK69UYLoNjJ4bmF0+qUIN4KM+
	 qk5sAPd6sMnE+rpVFQXZ5n4W62gPVl8gT9xeiqfb15Ln8PvLAWxjhe61e6NPlSSFpQ
	 VD0KC7FmvPad6DYAts0essGSkCZUXFMkV7ZR5bBDeK52p6U7y7cnPY379MNLE191Bl
	 QsDdrTezPjspvlLRy0F+1YqlsKSfefgxPjHP69W89u70QElbZkH0+NIGoO3Vne6PF8
	 /DGlGbyO3VmwEmprZYPP5pqLacgN2/VW2J0vWdsjrO8h8pYLFtBuZV4XxX5zfaeNDB
	 air2l1aLN72Ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD6E2605EB;
	Sun, 16 Aug 2026 07:52:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01C974CD
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7BE640714
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 40KOTXD9NLqD for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 07:52:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE95F40712
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE95F40712
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=NbcZ9vKw
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE95F40712
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786866762;
 bh=N/vHX8FiNl6LkPQO1M6XqwCaXIubqzNSWUvK5j2j+Yk=;
 h=From:To:Cc:Subject:Date:From;
 b=NbcZ9vKwNLxGjYkzledYYx3ubFnQxs/5N0r6tXyKEPitqVfIhOrDtiH2NPexbN0Wy
 mAwfmg+dh4hZIFai65P7JGz8EA4O4rsIgGxCclympv5Lmf62sefPI4DSok6PyCBona
 7O0gM6ef5npKSgdpbXO+/g2mxMJRnl7cFO6RD3eS3pYLBsPj+dAMQwxAJN7w5AOjkf
 CTwOzGkrS25BvATBNVb1NAXEkuzBh1aFcbbwvphfJJRrWUp8JVbn+qSLr9HbbV5MrG
 QxYROUqIyMZdP7V4o+m9aqEUYtsb0+qBYtGv8BoghzqC83XPBc7IihdGUHjeWmF523
 sdpm59XNPfDdQ==
Received: from fli4l.lan.fli4l (p54a1bf47.dip0.t-ipconnect.de [84.161.191.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90C74A4C2710;
 Sun, 16 Aug 2026 09:52:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53896)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wvVfd-000000006xI-42bI;
 Sun, 16 Aug 2026 07:52:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 Aug 2026 09:52:42 +0200
Message-ID: <20260816075242.1844454-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.8.3
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

https://github.com/libexpat/libexpat/blob/R_2_8_3/expat/Changes
https://blog.hartwork.org/posts/expat-2-8-3-released/

Fixes CVE-2026-72522.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/03a6eb81dabfadc5286ae1a9075fa255f118554b

 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 2087133382..c5a8816f9b 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_2
-sha256  3ad89b8588e6644bd4e49981480d48b21289eebbcd4f0a1a4afb1c29f99b6ab4  expat-2.8.2.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_3
+sha256  f6256df90c906773d344da084402b7d3e4f22ed41b1a59c989098a83d3ea0c85  expat-2.8.3.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index fb25a4a47b..7645edfd52 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.8.2
+EXPAT_VERSION = 2.8.3
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
