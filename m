Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0950AF9D0E2
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 16:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8A9342B05;
	Tue, 14 Apr 2026 16:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fo2nJJeKnT6B; Tue, 14 Apr 2026 16:07:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D303542B0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776182848;
	bh=elAHVHsOAayIdKGCbejZEVLdabDQCR1H7tQVyyjdUu8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Yr/eGGf2uXD5nAaexkK+8pza/1p27DJ+p2ETD0z5x9mfdu5nGfq4I5Fm98PYZG5Je
	 wTAQOrTbWdFtVT+pFb7UNsXmf4R63Ei+JzwWYh5X1DnNyG9oBysHIQA7q44te0Aj1I
	 cuGO3cpot6VWps5I6IVxG2N7TVPjignXLysFT0jdTnUomyXwCrco1qtfbLVPDhBL2+
	 FiGeM9XltelNg83LLIyUMSkPilFwt0oNsVsndhFE63U3mjD9GeVD97q7RaEXZNW7MK
	 BQ8Lihk6ptFesg2fnqvkA5P42OaYlzkSakeIqHKwP17hzb74OZAanK17bNJCGyG+dp
	 cR3W8AC5R43Xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D303542B0A;
	Tue, 14 Apr 2026 16:07:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80579283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E28784CB0
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HL8guOJA9qCa for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 16:07:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EDB6684CA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDB6684CA8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDB6684CA8
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:07:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1be9a.dip0.t-ipconnect.de [84.161.190.154])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EBB78A4C0F00;
 Tue, 14 Apr 2026 18:07:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wCgI8-000000003ZX-0txE;
 Tue, 14 Apr 2026 16:07:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dimitar Tomov <dimi@tpm.dev>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 14 Apr 2026 18:07:04 +0200
Message-ID: <20260414160708.2041081-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776182829;
 bh=zASB5lP1pZ0nU2Hp6AH/YeXQvGKXGETNFIasg+7m4Fk=;
 h=From:To:Cc:Subject:Date:From;
 b=BFlKgkukknqkrQW0Nj5sfbiYIPpttgrYnFnP3LJlLqH6trv9l4kJEGGE3IBYpCk0W
 tXyv6gwzfck8TyNgJfRKWTwPuxEt0GdKNwFxk75rR1M6pKtoofirMReRzn8N7rQSHL
 vR4HOgV2/oi8bggbXhkKjkPa0qjGwqTyH6KBv890cgQvF7r2/YxkGPnITa3q+jCsqP
 WaAAdG6C+ITb7gjqx5UK7T+5/mrAVMq6W545CiZuWTcV2f6NEghtA1hoP1Tl7DNzNs
 RqtWdiFjUC/xa2eQXonB5RVE8Ko/8cti47BuaxU/0wzZ8OII4/JoOuXQuRuT+WXiTU
 qELZdI36DcYdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=BFlKgkuk
Subject: [Buildroot] [PATCH 1/5] package/strongswan: remove unneeded wolfSSL
 fix
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

Using this defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_STRONGSWAN=y
BR2_PACKAGE_STRONGSWAN_WOLFSSL=y

applied after 'git reset 10a70b1af67cf79986c2e401f7a54aa850ea82d6 --hard'

replicates the build error
http://autobuild.buildroot.net/results/278b3f74c48c858ae368d59069752adb69c05246

which was fixed in 2024 by
https://gitlab.com/buildroot.org/buildroot/-/commit/89d512729cfa5b2ef5c5165492789ba4441add19

Note: The git tree was reset to the commit right before the fix.

Instead of using the fix mentioned above the build error is also fixed
when the buildroot commit 6c183754342e6bb73aeab3c8731789c73fcae4ad is
cherry-picked onto 10a70b1af67cf79986c2e401f7a54aa850ea82d6.

This means the build error mentioned above is really fixed by enabling
BR2_PACKAGE_WOLFSSL_ALL. Therefore we can remove the content of commit
89d512729cfa5b2ef5c5165492789ba4441add19.

This commit also prevents a build error in strongswan

wolfssl_rsa_private_key.c: In function 'create_empty':
wolfssl_rsa_private_key.c:450:18: error: 'RsaKey' has no member named 'rng'
  450 |         this->rsa.rng = &this->rng;

caused by the upcoming bump of wolfSSL from 5.7.2 to 5.9.1 due to
upstream commit
https://github.com/wolfSSL/wolfssl/commit/cd88a8ae88bac13019689c087755d826145811bb
which was first included in wolfSSL 5.9.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/strongswan/strongswan.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index fd46445df3..bb5fd2d217 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -101,11 +101,6 @@ STRONGSWAN_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_MARIADB),mariadb)
 endif
 
-# https://github.com/strongswan/strongswan/issues/2410
-ifeq ($(BR2_PACKAGE_STRONGSWAN_WOLFSSL),y)
-STRONGSWAN_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DWC_NO_RNG"
-endif
-
 # disable connmark/forecast until net/if.h vs. linux/if.h conflict resolved
 # problem exist since linux 4.5 header changes
 STRONGSWAN_CONF_OPTS += \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
