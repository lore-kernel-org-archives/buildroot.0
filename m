Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467F8C531C9
	for <buildroot@archiver.kernel.org>; Sun, 26 Jul 2026 21:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB6484063A;
	Sun, 26 Jul 2026 21:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yox8cFImK39r; Sun, 26 Jul 2026 21:22:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 258A84064F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785100976;
	bh=O6Top6yV1TX9Ra9e6ZY+VcsMrmZnanTot3efQJwvMNU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mHt2FVDKgqv2l1m3GFVe3qASLdhXjBcAPZ+pmj28gXtvQEHcg7e4s62XvaJyDMNC6
	 w2SQQuB5M64Nha8R0hoCc8ZW/Xj5a9pAsAUZu++grBsKLWHE1PItUEw6IhxLKd/UJd
	 xzVAmmN37/wug9AqnC5eOYRGZALPwV9zquXB4MXvDaicweol+ovWwUAKMvtIVOjVh3
	 YQd6iqJRcOBvquc79YwYV7kwetzqV9TGV61ikVE/U0KCK2fBkD0oJqUhPDtEx/b09r
	 ctIf42E4gYqaoWNKydbvmpzfL+xNLEDrs4z9sl8RsfoBbvOC+UMJgDHd91Syovcswe
	 v7NnMdwyXPSpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 258A84064F;
	Sun, 26 Jul 2026 21:22:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 527C639E
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 21:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4449E4064F
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 21:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zkUVhwiqmcIq for <buildroot@buildroot.org>;
 Sun, 26 Jul 2026 21:22:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96E9F4063A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96E9F4063A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96E9F4063A
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 21:22:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0445.dip0.t-ipconnect.de [91.58.4.69])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 66E89A4C40B8;
 Sun, 26 Jul 2026 23:22:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42668)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wo6J7-00000000669-1uec;
 Sun, 26 Jul 2026 21:22:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Murat Demirten <mdemirten@yh.com.tr>
Date: Sun, 26 Jul 2026 23:22:47 +0200
Message-ID: <20260726212249.155140-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1785100969;
 bh=pgD3LAXyLYt28Wu8lMke2+DIOKw/uLiajcPcA1sG68w=;
 h=From:To:Cc:Subject:Date:From;
 b=oH1BRu9bFtY+9Fq3Js8HsG0B1NvqsoHKL+rXvFlxlGIU6A7aDcuLmRbZcHCRMdhHi
 sJyQeWxOUJO/b8B9dguOssai0dApjBPWYPwCUeQOnO6pkOAlOhx/qjgKFYvAROtnu4
 wklIPhW/xjvaRlRyg/Xn+su8Z3wkb3yZoUOYKHOMJTa4THtYN7yLX2X9AphF/GTk8o
 TXC455F5vnMl+jwcueV4in6pxUJTWZfV53HKOsLtwVLpsJh4QHOTQ++9jsCeYWLfSO
 ycId6QPJ/pyQaDZPlojks4bsGZXSr2VmjjGWWvbGcyBK8aQHJS3Q1xohuOcyL2UOxh
 xlqi0vUHi0u8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=oH1BRu9b
Subject: [Buildroot] [PATCH v2 1/2] package/jpeg-turbo: use configure option
 WITH_{TESTS, TOOLS}
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

Buildroot commit c531fe65209defd356e5ee8142896478a20ab371 bumped the
package to 3.1.2. This version first included upstream commit
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/942ac87e479c48199d48781e9a5b2cda3b910d7b
which added configure options to disable the build of command-line
tools and tests.

This patch replaces the currrent _POST_INSTALL_TARGET_HOOK with the new
configure option and disables the build of tests.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/5f39b7407f7f8aaadb9870a79b354fee7d4550ca

 package/jpeg-turbo/jpeg-turbo.mk | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 9a10110766..073a607188 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -15,7 +15,7 @@ JPEG_TURBO_INSTALL_STAGING = YES
 JPEG_TURBO_PROVIDES = jpeg
 JPEG_TURBO_DEPENDENCIES = host-pkgconf
 
-JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON
+JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON -DWITH_TESTS=OFF
 
 ifeq ($(BR2_STATIC_LIBS),y)
 JPEG_TURBO_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
@@ -43,11 +43,10 @@ ifeq ($(BR2_STATIC_LIBS),)
 JPEG_TURBO_CONF_OPTS += -DCMAKE_POSITION_INDEPENDENT_CODE=ON
 endif
 
-ifeq ($(BR2_PACKAGE_JPEG_TURBO_TOOLS),)
-define JPEG_TURBO_REMOVE_TOOLS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtran rdjpgcom tjbench wrjpgcom)
-endef
-JPEG_TURBO_POST_INSTALL_TARGET_HOOKS += JPEG_TURBO_REMOVE_TOOLS
+ifeq ($(BR2_PACKAGE_JPEG_TURBO_TOOLS),y)
+JPEG_TURBO_CONF_OPTS += -DWITH_TOOLS=ON
+else
+JPEG_TURBO_CONF_OPTS += -DWITH_TOOLS=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
