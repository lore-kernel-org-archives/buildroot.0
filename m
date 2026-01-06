Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17218CEFCF2
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 19:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9159581CEF;
	Tue,  6 Jan 2026 19:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xaqOtVPtWnp0; Tue,  6 Jan 2026 19:30:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2AF181CD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767727821;
	bh=PIc++MIGinRojj0Vg2SE9OAlV77GVEZZfVrvtqd3aks=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UQZTHhiAhwXu/6vib2Htr2L4N0g6YYq2BrOSM7RiPft1BGwsC8Y7lvd2vpLWzMs6j
	 KQkqbmS6ULJep+KJcadn4zawalrxLDC2cWX3/yPZZ4zQtfgzhPjRGCshn0nkeBcgS+
	 cbZu8b9YZztK3oxwD0LXbyQJioioZKJRJcE5XW9kBCJBwUN3wa28pk6CirWF8UioQk
	 xKt1A9vkIqB8i9cp85dsGki1O0O5ckwIYu6W+7suCDCLOXePm2bP/0QRR/VEgdQ6XI
	 vRieIEdB1ZoFDwOIa17IjlPzjiKvcA7kzG54gty+EAZJdXvi2YEzRO0wCCqm5Vd9kY
	 kyW1BJVs+yIFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2AF181CD0;
	Tue,  6 Jan 2026 19:30:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25B4D70B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 19:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17CFA408D8
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 19:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8O67kSEDTWF for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 19:30:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08642408D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08642408D6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08642408D6
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 19:30:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 809F5A4C3734;
 Tue,  6 Jan 2026 20:30:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51454)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vdCkz-000000005Ug-0SIf;
 Tue, 06 Jan 2026 19:30:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  6 Jan 2026 20:30:13 +0100
Message-ID: <20260106193017.1817810-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767727817;
 bh=ZPJRElHk31hX9tgCXLoQ322qrrAT8ML9yjOyz/VxM6o=;
 h=From:To:Cc:Subject:Date:From;
 b=YZGnxY1VzZ0+uAAE/JOjqyiSzXmK71i7BWNZGZAh+EkPu4xNzfPgxBxSF9Wu0vBtt
 XXKGSD/qZd51RFSOv9WLprFLTOlTvVTtZKR/kDnTsnxiX2aqaSlVap4GVv0xKXerGb
 vWVft6Phg/5J9Fbf/1QZA5O2dXmX2IUiNFO0mOlH9U4IpV5Nfoo53aTRBAr322VGe0
 sIWQxupWgSBm0zmtwWRRx7vAvYLzSEGM5vkD9iOixxL8EoYZfn0hi6rrjBHtvk8Ptz
 F4aAPYsl8EO7n+4akgBdiHfLuXs1/vKrGJHHMpStFw+QV8wqCMqHajkINQyyj580tc
 Zn1/ybaodFs4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=YZGnxY1V
Subject: [Buildroot] [PATCH v3 0/3] Build fixes for ffmpeg 8.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

this series adds patches to fix build errors which would occur with the
upcoming bump of ffmpeg from 6.1.3 to 8.0.1, no backports in buildroot
necessary.

All patches are compatible with the current ffmpeg version used in
buildroot and are tested using this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_FREERDP=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6MULTIMEDIA=y
BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG=y
BR2_PACKAGE_FREESWITCH=y

To my knowledge the only remaining package which gets broken if the
ffmpeg version bump[1] would be applied without further changes is kodi.
The Kodi project prepares version 22.0 which includes compatibility with
ffmpeg 8.0 and is currently at alpha2 stage.

The current version of libcamera-apps is broken with ffmpeg 8.0 as well
but version 1.10.1 adds compatibility with ffmpeg 8.x while removing
support for older ffmpeg versions like the one used by buildroot:
https://github.com/raspberrypi/rpicam-apps/commit/cbe9921eeddd8e1c2e5798102f485baea5de3f65

../encoder/libav_encoder.hpp:33:2: error: #error "Error: libavcodec API version is too old for the libav encoder!"
   33 | #error "Error: libavcodec API version is too old for the libav encoder!"

Regards, Bernd

[1] https://github.com/bkuhls/buildroot/commit/d8dbe78d03a8d3ded297328a3737fc49ba230cf1

v3: removed vlc from series, patches are included in 3.0.23 bump
v2: removed libcamera-apps from series

Bernd Kuhls (3):
  package/freerdp: fix build with ffmpeg 8.0
  package/freeswitch: fix build with ffmpeg 8.0
  package/qt6/qt6multimedia: fix build with ffmpeg 8.0

 .../0005-fix-ffmpeg-deprecations.patch        | 146 ++++++++++++++++++
 .../0006-fix-ffmpeg-deprecation-warning.patch |  34 ++++
 .../0007-FF_PROFILE-Depreciation-Fix.patch    |  31 ++++
 .../0008-ignore-EAGAIN-for-FFMPEG.patch       |  44 ++++++
 package/freerdp/freerdp.mk                    |   4 +-
 package/freeswitch/0004-ffmpeg8.patch         |  52 +++++++
 package/qt6/qt6multimedia/0001-ffmpeg8.patch  |  39 +++++
 7 files changed, 349 insertions(+), 1 deletion(-)
 create mode 100644 package/freerdp/0005-fix-ffmpeg-deprecations.patch
 create mode 100644 package/freerdp/0006-fix-ffmpeg-deprecation-warning.patch
 create mode 100644 package/freerdp/0007-FF_PROFILE-Depreciation-Fix.patch
 create mode 100644 package/freerdp/0008-ignore-EAGAIN-for-FFMPEG.patch
 create mode 100644 package/freeswitch/0004-ffmpeg8.patch
 create mode 100644 package/qt6/qt6multimedia/0001-ffmpeg8.patch

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
