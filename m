Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54AECD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB785423BE;
	Sat, 30 May 2026 09:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFAm4RBSDJoR; Sat, 30 May 2026 09:10:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2AEF4290C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780132236;
	bh=4aPwJ7vQK+tboGA8TWnQFTVZ9YtyAt2YrBGlgHE5dEU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CCL/lz0iP9NFBWsOXCzzHPDgEkkr++40R7qajj2k//G9GE6BEfzcoGlJwCg8ZM6gK
	 UHrBYt/8SyA15d0jpDPAeK+C75SlbxD3uit4m0DsNqBHt+pP6B67RlKAF1F7jaxJD9
	 tihaI5WamyUqMaPhn02Rnnhw7oI0OPi7AB3ey5d83mybUImDdtmHMdipk3muK6G4s4
	 FkLlefDjEQz4vlueeRRDNVQvHS6joCkXP9lBwCjUxmJCfwmRvvxZ+I5osTtWSzzH+6
	 WOXmnkjim3xxvDVaV+UVaw88CdzrRq+oCh9+P76CBvaBKjGpmf4Bo+IgvJ+HNJZCh3
	 8mg0ss3Vk7v8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2AEF4290C;
	Sat, 30 May 2026 09:10:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28033D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24E934290C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khFDhM2XgLub for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:10:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A8C5423BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A8C5423BE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A8C5423BE
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:10:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D8EDDA4C3495;
 Sat, 30 May 2026 11:10:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47094)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTFhy-000000006PQ-3kOf;
 Sat, 30 May 2026 09:10:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 30 May 2026 11:10:18 +0200
Message-ID: <20260530091018.589175-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260530091018.589175-1-bernd@kuhls.net>
References: <20260530091018.589175-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780132218;
 bh=ZD0lPbaEMX68XzwGBGPKHm/SSd6u7/cwC2u+64oWw2U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=uFJpImt8YaMUgLHt7OsHU8ztvXan4eWsB4Btw2U8QsJ1r9Wol0nWNrVDFiqBoYb4f
 V7q0DysdFuDWF4tRedtjj9IXYHkyerIOPwg6dFtErsWyf7R226AKTWYIzEA3yLEiBg
 WUinVXV0bKh8w5nG8T6VnAF2/nVGLwtip41wmWyWj+fuW7cfWSHYFV0DkSR+eXbcmq
 DD8fHLThB1hlX9uy/JjiBlH1XXcDwjI8umQ7DXmtn+WQ/7apm1v4odTdD/AmtrlpJ2
 6Oa0eRDeKrEqYxe1fygPArhSslNOUuufM97hHoGmbBF2WNuBBjoQCFBrTSkXPRW8ap
 LAc1XrIo+Jw/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=uFJpImt8
Subject: [Buildroot] [PATCH v2 2/2] package/libdill: fix build with gcc-15.x
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

Updated project URL: https://github.com/sustrik/libdill/pull/228

Adding -std=gnu17 was recommended in upstream PR:
https://github.com/sustrik/libdill/issues/229#issuecomment-2865524080

Fixes:
https://autobuild.buildroot.net/results/1a5/1a5e9d7df6c83a921cae39b4dc4b601be4d18e36/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Series passes Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2563402770

with the exception of bootlin-x86-i686-musl for which I could not find
a fix: https://gitlab.com/bkuhls/buildroot/-/jobs/14613121682

This build error was masked by the other bugs which are fixed by this
series. It can be reproduced with this gcc-14.x-based defconfig on the
master branch with the autoconf-fix added:

BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_PACKAGE_LIBDILL=y

 package/libdill/libdill.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
index bea9aaeecb..453031a471 100644
--- a/package/libdill/libdill.mk
+++ b/package/libdill/libdill.mk
@@ -13,6 +13,13 @@ LIBDILL_INSTALL_STAGING = YES
 LIBDILL_DEPENDENCIES = host-pkgconf
 LIBDILL_AUTORECONF = YES
 
+# gcc-15 defaults to -std=gnu23 which introduces build failures.
+# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
+# versions will work, since they are using the older standard.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+LIBDILL_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBDILL_CONF_OPTS += --enable-threads
 else
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
