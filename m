Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E066D5B871
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1711640B02;
	Mon, 15 Dec 2025 22:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3pdzg2ONe1ld; Mon, 15 Dec 2025 22:49:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A31D40B06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765838999;
	bh=lHh9qR+sT/HR0bAf+6Ob1U/N767daDRpcVIfkA6lg/E=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cRx1p+ui0ARmVt1lFfIFoltWKsjCPbECQpjbSfQB/hdKOf9bHzsd/gAjIUXUc5XgX
	 p/ko/gPvhh+tcPas2UMYg5pLZeOsIxaUfvgfngMFrVDBshnThnWt6C8jtnY+ipjn77
	 WgnFwn2Sx6SGpLIj0/Ut525CxwC2NbrbuVNGVR09mWQs5Jf61lX1Z2hTMBmBkNB93j
	 JhbvihUlK+71hU5qFQBkJNw1N54Ken13sQxfcTdjiljx76/QrdQxsBAUlAzLpUNTgn
	 OBS/RwcLRM3Q6jNI6SBeUYsH/wJJ69HATMD6jCvGU0b3kaPec0C0pKjHESVQrVhHyK
	 0UJguJaeC6a5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A31D40B06;
	Mon, 15 Dec 2025 22:49:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B42A151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CDC980E52
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njDAXOaECNfZ for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:49:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D3F380E4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D3F380E4E
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D3F380E4E
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:49:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 377021A21FF;
 Mon, 15 Dec 2025 22:49:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0774E60664;
 Mon, 15 Dec 2025 22:49:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C3A8211942925; Mon, 15 Dec 2025 23:49:53 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Dec 2025 23:49:32 +0100
Message-ID: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765838994; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=qcEo4NPe3CDhJLlFt5lgJBYi0E+TZOrOU0yg504zVEU=;
 b=U97IrYKAWrqpjo9EuGhLw/Wy7afjUXQp+BRKS0q1P3jpVkWZlRj9mqXx8o6e4RDTFUl7Bw
 Okj+0DZu1tzTTniXiYXEDfT/VL+7bQf5oKV9MOsVmZrtrosY9xQ8RCUI4mX/8120NS90eQ
 JP16Zf1q0fzC07RyXd5xhVAaTa0+/QKQgAGHHVh4E/oFhzFF/7caEzjaGSkvaAJTLrxqIy
 9F9ArMI/ajQ21vXDFWiJ5+jN6R8ePxazd7t7hPnBJJASOlVaecXtXNulDj9mjISkRphZlj
 FoI1sk5lSBXy2N54+Num/uVU40aqj7f1RGXcztkFdJoccobL1gIgMKdRAPkovg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=U97IrYKA
Subject: [Buildroot] [PATCH 00/13] Remove rpi-userland
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

rpi-userland no longer builds with CMake >= 4 so it is currently
broken in Buildroot master. Turns out that the upstream repo says the
project is dead:

"""
This repo is ancient and deprecated.

It largely contains code using proprietary APIs to interface to the
VideoCore firmware. We have since move to standard linux APIs.

V4L2, DRM/KMS and Mesa are the APIs you should be using.

The few useful tools from here (dtoverlay, dtmerge, vcmailbox,
vcgencmd) have been moved to the raspberrypi/utils repo.

Code from here is no longer installed on latest RPiOS Bookworm images.

If you are using code from here you should rethink your solution.

Consider this repo closed.
"""

Therefore, we propose to remove this package.

Even if you don't agree, the first patch is still a fix that is
independent from the rpi-userland removal (and can be applied
independently).

Thomas

Thomas Petazzoni (13):
  package/rpi-firmware: drop support for vcdbg
  configs/raspberrypi3_qt5we: drop defconfig
  package/ffmpeg: drop rpi-userland support
  package/glslsandbox-player: drop rpi-userland support
  package/gstreamer1/gst1-plugins-base: drop rpi-userland support
  package/libcamera-apps: drop rpi-userland support
  package/libcec: drop rpi-userland support
  package/libwpe: drop rpi-userland specific tweak
  package/mpv: drop rpi-userland support
  package/sdl2: drop rpi-userland support
  package/tvheadend: drop rpi-userland support
  package/rpi-userland: remove package
  package/pkg-generic.mk: remove trace of rpi-userland

 .checkpackageignore                           |   7 -
 Config.in.legacy                              |  21 +++
 DEVELOPERS                                    |   1 -
 configs/raspberrypi3_qt5we_defconfig          |  43 -----
 package/Config.in                             |   1 -
 package/ffmpeg/ffmpeg.mk                      |  18 +-
 package/glslsandbox-player/Config.in          |   5 -
 .../glslsandbox-player/glslsandbox-player.mk  |   3 -
 .../gstreamer1/gst1-plugins-base/Config.in    |  30 +---
 .../gst1-plugins-base/gst1-plugins-base.mk    |   4 -
 package/libcamera-apps/libcamera-apps.mk      |   9 +-
 package/libcec/libcec.mk                      |   9 -
 package/libwpe/libwpe.mk                      |   6 -
 package/mpv/mpv.mk                            |  11 +-
 package/pkg-generic.mk                        |   2 +-
 package/rpi-firmware/Config.in                |  12 --
 package/rpi-firmware/rpi-firmware.mk          |  20 ---
 ...r-the-OpenGLESv2-EGL-and-bcm_host-li.patch | 107 ------------
 ...-faulty-assert-to-make-weston-happy-.patch |  35 ----
 .../0003-Disable-Werror-everywhere.patch      | 165 ------------------
 ...cations-disable-missing-applications.patch |  34 ----
 ...erge-add-missing-include-for-va_list.patch |  34 ----
 ...threads-CMakeLists.txt-fix-build-wit.patch |  45 -----
 ...dd-GLint64-GLuint64-and-GLsync-typed.patch |  99 -----------
 ...08-Fix-conflicting-types-build-error.patch |  41 -----
 ...ix-raspicommonsettings_parse_cmdline.patch |  28 ---
 package/rpi-userland/Config.in                |  45 -----
 package/rpi-userland/rpi-userland.hash        |   3 -
 package/rpi-userland/rpi-userland.mk          |  61 -------
 package/sdl2/sdl2.mk                          |   8 +-
 package/tvheadend/tvheadend.mk                |   9 +-
 31 files changed, 37 insertions(+), 879 deletions(-)
 delete mode 100644 configs/raspberrypi3_qt5we_defconfig
 delete mode 100644 package/rpi-userland/0001-Add-.pc-files-for-the-OpenGLESv2-EGL-and-bcm_host-li.patch
 delete mode 100644 package/rpi-userland/0002-interface-remove-faulty-assert-to-make-weston-happy-.patch
 delete mode 100644 package/rpi-userland/0003-Disable-Werror-everywhere.patch
 delete mode 100644 package/rpi-userland/0004-host-applications-disable-missing-applications.patch
 delete mode 100644 package/rpi-userland/0005-dtmerge-add-missing-include-for-va_list.patch
 delete mode 100644 package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch
 delete mode 100644 package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch
 delete mode 100644 package/rpi-userland/0008-Fix-conflicting-types-build-error.patch
 delete mode 100644 package/rpi-userland/0009-Fix-raspicommonsettings_parse_cmdline.patch
 delete mode 100644 package/rpi-userland/Config.in
 delete mode 100644 package/rpi-userland/rpi-userland.hash
 delete mode 100644 package/rpi-userland/rpi-userland.mk

-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
