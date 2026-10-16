Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E4BCCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 393DE816E7;
	Fri, 16 Oct 2026 15:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fobYQr8IaXCg; Fri, 16 Oct 2026 15:05:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3586C816EF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163103;
	b=qEVEhUsV8lyAqQ5VJmFua7d85uknEVaqostxStGeUZDfdnHeugFm25lw/wMwSp+flOGD
	 eQO8q7rDP9huQPIo4az3DHP9+/dL9VCyMczEVNt7zJ2p0dqj3mT3Vjs4EiSbyyKAlYgB3
	 6LYb0of9NYi2PyOS+UrEamvvf/9x7507bWXTQwDcgZZTln+O/mAbDsBYAjhVOMt1NiLur
	 4BaKs9PW4f1lp46WKDUxHGlOH6sIRLx2JAPP5T/F7uFvZ0pgILjw5YNYE4YbI3b9MWI+p
	 +oGxjjVS0/Wd5G8L7hME3FUxB2ClrGjRUlGAz/LPVywAPzqa7yFtdW/NczYuOG0p/3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163103;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hD0dR+WCKjiTcnybBpeEKNG0ZwGOoQdBNjo0ET4Tb3g=;
	b=mhH5FlwvroKIOdaXW+E/6EW2cNqevy2P2E+cPm9DufExU/El6KXjy6XjlF/2feJ+lFiI
	 F1pE1ERAYpZsxb0f0eR/hBjZY0DIHrjWbNvNQvyFqwq66D9R5wq8XqyaWHMhdWbr8JrXa
	 V1pch5U30cMN0sRTCrP9zsii6NTX3Vp/uSts8/R2IqsgW3iLFN//jiqE/OPqiwAB2QLHm
	 qvBel1HOAQAwEWcBDKadgasRyma5EpYBBakWn2X+b6CwgXj13NfFPEFDylrIRIeRJezE5
	 T+os7OZjslYtbXCkxSKBNdu57QfbWLuAZ1EEuU3j/dtOWIfyNDUfVzBwuoYzPI6cCMQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163103;
	bh=hD0dR+WCKjiTcnybBpeEKNG0ZwGOoQdBNjo0ET4Tb3g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ndNliBzus7FbpIwh+5KH0OJzCcMLsRrkiuM8SdNFlqc4+c8XAg/1B7XBHIYNQ1ToC
	 Zna14K6arCE4f+g6+tk6F0EEjMpWvOzUs4nm1Erm0l8SK6xB5Jxi88vt7V3DcJln4p
	 VXTGLPM3e8werd/Tqw5I89wot/3LJDMOo13O8n1efPfRHLC2uHCS3HGgmDXVWUnIHq
	 dtNuvCl2tKj8MOlGXs4qEr/z9cepXQECMblBwREVElbzT2kt5sxzs+NMlcbOYCSaCA
	 KKgc1bnUfi/1NCwFVgBXZBFCw7msq51DF/P2EbiydXxxXyiGSd9tvuIFacGeRGMuLE
	 tSjNIrSouMfxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3586C816EF;
	Fri, 16 Oct 2026 15:05:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47BC67AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3992B816E7
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wgHoavprCAVv for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:05:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2ABD2816D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163100;
 b=bjTXga3QI8i2znbBIqEVSqqX3+ep8RUSetvxRgoSnFs2JQSGVcSvSjkfUfKkc0wOew9d
 tautVPnAROC0KbiBryB6chxqHExorkGpEP0e/yTU6BEzkYFLp/CmpYsnVXSq9GviMn/00
 zJUFGA2pRwodppm9FOk8DXYO4quCVuW1QC961qWBxcIQqcj8LARfZvQPJlFfSyyDpjXwJ
 /Gdzv8gPOhVTpi0H91bCMP2NatgeCMxfi2hb2RPYiYo2CScUcPZ3zGh7/cGRXZ2Zl79CT
 eg0gG+lVQIDLAx/X8CEkrPokVBI4vuJ7pLf3AybZiKTXp5d+2p41I4Ali5iKLLl+krw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163100;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=9acd9txjCjvgsCiJqGcaIFszi5rUjOjwKOG3lxZ9UDE=;
 b=TbDzqSGtTjNxdkrmW83qjXY50rIMFZso53Q5oj6h2IFukCrXdt/vVgbCw5Rx9cPh98Ld
 Zrw5FxRHEIJhhsZ2U53eQK+1bjq3SuOqTsVD+atWMigiA5tHZg+M0rmGBwCuhaxrWdRF1
 8axuNnvmbCa8qj8oYND1hVhnlN/pwD1N1plibtil1B0kRiU9AACxtL8iKvw+S7cMFw+6d
 PYRYxutROvIlgIBvBav0HQlsJZLTKGOK+rCRh4ygW/flwWQyZWCjy+asKCmnl6+Ha3h3J
 dpKdvkFN45jfh2TtZin2/eU/6qZAAu1wkNuoc4bMy8TsqjhTxRdQhPaRCuKPDTWLHHA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ed6+y3f7; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2ABD2816D5
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:59 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so379385e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163098; x=1792767898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9acd9txjCjvgsCiJqGcaIFszi5rUjOjwKOG3lxZ9UDE=;
 b=AUqag5uQtvpJMKAVC5VtIX//9DG3L3zNIkg2QNvmeUFotudch3N4XfDsgf9Dk1oJvi
 +85Nj3nXxmM0Rap12UUqKTw9cr7OCt5ycUugIus68AW3HGE4ccNOQlyAOyof/tb2npWM
 i7IcdGMuRz0b+1PmJSl9F0pN3FQkEq9CUwrR9v/Q+c6ofuIulp0mhjsah3yFdlzgOC4S
 77bZYGVNTMV/sXbrJo1TrZFwoW2GDWPScWOTsMbrbGR8i0EyQue4OZheDFwq9qLufmQo
 O4mrVhw6olvda6MNgSlJ3Br0/915CjmBTxM7+szPhCT6u10sfVx8/o+KZLcSKiN2CqOB
 mq0g==
X-Gm-Message-State: AFq9FYKK/JE8NNDoPKUxSCYQbGJv5HTdbYO0D/NeZ445ORiI4KXTZtxZ
 ymiNjrsPQQWEUxEflGJf2YTXD7BNlubAVFCaZiGf2Wp1mN+Bw70+uJlnP7psoqBWGHuY+H5P4Ai
 sj2BBYp4=
X-Gm-Gg: AYBFou2Fr8XP6t553/X3YHrPt1Jxm6QCq/0zfhNz7Sug4XOD+K5WjAsHIw3c84mZz9H
 S9I/7TdzIqGLpULxWCOwmL9EiyZT/bb/IMr6Tj6XJt14qoGstCGN8mr3XMxWB4DCrhYp7Ly5KvP
 1wzpTiABxzBdkPmZf9HLHDKyPAVH4aQQ+mck2BttXSEpN/HDJPjW7h1FDO7k2lV2k9b5wheVUFS
 hjvVI4JSs5bjztvTOfhOR+XFUsfphIW+gi71kVbwfstjGv51MPrIzojNMDLgo15CoT1hAugG1TK
 zM24/DkcmRBtwusNwFhpE8pkguY1hBKIQ3W5fEZL5NnUNrH7nb39M79yR9Vp9xo3J1VL6yKUMoV
 GWsobBH+Ki2YKTDL4Gm4ey5uW7X0cnBUnxA3jug+oMc88VRl3Q+iXub1ZNntJJZncJew9bHCDsS
 nxTgscj6IIVNDyAmoJ08yqAL2+t+TwHze8UjYnktLOO21uaKRsjbkln9ptElUKoRHEYNWJR7moA
 V/JwSDHoMhOErv/nnRHH/2BTnhHaiQj+YuSikPK4g==
X-Received: by 2002:a05:600c:1550:b0:4a1:d38f:cf5d with SMTP id
 5b1f17b1804b1-4a1d762b892mr1362275e9.28.1792163097886; 
 Fri, 16 Oct 2026 08:04:57 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd9b8ebdsm178892695e9.10.2026.10.16.08.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:04:54 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:04:51 +0200
Message-ID: <20261016150453.72686-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004182839.2615667-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/vlc: security bump to version
 3.0.24
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://code.videolan.org/videolan/vlc/-/blob/3.0.24/NEWS
> https://code.videolan.org/videolan/vlc/-/tags/3.0.24
> 
> https://www.videolan.org/vlc/releases/3.0.24.html
> "Over 130 security fixes across VLC and its bundled libraries"
> 
> https://www.videolan.org/security/sb-vlc3024.html
> "VLC 3.0.24 fixes over 50 security issues in VLC itself."
> 
> Upstream removed unmaintainted libschroediner library:
> https://code.videolan.org/videolan/vlc/-/commit/614914f7bb7d4098bd5805724c0d8415d7fa32fa
> 
> Upstream removed support for mfx, which was disabled in buildroot, and
> replaced it with optional support for libvpl:
> https://code.videolan.org/videolan/vlc/-/commit/dcd1e9f447323a97ae230b9d86c7b8fd223426fb
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/14754d73ba95dac50861e6fb609bbc0e8a81cb7e
> 
> with the exception of
> bootlin-aarch64-glibc-old/build/vlc-3.0.24/.stamp_built which was broken
> before:
> https://gitlab.com/bkuhls/buildroot/-/commits/c66a31b0f7840c690de486941aa19b8d4d7b108e
> 
> No new build errors are introduced by this bump.
> 
>  package/vlc/vlc.hash |  7 +++----
>  package/vlc/vlc.mk   | 11 ++++++++---
>  2 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
> index 9634ba3f1f..4c9e67d1b8 100644
> --- a/package/vlc/vlc.hash
> +++ b/package/vlc/vlc.hash
> @@ -1,7 +1,6 @@
> -# From https://get.videolan.org/vlc/3.0.23/vlc-3.0.23.tar.xz.sha256
> -sha256  e891cae6aa3ccda69bf94173d5105cbc55c7a7d9b1d21b9b21666e69eff3e7e0  vlc-3.0.23.tar.xz
> -# From https://get.videolan.org/vlc/3.0.23/vlc-3.0.23.tar.xz.sha1
> -sha1  7b8c00a9c5bb879a403d5328c99924eefe01739a  vlc-3.0.23.tar.xz
> +# From https://get.videolan.org/vlc/3.0.24/vlc-3.0.24.tar.xz.sha{1,256}
> +sha1  dae683b3939220eac4a5edfc816c44e00659e68f  vlc-3.0.24.tar.xz
> +sha256  e7cab503d1d7d5849b89d2cf0e1ee60d0ef6d012407791b644b9cfc0cc225fdf  vlc-3.0.24.tar.xz
>  # Locally computed
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
> index 0ce6662353..1f6faa9a57 100644
> --- a/package/vlc/vlc.mk
> +++ b/package/vlc/vlc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VLC_VERSION = 3.0.23
> +VLC_VERSION = 3.0.24
>  VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
>  VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
>  VLC_LICENSE = GPL-2.0+, LGPL-2.1+
> @@ -66,7 +66,6 @@ VLC_CONF_OPTS += \
>  	--disable-kva \
>  	--disable-libplacebo \
>  	--disable-linsys \
> -	--disable-mfx \
>  	--disable-microdns \
>  	--disable-mmal \
>  	--disable-mtp \
> @@ -74,7 +73,6 @@ VLC_CONF_OPTS += \
>  	--disable-notify \
>  	--disable-opencv \
>  	--disable-projectm \
> -	--disable-schroedinger \
>  	--disable-shine \
>  	--disable-shout \
>  	--disable-sndio \
> @@ -401,6 +399,13 @@ else
>  VLC_CONF_OPTS += --disable-vorbis
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBVPL),y)
> +VLC_CONF_OPTS += --enable-vpl
> +VLC_DEPENDENCIES += libvpl
> +else
> +VLC_CONF_OPTS += --disable-vpl
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBV4L),y)
>  VLC_CONF_OPTS += --enable-v4l2
>  VLC_DEPENDENCIES += libv4l
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
