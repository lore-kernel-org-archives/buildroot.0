Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B6AC3DA64
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 10:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6009840488;
	Sun,  4 Aug 2024 10:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQdg4CSGTTAy; Sun,  4 Aug 2024 10:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10C94402F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10C94402F7;
	Sun,  4 Aug 2024 10:03:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13AC81BF59E
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 10:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DBD0402F7
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 10:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kEjZJMM-lun for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 10:03:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8EE614012B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EE614012B
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EE614012B
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 10:03:53 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id F2E883535FBC; Sun,  4 Aug 2024 12:03:51 +0200 (CEST)
Date: Sun, 4 Aug 2024 12:03:51 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zq9SB3AwoQb731Ki@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722765832; bh=uxxfhlMr21yyOXlXn4Jd5+6AUHzHQnJkbHedZ6G6mEM=;
 h=Date:From:To:Subject:From;
 b=sOkLZxnHV6vrxv81zeeYZVmGBF0Y1YP53OAi0krahie0qYulOIFPlPbyPaAZqxEnc
 pLate7T1YagGrK/YFfH8iNQ+DS/9Tx1pMleiq/AjZprhrDSfHtu4pjZvkc3iJFU1O8
 7WAUbSCgJjT9k7H3mdWukJAauzVqgrPabb0rKNiEALfx5+TJ2K+sEWrpH3JOsnJWjr
 Om9NotrsFcAM/inDLzfzf4aidVcaPiXubh7wla5W1szEmpK1hmJuON0sbPY6EWs/1R
 UW3Ymtvq21LBADISAHxbJBDx2aaOyV1J8lYxYrghQ2A4EXgx4LWgKwqlmIml/+oaot
 uSZxutFWQeE2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=sOkLZxnH
Subject: [Buildroot] [PATCH] package/libgcrypt: fix libgpg-error detection
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

Libgcrypt uses two scripts to identify libgpg-error location.
The first one is gpg-error-config. The second one is gpgrt-config.
The usage of gpg-error-config is deprecated.
Help libgcrpyt to find a correct gpgrt-config for cross-compilation.

Fixes:
 - http://autobuild.buildroot.net/results/46e/46efff01f7d0a2ce3c8523cd073302e58e0f0ae5/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libgcrypt/libgcrypt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index ae50ead343..57eca507b3 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -16,6 +16,7 @@ LIBGCRYPT_CPE_ID_VENDOR = gnupg
 
 # Patching configure.ac and Makefile.am in 0001
 LIBGCRYPT_AUTORECONF = YES
+LIBGCRYPT_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
 LIBGCRYPT_CONF_OPTS = \
 	--disable-tests \
 	$(if $(BR2_OPTIMIZE_0),--disable-ppc-crypto-support,) \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
