Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDBFF46C66
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 18:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8EA860B30;
	Mon,  6 Apr 2026 18:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXo2SpWF6pfd; Mon,  6 Apr 2026 18:22:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3353760B1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775499766;
	bh=gj+UbEy7J0mWzUu4stT15ejwG6dhv0kmBanFb+Y40KM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Su0G9AxQ50Sz5LZDN1yEB3MG2AVujGC8zd9RjhPawlZ8/UOOuaxU5dUEfdc2MeE27
	 rLKq4+FLDbl6D260duM3v7B9gZxJ0ccDsa+lBv8juvaY2MujN/WvsIyuf3V4FGkrSp
	 +b64Ui+dBFHM5rYvl/dYOz9Y+Rmpciplmab8c4wRZaBvWeNksqHxjZ29/7vtfskKSQ
	 LL80pSchWR+FAqxGQ+xGXoj5fTLJfHlp7zcNjkLoQ2OnXgBUCJ5xuyYI7FLcioGdsH
	 R8wYzTeSZl6s04gboG0mnJg9eiENHVJdrEve3jHdCqbvm4Rfm+uP2hWg54/6qjHk1v
	 PcAH55UzTzTfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3353760B1D;
	Mon,  6 Apr 2026 18:22:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CBA931EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B184E81046
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCqFDc5QE4Nc for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 18:22:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD82D8103B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD82D8103B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD82D8103B
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:22:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 939E9A4C395B;
 Mon,  6 Apr 2026 20:22:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40236)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9oaX-000000001kA-0ze6;
 Mon, 06 Apr 2026 18:22:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon,  6 Apr 2026 20:22:07 +0200
Message-ID: <20260406182217.1853895-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182217.1853895-1-bernd@kuhls.net>
References: <20260406182217.1853895-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775499737;
 bh=K/0v+co70K9k7xAxZWEmfsiiJYdtUDdQE18BfnppI3A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bAl/TXHIjcd0m6XGRS8YHB8dIh7Ydo1s5d7qzhwPxzCzrj1i6qaF53dDMAHfP83T8
 Hsflz8sZUKroFaiglrZAyRjXsYXSTqXtsOI6GvVUBZrqvqtz4vVsi1EDQUER9T9l++
 178i5QnzFVd8HHpS6Wv7KVwqGs0XsgvyU5ZgOLMMWBNxqSJib2BDiclWz/q7lzul9T
 nFQsJFpK78x9PSaw5PNuicX4LIn2cx1gE5ftltMZx1uvIk1ElTJzqPJqo90TkArv4A
 78AYqSfOE/QPk5I1BdVEI/dP74YVtPwYtuT7fIGoYvmNumdNNQK741AnsQCo9bBRj3
 qSbAHrCiTVdiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=bAl/TXHI
Subject: [Buildroot] [PATCH 03/11] package/sngrep: remove optional support
 for pcre, keep pcre2
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
 package/sngrep/sngrep.mk | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 5399d041b5..1c812e0a07 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -16,7 +16,7 @@ SNGREP_DEPENDENCIES = libpcap ncurses host-pkgconf
 SNGREP_CONF_ENV += \
 	$(if $(BR2_STATIC_LIBS),LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --libs`")
 
-SNGREP_CONF_OPTS += --disable-unicode
+SNGREP_CONF_OPTS += --without-pcre --disable-unicode
 
 # openssl and gnutls can't be enabled at the same time.
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
@@ -33,12 +33,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 SNGREP_DEPENDENCIES += pcre2
-SNGREP_CONF_OPTS += --without-pcre --with-pcre2
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-SNGREP_DEPENDENCIES += pcre
-SNGREP_CONF_OPTS += --with-pcre --without-pcre2
+SNGREP_CONF_OPTS += --with-pcre2
 else
-SNGREP_CONF_OPTS += --without-pcre --without-pcre2
+SNGREP_CONF_OPTS += --without-pcre2
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
