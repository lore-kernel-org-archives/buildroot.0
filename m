Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7ACFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:23:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3240761101
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3240761101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAF47606C2;
	Sat, 16 Oct 2021 07:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iBi0BEc2b0fg; Sat, 16 Oct 2021 07:23:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B2C86068B;
	Sat, 16 Oct 2021 07:23:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79A081BF369
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7556F401D1
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9MOomq8kvlpo for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 07:23:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C4C4400BE
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 07:23:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 09E4A8801D; Sat, 16 Oct 2021 07:20:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 09:14:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef00789e0dd4738df49ad0930b238d5a67262dd5
X-Git-Newrev: 6b1f3de47d1c8822ddbeaf9ea8512a5f00148ad7
X-Patchwork-Hint: ignore
Message-Id: <20211016072025.09E4A8801D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: add arch dependency to
 hardware pipelines
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b1f3de47d1c8822ddbeaf9ea8512a5f00148ad7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hardware related pipelines are obviously not available on other
architectures.

As suggested by upstream [0], add a dependency on arm or aarch64 for
RaspberryPi pipeline, to avoid the following build failure with a
powerpc64 toolchain since commit c09f126f5703 (package/libcamera: bump
to version e355ca0087cd93ef80f74c61018e9e9228a93313):

    In file included from ../include/libcamera/base/log.h:10,
                     from ../src/ipa/raspberrypi/raspberrypi.cpp:18:
    ../src/ipa/raspberrypi/raspberrypi.cpp:64:53:   in 'constexpr' expansion of 'std::chrono::operator/<long double, std::ratio<1>, double>(std::literals::chrono_literals::operator""s(1.0e+0l), 3.0e+1)'
    /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/powerpc64-buildroot-linux-gnu/include/c++/9.3.0/chrono:502:32: error: '(1.0e+0l / 3.0e+1)' is not a constant expression
      502 |  return __cd(__cd(__d).count() / __s);
    ../src/ipa/raspberrypi/raspberrypi.cpp:73:56:   in 'constexpr' expansion of 'std::chrono::operator/<long double, std::ratio<1>, double>(std::literals::chrono_literals::operator""s(1.0e+0l), 6.0e+1)'
    /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/powerpc64-buildroot-linux-gnu/include/c++/9.3.0/chrono:502:32: error: '(1.0e+0l / 6.0e+1)' is not a constant expression

Fixes:
 - http://autobuild.buildroot.org/results/49caebe7ef7e3d63de49e78d5d6839dd0aedf10c

Additionally, as Kieran puts it:

    I'd go further and filter the IPU3 on only x86 for instance, and the
    RKISP on (arm||aarch64).

So be it.

[0] https://lists.libcamera.org/pipermail/libcamera-devel/2021-October/025796.html:

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: abide by Kieran's wish]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcamera/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 92c17df849..b7f0e5b05d 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -34,12 +34,14 @@ config BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
 
 config BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3
 	bool "ipu3 pipeline"
+	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
 	help
 	  Pipeline for Intel IPU3.
 
 config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
 	bool "raspberrypi pipeline"
+	depends on BR2_arm || BR2_aarch64
 	depends on BR2_USE_WCHAR # boost (already enforced for gnutls)
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
@@ -48,6 +50,7 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
 
 config BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1
 	bool "rkisp1 pipeline"
+	depends on BR2_arm || BR2_aarch64
 	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
 	help
 	  Pipeline for Rockchip ISP1.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
