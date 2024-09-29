Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F869CF6493
	for <buildroot@archiver.kernel.org>; Sun, 29 Sep 2024 03:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F1038143C;
	Sun, 29 Sep 2024 03:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9mAffvdFH0s; Sun, 29 Sep 2024 03:18:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B73481438
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B73481438;
	Sun, 29 Sep 2024 03:18:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 737BB1BF947
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 03:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8213F402DC
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 03:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJ2e65gapUkG for <buildroot@lists.busybox.net>;
 Sun, 29 Sep 2024 03:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36E39401CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36E39401CE
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36E39401CE
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 03:17:59 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d2b4a5bf1so435580266b.2
 for <buildroot@buildroot.org>; Sat, 28 Sep 2024 20:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727579877; x=1728184677;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2HWWpee69BJ7XrE4yOj581QlZLdhnefL+iJoabPd308=;
 b=hnTrr5wngwvrSNKvUYJfu+KpQuNpll243oETw7hNxeSIu/OfNWLZ9VWhE+lSNbpy5u
 AMotiCdL2rTHUFauYAiykyYm25XrKvxhFvteR2XcOPZ45OOnv8EH1nglX3johS60o0ZR
 in0tbaV+c1R3jzA3bVWKGkMSVzxursosa4u4/YrrYSZ2TD5dKmtUoSzHq6yTa9DIynIs
 6Kn19duz2eNbo/8OhAoUCuIjtO84cboRtfFul3BddPkKFOW5CevoznlInyQDANRCL898
 VWhGsDlC5+z2wPCmSEEp+1kub4YfsYshqgS1ar36sndby5p7ALdmYVziXZ0EA6DgCo+O
 Q9ww==
X-Gm-Message-State: AOJu0Yx9324bxmr+jbS1WQmErbSGl0LBfy5EMrLVmp79mLk5Oz7e6CLa
 dDvQbsj4yVNZ66oXOOlPJYoC+FCH6RbqArxvHInqBaJXrZXfSMJEP99lHg==
X-Google-Smtp-Source: AGHT+IG1iYGL/uub6FSC2XeT/QUw6jMr9LLStDq5U1AoUedQJphlcXKCgRLcadS7bgMTKAR74OeNvQ==
X-Received: by 2002:a17:906:4788:b0:a8d:2ab2:c99e with SMTP id
 a640c23a62f3a-a93c4aa6a5bmr766071366b.55.1727579876425; 
 Sat, 28 Sep 2024 20:17:56 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245e9a9sm2693978a12.45.2024.09.28.20.17.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Sep 2024 20:17:56 -0700 (PDT)
Message-ID: <66f8c6e4.050a0220.35892.9767@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 29 Sep 2024 03:17:55 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727579877; x=1728184677; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2HWWpee69BJ7XrE4yOj581QlZLdhnefL+iJoabPd308=;
 b=C/+e6I5OyMIaQ4j0gcDm9PKQ19a6NxeeY6aoVwZFkRffvkx3KGuSmxZo94WrX16Vc+
 0Z87PziUdoolDqKno1pQFMIOGAVAvvNA+0uzuo7ZnlKsLZB+KtYa81yV/7k1Up50PaUC
 R0ZPQxE+jfMa2xjj+sKKZWTkQC+8lZbrT0YPby1OKPqb6tY42LoxHcryx8H+AmetM7lS
 M5HjNdol8u04cDGcj9ah3XqY2B6tEKdBWR8C5ZdzK4EF60dgtKZh9jC5NfiFHGmeJEJ+
 w+wdNCf3qba34bGIoENhsFUDKw89b+Qtrm8viPylY+QmpUMDS/VNBMwtgN9xh8IjEfYv
 pvrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=C/+e6I5O
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-28
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

Autobuild statistics for 2024-09-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  6  |  0  |  9  |
  2024.05.x  | 21  | 24  |  0  | 45  |
  2024.08.x  |  5  |  6  |  0  | 11  |
    master   | 12  | 327 |  1  | 340 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 81
                  linux-6.10.9 | 29
                      at-3.2.5 | 20
             bluez5_utils-5.77 | 20
               procps-ng-4.0.4 | 13
                  bind-9.18.28 | 10
aubio-152d6819b360c2e7b379e... | 8 
              libopenssl-3.3.2 | 8 
          cryptodev-linux-1.13 | 7 
          linux-5.10.162-cip24 | 7 
            gettext-gnu-0.22.4 | 6 
                libcurl-8.10.1 | 6 
               linux-pam-1.6.1 | 6 
                 coreutils-9.5 | 5 
           host-librsvg-2.50.9 | 5 
                    bsdiff-4.3 | 4 
                     file-5.45 | 4 
              host-rust-1.80.1 | 4 
     linux-5.10.162-cip24-rt10 | 4 
                       unknown | 4 
android-tools-4.2.2+git2013... | 3 
           at-spi2-core-2.50.0 | 3 
                   duma-2.5.21 | 3 
    host-python-greenlet-3.1.1 | 3 
                  libsepol-3.6 | 3 
                libxml2-2.13.3 | 3 
                   bird-2.15.1 | 2 
                  cairo-1.18.0 | 2 
                elfutils-0.189 | 2 
                  ffmpeg-6.1.2 | 2 
              fluent-bit-3.1.3 | 2 
glibc-2.40-18-g564178076272... | 2 
                 gnuplot-6.0.1 | 2 
         host-libxcrypt-4.4.36 | 2 
            linux-fusion-9.0.3 | 2 
                  ntp-4.2.8p18 | 2 
                 pixman-0.42.2 | 2 
      python-autocommand-2.2.2 | 2 
                 apache-2.4.62 | 1 
                    azmq-1.0.3 | 1 
             batman-adv-2024.2 | 1 
  binutils-arc-2023.09-release | 1 
                  bitcoin-26.2 | 1 
               ebtables-2.0.11 | 1 
                  evilwm-1.4.3 | 1 
                 expect-5.45.4 | 1 
       freeradius-server-3.2.6 | 1 
              gcc-final-13.3.0 | 1 
            gdk-pixbuf-2.42.10 | 1 
                 hiawatha-11.2 | 1 
            host-binutils-2.42 | 1 
 host-binutils-bare-metal-2.42 | 1 
             host-cairo-1.18.0 | 1 
                   host-go-src | 1 
                  host-qt6base | 1 
                    lame-3.100 | 1 
             libapparmor-3.1.7 | 1 
               libglib2-2.76.1 | 1 
                   libnl-3.9.0 | 1 
                  libnss-3.104 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
                libvips-8.10.6 | 1 
                   linux-tools | 1 
                lmbench-3.0-a9 | 1 
                 mesa3d-24.0.9 | 1 
               openblas-0.3.28 | 1 
                 openssh-9.8p1 | 1 
                      opus-1.4 | 1 
               popperjs-1.16.0 | 1 
             util-linux-2.39.3 | 1 
               valgrind-3.23.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/2e9394d22afe8eed19d4fdcb65e0b574d90c4821 |     
   sparc     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/128b4dfb3d2510eba933c40c60486f4342054177 |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/7263ec074c659612dc4bedca60265b8225efdf5c |     
    m68k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/58002c216247a04e05cd8958bf4cc34a53cc748e |     
    arc      |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/c0dda505e6f49a8e48f4596923a70aebd644ea4e |     
  powerpc    |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/e4ff2841331527d75e89414cce8b3561a725349a |     
   mipsel    |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/9d2915eb062f85b65f453d3063754d93ab8b9e5f |     
  powerpc    |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/4535b507e4bfe6b24eff4e85f598bd7282d89d58 |     
    or1k     |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/12d5135c13d65c5df9c91716b2fa6ed3e692420e |     
   arceb     |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/a00381ea773b129f5c8a1e976289bd05ec2ab260 |     
   mips64    |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/edb28d567ab73a7bddf41967e7f8043b14a354eb |     
   s390x     |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/40c9556a6184281eab13c34d35dc8ceebd54f07b |     
  mips64el   |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/3e938fe97a1b465ee6b0088b88259fbfecb17170 |     
   xtensa    |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/7bd63bf7774c044a13db4b7e369f3b0d51436ac0 |     
    i586     |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/4bf0629186ccc19f922c675698ab8da6c8af3ce7 |     
  powerpc    |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/3c0496a166a083d7589cb82b30cd0c511d231424 |     
   sparc     |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/0462ae1dd449e81d0c1e6ee5b9e650fa66a3f83e |     
   sparc     |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/5c3ea2203277fc86ed541fa877410512f520068c |     
powerpc64le  |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/4285f7ecb0adc541d9d2f3a166579b6c4ac4fccc |     
  sparc64    |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/eaad1dc7bd9f56b16d18b2de7cf9c2586ffbf4f4 |     
    or1k     |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/243ac3e5adaeaadce89e447dcaf0bafc5a6ea98e |     
   s390x     |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/6011e8a8736bfde4c58f28e4b6305bfbbd5c7c68 |     
 powerpc64   |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/2896c487c86aaeeced8bc132f23ac71626559053 |     
  powerpc    |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/56d8722bf13332f66fb6838d4f0488dbfef56029 |     
   x86_64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/33dc0aa086346865fd30544863acbd5e8ad5178d |     
   xtensa    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/802ae1d9ba71580c2982a376af8572e438790b8c |     
    mips     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/f7728b0981bcae55da3eda8e2ca3d6d9b542faa8 |     
  powerpc    | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/9cff087ab0081ef9cd43214213df4d9ccc4a7451 |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/58daf99267423ebd617ac6d3ca2c964ad3e5c244 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/13591f59fd9f070110d2d1eb4adcdf946120e962 |     
 microblaze  | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/0fbee794f88440e8f57e62198522160f09714270 |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/287245b83f9eb592c24967bf9769c4e5c31d74c7 |     
  powerpc    | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/a883df771849cf2854cf81b659f3c70ea8151f87 |     
    mips     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/c3a608ba2cd960536cb6da81cbb0ef51b11a181c |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/c6c9a308595aebd270b643fc0c04e79f443ebbd4 |     
   mips64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/e343b5e0f44898f5f49fef8b7ed89fcc8a2337ab |     
   mipsel    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/b7d333a9714d45fea5bbd462ad2ebfe815326a0c |     
  riscv32    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/67f48d414a465a5c1eba783c240bc93dc1abf6b8 | ORPH
 aarch64_be  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/a1c54a34abf8704477b9a9d73b13ec2d5c4e2d6a | ORPH
   nios2     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/e1ae48ce3b393eef3d0770a0f8e7367176222f59 | ORPH
   sh4eb     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/a6f1c493c6b9a61b454d52ff0655e8bc60ee13d0 | ORPH
    or1k     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/f7e46ab692fef509e64603a7f4d9899b67d2e08f | ORPH
    sh4a     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/2aa202c2bb239bad6cf8b9159289f16b4fd08f4a | ORPH
  riscv64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/d2f21f3fef8bf76f252a9a2faf84128fc5256c9c | ORPH
microblazeel |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/86968a97403793f4005c85ac87df71c36713530c | ORPH
   nios2     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/f5bb0d9bbcfa591269a9f7926f82e98b84e84796 | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/adc4d2201dc3f13ffc059af8c8ad8dade66f7b55 | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/032932185e3fdb48f73a1ef3dd1084b8f9f7277e |     
  mips64el   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/9df8dbbe8aee9ba3c3c39455ba548ad78441e658 |     
   sh4eb     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/02d9ef0cb8cd8dc9e7dad3bddd0a924ddf6e0e13 |     
    m68k     |          bitcoin-26.2          | NOK | https://autobuild.buildroot.org/results/313f9711f1e4f5461a26417f7cac2260856a29fa |     
    or1k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/01b1f162dd088737685f6c611a56346cb8280244 |     
   nios2     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/616468d65f7cdab93d2c7a19c9378ee6161983a0 |     
    or1k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/8833f74df59dc195a358c629ce9caa8352f3dad3 |     
 microblaze  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/3e7517ba9a5cecf571a79a212a6378eda73773cc |     
    mips     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/0a3fc697a79bd27f26489aacf7f990f956a0f21f |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/889057b16d0f39915df788f67a3006704a9dc32a |     
    arc      |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/8a10453e2a70423255aa1355bfd683dd8bbf4d14 |     
   s390x     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/2c9f942ad5c5e282c6542f9b1e65a5700d8a6323 |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/a04985c246f85918fda0a8fc5e026f2d638ec62f |     
    i686     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/f806fd54a6f09ba2cd6bd6b6b9800399aa0dd0c8 |     
  aarch64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/16519ec1ed472c487e28a94119f4032856522240 |     
    sh4      |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/0921a28422f113926435ebbe4eed82b41eef0326 |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/eab183b231579d871c04fc25c5fbde3b8c531da0 |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/b0114aef6c00cf385991c5580ee932648d829abb |     
  riscv64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/39c71e9cfde709596db4b9e93c17636f7bce6911 |     
   x86_64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/1e58055edd906a6078a511305e67685b0de4ac69 |     
   armeb     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/af7d1c94b9edef053720097045b6d7733bb0afdd |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/bab9961484d0c53b9f88c72a31ebe7601fdedc66 |     
    or1k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/76e7d263a9dd6b48441d62fd4d7d87093cc2d399 |     
    i686     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/5bbcc45304801f9c78468279f671fc2da2ebae81 |     
   s390x     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/afa57a0eb10e0c5dc45cd1304fd0522a6ba6a415 | ORPH
    i586     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/7adf5d480b0d87d3aaf8203f05ce77f92110917b | ORPH
  riscv64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/c0783127e84033dca4560961f87b7821283ddbca | ORPH
 powerpc64   |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/57351782cb8383d1cc2758af6a5f3234d8d0feaa | ORPH
   sparc     |          cairo-1.18.0          | NOK | https://autobuild.buildroot.org/results/bcbc8156f1d5da090e0c52040560188a1255646d |     
    arc      |          cairo-1.18.0          | NOK | https://autobuild.buildroot.org/results/7304c5f1f5254fa3490f6299e2daa78405d97bab |     
    arc      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/3d5713fff72b43f0e6bd70fb164d06626bd5bb2a | ORPH
  mips64el   |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/29960f00406ced25d0068bcaf94153d9fdf14287 | ORPH
    arc      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/281548d9ac70f4ba36d95f345dca615da799cdae | ORPH
   mips64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/55b4fc1b1f1dec3d60b95b93f4398218dffa3538 | ORPH
   xtensa    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/3c3feb4ca858895e4744be47d38d4a70b76ec6b2 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/f828d95a133dc143c698cb6f77f65e0e28c281dc | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/972aee5957ef4436c3ad34671cb2cdd4587a7be4 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/4506cd540e7962b3798e61ffbe2773852a9a6bc2 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/07b1c2f12fdd443eefeab8786de8873b0989e213 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/dd89940ad2ab1c91e10bbf6046db9131dd4fadcf | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/9608cdaa55417c227dcceafc1e90e0e363e352ce | ORPH
    m68k     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/92a952e4b0f3c24c992abff78ba23f8901587b37 | ORPH
   armeb     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/65c88fa109e4b2a35aba6c4887f57c1eaed8955a | ORPH
  sparc64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/f9824f7e651feab0af7f7081030d25ab9a41ed4f | ORPH
 powerpc64   |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/51d310444dbcad83e854664353b6b1699bbbc702 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/5fa2677e059d8cd31e9a9b1082a4239c4f22571d |     
    mips     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/8ba23dd0553e72ecd261d1713dd4e098333f4ce3 | ORPH
powerpc64le  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/0a66d3bd6cbb4bb5905f272711a97123dc69d6e8 | ORPH
microblazeel |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/d195e40a68e27c88cf0cf7354c2f2d1af2a2f5e3 |     
 powerpc64   |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/e452eb695a01fbdc39c2c59f6a037babca4c55ed | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/01a116eb1d9b4db8c81281c3a53c9fca5b178a5d |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/dc8fbd79732350eb497a1f1e2991142c3e68a45e |     
   mipsel    |           file-5.45            | NOK | https://autobuild.buildroot.org/results/8ba4de4b4f26c9e6ac1bce0b04324a7a9a0da8d4 | ORPH
    i586     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/42ab3d80b2dd3ff72ac8df67d68936ceec328dd6 | ORPH
   mipsel    |           file-5.45            | NOK | https://autobuild.buildroot.org/results/e877e5d2871ac3d937843f30eec7a756fdb11b5c | ORPH
  powerpc    |           file-5.45            | NOK | https://autobuild.buildroot.org/results/80e749480a78c1ff3f939a17718402e41803539e | ORPH
  mips64el   |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/ea3d36c8973ed6c71ddc2447091e4bc25f090185 |     
  aarch64    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/e43ecbc26a62d6f7f5c09a8598660b91fae58fca |     
    m68k     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/6f15dee927d0974454d07834c39d582d3d26dec1 |     
  powerpc    |        gcc-final-13.3.0        | NOK | https://autobuild.buildroot.org/results/bfd507b6128a79c4420f75f3dc97e7eea86b56f5 |     
   arceb     |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/c8946049c604202b0c640d33e9ba8c1cc871474f | ORPH
    mips     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/d0af9d38270a753995c294c44fafb99b01ddf4d4 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/1afc2ca216d1a2f150d99d586e754816ad054be0 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/1a884af979004f7f68826f5cbc36b07affabaa3d | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/84aa485645d643e0610be99004bb74b0de04ebf8 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/8cd1ded1be73ed8b8a377e319ced8f00e690699b | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/ca1c6f68e18403e08c22cef96f959a4234d4b1a4 | ORPH
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/942424df25a8ae65a962a2fbbd8026eae17adb17 |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/a0eac8da93af69014cdf38f04c6deeefa372b237 |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/0a8cd75ea145ee2d99f9ec8e0c44c4676ef79a51 |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/5c3b99264ca9cf4d32ed9f1a2716fe0a0cb5ac5f |     
    m68k     |         hiawatha-11.2          | NOK | https://autobuild.buildroot.org/results/0a5452ffa8a978dcf4549ad6571c0c6634bd69bf |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f7ef780e8f03589e61306a83b01937feb61f5373 |     
  sparc64    | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/e751d8c5e5f662e9ee05e8561559e30474d1b222 |     
    arc      |       host-cairo-1.18.0        | NOK | https://autobuild.buildroot.org/results/97b554bbf06682c26099e5175dca607173fd23e3 |     
    arm      |          host-go-src           | NOK | https://autobuild.buildroot.org/results/9f2c4abe4af4ed2241a3d00d52e8222e4f09a43a |     
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6ad55c6d20b84a9c6edacd10d473c8f0b908b404 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1d47be0904cad2787e9f36e4f580bf4592b49868 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5b11af0cbe783758375fa239395af37f900e443d | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/25ba1a86208fb184e393f90a4e8bb62e3489ed9a | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4977aa6f6dcc8b4e99dbd5176d46602b74306bab | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1bc8639a225d9306d134b3ab89d0fafe73df2b28 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/75fe46e6ae443e2dc13cc79547fecc3631add661 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bbe577c08f2478421f28774de5542266a59a493b | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ac743ad7b2459296754d2f8609f3e1e7ebbcb955 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d6150f287bb6939e55c9f14ef6e5986b4f1c5bbf | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/107229cdde1f2dcba07a9c81368c13170b5700d2 | ORPH
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fe8a8999280f144b58a6da533ccd0a74d7747ce6 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4b80422cb6323927d183f36b6978e5aaa6151290 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/af61624c81a4a3a392aa213aeb88f3a9e057cfc7 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5da813472e5800de5e1a13f3266f79b35820c46e | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5d85e6d57ff0ab459d968a90eb586ef986501ece | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b07466d1b515a21cbcc5cd828b5490f07c0afa86 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/64dadc9c4feab1c1876daa2b2cb8eb785947fdff | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/696e12ba7b4eb2f315694a8edc9d0813e4ce62ea | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f541d8ccf70d1373d7db6e81fa1078e65ed265c0 | ORPH
  riscv32    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/662d50730c943f1195fe8319784dd19711c8f785 | ORPH
  riscv32    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3313a79d331c461ac6951b66a51ceaa7adf5b264 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/62bab6c1313d31ca4bd670dcda36b1b8682f8802 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4e66becf40af547fd801af77b6d97dac01784c0f | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bb56e9c721c23df82ddd7b2c587df1d7b81f7fb4 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8fa2875154273dab00beadf38bc23106e78c91eb | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f3e4282d3695fcf93a62d14dae24ea4e96041cb7 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a69b3f08ed7b4074311f85033245410e151666ec | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c76f8ea2bfbbbe6468ae1576d72a7770ba190570 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9e6c6ae9d259a11ba44e8f23846f3c541fdc8fe0 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/323e9be714878c9845fb6d9abdfc62478261204a | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0584d66110577f1a2776aa178c33e4b34d2977ff | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ee5a745ba65f530362c520dce3490910072669a8 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d10259f6183abe843b284e5227699433c5253e5e | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/583994a590dd6b9400d77b4880f7bcb6dd6ae9d0 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/98948cf1e7a6c7ecd8bffc7e499043f3c7925dd2 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/82f5b9f6cb235b796664b1588629550f88262cae | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0da454b14ff4f8299e3459ee1b4766e9a62a1a43 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/46f788d6428ffbae903b01a79857e72e2f8fbf56 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f873d110ebc203f28b36c22a43675a1bb309979c | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/57bac8570b9ad4c08929ecd00b12168ab9ddcae0 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0806c756074fbfef2422eefb8405306a9520aa5a | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/49e5ae78a4baa22500bff577b0a6fb79a27e79b5 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1f1226cd788de9c55518addc1068cee95775fd07 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f09033305fd0eeaf2553df773c8f196d5b31840c | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ce5d46cf30e17bae5b75c5ccb6023a9beb3e68de | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d0354ddd02e1f3c58702d09f7895fe02b044e2de | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1989afdd98183dd415398beaed92b2c2390eac19 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d722a5276cf3d7a1baad20cb38fa58a8c36796cc | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8dfb92e9d52d09c096caf260aa701d4cb0c91507 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f761fd1cb8fc9c910c7592860547426d14cd83e2 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6ef75ff3fd6038944d90500d29410e561c009072 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bb0e65499216de03f89a74e157b2ddd4a4bda12b | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/60a21a847a47f867c4a21a0bc37d938d3bd31e1d | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5afc88b5488be8e968882636b9a7705a3ac73bbf | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b549fd8eda30e3de7de9d019af5fc0466171407c | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b8de9d533fe56ffd96621b5fe54e004845216d17 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ae0d57007f1e50131e39ee56c1b6a1930474f2c8 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/df9d828747bcc93eedcb45018786d279626e708f | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9042f97254d3168c250bb43f0c69d90227f95311 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0488b2073c3490f36238add1be20d81df052ce7f | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/50265cd0e01082e642f7febc3529736bbe01c392 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/347a0662f7beac089e5671b47714a4945284ffce | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bc2d1b256fbd38e876e56944803b71145ce76fa2 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6dbdbc2b69a2eab1ff5dd54efc0c1012b94aab69 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f4300e95e0df25bd9e44041f94cc51408aa7c00b | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3f847d7243609e00f756942c02fc33b8a3714890 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d4808a1754fc18db8f2489938a8bbf2ede502028 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/60ad095f4fe2fff36001487a0366cc934768421b | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/86872022306126e6370a20fb8ea98b4a285f7fe2 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bdb68ffc3a7960603f46df656d738f6e54485689 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3a391f69e6dc7cc15295b590fc8f3985cfb0a805 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a7df21d4a0f5f5caef41d35338b67e8e032f7ad6 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/05a9ec4dcb6ada98148aa27890d3fb4c56445615 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2f52dbffd165f9d5831609c54ab74f7e6e38364e | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6592df91913b7ce6df9120c58b96051267c84607 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7c750451f985e1640ebd6bccdbfe16c4cc7bc888 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5f05ac9ec54f4016f297f7c794c242d23a497855 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dff6c4a3cb89e59adff2beb75f2ef6a49d3934be | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/56a1616730707d573e3518621de1cf01a4ea40e3 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2719e8f2b0ed07bec31d9582a09f3e3529d1cd1b | ORPH
   xtensa    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/40d1e55552cb462705cd6264f716223d0da56afd |     
  riscv64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/92613613428ba634692937701f8c8598993416c4 |     
   sh4eb     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/3f37e9f2abf67ead195bc2397020219538481dee |     
 microblaze  |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/575ab26091105c86a9d239162e41d379ba83a66c |     
    sh4a     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/82cc4767f8ff08ead059f8d7697a373f1e6f4426 |     
 microblaze  |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/7a8ab80ece939c637f2a298d14cfd29eb77b91b0 |     
 aarch64_be  |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/97117fe59df9b59d4e843ab99b8165cfec988405 |     
    m68k     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/b54452fb233bffcc84973947e437a5e6f9f244e5 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/14163aa982e8558892ba637b29155f7079ee6643 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/93a0bf8e4d1d21c4723a6cba9f7a67e4261dc8f4 |     
 aarch64_be  |          host-qt6base          | TIM | https://autobuild.buildroot.org/results/7b67163f920c0c949dfabd476bd965b003646b6d |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/0fbb3a24297482c545a4c476269ab7038975f014 |     
  powerpc    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/91ee58ab7e96280d97b42590c6d475bbd919ac4f |     
 powerpc64   |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/ccbae6e4589a9d5a3b64e044aae8d7d9c423806d |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/b6293ce32ba3b39fc461a08e45b1f762ab3d2be8 |     
  powerpc    |           lame-3.100           | NOK | https://autobuild.buildroot.org/results/1b2ea2408a600dfffd8ef889231f1df7ca62a3b7 |     
  mips64el   |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/efdef08f52d53ee4247789e10b6ba519b3ac5155 |     
microblazeel |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b85e5ac33a8372ba9ba38681d238e9007de3785f |     
    i686     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/162996de5290cfe11e007b3fd025265d06c1c702 |     
   x86_64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/a5acf4e3beec2494f4ca0e1e1613c057dedbbba6 |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/d700ec870ae5459121a6e8b32ed82d03e0e3e43f |     
   x86_64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/3d37aae55a0d6d2ad29ecc0f432b615559f0c5e7 |     
  sparc64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/5c81a4b80cabbb93a363262ba3f959164d7053a9 |     
microblazeel |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/a7395bfa749f11c740b3c19fd934abc2868bf1bc |     
powerpc64le  |          libnl-3.9.0           | NOK | https://autobuild.buildroot.org/results/4621079107e9d119bbd3f362566d9289afd32449 | ORPH
   s390x     |          libnss-3.104          | NOK | https://autobuild.buildroot.org/results/ca37e98fac14bbb777c91dc5044e1abc1c1dcfe2 |     
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/6f6a99c4737ac719fc70169c3066075d1ecb233d | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/ef9e63ffb55fd8f38f34bb8ec4fe24bcfd59fe3f | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/c7a3a102ea0d602594db1ceb322e3f3dbd71e3fd | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/e5657215ccf3b8bff6dc68bd8270916dff9c9b4f | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/7596aa3e183be7f78e69e06aeb0481ed47bdd8a1 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/4ead126f5a9dbfcaf6514af3180a2ea6192b66ee | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/365b67288453b040d67259b70fda8ff3339d2039 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/f7289732872691508a1af4a4e3aea178a5874df9 | ORPH
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/9e6c757d40ecabd66008b5c1b11edcd12f45efec |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/afcf78e3a8a9ba613f62fc04a8ba1bb62a33ebd5 |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/0e5756da11e9ef33d7da6f9cd38d5e8c37ae2328 |     
   arceb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/60c2b2b78e82c5927e1a0506ca95cb678fef68ad |     
  mips64el   |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/4d5050a204d97301a6dd9484a56b249ab8a2ff4a |     
    m68k     |         libvips-8.10.6         | NOK | https://autobuild.buildroot.org/results/f436afdfb3406dd50d9878c0065f0d372d198fbf |     
   sparc     |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/c3387a354570a51e15235f228a0fcac51666047c |     
  mips64el   |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/4f7e27e3504b2e7f89fb90d64c00df4d4ac01b30 |     
   xtensa    |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/af25babc1bf345e47b44ae4a11e1271af8812645 |     
  riscv64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/42af775bdc794f6730d2ff4f56c007f35e9ac41a | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f4acf83912f481962271652695e630c322d23d10 | ORPH
   sh4aeb    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a00789ef8d2e74b4664c2425c4ebb279e885ce41 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/080fef1ed9eb57968d8bca2ab0335cfad39be26a | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/c175b45bd1c25b422444a30a93bfca76fd4a8c18 | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/11637ea373b50d8511f9248b161d75170b4dd7d4 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/03ad76a36393ebe9e87d381581ce15782c49833b | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6f3bbdeb11f3d64f8c1e01d8c4a29b4765fea101 | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/547292781d04392c9850ea64b14c861736595a66 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/906dfeeb9d1fb8f963522725bed7803acd378cb1 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0f41e0b08c9dc029e3d6be20cc3a4b8148f1f388 | ORPH
   armeb     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/0c668b670cd3a5c4e2385c65d9f1b6acb34bfea1 | ORPH
    arc      |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/b4d9a2f9bba22d4a72991be6e43e695e653328e0 | ORPH
   sparc     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/1df3cd6ac119492c6c7cf34669f2348ec33a2d78 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/a1cb150fa5269caf98c5cb431d70bc211521afdd | ORPH
powerpc64le  |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/c8407e3cf394147c6a1e9d265c2f95db075ef530 | ORPH
    mips     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/5642e68569aa64980402c06e09415df00c62414c | ORPH
    arc      |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/2fff3b46b6877a99f371e5f0f897530096b262a3 | ORPH
    sh4a     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/4b30bc81c7e7bae1c12791b1135803aad62a048c | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/fb8dcaa59391d35c45665e1bbb18bc3e3b7ac1fd | ORPH
   x86_64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/120be0af4ed378c8801ba8c840e7cd34a55a098b | ORPH
    arc      |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/ed000a2ff8dae885ac96933cda04b1381a72cecd | ORPH
    mips     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/05542085ca7b3d1c762f84b7981c3bad5799b7b6 | ORPH
    sh4a     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/abb3e8eae44744952f67f6c2a8188a4041511ff9 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/9b18c2be18684e9949a2661a31faac1f71782ba6 | ORPH
   sh4aeb    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/5c462d7bb50f2328d79c6bae211d64b0616b437e | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/488655c3de4279a43734729b88ae3d2c4716932c | ORPH
   mips64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/668ff58ad183f3e70a99d573ba04181e60435c46 | ORPH
    sh4a     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/4a8b09f3255db478273296bb7c82093b23c9c31a | ORPH
  mips64el   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/a83ba06436942d4ea7bf74c17348087eff65ed20 | ORPH
    m68k     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/a61dfbce955097e0ce2b4a482ad1387a7def00e8 | ORPH
   mips64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/d9919760718784dd9eb91e7b1c0a8d7bb2f482b2 | ORPH
   mips64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/1f4f83953d946bb7084848f799d9a49355b23c63 | ORPH
 powerpc64   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/191bcab863cdfffc753c17e12f6ca6a42513d47a | ORPH
    arc      |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/fc17e38a61f108b029397ef38f7beb437e6ad3b9 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/b1a2b070ab2b269930913ed27158b99cbcae0cfa | ORPH
   arceb     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/6a72b821c07079656d415f02644b21edc3ced01b | ORPH
    arc      |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/0cf74c923ba833abacace5645c80cdac1d3b478e | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/779792dfb444dc3cc78b2427e17906ffaa2d4588 | ORPH
  riscv32    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/56d07f64349a39b7832a2a0b44a6d5de55b7e165 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/1eca0d387eda9585c6b600c62a59f700e6c5f254 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/248e6911ceaf43d0d97d18a05ec45b70ee69f690 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/ab13f9ba63c38c3f4cf8077b74067001e16c9d00 | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/bbaeb694a343cf45842d7ce1f6d2619115ee10e2 | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/6346c5963ef7d216a3837789945817c59dc17e36 | ORPH
 aarch64_be  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c2acb1ee847202488c1b4faa9ecc5529e851b891 | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/87095e34b89c2712d5a6704f2866ac0b46905260 | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/964f013be2a5c218d8841831cf578ec932ac5d41 | ORPH
 powerpc64   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8191ebf51375ee56b2dce2080b23e0e98f40ae13 | ORPH
    sh4      |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/f21509f32597664240c43a403747ef1b9046ee52 | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/5a86f4a7e9557eced87b1b2216a06e24023d3f70 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/738fa48f1dd5f72b3c4442acdaad1f4b4dca7138 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b7a0753821db222a525df0d124d0e6837ac3fb0a |     
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/611d08c61f187be3aad766bf3fc1ad0ef914e7b8 |     
   mips64    |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/1449cb481ba74796ec4a55e73bab1ad90a93848d | ORPH
   arceb     |            opus-1.4            | NOK | https://autobuild.buildroot.org/results/5460635dad059f81e6c54e7ff7e1269079528518 |     
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/28f16c22413a2767a77178eae071cf7526016ecd | ORPH
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/830c03c9ef3765dbc125ec9b3d2ab80e0e5950ba | ORPH
   armeb     |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/6485671ff056f87c56c469bee758e416083bd6c7 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1b6e5a70a2437e6331b9081aecaee6704f1518aa | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/fae279a4d93802b4e5fd756b14f477edc2405977 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9ed412af1aea6199db6842ec0fd62f1b8abf013b | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9f0315d536cf335c8b3892a50d80673ac4fc3057 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3b6d47c183c67aa5aa7a994428c8fc6a248264bf | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/08937e1956feedfbd63af95e58b1bb824f250812 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3c23c76b692f8139389fb1785c29ad2619d4ee8d | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/797000a0afc7d86dbe29da8648976b772f08175c | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5efd0a1ede9cc2665d32e9f3de9a86250ec1652c | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/fa4b4fdc2b1f9d781b7cdcaa7f275bdafade63e9 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/fa62233cc1cbee7508cc53cf6181af827e9004f5 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/128bc55e32cba135b90480555f148b9e7b422cad | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e65a946ad5bee7babe3dc72c60b6cb16c48f5d00 | ORPH
   mips64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/2650bd1840d04e7f853b25443af10b3ab6732328 |     
microblazeel |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/f9724c80536be4fd9731cbdf38612f66af3ebcf0 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/fe099029a69bb552e864d60b42774d6411442af9 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9880dd7d361bfdf7d979984d5fe5db27347b9dc4 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e7bbf51789b4eebcfdc971e037d7d1d33f729993 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0901b7469a4f19cf4d464890f1e48c66c57405cd |     
    arc      |       util-linux-2.39.3        | NOK | https://autobuild.buildroot.org/results/602dfbceabf5abaada3ece48c8b0981ce4da54e0 | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/a1a46ba683228cf41e58a107b8cfd109c968637d | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/1921ce0860d901b6418d422acda1147ca0d47e93 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
                 coreutils-9.3 | 1 
                host-go-1.22.7 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.6.50 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/41303231bea0651fd651118c282da31398e173d5 |     
    arc      |         coreutils-9.3          | NOK | https://autobuild.buildroot.org/results/2dde30a103a7505af983bf21a5078b74affaa72c | ORPH
   mips64    |         host-go-1.22.7         | NOK | https://autobuild.buildroot.org/results/479525d61b5b6121472da7f28e8657f2489c2254 |     
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/1a5c1c281aac306d3870759159c446c03cc93ae0 | ORPH
    or1k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/84152ed4e15540b6700c0a56a498f09e5a07a8bd | ORPH
    mips     |          linux-6.6.50          | NOK | https://autobuild.buildroot.org/results/9a2570339b288b3f8a7f0f10b2cf11f894bb8b08 | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  linux-6.8.12 | 2 
                       unknown | 2 
                  bitcoin-26.2 | 1 
             containerd-1.7.18 | 1 
                 dc3dd-7.2.641 | 1 
                  fbterm-1.7.0 | 1 
  gobject-introspection-1.76.1 | 1 
google-breakpad-f49c2f1a202... | 1 
            host-binutils-2.42 | 1 
                host-go-1.22.5 | 1 
host-heimdal-f4faaeaba371ff... | 1 
         host-libxcrypt-4.4.36 | 1 
                latencytop-0.5 | 1 
          libcamera-apps-1.2.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
           mediastreamer-4.4.8 | 1 
            quickjs-2024-01-13 | 1 
                 shadow-4.14.5 | 1 
             sofia-sip-1.13.17 | 1 
                   trinity-1.9 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          bitcoin-26.2          | NOK | https://autobuild.buildroot.org/results/8307b7c098a506b00f0e2f17524161b2675bba45 |     
    arm      |       containerd-1.7.18        | NOK | https://autobuild.buildroot.org/results/ff7e5aafa249d799d7dbd808b2348914e0dafa25 |     
    or1k     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/8dfc814dfdf938a85a739aa43113423cc08d79be | ORPH
   xtensa    |          fbterm-1.7.0          | NOK | https://autobuild.buildroot.org/results/fdb1304aede891262974b78822884c60073392aa | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/3c0983670d0f45181fabf51dbdd9c9e133093dd4 | ORPH
   mipsel    | google-breakpad-f49c2f1a202... | NOK | https://autobuild.buildroot.org/results/ab00577d3fc9da152dec98efed89746c4dd8efb5 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/df07e23ffcf4ef319da7e626688d043abedff64b |     
   mips64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/48ed62464b058106d62854490776aba7918026d1 |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/4ac105e38ffa65c1153e7cb9f66e42e81891e8c9 | ORPH
   nios2     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/b85089e726d8ab146f5afdd9a2130292f7ec99cc |     
    m68k     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/136c03dc210959d0e3ca8c0505a6b4e23de8b7e2 | ORPH
  sparc64    |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/7cce1a0b573f42233c842bf8511d2f83addc7e58 |     
   xtensa    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/304b710acb4aaccb454d8d2a2418ae219cc34966 | ORPH
 aarch64_be  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/60ddc1dd5cb8e2197d1f5cf0a1d756366b35ee4e | ORPH
    mips     |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/ff37150f7d1dd2377b1d53fb947f621f3c15df42 | ORPH
    mips     |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/52fcf756e1a842a293e6e14072c33321fee13b5f | ORPH
    arm      |      mediastreamer-4.4.8       | NOK | https://autobuild.buildroot.org/results/ef92a0a74c79a33163bb72f3e4624672a6dc8b00 | ORPH
    or1k     |       quickjs-2024-01-13       | NOK | https://autobuild.buildroot.org/results/c4ac23f5ac5d02ad1d443005ec2086db215b70bb |     
    arc      |         shadow-4.14.5          | NOK | https://autobuild.buildroot.org/results/e9a00f6993e1628c38bcfd0fbe40bb0288f41075 |     
microblazeel |       sofia-sip-1.13.17        | NOK | https://autobuild.buildroot.org/results/c73daa8e1a5fdabb0518dbe628673f6c0f7d69b1 |     
  aarch64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/c21697224cb4778769b888568c4bf73a5cf00737 | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/278dbee27ca76eb01077af8c14c2368215874ae9 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/31c5f91eb42da9f830787d48364fe1992c77c46e |     
  sparc64    |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/2973a2791a8a17627a1d121941f21a23f8a85fca |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

              fluent-bit-3.1.3 | 1 
                    gcr-3.40.0 | 1 
              host-runc-1.1.12 | 1 
               libglib2-2.76.1 | 1 
                    ncmpc-0.49 | 1 
                  ntp-4.2.8p18 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/10ed5c8a79341a962eda4d1cff766fea053795af |     
   mipsel    |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/80a71e86998320d3eabd8e0e354ce7ff51fd6b2a | ORPH
   mips64    |        host-runc-1.1.12        | NOK | https://autobuild.buildroot.org/results/825697e14476d67d9abdf2837da6559635768c13 |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/95f5371eed8925bee482999e6980999b0ef32347 |     
 microblaze  |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/1bbc085764ff962d40d7770e4759334d07998776 |     
   mipsel    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/592120af08067857885fec65e0bf792e72d0253c |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
