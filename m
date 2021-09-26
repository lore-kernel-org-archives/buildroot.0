Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA5EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:24:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA53660E54
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA53660E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AE7240327;
	Sun, 26 Sep 2021 21:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_I6hQxpz5BY; Sun, 26 Sep 2021 21:24:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E552C40266;
	Sun, 26 Sep 2021 21:24:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9CAF1BF370
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A97FD40266
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uqqgog3hesTm for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:24:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AFB740245
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:24:33 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id x20so1467309wrg.10
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 14:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RY2YCnkgkcKw7nZi8VgCg0EArOslMmfUrd5Eho3e2TA=;
 b=Uj/LnBKq06/Pnjbi2L1gCHvqp/vFbwfB6u8rE245DlEx5bfnIdKE7jkCwkwP7rh8AK
 KDrC+XlzEMGbxUkTg66beA6df/6Jds+1/3LifbN5ShRN/PftCDuoeLmed9Ro+v3fnkku
 9Umme+UAVG0hcPbveFfvEanNsVr3XbxtlROqgux/DOe9sv7yFTDWyUq58kHpLV/JyFBG
 6xbf7poMMpGEOKSNSHtB6Qpiunc3wZawR5M53i2Gv++k5zC9n9A5kE+ywzQ5Cp/ZEoaz
 X+roQpbSvqRP/axzC8jVluwGC3S3048wLD/1ZHFgLVAvjXsdkWExrrVU9Fb66w6olhzR
 Ta+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RY2YCnkgkcKw7nZi8VgCg0EArOslMmfUrd5Eho3e2TA=;
 b=WdAQsxcxY3l2V791xkP3YKKxcRwS8lEd8nRF7A5n7miEfpwJ74T/xVcAybUm028Eq8
 sO3bK8b6E3IAKtD9DIzVAK17s930+oHqeFaHH6sOqVovEy7S/VyAd7EabFcA2c0BZvO0
 ITMC2VzVnebok/YO//VNmm+Zjwafi0DfzM0685FkmgUYs5CP8uBpSQc7jIqzKfny/ZJD
 k+wSOsr+JNZTSnPwlpmB6iUlm3sSyv5yRg5/PRd+yqRoLY7Q2IEw/9yIdOi8rmN7ML93
 VOyw9guAione1ll5LMF6nnTCPtrI658zbGEihTJnxSvs/f9s/E3iTDs/7n/XoNUe3EGW
 hL1w==
X-Gm-Message-State: AOAM532jKTdma5HIMu/0MQwtYFGhW/qAxj/tFeYAKFK0SzEPt55WR4Ey
 seuVbAxLMg9ckqzyMmXdYT2x5IMkfRI=
X-Google-Smtp-Source: ABdhPJzk9M4zNxPaGqB1x05AfImSBTXwC84PJHMX6RAz3jGZLqDlaD1N7YVpBmmsFwt1fksgMno7VA==
X-Received: by 2002:adf:f64d:: with SMTP id x13mr7126769wrp.360.1632691471608; 
 Sun, 26 Sep 2021 14:24:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id i203sm19230114wma.7.2021.09.26.14.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 14:24:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 23:24:06 +0200
Message-Id: <20210926212406.914262-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/liburcu: bump to version 0.13.0
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update first patch due to
https://github.com/urcu/userspace-rcu/commit/3f0dd283a89ab114ffbf5c3dd46463217c6bb2ff

https://github.com/urcu/userspace-rcu/blob/v0.13.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ly-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch | 22 ++++++++++---------
 package/liburcu/liburcu.hash                  |  4 ++--
 package/liburcu/liburcu.mk                    |  2 +-
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch b/package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch
index 658e1721f0..554c4aba1f 100644
--- a/package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch
+++ b/package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch
@@ -8,17 +8,19 @@ their latest releases based on gcc-4.8.2, then only blacklist gcc 4.8.0
 and 4.8.1.
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[Fabrice: update for 0.13.0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  urcu/compiler.h | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)
 
-diff --git a/include/urcu/compiler.h b/include/urcu/compiler.h
+diff --git a/include/urcu/arch/arm.h b/include/urcu/arch/arm.h
 index 1e30903..56115f1 100644
---- a/include/urcu/compiler.h
-+++ b/include/urcu/compiler.h
+--- a/include/urcu/arch/arm.h
++++ b/include/urcu/arch/arm.h
 @@ -118,10 +118,17 @@
- 				+ __GNUC_PATCHLEVEL__)
-
+  */
+ 
  /*
 + * Official gcc releases from 4.8.0 to 4.8.2 have the following bug,
 + * however, many arm toolchain providers have the included the fix for
@@ -29,12 +31,12 @@ index 1e30903..56115f1 100644
 + *
   * http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854
   */
- # ifdef __ARMEL__
--#  if URCU_GCC_VERSION >= 40800 && URCU_GCC_VERSION <= 40802
-+#  if URCU_GCC_VERSION >= 40800 && URCU_GCC_VERSION <= 40801
- #   error Your gcc version produces clobbered frame accesses
- #  endif
+ #ifdef URCU_GCC_VERSION
+-# if URCU_GCC_VERSION >= 40800 && URCU_GCC_VERSION <= 40802
++# if URCU_GCC_VERSION >= 40800 && URCU_GCC_VERSION <= 40801
+ #  error Your gcc version produces clobbered frame accesses
  # endif
+ #endif
 --
 1.9.0
 
diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
index da7d12a76c..8ff11623d0 100644
--- a/package/liburcu/liburcu.hash
+++ b/package/liburcu/liburcu.hash
@@ -1,5 +1,5 @@
-# http://www.lttng.org/files/urcu/userspace-rcu-0.12.1.tar.bz2.sha256
-sha256  bbfaead0345642b97e0de90f889dfbab4b2643a6a5e5c6bb59cd0d26fc0bcd0e  userspace-rcu-0.12.1.tar.bz2
+# http://www.lttng.org/files/urcu/userspace-rcu-0.13.0.tar.bz2.sha256
+sha256  cbb20dbe1a892c2a4d8898bac4316176e585392693d498766ccbbc68cf20ba20  userspace-rcu-0.13.0.tar.bz2
 
 # Hash for license files
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  lgpl-2.1.txt
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index fa2ad0de83..c0a44764f1 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.12.1
+LIBURCU_VERSION = 0.13.0
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPL-2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPL-3.0 (few *.m4 files)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
