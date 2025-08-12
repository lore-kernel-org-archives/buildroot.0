Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FECBCA0EC4
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 06:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2134A844F0;
	Tue, 12 Aug 2025 06:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfAT773eJhkl; Tue, 12 Aug 2025 06:14:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2632B844F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2632B844F4;
	Tue, 12 Aug 2025 06:14:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 08BF1B8B
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 06:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E39C341167
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 06:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOMaK6CnsXmg for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 06:14:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1730B40F2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1730B40F2B
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1730B40F2B
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 06:14:13 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2407235722bso51057545ad.1
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 23:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754979253; x=1755584053;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vyzovcO5h9tznxXiyok6xgwPqTWyAsqbfxF1Zjm/fTg=;
 b=kT2RQ4ZMOQjd64oDIOeqlPEEd50DrWyvZkIuz1Ma2df6jJjfDXlH1p7TN8zI06xnes
 6nXvgwvJ+oD5O51egtOa7ahrehVb0fstURh0HCBhzkJwypHQxxGsZgLzpVpxLt+PPnxB
 QuyYcIhew1XH0p/v3FNoxm46R0engkw7LgRs5hTu3NyjRIupkk++MGCu3WM9aOm4NaTs
 fpNSe9N+t7VhuyxkSVLhiQvF61nM1+Ls9jv9I5NIorjiLboFnCHVvcH3SYmLLQXHArXc
 o0lGt4yHto5KRcWKmyhuoA/0DFuAdNLShJh19DIuAAmjkSfi1w1ZTIXMhB4j0Ne9Onpx
 amxg==
X-Gm-Message-State: AOJu0Yzb5Xd5RprZZioOeXoksKrvk3VsR/7BvmmLrhxjdiweXRSg/5o3
 KW2LiY+WabmMFlCoyWA9eSVRX2ViAmZmf+8G1p8/aY4r8tZZ+89C/yIiKizgCwwE
X-Gm-Gg: ASbGnctv5FXnbIYREwrp1z337XxTJBMHJfHUiVT6rdcGH5t17XAgP0Bnl59PeIG/eed
 SmPljiU+ieTqnUDXSg1mIB4eXwtxMrwq8bJ6rOVvQ5rHMNKTGqspFdyuAG6D7VI8OFMywb7xwb1
 RT9+Xi6fg8Qq02fDiBoTZM2OxgAPPTn7gUXAUY6EgKC+0AtWE8ahweMUStcz4xpBhv5HYtP2r5V
 WxlJ1vicVo2ObMeyCQGAcUV3ajHjdTBGFhd84wBMe3fnlpxCNzp9EYq9v5u4OJ9nK5NFVYkh+VY
 JKU7h+0ja2rLHV5gfqtYxaY2Gl5PIuwjcLsE+mvaePWrdG40SqnHudHdzxanw+kK5S+uShaWOZE
 CWCHDflxoa3n2qLmaqnkyBZOD81rZ4TvrT21Ui8U5PzfqMfd0PkhQYk+7JLme+jQ/Ww88kYojhg
 Tynoh3pQ==
X-Google-Smtp-Source: AGHT+IGe4c7y9SiakQdwf1jTZ6laQUPMqKc5YNcKmGlkSsc9IK/I+y64n7EVOfY11w8tqEDkL+4nsw==
X-Received: by 2002:a17:902:dacd:b0:242:1ccf:65df with SMTP id
 d9443c01a7336-242fc228089mr33169605ad.13.1754979252914; 
 Mon, 11 Aug 2025 23:14:12 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm290726525ad.39.2025.08.11.23.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 23:14:12 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 11 Aug 2025 23:14:08 -0700
Message-Id: <20250812061408.1187401-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754979253; x=1755584053; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vyzovcO5h9tznxXiyok6xgwPqTWyAsqbfxF1Zjm/fTg=;
 b=KceHIlkH/fFJisJ3XGJekGgJgW1JmUDaai7Cl/o9K/d0j+DBO2xBoVKLabQl3kTprE
 u9XIRGlalg5bYcZgSO+d3Kt26Dhrwd26ljxT+6JC0QF5TJ81guhHH2KTgdjMO/CY4K57
 o9c+IprfpUzguZqS0GWAEMfv/yMu/Zn3O4xae5m7MYj9Wes63uOYKQcbc3b4UdW3lmTy
 oV/2KgcGI58FsNcZvQNHQq0jBc9Zka3XTfWhUk8sogf9VrBTkt9hWgUG7iLzho2iaEs2
 KZuXuscPrwVvwETlqEnRflz2N1QvYj5gxsoaWEk0C2juMyMbJYeRwznsc4uya36220nk
 V+4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KceHIlkH
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.398
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

Release notes:
https://github.com/vcrhonek/hwdata/releases/tag/v0.398

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index e3c6d881d5..5507a6b0df 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  09eee39e73a63ab27af651ab6afdd13d6e5c3485872f2cd406b35e4d80ffdb0b  hwdata-0.397.tar.gz
+sha256  cd52f7eb5c0f438a3605d1799d9f345a2894ad0f269ab6e8441f55e27e80dd78  hwdata-0.398.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 3d325978b8..fd914c238d 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.397
+HWDATA_VERSION = 0.398
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
