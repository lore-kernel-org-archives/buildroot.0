Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6E1C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 03:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A38F680F6F;
	Tue, 14 Jul 2026 03:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ObxNiVNTxpLF; Tue, 14 Jul 2026 03:34:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E9A280F32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784000074;
	bh=d2XiZ02VZdRcgnubrkkQTh0hHqyAlu99y1vn33i+clc=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mIfm6dset5odcHBpZnEy9PmFnZpCViJ7vJ9dIG7/0D0WXHE1ZJ21nSxvqqPJp+QjB
	 giGDxaWj+owD2vfX20JZT7VmIXo8qwNSvk6T/LRwkoQX6LOc/K0uL013f99m75LJ38
	 KMlQ9B8ZUEq5brgyHkMtjQVdaQ6G+2qS2R4szslTwPRDRYlsiT0xXLn+JAiOaZDhaW
	 UingU7qLXqWo3Gm2IVRmouHaL9gMQRIsK8tmIGawBtexiruEvnWa08WI9ETIxlpKYB
	 xC56eocPI792oih0y0bYZxZ4f0qDuHP/Wi6wskgam73XE/wFGoLCKpRVNG0T6WQON9
	 GkaHNTifWdbuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E9A280F32;
	Tue, 14 Jul 2026 03:34:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64824B88
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 03:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42AE6606AF
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 03:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nK-VUUIusS4c for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 03:34:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C5D3C6062A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5D3C6062A
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5D3C6062A
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 03:34:31 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-493c19bad03so34287165e9.2
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 20:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784000070; x=1784604870;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=QYOcuuJhD1EiMfH4lCXaSR/IFDIPczaFy0e7/VWHPeE=;
 b=b15j0v3a/mFd4c5RJDEOIu2ra1bN2jzTpYJSXAslQaF876z6h82fqReyUWzjYJ2E0n
 t2ujXFhQzvkx6mdWEIrKcHcIvMUgXMTS+wHiBSsJF8WFMopOjK7LVNtgMTUF6VvrsV8q
 72MK9naR9lTGkaea4O9vgWnL/ElJTxiYS90Dmy7IZ8gxJh6DOQp3MbHduKRWNJqS0Cl6
 akq4+S2Ogrqs1aTiGQDnnB9pTvSVfwRCwhC6AHvWe6PvtdzvUl3PAyy53NeABYkD/Bjj
 FRp5+2jF3dVN0GEoh/zlZlpMGpOY3w452IrFPC5sbUr9fn7XSNuIfTlHALXZ+kxHOafX
 70kw==
X-Gm-Message-State: AOJu0YxBv1KK/cNIu7o9wxSrqCk6mdzSZWynZdRAvnzi0nVJtuXhN0TE
 pzWXKq/nlOe+STZnbQ4WIE5HbKRsqspva1iwAE4fgOjoMptL2umY3zHd3OqSDz+P
X-Gm-Gg: AfdE7ckRujnMBF1ODEk3iByPJBgut04vLkw9y/fm30T1B89KM4Ka259MJic6yuXN2Df
 m4Sgc4vdxV7LLlkHj2v3cLGjP+utImvxUNo4gkgrrbBdS6fMsNNsf5Rk6gVa8nMuSSRf+2bH9at
 tpD99n80AJKpIhcakKpMtJSZBzOYHJU4HyZ/Ga5rVb4TYgBC/We4HG5CjOiQLD+pEfg7TnNaeIE
 tox9/0UbZxHRaC4aAGbByXPicufeavasXqdogBNLwzzpq1xdxVOu0Vl6butk1SiDHCMsc9NnD7u
 dZ1xNlccPYyX5mOFqWP2PFJOMFLp8oXjYJ5WlC9b4NCQQWNvmkWKL8N1bgRYq59uZ9Ac/BlRfRV
 lwtepWIfYK4X2GsZlAdF356pIDwwoaiPBQiONVS5QRR0zdMRiMtvwgrDqSoO7t/r2DwOekaW/hH
 2ME04nNERg+N51tcQ=
X-Received: by 2002:a05:600c:a08e:b0:492:6f9b:572e with SMTP id
 5b1f17b1804b1-493f883aa3cmr112998765e9.37.1784000069321; 
 Mon, 13 Jul 2026 20:34:29 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4950a2ed840sm40849995e9.10.2026.07.13.20.34.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 20:34:28 -0700 (PDT)
Message-ID: <6a55ae44.9b1caefb.2e4701.d988@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 14 Jul 2026 03:34:28 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784000070; x=1784604870; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QYOcuuJhD1EiMfH4lCXaSR/IFDIPczaFy0e7/VWHPeE=;
 b=VJHhZCvTwCtTkSM6nE8E0NHL8GvBZnJjZeexvT6qs8vnkmL7VWy5E5P23srO4GDlNP
 NGCf7igmYusyHXEtGTSFxUHkBUlAYwHYPk2lvAGB/ZuTdD+wRYN8v+/HlHTHClzlFDxT
 2nIgTlyEPNYNMxipv9QovJHzvIaMjTv246rQTJxznN4ZZOKImUrCDJlW6Olg93p1V2yo
 6MJnqWjRMNbgkZRqUL2QfNiy6MYxkJkF5IV/WRkLOnAlgBBKZLeC6Db20sMCKV88wbHs
 RgMHSsSIwDrzbjHVwjxfqNOAl2miaClUZSrBdeyXO6cxqvloHKWWmRYB5eRLULkCrxw8
 w8pA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=VJHhZCvT
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-13
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

Hello,

Autobuild statistics for 2026-07-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  6  |  0  | 10  |
  2026.02.x  |  2  |  1  |  0  |  3  |
  2026.05.x  |  1  |  3  |  0  |  4  |
    master   | 30  | 47  |  0  | 77  |

Classification of failures by reason for master
-----------------------------------------------

   host-bootgen-xilinx_v2026.1 | 7 
              host-guile-3.0.9 | 3 
                    attr-2.6.0 | 2 
          cloudflared-2025.8.1 | 2 
               gocryptfs-2.3.2 | 2 
uhttpd-15346de8d3ba42200249... | 2 
                       unknown | 2 
             alsa-lib-1.2.16.1 | 1 
am33x-cm3-fb484c5e54f2e31cf... | 1 
amazon-ecr-credential-helpe... | 1 
                   ccrypt-1.11 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
                 e2tools-0.1.2 | 1 
                enscript-1.6.6 | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.43-45-gdae425b55420... | 1 
  gobject-introspection-1.84.0 | 1 
          host-binutils-2.45.1 | 1 
    host-mender-artifact-4.2.0 | 1 
              host-pahole-1.31 | 1 
              host-rust-1.96.1 | 1 
                host-wine-11.0 | 1 
                 lcdproc-0.5.9 | 1 
           libmicrohttpd-1.0.6 | 1 
                     mtd-2.3.1 | 1 
             openjdk-21.0.10+7 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   perl-5.42.2 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
rtl8723bu-ac3d2f564bdf6816f... | 1 
                 s6-rc-0.5.5.0 | 1 
                  stunnel-5.78 | 1 
             superiotool-24.05 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/cbd11d9a26950efac2b51a1f7b6898e3ed270eb8 |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/4ff3b18ea094b4ee8f6cacd140706d007bc9203d | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/c3022b836d5a28ee79e4f350451885999ecfadec | ORPH
  aarch64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/fd6a29f3e7045061735121834576e072ce600d24 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/d89ce974fe71a51a5726c0066a177aafffc702c7 |     
powerpc64le  |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/4e7c22c50c0c5e013b3ce1bb83ce6075c1c17c62 | ORPH
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/f3c241af1f297aee170b2e46def3d1022eb7cc49 |     
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/105f44685a2827486a5fdb64bb478842b9e0deca |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0811653fd5fc6d43d1780fb31b2e3ffb582a6299 | ORPH
  riscv64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/7a2af70998d8500ba2b6ff0454956336739d6aea | ORPH
  mips64el   |         e2tools-0.1.2          | NOK | https://autobuild.buildroot.org/results/51e4ee6f507c1ace6f77b9eaaeef843fe81c5d00 | ORPH
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/e1f3766c69f6e5a669b01fa0f3b5b96cd02101bf | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/7a2170b1421aff63eb2bdd49bff27b8cc9610875 | ORPH
    hppa     | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/2b27a8f3124f8c1992c095d7a774414104cf7704 |     
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/94deeae81b03d406fca1cd89259c9592eb081892 | ORPH
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/ac8869c4fc946e5d04877ac1dc3528dd34cef332 |     
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/db8f9432194ed1aebe1306b4a991a141b5086fb0 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/0dab1711c23dcd7a67f14b8f8059b08740d716f0 |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/8481ff8f0068c3b0423ee741c10a44ab8a9d3012 |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/05606e86dde37c9ed1758e020d64439e0bd089fc |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/6e208c4ba0b6adfad6839b5d4e44b0529ece9200 |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/a467349f5cdacf81a6e0fc43fff2d1bca2653c33 |     
powerpc64le  |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/f4b5c5f86cca6e59291b6d67f04cad184d66fbcd |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/5a3681824fbdb48926ffd74b67d37a1b004570c8 |     
powerpc64le  |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/dd3cbd0d24a152aeecb75ac7f67482d55dd68eb0 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/570b4055e55bdbdf9a5c877447eff1f2ae19a972 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/0749952b04c730942e46eac52760ca65b0eab3fa |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/9f6d33e76bc348b8fa8e9c0bbe4a2c131a3026c7 |     
    i686     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/4db0267685a0fcd73b08182b6d8eb7e91e439f54 |     
    i686     |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/a67235c11aa99408973e42df1438b2e008260902 |     
  riscv64    |        host-rust-1.96.1        | NOK | https://autobuild.buildroot.org/results/e89915321a897e047c0218aa19a597d9474484a9 |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/056dc04dc12d7fbb5ba38a1bf68f00b8d55c5327 |     
  riscv64    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/10c6cba233d5fdf2d50c088486d1a1cc6dd2f832 | ORPH
    i686     |      libmicrohttpd-1.0.6       | NOK | https://autobuild.buildroot.org/results/5e64368a711024491b8d35de720b852db1efc667 |     
  aarch64    |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/cbeb58f8b7ed6f2e2ee92f6ab28294ece52cb39a |     
  aarch64    |       openjdk-21.0.10+7        | NOK | https://autobuild.buildroot.org/results/da3a12904f000fd22e2aeec8babb9298c1b54c80 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/f03d93b5bba8d6749400111663409e24c76d7e57 |     
    i586     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/24b58b64270ac64fafc5318e6f979613d1f5f1c1 |     
   sh4aeb    | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/3a63d7a8b0901a2580d7b89aaf6f8c8fbce80e10 |     
loongarch64  | rtl8723bu-ac3d2f564bdf6816f... | NOK | https://autobuild.buildroot.org/results/ec3be7a60a78664d37427bed833a66bb7aa7a355 |     
    i686     |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/41bcff16adfd01849e48beb6dad3155fb5bc7a85 |     
   x86_64    |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/814933ea406ed545fd99421f7bb05e0dffa3f818 |     
    i686     |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/73557d416038f3c30f59776d447bd0e8990c6124 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/577d73571ff596e5a7b180a3f729df19a85ac5ab | ORPH
  aarch64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/b4fad1bc9665988717c9b7066aa51d9c095d6ad6 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/fb0910db400d8bb69badfa3e684a89626d9c08ab |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/fcce66c5c869ffe6e3734c5c5cfc9509f0387f76 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                   ccrypt-1.11 | 1 
                  libnfs-6.0.2 | 1 
                  stunnel-5.78 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/cc9994d3ddeef2902efe01fadaba4fc92e653705 | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/a56629067ee65e3b29552bb88e093460e5118328 | ORPH
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/1b7bdf464301f70e4a5dcdec0f801f102cf720b0 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

 qcom-db410c-firmware-1034.2.1 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/e5277149805e9605448ce7e6f38f47df8e8777b5 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

          cloudflared-2025.1.0 | 1 
                    fcft-3.1.8 | 1 
        host-python-lxml-5.3.0 | 1 
           oath-toolkit-2.6.12 | 1 
squeezelite-71c012ad9ba102f... | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/0afff73b32c3db5f2343a1b88b4d5d9d1b10c066 |     
   x86_64    |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/47f74d9ec840bbef724aa2021d4167f70addedad | ORPH
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/926f3fcd097af9ecb1cae7a61f76304f5ec95d22 |     
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/86b5c1231f66c109e9b244ec52b591fbef74dc52 |     
    i686     | squeezelite-71c012ad9ba102f... | NOK | https://autobuild.buildroot.org/results/1cb77b411f7c27fb640619a9b58b27625f77196c |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/56a762ea65fdae50f4675bc2ad29a8c998ae3d3f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
