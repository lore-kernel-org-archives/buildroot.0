Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98786C2A09B
	for <buildroot@archiver.kernel.org>; Wed,  5 Aug 2026 03:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3905980D3D;
	Wed,  5 Aug 2026 03:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vkmmyk1pniKS; Wed,  5 Aug 2026 03:26:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C599280D35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785900379;
	bh=1GdWyO1a8c6alBZMl+P8DuJY/V8MsAfcyhLnevYfYWY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lfi7B6i+QO/nBjbgdN9bSjo3RhIGpZU7Cq4Vol7ggQb5/rquSDviBCRbLSZAUAkPe
	 sPm/k+ZnJXf9KZEu4ylwVdbmVusfax8UDcbTyowkifx92k5//4/Nj8KTHpr/0cz20I
	 403s1HZ5FUScUpSgWn4rqjEelWeGBYQBQKBlAh4yg3ScCp/99NvQqAH1kgaIKx4Aep
	 DC7PTJ3oWD44WFzsYmVu/pykOklQViNYT7GplLLkfFcCYdn/JnrTRL2PMl6njJRaz9
	 iOd/gyZZSNU9Vt15egAnOyidFBxHLNJYyxl8xBz0cMOnVyNiyS/ZEig2B65VE+tLyi
	 tWr0RWkJcjQJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C599280D35;
	Wed,  5 Aug 2026 03:26:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 424B128C
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 03:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28CAF4050C
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 03:26:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cccOvOORS7H0 for <buildroot@buildroot.org>;
 Wed,  5 Aug 2026 03:26:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8A1E7404FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A1E7404FF
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A1E7404FF
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 03:26:16 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4954dff6536so3232735e9.0
 for <buildroot@buildroot.org>; Tue, 04 Aug 2026 20:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785900374; x=1786505174;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=mfvi1zVl+SJIiEbr6Lte5Ux1HFf976b1Y1JoKuTQPSE=;
 b=B858f/ZPnNk/1qRZ9JxIIMOZAsQ2qPHAbAjk3xHcXBEzsu2/xYCMxUhL3WIgxpUcZg
 Nzs35gwx4vS5BISzh2RFNLhdYhiQ8/FexzlB+JqcpynC7qABDyUuUEe16B0bgvhHkyoP
 2P3ZGiN8KBkkMwF8c3bKJY+7C4GTSUl4k1RFRZazQDgnHpwwjpIuxgVq12QCrUZ+9pgs
 iWhYQibEw+L6Gew1/EbkJbutSODNPGX72fm0h7YnbVdWZKThxZ6UwG/wYl6bbbqCS98/
 fl0hcRgp3m0F2lPtf+vBMHiFETO8r3zlgLlrHJrQeckHzbMdVe5ey+7MCIuufiffUf64
 LEVQ==
X-Gm-Message-State: AOJu0YzHmZ90dpAU4UW9wK+m+4k2WeWqF3SvT17DCShvctraNz83m5VK
 EVzz/XTc3W5/MYc99o4s7oiYRZ6P1CVDhmI1Wr6ShaRCsoZLLDmanUztfChQ0N3L
X-Gm-Gg: AR+sD11x+vHh5gvQ5l4/XWCbvd9ItrpcnnVkdMGXyfZlZZHJPnc769VARkvRAfDm6Dq
 NhSw5dNlMGe9bJiOEhkl4ci7orVjRE+x10O8ACmoKZVT3kIXQJkKB7oM/skylE7qy2/vtZ/mxx0
 HknpUVkhCYSO1tlkRAPvxl8QW38PctJEZQHzJcmQFE6RWKbdfHD/NQdkHtyfLadc1vNfcxsQcRg
 nMOQMla3BNoIPBo6V7buYkYBY7GwsvOioYQWyaP5D/A6Ih/f6qxX5pB3MWoks4SlZvmwVazNwmb
 ML50RKp0NTDESz+afLW91ddEFp/Wtz7ZMGivuFXh9FOv5rzwoot8c4lukEUXlwJHnrMkUBbIVn2
 drMorKWsK/HYGSnSoUAPXEdyzc34FCWrvonhUaFgYBmKzS6yU9NMAs1uY934ZsX70XyYpX3OTug
 0Kv02lcEeVmN9FmC8R3EQlxQ9O9DJHwqpYj4f5liJwUb5xtU92v1iJ6Bi15CNPakg=
X-Received: by 2002:a05:600c:3589:b0:493:c845:bc20 with SMTP id
 5b1f17b1804b1-4994e79ab0emr33956855e9.4.1785900374123; 
 Tue, 04 Aug 2026 20:26:14 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994e988687sm22496895e9.3.2026.08.04.20.26.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 20:26:13 -0700 (PDT)
Message-ID: <6a72ad55.1583746b.1c869c.fa02@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 05 Aug 2026 03:26:13 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785900374; x=1786505174; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mfvi1zVl+SJIiEbr6Lte5Ux1HFf976b1Y1JoKuTQPSE=;
 b=n9tC8imG+Kos8vHo9CcKNAvbKupeJUN1xRWtxzfnZ9rgIrilPyeXONfjhW8N2Ku0Xl
 R8cO2v5pImiwnks/vAC8pJnBZ2nojTl7JRwb9sTr10ukLNNkgmGtWVXVhE7AXxEaRgNY
 1K8mF62kg5UbMmpdxXXeFXaF/2VVTBByeL6sDNfObnTOgM1yplo88HEP+pfp+q1Xg9Nn
 Pc/SkDKWhGh6npxLiYx3C0AWNiwfpfEQNHive8opm65aY/E6vvPbIMuRy5ddN0m0XdBI
 3wp3eF+88It1RI6jnjIYvzKHznqq2a1AiK7S4Fw8uF1PFPUeFq5u6xg3OE02n8n0MWN0
 Gyfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=n9tC8imG
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-04
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

Autobuild statistics for 2026-08-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  7  |  0  |  9  |
  2026.02.x  |  1  |  1  |  0  |  2  |
  2026.05.x  |  2  |  0  |  0  |  2  |
    master   | 22  | 53  |  0  | 75  |

Classification of failures by reason for master
-----------------------------------------------

        edk2-edk2-stable202602 | 2 
                enscript-1.6.6 | 2 
              erlang-26.2.5.15 | 2 
  gobject-introspection-1.86.0 | 2 
                   gvfs-1.57.2 | 2 
            host-binutils-2.44 | 2 
                host-wine-11.0 | 2 
                     kbd-2.9.0 | 2 
      passt-2025_06_11.0293c6f | 2 
                   perl-5.42.3 | 2 
uhttpd-15346de8d3ba42200249... | 2 
amazon-ecr-credential-helpe... | 1 
                   atop-2.13.0 | 1 
                    attr-2.6.0 | 1 
                    ccid-1.5.2 | 1 
                   dante-1.4.4 | 1 
                    fcft-3.3.2 | 1 
                  ffmpeg-6.1.5 | 1 
                     gdbm-1.26 | 1 
                     grep-3.12 | 1 
                    grub2-2.14 | 1 
hare-dbus-e9a89f8bc5ce783fa... | 1 
                host-lzip-1.25 | 1 
                host-m4-1.4.21 | 1 
    host-mender-artifact-4.4.1 | 1 
            igd2-for-linux-2.2 | 1 
              jpeg-turbo-3.2.0 | 1 
      libabseil-cpp-20260107.1 | 1 
   libcdio-paranoia-10.2+2.0.2 | 1 
               libcodec2-1.2.0 | 1 
           libmicrohttpd-1.0.9 | 1 
                  libnss-3.125 | 1 
              libopenssl-3.6.3 | 1 
                libsoup3-3.6.6 | 1 
          linux-5.10.254-cip72 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
        ltp-testsuite-20260529 | 1 
   openvmtools-11.3.5-18557794 | 1 
        s6-linux-utils-2.6.2.1 | 1 
           uboot-tools-2026.07 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/a3ac20bda1e6c78a801258d6d02f8ff9d7dcce9c |     
   x86_64    |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/c94073968f039c93f4c6585b88d0fffbd475c4f0 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/c2c0d0fe76823903b6cc4610fc6a681e56b3c628 |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/14b8112dca36be6f54b25c7583a654ae21fa8d7a | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/3444095bd9020fd73b366c6a1f4925550013f8b7 | ORPH
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/213a55257d1a8f678e3ed9c26ec96d5709be87ef |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/585df0d86a6ee46616983522f603863b9294e987 |     
  riscv64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/e065ab128629434a68948836a17436dc857346ae | ORPH
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/53d7b26f5876c02d512a54e6bf2792e5e15bc551 | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/68d612495efd6b42f4ec0433be169ff3416f3d55 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/0822b2f8d4552f1f1deb86ef290bf8cdac1acbf8 |     
   x86_64    |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/27ef8bae650014a3066aa5203b77e59afc74b1d4 | ORPH
  aarch64    |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/d25ca06c402048441368313033b0cf45ca88d43c |     
    i686     |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/1c5d4cb47dd5bcaf55963b0a083f35c54c703f3d | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/9f482c78449dec218eebd7b4db7b76180a7931ed | ORPH
  aarch64    |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/8a86a21929dc3848424b82d439f01d0b823cefd8 | ORPH
    i686     |           grep-3.12            | NOK | https://autobuild.buildroot.org/results/d2c9224978b725bd829250f69d8152a260e30085 |     
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/89b907278cada3d7ca1fee2d08d66921ffb4d7cc |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/4081f6fe8bfa5aaaa11124911f1c1ce86ddbf01b | ORPH
 microblaze  |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/4b47e669695dca092860e225bdaf9e82a9650e17 | ORPH
  riscv64    | hare-dbus-e9a89f8bc5ce783fa... | NOK | https://autobuild.buildroot.org/results/e162211ee9addeba61c309d154f47e1ccd60bf27 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/a36e6649c0bc1a0b80e17f90383ce5c1a64dae3e |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/0f69df78ac6340cd171dab7a6e66c718bb4d4415 |     
    hppa     |         host-lzip-1.25         | NOK | https://autobuild.buildroot.org/results/11b699129d7d73063874e80e2e40c55c03748639 | ORPH
  riscv64    |         host-m4-1.4.21         | NOK | https://autobuild.buildroot.org/results/f65e216987044b56dc102438f35d6f8abff74ec6 | ORPH
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/a0699084fa8e8eac38b022597fecbd837f33ebdb |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/1541fc02499423d0406c4499d64d91f4c4e3cc08 |     
    i586     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/88b67933c35b0e2e03427fb3c2daf5a1273fca41 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/435e65abf32d1aea7a9d6f68bbc3a3c5bf0932f3 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/ff0b201ff081afb2df1a1fd9bac9248171947e1f |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/f3dee7e3cd845a38e3afa08dcd91f072b58ed008 | ORPH
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/090b5c9ec72d2de3b9e823ad41daf4802c2c3677 | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/7a130d24095593c7f789d237a92fd0be76415d50 |     
    i686     |  libcdio-paranoia-10.2+2.0.2   | NOK | https://autobuild.buildroot.org/results/6bd311d6fba98edfcd9d3dfd5dfaea50a490c4fe |     
  powerpc    |        libcodec2-1.2.0         | NOK | https://autobuild.buildroot.org/results/9bf7c14e4b631dcc2ddd03df058e9ddcf48ce15e |     
  aarch64    |      libmicrohttpd-1.0.9       | NOK | https://autobuild.buildroot.org/results/a8ca5c0a0e96d9590f284f7843ef072538d4a478 |     
  mips64el   |          libnss-3.125          | NOK | https://autobuild.buildroot.org/results/43f9b4ba88a40b33076a377bbe4e9c2899b23f79 |     
  riscv64    |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/4a17dac549481bfab844d1991e8a5ed9f8a42d7a | ORPH
    i586     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/8c7747aa57252fc7cf1a0da8cc52360e15fa2d5f |     
    mips     |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/e8d02343ec901e0d7ce9e73692d1c4ca8a89df18 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/79073c3dc8b5606af87f83f564cbc5b636904fc3 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9b38a007155ee17fdc6f92e9eb8e520746b0ee74 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/69362412fe48b7a22481e22993a4adc7185ea4af |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/d07ba8c5282dec84665a03fce3bcf8efb7dfd58b |     
  riscv64    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/3f60889b4599f1bc42a69076f6fe469517ea9ab5 | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/36745f2e7f6a671de330c336f42216ac6327a011 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/a30aca33a087478592ddf1be15e7986fe6c37bf7 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/cfd764ab3080126cdda2c716a956635717f3738b |     
    or1k     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/03b09dcf6afbbf62cd4182e652010820a699df63 |     
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/0d145f52f78c58a03306d9573eb2e8a2bf31edda | ORPH
  riscv64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/fe676f7c6f1b87258b5f2df638258b4bff9af101 | ORPH
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/745d086877591515de2ddbb6769e3e26585a3838 | ORPH
microblazeel |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/06478fc7b43147c66ed63f189048bd19a6a781c1 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                 openmpi-4.1.8 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/e22a9f2f47f243689a8525c131f70557d004a17d |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                memtest86-7.20 | 2 
  gobject-introspection-1.82.0 | 1 
    host-gcc-bare-metal-14.3.0 | 1 
 host-softether-4.30-9700-beta | 1 
        ltp-testsuite-20250130 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/28aa674a50cbbd49fbc83aea533050247a96ced9 | ORPH
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/61850063b18cb4dc02a78fe39aa7a62858615024 |     
powerpc64le  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/a8094e6d1696ce0133815a80ee10bef39b9073c8 |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/ad20506dd4bb082631d122aa6dea35fd24a7f560 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/1562a74145f342df344599628c4bd7f2f074941f |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/8b95991facbd59bbc94d3a0bec07897350d2c968 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/8e75356ce15856bb7a48151b35540ab6cc96382d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
