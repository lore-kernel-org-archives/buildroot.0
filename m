Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D02CCA470
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 21:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6652D40B34;
	Tue,  7 Oct 2025 21:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBj-oSZuN-k7; Tue,  7 Oct 2025 21:05:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA48A4071F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA48A4071F;
	Tue,  7 Oct 2025 21:05:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7199A226
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 21:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6370240665
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 21:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-mdxyFExVW9 for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 21:05:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 52F74400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52F74400CE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52F74400CE
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 21:05:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0845.dip0.t-ipconnect.de [91.58.8.69])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4CF01A4C60C0;
 Tue,  7 Oct 2025 23:05:15 +0200 (CEST)
Received: from [192.168.1.144] (port=60538 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v6Ery-000000003RR-3uiH;
 Tue, 07 Oct 2025 21:05:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  7 Oct 2025 23:05:14 +0200
Message-ID: <20251007210514.3784984-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759871115;
 bh=2xfd9vnO2v3jS5NoPwD2m3LT45VsaGuapoKoUZ2E1fY=;
 h=From:To:Cc:Subject:Date:From;
 b=aNgJcMUzgzLPOlsY9uUHYuSIk8ey5dsrmZXO6wKOxVzSqTIknVof3HuFFDK0XJVFJ
 8z0UpjsyBqGB5OkAvjUPFekzaPkBVHIQKF6W99T71ucQZMdPBMs6Ob4WH0Nd1Mwqfa
 oTQbIA34eTIxHb1kBT9NNPwBC4beAsU4KAUk4zE6T559FTK6hJ1IcKHHGCM+TDK9Jv
 JuPPezS4124WFEQFfLucaIAzbVGNkYWuh01QXy8AaLVrwBgpMj0qsL67lJHPOmDoOH
 +SCk67LDryhZU0lz1PqZN77HEjQtilW7KkKnW3MsBJyjW3vfuCg0wOUGiGKuTprwEF
 z5j7iIcFsdcIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=aNgJcMUz
Subject: [Buildroot] [PATCH 1/1] package/libcurl: fix configure options for
 GnuTLS
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

Buildroot commit fb5fb06ee5a886df5036c5c5e6c4536f2bc8e1c1 bumped libcurl
to 8.16.0 which includes commit
https://github.com/curl/curl/commit/2f6524ce3c3a8231c62d1e0c8af509fe5b0228a0
to limit the use of the configure option --with-ca-fallback to OpenSSL
causing build errors with GnuTLS:

configure: error: --with-ca-fallback only works with OpenSSL

Fixes: https://autobuild.buildroot.net/results/64f/64fad87dddecda1e8ff6b0a9abc0b827b5136e4f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcurl/libcurl.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 0aa88044bd..51b8c4d147 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -68,8 +68,7 @@ LIBCURL_CONF_OPTS += --without-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL_GNUTLS),y)
-LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr \
-	--with-ca-fallback
+LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
 LIBCURL_DEPENDENCIES += gnutls
 else
 LIBCURL_CONF_OPTS += --without-gnutls
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
