Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F7BC3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 07:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 572424175E;
	Mon, 15 Jan 2024 07:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 572424175E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R5byLqy6Sm2v; Mon, 15 Jan 2024 07:41:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CF2940932;
	Mon, 15 Jan 2024 07:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CF2940932
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8568C1BF396
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 07:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DCA54092A
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 07:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DCA54092A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DFVIDEzO5DvV for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 07:41:24 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4539C4089E
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 07:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4539C4089E
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50e80d14404so8101747e87.1
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 23:41:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705304482; x=1705909282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bNIDCFgKu/M9l0pHFjWDqBou9ucyRvr6yY1i6F8JrEE=;
 b=vnu5p1X1VDKjas+vrFMAZ8VaJMWtX3LpTefbnKpmaomScAKku6C+APkGWHC1s3N06u
 3r7oGs9HhTKVoJwNJU+rqnY3EzBN7pWPMRLW2WeYtUjQ29vTXvuOurQiQ3bgFd6Ooq4U
 muhLTW86OQojVX86KQV/W+1yUE+0pWN2jO/MSGsZUbBB385ps8UDXcXVldFTLV/RSf/S
 3nQaFAZLcO0S8YD1/GHdNU2fhzST/HRZF2Is36eHzJ6whrqUn0UU8DOFrgECcbMKCB9q
 teD/Z1g3WTjG9EBCG/Wr+n01VhSu0RX51KpvyK/5pl8yLOEiYBzPw0Zkup5Ykx1dXzgg
 U+wg==
X-Gm-Message-State: AOJu0YzdfiEO1VkWSilkiDu407X+lI6UWw6mtNtJUIDVoRpQgh4JiQy7
 Uv4KggXHZEq+wJ7yRnnySMjqcO4DeH/VwQ==
X-Google-Smtp-Source: AGHT+IEf9CU8uSR9TefrSmQCjWIhNsvK/G9MBxllssfH7JvYChxq50GxbDg0Gv7uM5EdmYLaTdhkVA==
X-Received: by 2002:a05:6512:b12:b0:50e:dc80:4f59 with SMTP id
 w18-20020a0565120b1200b0050edc804f59mr2722123lfu.18.1705304481812; 
 Sun, 14 Jan 2024 23:41:21 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.204])
 by smtp.gmail.com with ESMTPSA id
 fc6-20020a056512138600b0050e9c5b289asm1383913lfb.91.2024.01.14.23.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jan 2024 23:41:21 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 08:41:09 +0100
Message-Id: <20240115074112.157216-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115074112.157216-1-troglobit@gmail.com>
References: <20240115074112.157216-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705304482; x=1705909282; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bNIDCFgKu/M9l0pHFjWDqBou9ucyRvr6yY1i6F8JrEE=;
 b=TPJhIlFgyFm1DUoYibkvLeD5qUBZjvuGlq7w8gnclo6/xYB7ztgKOth8zJtT+90bHw
 xSCkCCZNf65p332pg9kiSsIe4OoXydwWZXrebT67uacRyi2KpdvNxSv3IVysEh5XYqmZ
 MbP5bbpnNGiz7OtmOV8nQwi1jbSSjMXagiEdAAApCkkaiVEJJGSaE2jzEhPwmi+jJsfi
 /5kHmDMRn6bD87zIXY5AL1zm8KZlE+1qqbHdKNm2ubIwiEGBDwLYSQqZqY8WWk5ubZ4Q
 yG4jmw1haE0V9kkjRdxMFHIYVdvhfZKcYn1RP87uUAoT5+yEfsM+Tfj7oaOKn6NQnWTH
 A2vg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TPJhIlFg
Subject: [Buildroot] [PATCH 1/3] package/watchdogd: bump to version 4.0
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 - Major feature upgrade, command line and .conf files compatible
 - LICENSE hash update due to update in copyright years

For details, see https://github.com/troglobit/watchdogd/releases/tag/4.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/watchdogd/watchdogd.hash | 4 ++--
 package/watchdogd/watchdogd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/watchdogd/watchdogd.hash b/package/watchdogd/watchdogd.hash
index 4ff1a3485b..0c228666bd 100644
--- a/package/watchdogd/watchdogd.hash
+++ b/package/watchdogd/watchdogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  33ec4edc8cb4ada7a4d8324a27d897d33aae5e83257ed64d3d37508825c11237  watchdogd-3.5.tar.gz
+sha256  7f38bc691353a51fc6feb2ccab60417c0284dd3f4d55c50d8b1781fda70d8101  watchdogd-4.0.tar.gz
 
 # Locally calculated
-sha256  fd685e20931174308c45a26418a7ce34d66704c4e4b92ab1d8299deb255cd676  LICENSE
+sha256  e233c56d807c74c67f2eff47ad03c216144cdd374d8d7578b996c28c260eadda  LICENSE
diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
index ea033b4e71..d140039540 100644
--- a/package/watchdogd/watchdogd.mk
+++ b/package/watchdogd/watchdogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WATCHDOGD_VERSION = 3.5
+WATCHDOGD_VERSION = 4.0
 WATCHDOGD_SITE = https://github.com/troglobit/watchdogd/releases/download/$(WATCHDOGD_VERSION)
 WATCHDOGD_LICENSE = ISC
 WATCHDOGD_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
