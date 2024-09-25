Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE0ACCF9E8
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 16:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCC1061194;
	Wed, 25 Sep 2024 16:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqkkh1RaiRsN; Wed, 25 Sep 2024 16:53:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DA05611AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DA05611AB;
	Wed, 25 Sep 2024 16:53:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BBBD1BF3C9
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 16:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1872F84AAC
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 16:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9wb1Li7l-x5 for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 16:53:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 868B280B73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 868B280B73
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 868B280B73
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 16:53:07 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 455AE440FE1;
 Wed, 25 Sep 2024 19:50:34 +0300 (IDT)
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 19:52:59 +0300
Message-ID: <6dfb1699dfbfa78e9b6c13701e0ab88dfcc5e8ce.1727283179.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1727283034;
 bh=LFqg/yu83xBSc5JgHegM5jM20r+5spg5cDl27GTd4hY=;
 h=From:To:Cc:Subject:Date:From;
 b=XfCqQGI9UgV3p9uPFXNmT6tzQG3vTt5KdhZQNZW1aometFCwF5Q7HKbLGNIdX6lJv
 f0gYjw/vi4btwJUNTlephdhpWMOaS+Q5XmSCCr5NRiGkOz/EKmSn4wu/Pb7hxU1uPt
 eVA+b72UJtR9HoZOgwuX82kgBQKcznFSj/5D7cUJws0ENz71HrW8Wan7hWa2AM9zif
 ty1eJ7Poq9YSqbwRG27MX/nsdfmwCTxeD8noQcbV+fBY1shqAVymQKw0g7mxWIXYyU
 XJ2vJDUTUFRRRve95pr49Ea2b2lnuX6emXLjDixIWbjJzYp0O8kxI0FD9ldnyPYAq4
 PPJ/7B4TduGvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=XfCqQGI9
Subject: [Buildroot] [PATCH] Revert "package/cURL: fix static link whith
 openSSL"
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 61d322c3d258072460fddbab0b39c8bf4cc3e0bc.

Upstream curl commit f057de5a1a950 ("libcurl.pc: add `Requires.private`,
`Requires` for static linking") deals with proper pkg-config
configuration since version 8.9.0.  Our local libcurl.pc modification is
no longer needed.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libcurl/libcurl.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index b81e3551951b..9bf7724e7d54 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -190,11 +190,6 @@ LIBCURL_CONF_OPTS += \
 	--disable-tftp
 endif
 
-define LIBCURL_FIX_DOT_PC
-	printf 'Requires: openssl\n' >>$(@D)/libcurl.pc.in
-endef
-LIBCURL_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_LIBCURL_OPENSSL),LIBCURL_FIX_DOT_PC)
-
 ifeq ($(BR2_PACKAGE_LIBCURL_CURL),)
 define LIBCURL_TARGET_CLEANUP
 	rm -rf $(TARGET_DIR)/usr/bin/curl
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
