Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66657E7716D
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 04:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A16C81F93;
	Thu,  5 Dec 2024 04:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cx5sXC45l7c; Thu,  5 Dec 2024 04:18:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AEF481F99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AEF481F99;
	Thu,  5 Dec 2024 04:18:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 231B0AE8
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 04:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEFDE408CF
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 04:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0rpfhAgifDU for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 04:18:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C77DD4078F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C77DD4078F
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C77DD4078F
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 04:18:08 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5ceca0ec4e7so478552a12.0
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 20:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733372286; x=1733977086;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=00zQ2tgBkuF7leU02TY3foX3cNX8lCPbtuHxBOJlgdo=;
 b=Yhu7zs1vdAk2v4hB0oShzWELFmkZXhDQsTHYi4ACvDN//mIv9LHGkSr72LhY7Dyjc3
 Kam6zH3J6J1TPM3itL5jlopr2inYUNVDYp52q//8kPbo7mn3nTOArCt8EXrTV0VnJu8C
 IYONuPz8TBth5zQG1hC9p2VJ16zOdIKPlQXAWoUif5h0H0IgSRpVVR+jWtMu/90nYvIk
 /SYkysfr+hvmWAeGiVcP+Krz7aCvpZEu3LsAc9OQF6u6IJJ07wWxrxCqkyOK021OR4nz
 fSzqdpZ9zZvRay7MVtEvARZfaAyAB1D1Ihp8hHcahZp5iwWQCVoJ2mzqQrBVM8VxlP15
 GonQ==
X-Gm-Message-State: AOJu0Yzf37WGCjdYX7xx4/k0LLomG3ARtL+xxyq8hT4Y1dP+pDYOTvUZ
 J49FT1/IxFZVHs9MxvzwrbBfE282iMnulILJFPEu3WBo0voikeSrJVzv+Q==
X-Gm-Gg: ASbGncv6yNSh341JEY1C260cLGb59TXQlNBk3tzFu2c+IC92ZYYQthVUAeDnFLgs88+
 CnkppUuM/lfhf9GG7X2xvywqLhdtp+Ib51FXIePPj4j5Q0GBTPNPUEwkB02z68xJHzqq0/n+Ixx
 5NuiVcsAyqGdtkoFICKIAsrbXH7Lca6z+7uTihjdyQS4KJdw0AbwvlDb5fAXNGyJFBOahr/V/Nv
 WwX1WaoQGqFWBtPAfFsBYCr0wIw5eXmrsfEA+sGgDAuNZ1G/6Uj8SJUDA==
X-Google-Smtp-Source: AGHT+IFCfKLADs7Tmy6Ckr96flLpwbaHf5Tug4JBxsweg7xnAnDCPWSuR2/H1MP7ve6dNmveHXTOBA==
X-Received: by 2002:a05:6402:6d6:b0:5d1:f009:9266 with SMTP id
 4fb4d7f45d1cf-5d1f00998b9mr346324a12.2.1733372286157; 
 Wed, 04 Dec 2024 20:18:06 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d14c7aaa09sm290870a12.80.2024.12.04.20.18.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 20:18:05 -0800 (PST)
Message-ID: <6751297d.a70a0220.1e950b.0f15@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 05 Dec 2024 04:18:05 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733372286; x=1733977086; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=00zQ2tgBkuF7leU02TY3foX3cNX8lCPbtuHxBOJlgdo=;
 b=Cm9Xb2UN9bYQdE1pO21XimngsUtPdcKX7wkY+95yA2sIeXjGQy7ZP9PxnaE7KHAmk4
 6bd74BBfqbEPQlihWZgrW3TYyWm8qocA5x+onnJeAf9hZywwesZEjfMSLpW9Eej2RpW0
 PhmsscEKJwD+diDz7BxwSeBgwAqU8V/SIEN+g6uS5YxrlU8H/F4JErnTbXGLf3MnopqC
 Wooj3Tp2+OSXybKYnh6TMkoYgM9XWfy8MDtgPo9q2AUJDgXtcHT2qop1QAXmn4C/p6kH
 Ds9bs59mbFzWiIV2tPGU4vdk4g7X7roMJvUatuNVlj39XNHk5WlJzgi9MOr1iWGoOGy4
 xAEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Cm9Xb2UN
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-04
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

Autobuild statistics for 2024-12-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  1  |  0  |  3  |
  2024.08.x  |  2  |  4  |  0  |  6  |
    master   |  7  | 66  |  1  | 74  |
     next    |  2  |  1  |  0  |  3  |

Classification of failures by reason for master
-----------------------------------------------

                 linux-6.11.10 | 5 
             dahdi-linux-3.3.0 | 3 
                  ffmpeg-6.1.2 | 3 
               linux-pam-1.6.1 | 3 
                lmbench-3.0-a9 | 3 
               procps-ng-4.0.4 | 3 
                       unknown | 3 
android-tools-4.2.2+git2013... | 2 
                elfutils-0.189 | 2 
  gobject-introspection-1.76.1 | 2 
 ibm-sw-tpm2-rev183-2024-03-27 | 2 
     linux-5.10.162-cip24-rt10 | 2 
           oath-toolkit-2.6.12 | 2 
                 openssh-9.9p1 | 2 
             util-linux-2.40.2 | 2 
           at-spi2-core-2.50.0 | 1 
             batman-adv-2024.2 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.15.1 | 1 
                  brotli-1.1.0 | 1 
             containerd-1.7.23 | 1 
                 coreutils-9.5 | 1 
            gdk-pixbuf-2.42.12 | 1 
         gobject-introspection | 1 
               graphene-1.10.8 | 1 
             gstreamer1-1.22.9 | 1 
    host-python-greenlet-3.1.1 | 1 
              host-rust-1.82.0 | 1 
httping-0e26c53d5fe504eb720... | 1 
                jemalloc-5.3.0 | 1 
               libdeflate-1.20 | 1 
              libunistring-1.3 | 1 
           libzenoh-pico-1.0.2 | 1 
               linknx-0.0.1.38 | 1 
                      opus-1.4 | 1 
                   perl-5.40.0 | 1 
                 pixman-0.42.2 | 1 
               pulseaudio-17.0 | 1 
      python-autocommand-2.2.2 | 1 
         python-remi-2022.7.27 | 1 
                     rauc-1.12 | 1 
               valgrind-3.23.0 | 1 
                 weston-14.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/afa03e1e85de861e600d630c62cee7eeb91a6252 |     
   s390x     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/17ec39e64eb1676b61f5551036ca5471b7d3710a |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/1beb6f3bd64ce5af832292c4f8ecfdb235c2e848 |     
  mips64el   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/adf72d5e6db19fe2496ffa8d01fa0f8fd6661a6c |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/a516458884598b97dd18bd86172d6b09c38e3154 |     
 microblaze  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/e5df01bc2e6fb168f74afe7777b2b29c76a0b6aa |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/22b1b2e94e17fc6676c5016eedcc2ed28a0f591c |     
powerpc64le  |       containerd-1.7.23        | NOK | https://autobuild.buildroot.org/results/9811ad2887e916fbc25a402deca85c64e6ef68fd |     
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/76597025bb7ba8fd35ca80f117cfe97a2365119d | ORPH
   nios2     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/58264a89dca7bf4ac66fd692a4c0ab362b14b267 | ORPH
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/effeb4ad1efe23351c99fe803620222221425fac | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0c5441c85c2464e58f3d5bd0e1ff15d5b730ed14 | ORPH
   sh4aeb    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/81c8e327bb980b06db8c5ba38193815ed292a936 | ORPH
    mips     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/59b5ba8757718dc5b4937158254abb7fba88de4d | ORPH
    i586     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/55bd2cfc211ce730f97256c725638cf5d8fd84a1 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/221dce1f343d1adbd7027b60b47d9be52f543133 |     
  sparc64    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/3a6b2bb088c5dcb75bf7418ea2de276e92562a2c |     
   x86_64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f96be09f2991a2bdfae7fbdb9f69b831cc90cf21 | ORPH
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/c18029cef259953d65da20e0fd957303d2fdba3b |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/54b7733c5fc4418385a4092bd2e1094234f8030b | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/9c853a774224e6d0e1d3d04551ed3733cd318d02 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/756dabb65d98cf30675d6dc3d14d9de34e5ce9f1 |     
powerpc64le  |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/0e5f0b6102211efedaf9235be6ae38fab24ba84c | ORPH
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/cf8aa81875b2d97bbdc3d1afc35c45715cbc0f38 |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/a814ae375aa7f4ddcd42a5356f6a9ee49d5ff1a1 |     
    i586     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/2267a0b130ccff301c1eba512f50ee203547221b |     
    arc      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/f7242114028e3f361d208f0a668c399fdb0308b0 |     
    arm      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/9d588af02a79255578847c6f21f1c53bef3abc46 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/2885c37e586c389f6136b236c37a5b1d8e34e759 |     
  riscv64    |        libdeflate-1.20         | NOK | https://autobuild.buildroot.org/results/e018869e487b8406d1940f2ced2754cb01e57ad2 |     
  powerpc    |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/cf85d9f709ddb99ba748d088767adba019399619 |     
powerpc64le  |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/b5096b7190e2b2bd170d3fae32b111fe746fa1a9 |     
  sparc64    |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/78c83c4cd359233743b38b5dcedb7f3067d681dc | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/29616d55dac2224fc267f43b193464bf78c8cfad | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/dc8e2d64c345ebeb761c97101ff53fc015cd855a | ORPH
   nios2     |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/9a36c5b90811b8f557836eac804f939312f9567f | ORPH
   mipsel    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/6a54cdf9cdeeb493d2374d9aafb46f27955fd816 | ORPH
   nios2     |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/fcedd482f8606c42dc9010762006e736bd9a6e5a | ORPH
    i686     |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/675991f43842fcd524ba3b73af761b5639b7b77b | ORPH
   mips64    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/ee593a816ec02600fa78f27842bdf1d7b2f3a34c | ORPH
    m68k     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c5b0f7d4c97368fe19ea98272ad0d74d20ab7842 | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c220994e199792bb7228bf091f1f0ad0f47066de | ORPH
    or1k     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/87adada8880eefce935bd9e244e7d5e1a606afc5 | ORPH
   x86_64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/e1436bea36681802f233313fcd964fb84b304a7b | ORPH
    or1k     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/9b91ff19c5aabb5bba4419e6bdfd5ffce0063717 | ORPH
    i686     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/b8db8299eef7e9d4182b8dc568ef7345151c73a3 | ORPH
  mips64el   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/1ab0b5a747134bdd18a2452e8d5bfe4df8e6817e |     
  mips64el   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/ae6248f2a9fa3b08c8c94244782ce035881f32f5 |     
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/8ca713f777ec7c8339087ebd7e62bfd92013e2a7 | ORPH
   mipsel    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/f60244b51785bc447f840eb61272e37b9d3e1eec | ORPH
   arceb     |            opus-1.4            | NOK | https://autobuild.buildroot.org/results/d7402fc981c79c98d3cd625578f059c6c2ad1683 |     
   arceb     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/c4c83cbd37655245d9d4985d81fbcd54de8588af |     
   arceb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/e260765384ce184b03d191bab91a4335b92cc815 | ORPH
  aarch64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1440d27a4cbe0b6d9140939af8ec0c6b3f92cbdd | ORPH
    sh4a     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/02a2b1d9ece040c529308800403f0230ead4ed3e | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ffcc77fe5b63c572a476db0e0b3e7a143141f9f5 | ORPH
  powerpc    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/f1c638e1ff2d1e00748d713712e3d39aae80136a | ORPH
  mips64el   |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/95a624ac041e50b60bbffd13ae9bf16fa4accd97 |     
   sh4eb     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/34056c815cd0569072e4f39fe0f3959b128f684d |     
 aarch64_be  |           rauc-1.12            | NOK | https://autobuild.buildroot.org/results/4fe05eaf491105ef2ba848d360c8589e218fe0c8 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/4f22c0cac4046ac796784a782b2fb6c3a92f18e2 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/2b87a90087fcc5eb7f4ed2fc94abee138009f5ba |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/be8138b7804de4b443687045033b3c50819872d1 |     
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/e1610089ebd31c26d4ed7c1d9209d730ba486d9c | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/e8a64ffce8f26d71fb898f3b2a78d7f9aaecab0d | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/6fb32c8c7e8113481cb335787b027bd7e97eb942 | ORPH
   x86_64    |         weston-14.0.0          | NOK | https://autobuild.buildroot.org/results/cdde1a57f4c864abe274d9bd12af229350e3afb8 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  assimp-5.3.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/1a9a427f661b27e6f1078154a6d4ecd5556f1b4c | ORPH


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                espflash-3.1.0 | 1 
            gdk-pixbuf-2.42.10 | 1 
     host-moby-buildkit-0.11.6 | 1 
                  ntp-4.2.8p18 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         espflash-3.1.0         | NOK | https://autobuild.buildroot.org/results/2e6c2af747d45c9feb7c1fccd4e30a5861079f6e |     
   s390x     |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/b4361cadc2106db74f40a40ee126c738ce1ed63a | ORPH
powerpc64le  |   host-moby-buildkit-0.11.6    | NOK | https://autobuild.buildroot.org/results/60137d215478bd13144c988421dc96b8939a95e1 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3a256cd39ff537cc9258bfc95b23b609a156040e |     


Classification of failures by reason for next
---------------------------------------------

                   eza-0.18.22 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/717e32efb4a1a7c535712fc21b14210153e40f35 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
