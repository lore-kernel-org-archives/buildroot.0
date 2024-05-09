Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C45C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 17:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 457D840192;
	Thu,  9 May 2024 17:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3O5qKdMYYqZT; Thu,  9 May 2024 17:25:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 093784014E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 093784014E;
	Thu,  9 May 2024 17:25:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03C651BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E53354048A
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AlC87PnCy8UA for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 17:25:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 757F141DBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 757F141DBE
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 757F141DBE
 for <buildroot@buildroot.org>; Thu,  9 May 2024 17:25:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A86C240006;
 Thu,  9 May 2024 17:25:03 +0000 (UTC)
Date: Thu, 9 May 2024 19:25:01 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240509192501.2f2e9e63@windsurf>
In-Reply-To: <20240407114445.683504-1-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715275504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hLzKcYwveVuQxWYLmGUB5zI1x3CG8M4dpP5mbZbA9EQ=;
 b=aB800XU2tns0tcOtl1Ua/IQkg/PI7Hw26qOAT7p1+7dcpVtlGJ0CoVcBoBkyXiOZEjMkgX
 dV7rp5zuXb/OfT1y6TH/gDjQrDpvejSJN2Xh3ZnvzcWmh0nD5ir8yIpE5VxRJUR+eX71w3
 PVhSIsXXQ/19ezWnArzea0Ol80HrDmgKL/9QtV32eFJr3kpjuLylPRmSA5xHoT7KDoeDAt
 HYBWI8IGir/piSSVblENBC5sGSVKF3S5uvW3PFsLBFb5Npi45E0uYQ3362bqDp1VzfeskN
 dWKNYxaNYTt2c9SBU6wUAwsWiYu2BVe4Yv0GdTOxZm7HrGr4B+ZQKaVxGpeV6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aB800XU2
Subject: Re: [Buildroot] [PATCH v2 00/20] package/kodi: bump version to
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

On Sun,  7 Apr 2024 13:44:25 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Bernd Kuhls (20):
>   package/aubio: bump version
>   package/freeswitch: fix build with ffmpeg 6.0
>   package/omxplayer: remove package
>   package/ffmpeg: bump version to 6.1.1
>   package/ffmpeg: add optional support for libvpl
>   package/bento4: bump version to 1.6.0-641-Omega
>   package/kodi: bump version to 21.0-Omega
>   package/kodi-audiodecoder-*: mass version bump to Omega
>   package/kodi-audioencoder-*: mass version bump to Omega
>   package/kodi-imagedecoder-*: mass version bump to Omega
>   package/kodi-inputstream-adaptive: bump version to 21.4.4-Omega
>   package/kodi-inputstream-ffmpegdirect: bump version to 21.3.5-Omega
>   package/kodi-inputstream-rtmp: bump version to 21.1.0-Omega
>   package/kodi-peripheral-*: mass version bump to Omega
>   package/kodi-pvr-*: mass version bump to Omega
>   package/kodi-screensaver-*: mass version bump to Omega
>   package/kodi-skin-confluence: bump version
>   package/kodi-vfs-*: mass version bump to Omega
>   package/kodi-visualisation-*: mass version bump to Omega
>   package/kodi: add optional support for pipewire

I finished applying the whole series. I had to do a fixup patch to fix
the URLs of some Java binaries the main kodi package downloads. See:

  https://gitlab.com/buildroot.org/buildroot/-/commit/1223c116665a3fb5ec44218b5f256d813dc1a28f

Thanks for this work!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
