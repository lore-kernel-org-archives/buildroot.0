Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D379CF6494
	for <buildroot@archiver.kernel.org>; Sat, 28 Sep 2024 03:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCCC460609;
	Sat, 28 Sep 2024 03:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yt29dZRHC-CU; Sat, 28 Sep 2024 03:17:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22BD56060A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22BD56060A;
	Sat, 28 Sep 2024 03:17:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D1B11BF2EB
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 03:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BE4A6060A
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 03:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybgQrZ0MT_ba for <buildroot@lists.busybox.net>;
 Sat, 28 Sep 2024 03:17:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2EC5060609
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EC5060609
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EC5060609
 for <buildroot@buildroot.org>; Sat, 28 Sep 2024 03:17:54 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a93a1cda54dso359915866b.2
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 20:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727493472; x=1728098272;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZEuUy3sW5dW3F4rmVoskw4Q4ELSOyEZmOlCM2G+R2oI=;
 b=Kcf1Q1Ioh8acLkQr48l6/O1C6XRGqjdEpvgxWDFokloEexUIgkMkvn+HaKbkAlTi4a
 CO2FdvvFdxGsOYdrv+FfcO8dNhZTKhJDd6rQwD4Y+jEHOCkS1KVnsP9kp7WnW0p0UiGy
 xTgOtN4smoz8tCmnL5KnO7t2l1e1RfuxuJEbFtJcB/6LqeWZ+2W5aNBHAxnmNFoRareu
 w9fZL223ciNnnJw/j7uhlD2fh333LYktrd5QZ4dlhUoSUMV9pSfRyLh5BQ+CMan7Llwq
 fGyP0gFF5GsZjzQfFJRDTMyRYKrTEvER8Zc9jz9ksN8jRGvHlCetQk7Wjaw25hpDl2XP
 +Tfg==
X-Gm-Message-State: AOJu0YxsC5YobNK8AhVmEUzzu9PWlcMsiA5cFkk4eflNfU+aw/CnjtOK
 NlHNxPFP2ZQSimx4iTwu+/zxkW9ywPFa0VO/c/VPEMRIJ/sHihmAnnNa7g==
X-Google-Smtp-Source: AGHT+IFw0Vljq9OuGw3QbeFDmO7s1cNWjMf5/VdVmWHCexuzh2O0G9YwZPh8CbiD1u6tmwVCz9Kz5A==
X-Received: by 2002:a17:907:7d8f:b0:a90:1300:e613 with SMTP id
 a640c23a62f3a-a93c4c256eemr367029166b.55.1727493471596; 
 Fri, 27 Sep 2024 20:17:51 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297bb9bsm199946866b.168.2024.09.27.20.17.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 20:17:51 -0700 (PDT)
Message-ID: <66f7755f.170a0220.31d53c.7211@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 28 Sep 2024 03:17:51 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727493472; x=1728098272; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZEuUy3sW5dW3F4rmVoskw4Q4ELSOyEZmOlCM2G+R2oI=;
 b=mGSQFWbTGcgFAEDCsXKeOlKtys3AHZ5CE8i9fTVhRZ8axKWwC4WO124TXEgWdclhlW
 eoQ78M4GKTiigBqMlgtsTMG2mjZ7O/B6HfWcDkIj93VMoW9hhc4Bz3ZdFdYj/Tw16PHU
 6ctA9amTJ3r0yJo1lGyYfg5swoofE1+6rcyxDZr3956+sVumFmM1DCm1nSgMwihHepd4
 VgAN3NP98PAzlhWKSuXkCMtx1NpYSI5JQ0yguH7+FWlOakUPv/d36TdNU/2L2JOSr0A5
 KFKPIuMgd8omxMG7ymK+d2bVIVaHzBlG8b7ClHANy/FN9vsbuHke6+Bt1t0dRCQpOHL+
 LeKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mGSQFWbT
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-27
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

Autobuild statistics for 2024-09-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  1  |  0  |  6  |
  2024.05.x  | 17  | 18  |  1  | 36  |
  2024.08.x  |  3  |  7  |  0  | 10  |
    master   | 17  | 96  |  0  | 113 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 13
               procps-ng-4.0.4 | 6 
             bluez5_utils-5.77 | 5 
                  linux-6.10.9 | 5 
aubio-152d6819b360c2e7b379e... | 4 
                  bind-9.18.28 | 4 
           host-librsvg-2.50.9 | 4 
android-tools-4.2.2+git2013... | 3 
                  evilwm-1.4.3 | 3 
                  ffmpeg-6.1.2 | 3 
      python-autocommand-2.2.2 | 3 
           at-spi2-core-2.50.0 | 2 
              host-rust-1.80.1 | 2 
          linux-5.10.162-cip24 | 2 
              skalibs-2.14.2.0 | 2 
                 apache-2.4.62 | 1 
             batman-adv-2024.2 | 1 
                   botan-3.5.0 | 1 
                  brotli-1.1.0 | 1 
                   bullet-3.25 | 1 
                  cairo-1.18.0 | 1 
                 coreutils-9.5 | 1 
                   eza-0.18.22 | 1 
                     file-5.45 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
            gettext-gnu-0.22.4 | 1 
            host-ccache-4.10.2 | 1 
         host-libxcrypt-4.4.36 | 1 
                  iozone-3.506 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                libcurl-8.10.1 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libdrm-2.4.123 | 1 
             libgphoto2-2.5.27 | 1 
libilbc-829b08c7902ceb87a26... | 1 
                  libsepol-3.6 | 1 
libsilk-4268a02240c35c6055b... | 1 
     linux-5.10.162-cip24-rt10 | 1 
               mariadb-10.11.6 | 1 
                   nanocom-1.0 | 1 
            netstat-nat-1.4.10 | 1 
                  ntp-4.2.8p18 | 1 
                     nut-2.8.2 | 1 
                     nvme-1.12 | 1 
          obsidian-cursors-1.0 | 1 
                      opus-1.4 | 1 
                 pixman-0.42.2 | 1 
          sphinxbase-5prealpha | 1 
                   swipl-9.2.6 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/56c23389d030da71aac1c227a0bb648818c7bd9c |     
 microblaze  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/378ec7a7105e009545fa4ab01fe2e06d7f1befc0 |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/9e8790414f42c07ea19cd4b0348b8bb42dd4e0e9 |     
   s390x     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/bdb4336343650eeec7d1523e879413c6ce85577a |     
   mips64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/1fcc9be21f0f8bbd6466e980b4cb195abd659b40 |     
   mips64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/93f12eccb51e0bd157a2d15ba083c7903a5d5f04 |     
    mips     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/42dd811b91929cfd189b4337d8d7aaaca7edc9e2 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/2bd5691342b4dc94c50c5d6f5b245022fff0f46c |     
 aarch64_be  | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/9abdca0963f0ba25ea3e936b5cde681eb8026d94 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/5a257fbe7c89cb5818856aef68a709203dc2e262 |     
  mips64el   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/985e9268a9ceaf603f28972f30ff6a0b418460fb |     
 microblaze  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/d63cca2bf1c2aa90c363acc07f316518fb6d0479 | ORPH
  sparc64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/95ed52909d2a4b099717947a25e608849d0ab3ac | ORPH
    arc      |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/fb73584993cb7bb77099ffeab0c3196c787ead41 | ORPH
    i686     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/aeeb8cd3eb12781e9be37620a1c53ee750c5057e | ORPH
   mips64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/6b24fba4e65b2748f0fb794cb688f04f0b0d0724 |     
 powerpc64   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/2bc534e3bd3e2d221cb8b398af77369569ce6951 |     
powerpc64le  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/ceea7005952b6b14614300bce8c7fec345fdd5cf |     
   mipsel    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/68330fbe9f7e9e4dffbd7d2f914fb2b8ec6abad5 |     
   nios2     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/c2fb528577aefd21a01742e5229ce7f9101a7c70 |     
    arm      |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/973dfefa6cd2a43fea7f3501000b06454158b455 | ORPH
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/d50f399a99a6090131294e986ffd81f1be010c98 |     
    arc      |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/5fd8f13d60aee28fa8fc5e91a777f43c9adff596 |     
 microblaze  |          cairo-1.18.0          | NOK | https://autobuild.buildroot.org/results/a4364f00c0155a5b8d5af3bf4f57b7c843157977 |     
    or1k     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/9e48a2f06ae4cbdbf36c611a924ab904cb465b29 | ORPH
   mipsel    |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/ddb5835fe01a845ea939fd63a886e163bb8416a5 |     
  mips64el   |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/eb5c49b839f39413914ee9ae27e3305c1b074d27 |     
  aarch64    |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/e5c842a2ea2e0920da77b917122cf5eee995c5a7 |     
 powerpc64   |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/d806c0e78d7d2f8899bf7ba86b4ae1e2f4bc6216 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/029c432876c1bbec3415f9ded31c33c98e49728e |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/bfe490928e6fc5db71704695ecdcaa02e5d13898 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/fc1aa44dd028828906a2295af67b316b79e02416 |     
    mips     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/85c4ea91999b54145ec49924bf1133e330f40e26 | ORPH
   s390x     | fs/axfs/axfs.mk:32: /home/b... | NOK | https://autobuild.buildroot.org/results/cc60925ac8ad53a0f8b5db1698924fa435124c38 |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/99bbf0feee701aab962b86a6506e434a42b39f2e | ORPH
    i686     |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/7f3ad95c90162881ac29a44d35c69a8a5f7e7e76 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/95facac45d442f81a0c6ec8284bf9c74dcd6a8fa | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/31b8a35b57fcc83314cb79dbc3f0eddde9476755 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3552180749c2b94fd01d3943a948c5ca95178a5e | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f2dca20f17b1f5e14f9fc7d3b2590270db45d06c | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/555680f526b292f34c3bbd0bc0871a9ea947d1ec | ORPH
   sh4eb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b0e1634ddbe9d65be67bb09420e1a381adcabd3b | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6a01bb88fba96787a818072fd852e46b6be8f8a3 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e1b53fc9d8361959a3c8d72d85f7fc9ed1d9acf0 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6a33e1df404a77d2c407c3238fedf184d1aab229 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/585e23739772df43eef763290e916980221670e2 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2db8ce60917b66030286da936c1f1f3aa657b6b7 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6b04ad8b69a4688c74633e32fa4cd2256b356130 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8e020d65509181148c597997280f196c33b28574 | ORPH
  riscv64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/8d0203a20c2edf2c65c3fd7badd1ce898ad2b648 |     
   sparc     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/d27c1e90769229cdd42056bacfa60894e073f062 |     
    m68k     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/bc6a7858edc0ac3ca82c15d32618f7f6bd3cacc0 |     
    arm      |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/ffe2064ec9b1a0e693721a2c63ae148d68a7f82f |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/f7658f3b49f3640a33a64f8288658fd8c7eb7e32 |     
   armeb     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/98227342f25715c4291580dd86647fce0aa4624b |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/b851639b653118da3bbb150d4741115083ca9050 |     
   armeb     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/d6ad4d022e0348c92e725ead7a50feb56f9693d7 |     
    or1k     | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/3c97121a5d0f05e06a064395c6aca1aeaa6819a9 |     
   x86_64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/3c6d4366896100ab6b75204ec8137140d001f68a |     
    m68k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/3e9bdcc5154e6d598acd0a3a9627f57811408ca9 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/bf0e950c9d658c2102e2c99f5ad6a4df229e09bf |     
    arc      |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/7969baf801524db59a4bf846d8e988e3685f7034 | ORPH
   xtensa    | libilbc-829b08c7902ceb87a26... | NOK | https://autobuild.buildroot.org/results/bcebf693caba1fd11668116ccc20467004d0c226 |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/6a6c6ce37dbb2250b316b2bd65ed71f3ef2b976e |     
    arm      | libsilk-4268a02240c35c6055b... | NOK | https://autobuild.buildroot.org/results/72494c16e97bda0d7f04ba56305f8e576bed1bdb |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f42082334f71e8f9e5f2cc8d9cdd734117b823e0 | ORPH
   sh4eb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/952a480cf03eeaeb0c3796dcce85ba8ac57a48de | ORPH
   arceb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/efa517577a486b63ff5bf753a9c4cc01525f72a9 | ORPH
  mips64el   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/3c38273bd11642dbcba55f5f21e7bc9af80c0e6f | ORPH
   armeb     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/fb0fb32eee1f55187a8edce460768e6ef8139df8 | ORPH
  mips64el   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/1dc867cbe56c37a88adc1f711fdb882a7a7e9fdc | ORPH
    i686     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/589be2e298abb47f80f2bb6472c762d9963b7a07 | ORPH
    i686     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/3bf8357f6c5e84c3eeb7606c25f3ddce91b2a117 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/bc9ef7eecda3089264104603a08e2eadf7eddb76 | ORPH
 aarch64_be  |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/0ae0cdb0bc2dc31e824c9f38d399a342f54f86e6 |     
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/e4b8696cc4071e4582a4ab10ae1d087c3210216d | ORPH
 aarch64_be  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e5232e8b62d220c652c7adebc235cff940b581cd |     
   arceb     |           nut-2.8.2            | NOK | https://autobuild.buildroot.org/results/1efc6a72101f48cc2e377d46cb8b68fd889faa71 |     
   sparc     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/f97f141e03f1fd8f02bb526c93871c52e6c8ffc7 | ORPH
 powerpc64   |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/5fd2176e84a61af7369f00b1bd22b069fa825fe8 | ORPH
    arc      |            opus-1.4            | NOK | https://autobuild.buildroot.org/results/0ed5c0808ddabd2aa5dae5daa216351c149320a6 |     
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/13bb525cdd3dca78d0ac8b9e4a1fbb9e9d60de78 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9c6cef7ca1dfdabdac47bd711462695a24f707d2 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/6ff64a21c85e93347de86796c367ed370510cd85 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/048b55bc40b8cb60911689d04e5b479b8d6fc654 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/21434bb3fec0b119a49450c0a16e494f696bd6d6 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ad1363cf10b7db2b50fc0f3873b3b7188f248b62 | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c2d32e2b848d268951ea35a9bb135a7c3711b764 | ORPH
   mips64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/68617f3b59f2bcdee608f905b3efa881cdf4c4b6 |     
microblazeel |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/6430dd8981e75dba1a1e10554bdd975128e39b03 |     
 powerpc64   |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/5f328aa7a0944953c0bff61e593aa5a982c3cc97 |     
   s390x     |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/4c1ae878b18f8e611d0fc7fc2a7fcc49a8617e86 |     
   s390x     |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/292bf71f56081b4ed1e9c578b8e25747d8ce8581 |     
 powerpc64   |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/0ec88c3a68b96de3db68020798a5600464c84f39 |     
   mips64    |          swipl-9.2.6           | NOK | https://autobuild.buildroot.org/results/033df4ffd5ab4c84eeaea24224f5c1f25e23ee6c |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/59cc3eb1537c0364374fd79ebdd86c17f43aa129 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

             host-ccache-4.8.2 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |       host-ccache-4.8.2        | NOK | https://autobuild.buildroot.org/results/afbcb48c0a730f229832e60a71b86f66fc47e436 | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

          libcamera-apps-1.2.1 | 2 
                 dc3dd-7.2.641 | 1 
                   foot-1.16.2 | 1 
                gnu-efi-3.0.18 | 1 
         gobject-introspection | 1 
                host-go-1.22.5 | 1 
              host-rust-1.74.1 | 1 
             kismet-2023-07-R1 | 1 
               lighttpd-1.4.76 | 1 
                linphone-4.4.8 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.8.12 | 1 
               pulseaudio-17.0 | 1 
          python-grpcio-1.60.0 | 1 
            python-scapy-2.5.0 | 1 
                       unknown | 1 
x264-baee400fa9ced6f5481a72... | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/95807e7014fb74abdee674016dda5e0b987f5ddf | ORPH
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/0876e2cf81e45ffaff7b2d7facdb653f576b6d09 |     
   armeb     |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/9b80332298cecbec0f075c6fe64f0bc4a35babb5 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/aaad5ff2d30f7d8dd84661f34a886a9b199334f5 |     
  aarch64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/b54d892c99879f2d3bb4be3937cb38b72b99dd8a |     
   x86_64    |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/a60b40a30b6d4449230ee6ac3d29f1f6758a5188 |     
    mips     |       kismet-2023-07-R1        | NOK | https://autobuild.buildroot.org/results/0d3045356886b98b8bd11e2fb083509718c055cb | ORPH
   mipsel    |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/b40fbfb214b8fd4a833e19d4170c1bcf4edaa8a5 |     
 microblaze  |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/d6b4e3a9b43036f9a57ae75407b0c2539d4435b3 |     
  sparc64    |        lighttpd-1.4.76         | NOK | https://autobuild.buildroot.org/results/8fcfc74962a79d61a233456eea61150cc2ffb29e | ORPH
   xtensa    |         linphone-4.4.8         | NOK | https://autobuild.buildroot.org/results/86ca79340d528ed73c8314c042841215a40eac73 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/23ca3e3a316e749d15ebe39babf099fcb0fe9aa8 | ORPH
    arm      |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/a714e0b88e1c0b3f7d4032df7a94577a47dfefca | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/8879086830d4e2686d46170294cf2375597d8019 | ORPH
   x86_64    |      python-grpcio-1.60.0      | NOK | https://autobuild.buildroot.org/results/a16a3ff848f142c031e25f6bd4c13490c809ab11 |     
   x86_64    |       python-scapy-2.5.0       | NOK | https://autobuild.buildroot.org/results/e4dfba41de72b47384fc0d1110c3147c9d3bdddb |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/1f56b4d1045b6eea0cabf816e1a2d0f9d9b4a7f3 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/8678a7e44ba35cf34ff3fe4f64fc5d46fc938e66 |     
    i686     |         xenomai-3.0.10         | NOK | https://autobuild.buildroot.org/results/33a81a8efe0545c02239060b6fdbe4a1075e2fa7 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                  bind-9.18.28 | 2 
              fluent-bit-3.1.3 | 1 
       freeradius-server-3.2.3 | 1 
                  linux-6.10.9 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
              luabitop-1.0.2-1 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/de676c44b4441298127671eeb5c5b4200a5f60f6 | ORPH
    mips     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/a41e45098f26296829443ae3f250cd203d051c44 | ORPH
   mips64    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/7bb6e6829d75ca12881c4f812bc949bc3fee5f6a |     
   nios2     |    freeradius-server-3.2.3     | NOK | https://autobuild.buildroot.org/results/a8e3b681e462f0311d76df1a24939538adb53d09 |     
 aarch64_be  |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/5c28bd03357975d54e348bb88a49d7188f11c3b1 | ORPH
    i686     | ltrace-82c66409c7a93ca6ad2e... | NOK | https://autobuild.buildroot.org/results/ff3f33d0bc976f86f955c590099916653cb6810e | ORPH
  powerpc    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/9e84b38f5f9beff9ba5bcec4745837f0a5877eaf |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
