Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5706EC46CA1
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 20:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA49D40169;
	Mon, 18 Sep 2023 20:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA49D40169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BnXqF5C0qQzJ; Mon, 18 Sep 2023 20:37:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33D0040103;
	Mon, 18 Sep 2023 20:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33D0040103
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29D5D1BF39C
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 064C140103
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 064C140103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rjc3bvybuA8q for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 20:37:18 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55A2A400BF
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 20:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55A2A400BF
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-404539209ffso51432475e9.0
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 13:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695069436; x=1695674236;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PGh4tF61UswxzL43VBU+oRDaqQUBa6X55/F1rZCIaUo=;
 b=EVZL11HON8MMsqA/IMsH8EEnqRBG5RHWhVcnJ4x3suJRxfxkPXls9wXPkuph7/3Egn
 ub87//tm56ihOdM7bEFe1nJHQDltut8KQYKQaQn0c5gWlcmPNxh6yaoaziP8OfXSp6KD
 zPodD8HtKNX75byK/3kBXf/cQERHCsPAD+ygqLtDnhy6R+rzQ1d2gAXzARJ6LYrKhEy2
 7OCQzbWsB/kgc5QOt+EyBt7yVDSGSheaIDNNbsTUqviKIVHRKZIA68mh6OfhNy0xLkG8
 jQLniHPN7C+rhZYjarJkda8aLXoJCSnVssFMNPdjul7mAw6/shvwZKPNaolFw06tv3nU
 BRzg==
X-Gm-Message-State: AOJu0Yy6/9VnLh/osfp0a0YzBvlHtPW8wXrUFIIocXVEsh+wYylHt3Ha
 Z2J7otucUdioq7DpdFHlI6uJdcakdK0=
X-Google-Smtp-Source: AGHT+IHngZx5f+gJRC7GNzgdc8COSsJF78A7g3JVRrWgjv8YhVo+KVQuANdUWWbaKSEVRMmTOM11cw==
X-Received: by 2002:adf:f8c5:0:b0:31f:87f2:2155 with SMTP id
 f5-20020adff8c5000000b0031f87f22155mr8166159wrq.26.1695069435923; 
 Mon, 18 Sep 2023 13:37:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d62cc000000b0031c52e81490sm202146wrv.72.2023.09.18.13.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:37:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 22:37:11 +0200
Message-Id: <20230918203711.2650666-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695069436; x=1695674236; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PGh4tF61UswxzL43VBU+oRDaqQUBa6X55/F1rZCIaUo=;
 b=mw8AZXM0uSbiiqKEC0B4R0K4wvla04oSIgGEsIyJGc8s8+/Kd1hcLwIt35Iqtrudd9
 WINZhTdYgPDH2vbypyXpgvSKmNzLkoQGXOG0j19tzHzabZMoG6mso3Lwl+glfLOVMYht
 21uCP7NP6Gz1Cr5Iilc+r/0dU2GoZzuROlAfg2v05isL+BRgiJFAjhHOwmNWBthFBRrg
 BrhHnCG4MRXs6dp4TDlp7YMmUsdtKErJiyAEJS8324v8YB0dSHnv7drF6Ie/cHsgmg6b
 93XozthfJ1yrXWel8afoOwv4WDsYf/vOUoZDwKF2DK2d059o76Bjd55f8zrT0MlbvW3D
 8eaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mw8AZXM0
Subject: [Buildroot] [PATCH 1/1] package/util-linux: fix build with
 uclibc-ng < 1.0.42
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

Define static_assert if needed to avoid the following build failure with
uclibc-ng < 1.0.42 raised since bump to version 2.39 in commit
ad276d94a392fb13244e042851a44269e6254d61 and
https://github.com/util-linux/util-linux/commit/0ff57406522ba78ba829df7a64903b3066afb75f:

/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ./.libs/libsmartcols.so: undefined reference to `static_assert'

Fixes:
 - http://autobuild.buildroot.org/results/c3d38d92557ee9e59b717b85f6307810d5de1487

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/util-linux/util-linux-libs/util-linux-libs.mk | 3 +++
 package/util-linux/util-linux.mk                      | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index 20566345c6..30ab7970f9 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -52,6 +52,9 @@ UTIL_LINUX_LIBS_CONF_OPTS += --disable-widechar
 # No libs use ncurses
 UTIL_LINUX_LIBS_CONF_OPTS += --without-ncursesw --without-ncurses
 
+# workaround for static_assert on uclibc-ng < 1.0.42
+UTIL_LINUX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Dstatic_assert=_Static_assert"
+
 # Unfortunately, the util-linux does LIBS="" at the end of its
 # configure script. So we have to pass the proper LIBS value when
 # calling the configure script to make configure tests pass properly,
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 73eda5c171..72126adb00 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -96,6 +96,9 @@ endif
 UTIL_LINUX_CONF_OPTS += --without-ncursesw --without-ncurses
 endif
 
+# workaround for static_assert on uclibc-ng < 1.0.42
+UTIL_LINUX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Dstatic_assert=_Static_assert"
+
 # Unfortunately, the util-linux does LIBS="" at the end of its
 # configure script. So we have to pass the proper LIBS value when
 # calling the configure script to make configure tests pass properly,
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
