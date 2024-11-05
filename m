Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1281D1CA15
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 04:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA417403FE;
	Tue,  5 Nov 2024 04:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xo_gZpu3mIEi; Tue,  5 Nov 2024 04:13:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB68840402
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB68840402;
	Tue,  5 Nov 2024 04:13:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84DFA723
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 04:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6873A40400
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 04:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLPI5Q0dtRDQ for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 04:13:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 03253403FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03253403FE
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03253403FE
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 04:13:52 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c9404c0d50so6016752a12.3
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 20:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730780031; x=1731384831;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XJ/hqnR8J5W/F/XjQIiKBgOdAJzxyfOYNClaIRgTUpI=;
 b=QBiP+EROMlzMr4Hyc2j87ITLYAiT3RB+AzMZDcwdgslNFCnqhssnjwVGngt5tCNHgA
 XktMLzCxEqeNf+gwbrkJjvRkLKdw0fPUE4fMUJU78eNCwoPtngNDKNUCZU7gQtBDz3Cf
 DHJ+Va1D6He/LVxnMUulhF/05ZSshZ41SrfU7PZi7PbO7Tt1qWH0tBRHdyo/nquQO5hU
 4ZnpNAUYfSNuvsXCXGxqtwDB26m2hFNp5ifS3ELRljCalb6J2hFk9oc47ZvRqczCham0
 iC06ZZlzCzs8Jo7v4pyLNNZ0QraK2noZ4pjWkCxHIhg4+nPlOdC2YWAeImtkzQ9uXaXG
 FQAw==
X-Gm-Message-State: AOJu0YzUinqq/Z+Xw7gXAYcQ8b2i/lEamPHZW4DLbX9xVxtpZH75qOik
 uNZnKuyGQ+Y3FODzv4QFdcWZpVddT8rnNPTOe6tukNjbPU/v7GfRg4QdNA==
X-Google-Smtp-Source: AGHT+IG6RL7MNAodDoMQfzNX7PC8+AEgnl/sp2W6PQP/vlp5brNZ73/deyguvwBldaxbvBfxchtdbQ==
X-Received: by 2002:a05:6402:2343:b0:5ca:152c:5b5b with SMTP id
 4fb4d7f45d1cf-5cbbf8e8291mr26257212a12.21.1730780030698; 
 Mon, 04 Nov 2024 20:13:50 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6ac2995sm685925a12.50.2024.11.04.20.13.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 20:13:50 -0800 (PST)
Message-ID: <67299b7e.a70a0220.382807.20bf@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 05 Nov 2024 04:13:50 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730780031; x=1731384831; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=XJ/hqnR8J5W/F/XjQIiKBgOdAJzxyfOYNClaIRgTUpI=;
 b=GFWWC12HlhDEsq/wMKyX5PkFssuw9FhWvrb8YBFkAVcV1kYRtfNg0K7M8smE9hWCpw
 JQffh0ifCN+U5e2fr6RYtXc1RmiEIMzck1bEbXR4522m1yRiG//Goc4y87huHp0Cpybh
 Suhg1Zynohha98/mEU18rbj6NPHSPzTQUNE7i5cbd6rI/ntZgkvzhcQMIcGrc55z1NOi
 Rwlj3JtU3EtbrIDHRpZrneF3TSYSiwHhcX5tuFbAtdFRD3QhQnmSt08bB18eiQRiJOHk
 wKHzipgB0hQLzNxuM3ieViwBpklkMhmKzJli+Y6P7RQJTm8Xfup4O2gQiQNVsgVXfCtJ
 XSmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GFWWC12H
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-04
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

Autobuild statistics for 2024-11-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  3  |  0  |  5  |
  2024.08.x  |  2  |  8  |  0  | 10  |
    master   | 15  | 77  |  0  | 92  |

Classification of failures by reason for master
-----------------------------------------------

             dahdi-linux-3.3.0 | 4 
  gobject-introspection-1.76.1 | 4 
              host-rust-1.82.0 | 4 
           libzenoh-pico-1.0.0 | 4 
            host-binutils-2.42 | 3 
                  jack2-1.9.22 | 3 
                       unknown | 3 
             util-linux-2.40.2 | 3 
                  curlpp-0.8.1 | 2 
                  ffmpeg-6.1.2 | 2 
              fluent-bit-3.1.3 | 2 
 ibm-sw-tpm2-rev183-2024-03-27 | 2 
                 libpng-1.6.44 | 2 
               procps-ng-4.0.4 | 2 
                acpitool-0.5.1 | 1 
android-tools-4.2.2+git2013... | 1 
           at-spi2-core-2.50.0 | 1 
                    azmq-1.0.3 | 1 
  binutils-arc-2023.09-release | 1 
                    brltty-6.6 | 1 
                cryptopp-8.9.0 | 1 
                   foot-1.16.2 | 1 
                  giblib-1.2.4 | 1 
glibc-2.40-18-g564178076272... | 1 
             gstreamer1-1.22.9 | 1 
          host-binutils-2.43.1 | 1 
host-binutils-bare-metal-2.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-python-greenlet-3.1.1 | 1 
                latencytop-0.5 | 1 
                lesstif-0.95.2 | 1 
             libopenh264-2.4.1 | 1 
              libopenssl-3.4.0 | 1 
                 libspdm-3.5.0 | 1 
              libunistring-1.3 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.11.5 | 1 
            linux-fusion-9.0.3 | 1 
               linux-pam-1.6.1 | 1 
              luabitop-1.0.2-1 | 1 
                  nginx-1.26.2 | 1 
                 openal-1.22.0 | 1 
                 openssh-9.9p1 | 1 
                   perl-5.40.0 | 1 
                pipewire-1.2.2 | 1 
                 pixman-0.42.2 | 1 
      python-autocommand-2.2.2 | 1 
        s6-linux-utils-2.6.2.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/35476343771609ff329570f67729a7b85246013a | ORPH
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/eeda940ac5e562e78a1364c03b69f4c8a274fc4c |     
   mips64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/8fe2c245ab04b8455068863f080d0683650ef450 |     
  riscv32    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/7abfdcb2268fe84be1e13465974969c2ff6643f7 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/4a9134f088994ad39ea22a81287b244315620a85 |     
  powerpc    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/07ab2843468b260c0968d0cd6a7404fc941d8cd7 |     
 microblaze  |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/372edc6ede2f481ee77d764bb682763363ee933e |     
   mipsel    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/41a15781fe8582eb97e5cfaabc55b1485f602616 |     
 aarch64_be  |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/18620324459c35f657914dd0ccbc34dc241af653 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/60649aa1b840413419b575aa8f0080f1ba6d7cff |     
   nios2     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/80a0b28c348f47e07ea1b4a78923184b0cc3c4ea |     
  riscv32    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3bac362de08231a4716dca999c345cc890081a9c |     
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bb50e7e08a65f7f4a648b34ec440e900d34170aa |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/7bac7bceb32d8ba1a464e694376b86a5c210b256 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/fcc888c0142dbbcceb17ecb0e4189f4564c81aaf |     
 powerpc64   |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/de9d4840124afd50a7d209d614e8cf50504edfdc |     
microblazeel |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/fb6dfe80b0d473f4bccf1177125d60b0cc8cfc28 |     
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/5577f4976799df8c3a8316d59eddff49a477fb04 |     
   mips64    |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/d3e622c20dfed7bc8d08a5b8514599f14d0c68ad |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/a71141daf30441ccd0cd75f9346095bbc500ae5a |     
    sh4      |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/9b0ce69d9bb188055ae2df1437998e945dd789d7 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/b6aed9ff0b76d4c4a0b211c9ae0b47474f4f88a1 | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/9aad7b966f3ecb7cb7e54e78997522d6243cde11 | ORPH
    sh4      |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/3abdf9bd3885812a42087cdcf2b1dba41665de30 | ORPH
    i686     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/bc663f09ed9d43ba0e2cec62c6a8f158cdb071ea | ORPH
microblazeel |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5d32fcef6c327d22ad39b8f8bb2e796193481650 |     
   sh4aeb    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c5877f9be93878f45ebc2a72dbdc0a70b0269aa8 |     
 microblaze  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/3948833bb4b10215e88b2993ba015bad0d649e1a |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/27571b68333dc4b1da07fd614e97322c14070278 |     
   xtensa    | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/b97730ee2ac3545052bd90f42ea2807f6e948aa3 |     
   xtensa    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/98595823a5074ec45cad91a94c2cb949848a0c7b | ORPH
 microblaze  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/5602f1e41b205569a3c24379ffddcab9fad6d57a |     
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/cef4ec74e7975494aa726231726436461c6324ec |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/c37f3887238dd160f8c4fc7a5545964f8c590c0b |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/bc254a92482551cb76c32ee67432a9ebe7f6fc7b |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/6f722e4668cc74817d57aa3677daec2af1e09b45 |     
   mips64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/1e5234360745ad3f141cbfdb79db850990c66163 |     
   mips64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/1609cb964cdba0e078cc3db3f5a207d4d5817b81 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/539350db0991d929bd810425c67d310277851c8c |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/298272e21703eee3717f1fd884672aaf1cf973c9 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/ef202f68f9e1cad4356d8970f63445fbc42c4664 |     
   nios2     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/399989cd8597586d1a8340b483a51b9c298665cd | ORPH
powerpc64le  |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/16bd76e182119e1a592ba3ad86e6f95803b67f30 | ORPH
    i686     |       libopenh264-2.4.1        | NOK | https://autobuild.buildroot.org/results/46a357186fcee2dc6b14607bdbf4b493cdf6bcf3 |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/9a70cf9d8b8fd234f77644b398b18de87bdc4c90 | ORPH
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/6c9c5aaa9b8655dc1afe2f352107c35cdf84e7e4 |     
    arm      |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/2b5428bef5ae206d46cbff53a3eb139dfd6fa32b |     
 aarch64_be  |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/60d548fa6e3df143f492b990876f976d7f15c7af |     
    arm      |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/2c88eb342287bd6dbbfed39e00909d771f7130b3 |     
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/54b7a342f13846150bc19e89d45049eea66e501a |     
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/5d61b796716700d89fa1b110d2e79e62e5288626 |     
    arm      |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/0ac36c4dd0c9ceae5d776e3a60fb99de852f5262 |     
    m68k     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/2a334330df15f65f762eca891f62df019744d858 |     
   nios2     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/5c63109fb7486fa02128c7b58c1945262ccb3f88 |     
   armeb     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/b9fdd355ac0177dbd7555d0c35995371bf3dcfa5 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/b3fb55ec41deb2f6b2ea1548392903b63bcc4ed9 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/efc5fbff1ca9066eca84e83606b34d8e9bda9b51 | ORPH
    mips     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/4da607e35ccab74fc5beb8fcb027aa30faae68b2 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/c584cff0d2e651d6d748e6145e59b9e0c8d4e86f | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/ba783369f1d25005e0bff0aa9bdb39d92fca5dd5 | ORPH
 aarch64_be  |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/2b70d72fd3156af5a1ca63bc99c94aaafd7071e9 |     
  riscv32    |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/03fc5459efae7e9afaec0499d942681a5f0c5ff0 | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/4117d2e48154a4f2df462dceee3f754031e5e108 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/30e556bd34ccb07c48176ed2fa509fc232a24fbe | ORPH
  powerpc    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/35721f6f30f8fc6d478e1e7b11a95d1ea5f7f3c6 |     
  mips64el   |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/deb2e57c530265fcc9fd630bae859c73da825824 |     
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/0d9918e2d7d2f78a8c350f7d259f826ab06d1bf9 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/699134e78cd53cba4c615bd97c33092d1bb45148 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3dc0b2809bffa2f84d7d4b45e0be8b31255bc305 | ORPH
   nios2     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/17b259e083f6a3579c4e6eaf5f7779f20f21091c |     
   sparc     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/680b77e144dd3f79fbab6eb9551aca1e247fb635 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/f1a1a116f0e8038f54be95d05c0f42d44ac40905 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/de2a0ceb7f2e60e5f59e2cb0d36bae5511d26409 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/947bbde95d50548494bf604e9f7280d0f3370fa9 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/91c6ae40ad75cf26fe8c0fc5a786e98529892242 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/09a8760b75f7c0d6244f5863c0bec6313b1ba181 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b45872ecbba64b86de59d2b959b363018beb310d | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
host-android-tools-4.2.2+gi... | 1 
           udpxy-1.0.23-9-prod | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/2136cf0cbf59d08bb2ed8f296a5d4bc035040288 |     
  riscv32    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/e1a17f618f9d6bf775c9a1022fa3245102a6bab3 |     
powerpc64le  |      udpxy-1.0.23-9-prod       | NOK | https://autobuild.buildroot.org/results/f1ef211ff00e0bcc91480c484d6550a82b606eed | ORPH


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                  bind-9.18.28 | 2 
                 linux-6.10.10 | 2 
          cloudflared-2024.6.1 | 1 
  gobject-introspection-1.76.1 | 1 
                 openssh-9.8p1 | 1 
           python-daemon-3.0.1 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/1f65eed59af1b0ee5d4e3e053e73bf51ff1e2e1e | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/2e39dfbaeb681f1d4db3a873d1935d5e7404e99b | ORPH
  riscv64    |      cloudflared-2024.6.1      | NOK | https://autobuild.buildroot.org/results/598c11c12b3478a96f9ac78a39a43992d51d51e0 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/68d0e3196c3b11cb2dff03b7993ec2d3d2d0401c | ORPH
   mipsel    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/dd9989ea386497ee288c7ee81e10598e5268e9cc | ORPH
   sparc     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/4e0c25601bbcb786caf0c43c878e532409dc130a | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/2867a74c287c1c5dba71a004e65e2b9ec0a7f851 | ORPH
    m68k     |      python-daemon-3.0.1       | NOK | https://autobuild.buildroot.org/results/eb6b569163e7bb8cb5884ee61e79b3fdf03a3177 |     


Gitlab CI results for 2024-11-04
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995387  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258992621  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995647  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995668  | ORPH 
                 TestFwts | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995455  | ORPH 
       TestGrubAArch64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258990697  | ORPH 
         TestGrubX8664EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995977  | ORPH 
          TestGrubi386EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995962  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995416  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995427  | ORPH 
                 TestNcdu | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995466  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995478  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995496  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995521  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995597  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995407  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995613  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
