Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB980C83F26
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 06:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85520407C3;
	Thu, 24 Jul 2025 06:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtALJb3v8Sg6; Thu, 24 Jul 2025 06:18:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C812B40B50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C812B40B50;
	Thu, 24 Jul 2025 06:18:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F530DA
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 06:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 354BE411D3
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 06:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSRZstQZAxCg for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 06:18:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 69D0B4030E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69D0B4030E
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69D0B4030E
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 06:18:18 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6097d144923so1451594a12.1
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 23:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753337895; x=1753942695;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JdIy/4VrGQopk8Wu3TUVtAwgL2HqDVZLWFA/HcyrKog=;
 b=M8Q6KFsEgUa8ly5sAFWHwweXau8iDFGuq/up5DHL04am7FDvIuy/QXSvuuNRF+0XnN
 V+n95A7/LGUemaPpn1p7d5xSV29ef5VwwNMMzf9E471hiu7lOizibS5JQCfLWusOsS+J
 gjBIzx/K85XGjN253aTgSHnae5+/LSLjQxoui3xRUnpEI/0PbsztPGmtl5bI/HF9d4hg
 07tFS7ziw6JMY1hl+rpQ4oCrcx8msNV226eMxwBiYGLcC15wqi4a3n1SuQswp4vpLg3u
 AJ6a17AFTHRrAazAhIeXkrX+zuPhhLqusE8BVs1yOxnwilaEua+ho/GyHjmxqcPxwRYF
 lIwg==
X-Gm-Message-State: AOJu0Yw91u3ZUdr+BRisIMPy8oqAUcVWbCzj6qbTDx49TkJcs/dzIl32
 YH6hEKSgfN7m3AWILZZ6O2OUM5R0mzEupBQbbD9z523+kJc+a1+lwQsT5tqyPA==
X-Gm-Gg: ASbGncsDm8pfOPez4Wmv/d440vbin6IvH/mXIJto7ewJ/UWugfBRfMVpxH2g8TsYOOw
 p4w28ka6xniHgBJOV1S/qlTK+f/Elt8TULnSxcUnH8/+1DO2bJYVvr4wunSwYfmB69sr3oCXE6s
 wnwPvJ1gnTniIwM/G6eSmlVQu61Df68LEuxEgdICLgu4A1aVYgh0y/GK4DHj5EP1xkpRaYxXmpI
 JF7y1cEcKgXjWLFTCHytcle5k4NELE1srGL5/vaLgJmApLjXxu+McHxCfxz05ftnrwEmbhWcpjT
 IeQc3IDKma0yHvsAitEZ3c5lZMo7QpSkin/jUMd0cCxH5GJb7H5HXsKK5K8EvcGk6rUCNkMdZvh
 PWoMyAWngYMYvC99trPRa6od335xEyp9/GhqKoJgBtNEayoryiVVE4w/u/M8TseWQb3mDiBliDi
 7EQGI=
X-Google-Smtp-Source: AGHT+IGA6KMgca1mPTFlSYACh2bC5aXR/CUqyR/SDqCEI90rD6gE/TmyHhWPkQQ0JYArLPH8SOCFLw==
X-Received: by 2002:a50:a44b:0:b0:60c:3ecd:5140 with SMTP id
 4fb4d7f45d1cf-614d130ccc0mr507437a12.0.1753337895236; 
 Wed, 23 Jul 2025 23:18:15 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd31df62sm432955a12.57.2025.07.23.23.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 23:18:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 24 Jul 2025 08:18:10 +0200
Message-Id: <20250724061810.3677507-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1753337895; x=1753942695; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JdIy/4VrGQopk8Wu3TUVtAwgL2HqDVZLWFA/HcyrKog=;
 b=btT93Zl+CZ+M+ia9Uxx6VKOh2wORQQiW/WYdvvNgTWdzpAZYbkFQY2zq/YVQwSBlre
 8n7A9ge/11zUlj6mTWRw1qSHFo3s43j5rLdsJW0rNekN1i9Cfg0waEWLZ5MofX3dNhhy
 68sl3NVT19cQVmhcS9d9z6HwAbcIH+XDT9jna+6/kgO4mtRHCrs/1+UYlAoV6JLzJPd+
 h2VcGFPbF0RXekhkbKtKKz2s1pyHrMh5yY+FJx4VOdmeiJqjwi5JbkMmicbBBPEPQ+F1
 iBnPde0JzH4nDQOggPcwWnZPjNOBEzD3DFAikDF1hitGZmi6Fqz0oyT8Pj2bQJyJivAH
 PuYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=btT93Zl+
Subject: [Buildroot] [PATCH] package/avrdude: remove the obsolete hook
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

CMake recipe doesn't create a backup of the avrdude.conf.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/avrdude/avrdude.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 619987119b..79447a6205 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -29,12 +29,4 @@ ifeq ($(BR2_PACKAGE_HIDAPI),y)
 AVRDUDE_DEPENDENCIES += hidapi
 endif
 
-# if /etc/avrdude.conf exists, the installation process creates a
-# backup file, which we do not want in the context of Buildroot.
-define AVRDUDE_REMOVE_BACKUP_FILE
-	$(RM) -f $(TARGET_DIR)/etc/avrdude.conf.bak
-endef
-
-AVRDUDE_POST_INSTALL_TARGET_HOOKS += AVRDUDE_REMOVE_BACKUP_FILE
-
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
