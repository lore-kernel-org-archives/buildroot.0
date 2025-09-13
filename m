Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4ADCAC587
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 16:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DA3960E3A;
	Sat, 13 Sep 2025 16:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUGEtDis6rDU; Sat, 13 Sep 2025 16:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AB9560E34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AB9560E34;
	Sat, 13 Sep 2025 16:35:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ADCF525B
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 16:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB1484003D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 16:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIDT687rpz-9 for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 16:35:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF9884002B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF9884002B
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF9884002B
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 16:35:05 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3df2f4aedc7so1889710f8f.2
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 09:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757781303; x=1758386103;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iHINGrC5XSUXCFmj14MJ4YQIWvj8rSDn/eHGXzYbq8s=;
 b=YocpN5msuqK0mISFmNlvuA+yL3Xq/blb33LrfdVfz+dR2PjANYTzN4gDjSSOU/NFX0
 H9naUWR2QB3i9z5BdrEd/ojAFJVTRpW+vfoSlJBqBGrG41oznmSIfnwR3odY5zfVLRA0
 B6D1EFLzxNEduFaxZRHORsb2+iurEq8aAlRQIhHc4IBO5ZaqwP/uR73KrlaEA2Re8bpk
 FeA03TAjgyYX4SBvwLqh9MSEty0fLDeufsBb3yjHRG563ZLsMgB9ExC3y2LAKOPg1l/M
 T2wBJrkiI+APZx3Pn9/XNCme5163r0sjhDcfK7IN2TU7ljvGyhHX12UQSZ0NbLeCG/Y9
 2hew==
X-Gm-Message-State: AOJu0Yw8BODxRAbdEWJpaTOtbvjbWhLws8qTli/x3By47R0xmPqRkz90
 l75YwFfh3BL1mNb/cO41sbJuS8ETh71bkSnT2gcwtNzfcDbtNgfXq+6MaFm/mLvEfvP/kbT8mVQ
 QAzKIl02awQ==
X-Gm-Gg: ASbGncttIMaNvJ/fJ7xf0nDF/EeREKynX6eN6LSGE9GiiDqItzAK6WxAHTLTB3LTTfc
 mP8O/fTkAiPDKZTjlu8rWdH5xBehkL3H1B5ztB+nNUxb21XGmjiQC1XDlW//Hr70yQxGbwj1LtY
 mf1kgUWfWxDdLfOUO3phE1/wM11pY1kS9QnPIYebvt+4okkjZUPGWUnc7J0zd/O89xw7YS/DU7D
 YOnWJ/uP33EabDx/xCRzdE0eiS7Lo/FxZ8IIaNbQbwtq7vBZ7A2lSsBGwP3noUQNLQlZGF00G58
 kbaWsbkWRPuVUkfyTuXM9kwrL/rsPy0GKjbikP14lnjGmQi6jS6DZgO+RkpylHob07lGQQTYSQR
 fZqoaJTYmaEu6eOjKt/DUlAfgbI8bfctha130HpKOjrUIrMfcRe9uLsHdtQ7GbPGQFjYFMO5SWI
 wcTsqp+CF9nUqmf4+p24+Z
X-Google-Smtp-Source: AGHT+IFuMrlU0g957Uc6DYT+lKL+GlB6cb3DFJYhwltruIcW5rmJrXOm1Nh76OpljmUNjiPe7+PwFA==
X-Received: by 2002:a05:6000:1847:b0:3e7:5fca:2177 with SMTP id
 ffacd0b85a97d-3e7657b08d8mr6107166f8f.11.1757781303251; 
 Sat, 13 Sep 2025 09:35:03 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7d369ea3bsm5219042f8f.0.2025.09.13.09.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Sep 2025 09:35:02 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat, 13 Sep 2025 18:34:58 +0200
Message-ID: <20250913163458.2608400-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1757781303; x=1758386103; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iHINGrC5XSUXCFmj14MJ4YQIWvj8rSDn/eHGXzYbq8s=;
 b=k4cWZPJtYGknaTgm8f/WjPQBuxE6WZSgFknV9l3Iu2IekXCpmqDblfowoREI3N+xy0
 F3AlKyr45MJDbd35jlzdcggLUsPY7TnvyKIWY8K/SiJHwbmJeyw+yfNzDwgBYnmCW3hr
 KsequDC28yiqKua9YXvEjTI0woo2qlbqatek8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=k4cWZPJt
Subject: [Buildroot] [PATCH] package/mariadb: workaround cmake < 3.30 check
 TRY_RUN issue
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The last mariadb version bump [1] added -DHAVE_SYSTEM_LIBFMT_EXITCODE=0
to workaround cross-compiling issue during libfmt cmake check.
But it actually requies at least cmake >= 3.30 to work.
Indeed, our docker image used by Gitlab-CI uses cmake 3.25.1 and
segfault while testing for libfmt.

  -- Performing Test HAVE_SYSTEM_LIBFMT
  /bin/bash: line 1: 163369 Segmentation fault

  $ cmake --version
  cmake version 3.25.1

Using the same TestPerlDBDmysql configuration locally with
cmake 3.30.8 installed build fine.

Looking at cmake cmTryRunCommand.cxx history from 3.30.x show that
several fixes about cross-compiling isses were applied to cmake 3.26.x
[2] probably solving the issue. Requires BR2_HOST_CMAKE_AT_LEAST_3_30
for now, since only cmake 3.30.8 installed locally was tested.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124486 (TestPerlDBDmysql)
https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124439 (TestMariaDB)

[1] 6cd8f95346 ("package/mariadb: bump version to 10.11.11")
[2] https://gitlab.kitware.com/cmake/cmake/-/commits/v3.30.9/Source/cmTryRunCommand.cxx?ref_type=tags

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mariadb/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mariadb/Config.in b/package/mariadb/Config.in
index 503f884c62..b4c276a72f 100644
--- a/package/mariadb/Config.in
+++ b/package/mariadb/Config.in
@@ -14,6 +14,8 @@ config BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_PCRE2
+	# HAVE_SYSTEM_LIBFMT cmake < 3.30 check TRY_RUN issue
+	select BR2_HOST_CMAKE_AT_LEAST_3_30
 	help
 	  MariaDB is one of the most popular database servers in the
 	  world.  It's made by the original developers of MySQL and
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
