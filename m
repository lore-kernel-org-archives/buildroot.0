Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02760CD6E52
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 03:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64D88850C7;
	Sat, 30 May 2026 03:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzc8xaKKm7Bs; Sat, 30 May 2026 03:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2EF8850C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780111155;
	bh=d0DkB9wulxEeUShDkjxorcwASGvd4dgtPGCxOGMmgo0=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HHPrfWmXeF1vqmyASHlDaKXsp/0Xq3UWsIuUbTgKBR/rIY04BGFLY9AKkzQdlGFA3
	 3ocj7lAFZ0T38UiG8RMBgEtmh0b7TutBpM1bLVedEh9W1mqbjYAFx9+dZHCIn3FyTm
	 cfcShe4qJm5u/Prv78uRXuxFT9y8G7v14T0d36PaSyI3gSWELCoCzEHw0xItybTo3s
	 EZ2Uczojz+gM/pIyMeK88uwwunsH7OZ8SN66AqBdWgJY5QuXGR/8Qyvc+ltdPjynrr
	 S3vyYBuYcL0Jhy4bQ0E2/oQex0Edhn0kFTfkS0g030cj9ZgDIPZmSrUFs38V5Fs2L6
	 ZyBXW4EbPo77A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2EF8850C3;
	Sat, 30 May 2026 03:19:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3A76D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 03:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2F4C42588
 for <buildroot@buildroot.org>; Sat, 30 May 2026 03:19:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dZRzdvsbogt for <buildroot@buildroot.org>;
 Sat, 30 May 2026 03:19:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A59042584
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A59042584
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A59042584
 for <buildroot@buildroot.org>; Sat, 30 May 2026 03:19:11 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-45eeea039ebso949483f8f.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 20:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780111150; x=1780715950;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c2cxFrq7O9hCUxsXpLk+nJJX4i2J6iWIVbIhRw973o0=;
 b=J6cO9QaYnnvyEAQsMhB0B/FgVCkgcw5ysbUrPaPU7iSmC6FixyB4zH731uNxa8uplI
 6N7wNESuMuTlQfMoVi7LoTQlJylUmbXs0VZW+UdUuwuMfZ25HW3xxqvw5MdHp0ZEQxRV
 G9g4oZHnZZDweuyLS9AgMahU0t228UAbePLaEndfFl+Hlkne5yU1jCKzOVXMMOaFkInx
 x0xs9fd/3GlUT8ztikkTyvQEI5XqtJi4iLXQahHYUjc2o/Y1hA3T1CPFLqKmc7q9jj1K
 wByFIAuagbhInYnLLOq5uuLvVcXn/Hl7YfqmQlVCABm1kwqIfNu9ZpXFrfrA27H+UBt3
 6yaw==
X-Gm-Message-State: AOJu0Ywt3AcJziy1jOXTTTqHdOeZdgj9Ld2RsJsEZ+VILcUqyvpi9g7c
 1K2lJx78rHqCc6mVche2smt6IQPlfMZZMbOFhe5QZiV0d5ogyMxA2+BR064ft8tE
X-Gm-Gg: Acq92OGXQvRNI3gNA5n/sJX/7YlqyOLSlxsX2/fqhxJjKmGa3BIRwUI0KojAmjkteGP
 PbzbVBQSxDJhaOxdR/rgwAiuD23CAuALy6Co1DQiSz5docLsHY3Tz23VWa25r38uby8m7+PwdMx
 C4Bs90Cn45kcdUJN9Ze/Aka4zdgUW1UqTcWcbh/7RAldnSGCwj8fZKVuGo4VntTn8vh1Mzx6XFu
 ZqklcR2vEZ1UpR0qt6veH3KFQth5Ds1WF+SXUeM5CAJJUYruoneZkA6JInqyS1En4eZ3k5VBoc5
 b0w5BxUvokJLhHkOY/iT78B/l81XuUbfYfSBajWEJeeBTUZ8bpa53HdwC/XVQJ8PWd8dOGrsB0j
 PyBrCA5C6rJmW4qM2jmpW+C32jawckZJpOWVPfQbIdvSWSlXRJPioflc17u7U/X/iR9hApdQU4p
 lnf7srjm/LZVJtPiEmpMiJE8fRi01ueSnAwLOf
X-Received: by 2002:adf:e684:0:b0:45e:f31a:7ae6 with SMTP id
 ffacd0b85a97d-45ef6b8aadbmr3022824f8f.30.1780111149612; 
 Fri, 29 May 2026 20:19:09 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef35874b7sm8110345f8f.35.2026.05.29.20.19.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 20:19:09 -0700 (PDT)
Message-ID: <6a1a572d.bb4da8e5.e30ed.da07@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 30 May 2026 03:19:09 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780111150; x=1780715950; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=c2cxFrq7O9hCUxsXpLk+nJJX4i2J6iWIVbIhRw973o0=;
 b=rYO0urMM/ohjTO2xh4kvY0LToFXnWkjyUQBExErWdWUqEcnh4aIgYBhEX8H118Lr0H
 8XY3Ip0n4Fa9IAmD7HgJNJ31qZ4R6oXlf653DrVtKTE72aXIFRo7fsFt59ULFdGtdYLz
 uWTlT686BHGjBWTwc9i8PWfFk/PDXWS8S+7M4WZrd8dUGBfAQH5GxSkhh53iZtPbvIk7
 XyOIHyTtDLObItcwJSppa+JQdTTfwijQtE+OcmJ/stPcBEiuyyfcaAAZMeS7Fx44tZok
 zibwQ+uA0fZcpZjd0J7s6LsB/bngGkBVX4/MhPBdq9oQ9eVI2objSiEYkMBTDaoBVpED
 2MNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=rYO0urMM
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-29
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

Autobuild statistics for 2026-05-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 11  | 16  |  0  | 27  |
  2026.02.x  |  3  | 11  |  0  | 14  |
    master   | 22  | 48  |  0  | 70  |

Classification of failures by reason for master
-----------------------------------------------

             util-linux-2.41.4 | 5 
                  stunnel-5.78 | 3 
          cloudflared-2025.8.1 | 2 
               graphene-1.10.8 | 2 
                 libavif-1.4.1 | 2 
      passt-2025_06_11.0293c6f | 2 
                   perl-5.42.2 | 2 
          chocolate-doom-3.1.1 | 1 
                coreutils-9.10 | 1 
                   dante-1.4.4 | 1 
              fftw-quad-3.3.10 | 1 
glibc-2.43-27-g4070d808bea1... | 1 
  gobject-introspection-1.84.0 | 1 
                   guile-3.0.9 | 1 
          host-binutils-2.46.0 | 1 
    host-mender-artifact-4.2.0 | 1 
              host-rust-1.96.0 | 1 
                  iozone-3.508 | 1 
                  janet-1.41.2 | 1 
               libglib2-2.86.5 | 1 
         libhdhomerun-20210624 | 1 
           libmicrohttpd-1.0.5 | 1 
              libopenssl-3.6.2 | 1 
                  linux-7.0.10 | 1 
          lua-lunix-20220331-1 | 1 
            minizip-zlib-1.3.1 | 1 
                  ntp-4.2.8p18 | 1 
odhcp6c-f19dd37fb467c9cf10c... | 1 
python-remi-2022.7.27-37-g1... | 1 
                 rtptools-1.22 | 1 
                   s6-2.13.1.0 | 1 
           sane-backends-1.1.1 | 1 
              skalibs-2.14.3.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                 sqlite-3.53.1 | 1 
               tcf-agent-1.8.0 | 1 
wilink-bt-firmware-43fca73c... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |      chocolate-doom-3.1.1      | NOK | https://autobuild.buildroot.org/results/0da5b200e220a2b85f431166e3878deecb452ae4 |     
   x86_64    |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/e37560a71ac092d4396ea3cf5fd4b59675d592cb |     
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/d129f93585039a402ac8cc6f819c5569bdd29b56 |     
    sh4      |         coreutils-9.10         | NOK | https://autobuild.buildroot.org/results/ff46b1619e7029864acac7686e67484ab2fc0e0e | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/675289e275fbfe7a60eae3b08d6e8972e7216f9e | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/66cf282ce9513147533dfffd653ee6eaa41ba8bf | ORPH
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/905c7e8db0f8b9014f26925c6e1379a0c54ad446 |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0cabebd23988ed8035db4f068eca2ee403eb5c4d | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/4204a95fcaa860c85a39dab155a2b5bf254bcde5 | ORPH
   mips64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/82d9638d9b1963f7ef7359107c2a1e1f65e80106 | ORPH
    i586     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/7c16c0b7742c2e64d4302400d3965ca73a47f666 |     
   x86_64    |      host-binutils-2.46.0      | NOK | https://autobuild.buildroot.org/results/ecb813482d47571552bd39f30c349cd3479ebfe6 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/88101052b3a2d37cd069e15d43846a0ff4869ddb |     
   armeb     |        host-rust-1.96.0        | NOK | https://autobuild.buildroot.org/results/18b5fb272346335d3617eeb47d3db16104acfbdf |     
    or1k     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/401378fa1211e7fafcc183229ed75b0fc95bdbfc |     
   xtensa    |          janet-1.41.2          | NOK | https://autobuild.buildroot.org/results/1bf080fabf7bc2cca0ae41f4781692c33277797c |     
   sparc     |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/3aac63d9f535c12e3803afff665c55ecc9d0c491 |     
   sparc     |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/6f7599b11fcf53b3b74c659452f4bc03aba7b302 |     
    m68k     |        libglib2-2.86.5         | NOK | https://autobuild.buildroot.org/results/b5ae87b40fa9a55708eb9ae3e8e2e3dfe1eee5d9 |     
    i686     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/c2ac849371a5606b94f50d5cf718eb7abe0774c0 |     
   s390x     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/e1c9f2d9a50581fb687a4ce45f3581cad50c92e7 |     
   mipsel    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/21d999f8f75fa5134b3d11f54478338633ca253e | ORPH
powerpc64le  |          linux-7.0.10          | NOK | https://autobuild.buildroot.org/results/74f58640fbadd12c981220387e01e4ee9b2f60e9 | ORPH
 aarch64_be  |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/1690f6a630627c4297d1da9394a496d2d11a31d7 |     
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/67907b027fa11e69a870c56a33683a9625e18314 |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/05868e35d6c93473338ed9d570f11ff8556e73fb |     
    sh4      | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/0b40e937c40f4bf1fafdd3e7ebfa5e48c19f0efe |     
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/46e4d72f90669fec4ef3aa25d0dd50ff44091567 | ORPH
 aarch64_be  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/de6e0eec049aa7e8da4a955ef887f074d92db459 | ORPH
   sparc     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/9b432cd9270a441db5bf8ae87ea0e8b8294bed7a |     
 aarch64_be  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/aab4347beb64a7c1e02fee1f9d52fad1feb86696 |     
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/65371bbf7321da18d25595795fbecb577bacf711 |     
   armeb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/ba926ec4f403f484a288518af352cc785b746069 | ORPH
    i586     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/e83eea2012564dd2c7bebaa4de0a32ddee8fd13f |     
    i686     |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/a53f75dde8275675cc4fe732e7f275f98e0208a8 |     
microblazeel |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/b17aeec2620dedc18d5493688df0fda815eef994 |     
   mips64    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/a6385f1924c12733342534ae67f7537b52e2cd9b |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/2cf21594c5b3eae80712bddc7aab0793aa291ec3 |     
   sparc     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/77e94f366375ccab3d27fbf7f6d2847506100895 |     
 microblaze  |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/112624a8e7d0e1785e344eea0d70fbbdedd287f8 |     
 microblaze  |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/9b644ebb514c1c684ff688bd92d607eb10e510d4 |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/967a93a33a7585fe328bf27062f54e6b05983c7c |     
  mips64el   |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/f195d276ede51559c0dd938939c0081cce13e3cb |     
   s390x     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/7062530457bba2ca5b6dc961de3e9cf33f185e37 |     
    sh4a     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/67902707ade02cd1e6a4726c9379ca7e8348370b |     
powerpc64le  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/49ea10b01433f89f359b9e950ce7cd0c11a15500 |     
  mips64el   |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/1de44c9d2dcbb89bb57f6fe041f9ed99e8473c57 |     
    i686     | wilink-bt-firmware-43fca73c... | NOK | https://autobuild.buildroot.org/results/a4babf095fa3a031f76b9e81f89e617f032aecab | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

libdill-32d0e8b733416208e04... | 4 
 docker-credential-gcr-v2.1.30 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
          host-automake-1.16.5 | 1 
              host-rust-1.88.0 | 1 
                     kbd-2.9.0 | 1 
              libopenssl-3.6.2 | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/70bbb194a561411e9b90a5e0524f52b86d23a659 | ORPH
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/2b353edb24137e9d80ce0b49ee25dada6e65b9bc |     
    i686     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/5f029c6fe4b43b2b639f71c2583501182a12ebfc | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/e4fe485fd411358048de812f435f98cdadf9d16f |     
   armeb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/0bc7b467cf0653d69aa3ae4194f78c2ae708db75 | ORPH
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/de7331352932965a467570a0ddfe77409b5d901a |     
powerpc64le  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/64cd97eed2e749f0ea6c6d1ffc408d8cf4a93557 |     
  aarch64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/f8545fcdf08177432687d016a2c669a6120a73ee |     
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/feca8c2a519050eb44ce277246ed53a2443ad40f |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/c36f4e95bc7e9b181c0d372187958200bb977114 | ORPH
powerpc64le  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/855dece19933449de53d13db508990ae74f00cf4 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   exim-4.99.2 | 2 
                 gerbera-2.4.1 | 2 
 host-softether-4.30-9700-beta | 2 
cegui-00b4e1fe174da53b7ed72... | 1 
                  iozone-3.508 | 1 
              libmodbus-3.1.11 | 1 
                 libzlib-1.3.2 | 1 
                 linux-6.12.91 | 1 
        ltp-testsuite-20250130 | 1 
                 openssh-9.9p2 | 1 
package/linux-headers/linux... | 1 
                    wipe-2.3.1 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/9a45161ee82bfdc7ca1a7d8d1e06cdff00fd23db |     
    i686     |          exim-4.99.2           | NOK | https://autobuild.buildroot.org/results/0ca7743e7144f635d0b915a101648d90e61d2de2 |     
powerpc64le  |          exim-4.99.2           | NOK | https://autobuild.buildroot.org/results/89ed54e483bec77c6acee44b8add60178c5caa2d |     
  aarch64    |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/0ccc9fc2736322eea918e5367d215bd159ba64ce |     
    i686     |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/4d6a18a5044f1b01e2a077a27214ab865a7eac62 |     
    m68k     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/1449965f4c7f2974272f39403d93be77dd0b1076 |     
    arm      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/83e9c9757dd3e403c8fbb12398c477c6a00e463e |     
   arceb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/db8963fbdb13969d93471c6d1e3407dd8d67a0fa |     
    i686     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/81d40981e4fceac5757fcffa50a7c9aefa614fe6 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/fc5ba1dc213e8ae0b4bdd0cb091b8256b7ff9404 | ORPH
   armeb     |         linux-6.12.91          | NOK | https://autobuild.buildroot.org/results/b6c92ba471913e96e19783c620534142110cdec7 | ORPH
   mips64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/f5764d1852c812a8f754a97bc2fb2b615b46f271 |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/2689e6060c5250384b64ccb4fc54dce114307472 | ORPH
 aarch64_be  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/1f13b1873adab892152a7cd2035b1e7c04248fb8 |     
    i586     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/96927e8ee6b41ecf4719dc7adfa4303f384e3041 | ORPH
    arm      |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/9375374d21b26fa8360134624d4756971b40abfb |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
