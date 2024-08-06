Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E347C3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 13:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01F1B400F6;
	Tue,  6 Aug 2024 13:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ff1je_JmWhhS; Tue,  6 Aug 2024 13:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B931340519
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B931340519;
	Tue,  6 Aug 2024 13:35:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4BE0B1BF300
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 13:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39C5A80E94
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 13:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZPHA0bI16YR for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 13:35:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D62C680B84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D62C680B84
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D62C680B84
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 13:35:56 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0B64C35360E9; Tue,  6 Aug 2024 15:35:54 +0200 (CEST)
Date: Tue, 6 Aug 2024 15:35:53 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrImuaWe+ZTWX+9d@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722951354; bh=ZAwSUALuSHFSHdviZfspHJWegc8rxN29Ji1GHsm+THw=;
 h=Date:From:To:Subject:From;
 b=wZ8RZxVXGEdDHA2ncqil2I/RU0jRMLHh6XfG+RUzpzQk/UToQ//lhNEyoG4kB9WYJ
 q7Jms6bWJfVVgmVKWt2fSHA/q6b5haNWMEiKiVlvXVqIFS5PLxXy7HZbudfcEZs3w/
 fdsSxQ52x5R/lAjkLCigyTusYJY4SWQy2hjWM+VEB6PWc6Y71AWoBeAQHcOI69CoaS
 nfxIOiIkex0H6mzySCl7pkdVK2v3csYxdDJcbxPkoBzgUdkN0X1Ket19nKwdI80b9Q
 un5bbLwXlmrjg+FH77xxPrgBacferms+j+KP+UxDx8r8mt5B64fobAEWcOemvabuaU
 KWh4Komazu63w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=wZ8RZxVX
Subject: [Buildroot] [PATCH] package/libressl: disable asm for
 mips64/mips64el
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

LibreSSL fails in the same way as powerpc, so disable
asm too for these architectures.

Fixes:
 - http://autobuild.buildroot.net/results/788/7883ffe9ed96f38f9ca359e99a18a548b6f35c24/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libressl/libressl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 5a78ec839a..7e92ea3a11 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -14,7 +14,7 @@ LIBRESSL_CONF_OPTS = -DLIBRESSL_TESTS=OFF -DOPENSSLDIR="/etc/ssl"
 
 # Otherwise fails to build with undefined reference to
 # `bn_mul_add_words'
-ifeq ($(BR2_powerpc),y)
+ifeq ($(BR2_powerpc)$(BR2_mips64)$(BR2_mips64el),y)
 LIBRESSL_CONF_OPTS += -DENABLE_ASM=OFF
 endif
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
