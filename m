Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB28FD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 925506071A;
	Thu, 26 Feb 2026 20:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ydXmTg2jgn1h; Thu, 26 Feb 2026 20:46:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47ED960733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138809;
	bh=hFjPO0fqrFHBcotmd3EYLC/gmedPdrvrMOmsi82/InQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Nlpvc9BIlRARJFmizdfF301fcGEa+Cn31HPGTowk3gNKbdneZh5ppgtTtq3NfdH60
	 Ikc5z6vESRRzDh1hvN9aYHl55dsuIh5RNqFpM0f+orP/NbNs11B/s8kfAlGRUnea3A
	 idwjfqUex4D7218nX+DfEHvUZRJcD+W3mkgmUpmDcVofsMtLEtil7yU3H+A8cY5gFe
	 P/4j5RdGsKCDhOlRyp+0/vhHIFXuXAkEu/K+O4fQr2bHCckj50UeKHPNemsQ+CZiE3
	 bP1YO5CXyKA3iwcgtBzNAVGqyV3ml4wz0398O7t+sI7q6mSQa79q/2q+1JIMflrf+4
	 4vSY4FqtWh80A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47ED960733;
	Thu, 26 Feb 2026 20:46:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BBFFC1F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9C1B40269
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 47uvZ2qaiIaQ for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:46:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A91B540122
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A91B540122
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A91B540122
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:46:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43990aa7dbaso1032064f8f.1
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 12:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772138805; x=1772743605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XJ2oOb3HRxEAanJoFWMzKqqRXE1Qz/1pNv7ngAIfj3o=;
 b=R6vhcd19IT4rPq3n6UefWjlsPTWV0+3HqQOKUTCWkKIw1UqHUCchRkUZ3SNQKLdC+K
 /RyfmqXsEGFq1Ci/JXIBIFy0mu+rfAb7b57paraDOQAOy/qAruCKiNbVw5Gc/lzVAyiT
 lM/SK4WXcHIJs/fBMusk9lXyo/WcgHW7x/6YR4G+EWNSIa4/or3Il70xS4JCVqFHMaNw
 PqreVSzTUQcP7gi/weR+A2tIaXGwCSGVRhStRiAvG3jShgVvpvr+BB63QP15TQSNxvca
 TJQyVILVyDL4MntO9uflBns6gRdUG2wjL2Iu4uUuUAdldTB2s/et5Ie2Mtdb6Mv4yuoE
 WXBQ==
X-Gm-Message-State: AOJu0YyoFlaon1uXzP26cihgoxEvN2ij6nRwNZyAiLJmjUhnTxkOXo4+
 rMnSZhP7OygP5r6HN+KQQzVMXXA0y57tNnmkkFW3qiFX1H7tp7prGTY+uz/q8koFk5kDZ3EjXSn
 1m3AJ
X-Gm-Gg: ATEYQzzh5UWi7hYKWIIOKFOSqrz1gORLnqzJRkYue43w5EhAQYKC0Lgr7JuGgD0iz40
 dyQbkE2ZZSTviOCf57t8oFqb6mM0IrJ+O4msTR/sIl3lSYCSsFL0EQfjKiecNUcV86SEUgRAzlz
 a/lATJ1f7KpC16wt2om6IzbA+dQpcT/otlQkNjXahj+tnEqa7onKAu3HJ18X5QK97dE+p4gxwRg
 0xIk0eVclqTSqcoEs63u7Mk6vdOOQEv7GzaJWSDsmR8bOo5UAePFH/d9uuE/GVzfxD/RM1rucYj
 itk9X+aGhgz1y8ZIilYp2K7VgWwsahZTm6VorFVXN6sYXA+N9U8W3izqlvrOd5P2huid8HOzxcm
 EM4wJVlXBNXjO9Qb/VsN3SYtTw4xdKHai0PMi47mhxsxcWRxdqvgO/yxzj0g4Rmn2Re47f2sIhK
 NhHOUMJGuHpURNTDo=
X-Received: by 2002:a05:6000:4202:b0:439:4d46:606 with SMTP id
 ffacd0b85a97d-4399de1c657mr337193f8f.31.1772138805283; 
 Thu, 26 Feb 2026 12:46:45 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70e8dasm1669502f8f.9.2026.02.26.12.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 12:46:45 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:46:44 +0100
Message-ID: <20260226204644.253341-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224203615.248962-1-thomas.perale@mind.be>
References: <20260224203615.248962-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772138805; x=1772743605; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJ2oOb3HRxEAanJoFWMzKqqRXE1Qz/1pNv7ngAIfj3o=;
 b=BI3V18Yvzi5c2L00PdAj8V1xj3wsOPChLDRo34BpkRpMF2vP4NYay7j77hxVfOFy0c
 3jYU4IVaUML/m4htMD5a0AGQBkp+FMLp25gpfEsVWSBlvPb5ifsKz+8r9FPJpYogiXuR
 xQU5ewQTaZ7er+t6slkwAJjRjF3Zn1/usIxW7SM/CzTRC1bfR3LJDO7Nc/myagYgnJtq
 Oan1aXrtw0FqqbxM7vaueZ9Ici63W2mYep8LZa+xrWLvv2WDATyHq3eN9fXvZUzIWAxC
 csnMYc8SdrZgRCT8bjPaXgqqfKarjjjl1/ZNwTlSAjenTGoo+xw8o6LxGVli6F4nu61d
 Bw2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BI3V18Yv
Subject: Re: [Buildroot] [2025.02.x,
 PATCH] package/fluidsynth: add patch for CVE-2025-56225
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes the following vulnerability:
> 
> - CVE-2025-56225:
>     fluidsynth-2.4.6 and earlier versions is vulnerable to Null pointer
>     dereference in fluid_synth_monopoly.c, that can be triggered when
>     loading an invalid midi file.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-56225
>   - https://github.com/FluidSynth/fluidsynth/commit/45f2a79f4265dcc4f98cfbafdb10727fb1c0d411
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...inter-dereference-during-legato-mode.patch | 25 +++++++++++++++++++
>  package/fluidsynth/fluidsynth.mk              |  3 +++
>  2 files changed, 28 insertions(+)
>  create mode 100644 package/fluidsynth/0001-Fix-a-nullpointer-dereference-during-legato-mode.patch
> 
> diff --git a/package/fluidsynth/0001-Fix-a-nullpointer-dereference-during-legato-mode.patch b/package/fluidsynth/0001-Fix-a-nullpointer-dereference-during-legato-mode.patch
> new file mode 100644
> index 0000000000..a155164bcf
> --- /dev/null
> +++ b/package/fluidsynth/0001-Fix-a-nullpointer-dereference-during-legato-mode.patch
> @@ -0,0 +1,25 @@
> +From 45f2a79f4265dcc4f98cfbafdb10727fb1c0d411 Mon Sep 17 00:00:00 2001
> +From: "Tom M." <tom.mbrt@googlemail.com>
> +Date: Mon, 14 Jul 2025 18:13:38 +0200
> +Subject: [PATCH] Fix a nullpointer dereference during legato mode (#1607)
> +
> +CVE: CVE-2025-56225
> +Upstream: https://github.com/FluidSynth/fluidsynth/commit/45f2a79f4265dcc4f98cfbafdb10727fb1c0d411
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/synth/fluid_synth_monopoly.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/synth/fluid_synth_monopoly.c b/src/synth/fluid_synth_monopoly.c
> +index d1de13196..6e6e2a906 100644
> +--- a/src/synth/fluid_synth_monopoly.c
> ++++ b/src/synth/fluid_synth_monopoly.c
> +@@ -410,7 +410,7 @@ int fluid_synth_noteoff_mono_LOCAL(fluid_synth_t *synth, int chan, int key)
> +                 fluid_channel_breath_msb(channel))
> +         {
> +             /* legato playing detection */
> +-            if(channel->mode  & FLUID_CHANNEL_LEGATO_PLAYING)
> ++            if (channel->mode & FLUID_CHANNEL_LEGATO_PLAYING && channel->preset != NULL)
> +             {
> +                 /* the list contains others notes */
> +                 if(i_prev >= 0)
> diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
> index 1c9139aa9f..bde3f416a7 100644
> --- a/package/fluidsynth/fluidsynth.mk
> +++ b/package/fluidsynth/fluidsynth.mk
> @@ -12,6 +12,9 @@ FLUIDSYNTH_CPE_ID_VENDOR = fluidsynth
>  FLUIDSYNTH_INSTALL_STAGING = YES
>  FLUIDSYNTH_DEPENDENCIES = libglib2
>  
> +# 0001-Fix-a-nullpointer-dereference-during-legato-mode.patch
> +FLUIDSYNTH_IGNORE_CVES += CVE-2025-56225
> +
>  ifeq ($(BR2_PACKAGE_FLUIDSYNTH_ALSA_LIB),y)
>  FLUIDSYNTH_CONF_OPTS += -Denable-alsa=1
>  FLUIDSYNTH_DEPENDENCIES += alsa-lib
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
