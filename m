Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6952C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 17:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1662740003;
	Sat, 20 Jan 2024 17:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1662740003
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id okD7mf-IMT0H; Sat, 20 Jan 2024 17:28:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00CFB40253;
	Sat, 20 Jan 2024 17:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00CFB40253
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83F971BF31E
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 17:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BCED40003
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 17:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BCED40003
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UWSJ0orZdgsR for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 17:28:45 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E94040253
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 17:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E94040253
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40ea5654271so5952545e9.0
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 09:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705771722; x=1706376522;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gCMbklyH5vwOW9ODWZ4bQ/Gb6salzpFiIE5QzqIjBKE=;
 b=tP9D4B6wvBFGmaJph1kEeTFURLycWDeKwZUSQYcTmTLQvfMQvd935DhS2CEBum7rzB
 mu2BKcGywoAc7bbsvsYSuBYjfiUU8ZhPM6mbksMCoGUO/aF+RByHzoLtw8wrVSV+P0rI
 27kisyidzvqcflVWKJIK6ooN1NKFgcHrHlKFTyglVaBctOZ6p74vhoMQ3OelhaNsSZdS
 HpPRd5Diqg/TxljUi5IIz1thbP7BBRHTA+DpgwJ/N+P8nRPAQKClWI7OXiISdRbKY54Q
 ezW7pLjuDRrzH3nmf1HeMR0HnoFDW27e7N9sHdiijGOUX8v2CT2q+LChmrwHem7toSTU
 I/DA==
X-Gm-Message-State: AOJu0YxeL7Gt9XEHxZ1jav6KND13L62Lttro1QKJsAyl7Z+3+4LsIL9P
 dF6HG2eUz/ssEXd9f5IVBHy30fVDu+ctv1csU7lVx6C9dZdhSOCb4kw36WvD
X-Google-Smtp-Source: AGHT+IEm4WrnDHoTjewPsfaxM+LINtAdT2EciSDduXiAFoVuI2lGYbu7B7o9P26RCxwRYAFOcBE/vA==
X-Received: by 2002:a05:600c:231a:b0:40e:4a71:e13d with SMTP id
 26-20020a05600c231a00b0040e4a71e13dmr866702wmo.48.1705771721928; 
 Sat, 20 Jan 2024 09:28:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c1c0500b0040e9f7dadc6sm5529155wms.25.2024.01.20.09.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jan 2024 09:28:41 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 18:28:39 +0100
Message-ID: <20240120172839.763337-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705771722; x=1706376522; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gCMbklyH5vwOW9ODWZ4bQ/Gb6salzpFiIE5QzqIjBKE=;
 b=mWtfWmmpZ6DiJILvChlKlE2II1f7djjtxMZ1ClyjBTYqNfxNk82H7FMLG6ZOW0NvB9
 ubaG5iQFYtkjIf3zVvM2Ni+c7kdTl97CZwBTG6oPacDFmecoAOdgILwEjGSqWewb/8vs
 A4r3Ger8ZBxXCuvpzvpqdg2AEPNsuxtXoYmKIYeLw/YzUH1iBghi0gKGxNy/y170kk4E
 CFUrxcFhETBOtE2klpyioPH5Yb9ci7wK3e0qatw5K2D8qVgHnCHGjwvpRkVDpErAMt8v
 BK7TeDXrvSZY9qhsgoP0HgVHEy7Y5sthuUQ1CzpgSySyZv/J/ftxNvw5W3jv0RDdHPQp
 RUZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mWtfWmmp
Subject: [Buildroot] [PATCH 1/1] package/petitboot: fix NLS build
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following NLS build failure on musl raised commit
bf9583a50276f52edbc37d9f85df5f2cc7fdb5dc:

/home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/mips64el-buildroot-linux-musl/13.2.0/../../../../mips64el-buildroot-linux-musl/bin/ld: discover/pb_discover-pb-discover.o: undefined reference to symbol 'libintl_textdomain'

Fixes:
 - http://autobuild.buildroot.org/results/6d440d96e811674041b5a1fdae96d4c377824c2a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/petitboot/petitboot.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index c4eb20b44d..2087f01b09 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -7,10 +7,18 @@
 PETITBOOT_VERSION = 1.14
 PETITBOOT_SOURCE = petitboot-v$(PETITBOOT_VERSION).tar.gz
 PETITBOOT_SITE = https://github.com/open-power/petitboot/releases/download/v$(PETITBOOT_VERSION)
-PETITBOOT_DEPENDENCIES = elfutils ncurses udev host-bison host-flex lvm2
+PETITBOOT_DEPENDENCIES = \
+	elfutils \
+	ncurses \
+	udev \
+	host-bison \
+	host-flex \
+	lvm2 \
+	$(TARGET_NLS_DEPENDENCIES)
 PETITBOOT_LICENSE = GPL-2.0
 PETITBOOT_LICENSE_FILES = COPYING
 
+PETITBOOT_CONF_ENV = LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 PETITBOOT_CONF_OPTS = \
 	--enable-crypt \
 	--enable-platform-auto \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
