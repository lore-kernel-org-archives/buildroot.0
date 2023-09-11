Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCE3EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 08:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAEE940AB5;
	Mon, 11 Sep 2023 08:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAEE940AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ea9_LUuv_FO3; Mon, 11 Sep 2023 08:50:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1995440B24;
	Mon, 11 Sep 2023 08:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1995440B24
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8742B1BF27E
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 08:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FEEF61005
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 08:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FEEF61005
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z-UpF2OnVqZF for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 08:50:20 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B31360FF8
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 08:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B31360FF8
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-68fba57030fso693434b3a.3
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 01:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694422219; x=1695027019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rgRZfZxtLDSl3p9nBLfJBugvj42ylxgia/ftPWNsBB0=;
 b=FASNKRELWfoip5jziOIy/pYwjFgsPlzMUI7UegGfU59xDFdVjVWufeNxHA6bpdvOkj
 EsJy6g/Ctl4vFdUu9uxItR3RMsUS3Y54e8iKqoUIGa07SeWGboY1/tto8yeJAmSxpsSw
 8oQWsxYqPTUZdW9jcHzs8fpLb3YTtDkkg5lqCBIkW5YP3mwZ3eeZTo63333igVZNfiYl
 Nu+bkvTJ+6HsckoTRywMXkAlJ1UOyIsgZyHkQSn/g019xFneqKq8VevXUheX7j9T4++b
 i2WYKbL86JzIQB1sejEYSYTNIHDCQ2VMzm7G7/WeXAGsHEKAt7L4ZVg4KImJNZWU8lIg
 h9pA==
X-Gm-Message-State: AOJu0YzrAkKdBaIccnPh0Is9kqL4ayCJv7RFRr1gydyurE5M5nciIHEg
 U5iqtUBXx3mj8+4sC14TZqFq2A1qBGeuUA==
X-Google-Smtp-Source: AGHT+IHan+jg+jQB2ttlwYvbc1q63VYGAZ8kF58PhEbuB9whjwz7mwgOCZUtlalLxuP9GG4qt/rhsg==
X-Received: by 2002:a05:6a20:548e:b0:14b:8023:33c8 with SMTP id
 i14-20020a056a20548e00b0014b802333c8mr8922694pzk.2.1694422219146; 
 Mon, 11 Sep 2023 01:50:19 -0700 (PDT)
Received: from chrisp-dl.atlnz.lc ([2001:df5:b000:22:c1f4:694c:ea29:c935])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a170902e54800b001b86e17ecacsm5860531plf.131.2023.09.11.01.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 01:50:18 -0700 (PDT)
From: Chris Packham <judge.packham@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 20:50:00 +1200
Message-ID: <20230911085000.559230-2-judge.packham@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230911085000.559230-1-judge.packham@gmail.com>
References: <20230911085000.559230-1-judge.packham@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694422219; x=1695027019; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rgRZfZxtLDSl3p9nBLfJBugvj42ylxgia/ftPWNsBB0=;
 b=NKGmI0SZh3JcTTiNFfbq5hGJsnFvq6bqedzd3ecr/gpG3Jrkr4yOiaV/ggYU1p1VGi
 Xmm2h7u5iWuuxj/3GppAEOMLRH3dUs6IBmwWD9NOFLE9lEzAUQTWrOTCZgGzOGlH8inG
 nubt7YioocZliZWKyV8m3bsgYAZfacGzuHPHm/oHhtFyArp117ezMOL7Um8KYEYvODxc
 dxW6DSxKTYMRTWMmKb02OR+vmNdqoWsafJwEeMo9BtXTL8NRaD4F3OZUzBnUbcl/5clX
 gyF/YOSbgtUpSf92L2DVdn5dyQ/5bOFDbipnJ1Vfj3hjaWkDCJSOqQHkbN/EBi0YVkUl
 6mzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=NKGmI0SZ
Subject: [Buildroot] [PATCH 2/2] gst1-shark: Update to v0.8.1
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to the latest release.

Release notes:
https://github.com/RidgeRun/gst-shark/releases/tag/v0.8.1
https://github.com/RidgeRun/gst-shark/releases/tag/v0.8.0

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/gstreamer1/gst1-shark/gst1-shark.hash | 2 +-
 package/gstreamer1/gst1-shark/gst1-shark.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-shark/gst1-shark.hash b/package/gstreamer1/gst1-shark/gst1-shark.hash
index cfd72dd2a6..37276cc93d 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.hash
+++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  413dbd8b6be1b09751e8d00abf9784de18cb74283c95ac078f6fb7d8750de26a  gst1-shark-v0.7.5-br1.tar.gz
+sha256  07587922dc49d12abe2444590a88c530409854b02904ad50357b312f9b6ea736  gst1-shark-v0.8.1-br1.tar.gz
 
 # Hashes for license files:
 sha256  6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
diff --git a/package/gstreamer1/gst1-shark/gst1-shark.mk b/package/gstreamer1/gst1-shark/gst1-shark.mk
index 17df001cef..a059d41cb8 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.mk
+++ b/package/gstreamer1/gst1-shark/gst1-shark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_SHARK_VERSION = v0.7.5
+GST1_SHARK_VERSION = v0.8.1
 GST1_SHARK_SITE =  https://github.com/RidgeRun/gst-shark.git
 GST1_SHARK_SITE_METHOD = git
 GST1_SHARK_GIT_SUBMODULES = YES
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
