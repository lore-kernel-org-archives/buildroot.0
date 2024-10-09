Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C32CF0435
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 03:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23345607DE;
	Wed,  9 Oct 2024 03:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4iOqCiYA24y; Wed,  9 Oct 2024 03:17:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D790607E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D790607E3;
	Wed,  9 Oct 2024 03:17:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C3FD1BF215
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 03:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9858C607E3
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 03:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sSohMGz5EkT for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 03:17:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AFFD3607DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFFD3607DE
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFFD3607DE
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 03:17:17 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a99422c796eso539084566b.3
 for <buildroot@buildroot.org>; Tue, 08 Oct 2024 20:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728443836; x=1729048636;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f1R68WbVwdVXunLn6bSvtyAUfGjIpScGuJI9k+N/ggQ=;
 b=qZqeHCqNqBS1ICpiT1FfWxFnsoq8qeKHL7zlSJkk6NikX0Vv93HB/AN6JlW9dxb0hO
 UDCvpCovc1n4NPhStn9CtA5CqZjFipeP0QwApuyhtC8LkjFdD/zroBokU1csjl6UabRR
 PMOUkXGHpAd/IL/GTTXDviCNlC07v7F9GrQwdiqN8d7ISWX3RZsN1R9OX27jEPcAC2Bw
 fJtXUUlUziBkyAIT1J+j59vM2tRZsNSQv+uh3aEpL169uKIfzVNL0iGyOKKLs63d18Nj
 I8TgCwgib2tm0UmeHd62m9+PXvN8KZ0G/zNqPjAcqHzJv6gHg6HIu6NvCK41+KrtLrIL
 Oh8w==
X-Gm-Message-State: AOJu0YwiiYT060GQn3t2nADjoqseiZPfKNlUty8UeoRiDeo1tZktgfKX
 T3dPTn0yEptWeMq55iNWzNalyyuWzRE18cshhBLUiU6gl4XhgDhkKx9Vew==
X-Google-Smtp-Source: AGHT+IFZqeA2UrJsHv8HXt9VjICIfeXs64VFBMQFI8ABrwFm3aMw474QP5iNhhUsDzVTtKgyeRtzhA==
X-Received: by 2002:a17:907:7e82:b0:a99:408c:6a10 with SMTP id
 a640c23a62f3a-a998d15a6edmr61862266b.16.1728443835468; 
 Tue, 08 Oct 2024 20:17:15 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99551fbe9asm349382066b.43.2024.10.08.20.17.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 20:17:15 -0700 (PDT)
Message-ID: <6705f5bb.170a0220.13a15c.ec41@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 09 Oct 2024 03:17:15 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728443836; x=1729048636; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=f1R68WbVwdVXunLn6bSvtyAUfGjIpScGuJI9k+N/ggQ=;
 b=iHk+Mt30DZlVgUba47H2+l7PJ6AMtjAqhC+O0pRYRJT/TGyMB/UK5MYBLrQim17dii
 KD3b/O+GKWc0+Y1W7iq2uFnYkiLo10tjg8UAbsvgB/Ytac9OJsTY6Af/L171dfljQrw0
 CoeKV/L4TXuaGO5bCy3ad+zAuzMqpoxnWI7C9F+WP8lgCkOKjjGi3YkzEqTOk/2MhxdZ
 B92eHcpd5xMCvIYs7TnsQ1uXG2D1BpiduFYitiq/d+XnImwpUAlS9tSinEbXZfVw+0Gx
 B68nHGeJZ3qWa/7EvswnUqcGb8tHFKXgwTug2GL7jcLwLgneZjHz3K9rgn7+dbAWqWAW
 c9XA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iHk+Mt30
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-08
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2024-10-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  4  |  1  |  7  |
  2024.05.x  | 30  | 18  |  0  | 48  |
  2024.08.x  |  3  |  7  |  0  | 10  |
    master   | 13  | 87  |  0  | 100 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 15
             bluez5_utils-5.78 | 7 
           host-librsvg-2.50.9 | 7 
                libcurl-8.10.1 | 7 
    host-python-greenlet-3.1.1 | 4 
            host-ccache-4.10.2 | 3 
                 linux-6.10.10 | 3 
               procps-ng-4.0.4 | 3 
      python-autocommand-2.2.2 | 3 
                 apache-2.4.62 | 2 
                  bind-9.18.28 | 2 
                  evilwm-1.4.3 | 2 
              fluent-bit-3.1.3 | 2 
            host-binutils-2.42 | 2 
 host-binutils-bare-metal-2.42 | 2 
     linux-5.10.162-cip24-rt10 | 2 
android-tools-4.2.2+git2013... | 1 
           at-spi2-core-2.50.0 | 1 
                    azmq-1.0.3 | 1 
               belle-sip-4.4.8 | 1 
             berkeleydb-5.3.28 | 1 
  binutils-arc-2023.09-release | 1 
                  boost-1.83.0 | 1 
                 coreutils-9.5 | 1 
          cryptodev-linux-1.13 | 1 
                  curlpp-0.8.1 | 1 
                   eza-0.18.22 | 1 
                   foot-1.16.2 | 1 
                 libart-2.3.21 | 1 
               linux-pam-1.6.1 | 1 
                  ntp-4.2.8p18 | 1 
               openblas-0.3.28 | 1 
                pipewire-1.2.2 | 1 
                 pixman-0.42.2 | 1 
              sdl2_mixer-2.6.3 | 1 
                       unknown | 1 
           v4l2loopback-0.12.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/f5f708931edbc32687cba3b9b362921c9612a47b |     
    mips     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/ea670a91afec4221bb98117abc0054e0e152e5af |     
  mips64el   |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/266b8deeb887728f29258762c8c50fb1a4552f0e |     
   x86_64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/164455003e19304d7055d5101d8fa96df440a073 |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/7d7425b42959cfeee39372bdb6b4291a0e036f97 |     
  riscv64    |        belle-sip-4.4.8         | NOK | https://autobuild.buildroot.org/results/a4619f3cc4df320b02a06928ab3c0842b1081b27 |     
    sh4a     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/0ec446f44bd6faf3326fb66dc26871fb1c01532a | ORPH
  mips64el   |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/ecaac1f9f488f633c12a8b5eeaa885a0e64b5731 | ORPH
    arc      |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/a80acb21ac00cd3835811825dbcc92ade66b81a1 | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/40ad8c06f0c7bbee8fefc3c8e0a2ab6060f23bd4 |     
    arc      |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/140f37f9a835eb60e7ffff56885b18ced7973f35 |     
    arc      |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/a4a1ebac3c4f5745089138587e73e5737f6dfee6 |     
    i686     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/5b078f12eec91f24a33d9b7bac669bc942e8dd34 |     
   s390x     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/ea59e90d8bc91e88014b2b0c83876ca6950deb8a |     
    or1k     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/87cdad62ccaadcd47b5d35a07148f63af7e41ee0 |     
   mipsel    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/ff9853b55a08e643b2577ff4b4f9bf31c3178c61 |     
    i686     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/bb81e78e66cccc436eb4785ee549332a38c787df |     
 aarch64_be  |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/4b54cdf20f20a8b5000db6807f229b7895ff5a2e |     
    arm      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/c4af6e60fdbad634d54fe8c479bc4df801fb3744 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/165a8c5726bc415163bf07428898760a1a53fc37 | ORPH
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/ce4e098a897c281966d6dc8f627385843109887b |     
powerpc64le  |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/927410e732423bd977d7ba48ce826dd1398cd166 |     
   armeb     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/09e79cc0071ad005e3b3b1d55180399d3441ef0b |     
  sparc64    |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/4da06658cc35aef318e570ff043248efe37eb276 |     
 microblaze  |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/c71ca4a5a569ce9303202761b4594b49641424be |     
   mipsel    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/dce2ba346c041af15c0839ff88256e48f5292431 |     
   s390x     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/202fd43fcf8cbe7a56e5049698bd9eff257fe0fb |     
 aarch64_be  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/fdeb9e3adbb10d456e78bcdbc0045e944d13a9c8 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/02d8e498c80c0de225e85a84919bc3189b0f15b1 |     
    i686     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/d86cbeb864d951c446c71b56a3b9574f95a01dcb |     
  mips64el   | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/efd2b922f8b799ec7dbb4ee4015ac1c8462c6b74 |     
   sh4eb     |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/c0520c7aa68915ed42733afc1cb8eb568c9f6bca | ORPH
   sh4aeb    |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/cc4b22c6bacd9c3b8ed2a24ab75df8af25277983 | ORPH
    i686     |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/235b523e0192a4b78aa3cb7d4b4d142971e12949 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/51b740e2d265fa433d830416d646c7e98e65923c | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/36e9da2e0699b733db157d3fdbccc551c49d4f80 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4c4759c622f4836b439804fb716dac0f0a06329a | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/175e7b180f814f130793e52db1b057c69db52ffa | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bdd66ca1689a7cfa98bb1cdaeab82c4dcba0b1d8 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/001ab76575391aaa39c69efb7b2626120af16fad | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ca0a35dd08f96f8c8cb3e483e6438e2a9673eb0c | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6ddbbc62f9b522e3008ccfa7397a479569c10424 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5e3e27cfb8fed56096d6cf512459f9ef8adb48dc | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/94d4c59ce3149a232551fc5b98758b21c3d855e9 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2e0256c46103514e4cfd96a900c5eee72b67b42f | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fca58dc8e42a7cb4afd872d36b0f9e693c933e5d | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/83b0db28034a3f537ace7c7806c68a72c01f076e | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ed4a4d37c8efd604867ea98381b72c0ad7c157b1 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f9921e8af529a7fce01ed6a80a914be87fdc81fe | ORPH
    arc      |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/6a7e3889d7739326d09c6194ceecc32f5b1151a7 |     
    mips     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/3d4a37991ece22bdc5020dacf0f9c1945cd1beff |     
  sparc64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/9184d4de6caf4b8b4fa3aed5f56e5819659801b5 |     
 powerpc64   |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/04b38fea0cfdd418fc29c23fce21a78f23997934 |     
 microblaze  |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/fe7f15e617cdd7fdfe5caaaa3ed0d1308c38de74 |     
   x86_64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/b793d1d62dd06d96e141183aa3964fe4f6e69679 |     
    mips     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/ba89ed821b21d6c7eef8b540acee02e7707ca31a |     
powerpc64le  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/728bee1f1e92a5c085b5912bf678f6c8bd903429 |     
 aarch64_be  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/3e7d0b2909054dda5a1ce5a92c92ae9e13cfdcc4 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9fc93bcf9c06b92d0852a556aabafe310ff9470c |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/131e860c1a70f26e85fe5db1148ea669bc4cf18c |     
   sh4eb     |         libart-2.3.21          | NOK | https://autobuild.buildroot.org/results/c67a4a27cdee8cb0cd7317357547bf54728ab33a | ORPH
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b332c940b5c9e81d1fbd2eb2493a034f2e2651a4 |     
    arc      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/5140a67eda56c09755a7b5af2b1d05883f27b3a3 |     
   sh4eb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/e84578920b5e05c305aa8f99f5cd3d54d08832e4 |     
   x86_64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/97b4366b8ca0c1a820c83c30d8536fa1e20e9514 |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1fc760381005531303efa098586dcff284cba44a |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/16c39d7905680f78c27b0c241917dc8022fe77ba |     
    i686     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/8ee06d5de1786b2c2496e445f0938c041d05be61 |     
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f01baa26f8c45460ef8107b0d56e956bc8306382 | ORPH
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6da8bbada6094d162ec4a2b77a50015e5c965d4f | ORPH
 powerpc64   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/892af9a04f93c28837c15537742e30828d34c055 | ORPH
  mips64el   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/7688cacbbbc6724a3f15ceb6b2f5ea0a0e4deb8a | ORPH
   sparc     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/d35c5beecfcc323f20f3c5f86c5c3712592a0424 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/78fa165756212acd32d35f77d208e0dc8007f8b7 | ORPH
    arm      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a8d5a99dfe82eda4e3d2dd5a224d638bdf900f18 |     
  riscv64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/627a6d14b2832278b18ccb82d4907d15e092b87d |     
 aarch64_be  |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/410cece686e1c67b44c7ed02395164808159eeaf |     
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/9f93d7f8a32936fe138c30c4d1251e19ee4a0bc0 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/90c2f29cb1ad938f2b9d1e685e87a1a9e43e64bf | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/28601b61e0b3390ec7658f260d270ed166a48f5d | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c498b2cd5cd87e2d0057f7d28a023418cc77cb75 | ORPH
  mips64el   |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/13e360b637a3929385681c54ab6d3c37ee047712 |     
 powerpc64   |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/0982f79888d09947f4178573eb7096f51b808e7f |     
   mipsel    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/9a1cb150f2c2ea32338f5406e9f87e6138583edf |     
    arc      |        sdl2_mixer-2.6.3        | NOK | https://autobuild.buildroot.org/results/ed06cffeec8cc0a5298ef1f487903e33d04ab630 | ORPH
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/885886d55e946a2fa5273f7c7e739d16e222bf15 |     
powerpc64le  |      v4l2loopback-0.12.7       | NOK | https://autobuild.buildroot.org/results/44f86dce38037f5e673fc059417c36b9ff951a87 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   duma-2.5.21 | 1 
                        ffmpeg | 1 
                  linux-6.6.50 | 1 
               procps-ng-4.0.4 | 1 
                 x11vnc-0.9.16 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/393ef19b77cff4ae493157644c06d3d5d49e193a | ORPH
    i686     |             ffmpeg             | TIM | https://autobuild.buildroot.org/results/a97b98350717b854a3fca044198db213a1f56ed4 |     
    m68k     |          linux-6.6.50          | NOK | https://autobuild.buildroot.org/results/9165abfad4adbcb0bbd6a4f48aec82f8e2b4e420 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/55dcdf19a51e11afdf1e5d7820c8c71b269a7c12 | ORPH
 powerpc64   |         x11vnc-0.9.16          | NOK | https://autobuild.buildroot.org/results/b2231fe06fe56036a5ddbe61cb8556b046e3a7b7 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

         python-remi-2022.7.27 | 2 
              skalibs-2.12.0.1 | 2 
              cache-calibrator | 1 
                  ffmpeg-6.1.2 | 1 
                   foot-1.16.2 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
  gobject-introspection-1.76.1 | 1 
            host-binutils-2.42 | 1 
              host-runc-1.1.12 | 1 
              host-rust-1.74.1 | 1 
               libglib2-2.76.1 | 1 
                  linux-6.8.12 | 1 
               pcsc-lite-2.1.0 | 1 
                 pixman-0.42.2 | 1 
   python-pydantic-core-2.14.6 | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        cache-calibrator        | NOK | https://autobuild.buildroot.org/results/b74bcf17007685478d2f52c5736a13d89f4dbbce |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/927ac0b5690d934174ed9398702c152a3e583451 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/749bdb34438f3ea26159466596964a71e0e651ea |     
  riscv32    | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/38598cb0712d2321025bf565828907509209f889 |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6daf9e1096b5cb74798dcd1b2f82b5ddd1f34846 | ORPH
powerpc64le  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d71a196ab7de88fcb3d9b6381de42ddb6692a82a |     
 microblaze  |        host-runc-1.1.12        | NOK | https://autobuild.buildroot.org/results/cdf69d0c37d98cf4ef52088d0a93df3b79f965f4 |     
   x86_64    |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/a80d264af8a256ace83d6e0a5d4d80c8abdc3533 |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/1470663e9caa779cf5551a777024773d25eb99b6 |     
    mips     |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/ff940afc6e645144b8aee97f79d109a9b9d989a9 | ORPH
 microblaze  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/1cda739443ddd7b240b33be1ee35580fc1e283b9 | ORPH
    i686     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/2911627132d638204fd4fb327439aecef6b0ff39 | ORPH
  powerpc    |  python-pydantic-core-2.14.6   | NOK | https://autobuild.buildroot.org/results/391fec0e00656c124633a81f58d8d40cb45f1d00 |     
 powerpc64   |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/1337db470069179f89b745289be78967e28f65c1 |     
  sparc64    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/58f0b0b015aa09196d65913dcce09df8847dcceb |     
   arceb     |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/0fd16648d4887c73bdeabd372d1e169eb7be616f |     
   armeb     |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/b0ce48e0e974d7c9cd39edf62314be3f605d9cf8 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/fe2d9a481ab7da222252921ccb75e0f5074c6c70 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                 hddtemp-0.4.3 | 1 
              host-rust-1.79.0 | 1 
                latencytop-0.5 | 1 
                  linux-6.10.9 | 1 
                     lxc-5.0.3 | 1 
                  procs-0.14.5 | 1 
                   swipl-9.2.6 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/7e3327b42033c8e3d23ba531ba787b4fbe88eff0 |     
  aarch64    |        host-rust-1.79.0        | NOK | https://autobuild.buildroot.org/results/1eccd1a26e805eb07f8b57305771d53a2e04b228 |     
microblazeel |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/efea1ff1d9e8ffa593210557b7943f184bc1f319 | ORPH
  mips64el   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/69054def1ce24bd43d983d0ff33b68228852ff7a | ORPH
 aarch64_be  |           lxc-5.0.3            | NOK | https://autobuild.buildroot.org/results/f1561aab4c3689a20d979b5abce14ea6430c2e46 |     
   s390x     |          procs-0.14.5          | NOK | https://autobuild.buildroot.org/results/643b9446d8662b4ca0ea4314ff1bc6c53cbf616b |     
   mips64    |          swipl-9.2.6           | NOK | https://autobuild.buildroot.org/results/73d4ffe098dc24331a1b22d8a481871bc2c4b5c4 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
