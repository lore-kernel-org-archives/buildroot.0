Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5AEC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 336F740CBE;
	Fri, 10 Jul 2026 13:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1KsWzYlowV2X; Fri, 10 Jul 2026 13:51:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E9B840CAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691518;
	bh=TDB4aQDxc2fG2+iugmY/kVPTdiADxL7ZgftvI3V/5Dw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OJNPOtSUMrsTtIsZBN6JYickYCu81d5lt9vSN9YkPoUZlhyeK4mt6rh/BlHfItJbj
	 UyO9gHA1jlxfByiGy8WEASZrLDVTAw0BOA+Tj7o1coBwguFNJdbJVVworN/FWjrN0v
	 9SFIxazdmPe8lvqw5D+ARJVFDp/k4CZokATdzbkBIVG+WuokVDDYKdEkJEYCwIL8cI
	 k1rtoE0UEEHUdagl+E475297ppWEJtXtNQiFDJ7C2lIMV/tthPpgCeC/Rpqi+yNthC
	 kuqinrRBfCbJiHhck6R3OEmm9KNuJpN1BDfb5dI1akZrGf3vUM0uwOfmwWIG+XVnLu
	 Ns1JlyIy44rgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E9B840CAE;
	Fri, 10 Jul 2026 13:51:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4918BA3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FCFB40120
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bU67_pTN-1TT for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:51:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1CD8E400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CD8E400D1
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CD8E400D1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:55 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-47dec32798aso1037522f8f.1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691513; x=1784296313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=u/C/PLNPeuEQmV8ov0LTvrCZ9qH6ylsg3k4gkLjKiOs=;
 b=dlL0nH8aQVAJavSjlRkc4qKE4uDbSEoqDyhzvgLz5Bp4zLI8Rwwj9XEOCCbaMuGQc3
 yocXPwnng6M2txrNNkkqA8OPaw7q6fWMgvQ8Jd91LhbuSc5q6XubUzhqSKT0UcPHwEGS
 nJSRxqnBmoC4i2mCuv0zhpOP1/xdDmafsVRqZ4up22jMvy4RADaDvBcy7PPgvNZ/1Dcl
 YiTqUg48ObuO1wE2NuxIr51tOBkAkF1aTGpEyFBvyxZOGF+z/oCXRC5BqpGk/MxLMpMY
 3zTwasmia9g1y6kVf0DDMiyPs+jCyjiIqJXVBzA12fJ4YAHNrWwhqmBzl7N7qDXR2kSr
 nZCA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpLoM55gpUr+RBwZ1WrnJbZsCXiK/4ko1hJS4/6r/Z4JH/9XiRZ/UibOC+HcpDYDDmYD3JiMTCcfPY=@buildroot.org
X-Gm-Message-State: AOJu0YzlTtmkcjd+7mGc1pWTE6AqBl9YG0piVywiOnFYkWT/IjMp12uC
 IFRrhAt9vA5V5JXZF8KNZRjR3a4UW7ODgR5R6PgDmpqXHCkL9cmc/PO6+Tknzup7Jd0=
X-Gm-Gg: AfdE7cmUUCWGbZabJhbnLGZKx598/ooMZKvVGrIl7K/6JS+WYnpu/ZJgC/QbbmBzktk
 SdQfKVmFmKSOEtfOQZIpQ+7ZUGD2TvSKKZY4M9eYi/w4vvyOy35Pw/cPWb1pilMxakYhkmFLilu
 KpWvh90XIlyIjbFjHbPHy+LCk/ML87608axuZRUo/ERc4oiTNZlDQccuMkYXEqFMk3Mdm0V51R2
 1sd71be6acTpdMrYDJSv/n5l5Pk6571E14zTTk6p4Y5EQRRoyDLW/qe0Je+KfGJQrK79uP9c1Fj
 M1Hbw6opMm+c3RxuoTaCpudvRJkzc13oiRQGkq4WGzPRtjhDjDV6en00bA4PVBfCGdfi7EqIgyB
 q/kxHMcnD8EdwPZBg46+q4a6IpEUf+X1Tx2P+w7C+DAfaF96WTC2O46fGsVc4p6Wmr3eLlLB/j5
 ysht8x1A==
X-Received: by 2002:a05:6000:2882:b0:475:f0d1:eb67 with SMTP id
 ffacd0b85a97d-47df07c1796mr13038192f8f.52.1783691512981; 
 Fri, 10 Jul 2026 06:51:52 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0960634sm61640268f8f.26.2026.07.10.06.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:51:52 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:51:52 +0200
Message-ID: <20260710135152.759637-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260627120452.803450-1-fiona.klute@gmx.de>
References: <20260627120452.803450-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691513; x=1784296313; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=u/C/PLNPeuEQmV8ov0LTvrCZ9qH6ylsg3k4gkLjKiOs=;
 b=JlL6Z5uNHrUcXVB/A2G4whClEHqURGeBZE0K+huQi6v4H4dPoNNq76hmSS+Q+fdUkE
 KmvcDdnMKMHUwbp8Ia+uVva8lgSkXJsCAU8+w6TNDXLUkJtF1SyFPx7PwzJ9yuCNB8u5
 mogPKcIROeVH5i/KpVJgM1HdJ0fAHClplt+JOPjsoP+BlMf86xx84vdNEBkEO7N0hFhR
 eGUldxAGrp72RUNwb8DmxXq/qNulLCAHK73VnqIVV3QDyofgmVd8kdKYaSdFsZea3vrB
 khpKdlk3Z6tNd1ngrrdF/sXWfnvguuPM7WBLT3Bz8c1RpBSiZaUUg7alBF8wGB0+P00X
 xOEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JlL6Z5uN
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: drop unused
 0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
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
> In 11aa1cfa5af9a77a0a9f726bd38f1b7db659c0bf the patch was accidentally
> moved into a versioned directory with the wrong version (2.82.0
> instead of 2.82.4) and thus not applied. However, there have been no
> issues reported.
> 
> The patch description mentions being needed to fix build errors in
> package/atk and package/libnice. It was originally added in
> b094f88a4d501101bfba9b65491209e6a0fe0397, and amended for libnice in
> 2c916b400bc608512db790d97df010ca666b6dd2. package/atk was removed in
> 2c3ca7bea1de76163aeef432412eb14551ed0581, because atk has been merged
> into at-spi2-core. Both at-spi2-core and libnice are Meson packages,
> as was atk at the time of its removal.
> 
> Both current packages build with the following configuration (tested
> using utils/test-pkg):
> 
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_GOBJECT_INTROSPECTION=y
> BR2_PACKAGE_LIBNICE=y
> BR2_PACKAGE_AT_SPI2_CORE=y
> 
> Evidently the patch is no longer needed, presumably because the
> correct search path for GIR files is set by other means, and we can
> remove it instead of fixing the version number of the patch directory.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
> I admit it is a bit unsatisfying that it's unclear exactly *what*
> fixed that search path. Another bit of evidence I have is that when
> working on that libglib2 2.82.x and gobject-introspection 1.82.0
> version bump it was primarily for package/python-gobject, which also
> uses Meson, so it probably was either that bump or a Meson bump at
> some point before.
> 
> TestPythonPy3NetworkmanagerGoi (accessing NM using python-gobject)
> passes with this patch.
> 
> For stable branches it's probably easiest to verify at-spi2-core and
> libnice build using test-pkg and the config snippet above.
> 
>  ...girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch | 53 -------------------
>  package/libglib2/libglib2-bootstrap/2.82.0    |  1 -
>  2 files changed, 54 deletions(-)
>  delete mode 100644 package/libglib2/2.82.0/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
>  delete mode 120000 package/libglib2/libglib2-bootstrap/2.82.0
> 
> diff --git a/package/libglib2/2.82.0/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch b/package/libglib2/2.82.0/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
> deleted file mode 100644
> index c6135b15a1..0000000000
> --- a/package/libglib2/2.82.0/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 3fcd5f431dee9909b6bcbd9b8b61d4b1fe4b5f92 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Fri, 12 Nov 2021 18:01:05 +0100
> -Subject: [PATCH] meson.build: add girdir to gio-2.0.pc and glib-2.0.pc
> -
> -Add girdir to gio-2.0.pc and glib-2.0.pc to fix the following build
> -failure with atk or libnice:
> -
> -/home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler atk/Atk-1.0.gir --output atk/Atk-1.0.typelib --includedir=/usr/share/gir-1.0
> -Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/2716929db638977e6bf665352a08bd580e1dd0ae
> - - http://autobuild.buildroot.org/results/3088ef32b03e0bb984291b1227b187f1ff816eb7
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Dario: make the patch to be applied with fuzz factor 0]
> -Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> -[Fiona: refresh for glib 2.80.4]
> -Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> -Upstream: Never submitted
> ----
> - gio/meson.build  | 1 +
> - glib/meson.build | 1 +
> - 2 files changed, 2 insertions(+)
> -
> -diff --git a/gio/meson.build b/gio/meson.build
> -index 59c2b0f..5120537 100644
> ---- a/gio/meson.build
> -+++ b/gio/meson.build
> -@@ -885,6 +885,7 @@ pkg.generate(libgio,
> -   variables : [
> -     'schemasdir=' + '${datadir}' / schemas_subdir,
> -     'dtdsdir=' + '${datadir}' / dtds_subdir,
> -+    'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
> -     'giomoduledir=' + pkgconfig_giomodulesdir,
> -     'gio=' + '${bindir}' / 'gio',
> -     'gio_querymodules=' + pkgconfig_multiarch_bindir / 'gio-querymodules',
> -diff --git a/glib/meson.build b/glib/meson.build
> -index d2efeba..a69532b 100644
> ---- a/glib/meson.build
> -+++ b/glib/meson.build
> -@@ -447,6 +447,7 @@ pkg.generate(libglib,
> -   subdirs : ['glib-2.0'],
> -   extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
> -   variables : [
> -+    'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
> -     'glib_genmarshal=' + '${bindir}' / 'glib-genmarshal',
> -     'gobject_query=' + '${bindir}' / 'gobject-query',
> -     'glib_mkenums=' + '${bindir}' / 'glib-mkenums',
> --- 
> -2.45.2
> -
> diff --git a/package/libglib2/libglib2-bootstrap/2.82.0 b/package/libglib2/libglib2-bootstrap/2.82.0
> deleted file mode 120000
> index 28b180f102..0000000000
> --- a/package/libglib2/libglib2-bootstrap/2.82.0
> +++ /dev/null
> @@ -1 +0,0 @@
> -../2.82.0
> \ No newline at end of file
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
