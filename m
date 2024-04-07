Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C74CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F03181FB2;
	Sun,  7 Apr 2024 11:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWPjPdTKzu-k; Sun,  7 Apr 2024 11:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE14A81F9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE14A81F9A;
	Sun,  7 Apr 2024 11:44:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8981F1BF947
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 765D2407CB
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3Ri2TFMqFhD for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:44:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5FA43407CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FA43407CA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FA43407CA
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 11:44:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a070b.dip0.t-ipconnect.de [91.58.7.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7EE2EA4C20FF;
 Sun,  7 Apr 2024 13:44:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53892)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rtQx4-000000005Wv-0s6z;
 Sun, 07 Apr 2024 11:44:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 13:44:25 +0200
Message-Id: <20240407114445.683504-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712490286;
 bh=nFZt/hlNPrlGbXmXJuKAZhWtm69QV6Mg2cs0OyXhebM=;
 h=From:To:Cc:Subject:Date:From;
 b=T16FfavloJMLrvSp+jE4p15hVUxX69lLcU27DBLrjvF+n/SO+Bdy5cxv1dEZ9q8UW
 AvKXY74fRVL/3dfPT44Vtb+VNbfOUuzdVcF1mgkr4v8h3ruqrkAkFef2ue73tSV6TL
 KQEp3qOSDsoB32HtUC/Bibz8knbj+W1tB2g++Dv3rqqXpV5S7ycXiuaajiDEMj1xVa
 noRyhMuqS5XKBbDzX07h1kGas0zLXnvNJI4I9cKs6jTtepEN1Yr/Nzn7A1t1CGTgr6
 0fRKoEreyIndiMYiE5bqtfaPmG7bReg0vWlher94EyShF7KpdjFwXJDFspFMFpKvm+
 umd1fkuGwYOgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=T16Ffavl
Subject: [Buildroot] [PATCH v2 00/20] package/kodi: bump version to
 21.0-Omega
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

this is v2 of the patch series to bump Kodi to its latest version.
This includes the bump of ffmpeg 4.4 to 6.1.

Changelog:
v2:
-  bumped aubio to support ffmpeg 6.x
-  removed omxplayer
 - while testing omxplayer a build error on BR2_arm occured, added an
   upstream fix to ffmpeg
- updated various commits after review from Yann

Regards, Bernd

Bernd Kuhls (20):
  package/aubio: bump version
  package/freeswitch: fix build with ffmpeg 6.0
  package/omxplayer: remove package
  package/ffmpeg: bump version to 6.1.1
  package/ffmpeg: add optional support for libvpl
  package/bento4: bump version to 1.6.0-641-Omega
  package/kodi: bump version to 21.0-Omega
  package/kodi-audiodecoder-*: mass version bump to Omega
  package/kodi-audioencoder-*: mass version bump to Omega
  package/kodi-imagedecoder-*: mass version bump to Omega
  package/kodi-inputstream-adaptive: bump version to 21.4.4-Omega
  package/kodi-inputstream-ffmpegdirect: bump version to 21.3.5-Omega
  package/kodi-inputstream-rtmp: bump version to 21.1.0-Omega
  package/kodi-peripheral-*: mass version bump to Omega
  package/kodi-pvr-*: mass version bump to Omega
  package/kodi-screensaver-*: mass version bump to Omega
  package/kodi-skin-confluence: bump version
  package/kodi-vfs-*: mass version bump to Omega
  package/kodi-visualisation-*: mass version bump to Omega
  package/kodi: add optional support for pipewire

 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  6 ++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 package/aubio/aubio.hash                      |  5 +-
 package/aubio/aubio.mk                        |  7 +-
 package/bento4/bento4.hash                    |  2 +-
 package/bento4/bento4.mk                      |  2 +-
 ...-x86-yuv2rgb-Fix-build-without-SSSE3.patch |  4 +-
 .../0003-libavutil-Fix-mips-build.patch       |  6 +-
 ...igure-add-extralibs-to-extralibs_xxx.patch |  6 +-
 ...xes-assembling-with-binutils-as-2.41.patch | 84 -------------------
 ...0005-avcodec-mmaldec-Fix-build-error.patch | 32 +++++++
 package/ffmpeg/Config.in                      |  9 +-
 package/ffmpeg/ffmpeg.hash                    |  2 +-
 package/ffmpeg/ffmpeg.mk                      | 21 ++---
 ...002-mod_av-fix-build-with-ffmpeg-6.0.patch | 48 +++++++++++
 package/gstreamer1/gst1-libav/Config.in       |  4 +
 .../kodi-audiodecoder-modplug.hash            |  2 +-
 .../kodi-audiodecoder-modplug.mk              |  2 +-
 .../kodi-audiodecoder-nosefart.hash           |  2 +-
 .../kodi-audiodecoder-nosefart.mk             |  2 +-
 .../kodi-audiodecoder-sidplay.hash            |  2 +-
 .../kodi-audiodecoder-sidplay.mk              |  2 +-
 .../kodi-audiodecoder-snesapu.hash            |  2 +-
 .../kodi-audiodecoder-snesapu.mk              |  2 +-
 .../kodi-audiodecoder-stsound.hash            |  2 +-
 .../kodi-audiodecoder-stsound.mk              |  2 +-
 ...001-MidiScan-include-missing-cstdint.patch | 29 -------
 .../kodi-audiodecoder-timidity.hash           |  2 +-
 .../kodi-audiodecoder-timidity.mk             |  2 +-
 .../kodi-audiodecoder-vgmstream.hash          |  2 +-
 .../kodi-audiodecoder-vgmstream.mk            |  2 +-
 .../kodi-audioencoder-flac.hash               |  2 +-
 .../kodi-audioencoder-flac.mk                 |  2 +-
 .../kodi-audioencoder-lame.hash               |  2 +-
 .../kodi-audioencoder-lame.mk                 |  2 +-
 .../kodi-audioencoder-vorbis.hash             |  2 +-
 .../kodi-audioencoder-vorbis.mk               |  2 +-
 .../kodi-audioencoder-wav.hash                |  2 +-
 .../kodi-audioencoder-wav.mk                  |  2 +-
 ...de-missing-cstdint-to-support-gcc-13.patch | 31 -------
 .../kodi-imagedecoder-heif.hash               |  2 +-
 .../kodi-imagedecoder-heif.mk                 |  2 +-
 .../kodi-imagedecoder-raw.hash                |  2 +-
 .../kodi-imagedecoder-raw.mk                  |  2 +-
 package/kodi-inputstream-adaptive/Config.in   |  2 +-
 .../kodi-inputstream-adaptive.hash            |  2 +-
 .../kodi-inputstream-adaptive.mk              |  4 +-
 ...de-missing-cstdint-to-support-gcc-13.patch | 49 -----------
 .../kodi-inputstream-ffmpegdirect.hash        |  2 +-
 .../kodi-inputstream-ffmpegdirect.mk          |  2 +-
 .../kodi-inputstream-rtmp.hash                |  2 +-
 .../kodi-inputstream-rtmp.mk                  |  2 +-
 .../kodi-jsonschemabuilder.mk                 |  6 +-
 .../kodi-peripheral-joystick.hash             |  2 +-
 .../kodi-peripheral-joystick.mk               |  2 +-
 .../kodi-peripheral-xarcade.hash              |  2 +-
 .../kodi-peripheral-xarcade.mk                |  2 +-
 .../kodi-pvr-argustv/kodi-pvr-argustv.hash    |  2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk  |  2 +-
 .../kodi-pvr-dvblink/kodi-pvr-dvblink.hash    |  2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk  |  2 +-
 .../kodi-pvr-dvbviewer.hash                   |  2 +-
 .../kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk  |  2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash  |  2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk    |  2 +-
 .../kodi-pvr-hdhomerun.hash                   |  2 +-
 .../kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk  |  2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.hash        |  2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk          |  2 +-
 .../kodi-pvr-iptvsimple.hash                  |  2 +-
 .../kodi-pvr-iptvsimple.mk                    |  2 +-
 .../kodi-pvr-mediaportal-tvserver.hash        |  2 +-
 .../kodi-pvr-mediaportal-tvserver.mk          |  2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash  |  2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk    |  2 +-
 .../kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash    |  2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk  |  2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash      |  2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk        |  2 +-
 .../kodi-pvr-octonet/kodi-pvr-octonet.hash    |  2 +-
 package/kodi-pvr-octonet/kodi-pvr-octonet.mk  |  2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash      |  2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk        |  2 +-
 .../kodi-pvr-plutotv/kodi-pvr-plutotv.hash    |  2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk  |  2 +-
 .../kodi-pvr-stalker/kodi-pvr-stalker.hash    |  2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk  |  2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash      |  2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk        |  2 +-
 .../kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash  |  2 +-
 .../kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk    |  2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash  |  2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk    |  2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash    |  2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk      |  2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash        |  2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk          |  2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash  |  2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk    |  2 +-
 .../kodi-screensaver-asteroids.hash           |  2 +-
 .../kodi-screensaver-asteroids.mk             |  2 +-
 .../kodi-screensaver-asterwave.hash           |  2 +-
 .../kodi-screensaver-asterwave.mk             |  2 +-
 .../kodi-screensaver-biogenesis.hash          |  2 +-
 .../kodi-screensaver-biogenesis.mk            |  2 +-
 .../kodi-screensaver-cpblobs.hash             |  2 +-
 .../kodi-screensaver-cpblobs.mk               |  2 +-
 .../kodi-screensaver-greynetic.hash           |  2 +-
 .../kodi-screensaver-greynetic.mk             |  2 +-
 .../kodi-screensaver-matrixtrails.hash        |  2 +-
 .../kodi-screensaver-matrixtrails.mk          |  2 +-
 .../kodi-screensaver-pingpong.hash            |  2 +-
 .../kodi-screensaver-pingpong.mk              |  2 +-
 .../kodi-screensaver-pyro.hash                |  2 +-
 .../kodi-screensaver-pyro.mk                  |  2 +-
 .../kodi-screensaver-rsxs.hash                |  2 +-
 .../kodi-screensaver-rsxs.mk                  |  2 +-
 .../kodi-screensaver-stars.hash               |  2 +-
 .../kodi-screensaver-stars.mk                 |  2 +-
 .../kodi-skin-confluence.hash                 |  2 +-
 .../kodi-skin-confluence.mk                   |  2 +-
 .../0001-texturepacker.patch                  | 16 ----
 ...-fix-texture-packer-cmake-source-dir.patch | 27 ------
 .../kodi-texturepacker/kodi-texturepacker.mk  |  9 +-
 .../kodi-vfs-libarchive.hash                  |  2 +-
 .../kodi-vfs-libarchive.mk                    |  2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.hash        |  2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.mk          |  2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash      |  2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk        |  2 +-
 .../kodi-visualisation-fishbmc.hash           |  2 +-
 .../kodi-visualisation-fishbmc.mk             |  2 +-
 .../kodi-visualisation-goom.hash              |  2 +-
 .../kodi-visualisation-goom.mk                |  2 +-
 .../kodi-visualisation-matrix.hash            |  2 +-
 .../kodi-visualisation-matrix.mk              |  2 +-
 .../kodi-visualisation-shadertoy.hash         |  2 +-
 .../kodi-visualisation-shadertoy.mk           |  2 +-
 .../kodi-visualisation-spectrum.hash          |  2 +-
 .../kodi-visualisation-spectrum.mk            |  2 +-
 .../kodi-visualisation-starburst.hash         |  2 +-
 .../kodi-visualisation-starburst.mk           |  2 +-
 .../kodi-visualisation-waveform.hash          |  2 +-
 .../kodi-visualisation-waveform.mk            |  2 +-
 package/kodi/Config.in                        | 10 +++
 package/kodi/kodi.hash                        |  6 +-
 package/kodi/kodi.mk                          | 32 +++++--
 ...file-to-be-compatible-with-buildroot.patch | 39 ---------
 package/omxplayer/Config.in                   | 36 --------
 package/omxplayer/omxplayer.hash              |  6 --
 package/omxplayer/omxplayer.mk                | 39 ---------
 package/opencv3/Config.in                     |  1 -
 package/opencv4/Config.in                     |  1 -
 package/qt5/qt5webengine/Config.in            |  2 +-
 156 files changed, 286 insertions(+), 538 deletions(-)
 delete mode 100644 package/ffmpeg/0005-Fixes-assembling-with-binutils-as-2.41.patch
 create mode 100644 package/ffmpeg/0005-avcodec-mmaldec-Fix-build-error.patch
 create mode 100644 package/freeswitch/0002-mod_av-fix-build-with-ffmpeg-6.0.patch
 delete mode 100644 package/kodi-audiodecoder-timidity/0001-MidiScan-include-missing-cstdint.patch
 delete mode 100644 package/kodi-imagedecoder-heif/0001-include-missing-cstdint-to-support-gcc-13.patch
 delete mode 100644 package/kodi-inputstream-ffmpegdirect/0001-include-missing-cstdint-to-support-gcc-13.patch
 delete mode 100644 package/kodi-texturepacker/0001-texturepacker.patch
 delete mode 100644 package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch
 delete mode 100644 package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch
 delete mode 100644 package/omxplayer/Config.in
 delete mode 100644 package/omxplayer/omxplayer.hash
 delete mode 100644 package/omxplayer/omxplayer.mk

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
