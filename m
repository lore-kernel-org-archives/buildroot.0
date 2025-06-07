Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55897C61CE7
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 22:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09BDE4099B;
	Sat,  7 Jun 2025 22:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f0CD17e9gfem; Sat,  7 Jun 2025 22:25:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46E99409A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E99409A3;
	Sat,  7 Jun 2025 22:25:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1CE31A4
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 22:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDE7660F0E
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 22:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwIgTxUeU68m for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 22:25:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A8EF60F15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A8EF60F15
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A8EF60F15
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 22:25:43 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-b0b2d0b2843so2130444a12.2
 for <buildroot@buildroot.org>; Sat, 07 Jun 2025 15:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749335142; x=1749939942;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hw52nYM0eepZTb1T2qSGhisFBXgEfsKvj9wDqmqubMA=;
 b=tTL3t/s631G2u/rZ11SWDzwQyOBt9X/+AQqe7X/5TiTQmjcpL8EaN1Y5VAH+pnQJ3I
 iAPkll/gi8NqF4PkVyiwjSsr4cqqAH6t9zW5LleOM/KST9JvLxkwynYSMZlgLZWtWaqA
 PlO6CTKOrxAMxiTElmaRFjVocThEUX4Db3BJOAcE4n6cfZBNh7/005OemavlXsCU4jn5
 f/+CRPSw6e+Q6q2f23/4pvSGycHfKU6E+Ip5V8pxlr2vgqPHykUAW7Doy8l0UtX4xcni
 FVMuS7fui96k7Qj7wb6XNcZlAer1lujVhERy+MK77W573Qtt4nAdFD6zAsEhUK8pVN1l
 Gfnw==
X-Gm-Message-State: AOJu0Yy3bb0IsBNFtGFgk7WaaHwgeNdWMw2x4+PKB95TVlvnlymUfiYC
 sOVYuXgomdHw5XPB2quSm+HAo/AhSsRRd/u7QHxBmuSyoDgwuEARv4NiUspqrJhS
X-Gm-Gg: ASbGncuCj4bwcVeVYZHyGxgIJL/PuV/myOg+2kfa38cHtNcmwT61cjyFoYisJG7zmuX
 ZFrTI6q3jYFULw0potpqV7aYD9BFeyhM6I5XS0qcUdXGGFxmJP0GpLyQdooZg1xBzYf3C/coto5
 o83LNnKd9vZbFs5VyBNalE5lKyoaq9NIxKIp60/jqo4DWSFt4rvgOioRcJNGpnkTldbSn/Bdqn6
 MwzE6CAzBQDzXjaCr7epS/xWhVqnzDfENbsSGiJsLfNRR6RcgVY1l392BOgqj6kqd6r5beGqHAZ
 mlGt+aDnbDDjzDcg0lu50N70OKGa+cXlJ1RXjeX8Izf0i9ct20bji216D8IHvsL7bPKzNp9gOo9
 JnyQFiyOD5nLf5NVnwJToy0MVRmYLYf+5ZYk+xHXgAU2VHG1x
X-Google-Smtp-Source: AGHT+IGW3h/89++1EBFIIdoktnpeCtjY/FocXrXeO0DiJ4PB0y7mZKsqJDCa0wbILRpMSuqbWjfRHw==
X-Received: by 2002:a17:90b:4c4e:b0:313:27e5:7ff1 with SMTP id
 98e67ed59e1d1-313472d3204mr10739305a91.1.1749335141869; 
 Sat, 07 Jun 2025 15:25:41 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603077fcbsm31741065ad.47.2025.06.07.15.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 15:25:41 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Jun 2025 15:25:38 -0700
Message-Id: <20250607222538.50866-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749335142; x=1749939942; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hw52nYM0eepZTb1T2qSGhisFBXgEfsKvj9wDqmqubMA=;
 b=JxFei/UvqDLovyxTtyh8pX9F+r4WFxFN7RDq2dyAl+TngF3oGxUIAuWQMeBm0prgSW
 B1VsBV4jde9R67em4DvMm6l/Y0oGIpSz/HN8REnDRud7XuH/WUdClbUIzaN0k3MoCv1x
 vmZvMMvxkj6Ps5zL2sn3lc1AHlEMRdvYos2l/vjhAvuFFWrY5j28gsf29JU/C58ykONQ
 RjUZwvVmsgvonMpaM62RvL7cHTt+1pvyD8v0WxB0mXxhKoeugsqdYsuh/HyrJvrGEW9T
 28FT/GYPZSKzLVwqteOtb46fPW9msmJEueEeyq1hS8SQGa+Pk67cIFFF4lTcCGe0j640
 pTNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JxFei/Uv
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.9.1
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/libgit2/libgit2/releases/tag/v1.9.1

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 3f11309750..8c9b210581 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  75b27d4d6df44bd34e2f70663cfd998f5ec41e680e1e593238bbe517a84c7ed2  libgit2-1.9.0.tar.gz
+sha256  14cab3014b2b7ad75970ff4548e83615f74d719afe00aa479b4a889c1e13fc00  libgit2-1.9.1.tar.gz
 sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 4026ac1f7c..f615484edb 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.9.0
+LIBGIT2_VERSION = 1.9.1
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
