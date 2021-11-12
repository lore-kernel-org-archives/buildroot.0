Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E80DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:19:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EB5061075
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EB5061075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 073C1400CC;
	Fri, 12 Nov 2021 13:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0v5XACMdOrgc; Fri, 12 Nov 2021 13:18:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C156A40148;
	Fri, 12 Nov 2021 13:18:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C17A1BF405
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18851403E5
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BT1a6L7aK3kS for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 13:18:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F145403EB
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 13:18:52 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so6766387wmd.1
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 05:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lNlA1EO83xmLRVczsW6kpvRRjorHjyM2U6clxI6RKzw=;
 b=ZbXPibY33I/dhzxtI9PITWt94dCjrQCEWWxvd3oIqmtaKGSoW/hcHUwr6I3IN6XSx5
 Qpuvgn+YKpYOUddeQlhHV7dDODAJWre3P7NGxEBWQb5yLaRoH8noS36kvXfkNKvsEW4S
 2mLL9V49AhGGg9t8zHBR9yfo4KpGyuLDIdNJR2RcOH+KsVFOdaRZXjODZR9HwPMUShhh
 sTXtCfRy7uhmoyZgpx9SxSYLFHiyZ0mPBcHvlNTQJdEPd3Hv5COn5sZvGheMfBsxsScE
 F+THAqcy2ZMQs3OicuInnSrILrBKuntBzVZrw3x2DsgIsUpqUYTzvma3jDShfi8T9baa
 D6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lNlA1EO83xmLRVczsW6kpvRRjorHjyM2U6clxI6RKzw=;
 b=p8rMZBdI2cigp+04sIRZkIevqdecrwpxabgut3R3Vdp3qbbrWfIwQ43HxKkQ2cmr3o
 kl5KQuFKRag7CHdVdxB8RqXVPEe1d65PGNG7UPkse0vsRSbDi9xEJSXVzHFtJ26sXIFd
 OUQzXQcKeJosHPOWWUtHVWV9hyPuzMNYbhCTT9cYBmLlGwnnoTAEbjMOmP54yATWyRUx
 hOCP0eV/0Hb3LlZckfULEpwEwqAhVFQVmmWiZS10nNoydyvfED0gBDJUygcme+ixtod8
 WOO/YaqLL93PAF/Z4w3+ZKzakeMM50Jzbqu1hbXd2aOZ/hxRtr9r9AO5khTe/VfxtWQ7
 QTSg==
X-Gm-Message-State: AOAM533E2X3GA0n800qV/w5Z8nyAoSEnpkANGA5EjClSE+VkW7XfCz1A
 EjGYiu53FfahdoF+Li1ANsek8yYG53c=
X-Google-Smtp-Source: ABdhPJyxN9NHzQqZOrWQ5eoz+NsvtDhGBDPBqgZlkfEKpk0DmjiIuIM+DlzUOypHm2YiC1UKce59PQ==
X-Received: by 2002:a05:600c:3b83:: with SMTP id
 n3mr16782304wms.116.1636723130285; 
 Fri, 12 Nov 2021 05:18:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id k27sm12622312wms.41.2021.11.12.05.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 05:18:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 14:16:45 +0100
Message-Id: <20211112131645.3334046-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/opencv4: fix build with gcc 4.8
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

Fix the following build failure with gcc 4.8 raised since the addition
of the package in commit c23612b5db036fe89accb8db48690d1ce1be4b1b:

In file included from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_impl.hpp:100:0,
                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg.cpp:50:
/home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_hw.hpp: In constructor 'HWAccelIterator::HWAccelIterator(cv::VideoAccelerationType, bool, AVDictionary*)':
/home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_hw.hpp:939:23: error: use of deleted function 'std::basic_istringstream<char>& std::basic_istringstream<char>::operator=(const std::basic_istringstream<char>&)'
             s_stream_ = std::istringstream(accel_list);
                       ^
In file included from /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/complex:45:0,
                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/core/include/opencv2/core/cvstd.inl.hpp:47,
                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/core/include/opencv2/core.hpp:3306,
                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/include/opencv2/videoio.hpp:46,
                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/precomp.hpp:57,
                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg.cpp:42:
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/sstream:272:11: note: 'std::basic_istringstream<char>& std::basic_istringstream<char>::operator=(const std::basic_istringstream<char>&)' is implicitly deleted because the default definition would be ill-formed:
     class basic_istringstream : public basic_istream<_CharT, _Traits>
           ^
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/sstream:272:11: error: use of deleted function 'std::basic_istream<char>& std::basic_istream<char>::operator=(const std::basic_istream<char>&)'

Fixes:
 - http://autobuild.buildroot.org/results/60f8846b435dafda0ced412d59ffe15bdff0810d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...src-cap_ffmpeg_impl.hpp-fix-build-wi.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/opencv4/0001-modules-videoio-src-cap_ffmpeg_impl.hpp-fix-build-wi.patch

diff --git a/package/opencv4/0001-modules-videoio-src-cap_ffmpeg_impl.hpp-fix-build-wi.patch b/package/opencv4/0001-modules-videoio-src-cap_ffmpeg_impl.hpp-fix-build-wi.patch
new file mode 100644
index 0000000000..6d5d6d0647
--- /dev/null
+++ b/package/opencv4/0001-modules-videoio-src-cap_ffmpeg_impl.hpp-fix-build-wi.patch
@@ -0,0 +1,52 @@
+From 4c92a2869b9a8f736a12ba859b74e5cadce62387 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 12 Nov 2021 09:50:17 +0100
+Subject: [PATCH] modules/videoio/src/cap_ffmpeg_impl.hpp: fix build with gcc
+ 4.8
+
+Fix the following build failure with gcc 4.8:
+
+In file included from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_impl.hpp:100:0,
+                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg.cpp:50:
+/home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_hw.hpp: In constructor 'HWAccelIterator::HWAccelIterator(cv::VideoAccelerationType, bool, AVDictionary*)':
+/home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_hw.hpp:939:23: error: use of deleted function 'std::basic_istringstream<char>& std::basic_istringstream<char>::operator=(const std::basic_istringstream<char>&)'
+             s_stream_ = std::istringstream(accel_list);
+                       ^
+In file included from /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/complex:45:0,
+                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/core/include/opencv2/core/cvstd.inl.hpp:47,
+                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/core/include/opencv2/core.hpp:3306,
+                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/include/opencv2/videoio.hpp:46,
+                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/precomp.hpp:57,
+                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg.cpp:42:
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/sstream:272:11: note: 'std::basic_istringstream<char>& std::basic_istringstream<char>::operator=(const std::basic_istringstream<char>&)' is implicitly deleted because the default definition would be ill-formed:
+     class basic_istringstream : public basic_istream<_CharT, _Traits>
+           ^
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/sstream:272:11: error: use of deleted function 'std::basic_istream<char>& std::basic_istream<char>::operator=(const std::basic_istream<char>&)'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/60f8846b435dafda0ced412d59ffe15bdff0810d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/opencv/opencv/commit/4c92a2869b9a8f736a12ba859b74e5cadce62387]
+---
+ modules/videoio/src/cap_ffmpeg_impl.hpp | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
+index d393b73ff4a2..76e1b855b7c8 100644
+--- a/modules/videoio/src/cap_ffmpeg_impl.hpp
++++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
+@@ -93,6 +93,12 @@ extern "C" {
+ }
+ #endif
+ 
++// GCC 4.x compilation bug. Details: https://github.com/opencv/opencv/issues/20292
++#if (defined(__GNUC__) && __GNUC__ < 5) && !defined(__clang__)
++#undef USE_AV_HW_CODECS
++#define USE_AV_HW_CODECS 0
++#endif
++
+ //#define USE_AV_HW_CODECS 0
+ #ifndef USE_AV_HW_CODECS
+ #if LIBAVUTIL_VERSION_MAJOR >= 56 // FFMPEG 4.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
