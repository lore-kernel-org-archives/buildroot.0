Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B17C5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 09:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8220560616;
	Sun,  9 Aug 2026 09:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gb0ElryqgwPu; Sun,  9 Aug 2026 09:55:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC9F360644
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786269311;
	bh=xcuGFqWOfmcOzp7ISbvyj8mvU1Zz9x6/U6C6uRTOK6w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PjWtJYoYMT9w6haW18E12ItOv7EGRbn0eaxkKy/c3lttbgQP82g/MKEDMm/rRd0+w
	 pdSLvitYKolgqINxwU0pOKAkG6x4AGZMYsQpzZjHSATQ4SOy2gZ/LiocWpkE9FXRGi
	 xf39thhOKxJ2IV1KJEFj4RCoBR/k+w3IgY982MHKYTgolWJc2aYhUbzF7ZGcXGndKk
	 RhR3E4oaaz2FXh3UxXrkzNu95/xvC0UejyxO1LZMhJbhAJYxylGVeUE3Cdn24Hqfhp
	 xTT4eYIBiJr/0BsY/GUCCoqY099zM81DMaOm6oWedThRs+/8g1AM8S6Bm8/yTAi14Q
	 wVAyuQ5p7X3ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC9F360644;
	Sun,  9 Aug 2026 09:55:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E86BD282
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 09:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E298F400D1
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 09:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCaqGGwuwdXM for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 09:55:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 39C3E400CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39C3E400CC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39C3E400CC
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 09:55:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bda.dip0.t-ipconnect.de [91.58.11.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 34F62A4C2D5C
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 11:55:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35758)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wt0FG-000000006iU-0PP1
 for buildroot@buildroot.org; Sun, 09 Aug 2026 09:55:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  9 Aug 2026 11:55:05 +0200
Message-ID: <20260809095505.508811-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786269306;
 bh=pIkYjTRazULmO0LHzNfNATIiEwxGcz404QaiYt4oRkg=;
 h=From:To:Subject:Date:From;
 b=TyUJfxPdzacdZUtZvE3yb/GdZNF7AUzce8Idq3w5L0QYTaxNfgQBQ5wxdhiTLTR0Y
 gnVy6JrDEV0iMVP+6ZJI4NPBXhmX/j3OOetOKR/oDAO9xhX3PS6f6xs6KrSmGeB68r
 Hmjf0+q/q/ersGo/IciXJ/95kHvkDJMrovS4AAPR1q5RBfstkkvfRxeU1520vSE3DN
 f22ZVuFI7ksuc8FQAlAiRvBltELG0y1Y5imnKgW61xPLq4bUWTXzaC8j5zsBf+zGNi
 5ocQwlzdCX9eLcEV7lPYOy6kcCA9ukOLzzQxDROdwsgnFltrng1+JQ3+OU+R0ulVfN
 1atTXX3EGP73A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TyUJfxPd
Subject: [Buildroot] [PATCH 1/1] package/libssh: needs libopenssl for
 openssl crypto Backend
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

Buildroot commit 62103be918e7a155749b1b3b680a9e4ecba6af87 added

  select BR2_PACKAGE_LIBOPENSSL_ENGINES

without enforcing its dependency on BR2_PACKAGE_LIBOPENSSL causing a
warning seen with
https://autobuild.buildroot.net/results/117/117b3b38098df075d96167863d9f6b933a97eb64/defconfig

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBOPENSSL_ENGINES
  Depends on [n]: <choice> && BR2_PACKAGE_LIBOPENSSL [=n]
  Selected by [y]:
  - BR2_PACKAGE_LIBSSH_OPENSSL [=y] && <choice> && BR2_PACKAGE_OPENSSL [=y]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libssh/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index eaec754414..9aa2bfaf86 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -35,7 +35,7 @@ config BR2_PACKAGE_LIBSSH_LIBGCRYPT
 
 config BR2_PACKAGE_LIBSSH_OPENSSL
 	bool "openssl"
-	depends on BR2_PACKAGE_OPENSSL
+	depends on BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 
 endchoice
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
