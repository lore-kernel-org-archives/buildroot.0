Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A6CC64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 14:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2518381A15;
	Sat, 25 Feb 2023 14:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2518381A15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TgAkpaVPJGrC; Sat, 25 Feb 2023 14:14:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F9D0819BE;
	Sat, 25 Feb 2023 14:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F9D0819BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 865DB1BF2C6
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 14:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60231819BE
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 14:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60231819BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7VxDyl5jThaf for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 14:14:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DD9E813EF
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DD9E813EF
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 14:14:18 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q16so1965134wrw.2
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 06:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zgf/pCDD0LQV29yq5R04p31Cwiz+W52tmad8SaFz/fw=;
 b=Rg0TJmM0uSbXpNDe/eE95g8/faD1dKtjwBLFuSRqzp6e1kpDvytuIMfAfyYmJXqrQ0
 f8PzwgZkZ8OhCMApS9txxaF6o5bkLDe+Tn1nblW7dKsruxvblV9sXPaVJHgDh83iLvEB
 9GysQr/zoemIBR3Cr9LfNoA272PLzDse9uJDHg0+DnRS+VM2cam7CTdniUQnf5T77Y3H
 sUmiDCC03z/FmXzUnAIfsdeNMqUWZx3Cl3wvIT3twKve3+1i4m0iswFHaLJ7avcwj6sE
 XMZ0eNsCnRLAkaypQgjAxkRiYkBVtpRAzIt3YlWCeE8vfFzn3h2Sgj6SvEhs5Etqqp9R
 hSlQ==
X-Gm-Message-State: AO0yUKVmq/if8n35M2QEEtaNuQ0/HqIwVlp/KKQ8th9PbTy0b6XRbDBu
 yvMFVIjr8hXbIGcjHawLbpYHLxTrSrw=
X-Google-Smtp-Source: AK7set87L2kJfH6sjENRYgM2GSO7tj0ydBQbzsmBfSmTPmMohOazB/9yEhYSAGSFwUOFGZEJCuPS0w==
X-Received: by 2002:a05:6000:1a52:b0:2c7:6bf:16cc with SMTP id
 t18-20020a0560001a5200b002c706bf16ccmr12814132wry.32.1677334456308; 
 Sat, 25 Feb 2023 06:14:16 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o7-20020a1c7507000000b003e2059c7978sm2676411wmc.36.2023.02.25.06.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 06:14:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 15:14:12 +0100
Message-Id: <20230225141412.2968950-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zgf/pCDD0LQV29yq5R04p31Cwiz+W52tmad8SaFz/fw=;
 b=kolm0Lel+UevgjzwXAX4+D34BelVyAofiS+Tnh1fvvLNGbdAevPlda3ivF7TINiOTs
 VQCMzxEIGPrpwC43SDZsL0EfHCTAdS5l9iZgJ+DAIhMLaZki+U+wpdWpbmfGehr8KHpl
 LD1BZKQ90YcqPWV4QMHdf5ygtZ2QYSlysTGtPwkOW108uVgdE9QQcl56niIJ3DKEgCrM
 O5hNgJhQHYhVTTzn3rr3F2l4zOni1QVXlzZTBIeRRJ1tlE9r6KhCWuPG6oJWiO3ZoF8p
 v0CeETP9Jx6TiIBkd26U9Sf28u5HdMMseqO46vsl07pv+WND9P9vsFuCE1e0b//jjZZ0
 6WPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kolm0Lel
Subject: [Buildroot] [PATCH 1/1] package/lirc-tools: fix python build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 0.10.2 in
commit 58cc3977e83487bdaa1df232cf7adf6383d49cd7:

In file included from /home/thomas/autobuild/instance-3/output-1/per-package/lirc-tools/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/include/python3.11/Python.h:38,
                 from lirc/_client.c:1:
/home/thomas/autobuild/instance-3/output-1/per-package/lirc-tools/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/include/python3.11/pyport.h:601:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
  601 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/85359d3f678b49e46821a1c10da5f14edfb5e6d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lirc-tools/lirc-tools.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 5263330741..a3ad6bd5a0 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -48,7 +48,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIRC_TOOLS_DEPENDENCIES += python3 host-python-setuptools
-LIRC_TOOLS_MAKE_ENV += SETUPTOOLS_ENV='$(PKG_PYTHON_SETUPTOOLS_ENV)'
+LIRC_TOOLS_MAKE_ENV += \
+	CC="$(TARGET_CC)" \
+	SETUPTOOLS_ENV='$(PKG_PYTHON_SETUPTOOLS_ENV)'
 endif
 
 define LIRC_TOOLS_INSTALL_INIT_SYSV
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
