Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE67C43458
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 03:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1C00821E9;
	Thu,  2 Jul 2026 03:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTIfHgiZhZtI; Thu,  2 Jul 2026 03:23:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC49A822ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782962592;
	bh=WzxduNwBAlKSTW8w4f0imfSlRmp0VjS7pkq6/4T/wgg=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=srEUCk1Uyb41Pqjia6HgkJq25o9jwr2pW1uAQHovBG01jCVhhQ0o4wLKcdlUNeNZA
	 ia2gL29tfwDruA+TmVvb7CehiEUysDhKEfEvMBexnYbm3yd604eHLRP1Rea0K3DdrI
	 9MvOx1wd1d8+uPJaVlRkqiNHsQ2QzMYelz/uakLqHt06QSk7eyOKEy8BH7s9c5NaBh
	 ChcxoQ8TEe8796jgecjOhOEAVa2ypLJtLpolvzg349HEFNN/fIhKgneDd5p8BQXJ/0
	 xluIpHaRNEeaOAJ8bxCB19scxJJ+NAPRfbVWiHU5Uh0WinLMtrghM3uIf3eftv2/8H
	 c7nc3DUmWg+eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC49A822ED;
	Thu,  2 Jul 2026 03:23:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6D20316
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 03:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC8AE822ED
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 03:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhntIJwKn42x for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 03:23:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 482118217F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 482118217F
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 482118217F
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 03:23:10 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-493c54e205aso2126555e9.0
 for <buildroot@buildroot.org>; Wed, 01 Jul 2026 20:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782962588; x=1783567388;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YN1tE8p5qPu8z7+OD0EUnJUm+rlOMXdiNOK2CUxzAkw=;
 b=Cr3Sp0yNkcGkpuIrxjQ/ZVrmgJeoZN3TwUJ0G5c33sVdHIfIpS4WvBxoaUw/7lcSZZ
 2SDkdGzkrMbO66/oi5TUEBYf4K3axnLraSI9eiRSLvfaV0VpjQIuOQHEFpF6Hhx5Ai6M
 S+txN0xuqAkWuGwgoxBHVRt1kD9CZ4LWpVY81sl2W3emtANAItSlTrSkLfS9GLAH3XMH
 hxQ3gPAtFtTZWnW4uHbhHScasBlxNuaF+4Q4wCMEsRZdrfQWY6/QF5EIrpRjiMDc+w80
 9JhllV5qDDet0GHCJ45zMlquZEaL/PHfY2X+HM4gaGszUJPJnmNxBgVRcuktUzG3Wm3T
 MHyw==
X-Gm-Message-State: AOJu0YwQs9E5V1V4Ib9SPu7Rdxj4x9Cy6Whjjvpqp12dPg1nj9o4Ji38
 +K4RX4eFm88IjNq99nP3K87D2h65IK9eLhhnF+0APuOddlqJUPXxfSdA1ftmj/9+
X-Gm-Gg: AfdE7cmBVOjn6WNJaaFvgF64WEP8f4Co7Hl+cOP3LCNd7goQaG24dDSqKKS5PwE+Slo
 Ox0YNSnbzE+YYuKVHPA2oHaSXvR/OdlRM5OW7deiUvuzk3kqLckfzQbwfZiGZn5FDdgPFfuYCio
 r+bHp1nGVlKPJRcBx/aNTQMeZJiFqmV0NyAaKwzs1vzZcohubjnzCvzSbHZ6Cl/4x094NHwQBlV
 ZtuclL5noZL3ywZPYdLn+MHucoLblABid3NEDsb8idyVW/aLuqwUa/1iKe/llDJQWmxKGCa9v8S
 YZ9FXK1rmGSguMAmJ9Dwun9R6LIFsO4yCcGNijjhJXqeINNiDPEE2SY4SuMUr2pGWlYZ5K8RA2Q
 W5+3c9VPz5til58N5AkUpDBsMW38rKxGEVISQXRiR3UG83uLhemMkK5Q5eyXIH+alkbefKd4b7R
 2gEDKCIUZNpCEVN2g=
X-Received: by 2002:a05:600c:8b05:b0:492:5145:f054 with SMTP id
 5b1f17b1804b1-493c3cf8c29mr46032285e9.26.1782962587820; 
 Wed, 01 Jul 2026 20:23:07 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477dde19fd3sm4852159f8f.25.2026.07.01.20.23.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 20:23:07 -0700 (PDT)
Message-ID: <6a45d99b.8509f64d.ec809.dff5@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 02 Jul 2026 03:23:07 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782962588; x=1783567388; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YN1tE8p5qPu8z7+OD0EUnJUm+rlOMXdiNOK2CUxzAkw=;
 b=rlka931MZP8BlwmztJy7Kw59jLJLbf5jJnz/WVvMetVLd6YweE3QQQWd/Q1OzkZmN5
 JrwHw/oaOZdoYPVRYaFJOR8zPLFdbJtvXASMIm5WJjnkr+W8kHuhTUY8udHkY6S0P/ob
 UJfhyU1hKhPFCrKZVeT2gdw0Q8RJl4dLb3Vj1QDHUKjc/bwh0S5KnIvB7bVD3iXW0n0P
 5qjyVdfkbWUZLIEs80hDhkGi1S6QF7RCuY18ITk80SQKnWEbSLo7rqoXOeEdrmfzJGl+
 I/PaTP7pk+CNt3FiwvwUciUOhWQR02Y/ABiYwal81tWEUpZxVPHaC5I6D1Wk3JG7BEKp
 RNcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=rlka931M
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-01
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

Autobuild statistics for 2026-07-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  8  |  0  |  9  |
  2026.02.x  |  0  |  1  |  0  |  1  |
  2026.05.x  |  0  |  2  |  0  |  2  |
    master   | 19  | 48  |  0  | 67  |

Classification of failures by reason for master
-----------------------------------------------

              host-pahole-1.28 | 4 
        edk2-edk2-stable202602 | 3 
             dahdi-linux-3.3.0 | 2 
host-android-tools-4.2.2+gi... | 2 
         host-opkg-utils-0.7.0 | 2 
            igd2-for-linux-2.2 | 2 
                    olsr-0.9.8 | 2 
   openvmtools-11.3.5-18557794 | 2 
                   perl-5.42.2 | 2 
                       unknown | 2 
                   ccrypt-1.11 | 1 
          cloudflared-2025.8.1 | 1 
               collectd-5.12.0 | 1 
              containerd-2.0.7 | 1 
                   dante-1.4.4 | 1 
 docker-credential-gcr-v2.1.30 | 1 
              erlang-26.2.5.15 | 1 
              fluent-bit-4.2.0 | 1 
                     gzip-1.14 | 1 
host-am335x-pru-package-5f3... | 1 
            host-binutils-2.44 | 1 
               host-dracut-110 | 1 
          host-fakeroot-1.37.2 | 1 
                 host-gdb-14.2 | 1 
                  libnfs-6.0.2 | 1 
               libxmlrpc-r3335 | 1 
          linux-5.10.254-cip72 | 1 
                 mdevd-0.1.6.5 | 1 
            minizip-zlib-1.3.1 | 1 
                openssh-10.3p1 | 1 
               tipidee-0.0.5.1 | 1 
uhttpd-15346de8d3ba42200249... | 1 
               usbmount-0.0.22 | 1 
        ux500-firmware-1.1.3-6 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/0ef957ff8d9055c253772b5a08ffc58366294af0 | ORPH
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/d399d9c1f7f35a7ef57ed65f02baca6fa85d60b2 |     
    i686     |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/67b8e037b9c87a48974f4417a295aae9289d1a5c | ORPH
    i686     |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/72d91eaaf1f66880f9af9aec7456aa753adee0ae |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f3ad2545389fc0f1e27805973407dcdbe3db689c | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3855ab969c3edd024501b2cd0d1f2b14c515869c | ORPH
    i586     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/eab4f57c0d41ccb0b6e741620f7104307908f0ab | ORPH
    i686     | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/4da2ac0bc1b115a34918fd978c204d484f1b5f87 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/446c697f65be665b976b775745f0e6c59a0cc105 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/4e65fa7b96b5a010f62544652e0db3b6eb490ad5 |     
   x86_64    |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/1e437e92b40b9a2546bedf3e40e7fbad70047774 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/00196f17ecc794d5749ab0f2c56247dde8fc7ff3 |     
    i686     |        fluent-bit-4.2.0        | NOK | https://autobuild.buildroot.org/results/c95ed1b51d94fe0c27df4dcb28d6fb83366e3599 |     
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/b1d3b6720b114306a227f8cb0e543fa8a5bfdf85 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/0525f27f0eb1ad94970d15e3b0c0c9e50d023dc5 |     
    i586     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/f4a2a018a5f556dc0da25bdea9a6a5170bf707ca |     
    hppa     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/88130e589ae49cb5383c04dcfb361aedd9bbed12 |     
   x86_64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/9de0811f7185b20aab06b7a77aeed15ac8c8a21c |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/20f9b18c179da17e2048e15f2b4f8aee974e4803 |     
    i686     |      host-fakeroot-1.37.2      | NOK | https://autobuild.buildroot.org/results/d388eff08dfd5d41a798b98933d9178af4c2d5b3 | ORPH
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/083cbb6d54980934888e7ce3847e1ea8babfba0d | ORPH
    i686     |     host-opkg-utils-0.7.0      | NOK | https://autobuild.buildroot.org/results/5ab5ef3c127a2b61a128c4e03f94d0f417affe6c | ORPH
    i686     |     host-opkg-utils-0.7.0      | NOK | https://autobuild.buildroot.org/results/c3b6eb6d44bccc9d8a3f36a0d5701635e640f357 | ORPH
  riscv64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/355154ac1c99c3acbc2e614b3a5665f7cfd80a68 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/3d580d36d17c46ffd24527d4646e0d2593c951cc |     
  mips64el   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/7a34e5b676f1a70aebec2fd316ec77eecc28126d |     
powerpc64le  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/73bcdad83b407dbcfd8936628381701adcae3fd6 |     
    arm      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/403334d7b79da509a63cc38d42972b583edca295 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/91471ccccebf8c0939c0d582e9f41654dda3edbc |     
    arm      |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/af8181e7e9172b9d5bd46c9c538f3b18e9eb6c4c | ORPH
    i586     |        libxmlrpc-r3335         | NOK | https://autobuild.buildroot.org/results/5f4528c938959b57e9b6c71e0fb470a2d7afbdc8 |     
  mips64el   |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/8b5090059e7351608309574a1fa9e9b72f659122 | ORPH
    i686     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/fb1665fb0c339f392562295409da0affef3a838c |     
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/9d3f3c42f79679e1b29c92eac05a5bd6439fe6d3 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/bb66f6a35b777ffa1e1f94554b50095256f1da76 | ORPH
  mips64el   |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/1dcc60d9929339fdf8e31e0ae7b93994ee3d2207 | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/507cb5458e29499ad1ab0f07b2401dd707954c2d | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/7a4e16fb484d5287d5a907d688858cf4d656cb73 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/abb9a9b06a56675168d151e6226c92302556758a |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/9125037eb32d1195ee3834522a7a2241f462b256 |     
   x86_64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/b18351f40c17f4ecbf823e1eaaf9de0f8824e365 |     
    i686     |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/4a1a9925ff982f7af8fd0b0ce90e82a0a8abc6e8 |     
   xtensa    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/d0edc30fcf1da0e05f90b6cd64aa3087313ab140 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/a862a14330128638953d3d7797ca2fd38c37626b |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/6276b87cc7682747fc72e9fbd01c2ed6150f2dac |     
    i686     |        usbmount-0.0.22         | NOK | https://autobuild.buildroot.org/results/3329f4e289c7b82bf9604c944b6bb2aedfc6d35c | ORPH
    i686     |     ux500-firmware-1.1.3-6     | NOK | https://autobuild.buildroot.org/results/0a7ceef10eceea9fe08d174976584e0c9904ffce | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/6f741d7e6d57698336a81358d799ff0b523279f3 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

           libmicrohttpd-1.0.5 | 1 
              luabitop-1.0.2-1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/70cf08633272b34f89dbdf06eac8d39d0a1751b1 |     
    i686     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/aacd4d2853c1b5abbdd340fdd004f5cdb8b51e7d |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/cc7bd198d725bd922a0ceb512700ab7f282b7e98 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 2 
 host-softether-4.30-9700-beta | 1 
               linux-pam-1.6.1 | 1 
           python-numpy-1.25.0 | 1 
             python-webpy-0.70 | 1 
ulog-0389d243352255f6182326... | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/01adc45f7dfb5fd5775f0d0f36a09bc874dcf261 |     
    i686     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/07267a64fbec12dfae01374919a2226017afddd7 | ORPH
    i686     |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/7fbc74bcb2760ca0d0758ebddc6705a6c871325a |     
    i686     |       python-webpy-0.70        | NOK | https://autobuild.buildroot.org/results/cf9dcd120c6471a7c1ddfdd6b112f8479ca2fa02 |     
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/0b03f0ded899517f5b7ffd8ed9a8ff355989cd51 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/44cc21ebe13d56525349c60e500ab19a4bc0a675 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5308196af1ac3c18949948e2f26f8fa9f8e25523 |     
    i686     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/470ae7bf6b409265056f9dea85c0ea1012a344aa | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
