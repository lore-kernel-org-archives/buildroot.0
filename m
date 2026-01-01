Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C677CEED630
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 19:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E1FC60647;
	Thu,  1 Jan 2026 19:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W2sbPn--oBmz; Thu,  1 Jan 2026 19:05:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 908CA60650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767294316;
	bh=3s9Ml0G9zMnfwvt1tXTjY0kWqOpxw8UxNSPERS5X+tA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A02sBjKOEB3q7UFNgsMiz41pl/A18GjpZ0B3sNuYG2U5eEffRFZZa6+MB4znCA1zF
	 cbDxuoQi+JZJfsU2Ujr7jM4iOxHDoXA0Iw/NQufNMzLECkQ0IIaoYX1z1hlWBGRJHF
	 SjOPp2xyu9cfDPXqm3sHRuR6JqAEF2hqe5lVgi2EfRTwQB7tzt0iY+N26CY+xUsXGz
	 f4rZogjpFMvlZineMBGl2Zhz2SjMub8lVqJMQiCznnL9/TbS/OdR2S6joDW38Okt6H
	 +tUhpeuCeG7VWBAEzmTs9dUpvlXFf0pzZgsLxO/oPRwIajsK8SscD4C+bdWENmwi2q
	 Ja7p10EiU3tEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 908CA60650;
	Thu,  1 Jan 2026 19:05:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B61A19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C12960650
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhVPehH7Vf7x for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 19:05:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9625E60647
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9625E60647
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9625E60647
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:05:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AD6C5A4C1F78;
 Thu,  1 Jan 2026 20:05:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33848)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbNyx-000000003yY-0Ark;
 Thu, 01 Jan 2026 19:05:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  1 Jan 2026 20:05:06 +0100
Message-ID: <20260101190511.1604441-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767294311;
 bh=95cFOGaursaSMRir4eji4L0zlW1AhtuwylmoIz04MeQ=;
 h=From:To:Cc:Subject:Date:From;
 b=V05pUpv0hEbNSSvH/jJ3rwiRVeUpEyaMe7t4OXSq14ZT3+TXKktAtFLEr/YHY20cV
 0kuHqyLdMbuxRbO2WjBTk6fgUqVb25BBGIboNcg5lOaGH/CKbK+74swFMfa3mhjrYK
 SqqYy74JfSD5rdiKO5SV2RjJAA8/iruk1Ik/XL3s+G+gjl/eFPuqr7w3hZDYR2L7Yf
 r1h+T8cbLCOdF1aeVHmSCiFqfizP6Uy3UKBf8kQAIRkgF4y5/RL2CIdXTK07COiMe6
 gDviSyA9NQ4PEOtZO0THA5DUFCUEKci7/QyLHTmaMd677cMhNaDlQXp0hdI3MH+96z
 r95brRbPouUYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=V05pUpv0
Subject: [Buildroot] [PATCH 0/5] Build fixes for ffmpeg 8.x
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

this series adds patches and one version bump to fix build errors which
would occur with the upcoming bump of ffmpeg from 6.1.3 to 8.0.1, no
backports in buildroot necessary.

All patches are compatible with the current ffmpeg version used in
buildroot and are tested using this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_VLC=y
BR2_PACKAGE_FREERDP=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6MULTIMEDIA=y
BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG=y
BR2_PACKAGE_LIBCAMERA_APPS=y
BR2_PACKAGE_FREESWITCH=y

To my knowledge the only remaining package which gets broken if the
ffmpeg version bump[1] would be applied without further changes is kodi.
The Kodi project prepares version 22.0 which includes compatibility with
ffmpeg 8.0 and is currently at alpha2 stage.

Regards, Bernd

[1] https://github.com/bkuhls/buildroot/commit/d8dbe78d03a8d3ded297328a3737fc49ba230cf1

Bernd Kuhls (5):
  package/freerdp: fix build with ffmpeg 8.0
  package/freeswitch: fix build with ffmpeg 8.0
  package/qt6/qt6multimedia: fix build with ffmpeg 8.0
  package/vlc: fix build with ffmpeg 8.0
  package/libcamera-apps: bump version to 1.10.1

 .../0005-fix-ffmpeg-deprecations.patch        | 146 +++++++++++++
 .../0006-fix-ffmpeg-deprecation-warning.patch |  34 +++
 .../0007-FF_PROFILE-Depreciation-Fix.patch    |  31 +++
 .../0008-ignore-EAGAIN-for-FFMPEG.patch       |  44 ++++
 package/freerdp/freerdp.mk                    |   4 +-
 package/freeswitch/0004-ffmpeg8.patch         |  52 +++++
 ...ore-Switch-libcamera-string-controls.patch |  46 ----
 package/libcamera-apps/libcamera-apps.hash    |   3 +-
 package/libcamera-apps/libcamera-apps.mk      |   5 +-
 package/qt6/qt6multimedia/0001-ffmpeg8.patch  |  39 ++++
 ...remove-AV_INPUT_BUFFER_MIN_SIZE-usag.patch |  54 +++++
 ...eo-use-frame-flags-instead-of-fields.patch |  38 ++++
 ...ROFILE_xxx-instead-of-FF_PROFILE_xxx.patch | 202 ++++++++++++++++++
 ...AV_LEVEL_xxx-instead-of-FF_LEVEL_xxx.patch |  62 ++++++
 package/vlc/vlc.mk                            |   6 +-
 15 files changed, 715 insertions(+), 51 deletions(-)
 create mode 100644 package/freerdp/0005-fix-ffmpeg-deprecations.patch
 create mode 100644 package/freerdp/0006-fix-ffmpeg-deprecation-warning.patch
 create mode 100644 package/freerdp/0007-FF_PROFILE-Depreciation-Fix.patch
 create mode 100644 package/freerdp/0008-ignore-EAGAIN-for-FFMPEG.patch
 create mode 100644 package/freeswitch/0004-ffmpeg8.patch
 delete mode 100644 package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch
 create mode 100644 package/qt6/qt6multimedia/0001-ffmpeg8.patch
 create mode 100644 package/vlc/0011-avcodec-encoder-remove-AV_INPUT_BUFFER_MIN_SIZE-usag.patch
 create mode 100644 package/vlc/0012-avcodec-video-use-frame-flags-instead-of-fields.patch
 create mode 100644 package/vlc/0013-avcodec-use-AV_PROFILE_xxx-instead-of-FF_PROFILE_xxx.patch
 create mode 100644 package/vlc/0014-avcodec-use-AV_LEVEL_xxx-instead-of-FF_LEVEL_xxx.patch

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
