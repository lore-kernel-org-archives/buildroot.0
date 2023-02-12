Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE120C05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 15:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57AC04056D;
	Sun, 12 Feb 2023 15:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57AC04056D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KlG3x2T5QOg2; Sun, 12 Feb 2023 15:10:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77F144055D;
	Sun, 12 Feb 2023 15:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77F144055D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E30C01BF4DD
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 15:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD980408F4
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 15:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD980408F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bIPD354XTR4l for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 15:09:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8553E408ED
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8553E408ED
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 15:09:54 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso1144642wms.2
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 07:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ehcsi3u3CnOEOJsnKJ6sVJg43gnYBNW4D2OVuhVS/wA=;
 b=cUMi9riGJochUpzTnvRt3o26eKhCg+wef7aG83jtFf2p7SZQi/Y3N98DdbgStNVRFi
 NEy3SEbeCAk9yIsV3UpK/AR4b8r/rT/0sC6mEMmjX/60zoe4ecLMRghSWIqZ8UJmaIy3
 Y6Tn2CtCoLlWEDfM0vsGJchmOKq0YeGmpb3mCxe5Gg6hOIs4U81BJYO/izeS/Lw/NFXN
 iVxc6b2lv2SbkOo0F8z8sIyTCWxRkmPX4MT7wdEGMwLN8L7XsCyIfIBmSWE51a/nH9MD
 SPpKgraySeQGa2Injc+hoM7Qh0heeWcrnnhxQs/MW44xvzj2pwXNrvOR7Fibi3iO7lO4
 bplA==
X-Gm-Message-State: AO0yUKUUaeXZDJyQFcLB8uo9UrzBVzzLTNR26wx6ElBX3A/qVe7Zrf+w
 n3yzrcRVheqUEmVLqjCrQSz17RQqI3A=
X-Google-Smtp-Source: AK7set88Rfm5ZF4h6I6L8F/WNkLp5eCU1nZCKtyMUG1bGygu7nmK/zsTvHWusLhLiFDEg8pALQ5exA==
X-Received: by 2002:a05:600c:3317:b0:3e0:111:28a9 with SMTP id
 q23-20020a05600c331700b003e0011128a9mr16864633wmp.22.1676214592410; 
 Sun, 12 Feb 2023 07:09:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c308900b003dc3f195abesm11008036wmn.39.2023.02.12.07.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 07:09:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 16:09:20 +0100
Message-Id: <20230212150920.1213398-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230212150920.1213398-1-fontaine.fabrice@gmail.com>
References: <20230212150920.1213398-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ehcsi3u3CnOEOJsnKJ6sVJg43gnYBNW4D2OVuhVS/wA=;
 b=BBAJkgoQg3DOakuJBfhmdZ3qcMQYckxqHBoe+EWQoFc/MtCuaVaAP/eaudHwStVVW/
 0A0M4dZb9W0NGF5T747ZnAPupHYun/8Hb1AIwflBDAnDqTth1PeWqE+R5p2d4WHT/RGr
 iHyOGgIPPHcmVCNRUGx/fYw/EO9Be/FVm0UI+NRh1dkS5SdEk3UAVJ4bz5JMlrteXz4p
 Ls2KQitaUE/cFXQZHdSsx77nMBtJLiIUM70w5UgR/rMEMeuMaEErx6sYaa0l0GfJcpw4
 XU3o+DpdY6waFghWEZiVZY8ONtPXV3afSw76SWlz6SYdR0FnwRNJeMm7QzDickj+1KWX
 g+FQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BBAJkgoQ
Subject: [Buildroot] [PATCH 2/2] package/zxing-cpp: needs wchar
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

wchar is mandatory since switch to an active fork in commit
456a7398316655ad0b669635f580e4887c24a700:

In file included from /home/autobuild/autobuild/instance-13/output-1/build/zxing-cpp-1.4.0/core/src/Result.h:12,
                 from /home/autobuild/autobuild/instance-13/output-1/build/zxing-cpp-1.4.0/core/src/GTIN.cpp:9:
/home/autobuild/autobuild/instance-13/output-1/build/zxing-cpp-1.4.0/core/src/Content.h:40:14: error: 'wstring' in namespace 'std' does not name a type
   40 |         std::wstring render(bool withECI) const;
      |              ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/4f97f1b291a99218f4706fce8b2934bd845755e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 6 ++++--
 package/zxing-cpp/Config.in                   | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index d477924eec..d2ef450d74 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -741,11 +741,13 @@ comment "zbar plugin needs a toolchain w/ threads, C++ and headers >= 3.0"
 config BR2_PACKAGE_GST1_PLUGINS_BAD_ZXING
 	bool "zxing"
 	depends on !BR2_STATIC_LIBS # zxing-cpp
+	depends on BR2_USE_WCHAR # zxing-cpp
 	depends on BR2_INSTALL_LIBSTDCPP # zxing-cpp
 	select BR2_PACKAGE_ZXING_CPP
 
-comment "zxing plugin needs a toolchain w/ C++, dynamic library"
-	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
+comment "zxing plugin needs a toolchain w/ C++, wchar, dynamic library"
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!BR2_INSTALL_LIBSTDCPP
 
 endif
 
diff --git a/package/zxing-cpp/Config.in b/package/zxing-cpp/Config.in
index 2550dcf023..0d8b79538d 100644
--- a/package/zxing-cpp/Config.in
+++ b/package/zxing-cpp/Config.in
@@ -1,9 +1,11 @@
-comment "zxing-cpp needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+comment "zxing-cpp needs a toolchain w/ C++, wchar, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		BR2_STATIC_LIBS
 
 config BR2_PACKAGE_ZXING_CPP
 	bool "zxing-cpp"
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_STB
 	select BR2_PACKAGE_PYTHON_PYBIND if BR2_PACKAGE_PYTHON3
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
