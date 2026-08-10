Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1F6C5AD7B
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 21:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6A0A80F3C;
	Mon, 10 Aug 2026 21:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yyib7urqjK-j; Mon, 10 Aug 2026 21:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AA5D80F1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786397371;
	bh=2o2Zahv9GWI6Z75DhyAe2/BxJWyQl+ceWIbQIkJF9Qc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=EJBIMPORZ7RT+f/UE8DmpOASBgM6fBJ3W7eoAQRz4G0U0DKRfXjPlmgEhDdPAFWnF
	 L7oYnS9AJJ4so6mRc7IJi6VyqW1FOy2XXSdSybzgegiQy8rCq2OBfGN9/9PuCtJtdv
	 Lx4veTllMQmU7fzHXdqJgYcfCUOI6MWDm0lqWe+C+/7ISRVf9fQA01BSd1BAYpF8cR
	 jAFySowio/rjJkivj0WBfJCGXxcLDop6PiXWRTqlTXYMDsF56gTwydy4+v17j483co
	 G5vxBFHKwYy+vyKdXgEN1FCks7ZoUCgRqkWvwyhOib3fiR8IyusXWUVUw4AvLgZjCJ
	 T7k1UQL7rtm/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AA5D80F1D;
	Mon, 10 Aug 2026 21:29:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CDD7B218
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 21:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3AC7406D7
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 21:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZ838AzpjbFL for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 21:29:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ACBEC406D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACBEC406D2
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACBEC406D2
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 21:29:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6FCA31A1522
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 21:29:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 44DF06033B
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 21:29:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8184411C4B3B8; 
 Mon, 10 Aug 2026 23:29:20 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Aug 2026 23:29:17 +0200
Message-ID: <20260810212918.460215-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786397360; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=fnW7tjhoDHthQFO8yVdjwmgM0xBffKjHFipzICX170w=;
 b=uxKifLlQZDdhkR2jQmsmUGKlKUKsqBGQ/1XQWERyLg3iQvBzuiXl2BJ3chOselbSM8q2Z0
 egLmqRexLfHtYciQo4aCAdMHRU3jIHtGzPpS4scDO2V9NJt3sXDDndCgKRsw5kDFY7tlwW
 ii2sW+6B0GOl6T+/l1M1r1ZH4x3YmJ2HhhaaA0XnF4C2hfjEEchfJtm1JbPD3prYxpjmvU
 n7z2Ox0BNuc364CiG33zkPoSTyxckQhGK+5z5rXM5jGR3tXSzA3S6KWzgtnV8ZhLvpUh99
 PM5eJqkyGdFjdFCwvEpe6YrfG1dzXGJfWeaRJwjZI1PCCTJMUvnCV+L7B6gNCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=uxKifLlQ
Subject: [Buildroot] [PATCH] boot/grub2: properly handle autoreconf for
 target package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit e427f85e29f7027319a5cd1ce1024d80ef4a29ea ("boot/grub2: fix
build issue since 2.14 version bump") we added some patches that
require regenerating the configure script. Consequently, we added
GRUB2_AUTORECONF = YES and HOST_GRUB2_AUTORECONF = YES.

Except that grub2 is special. While the host package is indeed using
host-autotols-package, the target package is using generic-package,
making GRUB2_AUTORECONF = YES basically a no-op.

Except that since we're patching configure.ac, the build realize at
build time that configure is older than configure.ac, regenerates it
at that time, and re-runs the configure script without the right
environment variables causing build failures.

We fix that by doing the autoreconf step "manually" for the target
grub2 package.

Fixes:

  https://autobuild.buildroot.org/results/11802ca1762e046328df324d33a1ad813fcd92e8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/grub2/grub2.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 85b3925c1e..de9f913e93 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -17,8 +17,8 @@ GRUB2_INSTALL_IMAGES = YES
 
 # 0001-Revert-configure-Check-linker-for-image-base-support.patch
 # 0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch
-GRUB2_AUTORECONF = YES
-GRUB2_DEPENDENCIES += host-pkgconf
+# Target grub2 package doesn't use autotools-package
+GRUB2_DEPENDENCIES += host-automake host-autoconf host-libtool host-pkgconf
 HOST_GRUB2_AUTORECONF = YES
 HOST_GRUB2_DEPENDENCIES += host-pkgconf
 
@@ -139,6 +139,7 @@ HOST_GRUB2_CONF_OPTS = \
 	--disable-werror
 
 define GRUB2_CONFIGURE_CMDS
+	cd $(@D); $(AUTORECONF)
 	$(foreach tuple, $(GRUB2_TUPLES-y), \
 		@$(call MESSAGE,Configuring $(tuple))
 		mkdir -p $(@D)/build-$(tuple)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
