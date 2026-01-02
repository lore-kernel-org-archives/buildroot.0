Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D14EEB57A
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 06:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AC5C40262;
	Fri,  2 Jan 2026 06:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Xq3qVgS5_KF; Fri,  2 Jan 2026 06:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A2DA40269
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767334857;
	bh=2MGjbQj7q69NFyQ/0fO8Gb34rWDzgaNJgrwkgdLVKR8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hYYKkEL6Q4+MBAF8s0PoRnH8mzRMW2ZCKmY3Di9PsVzKentZ2u/ynQug029p9vqnI
	 NXooV5JlSdCB47zupInIDKg5C4LDXaBjD6SJCLaMaqay/OaGBMoZB/KILWE0dB6yKO
	 Wg6Kxp9qgOgDMlNGTb4yWoBVjdZiIMtUO+unKdc9vtl0hDDNd9zf8/4/kl+PNrm21t
	 5clzY86tM5SP7B0oyM5ujYUabxcN2RzJ9j4ft+l8ZmVcs16J7L8QQricOKDAByA/sy
	 4zAkNxjXNPnyQtWK355G2DlKXx3t3JUCUj1gGbMohB8LlV4wuUdCvLtOZZwLFdHdWu
	 IPXhUgk4Gs6bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A2DA40269;
	Fri,  2 Jan 2026 06:20:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C539D19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 06:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B63FB605D0
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 06:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-_B6D-NZI5k for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 06:20:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF34D605C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF34D605C8
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF34D605C8
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 06:20:53 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b7ce5d6627dso2136364666b.2
 for <buildroot@buildroot.org>; Thu, 01 Jan 2026 22:20:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767334851; x=1767939651;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VrJwzaqei3EGbHxh0enqP+vZ2KKebUnaT1QeNLpFCHM=;
 b=BQTs4p9A8cIY8AoXsZ1PLMaWl9+ZLqjWNsPB6n3xB+Syuzhu4q8wRtzkoLfifvr+SZ
 pZuqordmR4aFUc/vE9NEfBUc0Ce2XI/hlqEZm0uxPg9USKDjHQqvR3p3jex/j2boxFMM
 WccdlqlP/9nzksmFInHvWmiU7OqPuKQ4ptJK/xSw4ywPJ+xjpF05QBxn31VowOFPGVnX
 EkDzK0MQGCmXrWLTOzXr+ZG8J478rC76Cfq9d64GXPENt9c6BmBVszRvms+SkCmU5TSV
 GQxvyLEy1zguFSMiRHOlNwLFq9n8QWttCE1BwXAiSjNgTHgZqv25WHtSiufYEFKmdSaH
 lTLA==
X-Gm-Message-State: AOJu0YzCoCUuIaTP7IixP9DRXFuiByzlwOaO38vLC9OMgLFOYKs6GIpu
 6/Qw3oFp1SxCOhAVBRcG4D92+tgfgClrInnALyuX1ROg00zLLk10hYLuM9u3Uw==
X-Gm-Gg: AY/fxX6yxI8AKGO4MHJyi1fuQ2nDEnrzu5yZBm1pLVXjwSr0LOuvI3vr3fz7mXGkqHe
 oMXfJA4cvHUn1ifTUNRMpBmP3pry2MdsIxHUg/I/VekKAODgdc9LLVPH6rSZ5NRczl8aNZRlCB0
 f9pZE7VWFUnZRf4Ud/B4c+QGt7i0QeFAKrz3C8ei8KO8eZTxfrRXpYgFwilsJCbacPUNC60uvaX
 b4qNIterwUZRjsGufZTF/zhxA2FZm5tqCenGF/CplDRFRgZH3e+oBNAlVM9YrkNxdtlxQjBDCif
 4Bxu2azLLc67CGMtQu7BrAncL0Ruohpf5An05IsNRr+7ObANvZ5VvXckEi4R1MND+s10bREB44Q
 3iW2uEmq21jOmoaCfhz4Eh+Ki3aSOOROhdkvTJnaQ4T2QCrkcIA4alrXKYM8cXpcZhiHlYFKLZJ
 AJSxATCSoMNqGmhcjMbw==
X-Google-Smtp-Source: AGHT+IGN7RKLCjNwVOQk+PMQk8UXbhhH8DYoSA4lJLnFAmrq5DLtVImt7LJmq1IDCzwuQwMK6LjrUA==
X-Received: by 2002:a05:600c:35cb:b0:479:3a88:de60 with SMTP id
 5b1f17b1804b1-47d1959e061mr486852125e9.37.1767327444421; 
 Thu, 01 Jan 2026 20:17:24 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be279c637sm744466015e9.11.2026.01.01.20.17.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jan 2026 20:17:24 -0800 (PST)
Message-ID: <695746d4.050a0220.7c5fc.0cc1@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 02 Jan 2026 04:17:23 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767334851; x=1767939651; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=VrJwzaqei3EGbHxh0enqP+vZ2KKebUnaT1QeNLpFCHM=;
 b=bM+mumiqvnKSHN/ZWG2KrT+mex8p9IHGOTORpw+V//NRusqiTyL6IAgPCCPcs29Hya
 BjuWV3LLY/Up9nLhd9lLeLN1gVgrojZ2YpPe+39LtgF52r/JZ+IU9U0phPzvnI4lVUMc
 ah8QTNKmzDwfFoTGHf4HoNsjQXLlfohbnscXAOq6mcrO/PYSE9UKE/RQDvyyzjtjninS
 HTzMytz52puH3E9Mw8SYtMzsp4I1OjiNEqZowmQpp26OIKzf8rilMz4wLgWTSwlvL9FJ
 fFyCBBqekTZ0kYYgE1Et19z/wzMZCk0+qJ1uDlxlVZ0DTw0TJKO3GCC/AoxVqo3A2q3F
 6E0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bM+mumiq
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-01
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

Autobuild statistics for 2026-01-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 13  | 52  |  0  | 65  |
  2025.11.x  |  8  | 19  |  0  | 27  |
    master   | 56  | 122 |  1  | 179 |

Classification of failures by reason for master
-----------------------------------------------

                   dash-0.5.13 | 11
                       cfm-0.3 | 7 
  gobject-introspection-1.84.0 | 6 
                       unknown | 6 
                   cvs-1.12.13 | 5 
              host-rust-1.88.0 | 4 
     libphidget-2.1.9.20190409 | 4 
ustream-ssl-5a81c108d20e247... | 4 
                  brotli-1.2.0 | 3 
             dahdi-linux-3.3.0 | 3 
                 jasper-2.0.33 | 3 
               linux-pam-1.6.1 | 3 
                   perl-5.42.0 | 3 
               asterisk-22.5.2 | 2 
              containerd-2.0.2 | 2 
                 host-gdb-15.2 | 2 
libcorrect-f5a28c74fba7a997... | 2 
                  libsvg-0.1.4 | 2 
                   lsof-4.99.4 | 2 
                openswan-3.0.0 | 2 
          sane-airscan-0.99.33 | 2 
            18xx-ti-utils-R8.8 | 1 
          aardvark-dns-v1.17.0 | 1 
                  bitcoin-30.0 | 1 
             bmap-writer-1.0.2 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                 dc3dd-7.2.641 | 1 
  distribution-registry-v3.0.0 | 1 
                    dpdk-25.11 | 1 
        edk2-edk2-stable202508 | 1 
                      fio-3.41 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
                   guile-3.0.9 | 1 
                heirloom-mailx | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
                 libbsd-0.12.2 | 1 
libdill-32d0e8b733416208e04... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
             libgphoto2-2.5.33 | 1 
                  libite-2.6.1 | 1 
                 libssh-0.11.3 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.18.2 | 1 
                   lzlib-0.4.3 | 1 
                    mpir-3.0.0 | 1 
                netdata-1.37.1 | 1 
           oath-toolkit-2.6.12 | 1 
                openocd-0.12.0 | 1 
                 pixman-0.46.4 | 1 
           python-brotli-1.2.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
          python-tinyrpc-1.1.7 | 1 
                 rpcbind-1.2.8 | 1 
                 rtptools-1.22 | 1 
                   seatd-0.9.1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
          sphinxbase-5prealpha | 1 
                    szip-2.1.1 | 1 
               trousers-0.3.15 | 1 
uhttpd-15346de8d3ba42200249... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
             util-linux-2.41.2 | 1 
                  vsftpd-3.0.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/955c9b833f8e271dd77dfecb9264decacceb4b69 |     
   armeb     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/f6730384945650946e2933381f1c890f6a177641 | ORPH
powerpc64le  |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/0a5afa4c56b5e6b661f0abfc3c39664c740c4f5d |     
  powerpc    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/9fe0aeccccd6296a3ea08233b7554f5dbae62d92 |     
    m68k     |          bitcoin-30.0          | NOK | https://autobuild.buildroot.org/results/2688e4a2aa8dc34343f0218fd6727d0ae3adb132 |     
  riscv64    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/2ddd5ccaee5f53fa1153d8b1e14dd34dc0508fa5 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/ec52588b64ff5d2f96e3a30cf73b586fa8ac6fbf |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/990484f58d9615ddf2722810b4033379ce6d258a |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/90cc1410fa10120d820a01353f4ce6010be03ad5 |     
 microblaze  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/a23e3a81e3526d12206ea0f036f6e8db8dc5eaab | ORPH
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/91ebf543ecafce3988f6211d17e4c01769f00afd |     
    arc      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/1b3b822b9fb678af3361bd7b97b83e779abe5f10 |     
powerpc64le  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/6da57837590d5d0ab734ca8775da034d366f61c2 |     
    m68k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/6e9fb573337eb56e82034065271e17b6a08dd3c7 |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/d679d44fbe823ec1996701c109d7f5edf9d98314 |     
    or1k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/8341247441fe17ae00a20c169ec000529f2cf900 |     
   s390x     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/0df2b76b1eeaa78d0e616dc3f67ae0a3868697ac |     
powerpc64le  |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/8fc69c867d5f3e3747069a09ed1d7567845cedc1 |     
    arm      |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/6cbe8796ad8648e6b2dd67f550b15f4e39d9b952 |     
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6a391397bd0973aaa928783723779f2890f4c569 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/fb295f5a003fa3207adeb74800db18238461e394 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/51b3432e902b677ecbdcd96b32fb02a8009a2670 | ORPH
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/fe40c07dae163e6ea0446ce6c18ab48272349bf8 | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c120e04c7cfb626b2eafd48525677b9e6f74c6a2 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8e09e54f86663d52800c441a61d43ee418327db7 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f0970d6bfd97e7e0a78f4973fd9a53292157518d | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b8572b50b5f0def67bc14838a0f36bc08600b5ee | ORPH
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/7146490127baab3a582befaf1030e33849aec271 |     
 aarch64_be  |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/475995ca99268c5f28f210560be150d1c6be6029 |     
 aarch64_be  |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/e4c21e7928d41ae5bf29a418e41931764b271303 |     
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/19b1272f8d68ada059be92b4fe79d17c511a046b |     
    arm      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/6d1eb89b517c1661c7c341fc547a398f9131023b |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/7979924dc0c8009e098c58b71a74969b63f2e6bb |     
  mips64el   |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/ab14c922fa55fd31e583c2d4d45e11e8236e6499 |     
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/ab91e1c4f29e48c3e239d500d401d2b9acc698e4 |     
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/fc139a28ff993ca7778a10de1badfbe3afeaa474 |     
   sh4eb     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/211f1dc9acd78c75169989ffd7dc05e7dbe20fd1 |     
 microblaze  |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/e3f6456e98de4bcfd1f6c3133974ee07fe0fde5c |     
    i486     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/f8e895e067e72b4f6dc55ae6b5038fb5c05de726 | ORPH
    arm      |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/239cf85118326e5f7b5e5a7264558abbaabf7910 | ORPH
   x86_64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/38d273aecacd29535574eef190e620ff647816fc |     
   x86_64    |     edk2-edk2-stable202508     | NOK | https://autobuild.buildroot.org/results/28ec83b5936ded119f45d33358e845bac825fb25 |     
    or1k     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/8e946c7104be0295a9a2b946fe4a82bba0e28db8 |     
    arc      | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/b858306bb86dea6b9b9b9e1bc1f3cac3bb7680d4 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/af0ef0cc3f3da2e2e252c20b090665f0320679c4 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c85dbbc5f435d681d0c7a860411b598af7a88ced | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d181d02238849d0952788f8902f25397da835d40 | ORPH
   sh4eb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/911b57a1cacb6d014efbf6150134302dd0de24ff | ORPH
   armeb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7b7546576efb62d33f8e26f0b13cee4c3e4e4c4a | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/df35e3b4409546d6ca177ae842a6b4164e854347 | ORPH
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/1c364ec5e6d8e07f03eddcb737e3bf74f4e66a34 |     
    arm      |         heirloom-mailx         | TIM | https://autobuild.buildroot.org/results/ca02318d24bad8a45072eb08d68c38307b337c29 |     
    i586     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/ede4d2aa641b2d922b436113bf7ae4a29543cf3f | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/707310d8cb0fb43a27e15aaea14d8fd75cb67c4f | ORPH
    mips     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/49c76c1bae803e35e3993acad1e819f484c5f140 | ORPH
  sparc64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/36eff1e24610c78e06c7dd502820316636dc5709 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/bb32d9765c25f7b8a16dcffb0f5f6d51dd29915f |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/52334d5f2f93af0dbfe7e6ea62cf2b702498a6ad |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/096603d47617bdacca9a7c523ceda1bcde681245 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/61694d1d0d933a17121582cf812f753aba85c05c |     
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/2120018b16cabdedf39855fc76b4338f4f5bed9f |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/0b443badb08ad02562035bde2565d157e37f1d0b |     
 microblaze  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/7bc3f9e3b66a8fc8127580a8e22d4cef484e777b |     
    mips     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/d851ed73adfd793fe3dc0ead3479a244a7ef8bd4 |     
   mipsel    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/e25c96e847e871a86a2882f81f49bc62562d9dd8 |     
   mips64    |         libbsd-0.12.2          | NOK | https://autobuild.buildroot.org/results/12ece8e4b435721d79aca45722a37a9c8b380faa | ORPH
powerpc64le  | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/2993c1955e7fd62b53a912c4457f212598b2cbf8 |     
    mips     | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/0ce7b120d61f4a391489ba1b7dcc6a376ed5de25 |     
 powerpc64   | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/8c8772b4dc29adbc9f2f5112a68f63631de0d93f |     
loongarch64  | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/6fde6c91a82740c2118b90b454fd1ab63e5a5c4e |     
  mips64el   |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/f52b184b67ed5938afd932058482726c4be2f402 |     
  riscv32    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/da6d3896665e91aad5870c227d659b7407496ec5 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/fcba5f3a900501e9ff560e8001ba0401e20e951a |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d06724f0b9f825f65f500f953c9d1e5d9da68635 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/5b57938068d82af12a1d018cdcc8f066f747ab8f |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/c50ca787d9c1fa14df6e0ac75a119ed4924f0201 |     
 aarch64_be  |         libssh-0.11.3          | NOK | https://autobuild.buildroot.org/results/6df75ed5c57e87bd0c25c257867037705e03ceb4 | ORPH
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/57615124d3e98a0ea17b9cb51bd0090954b0efd9 |     
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/02acd67c1752d44d13e8977ca40df5513e7023fc |     
    sh4a     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/99476e5cdda91fe8430f4454226f2032faf2c51a | ORPH
    m68k     |          linux-6.18.2          | NOK | https://autobuild.buildroot.org/results/61d72e868644cd1f5349180ef18c0e82a413a918 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c999414ad9a8486c4f31547224d427be9fb02921 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/bada8588c8bec8b7c2e9e6317f9c015fbf025df7 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/31dede0279522045796e3f57fe085b4b870839b1 | ORPH
 microblaze  |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/1be766d8c93f331908d66db5309f64898b14c83d | ORPH
  aarch64    |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/f57add77c670644ad3f9be91d45f6d76434aa739 | ORPH
   mipsel    |          lzlib-0.4.3           | NOK | https://autobuild.buildroot.org/results/a5321c607956ff4672971ecfe5c217e6ce88ad77 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0d1010adf70a8a9d25fe5cdcc22924962d01f8f4 |     
 powerpc64   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/2606099ae426e52a2cb0e4bbcbdaf23de1dfc13f |     
    mips     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/95b519768ee438695bb77ea1237bb688e7d8c6f6 |     
   xtensa    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/ffcfe4de6aba515e534c19a6db6e30c461de068d | ORPH
    i686     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/f097bbcce6e6452fb2b55246661fbbb5ce8fe969 | ORPH
    sh4      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/c8b9f3e67bc283a626bd577b3622fd540d4558ae | ORPH
 aarch64_be  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/95db903bd8e6639071d1402c9cb73ddc59f12642 |     
powerpc64le  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/6dc6829a5ca62b016d9185d96623db576af8d3d1 |     
loongarch64  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/badf419579244f322e4568ad5520f6c671388686 |     
  riscv32    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/7b5029a2ffa5734f53ca0c7783a1cf931c427573 | ORPH
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/e2f3376f07af98f70033173ab73d0d45215aef2c |     
   s390x     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/d0910f036433dd5362fee91e6a137948d8b6b2e3 |     
   mipsel    |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/b72911adbe220922e642bafa929e1fdda17af931 |     
 microblaze  |         rpcbind-1.2.8          | NOK | https://autobuild.buildroot.org/results/3f7ab4552e856588ab8182780a9fa5e2b1527a98 |     
 powerpc64   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/13246cf8e93e2ec65a9372b818d3b26ce974079b | ORPH
   sh4eb     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/6d67b9be8c710fad028ab9a85b555e630c238e03 |     
  sparc64    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/4795132d25f0a2b2dd4fe377406bee90d933c72b |     
  riscv32    |          seatd-0.9.1           | NOK | https://autobuild.buildroot.org/results/99b3cc47daa3f0fe81159f739fa43e478c664797 | ORPH
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/e3e77a83e34370e10a864fa1388b0cbbe02844b1 |     
  sparc64    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/fde5510ddc0386e4c9c6ae54258e7ec214b05634 |     
 microblaze  |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/57acc68b2c686a9a5a970c5f7dcfc779dc3a5905 |     
    arc      |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/95646bac11678d01a863c2c4acf489e00cebc94b |     
 aarch64_be  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/c1a0dce46b4db0cd93282565d478f88dcb474f56 | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6102da8d2af7be1dddb757d17127d9ad344f04b5 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/9e0d0e8abce2183e6e212f3f602e8a2ce7e3925f |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/1f4896f86bb7fa56401373281b64589f5a996c78 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/60f2c095e6f5363a884d64513fe881146a16ed54 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/238ca24b226e9e6eb494bf81d215bff05865ec83 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/7dbc926c41a35a4501b88044ce45cc11935bbb5c |     
   armeb     | uqmi-0a19b5b77140465c29e2af... | NOK | https://autobuild.buildroot.org/results/6e2ffa19f91f6bebd6c732ae006a9c7e2d94b3cd | ORPH
   armeb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/80af5006edc3cd97b9b0a8069455850695f869fd | ORPH
 aarch64_be  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/f95eb6bed2808f22914abfae98d53bd994530247 | ORPH
  aarch64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/13fe2fa442883f8a6c62f474f55dd5a87837ea68 | ORPH
 microblaze  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/0ce26d5348765b36dd11774dec2d53a69d963d36 | ORPH
  riscv64    |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/18aa3b0842c0dd989584d38cd3fccc04a2004bc2 |     
 powerpc64   |          vsftpd-3.0.5          | NOK | https://autobuild.buildroot.org/results/176f017c51610cfb03ddd3614e967c1540b46b2f | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                   cvs-1.12.13 | 2 
                 protobuf-29.3 | 2 
           dmraid-1.0.0.rc16-3 | 1 
          esp-hosted-1.0.4.0.0 | 1 
                     exim-4.99 | 1 
freerdp-2.11.7-18-g0ee17e2f... | 1 
glibc-2.42-3-gbc13db7393773... | 1 
                  iozone-3.508 | 1 
              keepalived-2.2.8 | 1 
                  libbpf-1.6.2 | 1 
                  libnss-3.117 | 1 
                   lsof-4.99.4 | 1 
        ltp-testsuite-20250530 | 1 
                openssh-10.2p1 | 1 
                   perl-5.40.3 | 1 
                pipewire-1.2.8 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ec06e9e652a198b976840e2fd0ae12fc1320918a | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/693da4a17ca8de1876c6f36e6604fe53aa1a0110 | ORPH
  sparc64    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/e943f66952e41ff0a769dcfa67c6cfaf7eb47016 |     
  riscv64    |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/27d372dccd4bf7d689b9b243e9a75697157377b7 |     
  mips64el   |           exim-4.99            | NOK | https://autobuild.buildroot.org/results/cc0d9e33f0908ced003b406ead31134f6d1d6556 |     
 microblaze  | freerdp-2.11.7-18-g0ee17e2f... | NOK | https://autobuild.buildroot.org/results/a9fab9b473117ba56c00b51863d0d5ad744aa715 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/b8fc8e439f8047f7ecfd6da13ed9be32cfd00f71 |     
   armeb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/e143fe4d05a598a7880eb6db7ecf4d4b6ab0b3ef |     
   arceb     |        keepalived-2.2.8        | NOK | https://autobuild.buildroot.org/results/01223a046e204645889a8aeaa9e2d75b9788fe91 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/cf45fd088652070d84ced5b6d65a95944d2c7e5e |     
  powerpc    |          libnss-3.117          | NOK | https://autobuild.buildroot.org/results/cdd06db3b50aebabbb2a9c192d28075c1af1c785 |     
  powerpc    |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/7e50b5cbae641e2e990ca8cc5711d1d4fc887550 | ORPH
 aarch64_be  |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/ff6006b9921703856f65f3d4a4ccebdc97913192 |     
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/b8bbb8c950131e3f426e5cc187152edc936a3c06 | ORPH
microblazeel |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/6e8ac45e72db65afdb34ccd1eb12ec6955efc8c9 |     
    mips     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/09d83744c066864c0336542466989e047d7e77c2 |     
   s390x     |         protobuf-29.3          | NOK | https://autobuild.buildroot.org/results/e0c06ea545d710a91e12abee260abdf6973b89e2 |     
   sparc     |         protobuf-29.3          | NOK | https://autobuild.buildroot.org/results/7295698e68e3a5dc036c10c6c507a15a4c869331 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/d5022257f96b6dffbbe42bab9b7d0b868686ac4c |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libxslt-1.1.45 | 11
                libxslt-1.1.45 | 11
                       unknown | 6 
                  iozone-3.508 | 2 
                    mpir-3.0.0 | 2 
            18xx-ti-utils-R8.8 | 1 
               asterisk-22.5.2 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
            gdk-pixbuf-2.42.12 | 1 
google-breakpad-f49c2f1a202... | 1 
         host-gcc-final-12.4.0 | 1 
host-go-bootstrap-stage3-1.... | 1 
host-netsurf-buildsystem-75... | 1 
              json-glib-1.10.6 | 1 
      libabseil-cpp-20250127.0 | 1 
                  libbpf-1.5.0 | 1 
                   libcap-2.73 | 1 
                libdnet-1.18.0 | 1 
                 libgee-0.20.6 | 1 
                  libnss-3.108 | 1 
     linux-5.10.162-cip24-rt10 | 1 
           oath-toolkit-2.6.12 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
        util-linux-libs-2.40.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/db1291412eb1097fc87351a0a14379a2c0783384 |     
    or1k     |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/232541326a03367b37909af2444ddd01ad9e92eb |     
microblazeel | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/dfd16a30f8ed80492d4e77f1b4faf471d312f529 | ORPH
    m68k     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/a625912f4cbe79cb4bd348d8ad25c65c546af924 | ORPH
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/9de61e4a8615f38d1f3ef6d4a7c382126cd1ab5a | ORPH
   mipsel    | google-breakpad-f49c2f1a202... | NOK | https://autobuild.buildroot.org/results/2bfdc8fe42edb7ec14d235202618eb86621c920a |     
   arceb     |     host-gcc-final-12.4.0      | NOK | https://autobuild.buildroot.org/results/c0d91e81e789aa1a6971acaaeefa31cb8991610c |     
    i586     | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/f2f033f3b00462be8121040ef085582d2ecda320 |     
   x86_64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/8103a1689df1788bdf3ee7d62544faf5ae5a25d1 |     
 aarch64_be  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/722e8426fcc44f7348220a229abb1b129b87e4ce |     
powerpc64le  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/9ef02afd91cb689208cf12ac349a45b5e3b90674 |     
  mips64el   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/635154c357e4927f112eda41cd4ab42338afd2c0 |     
   mips64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/5fc49cbc57adbe43d611b6734bdbd957d8569ac7 |     
  powerpc    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/90cea35cd481fcb096b71b19a1181482e186ccc0 |     
   x86_64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/2bb0621a67e2a52cd4d6a22232a3d800f7ca832c |     
 aarch64_be  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/268256aa2f91400857a1106db5e7dd2e12435d14 |     
    m68k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/c8c01775c99d855327161928eeed0fda8dbf111f |     
  riscv64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/4d0c737ad8ecbbe591620b125f1b01ac096a957e |     
  mips64el   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/8f9f620b70d680ffef7da1c9669eeae68283099d |     
   mips64    | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/bdd222ad96114c60226a01b5f3001b20e2a99d50 |     
   arceb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/029861e499d966139e48987731c5fb0e2dfeb442 |     
    sh4      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/318a5142ce4f2e8318008969325a2352c29090a9 |     
    or1k     |        json-glib-1.10.6        | NOK | https://autobuild.buildroot.org/results/67d8ee4d19f849c773e97d22e3176b230fe2e07d | ORPH
  mips64el   |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/8a1a9cf017f7c3f12ef368193a038fc64db324fb |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/655a7dcece9e9a8893ef58aea0e1094410db970e |     
    arc      |          libcap-2.73           | NOK | https://autobuild.buildroot.org/results/1fba7463e301b7b8154e3de09ec4cce5995686fb |     
   mips64    |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/dae4492e98ef0cea3f5c320ba1ab0030a569793e | ORPH
 aarch64_be  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/6ee6660c9fbe9db6bfd56d158bf4f36548f47aec |     
  powerpc    |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/75b8f8437b6c43a721bfc90bfbe6c51c2b1ae94a |     
    sh4      |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/c917111dadea00c74061839dab628ce6edf0deaf |     
  mips64el   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/f4d1b2fcba47c1e424ad37b51366e2d65f10f81e |     
 microblaze  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/87009f336e019daf032e9e5c564d33b32f89ae1b |     
    m68k     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/7087b35cc029ea23c2289891e9e6c2e83ba507c7 |     
  mips64el   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/a545321a0c50252c97f31f7a4b3632dee0043b2f |     
   s390x     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/d9216d76ee81570c328e18c68bbdba9ef04b1f7a |     
   mips64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/17da08c732a8f7fb4515647c85602ece9c4bd96b |     
   sparc     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/4f70423e4fa09723e6d708701d6d553e55c4ec4d |     
   armeb     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/0e25fced614f130e5c497f5140316835d239bbaa |     
   armeb     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/a4bb8b8baff821bc84ec1c6071dbacb2029467fa |     
   mips64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/23cc88966a5c71449789fd35a25b87b6969720b2 |     
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/77375aef86b492dd1780436749248eefa32297d4 | ORPH
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/5f0b5b4693a147ccd318ffbaca504762508b74f6 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/3f6239f5e9469f35ae7af535842a02f3ebb088e9 |     
    mips     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/c17a877b468b4aca311ed9fbc38931546f0abb76 |     
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/979e5231219b6077b86b6e2f31fe52df4edb0527 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/2feb5e6f5134bcb814547610cc32eacede3ea687 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/19b2e49a8eb6d7b9a896f3ddab815b2cb701678e |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/14c16e9d7af70a2ddaeb2aee7ff5da0a5ea919ad |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/8ea8a6ff5804d010f1989bed22971832f99c2714 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/244bca099bc34dbcb10050cd9c914b7219d562a0 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/1dc784d4cd84809f7a1904984af01f6ead114fc1 |     
   x86_64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/de4c91685413920617790af3a5ae96f6bd16f7f7 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
