Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A8FCCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 09:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F064B409BC;
	Sun, 18 Oct 2026 09:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BvnEPEuP_7Ck; Sun, 18 Oct 2026 09:51:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C56934096D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792317069;
	b=dGAPStHsN9nXvfXamGmKy8fIxGYXj3T/US5Xo1G6nEe3Vo9JK4MwIt3+hdZeW+SWvmpN
	 JA+yRBLrezqK86cufNy15h5lj6qfTRVC87/fb/2sqsGR4jilDL0xTnXWKQ7omNEDxuZF+
	 i/Gny4wQihkfJU49zMkhl2QI42D0q7Z6J3dn5aPAm+NTb0DBxsS6Qyo1RXfQAmdT2a/z6
	 9HPGJNkduWY1QDifO6odq5mrKkprNoH+EkeGxRJgL4wQ2KEsApfnBq9AL1Jab+dbIsEvU
	 KIjwFSTCuQ366JB3/1puJ4uLckkZQ0eJxp1Cf/BL/jaTOINrhqVsU7+G8zAqTxnvFBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792317069;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9swsc8dTVaJvUUJ7rYbqDzZMuZxRg9ZggndopgZysrg=;
	b=ba/a7oGWnG7Q1vGK7Dtka1N/lqauNV4K4plduFDJfFzbyhJyV30bnRAaUGaLQB4AqzIl
	 wdeSH54agLgxvidwvAZXUwTJ6fUNtq8nw9UlvI3gVekp87TR4PwKxLvFrhHYEVbvbkWIu
	 5/27G4jZF/u7Bpvw24JLZWodgjQfN32CGMWmwaiWldPJH7f7XsPDIcD+8EDLY4g6NtHC3
	 f2SQw9CSO7rK4ezjsDSCLoKiLTScPVRqMDPf2pPtpKlj5fxpXtXcepe9jBrYBoO2Rokup
	 osfv9EkNzxUVP6U087/uZky3ZTqtUWRttwHPKYXzmQhiX4nop6omY6v3R65nlXTQIZA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792317069;
	bh=9swsc8dTVaJvUUJ7rYbqDzZMuZxRg9ZggndopgZysrg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZAIMW46F/q2eOODg/s7giMdFsgoNlLJZxwdueWFbPVIbavgP53box5KXPdBv8IPFh
	 78VZ0KoIXEyISPduYvDWhoecZYILm9Y+bLlalW9HKsAj5FoNzv9rVa+FO4bYxeUKbb
	 71nCApRDt1FElraulsoq2cytNlYEfQ03MEJ9hT81aHrgZBvleXT2wYiFWvSkDFRrF8
	 wdkI0fNpJLjAVW8QY+nYMiR7Pwcah6l6Kmub111iGyYS1EN95ArETtSkpfmPbGs2EN
	 1gPDn5bZp09uczZIaTynVkwk/tBbQS5TO4Uf5qeS1PgGAUqkRtPQoGBKzAhnGfJNDg
	 nlqLFtj/CojCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C56934096D;
	Sun, 18 Oct 2026 09:51:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 27A1923F
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DD18606D5
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXvwBAOm8IJV for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 09:51:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F2D4A606BB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792317063;
 b=nLRC+/upfC8zUQqmZoRapKji3wOSyZQUg9NdIQVVUrVZSSQLnhtxSv25i2G582GMppVQ
 z8Dzf+pjQ+HM0gHj0CydXdX53o0A2/gSJbNk7j84q0oB4Y2htttIuEVkjJ/HSw665cuG2
 Ab4ExAeqxZI9Jry5KkUnxJzJTshZDWHs3Oq4x96pHi5MTDkIL0EntSqTEUUx2QSsPoWcG
 OKjSS0OnYw/yEvY8X+Fkh+e4Nl2Z44eHGm/DYhTm7uUFSVkyMjNOm56h8uLniNpIqYvNL
 RgDA6CqnvLyFwcy7VwlAAF7jmOIf2Xta/q+K+nokWSSbtuqjaxaagR2vbMCU/9Bu7EQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792317063;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QGU+y67ibR/08aF9f/C/k2GtcY2VHwaM6OCaTJ1ZfLQ=;
 b=fNl1si0MNBCRtVqJlmq///PTt6hK0CyQi/ir4nzKRuOUOGRyFa+YZURbTEezhAsZ+uRe
 q8G7+t8LyLUMn84iWf9QHq8R4HnV/GZfsx9KIv+kddoTel6io+RhhgPuiDDpA2L/vHbpc
 4YMD6ab8geR0Dl+XbfB5+INcDDzGeg6PCpGGMZTEfAmnn3iP9MIlUVSucxmDsjDQXc1WB
 aZEsOx4nzgDrLWqneIr3Ix1GUPlc1NjesQPn0ZDrsbFbJe09D1icQrBuFNxGBdhzMXy+A
 cN2JYZbHTpisJax1K9ndITeLiZS5VJgiQQJg4XRjTNYmlwjx1bhhc71oEuwMC6yeKrA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2D4A606BB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBCBC96AD9; Sun, 18 Oct 2026 09:49:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 11:28:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b61def5b3b15b85f93a4d9c17474e003c4f64f7
X-Git-Newrev: d7ccf54d7f8cfcb1ab40b227c080aee36f5a6aa1
X-Patchwork-Hint: ignore
Message-Id: <20261018094940.EBCBC96AD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: fix target FIT
 signature support
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d7ccf54d7f8cfcb1ab40b227c080aee36f5a6aa1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 928cc5dc5cb82e6f2cb43f853488309eb806ef89 ("package/uboot-tools:
fix host FIT signature support") fixed building host-uboot-tools with
FIT signature support after upstream changes to the config included
since v2026.04, added to Buildroot with commit
e049f6fef1fd1e1b0b6095e0ff9113312a7d7f81 ("package/uboot-tools: bump
to version 2026.04"). This commit applies the same fixes to
configuration for target uboot-tools.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uboot-tools/uboot-tools.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index b5924f6954..32fe9f1d7b 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -33,7 +33,10 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
 	mkdir -p $(@D)/include/generated
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
-	echo $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_RSASSA_PSS 1' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE 1' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE 0x10000000' >> $(@D)/include/generated/autoconf.h)
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
 endef
@@ -50,7 +53,7 @@ UBOOT_TOOLS_DEPENDENCIES += dtc
 endif
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
-UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000
+UBOOT_TOOLS_MAKE_OPTS += CONFIG_TOOLS_LIBCRYPTO=y CONFIG_FIT_SIGNATURE=y
 UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
