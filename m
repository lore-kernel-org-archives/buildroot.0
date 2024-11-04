Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAD8D1BDF3
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 21:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D9C880D99;
	Mon,  4 Nov 2024 21:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uyXyQMQSUEI; Mon,  4 Nov 2024 21:12:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B61C80D9D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B61C80D9D;
	Mon,  4 Nov 2024 21:12:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5864B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5FA160781
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvdavI7HEloF for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 21:12:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BA2F260750
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA2F260750
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA2F260750
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:12:29 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 53959B0055E;
 Mon,  4 Nov 2024 22:12:24 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Mon,  4 Nov 2024 22:11:57 +0100
Message-ID: <20241104211157.639393-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730754746;
 bh=PcWhW5c5FLVTmt0aGecsGR3pJAHLEPE1Bc1FMuRi7Qs=;
 h=From:To:Cc:Subject:Date:From;
 b=Brr2y4vI8DVRuCWoXabDf6JTRJTaL8QuEO6BHsCimkMnX8VW5yGvt3Gy2L9kw3sPO
 V5ormZHBiQdC/eQG7qrY9Df1dXvXp+B8QoEU+PRtYZtJiThIPqfZcFUuyPXFH0gc4u
 1hvtAJLlyO+1pIARPAqPSdPYyCADSCUNafaRDlesT/jc6Qlfmf/1CF4dH6JKiEQenp
 C0bYXOfQ0Jh2+GmfTR9XHHgvseUT8imBqXMQv1Nb25Z6hOlTEVaOFAqZnGHQpGeBXW
 qOURyI+IYpYJoNW/6CfJdRn6O+PT7B6u9AGzrZYuxjlm5InoOcWVnvgCW0qy3J86qD
 vx+1YYCdm2vUA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Brr2y4vI
Subject: [Buildroot] [PATCH 1/1] package/opkg: fix --without-xattr configure
 option typo
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

Commit efe93b34e "package/opkg: bump to version 0.7.0" [1] introduced
a use of --without-xattrs (with an extra 's') configure option.

When compiling opkg, the configure step show the warning:

    configure: WARNING: unrecognized options: ... --without-xattrs

The actual option name is "--without-xattr" (without an extra 's').
See [2].

This commit fixes the typo.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/efe93b34ec678c0d35b2ec062128fccf55912b8e
[2] https://git.yoctoproject.org/opkg/tree/configure.ac?h=v0.7.0#n167

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/opkg/opkg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 0323a49f0b..4922d8fc0f 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -13,7 +13,7 @@ OPKG_INSTALL_STAGING = YES
 OPKG_CONF_OPTS = \
 	--enable-sha256 \
 	--without-acl \
-	--without-xattrs
+	--without-xattr
 
 ifeq ($(BR2_PACKAGE_OPKG_GPG_SIGN),y)
 OPKG_CONF_OPTS += --enable-gpg
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
