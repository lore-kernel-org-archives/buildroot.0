Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05D6C6FA8F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 21:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65CD1418E3;
	Thu, 24 Aug 2023 21:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65CD1418E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sChTL8Pr_3vo; Thu, 24 Aug 2023 21:28:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47CF2418B4;
	Thu, 24 Aug 2023 21:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47CF2418B4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B3401BF84C
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24701835F2
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24701835F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DskD-_VjROLe for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 21:28:13 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80F728375B
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 21:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80F728375B
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31aeee69de0so192801f8f.2
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 14:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692912491; x=1693517291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+51mhXEA56MeHpaNjmsUEntoaR9hlnaaP8FvP8i+3B0=;
 b=jgSAryl98p0kj1p/9OagRFClgsQXrSEuxSXUXZemQwerLzlbybvhrHKkjhl1jwXh4h
 kelTDZDV2K83mLzsbySCungSNtS2V088VIZG85otpdKFGHiJv/OPR8YJTbShBCgMmmn2
 D3uSYPzoT71cAHhY3Xr/f6vmXjdoNpdqR7NHmhGDVeNj7h6o/8FRDmuNYvU6thqPeEde
 1YBEo/OG7/rGB70JZDUcdIzusSmZqn3eYb7SdRRVmWlWWUuq7D4utcI23HXQuQmPYi/o
 km13vDjp3St8qr7cw/DqEgZwRO3FS34TASC8n3nvbYDWBd7GxW1XTcTE826aswPzLmab
 o0RA==
X-Gm-Message-State: AOJu0YxAvnaWwNRdWZzv2aBfjw5Q4zj2wYuq27jIuSNPgJ0+I28kXtjv
 VmuUUbQzZoU+6sQKnvgKmBCcPgqt/oY=
X-Google-Smtp-Source: AGHT+IE3uOSxUQOXKb7EXScVfPPotzNl1I8eNI17YB8qE1js/OpvCFJYL6F4i1eitAYmEZwjX4WXVg==
X-Received: by 2002:a5d:62ce:0:b0:31a:e972:3601 with SMTP id
 o14-20020a5d62ce000000b0031ae9723601mr13751582wrv.54.1692912491441; 
 Thu, 24 Aug 2023 14:28:11 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:ced9:48d:9640:c8a7])
 by smtp.gmail.com with ESMTPSA id
 i20-20020a5d5234000000b003141f96ed36sm301770wra.0.2023.08.24.14.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 14:28:11 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 23:28:10 +0200
Message-Id: <20230824212810.4166630-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692912491; x=1693517291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=+51mhXEA56MeHpaNjmsUEntoaR9hlnaaP8FvP8i+3B0=;
 b=VBZgkPcbE/ACZwCksZuVGcQFgy94/VKLuWWX1fDvlG3M4DetITlzkr7c2w2eayypCR
 iBtyLJy4GnZWj7XyCVKENRFJhy1K2G9q5uc+9pWdG7wfhcRZ1T+RgUQ6pcMidcXguhYr
 ZMwPJUKkx06c2XobLjvv8NQRaHZQUmj1J8GLmShurihNPzFcS8tKazvuIgTsAT6RuyJ8
 nl6Mih6H8SMm5tmYbvJbcMXvr262UK8WqqUP/tGJ/1ySSDY7B41SIce8tGmlCj1wh+bu
 /pfZbpvBZJ4RHh5xTEOnYR9Sj0LAWkUwdk6HPRRd+ZxNHDHMotgGy9FFw7jTC25tBNae
 FBxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=VBZgkPcb
Subject: [Buildroot] [PATCH] package/check: don;
 t conflict with release archive
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit ee93213d18bc (package/check: fix compile issue due to missing
source file), we switched from using the released tarball, to using the
autogenerated tarball from github.

However, that means that the filename of the archive did not change,
while its content did change. The hash was promptly updated, but that
means that the archive we cachec on s.b.o (and possibly the one users
may also already have locally) will not match the new hash (and
conversely).

So we switch to using the sha1-hash of the commit conrresponding to the
tag.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/check/check.hash | 2 +-
 package/check/check.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/check/check.hash b/package/check/check.hash
index 9b380ddc28..a8cec60d16 100644
--- a/package/check/check.hash
+++ b/package/check/check.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  998d355294bb94072f40584272cf4424571c396c631620ce463f6ea97aa67d2e  check-0.15.2.tar.gz
+sha256  20e7360f5774844c09fde696e5bf71d061e9f53b3d763d886d3318d8893fdda4  check-11970a7e112dfe243a2e68773f014687df2900e8.tar.gz
 # License files, locally calculated
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LESSER
diff --git a/package/check/check.mk b/package/check/check.mk
index 0bdc9b93ef..95fe5c9d57 100644
--- a/package/check/check.mk
+++ b/package/check/check.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-CHECK_VERSION = 0.15.2
+# This is the same as tag 0.15.2, but we can't use it, as to avoid conflict
+# with the released tarball that was incomplete
+CHECK_VERSION = 11970a7e112dfe243a2e68773f014687df2900e8
 CHECK_SITE = $(call github,libcheck,check,$(CHECK_VERSION))
 CHECK_INSTALL_STAGING = YES
 CHECK_DEPENDENCIES = host-pkgconf
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
