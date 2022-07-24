Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDD9C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 04:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F43F8497A;
	Sun, 24 Jul 2022 04:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F43F8497A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eeETv0JY1MdN; Sun, 24 Jul 2022 04:35:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0513A8493E;
	Sun, 24 Jul 2022 04:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0513A8493E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E0351BF44A
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 04:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 673C94033F
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 04:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 673C94033F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hdWo4I_pCWVq for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 04:35:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 754F6400C5
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 754F6400C5
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 04:35:42 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so10946208fac.9
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 21:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=NUNvBcvQIgKi/MKzoesu52ek4xxc0lQ9fF3xKN5/HUA=;
 b=GBEH9seUnT43SxtXw7SfcO81WIvAWkv1/qwGBWwkJ8aNAMfM0BSQxYIwg64VnK+kKC
 xsiXvWTglGHUlpbrKkTHt8R38DZ58eEWNEayOjbQxfwuOq7TLMsBFWQ1N0dDcgtgYIDM
 +rjcT+MrgW/lKzKcvS+aa5/xhfkDESOZNtGU3o0dEXq0uCszPEMqgZ+3cyxtRJWYlqsl
 EnPD4d+E9zsCfI2XFRv/5NM17bPQ4PXAss+cWo06w41FmYsDiDiWHt0pjoQ3dsSHWVkK
 B3/Jb33HoSzFGbkLs+wy1OUXjl0f6J2e/uNftxROyM7UDKEiZmtsf1K8ubLbX8DRwMkL
 OzRQ==
X-Gm-Message-State: AJIora99H8Krz1a1Hzm8lPb6EwNMcPOaF1PkAgDMTQ/b7gsYxI0Y+knh
 1jaKkDaFTQ0WLyEBAjmjqgThOkceFU8=
X-Google-Smtp-Source: AGRyM1u9r8pDzmXr7ErmilgPqjAnxCoKNsJM4nBDOm5MreQsUhE1nhmx7rvTfyiv6vVTpvHb5SuiXA==
X-Received: by 2002:a05:6870:4608:b0:10e:2c6:afa2 with SMTP id
 z8-20020a056870460800b0010e02c6afa2mr752104oao.149.1658637341441; 
 Sat, 23 Jul 2022 21:35:41 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 u189-20020acaabc6000000b003263cf0f282sm3491170oie.26.2022.07.23.21.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 21:35:40 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 01:34:50 -0300
Message-Id: <20220724043450.2255769-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=NUNvBcvQIgKi/MKzoesu52ek4xxc0lQ9fF3xKN5/HUA=;
 b=mWNhRvJL+c8AIokzVi5tq3+vDajTXlsaPxI4rl2IDnpvDr19Nx4DHgqVn1wzhVNibY
 3UxF6HmKkOZzFoV171HHc6eYv2uMYwkRuxdXnDGN5AG90La+PLuYQ1zyNOz5s7S1vgxj
 v/SLV5656N5Lg0SZmFAG9VmwImg/x/nyFo8C8f/LPBUgdryl7MM5fmv/+k438VwKG1gu
 PFBdG1sldG4Fhx8uCHji5n0xLBRVV9d/RfRTu7SQ4YIkJ8Z+R9BdXWyAFLb2WMWS1XkK
 vZPePyDnoOcVkgRq2pJuUULcakMR4GlBpbVEpJMbol7wQgLNV8Mc81AVeSa0mR42e+L8
 oKZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mWNhRvJL
Subject: [Buildroot] [PATCH] package/thermald: bump to 2.5
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
test-pkg config1:
BR2_PACKAGE_THERMALD=y
BR2_INIT_SYSTEMD=y
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/595287515

test-pkg config2:
BR2_PACKAGE_THERMALD=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/595287679
---
 package/thermald/thermald.hash | 2 +-
 package/thermald/thermald.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/thermald/thermald.hash b/package/thermald/thermald.hash
index 3a7c0f6952..eceff77d37 100644
--- a/package/thermald/thermald.hash
+++ b/package/thermald/thermald.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  3e5a5033339c021de41ed4f946dd39e13f79f722fb5bd98d798e83658184c39b  thermald-2.4.8.tar.gz
+sha256  e6515678ce8ff37978a453e1617a087a40ba3a31809a42c1768b6f816e564cc9  thermald-2.5.tar.gz
 sha256  e98be8bc482e038a14bfbc01caf800bbd0024fff275ef14cd999db6560254a8d  COPYING
diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
index 4e43277128..38f6b5a00f 100644
--- a/package/thermald/thermald.mk
+++ b/package/thermald/thermald.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-THERMALD_VERSION = 2.4.8
+THERMALD_VERSION = 2.5
 THERMALD_SITE = $(call github,intel,thermal_daemon,v$(THERMALD_VERSION))
 # fetched from Github, with no configure script
 THERMALD_AUTORECONF = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
