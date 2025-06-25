Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3123CC7115C
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 03:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB5E44070B;
	Wed, 25 Jun 2025 03:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qzyarPqITba; Wed, 25 Jun 2025 03:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DB1240806
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DB1240806;
	Wed, 25 Jun 2025 03:15:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22B0D767
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 03:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 090AB83D60
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 03:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8SaGLMevo0m for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 03:15:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C3B583CAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C3B583CAB
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C3B583CAB
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 03:15:13 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-608acb0a27fso9331259a12.0
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 20:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750821311; x=1751426111;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q4EoagtsKR05JpNw523ZN6a+HPNOck8bwb0uzgwQPcQ=;
 b=G7YHr8aFKIWJNlLZd1R7KZ4BETnvQH27PNXp9xJ6i3D6c9E5M0I5c9IIcBjVjLzsJM
 R8Ej0A/NafJNApNJIFJOcHi1k3BWTL4JtBbEH11dnmgQpe8DKVgBwQuLLQRD/XlbvCWX
 XFJvISph9WvIv5+S+sp7cDT3aptHSy+8Cj8yb2rJqFKHTyZumI+P21gP1ahiZm+rLTcN
 oEIbYt5RPNu5TxvesMfiDk+JOdgRmvsc6ZH0CejynKSUj/U5v4gAJ2JFo+zS8Ca2zR0o
 hxQlWCICv9g74SWAOaqGJEdIJ9jrIqL4bHZQc0f+oAWxgI/nFm9s8Zp9kldEYzFqVMhA
 o36g==
X-Gm-Message-State: AOJu0Yym5faB9iP/d3KSopusYjWgMkeIO2e6wxX2L8n/W9jY+AJk0sHB
 JGduFc7suqH02Rmeatga8WAKzMKivNZTQ2wV4e0tGJjwbLtWXcjMmII9TnfUiA==
X-Gm-Gg: ASbGncuNpsT9aShEgA6+XT+o/iqoKu4feOaR3e4rMQV76P4ZsBGrhSQt/dbDRas7VSE
 LDK5ETMWa/Pb0JdrOhWA6tyIgytvQbYwJ3I8X6+by3k++dXdVxmrgFPU7WW9SmzP5xYcAHxXV7q
 nb2QK4I1GJ9xwL4TPnVbWdkVV5dOlnzSTxz167+Ze50FKKnTldaMbdkIUW6Qhn5mLEP1axylchf
 euPTClaDW9wkcuS+0IpwmRU98EJtZYbT6TIlZAkwpXuv/CeWiZVTZX0W4FTRQkR75yQ116T+Rnw
 jqu6Weadw3Fzjcn2WCYcg0WsqyNlXarY/9xSoIUiBa67Kr9r79PL9luXcaQ6aqGdYA==
X-Google-Smtp-Source: AGHT+IFPEHsqQsrQnambymFSJucEwnm6NIUvqM/4W1NNeht0l1AnQ1Pu0egugcEwcEAfHQX+XT5VkQ==
X-Received: by 2002:a05:6402:40c5:b0:602:36ce:d0e7 with SMTP id
 4fb4d7f45d1cf-60c4dc28757mr933418a12.14.1750821311253; 
 Tue, 24 Jun 2025 20:15:11 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c2f482e81sm1865306a12.53.2025.06.24.20.15.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 20:15:11 -0700 (PDT)
Message-ID: <685b69bf.500a0220.323cf7.583d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 25 Jun 2025 03:15:10 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750821311; x=1751426111; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4EoagtsKR05JpNw523ZN6a+HPNOck8bwb0uzgwQPcQ=;
 b=k/k5yI2nIryd4us1HZ02x91gYJ4HvJjADvR1VdSdhNLiMtOSQ03JEsdN7dG86pJ5Gc
 buPmp9YIipN0ryS2kc64htpYmZQC0yhvNvYS5nURHmZO6fSOmED0lHwonS3N4IUn5bKh
 1qtIJjSI523VNrtHDhcH9Y1JA+UvvxPPyjHsIxFq08BIcOEEMDGYCuvM6CpM87g0YLid
 rYtoePtiim8oX9AoLQU3qRKc5OojFx5NVwpesO9W41JH/Gvftp2JcAYWDnES+0Lq0vNl
 D+85v342ez196MyP+V2nOqnkXbb9bbd82mKwOt24rep0EJmSMpzNuX1xmyQYo5moeEYE
 jLUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=k/k5yI2n
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-24
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

Autobuild statistics for 2025-06-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  9  |  0  | 13  |
  2025.05.x  |  3  | 11  |  0  | 14  |
    master   |  3  | 35  |  0  | 38  |

Classification of failures by reason for master
-----------------------------------------------

          host-binutils-2.43.1 | 3 
             libargtable2-2.13 | 2 
          aardvark-dns-v1.14.0 | 1 
             batman-adv-2024.4 | 1 
               bctoolbox-4.4.8 | 1 
      docker-cli-buildx-0.16.1 | 1 
                    gcr-3.40.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
             gupnp-dlna-0.12.0 | 1 
            host-binutils-2.42 | 1 
                 host-gdb-15.2 | 1 
               host-parted-3.6 | 1 
              host-swipl-9.2.8 | 1 
                 inadyn-2.12.0 | 1 
      input-event-daemon-0.1.3 | 1 
                  janet-1.35.2 | 1 
        liblog4c-localtime-1.0 | 1 
                liboauth-1.0.3 | 1 
              libopenssl-3.5.0 | 1 
     libphidget-2.1.9.20190409 | 1 
              libselinux-3.8.1 | 1 
                libshout-2.4.6 | 1 
libwebsock-3c1615eeadb0b582... | 1 
                 logsurfer-1.8 | 1 
                   nanocom-1.0 | 1 
                 nettle-3.10.1 | 1 
                  ntp-4.2.8p18 | 1 
         openfpgaloader-0.11.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                   trinity-1.9 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/5388c4096a20a4e682a6f98fff96dd233c487691 | ORPH
 aarch64_be  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/daeb9c00fdb77530111b4ced21832437f8bac010 |     
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/73d8b5ee4ca19dc4708f21d63fc82a9f827793c4 | ORPH
    arm      |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/a7b6fde39c4769a60d68480afda0a284c611dbb5 | ORPH
powerpc64le  |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/93ad8f161d0c4acf76ed91f170064693b4ea2335 | ORPH
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/67475b6ebadda9431458c1851eeb3552a8af06f6 | ORPH
   mipsel    |       gupnp-dlna-0.12.0        | NOK | https://autobuild.buildroot.org/results/cc8706f596ae2f21bec34e80272968d446a6ecc7 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5d0cb5b754078568f2a009936f6698272531f14e |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0b351183c2cace4368f671d7f85e513fb8139147 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/441acc333aaf0610ccdcf6c51af81585149af47a |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b2d62216b789f2b170b42c2118f0f492723790b3 |     
   s390x     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/73c4f49cca521361ca4607399654a57840364879 | ORPH
  riscv32    |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/d8776bcc260eb9f60c0dd445cfdcf031a6297ec8 |     
  aarch64    |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/2ba7db6e8ce651dc34f3845a36471dc1985e0680 |     
  powerpc    |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/745e536a07fb98ea4689be73570012354d63eaf2 |     
  powerpc    |    input-event-daemon-0.1.3    | NOK | https://autobuild.buildroot.org/results/7cbfe55fd6e3985646ccb7ad78a78c796f83d0dd | ORPH
powerpc64le  |          janet-1.35.2          | NOK | https://autobuild.buildroot.org/results/39a93dbfce654cdad278c5a87d313b8736a1ad75 |     
    arm      |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/8213fe56dff69adf13e398b27665cc22a5a9a6aa | ORPH
  aarch64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/b49422a14ca41e0a4dd6fb9a0df49ee1952ccfe1 | ORPH
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/621cd8bd84ccbc50d8310e0312d4dffae5d446ef |     
    or1k     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/93931b938c7dcf2d46d6619dc84552d7db43c983 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/9c502a12251c1ed02e1eedf42d7aec2e54d8d6f7 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e9ad27e14b71efe76d16b9d24ac05ecb5b7c29e8 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d62cc5d69156354b46bad9add60516fef0648688 |     
  mips64el   |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/a576ced80bc6877a3f11695228b3da82fd03c06e | ORPH
 microblaze  | libwebsock-3c1615eeadb0b582... | NOK | https://autobuild.buildroot.org/results/1e91b9740a2d96f5359916fe6f9e307e137db3d1 |     
  mips64el   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/9676ecab6c4b12e45b9d3f45948e7e60d17445c8 |     
    m68k     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/d11a104da7b0cd779165e64e0a5257199f11228c |     
  aarch64    |         nettle-3.10.1          | NOK | https://autobuild.buildroot.org/results/e0b3dd50321a491c360f2f4e385f15c586bb4c8f | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5c2ace8d96c7ddddea45449425c35aaf55a04987 |     
    or1k     |     openfpgaloader-0.11.0      | NOK | https://autobuild.buildroot.org/results/cfe23fe42f446cf37091a8edce8369270cf5c32f |     
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/9c586b4d7fb4ef1e2d878c8213b3f93cf83ad4a0 |     
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/7d5c90aae6b2f736d18eeb255c36b09a1d40903c |     
    mips     |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/93a9d910d74d3cc37ab4922498c65cca0faaaae4 | ORPH
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/afb041f7a1da050b4b6deb3f10f1b35e5a93ec14 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

            host-libp11-0.4.12 | 1 
           host-squashfs-4.6.1 | 1 
                  libbpf-1.5.0 | 1 
                 libgee-0.20.6 | 1 
                libmpeg2-0.5.1 | 1 
           libzenoh-pico-1.2.1 | 1 
                 linux-6.12.33 | 1 
                  ntp-4.2.8p18 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/63b3f6b3898df864792bf68b7f39a949aee3607d | ORPH
  riscv32    |      host-squashfs-4.6.1       | NOK | https://autobuild.buildroot.org/results/90032c7ec831068fa30da4f476305ede038e1591 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/aff4a0cca8429abce22dd675515fdd9d1c4681d3 |     
  aarch64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/c58120f6c12005e814e0ae35fc0e4fde11e61c0d |     
   sparc     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/9a72dcc5b8d940bc20b82ed6e0d2aa30e5c33b79 | ORPH
   s390x     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/4a11277bc8da844efb8ea747c4125d3cbb46dea6 |     
   sh4eb     |         linux-6.12.33          | NOK | https://autobuild.buildroot.org/results/516a36f821e64039a7e1192575b0767d49d64589 | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/576af8ab366f62ff29c7a9b3a212952574980707 |     
  powerpc    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/951bfb6ff68ca47c73737d2792e9a22d64565b0a | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              libopenssl-3.5.0 | 2 
                 samba4-4.21.4 | 2 
          aardvark-dns-v1.14.0 | 1 
               host-parted-3.6 | 1 
                libmpeg2-0.5.1 | 1 
                 linux-6.14.10 | 1 
                   perl-5.40.2 | 1 
               procps-ng-4.0.5 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/7960417982b191d870d15679a6a89f277c1a91cb | ORPH
microblazeel |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/15b0cdb07de6a4f069bb8d6a53163c892fe78142 |     
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/edeef6a480350880b12eebd94654644e43c2670e | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/f83bbe60b09396c68a658599869f223d9b56d49e | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/0f91bf06fa7bca2c4b1f445d0f4c94582adf87e1 | ORPH
    mips     |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/f957c46b2c7e5ca1b3a6db189573abdda0d5feae | ORPH
    sh4      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/2c12a4ae8b93e9a2ca1ef69e324ca29b5e7f8970 |     
  powerpc    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/21b9b0f997fc128d91a0480ce8495c74b2246a1c | ORPH
    m68k     |         samba4-4.21.4          | NOK | https://autobuild.buildroot.org/results/40369df829aa6410155985bec967b30dd6702af3 |     
 aarch64_be  |         samba4-4.21.4          | NOK | https://autobuild.buildroot.org/results/d2a6fff1f3f0e35633bf220a28505cb5cd3a81f5 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ebb60b4b1e0b0ed67b6363ee8f85794ed589f79a |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
