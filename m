Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3140FC3DA7D
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDA8D410AF;
	Sun,  1 Jan 2023 23:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDA8D410AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1GzIHPEZujSn; Sun,  1 Jan 2023 23:41:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DA56410B5;
	Sun,  1 Jan 2023 23:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DA56410B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5AF0D1BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36F61402F5
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36F61402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KaXe6HHfDVo6 for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FE0D4018F
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FE0D4018F
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:30 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id j130so18187618oif.4
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OIkI+usTVL1gqc0MrBBe3QN0JY20za25shzSRM5ZAn8=;
 b=7mSOUmRVwU3qJ070t48KeUfn8PPbUiFIdLOcpu9rdamZ3H0cNBqFk0a/mE6SxCCRUs
 tb3PI7sVV3x3M7sQCX0AvtfJTzw2txPGddAIoOCrrVEFamTb06o8zRWOnDtU5qtDdzF/
 UmieUEi6GNxYYKlWRc0Q8ho87uyoQAdb6SCDMu1Ih31rubzSxGgRgrHMEP5c02dIF7e9
 Dh1Lsi/tfGgbLp3NCdsO+0W7cRlw40RG2jxlqihhwqr8+1NAL22LDzus5rhnB/1saq+1
 /Qrr0BpZvZsRFjIIIIkeQ3RZiKnhMHpa/4uE+UTVxyxsgqyKbwedYdQno0n8bDc0XN3s
 itsA==
X-Gm-Message-State: AFqh2ko74QOI/KlpYw8zBmSPgv9umKg42ba1ZIFUZ1bFG2Nop/O13RKM
 SbG9kL3Ki+urBYFxUjQb2ajBf8FOYfg=
X-Google-Smtp-Source: AMrXdXtJaR/3KD6voqskaWQMDVRNMm3dWgK8R4xgd3Yg1n/OIh4zcs+IdDTNoLxh1DkILnkwqjhpCw==
X-Received: by 2002:a54:4115:0:b0:35e:a453:e7d8 with SMTP id
 l21-20020a544115000000b0035ea453e7d8mr17469981oic.37.1672616370184; 
 Sun, 01 Jan 2023 15:39:30 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:29 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:35 -0300
Message-Id: <20230101233653.487175-12-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIkI+usTVL1gqc0MrBBe3QN0JY20za25shzSRM5ZAn8=;
 b=CgHKx1Yd+w7mF0V1JlrqJnz2lLcfYuGTYtHt3iORnVCV1JA4mpPGzNvg7l7iq/BaYn
 4NcIvF0gXLeyfus3NYdC0e61XWxd1jR874F4PNF5X62s94r8pM20TJiDGfBSa3I9629O
 HruZydgkkYRY66uFr+l/qfa35vVW950fd9pKrbvp5ZLO6rrUFcbZQnEEVh6/Ht6b0ExT
 KpdXlCLAfAHi9eWYlj7gCSHmpBs2wiCVLXwSLI9IbwrefBL1gZ5WQo9lNbGTW7JQbkYE
 KyEXRhgXQfvsRsganTpjmPs53zNptoILqoyqMxnPM5bKt9tQe58BKayWYPbU0n1aNsD1
 ZinA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CgHKx1Yd
Subject: [Buildroot] [PATCH 11/29] Revert "package/zip: install to staging"
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
Cc: Jan Pedersen <jp@jp-embedded.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit c5b5b5ccabe35e11f0ca8db4361bb3f335fc59fb.

Commit "c5b5b5ccab package/zip: install to staging" contains a typo that
prevents installing to staging.
ZIP_INSTALLING_STAGING_CMDS -> ZIP_INSTALL_STAGING_CMDS

But the package does not install headers or libraries, only ELF and
manual files.
So instead of fixing the install to staging, revert the bogus commit.

Cc: Jan Pedersen <jp@jp-embedded.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Even in the case we fix the typo:
-define ZIP_INSTALLING_STAGING_CMDS
+define ZIP_INSTALL_STAGING_CMDS
using this defconfig:
 BR2_x86_i686=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_PACKAGE_ZIP=y
one can confirm the package does not install libraries or headers:
|--- output.before/build/packages-file-list-staging.txt.sorted
|+++ output.after/build/packages-file-list-staging.txt.sorted
|@@ -2346,0 +2347,8 @@
|+zip,./usr/bin/zip
|+zip,./usr/bin/zipcloak
|+zip,./usr/bin/zipnote
|+zip,./usr/bin/zipsplit
|+zip,./usr/man/man1/zip.1
|+zip,./usr/man/man1/zipcloak.1
|+zip,./usr/man/man1/zipnote.1
|+zip,./usr/man/man1/zipsplit.1
---
 package/zip/zip.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/zip/zip.mk b/package/zip/zip.mk
index 2d11e1c763..67958a4a66 100644
--- a/package/zip/zip.mk
+++ b/package/zip/zip.mk
@@ -11,7 +11,6 @@ ZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
 ZIP_LICENSE = Info-ZIP
 ZIP_LICENSE_FILES = LICENSE
 ZIP_CPE_ID_VENDOR = info-zip_project
-ZIP_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 ZIP_DEPENDENCIES += bzip2
@@ -41,11 +40,6 @@ define ZIP_INSTALL_TARGET_CMDS
 		prefix=$(TARGET_DIR)/usr
 endef
 
-define ZIP_INSTALLING_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \
-		prefix=$(STAGING_DIR)/usr
-endef
-
 define HOST_ZIP_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
 		CFLAGS="$(HOST_CFLAGS) $(ZIP_CFLAGS)" \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
