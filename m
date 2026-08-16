Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6755C5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 19:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45A2E80C67;
	Sun, 16 Aug 2026 19:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_ee-Hog6Z7S; Sun, 16 Aug 2026 19:17:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0718280CAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786907878;
	bh=StFThRTta8OujMk6ltrphdFBNZJ8Z4xzYBUaHNJm3Vc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GxHl/Yv0zRfdnGR4aMg/dj0GMTHNfuaAwcHRlv5g7A/pLWsxr4GqBJIJD4HvwUbWh
	 DieUYs6nBBXpDZTVMzTN7qzDbv73ctLbXEoxcIuKMiAUz5k8JfJrhTQ7+fLDKEbmia
	 OssUzWTQ7e/NrCBokwfa9qfQHTjQ8TXmitoBIszoTvIuau65dkVkrIPy7Y4K/LgU1t
	 OeVlW6mUVOoc7SJ8ySBIPLdoF8YPRBaISQU3JDjhR0tfuEmYQf3Xzz0rrCPs2U5VGn
	 n4fk837Gdpsk6rKf9ZQKAN5QaoaOys5PjIIR3uWDD/yjJjz/pxMeP0NO7MsPHg85jm
	 aghflSPQqictA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0718280CAB;
	Sun, 16 Aug 2026 19:17:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A660194
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07C894009D
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbH-jVBDp91E for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 19:17:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 27A2740063
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27A2740063
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=b2rtBd4z
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27A2740063
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:17:55 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-92ea24a2dbfso228320285a.0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786907874; x=1787512674; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=deXDK4J41mNE2w7LdMP1KZagRZ6D8DYLOe4F4+61v3Y=;
 b=b2rtBd4zdOaTuYaJUTsTVI7kkSpwI3mALNaryAh/T2D3936K+DoWZYqzvql3fE1C2V
 xiqBBkaHCJPhL84OtD7NHw6k40byhh4S0/mYoeAIIh+rupzZPurWd6kA+hZsIsK/n53q
 RMSrx21lpfh92x1SPCpJ8RudfEeZbfbeMcGBCEZgQRSYr0RhJrIwLvZAEgVfD6CcvK6D
 /WZMewfo3VXYyHAlcMgWklLKUgbinqfn8nvLS0c06DY8jWa92wH5vDoMnav3oEZN9KT5
 7X4lNDKl3Zhe15BQUAMKcQAvKL+hOiTXKGhduUR+rK1Xqi8g/YZyJWSe5itUsr0QQ1G6
 Ptig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786907874; x=1787512674;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=deXDK4J41mNE2w7LdMP1KZagRZ6D8DYLOe4F4+61v3Y=;
 b=WwNyrRdaHPQMfD1ffK8jNqJ/V2XZ23rskYuwCrRknmAxYmSGuSo1DKx6qrwHP7FczK
 UV1SEN48IFdFmVR3Wq5L16N4ItwRDTA9XK9+9EqVZWmxlRMKKDNv7Xl96TUT/NhNS3c5
 0fTcore2Y6Lxb9c1D1ysyZlv0oQMBCDYoajhmQwHu1Lyzhmo6sP98P552SLr3cILrYWa
 gV9cLZH3v7md8aPpADH08zRjsyPoJxYyNHCF6KzgtqkYNWE4ak+Ox8yuKY+gJV41qZSJ
 BUAfU6OajoSbXq0olzYIwiziVjiyyNDjK4x2degnJF0szby/enrM16fNxU6extkXac2r
 MLmg==
X-Gm-Message-State: AOJu0Yxp6fSc46OggHa6Cm4Bs7BFoSYY2qFL+LuenZ5Ht/bVYJZdQJs7
 XKH5p4Afa0jnjDKyLY5j+K56jlDlczx4c328IzVxJI83hYAJxFH9BqiQvNuQ/g==
X-Gm-Gg: AR+sD13zBBz6GNXG/3JAGNhYcsw2FGHkYmF/aPxLYcn/LM7ijjZZFTUZysqUn3rWtqA
 9DHrmK19LU9QG3TFGJ9K+qpuxrEckWBmyR+uGjFdCO4w2j/9qBsxEipdn0lYl1kGact83cyydMk
 2wnPupbS3bWzQMkZULtc3OY+4HWrn4dxWqMHG66tzvdpYZiXDNTZn59JyWWqRHI/DDyg9+zBlgr
 5IM0ISiNNMiOnwQOLGL4IblWSQoWdHHMe76BK53MSwSxOmTuvVijJsxefCGpVITH7umG9axyxzv
 ZNudqIU8kRD2HXeewXt9sePDf7dWB6WFfbWdnW4vRzgGZYIyPbC+i+iL9tUH+yzL65J8KUwe7J4
 YIggwOuBJccsUV2eVBPr1dd3JRJLoEyjoDZfxv1BFy6wqifNNNUrQO/Jvzf3GZZWdw2V4VwZ/xl
 eW1P/j25agC/dvvOs61zusiyW+I3gAMko2Y+iwyWhASsKZ/CD47424hOysjpCfKXBPM76kNCEJh
 a+2RTOcnBFy/OgIlyZU
X-Received: by 2002:a05:620a:a811:b0:936:ce2d:ed32 with SMTP id
 af79cd13be357-936d233a6dfmr1819983385a.45.1786907874534; 
 Sun, 16 Aug 2026 12:17:54 -0700 (PDT)
Received: from optiplex-7020.tail176fc.ts.net ([67.21.186.162])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-936cdf561efsm825489585a.8.2026.08.16.12.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2026 12:17:53 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Cc: Michael Fischer <mf@go-sys.de>,
 Alsey Coleman Miller <alseycmiller@gmail.com>
Date: Sun, 16 Aug 2026 15:18:22 -0400
Message-ID: <20260816191830.533747-1-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/8] package/sdl3*: complete the SDL3 family
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

Buildroot has sdl3, sdl3_gfx, sdl3_image and sdl3_ttf. This adds the two
satellite libraries that are missing, fills in options the existing
packages do not offer, and moves SDL3_image off a prerelease.

Patches 1 and 2 add plutovg and plutosvg. plutosvg is a small SVG
renderer built on plutovg, and it is what patch 6 uses: colour emoji
fonts store their glyphs as SVG, which SDL3_ttf renders through the
FreeType OpenType-SVG hooks. Both are useful on their own.

Patch 3 gives sdl3 an ALSA option. There is none today, so whether the
ALSA audio driver is built is decided by what SDL's own detection finds
in the sysroot rather than by the configuration. It also makes D-Bus
follow BR2_PACKAGE_DBUS instead of being off unconditionally - that
costs screensaver inhibition and the D-Bus parts of the Wayland backend
- adds an option for the test programs, and names the audio backends
that were left unset. SDL probes for OSS, JACK, sndio and PipeWire and
builds against whatever it finds, so an unlisted backend makes the
result depend on which unrelated packages happen to be enabled.

Patch 4 moves sdl3_image from 3.1.1, a prerelease, to 3.4.4, and builds
the AVIF, JPEG, TIFF, WEBP and JXL backends according to the image
libraries already in the configuration rather than PNG alone. The option
names changed in 3.4: PNG is SDLIMAGE_PNG_LIBPNG, and
SDLIMAGE_BACKEND_STB selects the built-in decoder used when no helper
library is available.

Patch 5 stops sdl3_ttf building samples that are never installed and
installing man pages that Buildroot deletes again.

Patches 7 and 8 add sdl3_mixer and sdl3_net, the last two SDL3 satellite
libraries without a package. Both are built with CMake, like sdl3
itself, rather than with the autotools setup their SDL2 counterparts
use. sdl3_mixer plays several formats with no dependency at all and
picks up the better decoders - flac, mpg123, opusfile, wavpack,
fluidsynth, libxmp, game-music-emu - when those are already enabled.

check-package is clean over all seven packages. Checked on x86_64/glibc
with alsa-lib, dbus, harfbuzz, jpeg, libpng, tiff and webp enabled, and
again with plutosvg, sdl3_mixer and sdl3_net turned on: the resulting
*_CONF_OPTS and dependency lists are as intended, and BR2_PACKAGE_PLUTOSVG
selects plutovg and turns on SDLTTF_PLUTOSVG. A full build of the series
on that configuration is still running as I send this.

Alsey Coleman Miller (8):
  package/plutovg: new package
  package/plutosvg: new package
  package/sdl3: add ALSA and test program options, follow dbus
  package/sdl3_image: bump to version 3.4.4
  package/sdl3_ttf: do not build the samples or install man pages
  package/sdl3_ttf: build plutosvg support when available
  package/sdl3_mixer: new package
  package/sdl3_net: new package

 DEVELOPERS                         |   4 ++
 package/Config.in                  |   4 ++
 package/plutosvg/Config.in         |  10 +++
 package/plutosvg/plutosvg.hash     |   3 +
 package/plutosvg/plutosvg.mk       |  18 +++++
 package/plutovg/Config.in          |   7 ++
 package/plutovg/plutovg.hash       |   3 +
 package/plutovg/plutovg.mk         |  16 +++++
 package/sdl3/Config.in             |  15 +++++
 package/sdl3/sdl3.mk               |  38 ++++++++++-
 package/sdl3_image/Config.in       |  10 ++-
 package/sdl3_image/sdl3_image.hash |   4 +-
 package/sdl3_image/sdl3_image.mk   |  62 +++++++++++++++--
 package/sdl3_mixer/Config.in       |  17 +++++
 package/sdl3_mixer/sdl3_mixer.hash |   3 +
 package/sdl3_mixer/sdl3_mixer.mk   | 103 +++++++++++++++++++++++++++++
 package/sdl3_net/Config.in         |   9 +++
 package/sdl3_net/sdl3_net.hash     |   3 +
 package/sdl3_net/sdl3_net.mk       |  21 ++++++
 package/sdl3_ttf/sdl3_ttf.mk       |  16 ++++-
 20 files changed, 356 insertions(+), 10 deletions(-)
 create mode 100644 package/plutosvg/Config.in
 create mode 100644 package/plutosvg/plutosvg.hash
 create mode 100644 package/plutosvg/plutosvg.mk
 create mode 100644 package/plutovg/Config.in
 create mode 100644 package/plutovg/plutovg.hash
 create mode 100644 package/plutovg/plutovg.mk
 create mode 100644 package/sdl3_mixer/Config.in
 create mode 100644 package/sdl3_mixer/sdl3_mixer.hash
 create mode 100644 package/sdl3_mixer/sdl3_mixer.mk
 create mode 100644 package/sdl3_net/Config.in
 create mode 100644 package/sdl3_net/sdl3_net.hash
 create mode 100644 package/sdl3_net/sdl3_net.mk

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
