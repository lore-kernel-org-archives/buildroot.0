Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE4FC4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 21:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 743A14023F;
	Thu,  2 Nov 2023 21:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 743A14023F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8QOiuJTfvGcr; Thu,  2 Nov 2023 21:30:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB6F84028D;
	Thu,  2 Nov 2023 21:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB6F84028D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 794DF1BF59C
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 21:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 525F57048B
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 21:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 525F57048B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XuXOBIMDQlKq for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 21:30:12 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3804B6FBE6
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 21:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3804B6FBE6
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32ded3eb835so938435f8f.0
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 14:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698960609; x=1699565409;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WBSTe5LiKpJPZfPuTE/1Es7uea+/LlDiq2PIa6+DN4w=;
 b=p91r1+rvl7uh/wZDyDj1FAoltLE+yEujlpYDYQk7qwis5+ZecYEkGhvOnanoorDCft
 DtVPAdb13z01oWinNvHxSg+Bqd3T/mYCc+t4p/7CExCwMVcEgLT9AoANhw5kuSMiNI/E
 oIMy+EsyJNcwnNauGmHPejospMpxNh4hI9XgLrt2z5c8cvbF4UrkWyAn0sI7zk6bZs1Y
 ZQgBp3NAmNEq1KIVEO+hkACL3r7wJ3qpgRK/GcjFCOK1v4XGhAblNTH47z929YzrEulN
 MTz67dBZORWftWahih3qf2Xjj8SbawsvdlanCo0cxFaZZcs3l7QUGmZfRHsDDppO+pS8
 ugog==
X-Gm-Message-State: AOJu0YzK/L1+A6Yo4+ij8NfOjS3KKbAEdxDFhQrfOhBqYFYeVQsNT6tI
 2YE6GoBsTfs+pUqah8Yt2rT5ogcWk34=
X-Google-Smtp-Source: AGHT+IFqYl7hG85fAC55RmxRSxaCeSxoUnplccq2MdiMEDf93mXZmGZYPHoYlBkfj77jIIpSgg1jxA==
X-Received: by 2002:a05:6000:4020:b0:32d:b06c:80b2 with SMTP id
 cp32-20020a056000402000b0032db06c80b2mr15849615wrb.0.1698960609335; 
 Thu, 02 Nov 2023 14:30:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t9-20020adff609000000b0032d8034724esm290930wrp.94.2023.11.02.14.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 14:30:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 22:30:03 +0100
Message-ID: <20231102213003.188452-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698960609; x=1699565409; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WBSTe5LiKpJPZfPuTE/1Es7uea+/LlDiq2PIa6+DN4w=;
 b=dU4CPKaH1b7hunH5jq1PbqTPm1b3Sei8BsrBxAL59pmBQfKqruDF07gklSNeW05cE1
 aMVaBTFlbtKcOSe2SfuL4+EkekOwsyo9dz4DFt8I5VNQuJnkrsghKKKM5WDOS8xy9Qtq
 LIVMRJ5lXLxk+gEwRy/4xu0QKNorGapYADnEQ8rJP3LNThbzuGnxf3MfWVQRBtGBG73h
 yjyr2TiQr2RdjekfndnoyntFnC6z2DSHkrT3D8HR0o6YcMYbwpf/wY66q8QLCgDARKlo
 XOTFwLyRIduFN1dXh0vOwVUV2Vj4mJ6Y+JHbC5vsx8RF6h5yk6QBkRvq1HBNUBwcib7F
 +UeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dU4CPKaH
Subject: [Buildroot] [PATCH 1/1] package/civetweb: bump to version 1.16
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

Update hash of LICENSE.md (Additional components Copyright (C) Lua.org,
PUC-Rio, with MIT license added with
https://github.com/civetweb/civetweb/commit/82ba5a04c9a1ca980d8dfe00c18e086017e8ab25)

https://github.com/civetweb/civetweb/releases/tag/v1.16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/civetweb/civetweb.hash | 4 ++--
 package/civetweb/civetweb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/civetweb/civetweb.hash b/package/civetweb/civetweb.hash
index bdf6d77427..0daa6efee2 100644
--- a/package/civetweb/civetweb.hash
+++ b/package/civetweb/civetweb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  90a533422944ab327a4fbb9969f0845d0dba05354f9cacce3a5005fa59f593b9  civetweb-1.15.tar.gz
-sha256  24d3d2aee56ae3cddcdf3392c1250877818108314233cf15f2bc9eb3ac298934  LICENSE.md
+sha256  f0e471c1bf4e7804a6cfb41ea9d13e7d623b2bcc7bc1e2a4dd54951a24d60285  civetweb-1.16.tar.gz
+sha256  bc24af9ffb777f4842f8556ac752efd5ea212c55d2eccfae58cc2c2a24ea1f03  LICENSE.md
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index a299de85e9..633ae21c00 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIVETWEB_VERSION = 1.15
+CIVETWEB_VERSION = 1.16
 CIVETWEB_SITE = $(call github,civetweb,civetweb,v$(CIVETWEB_VERSION))
 CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
