Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763EED637DF
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 04:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1FB384448;
	Thu, 14 Nov 2024 04:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifRa0wcDqQy1; Thu, 14 Nov 2024 04:14:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FD9E84453
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FD9E84453;
	Thu, 14 Nov 2024 04:14:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E357972
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 04:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B0FD41C73
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 04:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3rpzt_TZ8_5G for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 04:14:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5456241C6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5456241C6F
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5456241C6F
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 04:14:06 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa2099efdc3so65040766b.1
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 20:14:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731557644; x=1732162444;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PUUJQCjyiIHA3oAF/AfgNHsVzavpyVCI7kCuIryt4hM=;
 b=rmWtAt4jiAbasSOdYfklrvahxj33jI3RFnvncyLXNTWqQW+DBKj20jzwKJmcTJWdVg
 8yBT/DiKGt5QDmh7bQfedSMQwFMA3dZQJk31zDAlcvgKAMJ1C946JCLXHK/PtnmvSgw5
 lv1EtNORiEl8qAFbKXVUdS/t4U2zLOisAmzOWfEVoN7VNSznraDv5r6SJUMPmYCP+Bx1
 fLKyqzsxE1Z3aq96XFwneUIQYxxLgthIVqqh3KMBCtT77sRezZH1gUjzwzcy2/fAKdFt
 4b2/bc/LGM2xLEtwpw34nb540PDQdLMAquxwUG6+TIt5x2Wa65MK5Fq8ng5JqWT1KwpT
 a0xw==
X-Gm-Message-State: AOJu0Yxfi6yBsVhBSUlOCKxqFoAoBmIuk4f7UsYRYpAkx7/+oGS8OYdu
 OQcpILId88lZ4lxkxh7Ms2ZtVEyf5bqgqNMdmVmGcPM3nYnlY+ZI1YU+vw==
X-Google-Smtp-Source: AGHT+IH7TBiaZvmeo9dT6VSKEg7C5jJCvv5XcWOSh9Rkd6+fKHbbQtiOypYgwmEvzevOfng4I/brgA==
X-Received: by 2002:a17:907:1c9d:b0:a9e:e1a5:755f with SMTP id
 a640c23a62f3a-aa20763b70amr145516866b.1.1731557643624; 
 Wed, 13 Nov 2024 20:14:03 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79b89b85sm129945a12.6.2024.11.13.20.14.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 20:14:03 -0800 (PST)
Message-ID: <6735790b.500a0220.1c54bb.076b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 14 Nov 2024 04:14:03 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731557644; x=1732162444; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=PUUJQCjyiIHA3oAF/AfgNHsVzavpyVCI7kCuIryt4hM=;
 b=WDis9MgizJovF3bU6kEJZe2QUShoxzON8MQ8wGc+PGFLhN2JpIBt2if1iDIp3QTnFw
 2C/sdKMRrIMTJpHnGPvqKZWQL7ZbwYsw0Nxf54jBq2y1FnK2JUv6s7DmjR4WPyoKLA95
 eWyzPiRUKjVMqey+4ATubcAOxzB5PJS4tmOE+iI8BIff7T4hK0NRFm7Ywg9KTuuVFOPW
 ILe+KVBxWImOlxRy6QPUpbZkfnEleUiVkaCGbWO1UQLshLySn9VFqGLsXlQSXQwEiFal
 s+Zs9ElQv9LQ4QGkROuZOrkQ4z0LmgXGybtN78qfnzcJrL5DXZBli2DyQQjhCrjDJyee
 DbVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WDis9Mgi
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-13
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

Autobuild statistics for 2024-11-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  6  |  1  |  9  |
  2024.08.x  |  3  |  5  |  0  |  8  |
    master   | 10  | 73  |  1  | 84  |

Classification of failures by reason for master
-----------------------------------------------

 ibm-sw-tpm2-rev183-2024-03-27 | 7 
                lmbench-3.0-a9 | 7 
  gobject-introspection-1.76.1 | 4 
              host-rust-1.82.0 | 4 
           at-spi2-core-2.50.0 | 2 
host-heimdal-f4faaeaba371ff... | 2 
    host-python-greenlet-3.1.1 | 2 
httping-0e26c53d5fe504eb720... | 2 
               libdeflate-1.20 | 2 
          linux-5.10.162-cip24 | 2 
                  linux-6.11.7 | 2 
                       unknown | 2 
             util-linux-2.40.2 | 2 
                 agentpp-4.6.1 | 1 
             batman-adv-2024.2 | 1 
             dahdi-linux-3.3.0 | 1 
                  ffmpeg-6.1.2 | 1 
                   foot-1.16.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
                  giblib-1.2.4 | 1 
glibc-2.40-18-g564178076272... | 1 
         gobject-introspection | 1 
                haveged-1.9.18 | 1 
                 hddtemp-0.4.3 | 1 
           host-doxygen-1.8.18 | 1 
             libargtable2-2.13 | 1 
                libesmtp-1.1.0 | 1 
              libopenssl-3.4.0 | 1 
                 libv4l-1.28.1 | 1 
           libzenoh-pico-1.0.1 | 1 
           libzenoh-pico-1.0.2 | 1 
                   linux-tools | 1 
               mariadb-10.11.6 | 1 
           mediastreamer-4.4.8 | 1 
              mosquitto-2.0.20 | 1 
                    mpir-3.0.0 | 1 
                  ntp-4.2.8p18 | 1 
                 openal-1.22.0 | 1 
               openblas-0.3.28 | 1 
               pcsc-lite-2.1.0 | 1 
                   perl-5.40.0 | 1 
          perl-net-ssleay-1.94 | 1 
               procps-ng-4.0.4 | 1 
               pulseaudio-17.0 | 1 
      python-autocommand-2.2.2 | 1 
                 systemd-256.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/2bf36ea8d7dacea9df3141f35dcc9dcac2c3e04a |     
   mips64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/010e78d74f83c449eb42486e3ecf1cf6a654242c |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/41d4ecf383966791806ea280d2676371cbe82c17 |     
    mips     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/6a8fe1477c2882f62ade4013917c91eb42785612 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8d9fad217a72b5a0214c61e559e27309d6afdcc6 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d28e6e16199a1d8d411a397a512959a1006aeda4 |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/c5ab664773cca0fa286967ed9672b93d03fef104 |     
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/73d597d3109a4239433f42f8ed800cb8d7ed7f6c | ORPH
   x86_64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/09cfd7402bc89379c1ff6b9294b0c2d9102e9dfa | ORPH
    or1k     |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/a6288481a591a5aa4b4c06488bee40626f06acc0 |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/563027647814c2ccada48677e9803cc9aae8e7af |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/3cdc56a556df94f4b10630bb3615654fa0acd463 |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/5a4c96ec2f9e2aa0fc1ce5df77e2d5b13f8aa092 | ORPH
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/573c0e52a34cc64fc7b65a6e5e8e94140ffb2b17 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a7852771bbc034a80c31d0f1bb076cbf6fe19f6e | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/3953953cac4cda1f2dc6359d791aacb5cfe11d99 | ORPH
   sparc     |         haveged-1.9.18         | NOK | https://autobuild.buildroot.org/results/c481125b939d6a50088136bc05bdc9ea5e407504 |     
  sparc64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/6faf18e77a4c73a461e79a5b9a8d1dc3b4cb9193 |     
   nios2     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/426d62f3316f5b8519fc1e2ef188c1e24595d1bf | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/fe8f0c9375a6e6912a83db81caaceccb2ae3b2d4 | ORPH
   armeb     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/73ff0a5f3483d617157311c3f9f3b3f80f609f4d | ORPH
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/2aa100ddcbcb329707a9c3e6a6b1a8f4d20d75ac |     
    mips     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/b971882493c2fec6fa14fa6176c8bfff23d3cbca |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/dffdf9d1dea0a99ac7f1d9e5c5a75d6565a79a7f |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/fd8bcdbfd86388339635a63e9220aa31b70b9282 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/bd72684da93910f0bd6523d231c87d1492c9dce1 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/34357b732121abf2ab6022ca5c26d9d0decd2a88 |     
powerpc64le  | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/58c9de663d2503caf1df45edec133a47150a533d |     
   mips64    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/f31a11e52c8d4fe721aa9b2304a4c4e6a5bfe591 |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/c346cc77e6e498d5c05bb0ddbf5fa05bd2b7ad87 |     
powerpc64le  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/138795f7c51d97f2c592fdae7f456f5352521e67 |     
  mips64el   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/e29914ccfe427152ce76e7afb4467a03204683c0 |     
    sh4a     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/c45b44bfd8dcdfa25ee7ee0bd47b7f4f2e5d6e76 |     
    i686     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/cd4a158da78a7010296924f786bea40492d9aa56 |     
    or1k     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/2c7fa247699f4036c8f7aa5918bdfc28c10976a8 |     
  sparc64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/36dd31966865188216f2f254aef21408853d3039 |     
 powerpc64   |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/441faef082bacc7f7ff855fdddd680c4171b3549 | ORPH
  aarch64    |        libdeflate-1.20         | NOK | https://autobuild.buildroot.org/results/29120fdd8cf4cbe2b0aa85e2c6d91750ac69ef9b |     
  aarch64    |        libdeflate-1.20         | NOK | https://autobuild.buildroot.org/results/d9cadc73f3428d9e0384fffd8c1c48b312abc2d0 |     
    or1k     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/32ba2cc4a35b691ec110713653b2288b40743dbb | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/7c8269c4fb7f19871f0f81ff227aba2cc816b29c | ORPH
   armeb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/ead8e81250a88e0f7acaadbb48af2d46b5e0588e |     
    i686     |      libzenoh-pico-1.0.1       | NOK | https://autobuild.buildroot.org/results/8a234c4249a03db390cb026e7136ff66b0437a82 |     
powerpc64le  |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/f501982940e74a8cdc19535fae30e1cfbbc511ea |     
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/721a373e94b223dd3fb0cb5c9814926dbd68c81c | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e395308b5393887c41e25fbf8b45c4e3f20df6ed | ORPH
   nios2     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/d9127e44dc97b528dde27f1eaa957f57d748f168 | ORPH
    m68k     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/baeef02e2f05a126b6127362d71a808f2f472d3b | ORPH
  sparc64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/fdbed67f223ddbb1a120bebf8a7bca78dac17135 | ORPH
 powerpc64   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/60cd7b663cf8f58be562e26ed200f3d6d2ea57d7 | ORPH
 microblaze  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/a9d000b1a8803e718a778e0e9f52ff66239af52a | ORPH
  riscv32    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/f584dabab7d88e51c6eb33821ef28e7d60ba3f1e | ORPH
powerpc64le  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/7729802bcfe64b7919dbc87b7d0843f8f6f18368 | ORPH
    m68k     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/fa3cb08cd7731fb7634f6a7d969e72781b564c87 | ORPH
  mips64el   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/510b8b3d864d9ddd468594c160b0c9efccaa0b6f | ORPH
  mips64el   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/67ecc75aefaccf4a47eb5909c90d20177c23d157 | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/9c8c2a22a7259777e6c025a7f0898629dc420707 | ORPH
    arm      |      mediastreamer-4.4.8       | NOK | https://autobuild.buildroot.org/results/6adc516899b3e997c9df6a2da56db8c30912b84c | ORPH
  riscv64    |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/55ed9d0d42eb65b08ae62480b03c35d1e284ed4a |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f3e1d60f0305a1c1b0d232105247e7d3c7c2f0d0 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/28a8d354c8a78846f7818c1e58ded6c6f0e2f7a9 |     
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/3fcfc366c4cfc2d699fa7f0cc00b43160a0fe1a8 | ORPH
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/df2629674f42d74a2b4a3fee18c2f1aa02ce2c7b |     
 microblaze  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/1a9f5148c6a5031fdc29601d89a1bfad3e7e010d | ORPH
powerpc64le  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/c3410a8f62c3197c0b0f1204bf013613096024c3 |     
  aarch64    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/cdf4e9e9577cad6ce997daf7ada6d6436dd527c8 |     
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1968869da2cf2dcf562ca7d7abab278b30ed6eb6 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/164572b64f01e74d2a415c0da781897f0fbb7102 | ORPH
    sh4a     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/03e78d3b34989017bb8ee5f9baf8bf4fdb12b34f |     
   x86_64    |         systemd-256.7          | NOK | https://autobuild.buildroot.org/results/93bf4d992ae332967d3261ac4f13b27ebbfc2e82 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/576b2286f9be03d61ff4e7fa062c70aee9e5fb65 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/bcc65910e640f317b87c3e450c0d9cd84870035d |     
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b0231947bbf00f688c4c36b000ac5522a36fe0b2 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/07637b2e1f2d9c28bcd76032834443a038ec4562 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
host-prelink-cross-a853a5d7... | 1 
                 libpng-1.6.44 | 1 
                    ncmpc-0.49 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/cc68c95209d3163fd23300b9419e17a379027e08 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/1da4a79e745c02d63ea915f13a268dfba6962877 |     
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4e2dd2a9401fe886b4831c8ffbf197a0ef93b1ce | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/c401a50c53f3786277fe81ba8753106873dadee1 | ORPH
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/72af84420ebdae8cb10c6988312e50268583a427 |     
   mipsel    |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/a598d88d4bfbf699f9497ec3d45da563fe8adc8b |     
   nios2     |            unknown             | NOK | https://autobuild.buildroot.org/results/0971ee725dd649d570fbc80c22f3f08ab30185f7 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

              fluent-bit-3.1.3 | 1 
             libargtable2-2.13 | 1 
                   lsuio-0.2.0 | 1 
                    mpv-0.35.1 | 1 
               popperjs-1.16.0 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/ea91bfe181a9998bcab8793dc203cd93f19209dc |     
 powerpc64   |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/22ac95c52dd6b51030aebdd11c3b73fe28cce3a2 | ORPH
 powerpc64   |          lsuio-0.2.0           | NOK | https://autobuild.buildroot.org/results/5f1b1a2eed050bd7eccaf35eccdb654151095ecf | ORPH
    sh4      |           mpv-0.35.1           | NOK | https://autobuild.buildroot.org/results/59f32b1e1a2fd8332e37828fb297dad8b4d0150d |     
  powerpc    |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/ffc62252cb3eedb8db1746b42c036ea79317b29a |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
