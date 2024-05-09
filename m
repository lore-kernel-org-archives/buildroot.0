Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C3FC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A67641E57;
	Thu,  9 May 2024 16:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CAOJ7HxgICVd; Thu,  9 May 2024 16:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D215041E7A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D215041E7A;
	Thu,  9 May 2024 16:57:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4AD711BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3835C61002
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHqY8DtHzgAO for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:57:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 024906077D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 024906077D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 024906077D
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:57:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA21C1C0004;
 Thu,  9 May 2024 16:57:30 +0000 (UTC)
Date: Thu, 9 May 2024 18:57:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240509185730.659aaa88@windsurf>
In-Reply-To: <20240407114445.683504-5-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
 <20240407114445.683504-5-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715273852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WE0hncXutymSYC5bpKQQ2Drnv5CgqYKTA2WG/cc1w+4=;
 b=PkqzkuuhVSoam6cHoT4DKq2AG5sWpjG///XBMvbPVxpeVqtJwLEX2lt78MblgLMVWBUIiB
 nd4K63RY1WUjYToEQXvoik6HhZFWjHCrEHxbDeb+AL528IkpSE5pNROC4U5nDmaPo3nyQ0
 dCG2Rd2GnqD0DHKWD5qVv73LnF4blQIsqmyO2o06X8j5Z6phlifxlBV7asK05D+VT2Dt6c
 6ArFRg2RD1z4NMuFq6mpntFLXNIKQlUUSW07anNQtAaHx5+L4RsT445mibwSa7nu+VXDMh
 mX7nARkMu4TmeV3pMUJGvHSdeucrmoJRuiTeBrwOjYxEO2rQ+UxURNiL2jy5Ng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Pkqzkuuh
Subject: Re: [Buildroot] [PATCH v2 04/20] package/ffmpeg: bump version to
 6.1.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Apr 2024 13:44:29 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Quoting Changelog:
> http://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=b357f428abce2110904944c4cc066b8e297bb895;hb=3153c441e1d980ff9931ed26a0e01b4e366ac521
> "- ffmpeg now requires threading to be built"
> 
> Propagate threads to reserve dependencies.
> Rebased patches.
> Removed patch 0005 which is included in this release.
> 
> Removed support for libavresample which was removed upstream.
> No legacy handling necessary for opencv3/4 because libavresample was
> an optional dependency.
> 
> Added upstream patch 0005 to fix build error with arm.
> 
> Drop configure options which were removed upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...-x86-yuv2rgb-Fix-build-without-SSSE3.patch |  4 +-
>  .../0003-libavutil-Fix-mips-build.patch       |  6 +-
>  ...igure-add-extralibs-to-extralibs_xxx.patch |  6 +-
>  ...xes-assembling-with-binutils-as-2.41.patch | 84 -------------------
>  ...0005-avcodec-mmaldec-Fix-build-error.patch | 32 +++++++
>  package/ffmpeg/Config.in                      |  9 +-
>  package/ffmpeg/ffmpeg.hash                    |  2 +-
>  package/ffmpeg/ffmpeg.mk                      | 12 +--
>  package/gstreamer1/gst1-libav/Config.in       |  4 +
>  package/opencv3/Config.in                     |  1 -
>  package/opencv4/Config.in                     |  1 -
>  package/qt5/qt5webengine/Config.in            |  2 +-
>  12 files changed, 51 insertions(+), 112 deletions(-)
>  delete mode 100644 package/ffmpeg/0005-Fixes-assembling-with-binutils-as-2.41.patch
>  create mode 100644 package/ffmpeg/0005-avcodec-mmaldec-Fix-build-error.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
