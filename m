Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E4EC61DA4
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 16:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB21B40B13;
	Sun, 19 Feb 2023 16:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB21B40B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aV7v4St_SAxy; Sun, 19 Feb 2023 16:48:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D32D40B22;
	Sun, 19 Feb 2023 16:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D32D40B22
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05B1F1BF287
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E12DB40B26
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E12DB40B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hV3vcjY8wqAP for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 16:48:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA2D740B16
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA2D740B16
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 16:48:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 bg37-20020a05600c3ca500b003e21e018039so115837wmb.3
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 08:48:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VzIvSk236bIpLSgC9ilQP9M3janLgZf46gpej/+E9pk=;
 b=WrcJxZNvfM5ATmGpBJzS0jyJheVhGqt1EYrbWr2oJeMKEgC3gD+jgCqZnWyk795JlT
 lgmv1H/XFDnZFqbA8yJ9fwcHWlLRJDXjlfL35YC9IukSItoQROF6RY5At8ISVKXag86l
 OrjanRWmWQM/mPKM6FYrt+ela+0KNa71/r8bb4q5F3TOPe43StjMiOQtcAqoONZvQ9QB
 gnFEclqOIUPJYxYYHfEmygjcfp4Fb/qwhZntPZsbDYU/P58MbUvTIYL6ZcevU/45m59A
 BlvZzhZIHacNg7WCbCuu0rkYyIUdnI8zvzjphe5fSah5oSYSbLVIodTH5UenKgU/ysjQ
 FlNg==
X-Gm-Message-State: AO0yUKV26Jq/6Uxc6dGyCJgArFCGnx9L4xVvpSwUdkECJhq7bTCFGwh0
 LtEbqhN5vtp0FxefMBUg9ptImsB+7XI=
X-Google-Smtp-Source: AK7set8VFaizsdePltC0cGEa3Fp1zZklIShasCNIwN/TOS5jq8OGUXtrUvfXl93+au6GQOfS89aqEA==
X-Received: by 2002:a05:600c:80f:b0:3dc:5d34:dbe5 with SMTP id
 k15-20020a05600c080f00b003dc5d34dbe5mr4785460wmp.28.1676825309438; 
 Sun, 19 Feb 2023 08:48:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b003e2232d0960sm8064404wmp.23.2023.02.19.08.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 08:48:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 17:48:22 +0100
Message-Id: <20230219164822.142283-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230219164822.142283-1-fontaine.fabrice@gmail.com>
References: <20230219164822.142283-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VzIvSk236bIpLSgC9ilQP9M3janLgZf46gpej/+E9pk=;
 b=XfCLlg5FKg1dKorXT4S9SFiVXZqdKJ4E1dA/vr4+ioGWLyvI2Zy4aRPfx8mM2jQ762
 OEG/V5qrQKMz+iNo80sHChUshY/ZC59s0toVeNDSMHgOzKKmM+rID2TnZrA2id03/849
 3030yh+q2YmkFzwgdt81xesrpFqQ3s2g6smkn4yAgSGXT608Y8WyFk1gEpv2HyGdgKNy
 jevZs69XTBSZK7KF69UzE9hfh1oWG9KTf2bc63FP8fhBv4x8gxUSza7QnnxryFNM5dTq
 TTP/IPvxGm5tnIodMxCxtAmgCRpwcp2ALrWJ3zs+ljLVTfWwp8Jlk1mQnxWLaxuvKghM
 zPMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XfCLlg5F
Subject: [Buildroot] [PATCH v2,
 3/3] package/libjxl: security bump to version 0.8.1
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Security: Fix OOB read in exif.h

https://github.com/libjxl/libjxl/releases/tag/v0.8.1
https://github.com/libjxl/libjxl/releases/tag/v0.8.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Julien Olivain):
 - Add patch to fix crash

 ...entation-fault-when-JPEG-is-disabled.patch | 44 +++++++++++++++++++
 package/libjxl/libjxl.hash                    |  2 +-
 package/libjxl/libjxl.mk                      |  2 +-
 3 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 package/libjxl/0001-djxl-fix-segmentation-fault-when-JPEG-is-disabled.patch

diff --git a/package/libjxl/0001-djxl-fix-segmentation-fault-when-JPEG-is-disabled.patch b/package/libjxl/0001-djxl-fix-segmentation-fault-when-JPEG-is-disabled.patch
new file mode 100644
index 0000000000..3d709c956b
--- /dev/null
+++ b/package/libjxl/0001-djxl-fix-segmentation-fault-when-JPEG-is-disabled.patch
@@ -0,0 +1,44 @@
+From 504f35c8204248ae6f97278e8b7c6cc5853a1b94 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Fri, 10 Feb 2023 21:31:30 +0100
+Subject: [PATCH] djxl: fix segmentation fault when JPEG is disabled
+
+When libjxl is compiled without JPEG support, by configuring for example
+with:
+
+    cmake -DCMAKE_DISABLE_FIND_PACKAGE_JPEG=TRUE ...
+
+djxl crashes with a segmentation fault at:
+https://github.com/libjxl/libjxl/blob/v0.8.1/tools/djxl_main.cc#L367
+
+The crash can be reproduced with the sequence:
+
+    gm convert IMAGE:LOGO ref.ppm
+    cjxl ref.ppm enc.jxl
+    djxl enc.jxl dec.ppm
+
+The crash happen because opt_jpeg_quality_id does not get
+initialized at:
+https://github.com/libjxl/libjxl/blob/v0.8.1/tools/djxl_main.cc#L107
+
+This commit fixes the crash by adding a test on opt_jpeg_quality_id.
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+[Retrieved from:
+https://github.com/libjxl/libjxl/pull/2178/commits/504f35c8204248ae6f97278e8b7c6cc5853a1b94]
+---
+ tools/djxl_main.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/djxl_main.cc b/tools/djxl_main.cc
+index b755301fcb..42b889e7ce 100644
+--- a/tools/djxl_main.cc
++++ b/tools/djxl_main.cc
+@@ -370,6 +370,7 @@ int main(int argc, const char* argv[]) {
+     args.color_space = force_colorspace;
+   }
+   if (codec == jxl::extras::Codec::kPNM && extension != ".pfm" &&
++      args.opt_jpeg_quality_id != -1 &&
+       !cmdline.GetOption(args.opt_jpeg_quality_id)->matched()) {
+     args.bits_per_sample = 0;
+   }
diff --git a/package/libjxl/libjxl.hash b/package/libjxl/libjxl.hash
index e71d32e61d..6b4c9d8d0a 100644
--- a/package/libjxl/libjxl.hash
+++ b/package/libjxl/libjxl.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  3114bba1fabb36f6f4adc2632717209aa6f84077bc4e93b420e0d63fa0455c5e  libjxl-0.7.0.tar.gz
+sha256  60f43921ad3209c9e180563025eda0c0f9b1afac51a2927b9ff59fff3950dc56  libjxl-0.8.1.tar.gz
 sha256  8405932022a556380c2d8c272eff154a923feb197233f348ce5f7334fb0a5ede  LICENSE
 sha256  91915f8ae056a68a3c5bdf05d9f6f78bb6903e27a8ca3a8434c9e4ac87300575  PATENTS
diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index b4dfbecf82..f603327bf6 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJXL_VERSION = 0.7.0
+LIBJXL_VERSION = 0.8.1
 LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
 LIBJXL_LICENSE = BSD-3-Clause
 LIBJXL_LICENSE_FILES = LICENSE PATENTS
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
