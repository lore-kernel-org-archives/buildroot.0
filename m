Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1C7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 17:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB51580E1F;
	Sun, 21 Nov 2021 17:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id koYsB5jsAZBf; Sun, 21 Nov 2021 17:09:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3251680E1A;
	Sun, 21 Nov 2021 17:09:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A38EB1BF3E1
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 17:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A060840306
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 17:09:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UTNB3XYmO4ZR for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 17:09:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7DF640302
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 17:09:21 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id b17so31913366uas.0
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 09:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P7IF5UnVvIso9JzqOHj0B+PmWZsQ6nrLcAyJAsOhfBM=;
 b=gZjaGDK5WRjRJ3/5yakRJQk08BPCZE543QRfuO0VFuCbRV67Zb2PEhOs/q5Rjrlr5M
 lgXRik6thuuDKt2FDTTYRtqO2bb8VIsFy3nmWYJbt+v3mEgsxoDA+BAq7OIaRY7mDgXG
 OOz3MIQsKf/gE6Dp8RuP+dno3/igjg3FvygMdZzYci4Okfsh2RIVd30BJEGw1gRatpr2
 4gJwGpRXHgdPwqXaC8q/UrKA0rfGE95drDYrUosa1OKLnkldNk3pp32wBkEtinLq2jxk
 Pl48pr8ab2XR2UGhNGPM93BBN9pQ3MjxcWuI80U4FnNXArWyH2JYrbJvqGpLl5uC6RGh
 WLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P7IF5UnVvIso9JzqOHj0B+PmWZsQ6nrLcAyJAsOhfBM=;
 b=t6yh9DFKMpYuG/AoCne1t2gYs/p7vbJNI6wryrNdNJwNcMpJ5m0WBbxOP3IKTd7Js2
 1GpKSY5se2JsIbLwrKpu7UVI4MttUgPPY8P/TEMnQ0M+9SKvx+w+twExTfugrwGAsCyg
 v2X2Pxjzo4I8cj6rTvjI9rYWFsqsXiqVg3q3yOpEzm/Yp7mQfaXPueua1iRIZa83Jfcs
 xce2BY12egIFRHGA1LH/FfStq4MdUfPJKHbQKH4DcsExWjaah+UOCXFhD+LaMKOnWI//
 Qx+wk+FT7QFdgvd//CJNz7cLchN9PbK5dn45UuSmMCy6+jKW/mMbk0ufkHJKDpgD2zk6
 lFsA==
X-Gm-Message-State: AOAM53047mhSHtaADdBJfWCZg4n0/sjhsFg5GeDDlFnU9IbooBFD1nMb
 5y3eea0+7vv+l97wXqW4kqA+ngpbaLA=
X-Google-Smtp-Source: ABdhPJx6KSq4vnwkbgHu7EeNLY+CAgardC+zEbgvp57yn85k/Zw8NpiqlAL0qsX8WuisgHwVRDQd6Q==
X-Received: by 2002:ab0:5b59:: with SMTP id v25mr74154881uae.57.1637514560826; 
 Sun, 21 Nov 2021 09:09:20 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id q9sm3159121vkn.44.2021.11.21.09.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 09:09:20 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 14:07:50 -0300
Message-Id: <20211121170756.3810922-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-next v2 1/7] boot/lpc32xxcdl: rename patches
 with the proper naming convention
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

As reported by check-package (by calling it directly):
use name <number>-<description>.patch

Output of:
make lpc32xxcdl-dirclean lpc32xxcdl-patch | grep 'Patching\|Applying'

Before:
>>> lpc32xxcdl 2.11 Patching
Applying lpc32xxcdl-2.11-compiler_name.patch using patch:
Applying lpc32xxcdl-2.11-delete_redundant_files.patch using patch:
Applying lpc32xxcdl-2.11-libnosys_gnu.patch using patch:
Applying lpc32xxcdl-2.11-slashes.patch using patch:

After:
>>> lpc32xxcdl 2.11 Patching
Applying 0001-compiler_name.patch using patch:
Applying 0002-delete_redundant_files.patch using patch:
Applying 0003-libnosys_gnu.patch using patch:
Applying 0004-slashes.patch using patch:

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
v2: new patch in the series
---
 ...c32xxcdl-2.11-compiler_name.patch => 0001-compiler_name.patch} | 0
 ...te_redundant_files.patch => 0002-delete_redundant_files.patch} | 0
 ...lpc32xxcdl-2.11-libnosys_gnu.patch => 0003-libnosys_gnu.patch} | 0
 .../{lpc32xxcdl-2.11-slashes.patch => 0004-slashes.patch}         | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename boot/lpc32xxcdl/{lpc32xxcdl-2.11-compiler_name.patch => 0001-compiler_name.patch} (100%)
 rename boot/lpc32xxcdl/{lpc32xxcdl-2.11-delete_redundant_files.patch => 0002-delete_redundant_files.patch} (100%)
 rename boot/lpc32xxcdl/{lpc32xxcdl-2.11-libnosys_gnu.patch => 0003-libnosys_gnu.patch} (100%)
 rename boot/lpc32xxcdl/{lpc32xxcdl-2.11-slashes.patch => 0004-slashes.patch} (100%)

diff --git a/boot/lpc32xxcdl/lpc32xxcdl-2.11-compiler_name.patch b/boot/lpc32xxcdl/0001-compiler_name.patch
similarity index 100%
rename from boot/lpc32xxcdl/lpc32xxcdl-2.11-compiler_name.patch
rename to boot/lpc32xxcdl/0001-compiler_name.patch
diff --git a/boot/lpc32xxcdl/lpc32xxcdl-2.11-delete_redundant_files.patch b/boot/lpc32xxcdl/0002-delete_redundant_files.patch
similarity index 100%
rename from boot/lpc32xxcdl/lpc32xxcdl-2.11-delete_redundant_files.patch
rename to boot/lpc32xxcdl/0002-delete_redundant_files.patch
diff --git a/boot/lpc32xxcdl/lpc32xxcdl-2.11-libnosys_gnu.patch b/boot/lpc32xxcdl/0003-libnosys_gnu.patch
similarity index 100%
rename from boot/lpc32xxcdl/lpc32xxcdl-2.11-libnosys_gnu.patch
rename to boot/lpc32xxcdl/0003-libnosys_gnu.patch
diff --git a/boot/lpc32xxcdl/lpc32xxcdl-2.11-slashes.patch b/boot/lpc32xxcdl/0004-slashes.patch
similarity index 100%
rename from boot/lpc32xxcdl/lpc32xxcdl-2.11-slashes.patch
rename to boot/lpc32xxcdl/0004-slashes.patch
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
