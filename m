Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369CDC433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:49:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05DB7610D2
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05DB7610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0CBB80CB6;
	Wed, 17 Nov 2021 21:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tCVUhFcP8QG; Wed, 17 Nov 2021 21:49:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E033380C63;
	Wed, 17 Nov 2021 21:49:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65D1E1BF307
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 512DB400D0
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:48:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uGaqRn8VUpOE for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:48:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A270405BE
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:48:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0D0328D5C1; Wed, 17 Nov 2021 21:44:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 22:40:22 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 033c0b01514fd7a91463273b16f15e9b89a46bfc
X-Git-Newrev: 2404cb2a4018e86be3c1f4dfdcd6a2e5ad7834ed
X-Patchwork-Hint: ignore
Message-Id: <20211117214412.0D0328D5C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/opencv4: fix
 build with gcc 4.8
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2404cb2a4018e86be3c1f4dfdcd6a2e5ad7834ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0f7761b6f99c7c5d27f6f385cad48a05bdae1bba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...eoio-src-cap_ffmpeg_impl.hpp-fix-build-wi.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
