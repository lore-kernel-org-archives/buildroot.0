Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00473C433F5
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 17:48:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74D456117A
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 17:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 74D456117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04AD240126;
	Wed, 10 Nov 2021 17:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id peyKszWU2szH; Wed, 10 Nov 2021 17:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 635554010D;
	Wed, 10 Nov 2021 17:48:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FF0A1BF9B2
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 17:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F364A80F33
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 17:48:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mEy3OeTCQF9f for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 17:48:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFDA980F18
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 17:48:14 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id z200so2959028wmc.1
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 09:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u5KIGIA5Gz1nA1AtZc5ILy5ZsIf5ebf6R2t5WA2r+24=;
 b=QQqHx94CR7p+aVaogDrHtW1Puw276zJzsdjuzdZ1tCPjGqbes+vYFnz8cOjqPCS9Em
 mdEvXQs4AyqcM0qU8JO8quCGNh7yY855fSI8PO6yvNqUlJnntvMrWv6C2zNrT1BlMnCz
 eYuBPoaBBVr2mevMmHNDZ3ismVa0a/Gt7IwF5eLPVQF9xY5b26GG6CLjcBtkjAQnkJ58
 KdHBYsqXA15z213ptHQ7dXd/EGIFJ4JJadF2q4so49mng8cAk029DExzR5Ypze+D6v4Q
 n9Ny+Acx/lacFImYuKbT4sJq4uBZOvhJD9onlppq/NWpohxVyhZfDW7UOO8B2/dV5Djq
 RMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u5KIGIA5Gz1nA1AtZc5ILy5ZsIf5ebf6R2t5WA2r+24=;
 b=d9bFpCELQ2zqNi5yIYFBkiEiswz6zBBd7omHS1xwH+8zQtKq5/iQbCOI+6q1Y8KoT7
 5uVmgMexEeySQSRzJd5M0F+9Q4CFMDV/BpAAF1wGh8zgTR3QMQm8Yi72oH+L+DXgAi/f
 iDdla70y+68UdBFD6dccassNXDp1Q8rvfNYUsO2OfZmj3dj7y+i1ZcRzL0A3HMIZOQcp
 Q7hVy3WXpJsYRFtF1mcVn++ofQ8cyZCFVUAmGs7/UGZ7/77z+D9Ji7oWXRUGdsQSPh0a
 0nWe+URwC1/5Ge2j2+DvMO3TNsG4Wu4fAS5QA/hdtERCHUPWQcNDahc2mgeeEbIJkT1E
 8gjw==
X-Gm-Message-State: AOAM532n4UYlrfq1OmxZeVrHm7RpzR1jzYhr8TViysZdF+0Cbivtrn1u
 EU3bK7uFQW/5AQVsxNqzMEwEntPkF3E=
X-Google-Smtp-Source: ABdhPJywL2zGaNlLXfDoOCtl61IKgm6S9CMKsSrkGzxXPhlxqdPNmNkyIayv6d7kClX8rgIkRSEEPw==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr18246986wmj.149.1636566492656; 
 Wed, 10 Nov 2021 09:48:12 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id z11sm530541wrt.58.2021.11.10.09.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 09:48:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 18:46:09 +0100
Message-Id: <20211110174609.1927002-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/binutils: zlib is mandatory
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As found out by Yann [1], if zlib is not provided by the system,
binutils will use a bundled version. So use --with-system-zlib which is
available since version 2.21 and
https://github.com/bminor/binutils-gdb/commit/700d40ca16eb3ba1ecc1e602cb3eec175bdf70f0

This will fix the following build failure with oprofile:

checking for bfd_openr in -lbfd... no
checking for compress in -lz... no
configure: error: libz library not found; required by libbfd

As found out by Arnout [1], this fails infrequently because static is
already pretty rare, but in addition zlib is almost always selected by
some other package.

Fixes:
 - http://autobuild.buildroot.org/results/0e1d16dfbb455a08db80ac5d35613908c3b4163f

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20211030214734.2154583-1-fontaine.fabrice@gmail.com/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/binutils/Config.in   | 1 +
 package/binutils/binutils.mk | 7 ++-----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index e17a8ec65a..5e1a769998 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_BINUTILS
 	bool "binutils"
 	depends on !BR2_nios2
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_ZLIB
 	help
 	  Install binutils on the target
 
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index bfad25422d..13f61be035 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -25,7 +25,7 @@ BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
-BINUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+BINUTILS_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
 BINUTILS_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
 BINUTILS_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
 BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
@@ -51,6 +51,7 @@ BINUTILS_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
 	--enable-install-libiberty \
 	--enable-build-warnings=no \
+	--with-system-zlib \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
@@ -74,10 +75,6 @@ ifeq ($(BR2_ARM_CPU_ARMV7M)$(BR2_OPTIMIZE_S),yy)
 BINUTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O2"
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-BINUTILS_DEPENDENCIES += zlib
-endif
-
 # "host" binutils should actually be "cross"
 # We just keep the convention of "host utility" for now
 HOST_BINUTILS_CONF_OPTS = \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
