Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9BEC87FCB
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 15:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A11974136D;
	Fri,  1 Aug 2025 15:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12-edkbebw8o; Fri,  1 Aug 2025 15:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 087B041350
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 087B041350;
	Fri,  1 Aug 2025 15:38:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D8300160
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C947240A26
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83Klu_c4rsBC for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 15:38:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D561D4005E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D561D4005E
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D561D4005E
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:38:22 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b788feab29so1090051f8f.2
 for <buildroot@buildroot.org>; Fri, 01 Aug 2025 08:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754062700; x=1754667500;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5r4cnsq5ygEn+lkXaoQ4AJAufF2zFmJqGdmQYnUZWAA=;
 b=ra4j0ET97G05Xfa8i9Rm2JMc7F5IdW6g1XY1xAD7MWRSFfp/MxxylGcPorNiCFBZ8p
 8WpWZuwjU7+PCXj+YO+Ojw/JX9DVJCX4GhjbAow1kMlpDOtBbPOpdStq/uIeoxeVFnL6
 3585+V5tBtx2uGHQNz80lVrujdMwVjCInK/XkBSByx8rcXeadk1kObX8C0sQqJI9TAiv
 8DjvIknO3W1NepIOOOf0n3SbD0i2zcu09H0jnS/AEHfM7GpeefhPpnxsxIZmX1pL0sy+
 LFWdRt0vV/uCK4yIJku0TlYFC65GwAecTHrf4szdUTOgJfYeasDWVGHIHfIWUAwZISjH
 xo7w==
X-Gm-Message-State: AOJu0Yxxjb0dXEAePgnp8XmsH1PGfwmXpQwBpHWSy50H5bi37dLNxwIi
 IMR0jRNieIbict05LrpD6Lsf7DWgh3yvlA39GK3OB5CULGYhDLdAkfy6xXm0HrBEeF9YL011FH0
 +WHkw
X-Gm-Gg: ASbGncvBVBVXgo0YAY9Qj8vipgd/LWHt6O64hggOgCfbDN/5AXOWDIflZzhti+EnWrZ
 cUrg8pUfVwWbNhAG16ZniHNjVytJtu4kSqkn2peULo7NCnDvDF+r+jWzw2KNQ6pdjeWjig5iAk7
 AATdeF1xUITan3BAmLsFvHW6rTa1iRnl6Nv/CdYtk4I8nlQecCnLPh4Cy+RvK6HhMBI5hEpQm4e
 xjAJAs05ZOMl+PAQyn702fvz+pSfbKucXVd6ryBIpiqWkQduY4bwvgw6TjFK6+o2I7z8ATFr9JM
 1fqRdcV22aKjElqL12rZfGrQZQQQDWqE6fw7hct66PfAQpS+aobLtihrA2K8N95P7bJGGeIGEpN
 1sFkR35yw87BH2y+O1Irwb6zT
X-Google-Smtp-Source: AGHT+IHTH3v6txc5xlvImlDDdBPXHB6or7SvjYtl1i/isySPqhBOZHqQUHGZzN5xXuCfyRcysyq5lw==
X-Received: by 2002:a05:6000:381:b0:3b7:7cb3:1124 with SMTP id
 ffacd0b85a97d-3b8d9468524mr238127f8f.11.1754062699948; 
 Fri, 01 Aug 2025 08:38:19 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453c75sm6324170f8f.41.2025.08.01.08.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:38:19 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Fri,  1 Aug 2025 17:38:19 +0200
Message-ID: <20250801153819.2086037-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754062700; x=1754667500; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5r4cnsq5ygEn+lkXaoQ4AJAufF2zFmJqGdmQYnUZWAA=;
 b=QNajZqHBA18BjPQvUoFKdlSSGNJ8qjHWDWQimEOiE+FGuK7Z+dRHV4vze40+J6iHvM
 VMaJXJPOK8/oNwsjcXdYeT4cYRrEdUAa50i3QeYajvi9zoV9Pp+mAXJWT2mz3E5Ys/NS
 VsLVhQJhGlb2v8loNXDlCMARPI8t8mCr7YNpUsyv2S/n4iVcvDXLD+9cNl7UyNCINiIx
 p8zi9yOzMRw56iyOCgOru7oScfjSf2kJuUImPdYzFPE8f+34OLlKJBe+IAmHFe26Gdw1
 f3mTPRGv/Ltz7IhLHlsUozBWdeE7ZYitvp4N0QXSh1Ibp1R+PwvIna0yqQk/qFYxNFmm
 rl9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QNajZqHB
Subject: [Buildroot] [PATCH] package/php: bump to v8.3.24
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a bug fix release.

For more information, see:

 - https://www.php.net/ChangeLog-8.php#PHP_8_3
 - https://news-web.php.net/php.announce/466

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
Tested with `support/testing/run-tests -d dl -o output_folder -k tests.package.test_php_pam`
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 29162bd008..dbb130f30b 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  08be64700f703bca6ff1284bf1fdaffa37ae1b9734b6559f8350248e8960a6db  php-8.3.23.tar.xz
+sha256  388ee5fd111097e97bae439bff46aec4ea27f816d3f0c2cb5490a41410d44251  php-8.3.24.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index b431d839fb..5460f440cb 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.23
+PHP_VERSION = 8.3.24
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
