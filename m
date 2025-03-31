Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2C8C3600B
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 11:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2889F60D66;
	Mon, 31 Mar 2025 11:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nx8CmA1pscFA; Mon, 31 Mar 2025 11:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 174F760C2A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 174F760C2A;
	Mon, 31 Mar 2025 11:30:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4A3F121
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 03:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D70C240542
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 03:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJ6f2EDhWbBS for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 03:19:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 618834052D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 618834052D
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 618834052D
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 03:19:44 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso606668966b.1
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 20:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743391182; x=1743995982;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WpnxQ4oOLUkh9iti3QlPasG+SzVK3o7B+IFyjgKSznc=;
 b=vyLtMGfN1NuI0chAOnimwEbc4SxzXhNCPN0eUS5iaQjgIj4mAMYiq0/oOXN/NKWVHF
 beapHLfnqbM+vVKYUEs5ut6AcDywlX0pApbGUwI0dZ72aV7XWtNVpAfcH4hv2ec2iUxp
 kTdBFh9w5BeEVvWAbPPdD1KEGFWYOfOkLm7WYAhmBBMFBgqnZnEK1Yuaqi6wVKx2/qTJ
 4tXhSnGy/P2yiPivN6bpsxb5XoT1+Hy/VMNyxickbLlT606+t8RTYGAwFQG0OMXpI5gA
 I900f9KnPc5N57XPwo0xtWlcmkkC3gU2meyeQcxuZcgjZKQPueZFAN4GTCVbWZqsxB2w
 374A==
X-Gm-Message-State: AOJu0Yxwp4+VZDa2OdajYFm4cfhNhjgmm78W56wqt0deHmq/teERfrPW
 1m7TewPV9XOgk8UTMfs/mMZYwBw7vaPxZbsQILE5YTSCvDhUKzMCToJbxA==
X-Gm-Gg: ASbGnctWczEe53ZAJCN0OBzvzcw20+YMfZB1Ni1P+IuwVQXIOJ4Ly1K5NY+nC3XyG4H
 9GQ65yIeBQAg5tfLl8c8oFP9alumxLGRYSLVAYORVrvKOrJyh3NdrvVBbqb4QS6mIi4xvk0pMbT
 y/WG9A6ttVRQMjC32ZN45SzUh4mpHPtrp7KdsWm5ODOaR4r4baRFJAY6J67x4o/ZdOhTvnsaSZi
 +0/pXcO49Uu+aIo774WedjUVqj+svCZq/zLYEWEDWGM9FZ4U07fT636WWimwdOfyNtbqwqo2XjJ
 b5l4f7+cfxW1JJq0by/Av8MN1pymXaJn13+p+AsCXvFDICGo
X-Google-Smtp-Source: AGHT+IGCOlnqUlqoDvO1h3p9az02PlXYgN4Rn6HUKCcyRNxsjYzr7h88CRV9S6bEsEp2vLMDHPSrhA==
X-Received: by 2002:a17:907:6092:b0:ac6:f97f:a010 with SMTP id
 a640c23a62f3a-ac7389e6ba0mr676081066b.12.1743391180735; 
 Sun, 30 Mar 2025 20:19:40 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac71922babbsm558342266b.5.2025.03.30.20.19.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 20:19:40 -0700 (PDT)
Message-ID: <67ea09cc.170a0220.349b6b.2f73@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Mon, 31 Mar 2025 03:19:39 -0000
X-Mailman-Approved-At: Mon, 31 Mar 2025 11:30:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743391182; x=1743995982; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WpnxQ4oOLUkh9iti3QlPasG+SzVK3o7B+IFyjgKSznc=;
 b=RtkPDyxStwO53NKTHsuIQBnb/9207lZCngpu/wT0rvV8qUqrjVN4OrXoeG1rLBBoKW
 i0egtB7e95sYaIr5hOy2bFWdu2IQsvo/rZhFqwjA6/6MNx86wPeyMgs/NZRqei5KniqP
 Cxv9gP71Sjw7iSZqbqalMvNCDukv96uCRDtZKXsP/EiHp2gfI7xICfV2kjoEwB6QEGlI
 nbQRvqitqd2re8dQdXXh91OYyqFth/Ccj63/J0ekdTLWX+4+qsFCCg2Kj3mZY6WWeOJm
 i2ghhezQmNuuQFUSbLNyx8lTPr9y+8BMlnoinoqHMHEAHgBKRiKuAexW/Hixozd2a1eT
 2TJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RtkPDyxS
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-30
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

Autobuild statistics for 2025-03-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  5  |  0  | 10  |
  2024.11.x  |  3  |  5  |  0  |  8  |
    master   | 13  | 932 |  0  | 945 |

Classification of failures by reason for master
-----------------------------------------------

             host-cmake-3.31.5 | 608
                host-m4-1.4.19 | 92
 host-binutils-bare-metal-2.44 | 47
            host-fakeroot-1.36 | 36
          host-binutils-2.43.1 | 30
               host-flex-2.6.4 | 23
        host-util-linux-2.40.2 | 18
                       unknown | 13
               host-attr-2.5.2 | 10
             host-libffi-3.4.6 | 10
         host-libopenssl-3.4.1 | 9 
               host-zstd-1.5.7 | 7 
            host-binutils-2.44 | 3 
     host-ncurses-6.4-20230603 | 3 
             bluez5_utils-5.79 | 2 
            host-binutils-2.42 | 2 
               host-gawk-5.3.1 | 2 
          aardvark-dns-v1.14.0 | 1 
               cracklib-2.9.11 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
        gmrender-resurrect-0.1 | 1 
              host-bison-3.8.2 | 1 
            host-coreutils-9.5 | 1 
            host-pkgconf-2.3.0 | 1 
                 host-tar-1.35 | 1 
                  libsepol-3.7 | 1 
                libsoup-2.74.3 | 1 
                libsoup3-3.6.1 | 1 
              libunistring-1.3 | 1 
                  linux-6.13.8 | 1 
               mariadb-10.11.6 | 1 
                  mbpfan-2.4.0 | 1 
                 pkgconf-2.3.0 | 1 
             python-webpy-0.62 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/5ab7ef665a4029a9d86e127268c302eb73b21ca1 | ORPH
    i686     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/b622f67259a3c5e3d1047764c5770c2e9e30bf59 |     
    or1k     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/dc40a45663bda284ee0969f57af9f10470f22802 |     
microblazeel |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/289d32a52ff604096d46a4a38573ce4325a19bc0 |     
 aarch64_be  | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/82b4a69273ac598229d627cea6e5b2580984ae34 |     
   x86_64    |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/4747dc865cb1a1fe96f4780acf6d422496e03d8d |     
 microblaze  |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/10f763d16862ff27edb07e030e036f0d0234cdbc |     
  riscv64    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/24f6946f057a438882cd9274e604aa66c1347398 |     
   armeb     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/86cb7aeab8de95b57c1f159bb81ea6882963f6f4 |     
    i586     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/28c0a3546b5e4dcf1993979e99f32ad2c3d60e94 |     
 aarch64_be  |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/a334c6821017987d7796e62db993d4e80f66f3f4 |     
  aarch64    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/ba338e5a69e22857bf9c7b349c35aeaaea4e7036 |     
 powerpc64   |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/053763150aee74f59a1ece7d633f953bfb00f918 |     
  sparc64    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/c3e2b285d0797fe4b889c5c8a012e7041114a618 |     
    mips     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/e9aacbc7ff17064f60f1a4c865cf720d89d8ac34 |     
   armeb     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/e08836e15410c7ca5e0b91f2e90bee363b54f615 |     
    arm      |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/df32ac46c9cb98dd54b70391f0a565b219255af5 |     
    arc      |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/9f4c956ff4088eea9ae782e8c5aa24ac7ccf4650 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/05ab83173a8eacabdcf69977ee9d5e8d3dd5e5db |     
microblazeel |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0301f91934b6e423b3e9a3aec490c4ba32f255aa |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/dace10df77da63d7bb0713fffc4e8ec96049b681 |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bfe0497bbd260f329fa0be0e7119bc16265b8864 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/93878caf65b9a8c4cd085032869e13bad21f699b |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4eb89afcb968c2bdffd686bc2d9141426cec11b2 |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bb99f9e9b696810bf73304c516fd721dc0ee1f45 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2f3e01ea1474ace468e22d70fbf8deb8754eb98f |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ee3779414d5095cfc2dc94eeddbb0af970fac744 |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6f8363e67bbb6500e50ca9e8701d41dfb1131dec |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/371124c7a83b5927fd3f3222977444eb53b80e11 |     
    or1k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b90e3f47e84583c45e33a805797ebae89d0b28d2 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ff182e13f1a72334efe4e3f80b3c917a285cdfec |     
  riscv32    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d1209bf34e948c4d00c9c46124a87c3a2a558c3e |     
  sparc64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/011f0b1211fea6ac822df906deb622cca4e9f28a |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/811a669acd4b40ecd846e8785e2f121a41a33798 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cecbf75308ef6a6873391b2d3015d0b7415ef029 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6de3665532c7acdbeaabfad7a1ed005de0899e85 |     
   xtensa    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/06570e236a29a688ce75167723b0f8a62e6dda46 |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6c1caf482c65028bd0209f2477035cbe4d49c98e |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1e4f90d664e0621f2a816769bddb1c921e3c2ead |     
microblazeel |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ce0d7a6f69b11674c82243c9e07b9feb7130c8bb |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a3ab07c62237cbbb2ae768f51f3b526e2038ae4b |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9933bedb54570c83e73362d9040a97a7cdde5c41 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/09380b1f3f06b5497046ae128d4904c52e5aac24 |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/568e9980b23981573de89ee7007df140c608a5c8 |     
 microblaze  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3da0792cb4900166befcbff32e1d00c0b4c738ca |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bf5b8ef41c99ba7c135baed68cbd432d750afde2 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/33b95f7e14dda956cbd44c81b3fd7d3771866725 |     
  powerpc    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4866b3794d73125dc4983f360f25879bed6dcfd8 |     
   sh4eb     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/665af0549a2733bcf882b7b9f05db949d3cb1c4f |     
  powerpc    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/f2fa4d090bb262579a887309c58efde2c42474bf |     
powerpc64le  |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/02ff41a7dc80add360be3de6792796f8a86bdf19 |     
  riscv64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/d6f5c7993fa25ff5774012a32302e02cda0e3b14 |     
  riscv64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/5060763c0592a5a04aab2eb64f448176da062745 |     
    arc      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2cae8afa2b87ac3af17a97896c9b459970ca5623 |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/7e993712d48b0e9c3d821a0ed739908e46328c7b |     
   mipsel    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/93f89472a022a33e49ed307f18584ef790dc5100 |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/dc3bf9514814f2256fb8021350c3f31258092b66 |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/98ccc5dae894ed7d501f794afa74d10438099a95 |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/7f27344933574db14afc72c0d0a78fa154c30997 |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/a3ebd42c1938da8f27fa0666a9990b2ff0c92465 |     
 microblaze  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/19d92fc4051d63b9f98acb57ecf665f4cfd2a355 |     
   xtensa    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ab210dc1ad1b92795789de6164215374ffe6469b |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/54c9d9116361ba85c0e99b0ae53b047c51d6ed35 |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/8c238ed206514bf6d307c870cb3cd0061a1b7ecd |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/1a79a06252a662dd83258e47c765c1899aa2e0a8 |     
  mips64el   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/afeb5914330526ea743d0493d653d74cc31c0828 |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2527eac30ec3f0e1971ff5f445e5c6567738f732 |     
powerpc64le  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/6913e0224d5ac9a3e4674dd5f2939c4ad7cc17ff |     
microblazeel | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/040f3d8bb2dc3cd91e3a30f1d9730935c6e1a084 |     
   xtensa    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/21c492942aaa5be6172c98c0d15b59fa81b5c981 |     
  powerpc    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/50fb6afbf75a7fd7e400e1163199c474ff69543f |     
powerpc64le  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/715b6d76819621a7de54f6cf7a595ecc07142db9 |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/d93560a8ff7556b8bcab21d9c199165d87d4d67b |     
   mipsel    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/997fcded83919115ebdf0c3ddd8d913396a7055b |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/e75821d1f2033b913e927fca92684557d3395b33 |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/dd16bd57495a1240207785840290071d50884c9e |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/6c778cefd1c302a02819b80e310c9b2307cae860 |     
   mipsel    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/458cc404dd9ce3127214eb846871016766fc97a7 |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/341f4387decf96a034fd96b52cf128dec1442be2 |     
powerpc64le  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/b41691440c4f7bd039cd975c983048f4d5ba37f6 |     
  mips64el   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/46eef8fa32195f6003f2797b7e8405496e6426d3 |     
microblazeel | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2f3cf4c100adda13293c172a5e3c74cdcdc40148 |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/1e36f6c0d5a7834700ada29c9a1a86f2d5a0bb9a |     
    mips     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/98ecb9353e1d8db6ab72af96ef178eb8d7cda815 |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/a2a6f9689bf62e86aca7339666c2762fee0f6bee |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/64f448a542d9316d61dcbaadb825c0bb42feabd2 |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/143316ed24e7c57a25f3d62a839416c499427b2d |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/f67e542383a1299791cafdd22789032e02e7bacf |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/e754b55e9a4bbd46463dddd2db82aabcf1c04bfc |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/97c209d0c86d4f01ea505a29de6e933c3086f864 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/62039a12d72aa7ab60d7497b20cc4b4185a632c3 |     
  powerpc    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/597986d7e6c3a90d09e528178e5c8bfd6a1d3038 |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/9abc1825052e77b29bcd7e582d16484a54316c10 |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/4b59746691707c4f961b139b27ff662673a6ffc3 |     
    or1k     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/3d72057e3734ecf549d733b67dd90f3fc8a396ee |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/af9fc0e0de591e293bd5fc21daee740ed5f451be |     
    or1k     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/b6376e1e4e556e417949ee65e377bff7a2df24b2 |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/c75d7bb5f96cfd905e8b718a329825c0eb67d22d |     
 powerpc64   |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/8e03f27cafcb016fe8fd3cfd754623e75f812855 | ORPH
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cd91178326357441273f85d5d68e2a7460a62124 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0ca07071cbbf41ac245fc43f9360258547416c74 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/29c728df2fb537ecb21b03111482f9561c143162 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/615b92d51fd1c684d13feb644968cb675cf89b31 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4ec129d773f2f8ef9051f5b51bb7c7cf13aeebb5 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b6b9122f84bad264e3422e452c7ffc47562c753b |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f5ba320bb0d6bccee8d1355a63d911baacfdfc80 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b1972d6fb1048c00f3c3f5222e18d69ce0125988 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/460238e8c9d6f11c9827f134c207f55d7d7303ac |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/70d7b8dd41085dc7ad887b56dea987071b1e5fa4 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a81062261dc85dcfce082b59435cfc8336d2001e |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bb816de83c0d62a1baa58e990e40235435bc5bd6 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/47d929861ffb441dbbb638dbc894e56d7c58e236 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/60aca4ee09194b766e365b54821d288bf5d449d3 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/135114509ca393168a4c6ca25d3c6cec80220220 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/45e3f701443f9c4bb0f230ff794f3fa71178f02b |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e819655c5290c531a57411e1fda7dfffb0a34276 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/20623d01eb4c5f434939b10713c6ef7aa93999be |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9adf584d7fb0379e7fff1de23d723ca53aebbf4b |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c31627ebfd3ca37088f0027236f4adc64396aa50 |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9ea9660104f41a16a484fb65e4f163a500cf360b |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4a34aeae8daebf7ce79ccc99c159e394ae6e38c3 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/daac3cca056bdacfb1081352c6584de82d609452 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e6515dcfb1effa2fcee97031ca0eba86892a0d2d |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bf40075fb1f388ec72e90266299def43190e70d5 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4558664877f674477ab862d53ce356d873fcdbbf |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d83ed5f411009e060a6ab678d2263df12706b076 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3ff53b1a9185d6d234cf8790802ea9754564694a |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/82be7c9c8c9b7411132c2d13841993201be1cbd5 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5dddd80b374396a24ce5d857a32fdafe4b5b7bbb |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/314d25bcc92c620116b7f126ed316d40a2f034dc |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/61d4ddb497b64a9abeae06cc1c9ed1db1fa33218 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/60d7d5ab5f5816aa2010c5eff218c8b4e46d9e73 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5c5767535d7be632ade6cc3c46b9a914e2fcb3d3 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c96aaf79337039770bdab60c0f460f4954112bf6 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/391bb34f102bd8f23a84e8abf7984144db759eea |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f4c30c0c1b0968036623ece15e539809b3170ab4 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b9dec37716286557b2da1408388e410e99133d8b |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/45a0427ae8503173a447362d091232071eb2946a |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/75283adf0174e4091feeeae9cba82f6d3ae2d8c6 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/08047996c68f251df1ea2b362681d1f1a19edd75 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dba017d5784095159e1bc215038bfc170a42bc1a |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ddf704b08cfcfa52f29321cc11ee55d064f12958 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7464a7bddef98516df1b1380e8fcdff801e13aaa |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1b0a533c3dabd9cec952c2f389a38c6b08e384ac |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9b90a8d5675a5b0f7c3a6bac26065e7e85f8c3ad |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0cc378f850f8f25551f053c8b02e8c5a88d00215 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ad67c55945485c087c830942d0a43148890c26fd |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/739a62c5f9ebb9aff728132a269740637500cc68 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ece5d4b1831cc2bea23490494b967fb4501a478a |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3529ec3ef882abbc5a0e19f577fa43b87f54cf10 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b59204edfdb48a4c2757fec11669f4ccbf309ca2 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2140db35bfb33259cfa60ad92d5bc1bd43139574 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/11a0eff31036ac155cf1882e2a87ecb59346d19a |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9be108b6340b308abe16dff60c3880fdf85b212c |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0840910c6409b0c1e2fe25f23edefd64c7af2dd7 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9ef45ec360bb12342144f9469238999ff57fde2b |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3b61bb4756ce657e0767da27b5e0527e507d0c42 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/abd8aead8f7343548cee75db61d0627ab6954615 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/29d7def196138858d2752da45aa002a669f54b23 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a39526202936aea0f4298482b3868306c77316c8 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1223daaaf2bee8d68e323cc9cf21f4e30d2b6106 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5e472edf922cb1502f9dd018ab4ddaf1e5272b46 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cf95b11700ce19ef9b3d513667e15e554212fa8f |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/47592b8d64536e990cc4562052d6de16e62728a6 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5bc3e8d5371afb68f28257e9ef2ba8ace8fa11b2 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/58190c39a2d2212940c5b28625186ec7870a7d21 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7956d8edeaaba354936cd6f74c4a629054bf71f0 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/95fa4135face4cdd2300f11d944eaeef29336e05 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c6b6229d28890cee04bf571f6914d4399b8ad226 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a10f0a3be9bf5a6e768ffd8a716860fd5d08a9c7 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/913412cca75f392ad909f05035c1fe02d8fd52dc |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8c8288c433234036ea588e7a9fb29ccb118e372f |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/93d60d6b1976e87226484ed1f60bffe75531589a |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/616e990802cd9d4a0dd548183b28503b2e629148 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4d40e90ed5d4dc6391bd6a2ca8cc0ab2e8630158 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a7793ff7cb90413e3641d2337aeaf5ed05075803 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d10b97ef9765572fa8a42c6386a899f5be99355a |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/320cce809fa904daa16e0a11b3ab3b0ecb34841b |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/12605d7338d2fb959391c8ab23f6d158d052156f |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aefcba1027e13421acdbe76c9fafc63902dc2d1c |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c3e38c52122daba44b20fe2c642f65f305e23412 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aea8a6d54c9b6753114a106e55466027947aeff9 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7bcc49c82bed127a0cabba456de99d8ee218f3a7 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/64c2421b5e32edadec1d4170aaa71dee9796d663 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/19c7c78d4ed168fc44399dbefcd302e57a1c3f56 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/633c5ebb211cf2d47b00fc749115b7b3afff9038 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4ebc273696d5fd27fab86a6f0f112a92d854e264 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fb9fc8145503dc31765c9fca1f438e4734cbe20b |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7eae1dbca15b788194bec4bc650b422e63942e2f |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/27edddc64cfe6a00266272dc2abd0808f8c67f25 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d21ac6a1eb66d6bc4018740740096dc5c5843c1c |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/21a5c7ae2ef5a70ca93211cb440acbf624693432 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dde098ca9f4c6af7638326c4097eeea5abaaacf4 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/79a8ffe85ccdecd0e4145cf4f451d1694b5eb717 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8115a582b74af386d10e52b2c0edfa4ab4c4dd2a |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ca18fbc68283ef2027a88789dc5e52039f6b0f41 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d4563989d87e51de0dff5473f73485b2c2072392 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7eb3aeb8814f0a2dc15d4488d220e67898f7b12c |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e11267826efd83f7cab65c314822ed1f9fd9e29a |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cbfb0f4aefd81718d2b192cbcea5a77e611585bb |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/61dd83e02cbf0150148cf470548688e991f6f2d4 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dda74e66a3cf5d7e8c2ccd2b3a95aabc8b5f615f |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/41f46dc7e0515d130d5bc1a4fde99addd8f36aca |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0051fadf20788bea5d7a1c48023b60f5f25e5916 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f1ca96e4fd4168bd94406cb4371a375875938b3f |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/50cc13fff1bbe852ce7d49b1fdecb69040aab86b |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2d818dc1abe7d3be0e44c7267977429159c472c5 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7be756d15720b5b7ce75b8af046194e2c35a98d8 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b9a9a7623d08a7e39fced2e412ff58d4bdce3a14 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/499022f8a63605c33b05167b0cf7edbbd70ebb3d |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6738134c93417daedc1943d135cc418f1f9828e2 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2534ea6859f1eb65da3761e2994fb6fb90bbcb4c |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8a673c455ec6d366bf9dae63b0fe75e5ed4c2e9d |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/005275824094c81072294187fda3dc077574142a |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b9f17dc74465c8ea8380d564e4b677d7446e738c |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1086c8b9d81f00059e19871356829c4cdb51feb6 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bc609aeb7e19dd285f695f981d82a12950a21597 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4f2ee4f6ce11858cf819de29e818000fe85a0787 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/00b9d82d5378f62c287f57ac250461e4923ff249 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d8dc5a1b2add8a9b96814124edc295fe11bae349 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/64e5a48833a30fa66ef1916073ce625616f6d9cc |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/74f84eb893df1acf0c3266884b02a451c41fd8bb |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8a698a7c714ebb0d5951bd3eb9a5ca6a355196c1 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/511e0cc4e138741b3d28f30079eb2e48ae3a0459 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d80797193f3706a9b98bc97d64963f6cf5e3ad41 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5c308fbd6bbf93343ea17053d6172ced75204c84 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/acc3a1623259128ef6ef51bd12f09a1ba0bf8368 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1717d2e027175cc03f26a7cde31804512bb4f99b |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ba79a1db9be79660cc79a450d0593963d95e2a19 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4214e9a9fcd4876274101f1ee4fcc24f6aad4a50 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fcc45d57f200bd5aabae27502961def2436e40ed |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/73929c276626390e458f9a29e051669958ed1ba3 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/56b240fb706b0713927df140fc3a625df00c089d |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/99e8bc56eb93bdb9541f53abf677bc3be09abc3e |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/69d65f9214d638aff990684789f3814e0d009498 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/16d6c39bbb8d92d73b39605dc508427314fa2eeb |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2ea770e3a2fa535dee47bd8b947b060ae4491642 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/edc0918c4684cfc6ede37f7149b17e7790c3aa9d |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d8294cf370fe4cd98115f443ee030c27faccc4bd |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9aa287f0262bf7a525964e7c0b8f6b4f011bf7f1 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0da713b4ce0329b475360cf50753df6b4dc55f5f |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6d680112fc7e6683b4d4999418382c9ba5eda763 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c8c5a2b8dda481c9ea5a516a56e975aa234cfae4 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/74e214bb9a0a42d2e19dbadb3f7fff67ffd09341 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d3e4e353e17149d2c5dac6b5fa63270db27cfb3e |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b7c6b31e87c43c220589b12babec246aee7847ee |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ff664fc52218d635b254778c2f68f92d2edd6cd0 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8c965997a7707d8cad5be76118ac3e58e7b870ec |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/72f647fd9f45f85d3a0abd2f8011b0f060cd5538 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/15b01835dbcfccc388ed924416dcb14336b76981 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/eb5a2bd242ade17aa58c3717013dfe3ce63a026f |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1075a49ad7a8915e92aa7708ed2faa06b4d6425e |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b6b6b4389a9fa04760e905858d3de2c579cf20ba |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c59c0699c74c513a59156492ecca2507f192244f |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/03aa3648697c9b9a9b6cf21f619829b57daa99c7 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cdf58008e5c653fedcbdd9dc2c54d80baebcec9d |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/243521c5667769a64eee28ecbb6d1e5a3b41ac7e |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e43a89f6da90a18c7d66a353d2010fc179bfbad9 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f67ef06296dc99b6adf00723ca6230a44d0ef44a |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7ff17f0bba37e23c1a6f5956326b56ed8b321987 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0a5c4432bfbb8a0c71571985413a7cfc7dd045f3 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/26401a23f18f9036faa807efd9dc83e6c7155aef |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ab57dab05e10fdf82cb8c03ebcdeaebdcebb50fa |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fea1a278b0ef7d5aab42085bba2d9226ed7e8898 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ed0dc4485c63f42f0dc93f9f21b173dadeaa44c2 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ff2e83e124f68054c31f03e104a24ee4111f09cd |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d63a3974eb906f194453e5bfc169dd112c9b223b |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b9c955f0a581db78f5bfcfe92dbe8c02c64a0b62 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/437a99423c8fe94f71f08694903717dbb766546c |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d704220b503e18ab5b24a74579d45c9afc89fa73 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3a53da2827bc3a9a4b0c0722c6df9b810bfb60b9 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/664676eb1cc366b00853357fad4d48441ccde3e0 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ee50fa3139dd724a6b5cc27e4636952522a2b629 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/adb900e415202a4a8207bce7b0e125a0547ca4ae |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7f244dc8a73a6f7f45d8d428f3d79ebc35a664bc |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/91f0b9fd850db17c41632c7758ecad7c6af496d2 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/486ce07f568852e1117c46b76a52dbf043d321dc |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7a5fff55bf902cabb8e2404cb6fa41c21b1d65ce |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f3e3f64c4a72a582bcd534cd805c83c49162faec |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/58073cabe1c1c32dc8f7045dfafbceb3d33f386e |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d797b639e3aa38f05c513b93990686470d7c1dd8 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fab9749829822bd8bc7abf9f1b7ce5b25b0c37a4 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7449b3718d9096a0aa53768788da749249d6ec43 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f585c97383d8a2cd42430a4900bc8ecff07a2fe1 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/244706c26b7958ca53f19825f22ab54b8efc971e |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/832aa234f34afe165a70240a7deae3cee0abee46 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bb061a5a9cfb3b1994cd840b09bf1b9488ea5613 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b65817a32671e0db6e543d24538ad5355c9cc1c9 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a4250c08cf0aa148f50e6c1bb284eb83f4a6cc97 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/60f0d3c8ff31fee1733ddbd06090e19ea5503a73 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/64d69d091f9ce903664a0f585ba11a5d6908ed04 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b7f54234d6f50f6087b4f664980774874165a2ff |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/59b4450ed9bbc6ed644b42f74871c6e55ee50801 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5d39702b487c2aec05c3ad0b379f6ed1027189b4 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2bef7afccf8a36315b04105f74ded855b77fcf9a |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/97404bf430e2870f871edf958fbc3876605d71be |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a1d1265355aea516738780a87b077bdd5ce977b9 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0065374b578983e03b542b2e79dfb304fecf09ed |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d70bf2493562b49052d0c41df193c9a765aa5dae |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/00a605737e1279d3ca155bfcabd052133690c26e |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/782904fa0f4f99d3401bb69e4ad323915007e71e |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c2d199f1fc260d93f0cbfddf20f39868c6b1f761 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e2843581187abc05de8db2d0b7e2708bd071c667 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/230d44dc924a630d59bc3ea336fac2268328b421 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e77419c1c52012621af08df6ddb544f1107fb167 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/41dfdeba2ba5e6f12258ad7e228745fe2ab39fa6 |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2e3a7a4d99e2ccd25e0786d0a4fc51e66bfcdec2 |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/968e754bf8628b4f12e15519ed7d1361e08e25a8 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a2d0fb9e2d60b48248d68b63e9230e7ae48abf72 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2285b3e1c015e4ada3182794f17138449235ada0 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/77d569d14e3e41a9c907466ff1e387fac924e8d7 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/99d3505a2c44bfbb897a6513a505a96b1f553702 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fe0bcfa1754f220e4413e96ec6272fba6017e9fd |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b17bc5b9a4a913a964d880861e244f266aa4ff02 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/79f627e3cc196c0e4df7cc5f832dc5adfdaf9c21 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/93b09e8ac95d2b7a3e5b85030da0eae5b3fe71a4 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a8ad8bdfc726ba9fd901f80e37f44e9a4c09a3f8 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6f1c10aaceda280cc1a89ae60947fa0435640f09 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/66c5e02654af7aabef235e62200c14ee6c7476bd |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/17b971a38ea3792cb9a1b15b110b61cdf586729d |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/85c6d7ac241fe92d8cf28f5ef031fa3bee283013 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f868f0a8735edef4e8a33374c6465a79a4a8dcc1 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a3385083d0a1ca70e0f1ed10b85861834ff84090 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2f4d033b398b9ec39331d706c8484f7efc9293ab |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2becea6a75bea42886678e8db64d829c39afdd2d |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/70260e35e505dbbf5e575b2bc48af800bf3f11c8 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/62305987fcee2b66adab3b689e29d3c04f248fce |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/432e89af7eeccf981f84422ffa2fb24cfada526d |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b33e55e12793e94775c2a0993157e41dbe919adc |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6103c65bac4488516b0c8975b79b58bd4952ecf8 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/25b2ee8e92dd2d507d48a68ea8d61deff931370d |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bd5b75e694e112a4dc255b42e561b93f93affc64 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/baed67b01e0a24de1a3964d3fa6648fcde9987d0 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d83b7c533cfa1fbd4a272956cc56032df78587ab |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/27b146c0757e641f423f3d3ee76ddb74f79f3961 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/461b53947895fcba20eb7a056e818cc1553ac1a6 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/62ebae651c7edf29e874baecbdf28a75a34f021e |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/57f46e5c6865490b4af7f89026e33d2dffd7d802 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c64c96cabdc4eb3dabbf6e1dbe8593bec0ed5fee |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/69934e763e8a33904a0542ae794c6f81f8a5badb |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3f50bf47851f00fc93a93fb3a140789d367af262 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4dd253e2682422fed2c95efa3e7fb10c5a56f477 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/468daece981a958b21530c36e6d597ef1a55ee44 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/78fff396a1be264eed1d8e48a59ffc7d491bc942 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3387069c8fe9d447cd63b87ac635954dea088626 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f962153ebacb21a439f30f98d829cb1fb7738a97 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4f9113bad482f79354ff20b7abea1a0adec7df09 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b598daab4ae50e8f99bfced226bb34d748bf1f9e |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3ececa8369f692397e925b864ecccef03f369c99 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0cb7bafd3de8a90113a9e81394ca1dc2b9141328 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/826899def46596b70472e035efaa0d5ef56dd49b |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/27cb6a2ca5ad34c26a7f19ee5e4eca7c5a744bc3 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aa4f6a3f8660a43b2c55d086b1e95ac6aa4b723d |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/147eee15cc3795429916e5e6a8e0438414784232 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d64944e1c473cac73ca9a859d21c22d1fad42896 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cae56d0df777969352e7e4dac37a460c831466a3 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4a855fc8ef63a5d9ae3d899e717012cb6948d804 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/739a88ef8bd2a17ce82d6623303d671be816ab85 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/092f6f7b425db9ff8d43c818e3a982238c436e64 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/38e2778f0dadc01f8b859c1cf9c13a7fb686ba78 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b2b72ab7789400cb34040b21a42b60ed25fe839c |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/96bc49ab06659cead1f13e438bf97b64b8325c40 |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/52aaa232d2521bde575b37b765a3ff7d144c883b |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/129bf82b1fd5e2e38443cca3bfca4dcf52979196 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8d78d8b2329ee5d0277ee34a5b9cf04c8dcd6bf5 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ed94b3371be1d1c9c46e48c2c372df2295d4ea72 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3d03f7b174217f2373a9bd960f52942febafd09b |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d18c6003acddd3e0a6cabacd536f09fba191a271 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3922cc3cdcfd494134f6e22d022ceef911bc9bed |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/55069c5655f1f96ff44e072860c8026e74c2b0b1 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/807c0be20c033bcd5e76abe3d29d972b4f8761fa |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4c0b7a664a4a1ac5141770ba3e97a589d6cab7da |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b3eb60735440027d7c0ce872c27e509ac8b40d92 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fd14e9e53434c3f4b73cf7ae3eaa357c774dec9c |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/34cc5c4c4d11740ac2adb174a5eccda4d3b2c1be |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2e4ea1810a07bbc5238ab3073e0ed790d5a0994f |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3890bac8dc56dcfd2e0e3ee0be164b1d7c2027ed |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f279eb31b0e26900c93db01726645d9a1f1a5986 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/10343e99dbecf00178b638728d184c5faf3be719 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b502963cf415c09930ad2eef10e20827d94dc6e3 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e22a84d3ef6e670e8fc6d5e823e51dc2068ec14c |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4db49a74c178cc1cda03d8a729e82ba66161737e |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b363f3bc948d1bf41725f57d263d8ad9adebd7a2 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/38669ec1487e4c2209225cef45e9333c5f117c4b |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b75b4f848b77fa1e90e26a74117da27e39f2f296 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f0b3745cea0da501761a5efaaec8a5941bc87ada |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cd174db02388f976a5a5d8f548cf5619c1353fed |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c560a96fde9fb102b8a6bd26a288e994633b7cee |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d9e118b77128e909b5c90726773acfbb6e56268a |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7848766596866868deb6996ccaee7ae58b814177 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1f0e3978c6239f59f8b72683e6123207b8fc115c |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a1b23fcaf7f60fae6118d27ff6726ded40c73657 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/73eb0bcb0652996da9d27aa572caa93aec16b1e8 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d0c146aa33fba92d1663dbc6bba018d3cb427eb8 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a148c32e147748ca3acede9b005742c39dd4799e |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/08a71af1802bbd1ab22a6a7122556e354b07e047 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f27d242121739db738def8b9209ede7c98fd4355 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7994387a7038cc48bcf6b85f544083b4379a1117 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/48902a12f02f1bd7a7ec0110b7f9990321815ea1 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/718d8d23c89b1f131c17465fdabbd81ee490f521 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e37e9a1f650d58d2fba62dfbde77cfae55c7e856 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dbd6a180365724ad34613db5e82c68bc72285eed |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/389a1a349bbe16c09775e2765c5abf23b2988e43 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/713c03060bc4751f6ea6d3b2e5d4ac4a37f74aa4 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6afb1f53b7e49a80cb3d6bac1339a527c33d9bdb |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1731c35949af8a13bd57cf15c9a8456e229b902d |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0c261c4d11df0d7c70368cc8c9a430061417ac7e |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b804e97df87f717e12d2f15873c257fded643e0d |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e89989915fac078f082c70d16f9fcc9eddc1ccab |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9a69df0b39cf759fe09fd69b4824874c9a6ab95b |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5368fdd61148ce0dc4f68eddbd4d322f9a340bce |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c8bc6f840883d441c9f9f970b8fa42ecf889d4cc |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a3f1cb2c0d09595385db158c866edba3cfd49926 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2fbc9ea187f58a086d6642735cef2a61d4cc5d17 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aa40f1784254d4abdc2bf2cf35a14b90fb957e4e |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bde4e289e42799ebe9c9f3cbebfb8b309532e472 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e3bf2457273b56a8096445488b49efe44a876db5 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/28a3775929ec6c19188898d6ec56a7e2a34cfb3b |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7b76ddcf473b4b25286644b2bab659a61fcc2b64 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3bcbbeb5d924e5528cd5c8ea0e7e0c93c47d37ba |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/689cf802828907b5146aa4ff15f47b43ab25a262 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d322c1de3f04dc1b7fe6f09580b26d1cea71639c |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a17c053aa5901fa833f54a78bf2d1c987d21c98e |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bbefe6367ab81e4692a8c6bfa43ca66dcd69ec65 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/725d54b646569e1d91bce6c4d8aee40b8864980f |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c8a0c49349173daf76f3504a14e390363f49d145 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4ec902cb31590c35ddf5fb0691ae04b49df64a9c |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/06d8cb3a00846429420a72234f8cce5abd8089a5 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ae9a27b436858021a1e284ca7a9c5c8968ebaf4f |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4eb07ca061b35c527fec0735807853d515b0d3e8 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fc04a878f1062f473e35dcde9c41f2b759d227d4 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/08e7076c853240cb2c96df71a0e19fd658ae56e7 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/078ffe7dc758d3e0e5f8d864fdac8703987b436b |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c4b96c385f89a8d2b6372b8f7e9bea7682834209 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/769606e2acb0c7f0571be8460c146bae14233aba |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/20fadbce9767e3764153a60d5d55d8bc70180bb6 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/daedc89c7faa2c5008d3e7ba6e5f8b95a2a5b19f |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f42b98a02fdd2232f256c08c802dfd532b8eea71 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4cf17c66cd565c02dfd267e305a961d2a28e969f |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/583d8725e5d88e636041e343a823c0ba6fc9f47e |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5e9d4af4c0434f183f2b01b6397e277a2af34a88 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f626e0308d4a3a8fa84bc2530f1ab7623e4f67b2 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ac95ad28a887f19379ab9a1dfe85088264cf12a6 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/657d535bf862080fabf265db2be118867235a4a8 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/83e94c2c56983f7205427c2ffe794b02068f0552 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0991874961cee07295f9e93c83f67efe453aefc2 |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b25d4de510ecca7b99ada6b729515e8b7cb458c7 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/747d4cee5144e056a05d7bacd1c1dadf4a936834 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9b0b398fa676880ffbcfabd4cdc1339b78f2333e |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/17010f08ab851b52a111bd04ad462d3a084006cd |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6856a1f611c8a3d889cd9c50c6f55748abc336f7 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ffa5f658a3317bb41f938faabe2c09fcf9e040ed |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cd1c891634658e969886058cd3939fc96205a56f |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1f1877a24b81ef406332f1a1ef6fddb106eb9ada |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a1460d76d39c88c9a9c1418834060babbe98782b |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/99e104517b3b87cc6cf7fa293c31cbdfc65762f1 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b55d8b7df4929efb7535026915260a31be1a970b |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/332df7b1dfdb977f50f424b3099e8b03690672a2 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4faaf056964556fb4e29ddc4d1de52246e804fab |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/596ad620d43ef611ebe432b5baee3f274cbce639 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3ba132dbe644175bf597e99fb06d3a4d1dee5ba7 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/72d0a81e203fb8a012ef57e421edfee0749d59c6 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/852bf18084c3a28f785bfa8a44717a4ccb599b1e |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fdbccfeb395013417407ee63ff94249de756fd56 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9c38b390a141ff876ce04d57cf52d5022a11e58e |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ea60eda4b8c0b2e27037e7d5f9d70a076c41c317 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d583e7800869b9e357d5d9a8f20c664253eacbf3 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e14ec2efc960c207c5fd7a5e8e083d0dd7b66700 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/25933428905d35cd15bfe6f21ef710d38119552a |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/76206f8e3417390f1ae6f0a4b5c2beef1f4c1ddc |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0cccc7a25cde11d663f72a03054caeb85add6d2b |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d1c842bca9a1d70a1f5e150068139044ffd81688 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3809f6e60e7ba0097855fc1898b4f5e2f6fd4489 |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/87f3d194edcad66a15924f1ab4adc30607475128 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/744ea9ca99c953b1746a9a5542f0e193ad7f88f8 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/da4765377899811df25fd04f991415de6b629490 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4d903c99f02b3618dbe7e3c321b2880d9ad9322b |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3d43a1f17436b66a53671c37de001fbbd04b668a |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ae45cbac49aae0524fb666faed5a9eb60d50a234 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/355c36f069c5e7a8496266d89a320bd2465fa52e |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b8f6cac5518b7ce40a257d0a7b7a97d6609962dc |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e7062654483d7da9e28852aea7c55cc26da01f85 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cb9f99567cc20c0565604e6a64419a1e20c3866e |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b9d28937825276ab2e56b4c6596af03bcd9ee646 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/57f3b4008d995a01ee17e89ea31366550089a357 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/74975afdff51fd645bb8ee71b15383569b4a3f34 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ee5b49bf62fef6d86a5cbb9c398cd6bce824dd45 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/83cdc35c6f38bf105413e947f9adf04124270332 |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/930cecb9790e9c2eb010bce7881029578fbbb02a |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2eb89419a9e2a5d5fc369811b0703f44ff28387e |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/129fece8d7ae7e1eed4b1f3d5da27b85d2da1469 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b45cb47db83e8dc9d125651d012d8fd0a2257d59 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a58bde117b84ad72a86782e43668c5989aea536b |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/347df705e1ea556ef7c6eb21c434c226b3590248 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/83a8f02ae66b40713b6bbb7028b0650957d47a32 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b6ca9581e4fce60bb828809232baa4dcf108ee72 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/de672bdcda66138df9097b5d656fdb5abcb03de1 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/de2d009638ad8e4fe390edbe12b54c7294dd05fb |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e98987016d2744455c97bdf510993dc9e28e6174 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6b3812aedcbea799d5b750935eec569b4874dd11 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7ce8911b6b3a60a7f88a46d23a63bdb66901fee1 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/54baf076ecc2d3bf610d008c05585be249dd6d1b |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6a7398fb4879c3a76f8ac38e6675d0222bc18bbd |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/759920d894bd5cb67966d3186501baade4971bb9 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/480461a81a804a5c9e77fb5b1677148e333a28eb |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f2a90c30864abfe5c0012e960ff9d0370144b45c |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a44e0d92aeb2f5598a70cf59ce9cc1ce0c8f425a |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9e7dc8bb2c2ae1d65337a71217bec1a0aa03c1b4 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/99a7144723560d4444e675e556f336f4a5d1b1d7 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/42ff284933d189726e57f962639a40e11fc59b57 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c0448d452e680a48361b5a7670e343548b984af8 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/022c8263ac7ac90e78832694b5e4667518bb651d |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b8662093b0b6d3dcdcbb494ce6b8bb96d178743f |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/948c960a55a6014aa147fc9a7cad73266a2b8d03 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e85170ba650ed4a8006a78d489bc72f7e895c773 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/00b2a7c37374b8d66dd2b2a26948df504da13e18 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e6f8086b8950aacaedc317d17d1c160a77a39586 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/47aa82b8b42dd754fdf8629064f4d51aa69e0ec6 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dfe9f64a4ba6e63d017d8fccb2ef8fdfdb95e4e0 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cecad98d312b76116a3c2d2e5e733b989a3a1872 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ec3473134066ca9b6c4548a2cdcc994a1ce3d785 |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1688380f39e8d3f2ff565fda47fcb6ff2d544e3f |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/730fd1b523379017ef52be24d62be75e29c65a1f |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e209ed02d88b27e39569c534fd431cec387f7c17 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/da1dffd856eb7fe03a5ea974673f506f388688ff |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/95439e1f843955eb64355bcc1b3bd5992df8274d |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/18a9c8ad2d52e1ff37ea743f72a4c8eabec584ea |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7f929fd5153f023c329e9a65421b971dbd65b0a8 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9bac64e92e28c4d98e14923fdb4da6cd03f15b26 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/716294a6f680086191709622382eab71cf50aff6 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/31c425831e73e4cd1ce2829541e56107e17ce018 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a95596bf8e09cddba5bbb9d551f673c4adaffadc |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c13da4f095289212b8a16a71e7d2cd0e863f1231 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e122abe63eff0fe39e8b25fbfe2830354f9f038f |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/820f35ba472d6fb03880f03b5a98e6fd26bac06a |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/de73c95babb7fb80a8ce9e5c710098c854df960c |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a73662194f8abafba0c8153e34e1ce3f895fed6e |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a38a7b3938be54417fe9d71d41a62dcf4535c89b |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/91f55c2f1febb9d9bbc810b3d1cc518adac88ad6 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/886589e3a9cc827b185d8b713a38e1768b818275 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/33aea8efb60a3174d551ac78adfba1d3609c7d5b |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dee7998084c23aa158aaca69138403690a6c5836 |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/abd8d773caeae92b25eaa9c6c346b6d9064c240d |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e77234238951b5ec912d4396af7c87cc2f5c24ee |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/38e51871534a1af1c5eacd0b84d20eef5eb752a6 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cdcefe0e0e8269a0951ed98c591d320b2caefda5 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/50c39d66c65b57450810eb7118df5a5997b61b9e |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6ffd91d03c73ea170db3a69a85486b92cd01526a |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/67ce80cce1426f5f17e3b4a89ed0a304ab41dfde |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4353969fe1f8ba573861853e13e07f328176ffb5 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/27b5b63cc9932f7eacb67b910c1e79efdd913b2d |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4f65c9d08609ae728d93aec864de6ccf01c0406b |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3d713f06549a3999ff549004a847739669c1fbd7 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/05641be7151014ed6b9a49b89fddc403b7a1b1e3 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5c774e52ce5b97c4930c05f48ea650389fdda33e |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/667bad1f9d5a65d906f42f8f00932bbf7864d88a |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8d6dcfdcdfd6f9a908c056f023632d05f3281232 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dc018414a734baa94828519c7896e71700e82222 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a076c95ccfd96c1094120a49ae3dd67257123d7c |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b72c07eddd146324de6feb83b539e0842a379534 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4dab192ca4c7c1b10dd9d12b062c3c4ce6231e61 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6816fc0bc9b0b2654e14fa1868f6cab8f7380586 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/53ce545885c6c2bd481bbaf33b036b5afcbf03ff |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8205b6c7e323903463825d73b4e3b26a7c2f7d89 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4e2638aed565af34cf7db9576c4bac6df63a6a9f |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/efaeff192895c186a70a1b193f1172b9ac7cda30 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6f3faa13b2e27ebd2b2500c7728c5ed7153518e9 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b6f812e898d076bf838cf1cfb35301d77682be5a |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e033b4975f568229b6b87c0c0c981fb15a56e9af |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/57894da6a48a52aaafe092a68cea5de2f8623e10 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/eb0430a8c7eb55002be9115cde2ccb109f90e49d |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0561c559ca943af1e0447fbb3a5cba9949ab6daf |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9ec6e9feef328818309d5c247c5f3dee5ae7832d |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/310b4df0c823f39b42391d44e3bdad2ee032346b |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0d9021c8cec9813d1bf4c76945494d7d4a563911 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cbcfdf5da7bf6f1306359e5f0917151007e7855a |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2e45ee1adf44a3942233599734131d0a636383cb |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ebc4a957f281f04807390b0be565cd46cf84df0b |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0573c0a74752f4bda4a37a36360cabc4bcb77861 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c5533fd7c88439674de9d2409997b609bae71b76 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/15b9db84a6ba67d2f4d115a29d8ca188fcae0bf6 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/99d57badc38dec105ec8065cbde3049f38ec5e64 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/08e00a377d9c2ffc9c077dd88509cb368a86d4cc |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dd29c26b22a968870c182036ccd203acb6bae979 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/28efb7f9ba47832d43e0254762657c74c4c10261 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/880ac669493214808b346793d6585b3d702bdd20 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/67b5f0d20798ba59121feb44950a0854a16c3e27 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/84521914d50d8fe102243a28471480caa8d199ae |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/14f56d8d72925a2b36cd49222d817c7376429966 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d2b7f0d09e25276f9a78553906f83a54da8ed1f8 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/349e1950ac1d0d327a9d84cbcee2815506edd8ac |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b2c32c28761e6f1afce99c69063775578e110145 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aa4bb9eed687f4d77e67e015865c81c8d83db74f |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/abb3b081b26c358eacc2c7b738c8a95da4f5a99a |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4d718aa09d95e7b78a2619c98b40185bf39b12c4 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f21885b780766e7cde32764d5efbe2236353c609 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c1eb017987c0cad83df02a04173c232d21d6cff3 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a3dbee8a03a5cf88ecc5c80b1dffa76bf53aa13d |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/371b9b28092e51a161cc840fc15c2e946d7d34e2 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aa6ca89762eae25f438a9501dece0aec24695f1d |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4b69c5d0e86f1586ef766179e58077bd90f36cfa |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8f8bc15e08e336edd185651a2775416fd1feaac9 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4a9905fc2eebf1e3e97b37ff20e5d42828368233 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/383890d3367534a583311240a72bf0ae6af19502 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a399c12e4a7d0c3af226048298ad76a1a658ef35 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/63b34a224c3a162fc69ac0f5e98000ff0044376c |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/13edbfade378818d2dd3db552fe4680546dd6736 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f337bd12dd3406b9d66cac371496dc4db85a21d4 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5fbbff6e397afe110f7ce9c477955bd703155466 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ea3b16c5ec24ac0413e6689aea325070e774339b |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ea08181c4c6811f18c8937cd61d08b25da309d83 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7bffd6aed7b8f3c7f24ab0cab4a932862b6ce2cc |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/13eb8381dec024ecdd6580080a86ce6160e662a0 |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/27b1a8cadfe9038e7704704a610d0bc2d175e829 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0027a1567a73b0331820b7fea52f3c426dbe332e |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6f292e86b7ab2fe0374a1af0cf5a23d9611dd3d2 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7f8516b9edafa174dc28b4168e9d8e70bb0ce019 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fafc1e3c988cb1342ca8e9cc777f55e0478188b3 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/080e48c2deb34fbf416602e8fddd748ebbcdd41e |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e2b9b6519663f1d3f1f324a6028cc4b48b689119 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b8b77ff091ac067ba4347dca80c7e45b6b404beb |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b7fbb03ba5bc603eaaff592f43fdd129228b8226 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b7dd52d99730daa18ce0945fdd73cfaf276115cf |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8931db887b6ae5ad2a0cc1324658e38d8b4387bf |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/06b1fc1006bdd7193aae919508c607f3208238e6 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f2ff89b6ca3aeabf8fde805fa608fd6ab31cbfc6 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f5d2442a516549028c24c83a6ff22ffe56061b8d |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/97977c6433f2787c20e315a69b772d84720103d7 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0383207fc639501eefb63625b13485aa84570754 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3b2fc38e6d259bfa8c975906062cc673f0d55637 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/480a11764f0b6b9183e5e2ba075ee217ed55b9a5 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/268698fa24cce511bcc524ddb8620611e57cec2b |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5cb2656efc28931696ed003076523f79cd0dfd91 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1700a92aa52919ba965eda9dd0291bebc614afb7 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/97d4cca7d65919a995aac76458af4db2e366234e |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7901c0127d0a183cf8d76c2311a531ce2a8cc958 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6ac341363c4d814093e269d69fe65338bd1122ba |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/361e2827875e7a6fa31217ec13914be59f5561c2 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ab290769461d7e99ccb011adbbccde2e5b120f5b |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e2ddd419ca32401eb4af2a132131201d23bc2084 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d56904ba1e8b56b78dee2c1bd19ede979947972d |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/56a4c25b31ea8da5d031cd6a37f652cb99d2a9ef |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2a1a01a4d1141a151e6a7e76056c50c36f8f22c6 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a2c7a85684804b3965a5c1c705a8c4a2c9f7e2a7 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/61bbf0ac795647fec1ceb3d0488abbe9d66e0376 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/88904bb2c41c9818625352201815e5447fcc4918 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ebe7bdf9fe8646b1c0a9eba3dee294b11896aaed |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1cd26407475d1b4396aa2af8b0a167a05eb282f5 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/68f6586174191751850decb65ec4df2c2c60d5ab |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7b5ddb1a4e918061d96ae18d04688dbdb47aa937 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/69d7e15917f9fcb0b0b0004898e5be4befe3c081 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/081ef884ab88deb94b7a03d85799625ec0557400 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f139c9d8f7f139fd77d374d4decc0b4c84eef58e |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4bca8740d73ebb78d1f6037f42bb3e43ac7dde0a |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/468c49b0ca82f2b05dd55bba25ebc003837ce295 |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cc931eed6a1a83cc1302f4267fa6b9702dfab991 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/74915c2788bfdf684c8648d5cf2348e4f1b46ce6 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d9bac1ecaac9a10dd1d35135b571a3d241598b8d |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e26f19d0fe7a1afec9a716fe083d5fdafd7a72bc |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/68f6e2a0d13034237486053553f0323b502a3cd5 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d87737daeca2a1033bc1792b188ee62b4b33b752 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/341f8ea5343ffe2ff363fbfab6561d577b1eb67d |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6037512b9020487b8c0070eff280ed2282d300e0 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/156d0f5ce769eaf07f36ffa6aefab6b1cdfc3272 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5e99e23eadd915aeba5a3f05a30a5b4e6d694c49 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f77e185815481b00c898313018c09c3dfa67db22 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d881a0b49fa3697988e558d8abc1c2cc28d8b059 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b25c49309f2f6102aeec9097a54990dabb8b1208 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/424b4004d2f2b399aee6160d3e19126c36d742bb |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c4cf2077f56241fe27895af036436363df6b32ea |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b28aa3bd977497a9205a74a995f0c80a885f6fe2 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f797522c46f19b60c8c0a4477f0c3b108fefb8e5 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dbbcb9aa55bcfc6967496bc487108c2d13f777dc |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1d79f9527282d4c1d6efe1e5b6263cbbcb7f6f71 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/febc437a47afbbeb06eddd22b371baabfb6b2d27 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/14c61f6c9db1e4fcf64ece1ac18c76d7b684907b |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/49acef53bb7456adf74954236225979756669484 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f3052232b93487edd66bd052d277e84a2e943161 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1d1177fd91f211e6e6c0f2b8b65938c79c19c5e1 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/83631ad9ec2395aa823bb36a5c14e484b4903b3e |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0ef22c46dc304e3fdb6578ff9fad29cfd93225ad |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c34e9b995e0f0d372187af89dd8bb4df269cd8fa |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/61c8f631b7806de1d3695a26ae21bfbfdda807e2 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3aa5ecb04debe723a8cea99517565d5ffffe2d7d |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/333d30c804f21ad0ec4c7fa542b2fbfe977a721e |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b948268044b6b4b3cdd75ddce1bb9fdcf564667b |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d899a9fab3b350029036b0a2932343fc953da812 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/068886d6ef0a04511a8fdbcd833f5f911cd1039e |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b5c264b922206ab32a820019d29f6ae33407ac7c |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a96f73ab792443b6c671b931cfd2f6ac0761eefb |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b9824edaf466d6d312c5c82e3f1b38d6fe1cb211 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7e378beae6698e204f7a28a911147227438fead1 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e896134fb639b0a8cf8c8d0ff56781ee4f922bfa |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c091f804cbe5e9ef43547d4be79d083964f6ec27 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/77c8610f4d96e9bf703d66601a1d5717e4d74683 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a3b181ab33d56de7af394951d185af6b61bd8204 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3a506e0175709fcdc883ef3e0cf2041c86b0dca5 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5cb45b2bcfe3e3fed81fd0091e3ca397989d4c43 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/97afade1ef9123558026c9c82791f3b3a4698bf2 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/803a3556e65e88ac9fe01034d32e449d04e8d8c3 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3002dd23fda83479bbcbaf90e7254e5aa96062df |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/325fce7221ecb5f1df4d0c26ff648006c4e29b11 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/45710011264784d802fc829cd847bae9f86badca |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/36641aeef9da471b612c174af7fc19f30c05d08d |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b7bac1548a358356844d9893ebd467e1b813d048 |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/22d637e54d6ba9c1c95494c77f40493e9763d39e |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/14a5988db70eabea2431c58eed09f66af5e96d48 |     
 aarch64_be  |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/2ca9326d74b63828281268c6637edd10cfc31df0 | ORPH
 aarch64_be  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/b167cc8486834591dc3105823f96de9677fefdbb | ORPH
microblazeel |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/78710db16daae14ffce7873b887e08ab9a8ad108 | ORPH
    or1k     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/368f7fbccf51d5d2e9944555e3d25bae5873ba5d | ORPH
    sh4a     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/fc604579f9889cd8153219a747f5a665af1db573 | ORPH
   mips64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/26e32e4416ce4cc21b37efeee3742c8c3a352e87 | ORPH
 microblaze  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/fa7ce8ed06f7aebf6e8af7edd789824145364b0e | ORPH
    arm      |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/b61600c8d5712a2b40aaae8d3febec07f7e5ad2a | ORPH
  powerpc    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/caacc986177eb4d4950d36cad4864e2f9175a441 | ORPH
   mipsel    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/a04431876e19386d65978f3e8cc44a825ee2bd3a | ORPH
   s390x     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/51033168bc1bd01d671e8fa8d772100552d77f30 | ORPH
    i686     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/3318d62262ce7d55759d95f5ed77b1838b7a0257 | ORPH
   sparc     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/7f32e3a88648e3391b83e8d7be564dec992a43f6 | ORPH
powerpc64le  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/c7228593f5e4c3e2bf4344e605aa975a8b7ce28a | ORPH
powerpc64le  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/d2f8de4a100b47efba92cddc46d87b47d49d6068 | ORPH
  powerpc    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/da058a7e0200422b11413778a21721ce6cda7626 | ORPH
   mips64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/db693439523a83d7511d02fd7e499b629edf799a | ORPH
 aarch64_be  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/114a1cbc49140764b1d1e974954f60aa81d2c1d9 | ORPH
powerpc64le  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/fc0ab6087ee63b8b7f19029fffedb82a8d3a22b0 | ORPH
   mipsel    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/eb4a592448d706f28a94bee29010d704888e7adf | ORPH
   x86_64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/69e5f83c4f9e3b7f2e04968d987966750dd7b2bd | ORPH
    i686     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/75ecf62616ef369a528b04678be9c30d7420036a | ORPH
    m68k     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/22bb6f26fe071f62cdc927beb26572e5d0bf1cb5 | ORPH
   s390x     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/3a0077206f79c7ac4c313d28f9b6d42367642ffa | ORPH
 microblaze  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/974fdb729d4df066d77dd5b9004be613065375de | ORPH
  powerpc    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/adef9ef0ce70b57a3b4d0c7bebfc6cb5f31139ce | ORPH
  powerpc    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/2b7662e18ae863816ca6c3a299a11a35567e7315 | ORPH
powerpc64le  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/e9703db75b25b1989e5e310e8ea98647669c0080 | ORPH
    mips     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/d09274116da96250fd2f1e7a6581c6604d31d138 | ORPH
   s390x     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/703a9d555315e718ff60416e551fbef4e0f7d42d | ORPH
   mips64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/29d71bd32361100a197b55a9ea6a75a4f314ead3 | ORPH
   s390x     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/40fec9d0d61510b99193b7d78f9274e8fbec9203 | ORPH
    arm      |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/5cfc9409cac7c0a4ce3b29426d75b63c2b7b3d1c | ORPH
 powerpc64   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/e7ec7079d3bd39dcf3c64f9f868ea166ee074d75 | ORPH
    i686     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/f284348d437eb73f706d285b6ddf66501ae2d9e7 | ORPH
    arc      |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/fc8be87d25bb84df0e171c8ef49dcde4ff33b9f7 | ORPH
   s390x     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/13bc88450f3cdeaaed500b6a6f638c7ec22e3361 | ORPH
   x86_64    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/da5811a8fafc99927957be2e38b187f1c48aea70 | ORPH
    i686     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/1899e7ae0788576342e59d368abd13d20246bb18 | ORPH
    m68k     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/4785728e530ac8e19893cc7fb41238d0e14077f8 | ORPH
   sh4eb     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/4f40f03cd79e3035e854111f0cd19ec6a7e530eb | ORPH
  mips64el   |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/4e92ab16f58a51b198bcdb16482f9b623eb9ef2d | ORPH
powerpc64le  |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/59bb7c7fa6ced15089416de296893136dadb286b | ORPH
  mips64el   |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/ccffed1e5b4a19967d3411c07421684bd177ccac | ORPH
    arc      |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/b9082e21f2a640625c02859b5b83e284148295d4 | ORPH
   sh4eb     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/b08ef4f2a273b29def310c3d91f7204e104177bc | ORPH
    sh4      |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/738901d6f9cb99ab8b9825553b5963d73e5d9a13 | ORPH
  mips64el   |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/80548f334db83d04f41c7812d5a56e1b70a14e25 | ORPH
  powerpc    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/89393e196cbabca97ce7bd49be7e64347baf03ea | ORPH
   s390x     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/3d32bfce74273ff40ce1d9e1f73021b2d2843189 | ORPH
    m68k     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/f1a75301cb72335b8f7549f88c9aefed60d58fc8 | ORPH
    mips     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/75636e429aac4bd1b0a31bb5b086057357725f47 | ORPH
    or1k     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/a8231b86de837e50d80edb38fc6ccc663538e48c | ORPH
    i686     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/80a898a5af85f9475b5b47a9bf7507ebca7de051 | ORPH
   x86_64    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/e6f7277aba9a35dfbf43ca73dfa5f4279149e7c2 | ORPH
   arceb     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/4cc80a6ee3ac4eba6c07ec1e3944d24d5040b9b0 | ORPH
    mips     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/0a2a4c240e6773828151ce3e5a67595d5ba82a4c | ORPH
    i686     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/bbcf3934d2ea040c8584b56d47ce4b2c5b1024e0 | ORPH
 aarch64_be  |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/9081a27c1d35a45508fbb0d862b73ce97b30a35d | ORPH
 microblaze  |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/3475441992284a4f45e227a5f44510d3db288dc8 | ORPH
   s390x     |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/f62c350cc908555fb5ff2fddd8031f7a3a76a882 | ORPH
  powerpc    |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/3020fb71d55dda2b48ca26583f4496d6c60815ab | ORPH
   sparc     |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/de94431b1a114ce2358a2efaf8b366758694e7e8 |     
 aarch64_be  |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/babd410182d19346536d9e2edb9c5fa7615370e0 |     
 microblaze  |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/83d1e9b7876474ec282ab90f1dc709913e444566 |     
    mips     |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/db02620eac93498909400a4873412abde4d29a57 |     
  sparc64    |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/bc1303c7d8598b21754e4373c3c217ef9f3a2f16 |     
    arc      |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/c9fa55da9e111eefdf664bec07292a4eee070f90 |     
   arceb     |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/509dbec201681a2c251c45dbbc89c5b62c381a2a |     
   armeb     |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/38749f91ae01812becb9e48c90b92801495ff4c2 |     
   x86_64    |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/a147df329c0f5a8b362f326135c53386cc36c3f0 |     
  sparc64    |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/f051a4e22fec55178e2994e9260d3df0fdf65a20 |     
 microblaze  |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/39dd14c8c9d36a579c8e2d53925b9fc0fd14dfca | ORPH
   arceb     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/b376d6b1070ec90c666b2261b1a8f919a279bf43 | ORPH
   mips64    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/407a42bf86cb3559f994493c23d85ae05337f122 | ORPH
microblazeel |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/bb01b0fa3cb1f01605c20d7df09f7bb6c3b1dc05 | ORPH
    m68k     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/80739a08007c34cf243bc4448b5b8b9321f572fa | ORPH
   x86_64    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/7b78a1b7da811ba27004dc869814b79d2f72a053 | ORPH
   sh4aeb    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/d6bd6fb4403e694c2d24db0de0c4608c2c0be92f | ORPH
  riscv64    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/2c7f6816c237787dd457036950fd0b9c36e46088 | ORPH
  mips64el   |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/ab1c759394136f8ef89baccacc726a2d1a3b8a05 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e000a150fde83b101d3d7aa072441bcac8303fc0 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2fe008991ed28069bb062602080ba72d302a61fd | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a15dbdf03f8f0463adeebc6e9bd15a85c23fcebb | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/db3e86eaee6f9eeb10bc585653344cdc5e2e242b | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/70ca7c99b40f5c838801f22deed825f1cade2d0b | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/805c1be4582d8b62c40a4b46180191aaea945cce | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/59de96b11ef890291dbf1229b477709ee490e3c5 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c5604e1971119a2344c4e1608c696341b052e568 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fc003381d85bc728da24fe8d129b0c2ba8b5fa46 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/47528b906e102e58b7e1210121c9e969a2fdc3b9 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/309df2bc95a99e59c0f4e1d7d01a93e62b8a21ad | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/94cb3a1dc2747631d400f65c979cadcc1ab085e8 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/21b97357511e60837ec3839b68cd662806a22cec | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/42daf6d24356afb2350c3d78601656e9641fe65c | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/45ffa02b0cc4c536d2a2a2a110efe2de237339bd | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f72cfd56de86c7b149b85a19edd1bbc35c7020f0 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/116a41b531be04d518e41c08722a6197699fe075 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8a935b1dcf94e1361276a31cc52d0bd3b6a823b5 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/beb06a98c1d18f04a6f607a034ab4b9de1015692 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/29288d83b20ca53ef2895ae7e8b5ef4e8e47c36f | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3d2fea12d9ca7c03dba2c617e4f66e20d3e466aa | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3f39e309ae008e706df6895d23ba2fac5f335ad1 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/409bd62e8126469cc538908adb42fa33a69c8e1f | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/28d957dde7728278c9867cfa8692a02fc81abdd9 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/60f4ecb9d8dfd6f363b05a1fd47270204168da6f | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/55a66f289e696be53aa2887baa81ee95f3494c8c | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d423855cf2eaa3bc82f2500f1f4a6324589fac24 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ec27bf99a67891adf8e09debab83cdd319f86609 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/787d77628039509638e80bac2b40ce322724e3e0 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9e526c49a91238218605cc84da604c3570d89fe7 | ORPH
  riscv32    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fd6dbb2b8f7424c27a615ceaeacde4bb88b9d568 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6cfc5c88ea300eeaf0ad96472955b590cbd54841 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/abd5a4f5f62d1be7c7d7b4267e8cfbb71967009c | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6a2a9fe27594a50d3a015a0c3b71c278b9084410 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f073a279d94dfebdd50a43633b6c9dadec28066d | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fdd72470d081950c7bed5abddf8d100da0505d62 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/667ce4795cc2ffd073f88ebe99541b51ea913197 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/04b9db32d19e035c0bba4c18c85be9d6e4b4466d | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a44003bfb7066b5584205262152e00e96a6947f3 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2ef50e55f8e5f260ac6100a7b4a931aebad49671 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8712a5f46324d39e205f55abcf25bc4e240eed4c | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/87b950a42649afd65bb8687e0fec1573152ce2cf | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/714f10df7e110894583d1d3e45735da3248a26d0 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/91d1f13affab85fdded92820a55af1a8942c42ed | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/594461efcb7c67bec7ef33e8686ffcbb0ac8e934 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/626f79ebf09aa4878e8f6cd63ba6f2800982fe42 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d29d8f4bd2c8f15a20f15ed61247fddad7c112b6 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8afc324043c18c3b99b98a88492132dc1ec87d09 | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/820106bb3f2bff4f600929266ca67a40191653df | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7443a3123709fee6b4ee6014ca998c14875deae5 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0fbce3bfbd78a1b45d1ddc5ae0ce3b19583fa564 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c7da7a70888f5e8f0766db0ebc0e57d5a4fb6578 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/71a95891832432dbdf2a2b292850bb6f80420fe7 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8df8c772ef6042315545b14aa19c719f05eeabc5 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/336b2cee5ea9137cc77ee952caac2959166e614f | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bd77f2eff6764bcce16dcd2dd63ab892f44da35d | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/28396f83693f43d6b0aa11d4bdf135ddbd234c4e | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1abf3bf0b3575930c5abaa1f8b5ee4beb0789788 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c893d6d779f8524fb72653885867fc3345ac563a | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5e8e7839aa0f99eafc1b8a1f55ef1d37b37ea6f6 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0c430bb03bed6d2fd4e1bf457a384653cc23f472 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/763bc6e07bcc9c0b449c4d92f18551b7e407382f | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6ed15f058352202503f5ff4fa9f37e6fc12ca778 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fb91c8eaa231ebfbaebcdd48265b9fd2321a7487 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d846b68006804ab7972a490361f9995977409206 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1b0e132f59efdec1cc290d5288428bef2728adeb | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/32b616a06930996da35ccf02ae5ab190020976a7 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a363a53ac39b581b40d824568df64b308dfd197f | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3a703e6b144d062855accc52f97b0030e5ee71c5 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/94506f0a08b910dab45bb39548f04d235ba51729 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/030c394fd7bade712d3c212408963ecbadc6025d | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2ee2ad489a948649be3ff9350d401f3a76d81144 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/727dbd98c3e4c11a296d25bde9705d8290d22ab3 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9eee782a2beb9f427322735f0bc2f00c0e1048f1 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4aa3642b69e310accfb360fa2b29810a7e2b6116 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/07947a0401e831c0481faf32c5a1e030fba28307 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5749721bdc640db3608a9f5636378810746f7587 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d8d2d48df68fa567ce0eed78971507423b72f0ae | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/be5853129d229b0d14830a21445be29b2aa4c60c | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ab61d1c04c0c8d159f9c353026a40382cff310af | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8e9516f09f3fb0c9a7d7cae0d03d7ef0ff382e58 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/516bc406f1dfe45f42d58a0f09a91e823dbfc6d3 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a8a271e3fd1866279eedf1c4d16e96a30d71d26b | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7b5d4834d24a7fc67fc71e1151818c9e9661a39e | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9a7c38fba0f3d2f16db64e7072acbe6ce794b049 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/aff81ea15ff77dee7d3b6e6959da58dc58b27a12 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8ccb7384058d82bfef90e2c068aaab37404c9a53 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dc89cc52d9c41ee04e4839235e830478354adb09 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4492d90bbe1d456efda3fd4e5c169c7c3d159c69 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5a92e4ffa3459bf35e4c76966785c531bd227628 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9f72f1b6895aa4659aad5e00d9a755b8319cdefe | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/35ebe508e501c676ca65b15715d26c79eefec7c4 | ORPH
   arceb     |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/301b27a27cae9dff64e649839bb40ffe3f113f15 | ORPH
    arc      |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/36f007d9b12e7bd2713888c8e1393cc61866b39c | ORPH
powerpc64le  |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/ee2486e9019c753d662adc9093689426851982c2 | ORPH
    i686     |       host-pkgconf-2.3.0       | NOK | https://autobuild.buildroot.org/results/6c3aa1b3cd1e510a46e11dbdbb2114fc6d2241ca | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2fb8fd430e6f282fb3424e8b86d3ceec97f90cff | ORPH
   s390x     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/37747029f20880cbab134b80fb5a63c78724dbb9 | ORPH
 aarch64_be  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/2abb459728e3995f138d4512de9eab27fbb1807b | ORPH
    or1k     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/cc0cad4449f88d3e3459cb637d45861ce27263aa | ORPH
    mips     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/de7f579db53788a1a035b7a1b63c1eaa261464da | ORPH
 aarch64_be  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/edd2361e6d304b465ae535574de7991c6377fed6 | ORPH
 aarch64_be  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/d552d96e15e2c0c61f2cd876acc4e909b53af6dd | ORPH
   s390x     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/700feb26a5bae46bdcf0c86c70dfac8504a5e0a0 | ORPH
   armeb     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/29ee1f986cc826cca4ea99ddb5370210431d5465 | ORPH
    mips     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/cb3a8b2c980d86a6a9d618200f53410021208249 | ORPH
   x86_64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/f81dd499665262b9ea77f913a1f5dea907c8174c | ORPH
    m68k     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/cba6fcd66c2d3cacd28b0eeae2166e88f870e681 | ORPH
    arc      |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/6cee257dbcbfd4a6040316e6368c3cd93df89197 | ORPH
   arceb     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/4cc0d5d666927290aa0d3b38d1d0b5f6e1147ef9 | ORPH
 microblaze  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/52e85f67b18c3a6fcf8169a99b6b243aa4afa205 | ORPH
 powerpc64   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/1aa412d2b453ee08a413ccd5443c969c53b9e6fd | ORPH
  riscv64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/d5c2bd8894ba087e092d0416742e5f03aedb3c6d | ORPH
   mipsel    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/fa639f03157e5e0cd3f400a61f9bf04f6b1d9bbd | ORPH
    arc      |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/3c20cae98d2027fd23fafdea938ea03506af47ad | ORPH
  powerpc    |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/7dcffdc577af5a92b686994cbb2b128a6ae0c644 |     
   mips64    |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/91ffce09c25f4e097f2923ffc72cf3953403f4ff |     
  aarch64    |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/49e57c23368e7539373c3b216ac7351bed622006 |     
    or1k     |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/272b3f5cf07cb09380f05759045473dd88cb8e25 |     
    mips     |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/93495a3e22c66076f8f32a77f90249aa91256a78 |     
   armeb     |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/61e6ae81c20a5d7fd4962d99b43cb6ca0d53c529 |     
powerpc64le  |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/73390d52312a44bbeb5ef4ce2014d62594d89f75 |     
  riscv64    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/f35bb08187960e66721b900916acd947f5e31ef5 |     
    m68k     |         libsoup-2.74.3         | NOK | https://autobuild.buildroot.org/results/f9a4f2e66581b6495d916e1e452df8e168b8474c |     
    mips     |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/c1920b8544fcded9ee9a38b2c7ce048dc210894d |     
   armeb     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/ad807955678e89df0dd2ebddce0448c41259747d |     
   x86_64    |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/8dc23cd4f5cf628dd881e672d653d6640cee4b48 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/b2b1be9e39a883bebdad8fc4805c9fe0f4b44688 | ORPH
   s390x     |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/19cc5a2eedd149071907b7c61bd38c0a3db5ac65 |     
  riscv32    |         pkgconf-2.3.0          | NOK | https://autobuild.buildroot.org/results/9b7dd8a1f599b6c1737d1844c643c716bb51304c | ORPH
microblazeel |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/95d5c1dcf2d76b517699a8910732013edd51994f |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/50d7e075a15b41bef5c51999cbe5eea1282d6532 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/43780eb72e7ed4e214b40e0b29ee312dc818de06 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b6f5518acf323fddafa6862afb67ae24308c2ca1 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/09e3d7ae572cc0e1cc7d3383a9acc64b7b54fcd3 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/2c324d2a9a4544c6ce4aa9d3a768be511d86083a |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/5904a34e0482597ad777e2cf6514b85fbb9d7de3 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/8e728e2e77d9a2dce213d857c26af35c248c2664 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/5375719e14bc1512d1ade7747e9358e9bab8e393 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/6b46a03357fe0955b16928c2c55640e362eb44f6 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/d671f2ac6526f5c09a40b5af84e593c147676408 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/6f28445e382aac7b2a677682e2dea72ab2876397 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/1cc8f95e76ea62bbc8f4a4b7d33481a528cb33dc |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/c8de334df4907f69bf71f48c86d41ec0fea2d2a2 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-prelink-cross-a853a5d7... | 2 
            gdk-pixbuf-2.42.10 | 1 
                  iozone-3.493 | 1 
                   libnss-3.97 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/4947d9e9ed3f2a6dec7d4f82d848c265e46d0ec6 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/33d043f4e52a50fafd59f3a8563e88bc21c63dbc |     
  sparc64    | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/ae9405c260a2a9a8db8744a8ef7ad9ce9757a7e2 |     
  mips64el   |          iozone-3.493          | NOK | https://autobuild.buildroot.org/results/e5bbbd037b17c72308f5dff7d04d1d0534fd2644 |     
powerpc64le  |          libnss-3.97           | NOK | https://autobuild.buildroot.org/results/e5119feed39e3b49fc8b7c39ea70d8116a912904 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                acpitool-0.5.1 | 1 
                  ffmpeg-6.1.2 | 1 
              fluent-bit-3.1.3 | 1 
        liblog4c-localtime-1.0 | 1 
                   perl-5.40.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/cd6cbe2e033c8590dd7571596f7a5162630aa225 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/74f7d0b69f24302349636f8f75b22c00f619deda |     
  sparc64    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/f1aed22097da7326a32f8119166d27395e7caa4a |     
   x86_64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/8e20a99dd8b7c42cdbdeddec4e3e675544b2aad3 |     
   arceb     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/105f690d3b86265494c25eb7b0ac3c824f411ed7 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org         |   version    |   upstream   | orph?
-------------------------------+----------+-----------------------------------------------+--------------+--------------+-------
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.2        | ORPH
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/013117 | 3.37.2       | 48.0         |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/021316 | 4.6.1        | 4.7.1        |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2025.0       | ORPH
                 android-tools |  GUESS   | https://release-monitoring.org/project/013989 | 4.2.2+git... | 15.0.0_r23   |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/006170 | 10.0         | 12.0         |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 3.1.7        | 4.0.3        |     
                           apr |  DISTRO  | https://release-monitoring.org/project/000095 | 1.7.2        | 1.7.5        |     
                         argus |  DISTRO  | https://release-monitoring.org/project/000107 | 3.0.8.2      | 5.0.2        | ORPH
                     armadillo |  DISTRO  | https://release-monitoring.org/project/007006 | 14.4.0       | 14.4.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/009838 | 20.11.1      | 22.3.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/007841 | 2.50.0       | 2.56.1       |     
                           atf |  DISTRO  | https://release-monitoring.org/project/021394 | 0.21         | 0.23         | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/007962 | 2.36.2       | 2.36.3       |     
                          atop |  DISTRO  | https://release-monitoring.org/project/000135 | 2.11.0       | 2.11.1       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/015225 | 3.1.2        | 4.0.3        |     
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/000142 | 2023.02.20   | 2024.10.16   | ORPH
                      automake |  DISTRO  | https://release-monitoring.org/project/000144 | 1.16.5       | 1.17         | ORPH
                       avocado |  DISTRO  | https://release-monitoring.org/project/013385 | 98.0         | 110.0        | ORPH
                       avrdude |  DISTRO  | https://release-monitoring.org/project/010751 | 7.2          | 8.0          |     
                   babeltrace2 |  DISTRO  | https://release-monitoring.org/project/007137 | 2.0.6        | 2.1.0        |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
               bash-completion |  DISTRO  | https://release-monitoring.org/project/005667 | 2.11         | 2.16.0       | ORPH
                           bat |  DISTRO  | https://release-monitoring.org/project/241901 | 0.24.0       | 0.25.0       |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/014740 | 2024.2       | 2025.0       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/019529 | 2024.4       | 2025.0       |     
                            bc |  DISTRO  | https://release-monitoring.org/project/000170 | 1.07.1       | 1.08.1       | ORPH
                  bcache-tools |  DISTRO  | https://release-monitoring.org/project/021397 | 1.0.8        | 1.1          | ORPH
                           bcc |  DISTRO  | https://release-monitoring.org/project/012803 | v0.31.0      | 0.33.0       |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/021323 | 1.73         | 1.75         | ORPH
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/014746 | 4.4.8        | 5.4.2        | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/014378 | 4.4.8        | 5.4.2        |     
                          belr |  DISTRO  | https://release-monitoring.org/project/080042 | 4.4.8        | 5.4.2        |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.14      | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/014923 | 9.18.33      | 9.20.7       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/007981 | 2.43.1       | 2.44         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/000192 | 2.15.1       | 3.0.1        |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/013618 | 28.0         | 28.1         |     
                        blake3 |  DISTRO  | https://release-monitoring.org/project/369414 | 1.5.4        | 1.7.0        |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.80         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.80         |     
                    bmap-tools |  DISTRO  | https://release-monitoring.org/project/077099 | 3.8.0        | 3.9.0        |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/000211 | 7.20.2       | 8.0.2        |     
                         boost |  DISTRO  | https://release-monitoring.org/project/006845 | 1.83.0       | 1.87.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/021578 | 4.3.1        | 5.3.3        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/000214 | 3.5.0        | 3.7.1        | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.1.0       | 7.5.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.19.1       | 0.23.0       |     
                        brltty |  DISTRO  | https://release-monitoring.org/project/000220 | 6.6          | 6.7          |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/000227 | 6.10         | 6.14         | ORPH
                        c-ares |  DISTRO  | https://release-monitoring.org/project/005840 | 1.34.2       | 1.34.4       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/021325 | 0.5.10       | 0.6.3        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/021326 | 0.5.5        | 0.5.7        | ORPH
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/021328 | 2.4.2        | 2.4.3        |     
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/009026 | 20230311     | 20241223     |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/000247 | 1.18.2       | 1.18.4       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/007959 | 1.16.2       | 1.18.0       |     
                   cairomm1_14 |  DISTRO  | https://release-monitoring.org/project/369459 | 1.14.4       | 1.14.5       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/021403 | 1.0.0        | 1.2.1        |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/010888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/011515 | 0.10.4       | 1.1.0        |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/002612 | 1.5.2        | 1.6.2        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/085785 | 3.9.1        | 4.4.8        | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/000276 | 3.7          | 20200710     |     
                chocolate-doom |  DISTRO  | https://release-monitoring.org/project/008547 | 3.0.1        | 3.1.0        |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/000287 | 7.1          | 7.3          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/021726 | 0.16.1       | 0.19.0       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/000291 | 1.0.8        | 1.4.2        |     
                         clang |  DISTRO  | https://release-monitoring.org/project/011811 | 15.0.3       | 20.1.1       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/020578 | 2.3.2        | 2.5.0        |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/010503 | 3.0.21.02.21 | 3.0.25.02.14 |     
                   cloudflared |  DISTRO  | https://release-monitoring.org/project/186920 | 2025.1.0     | 2025.2.1     |     
                        clpeak |  DISTRO  | https://release-monitoring.org/project/015180 | 1.1.2        | 1.1.4        |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/000306 | 3.31.5       | 4.0.0        |     
                        cmocka |  DISTRO  | https://release-monitoring.org/project/011779 | 1.1.5        | 1.1.7        |     
                   cni-plugins |  DISTRO  | https://release-monitoring.org/project/096794 | 1.3.0        | 1.6.2        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/000330 | 4.3.2        | 4.3.8        |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/021882 | 0.9.1        | 0.10.0       | ORPH
                   compiler-rt |  DISTRO  | https://release-monitoring.org/project/017705 | 15.0.3       | 20.1.1       |     
                      composer |  DISTRO  | https://release-monitoring.org/project/009710 | 2.5.8        | 2.8.6        |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/096793 | 2.1.8        | 2.1.13       |     
                       connman |  DISTRO  | https://release-monitoring.org/project/000337 | 1.42         | 1.43         |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/000338 | 1.4.7        | 1.4.8        | ORPH
                    containerd |  DISTRO  | https://release-monitoring.org/project/016460 | 2.0.2        | 2.0.4        |     
                     coreutils |  DISTRO  | https://release-monitoring.org/project/000343 | 9.5          | 9.6          | ORPH
                   cpp-httplib |  DISTRO  | https://release-monitoring.org/project/274636 | 0.19.0       | 0.20.0       |     
                      cracklib |  DISTRO  | https://release-monitoring.org/project/000362 | 2.9.11       | 2.10.3       |     
                          criu |  DISTRO  | https://release-monitoring.org/project/000366 | 3.19         | 4.1          |     
                          crun |  DISTRO  | https://release-monitoring.org/project/096792 | 1.18.2       | 1.21         |     
               cryptodev-linux |  DISTRO  | https://release-monitoring.org/project/021409 | 1.13         | 1.14         | ORPH
                       cukinia |  DISTRO  | https://release-monitoring.org/project/138119 | 0.6.0        | 0.7.0        | ORPH
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/005541 | 1.28.17      | 2.0.1        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/021335 | 2.11.0       | 4.9.0        |     
                          dado |  DISTRO  | https://release-monitoring.org/project/058442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/021412 | 3.3.0        | 3.4.0        | ORPH
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/010252 | 3.3.0        | 3.4.0        | ORPH
                         dante |  DISTRO  | https://release-monitoring.org/project/014716 | 1.4.3        | 1.4.4        | ORPH
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.9        | 3.0.19       |     
                     darkhttpd |  DISTRO  | https://release-monitoring.org/project/000391 | 1.15         | 1.16         |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.13.4       | ORPH
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.3.6        | ORPH
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.2.2        | ORPH
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.4.1        | ORPH
                         dav1d |  DISTRO  | https://release-monitoring.org/project/018920 | 1.5.0        | 1.5.1        |     
                        davfs2 |  DISTRO  | https://release-monitoring.org/project/007487 | 1.7.0        | 1.7.1        | ORPH
                          dbus |  DISTRO  | https://release-monitoring.org/project/005356 | 1.14.10      | 1.16.2       | ORPH
                      dbus-cxx |  DISTRO  | https://release-monitoring.org/project/242464 | 2.4.0        | 2.5.2        |     
                     dbus-glib |  DISTRO  | https://release-monitoring.org/project/001979 | 0.112        | 0.114        | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/000402 | 1.2.18       | 1.4.0        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/015086 | 7.2.641      | 7.3.1        | ORPH
                      ddrescue |  DISTRO  | https://release-monitoring.org/project/000410 | 1.28         | 1.29.1       | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/021341 | 4.11         | 5.21         | ORPH
                         delve |  DISTRO  | https://release-monitoring.org/project/040149 | 1.22.1       | 1.24.1       |     
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/000421 | 0.26         | 0.28         | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/011429 | 10.1.0       | 10.2.2       |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/000431 | 1.3-20220117 | 1.3-20250116 | ORPH
                     diffutils |  DISTRO  | https://release-monitoring.org/project/000436 | 3.10         | 3.11         | ORPH
                         dillo |  DISTRO  | https://release-monitoring.org/project/000438 | 3.0.5        | 3.2.0        | ORPH
                          dlib |  DISTRO  | https://release-monitoring.org/project/018600 | 19.24.6      | 19.24.8      |     
                       dnsmasq |  DISTRO  | https://release-monitoring.org/project/000444 | 2.90         | 2.91         |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/021076 | 27.5.1       | 28.0.4       |     
             docker-cli-buildx |  DISTRO  | https://release-monitoring.org/project/325723 | 0.16.1       | 0.22.0       | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/006185 | 2.32.4       | 2.34.0       |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/000447 | 27.5.1       | 28.0.4       |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/021342 | 2024.4       | 2024.7       |     
             double-conversion |  DISTRO  | https://release-monitoring.org/project/007454 | 3.3.0        | 3.3.1        |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/000456 | 2.3.21.1     | 2.4.0        |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/021418 | 0.5.21.1     | 2.4.0        |     
                          dpdk |  DISTRO  | https://release-monitoring.org/project/000459 | 24.11.1      | 25.03        |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/010627 | 059          | 106          |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/000462 | 9.21.4       | 9.30.0       |     
                      dropbear |  DISTRO  | https://release-monitoring.org/project/000466 | 2024.86      | 2025.87      |     
                            dt |  DISTRO  | https://release-monitoring.org/project/021844 | 18.32        | 21.27        | ORPH
                       dtbocfg |  DISTRO  | https://release-monitoring.org/project/235269 | 0.1.0        | 0.1.1        |     
                      dump1090 |  DISTRO  | https://release-monitoring.org/project/231403 | 9.0          | 10.0.1       |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 0.9.0        | 1.1.2        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/017392 | 1.7          | 1.8.2        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/017770 | 3.1.7        | 3.2.2        |     
                            ed |  DISTRO  | https://release-monitoring.org/project/000659 | 1.20.2       | 1.21.1       | ORPH
                           efl |  DISTRO  | https://release-monitoring.org/project/006128 | 1.26.3       | 1.28.1       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/000667 | 24.07        | 25.03        |     
                           ell |  DISTRO  | https://release-monitoring.org/project/017781 | 0.69         | 0.75         | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/006601 | 2.3.3        | 2.8.2        |     
                          enet |  DISTRO  | https://release-monitoring.org/project/000696 | 1.3.17       | 1.3.18       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/000698 | 0.25.4       | 0.27.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/000707 | 26.0.2       | 27.3.1       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/017060 | 1.0.23       | 1.0.24       |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/045375 | 1.0.23       | 1.0.25       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/009302 | 0.6.14       | 0.8.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/010576 | 1.0.54       | 1.0.57       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/009222 | 1.0.30       | 1.0.31       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/010455 | 1.1.21       | 1.1.22       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/008643 | 1.0.26       | 1.0.27       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/045378 | 1.0.16       | 1.0.18       |     
                      espflash |  DISTRO  | https://release-monitoring.org/project/373490 | 3.2.0        | 3.3.0        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/005482 | 2.9.6.0      | 2.9.6.1      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/000767 | 2.6.3        | 2.6.5        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/094441 | 1.2.5        | 1.2.8        |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/000769 | 0.27.6       | 0.28.5       |     
                         expat |  DISTRO  | https://release-monitoring.org/project/000770 | 2.7.0        | 2.7.1        |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.20.19      | 0.20.24      |     
                         faad2 |  DISTRO  | https://release-monitoring.org/project/013755 | 2.11.1       | 2.11.2       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/012048 | 1.36         | 1.37.1.1     | ORPH
                         fastd |  DISTRO  | https://release-monitoring.org/project/017116 | 22           | 23           |     
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.1.8        | 3.3.1        |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/005405 | 6.1.2        | 7.1.1        |     
                          file |  DISTRO  | https://release-monitoring.org/project/000807 | 5.45         | 5.46         | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/000806 | 3.38         | 3.39         |     
                     firewalld |  DISTRO  | https://release-monitoring.org/project/009989 | 2.0.2        | 2.3.0        | ORPH
                          flac |  DISTRO  | https://release-monitoring.org/project/000817 | 1.4.3        | 1.5.0        |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/007421 | 0.26.0       | 0.26.5       |     
                   flatbuffers |  DISTRO  | https://release-monitoring.org/project/016642 | 24.12.23     | 25.2.10      |     
                          flot |  DISTRO  | https://release-monitoring.org/project/007184 | 0.8.3        | 4.2.6        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/000823 | 1.3.7        | 1.4.2        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 3.2.2        | 3.2.10       |     
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/010437 | 2.4.3        | 2.4.4        |     
                           fmt |  DISTRO  | https://release-monitoring.org/project/011526 | 11.0.2       | 11.1.4       |     
                       fmtools |  DISTRO  | https://release-monitoring.org/project/021435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/000826 | 4.7.0        | 6.7.2        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/000827 | 2.16.0       | 2.16.1       | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.16.2       | 1.21.0       |     
                         fping |  DISTRO  | https://release-monitoring.org/project/000834 | 5.2          | 5.3          |     
                      freeipmi |  DISTRO  | https://release-monitoring.org/project/000848 | 1.6.14       | 1.6.15       |     
             freeradius-server |  DISTRO  | https://release-monitoring.org/project/000853 | 3.2.6        | 3.2.7        |     
                           frr |  DISTRO  | https://release-monitoring.org/project/018555 | 9.1.3        | 10.3         |     
                    fscryptctl |  DISTRO  | https://release-monitoring.org/project/270981 | 1.0.0        | 1.2.0        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.13         | 1.14         |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/017383 | 25.01.00     | 25.03.00     | ORPH
                          fwup |  DISTRO  | https://release-monitoring.org/project/021438 | 1.9.1        | 1.12.0       |     
                         fwupd |  DISTRO  | https://release-monitoring.org/project/005833 | 2.0.4        | 2.0.7        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/011801 | 3.40.0       | 4.4.0.1      | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/000881 | 3.8.2        | 3.10.2       |     
                          gdbm |  DISTRO  | https://release-monitoring.org/project/000882 | 1.24         | 1.25         | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/067634 | 2.5.5        | 2.8.12       |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/018420 | 2.4.1        | 2.5.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/000898 | 0.22.4       | 0.24         | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/001157 | 10.04.0      | 10.05.0      |     
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/011337 | 15.5.0       | 17.10.1      |     
                       gkrellm |  DISTRO  | https://release-monitoring.org/project/001170 | 2.3.11       | 2.4.0        |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/021353 | 2.76.0       | 2.80.1       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/007960 | 2.76.0       | 2.84.0       |     
                    glibmm2_66 |  DISTRO  | https://release-monitoring.org/project/369440 | 2.66.6       | 2.66.8       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/001181 | 1.0.0        | 1.0.1        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/008732 | 0.7.0        | 0.7.1        |     
            gmrender-resurrect |  DISTRO  | https://release-monitoring.org/project/021445 | 0.1          | 0.3          |     
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/001215 | 2.4.7        | 2.5.5        |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/001217 | 3.10.11.0    | 3.10.12.0    |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/001223 | 1.82.0       | 1.84.0       | ORPH
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/021085 | 2.3.2        | 2.5.2        |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/009771 | 2.15.9       | 2.17.6       |     
                    gr-osmosdr |  DISTRO  | https://release-monitoring.org/project/021447 | 0.2.4        | 0.2.6        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/005410 | 6.2.0        | 7.6.0        | ORPH
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/001248 | 1.3.40       | 1.3.45       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/019117 | 1.66.1       | 1.71.0       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/013139 | 45.0         | 48.0         |     
                           gsl |  DISTRO  | https://release-monitoring.org/project/001267 | 2.7.1        | 2.8          | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/021856 | 1.22.12      | 1.26.0       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/021846 | 0.13.1       | 2.2.0        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/021848 | 1.22.12      | 1.26.0       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/021849 | 1.22.12      | 1.26.0       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/021850 | 1.22.12      | 1.26.0       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/021852 | 1.22.12      | 1.26.0       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/015187 | 1.22.12      | 1.26.0       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/003881 | 1.22.12      | 1.26.0       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/021853 | 1.22.12      | 1.26.0       | ORPH
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/021855 | 1.22.12      | 1.26.0       | ORPH
                          gstd |  DISTRO  | https://release-monitoring.org/project/235022 | 0.15.0       | 0.15.2       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/001263 | 1.22.12      | 1.26.0       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.22.12      | 1.26.0       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/311572 | 3.24.8       | 3.24.10      |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/007724 | 3.24.7       | 5.16.0       |     
                         guile |  DISTRO  | https://release-monitoring.org/project/001277 | 3.0.9        | 3.0.10       |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/001281 | 1.6.6        | 1.6.8        |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/001282 | 0.14.1       | 0.14.3       |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/001284 | 0.12.1       | 0.12.2       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/001285 | 5.2.14       | 5.3.5        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/005496 | 1.48.1       | 1.57.2       | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/006136 | 2023.01.1    | 2024.02.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/001298 | 2.6.15       | 3.1.6        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/001299 | 10.4.0       | 11.0.0       |     
                heirloom-mailx |  DISTRO  | https://release-monitoring.org/project/095708 | 12.5         | 14.9.25      |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/001327 | 3.17.10      | 3.25.2       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/001332 | 3.3.0        | 3.4.0        | ORPH
                       htpdate |  DISTRO  | https://release-monitoring.org/project/132187 | 1.3.7        | 2.0.0        |     
                        hwdata |  DISTRO  | https://release-monitoring.org/project/005387 | 0.392        | 0.393        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/013501 | 2.11.2       | 2.12.0       |     
                     hyperfine |  DISTRO  | https://release-monitoring.org/project/018526 | 1.18.0       | 1.19.0       | ORPH
                          i2pd |  DISTRO  | https://release-monitoring.org/project/021355 | 2.50.2       | 2.56.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/016134 | 73-2         | 77-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/021670 | 2.9          | 2.14         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/021673 | 0.8.41       | 0.8.44       | ORPH
                  igh-ethercat |  DISTRO  | https://release-monitoring.org/project/021674 | 1.6.2        | 1.6.3        |     
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/001372 | 7.1.1-43     | 7.1.1-47     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/021676 | 1.7.3        | 1.12.4       |     
                          inih |  DISTRO  | https://release-monitoring.org/project/011600 | 58           | 59           | ORPH
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/008864 | 3.20.2.2     | 4.23.9.0     | ORPH
                        iozone |  DISTRO  | https://release-monitoring.org/project/021679 | 3.506        | 3.507        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/001391 | 3.1.9        | 3.2.1        | ORPH
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/001392 | 6.13.0       | 6.14.0       |     
                         ipset |  DISTRO  | https://release-monitoring.org/project/001393 | 7.16         | 7.22         |     
                     iptraf-ng |  DISTRO  | https://release-monitoring.org/project/007034 | 1.2.1        | 1.2.2        |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/001402 | 1.9.3        | 1.9.4        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/013286 | 0.26         | 0.27         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/018380 | 3.0          | 3.5          | ORPH
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.35.2       | 1.38.0       |     
                       jansson |  DISTRO  | https://release-monitoring.org/project/001417 | 2.14         | 2.14.1       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/015715 | 1.1.2        | 1.3.1        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/001421 | 2.0.33       | 4.2.5        |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/001459 | 0.81         | 0.83         |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/029701 | 3.6.1        | 3.6.2        | ORPH
                            jo |  DISTRO  | https://release-monitoring.org/project/018855 | 1.6          | 1.9          |     
                          jose |  DISTRO  | https://release-monitoring.org/project/011761 | 11           | 14           |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/001648 | 2.1.5        | 3.1.0        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/013910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/021681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/059395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/021815 | 1.13.1       | 1.14.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/021816 | 1.10.4       | 1.14.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/021817 | 1.19.5       | 1.21.0       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/001492 | 2.6.4        | 2.7.1        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/001504 | 2.2.8        | 2.3.3        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.12.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.12.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.12.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.12.0       |     
                          kmod |  DISTRO  | https://release-monitoring.org/project/001517 | 33           | 34.2         |     
                          kmon |  DISTRO  | https://release-monitoring.org/project/373424 | 1.6.5        | 1.7.1        |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/021462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.2        | 3.5.3        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/012418 | 2.2.0        | 2.3.1        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/016901 | 0.13         | 0.14.1       | ORPH
                         lcms2 |  DISTRO  | https://release-monitoring.org/project/009815 | 2.16         | 2.17         |     
                        ledmon |  DISTRO  | https://release-monitoring.org/project/012346 | 1.0.0        | 1.1.0        |     
                          less |  DISTRO  | https://release-monitoring.org/project/001550 | 661          | 668          | ORPH
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20250127.0   | 20250127.1   |     
                         libao |  DISTRO  | https://release-monitoring.org/project/007629 | 1.2.0        | 1.2.2        | ORPH
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 3.1.7        | 4.0.3        |     
                    libarchive |  DISTRO  | https://release-monitoring.org/project/001558 | 3.7.7        | 3.7.9        |     
                     libassuan |  DISTRO  | https://release-monitoring.org/project/001559 | 2.5.7        | 3.0.2        | ORPH
                       libavif |  DISTRO  | https://release-monitoring.org/project/178015 | 1.1.1        | 1.2.1        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/001567 | 0.11.7       | 0.12.2       | ORPH
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/007869 | 2.10         | 2.11         | ORPH
                libcamera-apps |  DISTRO  | https://release-monitoring.org/project/328456 | 1.5.0        | 1.6.0        |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/376302 | 2.73         | 2.75         |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/001575 | 2.0.3        | 3.1.0        |     
                        libclc |  GUESS   | https://release-monitoring.org/project/376264 | 15.0.3       | 20.1.1       |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/021471 | 4.3.4        | 4.3.5        |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/015531 | 2.10.18      | 2.10.19      | ORPH
                      libdecor |  DISTRO  | https://release-monitoring.org/project/312806 | 0.1.1        | 0.2.2        |     
                    libdeflate |  DISTRO  | https://release-monitoring.org/project/242778 | 1.22         | 1.23         |     
                        libdex |  DISTRO  | https://release-monitoring.org/project/328356 | 0.8.1        | 0.10.0       |     
                       libdmtx |  DISTRO  | https://release-monitoring.org/project/012833 | 0.7.7        | 0.7.8        |     
                      libecoli |  DISTRO  | https://release-monitoring.org/project/375859 | 0.3.0        | 0.5.0        |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/020540 | 1.13.1       | 1.13.4       |     
                       libexif |  DISTRO  | https://release-monitoring.org/project/001607 | 0.6.24       | 0.6.25       | ORPH
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/012043 | 0.99.9.1     | 1.2304.0     |     
                       libfcgi |  DISTRO  | https://release-monitoring.org/project/059392 | 2.4.2        | 2.4.4        | ORPH
                        libffi |  DISTRO  | https://release-monitoring.org/project/001611 | 3.4.6        | 3.4.7        |     
                         libfm |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.0        | ORPH
                   libfm-extra |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.0        | ORPH
                   libfreeglut |  DISTRO  | https://release-monitoring.org/project/000846 | 3.4.0        | 3.6.0        |     
                      libfuse3 |  DISTRO  | https://release-monitoring.org/project/000861 | 3.16.2       | 3.17.1       |     
                        libgee |  DISTRO  | https://release-monitoring.org/project/001625 | 0.20.6       | 0.20.8       |     
                    libgeotiff |  DISTRO  | https://release-monitoring.org/project/021361 | 1.7.3        | 1.7.4        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/001174 | 2.6.4        | 3.40.0       | ORPH
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/012098 | 1.4.0        | 1.7.0        | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/001239 | 1.23.2       | 1.24.2       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/012558 | 2.5.27       | 2.5.31       | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/020640 | 1.6.5        | 2.2.1        | ORPH
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/001563 | 2.2.1        | 2.2.2        | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/311549 | 3.24.43      | 3.24.49      |     
                       libgtk4 |  DISTRO  | https://release-monitoring.org/project/013942 | 4.14.5       | 4.18.3       |     
                       libheif |  DISTRO  | https://release-monitoring.org/project/064439 | 1.18.2       | 1.19.7       |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/001632 | 0.5.48       | 0.5.50       |     
                       libical |  DISTRO  | https://release-monitoring.org/project/001637 | 1.0.1        | 3.0.20       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/010656 | 1.15         | 1.18         | ORPH
                     libid3tag |  DISTRO  | https://release-monitoring.org/project/021478 | 0.15.1b      | 0.16.3       | ORPH
                        libidn |  DISTRO  | https://release-monitoring.org/project/001639 | 1.42         | 1.43         |     
                       libidn2 |  DISTRO  | https://release-monitoring.org/project/005597 | 2.3.7        | 2.3.8        |     
                        libiio |  DISTRO  | https://release-monitoring.org/project/015689 | 0.25         | 0.26         |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/021479 | 0.10.3       | 2.3.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/005781 | 1.27.0       | 1.28.0       | ORPH
                       libjcat |  DISTRO  | https://release-monitoring.org/project/229583 | 0.2.1        | 0.2.3        |     
                        libjwt |  DISTRO  | https://release-monitoring.org/project/242868 | 1.17.2       | 3.2.1        |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 2.0.5        | 2.0.6        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/021363 | 2.45         | 248          |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/021483 | 0.31         | 0.32         | ORPH
                    libmanette |  DISTRO  | https://release-monitoring.org/project/229630 | 0.2.9        | 0.2.11       |     
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/007470 | 1.10.0       | 1.12.2       |     
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.13.4       | 0.13.5       |     
                   libmediaart |  DISTRO  | https://release-monitoring.org/project/013148 | 1.9.6        | 1.9.7        |     
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/001986 | 2.2.7        | 2.3.2        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/016827 | 0.10.1alpha  | 1.11         |     
                        libndp |  DISTRO  | https://release-monitoring.org/project/014944 | 1.8          | 1.9          |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/031639 | 2.1.28       | 3.5.5        |     
        libnetfilter_conntrack |  DISTRO  | https://release-monitoring.org/project/001675 | 1.0.9        | 1.1.0        |     
                        libnfs |  DISTRO  | https://release-monitoring.org/project/007325 | 5.0.3        | 6.0.2        | ORPH
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/001681 | 1.2.7        | 1.2.8        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/001683 | 0.1.21       | 0.1.22       |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/075209 | 4.2.2        | 6.2.1        |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/002503 | 3.109        | 3.110        |     
                        libodb |  DISTRO  | https://release-monitoring.org/project/001687 | 2.4.0        | 2.5.0        | ORPH
                  libodb-boost |  DISTRO  | https://release-monitoring.org/project/001688 | 2.4.0        | 2.5.0        |     
                  libodb-mysql |  DISTRO  | https://release-monitoring.org/project/001689 | 2.4.0        | 2.5.0        |     
                  libodb-pgsql |  DISTRO  | https://release-monitoring.org/project/001690 | 2.4.0        | 2.5.0        | ORPH
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/021365 | 2.5.1        | 2.6.0        |     
                    libopenmpt |  DISTRO  | https://release-monitoring.org/project/141468 | 0.7.11       | 0.7.13       |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/010899 | 2023.8       | 2025.2       |     
                        libp11 |  DISTRO  | https://release-monitoring.org/project/001699 | 0.4.12       | 0.4.13       | ORPH
                       libpeas |  DISTRO  | https://release-monitoring.org/project/006871 | 1.32.0       | 2.0.7        | ORPH
                      libpjsip |  DISTRO  | https://release-monitoring.org/project/015701 | 2.14         | 2.15.1       |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/011675 | 2.4.0        | 2.6.0        | ORPH
                        libpng |  DISTRO  | https://release-monitoring.org/project/001705 | 1.6.46       | 1.6.47       |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/021367 | 7.9.2        | 7.10.0       |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/011042 | 1.6.0        | 1.6.1        | ORPH
                        libraw |  DISTRO  | https://release-monitoring.org/project/001709 | 0.21.2       | 0.21.3       |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/012102 | 3.9.2        | 4.0.0        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/005420 | 2.50.9       | 2.60.0       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/010717 | 2.0.5        | 2.0.6        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/013823 | 2.5.5        | 2.6.0        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/013150 | 0.20.5       | 0.21.7       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/001717 | 3.7          | 3.8.1        |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/001718 | 3.7          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/001719 | 3.7          | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/007961 | 3.4.0        | 3.6.0        |     
                     libsodium |  DISTRO  | https://release-monitoring.org/project/001728 | 1.0.18       | 1.0.20       |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/007908 | 0.7.30       | 0.7.31       |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/004864 | 1.9.3        | 2.1.0        |     
                       libspdm |  DISTRO  | https://release-monitoring.org/project/369161 | 3.5.0        | 3.6.0        |     
                       libssh2 |  DISTRO  | https://release-monitoring.org/project/001730 | 1.11.0       | 1.11.1       | ORPH
                    libstrophe |  DISTRO  | https://release-monitoring.org/project/015633 | 0.13.1       | 0.14.0       |     
                     libtalloc |  DISTRO  | https://release-monitoring.org/project/001733 | 2.4.2        | 2.4.3        |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/011793 | 1.1.1        | 1.2.0        | ORPH
                       libtool |  DISTRO  | https://release-monitoring.org/project/001741 | 2.4.6        | 2.5.4        | ORPH
                    libtorrent |  DISTRO  | https://release-monitoring.org/project/001742 | 0.13.8       | 0.15.2       | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/004166 | 1.2.19       | 2.0.11       |     
                       libtpms |  GUESS   | https://release-monitoring.org/project/116460 | 0.9.6        | 0.10.0       |     
                   libubootenv |  DISTRO  | https://release-monitoring.org/project/020618 | 0.3.5        | 0.3.6        |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/021371 | 0.8.2        | 0.9.2        |     
                   libucontext |  DISTRO  | https://release-monitoring.org/project/017085 | 1.2          | 1.3.2        |     
                     libuhttpd |  DISTRO  | https://release-monitoring.org/project/089386 | 3.14.1       | 3.14.2       |     
                   libunibreak |  DISTRO  | https://release-monitoring.org/project/326564 | 5.1          | 6.1          |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/021315 | 1.14.19      | 1.14.20      |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/015849 | 0.21.0       | 1.0.2        | ORPH
                       liburcu |  DISTRO  | https://release-monitoring.org/project/007134 | 0.14.0       | 0.15.1       |     
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.6          | 2.9          |     
                        libusb |  DISTRO  | https://release-monitoring.org/project/001749 | 1.0.27       | 1.0.28       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/005097 | 8.10.6       | 8.16.1       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/013830 | 7.10.0       | 11.1.0       |     
                  libvncserver |  DISTRO  | https://release-monitoring.org/project/001756 | 0.9.14       | 0.9.15       | ORPH
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.14.0       | 2023.4.0     |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/011181 | 4.3.3        | 4.3.5        |     
                        libxcb |  DISTRO  | https://release-monitoring.org/project/001767 | 1.15         | 1.17.0       | ORPH
                       libxml2 |  DISTRO  | https://release-monitoring.org/project/001783 | 2.13.6       | 2.14.0       |     
                       libxmlb |  GUESS   | https://release-monitoring.org/project/179028 | 0.3.19       | 0.3.22       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/011129 | 5.2.0        | 5.4.0        | ORPH
                       libxslt |  DISTRO  | https://release-monitoring.org/project/013301 | 1.1.42       | 1.1.43       |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/018554 | 2.1.148      | 3.7.8        |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 1.2.1        | 1.3.0        |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 1.2.1        | 1.3.0        |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/010649 | 1.10.1       | 1.11.3       | ORPH
                          lilv |  DISTRO  | https://release-monitoring.org/project/001818 | 0.24.12      | 0.24.26      |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/001823 | 4.4.8        | 5.2.6        | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20250211     | 20250311     |     
                     linux-pam |  DISTRO  | https://release-monitoring.org/project/012244 | 1.6.1        | 1.7.0        | ORPH
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/014535 | 1.6.0        | 1.7.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/012414 | 2021.05.03   | 2025.01.17   | ORPH
                  lksctp-tools |  DISTRO  | https://release-monitoring.org/project/021497 | 1.0.19       | 1.0.21       | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/001830 | 15.0.3       | 20.1.1       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/014019 | 1.0.18       | 1.0.19       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/001830 | 15.0.3       | 20.1.1       |     
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/010135 | 0.1.19       | 0.2.0        | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/001835 | 2.1.0        | 2.1.2        | ORPH
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/015330 | 1.3.1        | 1.4.0        |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/011671 | 1.0.1-1      | 1.2.2        |     
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/011649 | 0.9.5-1      | 0.9.6        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/000155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/007135 | 2.13.1       | 2.13.8       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/007141 | 2.13.10      | 2.13.17      |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/007136 | 2.13.8       | 2.13.14      |     
                           lua |  DISTRO  | https://release-monitoring.org/project/001847 | 5.1.5        | 5.4.7        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/013887 | 0.15-0       | 0.17.2       |     
                      luaposix |  DISTRO  | https://release-monitoring.org/project/011729 | 36.2.1       | 36.3         |     
                         lutok |  DISTRO  | https://release-monitoring.org/project/021509 | 0.4          | 0.6.1        | ORPH
                           luv |  DISTRO  | https://release-monitoring.org/project/021510 | 1.43.0-0     | 1.50.0-1     | ORPH
                          luvi |  DISTRO  | https://release-monitoring.org/project/021512 | 2.14.0       | 2.15.0       | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/005354 | 2.03.27      | 2.03.31      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/001860 | 5.0.3        | 6.0.3        |     
                         lynis |  DISTRO  | https://release-monitoring.org/project/001862 | 3.1.3        | 3.1.4        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2409         | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.5        | 1.7.6        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/001887 | 10.11.6      | 11.8.1       | ORPH
                  matchbox-lib |  DISTRO  | https://release-monitoring.org/project/021187 | 1.12         | 1.13         | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/001893 | 1.5.26       | 1.5.28       |     
                          mawk |  DISTRO  | https://release-monitoring.org/project/001953 | 1.3.4-202... | 1.3.4-202... |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/013824 | 2.28.10      | 3.6.3        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/015518 | 20220418     | 20241007     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/008093 | 194          | 204          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/016553 | 0.1.6.4      | 0.1.6.5      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/021746 | 4.4.8        | 5.4.2        | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/001965 | 1.6.29       | 1.6.38       | ORPH
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/001970 | 24.0.9       | 25.0.2       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/001970 | 24.0.9       | 25.0.2       | ORPH
                      metacity |  DISTRO  | https://release-monitoring.org/project/015392 | 2.25.1       | 3.54.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/021519 | 0.02         | 2.8.0        |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2024.06      | 2025.03      |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/010539 | 1.22.0       | 1.24.1       |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/001978 | 5.6.1        | 5.11.0       |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/021522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.0.8        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/021100 | 2024.12      | 2025.03      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/010267 | 20221107     | 20240407     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/020836 | 0.11.6       | 0.20.2       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/068638 | 2.9.7        | 3.0.14       |     
                         monit |  DISTRO  | https://release-monitoring.org/project/005483 | 5.34.3       | 5.34.4       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/006360 | 6.12.0.182   | 6.12.0.206   |     
                     mosquitto |  DISTRO  | https://release-monitoring.org/project/006078 | 2.0.20       | 2.0.21       |     
                           mpd |  DISTRO  | https://release-monitoring.org/project/014864 | 0.24         | 0.24.2       |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/002019 | 4.1.1        | 4.2.2        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/012413 | 1.32.8       | 1.32.10      |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/005348 | 0.35.1       | 0.40.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/012278 | 3.3.0        | 7.0.0        |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/002026 | 2.2.1        | 2.3.0        |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/008868 | 1.1.6        | 1.1.7        |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/002028 | 4.0.47       | 4.0.48       | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/000424 | 0.9.8        | 0.11.1       |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/002034 | 1.23.9       | 1.25.5       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/002035 | 2.2.13       | 2.2.14       |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/013545 | 3.3.1        | 4.0.4        |     
                       mxt-app |  DISTRO  | https://release-monitoring.org/project/373381 | 1.38         | 1.42         |     
                          nano |  DISTRO  | https://release-monitoring.org/project/002046 | 8.2          | 8.3          | ORPH
                       nanomsg |  DISTRO  | https://release-monitoring.org/project/014540 | 1.2          | 1.2.1        |     
                           nbd |  DISTRO  | https://release-monitoring.org/project/002052 | 3.25         | 3.26.1       | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/006045 | 1.21         | 2.8          |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/002055 | 0.49         | 0.52         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/002057 | 6.4-20230603 | 6.5-20250329 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/021531 | 1.0.7        | 1.0.8        | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/007604 | 0.33.0       | 0.34.0       | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 2.0.4        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/002063 | 3.1.19       | 4.2.0        | ORPH
                      netavark |  DISTRO  | https://release-monitoring.org/project/242639 | v1.14.0      | 1.14.1       | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/021534 | 1.218        | 1.228        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/011046 | 1.33.1       | 2.3.1        |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/021917 | 0.7.3        | 0.7.12       |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.1.49       | 2.2.35       |     
                   netsniff-ng |  DISTRO  | https://release-monitoring.org/project/002071 | 0.6.8        | 0.6.9        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/002062 | 5.9.3        | 5.9.4        | ORPH
                       netsurf |  DISTRO  | https://release-monitoring.org/project/005386 | 3.10         | 3.11         |     
                          newt |  DISTRO  | https://release-monitoring.org/project/015129 | 0.52.23      | 0.52.25      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.0        | 1.1.1        |     
               nftables-python |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.0        | 1.1.1        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/008651 | 1.64.0       | 1.65.0       | ORPH
                         nginx |  DISTRO  | https://release-monitoring.org/project/005413 | 1.26.3       | 1.27.4       | ORPH
                        ngircd |  DISTRO  | https://release-monitoring.org/project/002083 | 26.1         | 27           | ORPH
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/008251 | 22.13.1      | 23.10.0      |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/008251 | 22.13.1      | 23.10.0      |     
                          noip |  DISTRO  | https://release-monitoring.org/project/021539 | 2.1.9        | 3.0.0        | ORPH
                          norm |  DISTRO  | https://release-monitoring.org/project/021540 | 1.5.8        | 1.5.9        | ORPH
                 nss-pam-ldapd |  DISTRO  | https://release-monitoring.org/project/021868 | 0.9.12       | 0.9.13       |     
                       nushell |  DISTRO  | https://release-monitoring.org/project/031106 | 0.96.1       | 0.103.0      | ORPH
                           nut |  DISTRO  | https://release-monitoring.org/project/002510 | 2.8.2        | 2.8.2.2628   |     
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/002511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/021843 | 390.151      | 390.157      | ORPH
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 570.133.07   | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 560.35.03    | 570.133.07   |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/009074 | 1.12         | 2.12         | ORPH
                         oatpp |  DISTRO  | https://release-monitoring.org/project/370050 | 1.3.0        | 1.3.1        |     
                        octave |  DISTRO  | https://release-monitoring.org/project/002528 | 9.3.0        | 10.1.0       |     
                           odb |  DISTRO  | https://release-monitoring.org/project/002531 | 2.4.0        | 2.5.0        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/016859 | 2.2          | 2.16         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/033334 | v1.12.12     | 14.3.4       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/021545 | 4.3.1        | 4.3.2        | ORPH
                     oniguruma |  DISTRO  | https://release-monitoring.org/project/011184 | 6.9.9        | 6.9.10       |     
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/010861 | 2.1.9        | 2.1.11       |     
                     open-isns |  DISTRO  | https://release-monitoring.org/project/009393 | 0.102        | 0.103        |     
                     open-lldp |  DISTRO  | https://release-monitoring.org/project/115714 | 1.1          | 1.1.1        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/016896 | v1.3.15      | 1.4.11.1     | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/008172 | 1.22.0       | 1.24.3       | ORPH
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2024.05.08   | 2024.10.24   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/021548 | 0.1.5        | 0.1.6        | ORPH
                       opencsd |  DISTRO  | https://release-monitoring.org/project/368613 | 1.5.5        | 1.5.6        |     
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/006615 | 3.4.19       | 4.11.0       | ORPH
                       opencv4 |  DISTRO  | https://release-monitoring.org/project/006615 | 4.10.0       | 4.11.0       |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.11.0       | 0.13.1       |     
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 17.0.12+7    | 25+16        |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/006847 | 10.2.1       | 10.4.0       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/002554 | 4.1.5        | 5.0.7        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/011687 | 0.56         | 0.61         |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/021551 | 3.13.2       | 3.14.1       | ORPH
                        opensc |  DISTRO  | https://release-monitoring.org/project/002559 | 0.26.0       | 0.26.1       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/010998 | 11.3.5-18... | 12.5.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/059397 | 0.7.0        | 0.8.0        | ORPH
                          opus |  DISTRO  | https://release-monitoring.org/project/011081 | 1.4          | 1.5.2        |     
                           orc |  DISTRO  | https://release-monitoring.org/project/002573 | 0.4.34       | 0.4.41       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/021691 | 4.4.8        | 5.4.2        | ORPH
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/002582 | 0.25.3       | 0.25.5       | ORPH
                         p7zip |  DISTRO  | https://release-monitoring.org/project/002583 | 17.05        | 17.06        |     
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/021376 | 1.3.2        | 1.5.2        |     
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.27         | 1.29         |     
                         pango |  DISTRO  | https://release-monitoring.org/project/011783 | 1.54.0       | 1.56.3       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/007958 | 2.50.1       | 2.56.1       |     
                   pangomm2_46 |  DISTRO  | https://release-monitoring.org/project/369412 | 2.46.3       | 2.46.4       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/010309 | 0.7          | 0.65         | ORPH
                         patch |  DISTRO  | https://release-monitoring.org/project/002597 | 2.7.6        | 2.8          | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/002598 | 0.13         | 0.18.0       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/002601 | 1.3.7        | 1.3.8        | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/005832 | 10.44        | 10.45        | ORPH
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/002611 | 2.1.0        | 2.3.2        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/021378 | 3.5          | 3.6          |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/011930 | 2.33         | 3.04         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/002743 | 0.02         | 0.21         |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/002785 | 6.95         | 6.97         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/002807 | 4.046        | 5.011        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/002811 | 1.643        | 1.647        |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/012660 | 2.77         | 2.83         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/006175 | 12.50        | 13.25        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/006569 | 2.080        | 2.089        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/003024 | 6.77         | 6.78         |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/005966 | 9.38         | 9.39         |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/003136 | 20240924     | 20250202     |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/003147 | 1.48         | 1.50         |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/003163 | 0.72         | 0.74         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/011962 | 0.146        | 0.148        |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/014338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/003527 | 2.0134       | 2.0210       |     
                           php |  DISTRO  | https://release-monitoring.org/project/003627 | 8.3.19       | 8.4.5        |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/015603 | 2.0.0        | 2.1.2        |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/011010 | 5.1.22       | 5.1.24       |     
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/017400 | 3.2.0        | 3.3.0        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/021742 | 1.4          | 1.4.1        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/013302 | 3.3.1        | 3.4.2        |     
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/012515 | 2.2.3        | 2.2.4        | ORPH
                        physfs |  DISTRO  | https://release-monitoring.org/project/003631 | 3.0.2        | 3.2.0        |     
                      pico-sdk |  DISTRO  | https://release-monitoring.org/project/373461 | 1.5.1        | 2.1.1        |     
                      picotool |  DISTRO  | https://release-monitoring.org/project/373463 | 1.1.2        | 2.1.1        |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/057357 | 1.2.7        | 1.4.1        |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/012753 | 2.3.0        | 2.4.3        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/003674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/005418 | 1.13.2       | 1.14.1       |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 4.3          | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/003682 | 125          | 126          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/003686 | 22.12.0      | 25.03.0      |     
                         pound |  DISTRO  | https://release-monitoring.org/project/005436 | 4.8          | 4.16         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/010715 | 1.3.11       | 1.3.13       | ORPH
                       privoxy |  DISTRO  | https://release-monitoring.org/project/003712 | 3.0.34       | 4.0.0        |     
                         procs |  DISTRO  | https://release-monitoring.org/project/076458 | 0.14.9       | 0.14.10      |     
                       proftpd |  DISTRO  | https://release-monitoring.org/project/007609 | 1.3.8b       | 1.3.9        | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/021570 | 9.5.1        | 9.6.0        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/003709 | 0.11.14      | 13.0.0       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 29.3         | 30.2         |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/006499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/021825 | 6.0.1        | 6.4.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/003721 | 23.5         | 23.7         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/003726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/003728 | 1.14         | 1.15         |     
                         putty |  DISTRO  | https://release-monitoring.org/project/005749 | 0.81         | 0.83         |     
                            pv |  DISTRO  | https://release-monitoring.org/project/003736 | 1.9.0        | 1.9.31       | ORPH
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/021243 | 0.4.12       | 0.4.14       |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/003766 | 1.14.1       | 1.15.2       |     
                  python-anyio |  DISTRO  | https://release-monitoring.org/project/049275 | 4.8.0        | 4.9.0        |     
            python-argcomplete |  DISTRO  | https://release-monitoring.org/project/003773 | 3.5.3        | 3.6.1        |     
              python-async-lru |  DISTRO  | https://release-monitoring.org/project/056566 | 2.0.4        | 2.0.5        |     
               python-asyncssh |  DISTRO  | https://release-monitoring.org/project/017555 | 2.19.0       | 2.20.0       |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/015099 | 25.1.0       | 25.3.0       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/011984 | 2.16.0       | 2.17.0       |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/009047 | 4.2.1        | 4.3.0        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/003779 | 4.12.3       | 4.13.3       |     
               python-bitarray |  DISTRO  | https://release-monitoring.org/project/011014 | 3.0.0        | 3.3.0        |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/014665 | 4.3.0        | 4.3.1        |     
               python-bluezero |  DISTRO  | https://release-monitoring.org/project/021929 | 0.9.0        | 0.9.1        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/029737 | 1.36.3       | 1.37.23      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/008748 | 1.36.3       | 1.37.23      |     
                python-bsdiff4 |  DISTRO  | https://release-monitoring.org/project/044268 | 1.2.5        | 1.2.6        |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/007022 | 5.5.1        | 6.0.0b1      |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/014813 | 2.1.7        | 2.2.0a2      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/007995 | 2024.12.14   | 2025.1.31    |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/021937 | 4.2.0        | 4.2.2        |     
     python-charset-normalizer |  DISTRO  | https://release-monitoring.org/project/055366 | 3.4.0        | 3.4.1        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/020163 | 10.0.1       | 11.0.0b3     |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/019734 | 1.1.30       | 2.0.0        |     
                   python-cppy |  DISTRO  | https://release-monitoring.org/project/089055 | 1.3.0        | 1.3.1        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/005532 | 44.0.1       | 44.0.2       |     
              python-cssselect |  DISTRO  | https://release-monitoring.org/project/011593 | 1.2.0        | 1.3.0        |     
             python-cssselect2 |  DISTRO  | https://release-monitoring.org/project/086109 | 0.7.0        | 0.8.0        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/036699 | 3.0.11       | 3.0.12       |     
               python-dateutil |  DISTRO  | https://release-monitoring.org/project/005621 | 2.9.0        | 2.9.0.post0  |     
              python-dbus-fast |  DISTRO  | https://release-monitoring.org/project/287975 | 2.34.0       | 2.43.0       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/003819 | 5.1.1        | 5.2.1        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/003828 | 5.1.5        | 5.1.7        |     
                 python-dotenv |  DISTRO  | https://release-monitoring.org/project/019788 | 1.0.1        | 1.1.0        |     
               python-dtschema |  DISTRO  | https://release-monitoring.org/project/100908 | 2024.11      | 2025.2       |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/008370 | 0.19.0       | 0.19.1       |     
                  python-evdev |  DISTRO  | https://release-monitoring.org/project/062869 | 1.9.0        | 1.9.1        |     
                python-fastapi |  DISTRO  | https://release-monitoring.org/project/047977 | 0.115.8      | 0.115.12     |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/011739 | 3.17.0       | 3.18.0       |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/019867 | 5.0.0        | 5.0.1        |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/085010 | 2.0.7        | 25.2.10      |     
              python-flit-core |  DISTRO  | https://release-monitoring.org/project/044841 | 3.11.0       | 3.12.0       |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/007388 | 4.55.6       | 4.56.0       |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 11.13.0      | 15.2.0       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/013158 | 3.50.0       | 3.52.3       |     
        python-google-api-core |  DISTRO  | https://release-monitoring.org/project/025386 | 2.24.1       | 2.24.2       |     
python-googleapis-common-pr... |  DISTRO  | https://release-monitoring.org/project/063943 | 1.66.0       | 1.69.2       |     
          python-grpc-requests |  DISTRO  | https://release-monitoring.org/project/132701 | 0.1.20       | 0.1.21       |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/018429 | 1.70.0       | 1.71.0       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/030542 | 1.70.0       | 1.71.0       |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/019033 | 4.1.0        | 4.2.0        |     
                    python-hid |  DISTRO  | https://release-monitoring.org/project/049364 | 1.0.6        | 1.0.7        |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/019799 | 4.11.0       | 4.12.2       |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/011771 | 2.4.1        | 2.4.2-1      |     
              python-iniconfig |  DISTRO  | https://release-monitoring.org/project/114778 | 2.0.0        | 2.1.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/001399 | 8.31.0       | 8.32.0       |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/051611 | 1.5          | 1.7.0        |     
                python-jeepney |  DISTRO  | https://release-monitoring.org/project/019564 | 0.8.0        | 0.9.0        |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/003894 | 3.1.5        | 3.1.6        |     
             python-legacy-cgi |  DISTRO  | https://release-monitoring.org/project/375190 | 2.6.2        | 2.6.3        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/012301 | 3.2.0        | 3.3.1        |     
                python-logbook |  DISTRO  | https://release-monitoring.org/project/020016 | 1.8.0        | 1.8.1        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/003914 | 5.3.0        | 5.3.1        |     
         python-magic-wormhole |  DISTRO  | https://release-monitoring.org/project/017278 | 0.17.0       | 0.18.0       |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/003915 | 1.3.8        | 1.3.9        |     
            python-marshmallow |  DISTRO  | https://release-monitoring.org/project/008079 | 3.26.0       | 3.26.1       |     
 python-marshmallow-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/050566 | 1.4.0        | 1.4.1        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/003919 | 3.10.0       | 3.10.1       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/006189 | 3.1.0        | 3.1.3        |     
              python-multidict |  DISTRO  | https://release-monitoring.org/project/011132 | 6.1.0        | 6.2.0        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/002509 | 1.25.0       | 2.2.4        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.1.5        | 1.05a1       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/031737 | 3.10.15      | 3.10.16      |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/003954 | 3.5.0        | 3.5.1        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/003960 | 6.1.0        | 6.1.1        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/006529 | 25.0         | 25.0.1       |     
              python-propcache |  DISTRO  | https://release-monitoring.org/project/375192 | 0.2.1        | 0.3.1        |     
             python-proto-plus |  DISTRO  | https://release-monitoring.org/project/099887 | 1.26.0       | 1.26.1       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 29.3         | 30.2         |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/003978 | 6.1.1        | 7.0.0        |     
                python-psygnal |  DISTRO  | https://release-monitoring.org/project/218690 | 0.11.1       | 0.12.0       |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/011987 | 0.4.1        | 0.4.2        |     
          python-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/036851 | 3.21.0       | 3.22.0       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/021582 | 20241204.1   | 20250228.1   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/029768 | 2.10.6       | 2.11.1       |     
          python-pydantic-core |  DISTRO  | https://release-monitoring.org/project/273695 | 2.29.0       | 2.33.0       |     
      python-pydantic-settings |  DISTRO  | https://release-monitoring.org/project/342182 | 2.7.1        | 2.8.1        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/016219 | 0.31         | 0.32         |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/012004 | 2.14         | 2.15         |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/017320 | 1.23.22      | 1.25.4       |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/003756 | 3.2.1        | 3.2.3        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/015558 | 3.12.0       | 3.13.0       |     
     python-pyproject-metadata |  DISTRO  | https://release-monitoring.org/project/255630 | 0.9.0        | 0.9.1        |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/020104 | 5.15.6       | 5.15.11      |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/021589 | 1.2.10       | 1.2.11       |     
                  python-pysmi |  DISTRO  | https://release-monitoring.org/project/013209 | 1.5.9        | 1.5.11       |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/012027 | 7.1.16       | 7.1.17       |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/007273 | 0.25.3       | 0.26.0       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/006537 | 2024.2       | 2025.2       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/004104 | 25.1.2       | 26.3.0       |     
               python-reedsolo |  DISTRO  | https://release-monitoring.org/project/081160 | 1.7.0        | 2.0.13       |     
                python-rpds-py |  DISTRO  | https://release-monitoring.org/project/368622 | 0.22.3       | 0.24.0       |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/062048 | 0.10.0       | 0.12.0       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/019641 | 2.1.76       | 2.2.2        |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/010428 | 0.11.2       | 0.11.4       |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/004768 | 1.11.4       | 1.15.2       |     
                  python-segno |  DISTRO  | https://release-monitoring.org/project/059641 | 1.6.1        | 1.6.6        |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/005645 | 4.27.1       | 4.30.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/021603 | 2.21.0       | 2.24.1       |     
           python-setproctitle |  DISTRO  | https://release-monitoring.org/project/011699 | 1.3.4        | 1.3.5        |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/004021 | 76.0.0       | 78.1.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/007874 | 8.1.0        | 8.2.1        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/010429 | 2.2.1        | 2.2.2        |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/004026 | 3.19.3       | 3.20.1       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/021608 | 1.5.3        | 1.5.4        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/013626 | 4.19.25      | 6.10.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/012729 | 5.0.2        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/007203 | 0.6.1        | 0.7.3        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/004034 | 2.0.39       | 2.0.40       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/029718 | 2.0.0        | 2.0.1        |     
              python-starlette |  DISTRO  | https://release-monitoring.org/project/036570 | 0.45.3       | 0.46.1       |     
                   python-trio |  DISTRO  | https://release-monitoring.org/project/017451 | 0.28.0       | 0.29.0       |     
         python-trio-websocket |  DISTRO  | https://release-monitoring.org/project/136283 | 0.11.1       | 0.12.2       |     
      python-trove-classifiers |  DISTRO  | https://release-monitoring.org/project/088298 | 2025.1.15.22 | 2025.3.19.19 |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/038819 | 4.4.1        | 4.4.2        |     
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/019755 | 4.12.2       | 4.13.0       |     
                python-tzlocal |  DISTRO  | https://release-monitoring.org/project/006911 | 5.3          | 5.3.1        |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/011057 | 64.0         | 65.0         |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/008100 | 15.0         | 15.0.1       |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/012031 | 3.2.1        | 3.2.2        |     
               python-yamllint |  DISTRO  | https://release-monitoring.org/project/009761 | 1.35.1       | 1.37.0       |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/012681 | 0.141.0      | 0.146.1      |     
                    qbee-agent |  DISTRO  | https://release-monitoring.org/project/372328 | 2024.36      | 2024.50      |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/013607 | 9.2.0        | 9.2.3        |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/021737 | 2.4.7        | 2.5.0        | ORPH
                          qpdf |  DISTRO  | https://release-monitoring.org/project/005542 | 10.5.0       | 12.0.0       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/015198 | 0.35.0       | 0.40.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.8.3        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.8.3        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.8.3        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.8.3        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.14      | 6.8.3        |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.8.3        |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.8.3        |     
                       qt6mqtt |  DISTRO  | https://release-monitoring.org/project/242923 | 6.8.1        | 6.8.3        |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.8.3        |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.8.3        |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.8.3        |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/004141 | 1.4          | 1.5          |     
                     quotatool |  DISTRO  | https://release-monitoring.org/project/004146 | 1.6.4        | 1.6.5        | ORPH
                           qwt |  DISTRO  | https://release-monitoring.org/project/004147 | 6.1.6        | 6.3.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/013768 | 0.14.0       | 0.15.0       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/012105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/007426 | 1.9.3        | 1.9.4        |     
                     rdma-core |  DISTRO  | https://release-monitoring.org/project/012907 | 55.0         | 56.0         |     
                      readline |  DISTRO  | https://release-monitoring.org/project/004173 | 8.2          | 8.2.13       | ORPH
               redis-plus-plus |  DISTRO  | https://release-monitoring.org/project/368624 | 1.3.12       | 1.3.14       |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/021663 | 2.20240226   | 2.20250213   |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.5       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/016520 | 3.7          | 20200710     | ORPH
                         rhash |  DISTRO  | https://release-monitoring.org/project/013843 | 1.4.4        | 1.4.5        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/021389 | 1.10.5       | 2.0.1        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/015461 | 14.1.0       | 14.1.1       |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/015560 | 6.20.3       | 9.11.2       |     
                       rtl_433 |  DISTRO  | https://release-monitoring.org/project/014997 | 23.11        | 25.02        |     
                      rtorrent |  DISTRO  | https://release-monitoring.org/project/004221 | 0.9.8        | 0.15.2       | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/087994 | 8.1.2        | 8.1.3        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/007462 | 1.2.4        | 1.2.6        |     
                          rust |  DISTRO  | https://release-monitoring.org/project/007635 | 1.82.0       | 1.85.1       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/007635 | 1.82.0       | 1.85.1       |     
                  rust-bindgen |  DISTRO  | https://release-monitoring.org/project/017910 | 0.65.1       | 0.71.1       | ORPH
                         rygel |  DISTRO  | https://release-monitoring.org/project/004751 | 0.42.5       | 0.44.2       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/010714 | 2.33.1       | 2.37.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/005485 | 2.13.0.0     | 2.13.1.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/016547 | 2.3.7.2      | 2.4.0.0      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/016552 | 1.1.2.0      | 1.1.2.1      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/016551 | 2.6.2.0      | 2.6.2.1      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/016550 | 2.7.0.3      | 2.7.0.4      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/016549 | 2.3.0.3      | 2.3.0.4      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/016548 | 0.5.4.3      | 0.5.5.0      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/021385 | 3.7.1        | 08032024     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/004758 | 4.21.3       | 4.22.0       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/004760 | 1.1.1        | 1.3.1        |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/016338 | 2.0          | 2.1          |     
                         scons |  DISTRO  | https://release-monitoring.org/project/004770 | 4.8.1        | 4.9.1        |     
                   screenfetch |  DISTRO  | https://release-monitoring.org/project/005733 | 3.9.1        | 3.9.9        | ORPH
                        scrypt |  DISTRO  | https://release-monitoring.org/project/021238 | 1.3.2        | 1.3.3        |     
                    sdl2_image |  DISTRO  | https://release-monitoring.org/project/004781 | 2.8.4        | 3.2.4        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/004782 | 2.6.3        | 2.8.1        | ORPH
                      sdl2_ttf |  DISTRO  | https://release-monitoring.org/project/004784 | 2.24.0       | 3.2.0        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/004778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/010262 | 1.0.3        | 2.0.4        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/004787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/015203 | 1.20.0       | 1.49.9       |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/001717 | 3.7          | 3.8.1        |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.7          | 3.8.1        | ORPH
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 2.20.3       | 2.43.0       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.8.3        |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/021655 | 4.3.8        | 4.6.4        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.32.4       |     
                        shadow |  DISTRO  | https://release-monitoring.org/project/004802 | 4.17.3       | 4.17.4       |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/021384 | 3.3.9        | 4.3.7        | ORPH
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/005524 | 1.12         | 2.4          | ORPH
                          shim |  DISTRO  | https://release-monitoring.org/project/010719 | 15.8         | 16.0         |     
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.1.0        | ORPH
                       skalibs |  DISTRO  | https://release-monitoring.org/project/005486 | 2.14.2.0     | 2.14.3.0     |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/096796 | 4.8.0        | 4.9.0        | ORPH
                        snappy |  DISTRO  | https://release-monitoring.org/project/004844 | 1.2.1        | 1.2.2        | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/017075 | 1.7.0        | 1.8.2        | ORPH
                  snmpclitools |  DISTRO  | https://release-monitoring.org/project/031640 | 0.6.4        | 0.7.2        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/021318 | 3.5.1        | 3.6.2        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/013263 | 3.1.40.0     | 3.7.1.0      |     
                         socat |  DISTRO  | https://release-monitoring.org/project/004848 | 1.8.0.2      | 1.8.0.3      |     
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.18      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/010152 | 0.7          | 0.8          |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/005388 | 1.6.4        | 1.6.6        | ORPH
                        spdlog |  DISTRO  | https://release-monitoring.org/project/015599 | 1.15.1       | 1.15.2       |     
                       speechd |  DISTRO  | https://release-monitoring.org/project/328138 | 0.11.5       | 0.12.0       |     
                   spirv-tools |  DISTRO  | https://release-monitoring.org/project/334920 | 1.3.261.1    | 1.4.309.0    | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/011213 | 4.5.5        | 4.7.0        |     
                        sqlite |  DISTRO  | https://release-monitoring.org/project/004877 | 3.48.0       | 3.49.1       |     
                         squid |  DISTRO  | https://release-monitoring.org/project/004880 | 6.13         | 7.0.1        | ORPH
                        sratom |  DISTRO  | https://release-monitoring.org/project/014903 | 0.6.14       | 0.6.18       |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/006184 | 2.0.1        | 2.1.4        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/008127 | 1.20.7.1     | 1.22.18      | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/006861 | 6.7.1        | 7.0c         |     
                    stellarium |  DISTRO  | https://release-monitoring.org/project/004891 | 24.3         | 25.1         |     
                        strace |  DISTRO  | https://release-monitoring.org/project/004897 | 6.13         | 6.14         |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/012538 | 0.18.05      | 0.18.12      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/004899 | 5.9.14       | 6.0.1        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/004901 | 5.71         | 5.74         |     
                   superiotool |  DISTRO  | https://release-monitoring.org/project/010128 | 24.05        | 25.03        |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/010925 | 6.0.19       | 7.0.10       |     
                          sway |  DISTRO  | https://release-monitoring.org/project/011497 | 1.10         | 1.10.1       |     
                          swig |  DISTRO  | https://release-monitoring.org/project/004919 | 4.1.1        | 4.3.0        |     
                         swipl |  DISTRO  | https://release-monitoring.org/project/236197 | 9.2.8        | 9.2.9        |     
                         swtpm |  GUESS   | https://release-monitoring.org/project/116461 | 0.8.2        | 0.10.0       |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/005718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/016898 | 0.29.3       | 0.40.1       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/004930 | 4.7.1        | 4.8.1        |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/021649 | 47.2         | 48.0         |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/034820 | 2.2.150      | 3.3.10       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/004931 | 12.7.5       | 12.7.7       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/005440 | 256.7        | 257.4        |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/011774 | 233          | 235          | ORPH
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/021648 | 3.13         | 3.14         | ORPH
                     tailscale |  DISTRO  | https://release-monitoring.org/project/141585 | 1.78.1       | 1.82.0       |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/009174 | 2.1.58       | 3.0.1        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/008217 | 2021.12.0    | 2022.1.0     |     
                     tcf-agent |  DISTRO  | https://release-monitoring.org/project/021833 | 1.8.0        | 1.9.0        |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/004941 | 8.6.15       | 9.0.1        | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/004942 | 1.2.4        | 1.2.5        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/004943 | 1.21         | 2.0          |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/013716 | 4.4.4        | 4.5.1        | ORPH
                      tealdeer |  DISTRO  | https://release-monitoring.org/project/084521 | 1.6.1        | 1.7.2        |     
               tensorflow-lite |  DISTRO  | https://release-monitoring.org/project/016141 | 2.11.0       | 2.19.0       |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/004951 | 1.12.1       | 1.14.0       |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/014500 | 2.5.6        | 2.5.9        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/005581 | 0.14.1       | 0.21.0       | ORPH
                           tig |  DISTRO  | https://release-monitoring.org/project/004969 | 2.5.10       | 2.5.12       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 4.1.0        | 5.0.2        |     
                      tinycbor |  DISTRO  | https://release-monitoring.org/project/021379 | 0.6.0        | 0.6.1        |     
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/014678 | 20240101     | 20250201     |     
                           tio |  DISTRO  | https://release-monitoring.org/project/020587 | 3.5          | 3.8          |     
                       tipidee |  DISTRO  | https://release-monitoring.org/project/373437 | 0.0.5.0      | 0.0.5.1      |     
                            tk |  DISTRO  | https://release-monitoring.org/project/011426 | 8.6.15       | 9.0.1        |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.1.0        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/004980 | 3.3a         | 3.5a         | ORPH
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/021640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/016819 | 2.3.3        | 3.0.0        | ORPH
                  tpm2-openssl |  DISTRO  | https://release-monitoring.org/project/242488 | 1.2.0        | 1.3.0        |     
                   tpm2-pkcs11 |  DISTRO  | https://release-monitoring.org/project/018777 | 1.9.0        | 1.9.1        |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/018790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/012683 | 3.2.2        | 4.1.3        | ORPH
                    traceroute |  DISTRO  | https://release-monitoring.org/project/014877 | 2.1.3        | 2.1.6        |     
                          tree |  DISTRO  | https://release-monitoring.org/project/005006 | 2.1.1        | 2.2.1        |     
                        tzdata |  DISTRO  | https://release-monitoring.org/project/005021 | 2025a        | 2025b        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/005022 | 2021.07      | 2025.01      | ORPH
                       udpcast |  DISTRO  | https://release-monitoring.org/project/010206 | 20230924     | 20250223     | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.17         | ORPH
                           uhd |  DISTRO  | https://release-monitoring.org/project/012572 | 4.7.0.0      | 4.8.0.0      |     
                       unbound |  DISTRO  | https://release-monitoring.org/project/005042 | 1.21.1       | 1.22.0       |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/017617 | 2.1          | 3.6          | ORPH
                         unrar |  DISTRO  | https://release-monitoring.org/project/013306 | 6.2.12       | 7.1.6        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/015848 | 1.5.12       | 1.9.3        | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/005056 | 0.99.19      | 1.90.7       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/013737 | 4.2.1        | 5.0.0        |     
                usb_modeswitch |  DISTRO  | https://release-monitoring.org/project/005059 | 2.6.1        | 2.6.2        | ORPH
                      usbguard |  DISTRO  | https://release-monitoring.org/project/011151 | 1.1.2        | 1.1.3        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/016012 | 0.14.0       | 0.15.0       | ORPH
                     ustreamer |  DISTRO  | https://release-monitoring.org/project/314869 | 6.29         | 6.36         |     
                      utf8proc |  DISTRO  | https://release-monitoring.org/project/007455 | 2.9.0        | 2.10.0       | ORPH
                    util-linux |  DISTRO  | https://release-monitoring.org/project/008179 | 2.40.2       | 2.41         | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/008179 | 2.40.2       | 2.41         | ORPH
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/010956 | 0.13.2       | 0.14.0       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/005065 | 0.56.17      | 0.56.18      | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/018452 | 1.0.2        | 1.0.4        | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/005069 | 2.6.5        | 2.7.4        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/005080 | 1.8.0        | 1.8.3        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/005092 | 9.1.0145     | 9.1.1263     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 9.1.9        |     
                           vlc |  DISTRO  | https://release-monitoring.org/project/006504 | 3.0.21       | 3.0.21-1     |     
                        vnstat |  DISTRO  | https://release-monitoring.org/project/007283 | 2.11         | 2.13         |     
                          volk |  DISTRO  | https://release-monitoring.org/project/147733 | 3.1.2        | 3.2.0        |     
                           vte |  DISTRO  | https://release-monitoring.org/project/010895 | 0.66.2       | 0.80.0       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/089353 | 3.5.12       | 3.5.13       |     
                  vuejs-router |  DISTRO  | https://release-monitoring.org/project/234796 | 4.4.5        | 4.5.0        |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/088835 | 1.3.262      | 1.4.311      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.3.262      | 1.4.311      | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.3.262      | 1.4.311      | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/005116 | 2.1.1        | 2.1.5        |     
                        waffle |  DISTRO  | https://release-monitoring.org/project/021633 | 1.7.0        | 1.8.1        |     
                       wavemon |  DISTRO  | https://release-monitoring.org/project/005120 | 0.9.5        | 0.9.6        | ORPH
                       wavpack |  DISTRO  | https://release-monitoring.org/project/005121 | 5.7.0        | 5.8.1        | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/005355 | 2.46.4       | 2.48.0       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/015929 | 1.3          | 2.1          | ORPH
                         which |  DISTRO  | https://release-monitoring.org/project/005127 | 2.21         | 2.23         | ORPH
                          wine |  DISTRO  | https://release-monitoring.org/project/005134 | 10.0         | 10.4         |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/015257 | 2024.10.07   | 2025.02.20   |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.5.5        | 0.5.8        | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/005137 | 4.2.9        | 4.4.5        | ORPH
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.1.0        | 3.8.0        |     
                    wpan-tools |  DISTRO  | https://release-monitoring.org/project/021835 | 0.9          | 0.10         | ORPH
                wpebackend-fdo |  DISTRO  | https://release-monitoring.org/project/017547 | 1.14.3       | 1.16.0       |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/017557 | 2.44.4       | 2.48.0       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.41.0       | 0.43.0       | ORPH
                          x265 |  DISTRO  | https://release-monitoring.org/project/007275 | 3.5          | 4.1          |     
                   xapp_appres |  DISTRO  | https://release-monitoring.org/project/015053 | 1.0.6        | 1.0.7        | ORPH
                 xapp_bdftopcf |  DISTRO  | https://release-monitoring.org/project/015054 | 1.1.1        | 1.1.2        | ORPH
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/000191 | 1.1.0        | 1.1.1        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/017160 | 1.0.8        | 1.0.9        | ORPH
               xapp_fonttosfnt |  DISTRO  | https://release-monitoring.org/project/021723 | 1.2.2        | 1.2.4        | ORPH
                xapp_fslsfonts |  DISTRO  | https://release-monitoring.org/project/017157 | 1.0.6        | 1.0.7        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/015048 | 1.0.9        | 1.0.10       | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/017161 | 1.0.5        | 1.0.6        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/015047 | 1.1.1        | 20240910     | ORPH
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/015043 | 1.2.2        | 1.2.3        | ORPH
                   xapp_oclock |  DISTRO  | https://release-monitoring.org/project/015042 | 1.0.5        | 1.0.6        | ORPH
                  xapp_x11perf |  DISTRO  | https://release-monitoring.org/project/015035 | 1.6.2        | 1.7.0        | ORPH
                    xapp_xauth |  DISTRO  | https://release-monitoring.org/project/005253 | 1.1.2        | 1.1.4        | ORPH
               xapp_xbacklight |  DISTRO  | https://release-monitoring.org/project/005161 | 1.2.3        | 1.2.4        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/015034 | 1.0.4        | 1.0.5        | ORPH
               xapp_xclipboard |  DISTRO  | https://release-monitoring.org/project/015033 | 1.1.4        | 1.1.5        | ORPH
                   xapp_xcmsdb |  DISTRO  | https://release-monitoring.org/project/015031 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xcompmgr |  DISTRO  | https://release-monitoring.org/project/005174 | 1.1.9        | 1.1.10       | ORPH
                 xapp_xconsole |  DISTRO  | https://release-monitoring.org/project/015030 | 1.0.8        | 1.1.0        |     
                 xapp_xditview |  DISTRO  | https://release-monitoring.org/project/021262 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xdm |  DISTRO  | https://release-monitoring.org/project/005255 | 1.1.14       | 1.1.17       | ORPH
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/005180 | 1.2.3        | 1.2.4        | ORPH
                      xapp_xev |  DISTRO  | https://release-monitoring.org/project/015026 | 1.2.5        | 1.2.6        | ORPH
                    xapp_xeyes |  DISTRO  | https://release-monitoring.org/project/015025 | 1.2.0        | 1.3.0        | ORPH
                 xapp_xfontsel |  DISTRO  | https://release-monitoring.org/project/015023 | 1.1.0        | 1.1.1        | ORPH
                      xapp_xfs |  DISTRO  | https://release-monitoring.org/project/005256 | 1.2.1        | 1.2.2        | ORPH
                    xapp_xhost |  DISTRO  | https://release-monitoring.org/project/015021 | 1.0.9        | 1.0.10       | ORPH
                    xapp_xinit |  DISTRO  | https://release-monitoring.org/project/005258 | 1.4.2        | 1.4.4        | ORPH
                  xapp_xkbcomp |  DISTRO  | https://release-monitoring.org/project/015018 | 1.4.6        | 1.4.7        | ORPH
                   xapp_xkbevd |  DISTRO  | https://release-monitoring.org/project/015017 | 1.1.5        | 1.1.6        | ORPH
                 xapp_xkbprint |  DISTRO  | https://release-monitoring.org/project/017159 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xkbutils |  DISTRO  | https://release-monitoring.org/project/015016 | 1.0.5        | 1.0.6        | ORPH
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/014992 | 1.1.4        | 1.2.0        | ORPH
                    xapp_xlogo |  DISTRO  | https://release-monitoring.org/project/014991 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/014964 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xmag |  DISTRO  | https://release-monitoring.org/project/014963 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xman |  DISTRO  | https://release-monitoring.org/project/014962 | 1.1.5        | 1.2.0        | ORPH
                 xapp_xmessage |  DISTRO  | https://release-monitoring.org/project/014961 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xmh |  DISTRO  | https://release-monitoring.org/project/021718 | 1.0.4        | 1.0.5        | ORPH
                    xapp_xmore |  DISTRO  | https://release-monitoring.org/project/018845 | 1.0.3        | 1.0.4        | ORPH
                      xapp_xpr |  DISTRO  | https://release-monitoring.org/project/014959 | 1.1.0        | 1.2.0        | ORPH
                    xapp_xprop |  DISTRO  | https://release-monitoring.org/project/014958 | 1.2.6        | 1.2.8        | ORPH
                   xapp_xrandr |  DISTRO  | https://release-monitoring.org/project/014957 | 1.5.2        | 1.5.3        | ORPH
                 xapp_xrefresh |  DISTRO  | https://release-monitoring.org/project/014955 | 1.0.7        | 1.1.0        | ORPH
                      xapp_xsm |  DISTRO  | https://release-monitoring.org/project/005259 | 1.0.5        | 1.0.6        | ORPH
                     xapp_xwud |  DISTRO  | https://release-monitoring.org/project/014948 | 1.0.6        | 1.0.7        | ORPH
                     xcb-proto |  DISTRO  | https://release-monitoring.org/project/013646 | 1.15.2       | 1.17.0       | ORPH
               xcb-util-cursor |  DISTRO  | https://release-monitoring.org/project/005166 | 0.1.4        | 0.1.5        | ORPH
      xdriver_xf86-input-evdev |  DISTRO  | https://release-monitoring.org/project/005217 | 2.10.6       | 2.11.0       | ORPH
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/005782 | 1.3.0        | 1.5.0        | ORPH
  xdriver_xf86-input-synaptics |  DISTRO  | https://release-monitoring.org/project/005239 | 1.9.2        | 1.10.0       | ORPH
        xdriver_xf86-video-ast |  DISTRO  | https://release-monitoring.org/project/017163 | 1.1.6        | 1.2.0        | ORPH
      xdriver_xf86-video-fbdev |  DISTRO  | https://release-monitoring.org/project/005218 | 0.5.0        | 0.5.1        | ORPH
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/005219 | 2.11.21      | 2.18.1       | ORPH
     xdriver_xf86-video-mach64 |  DISTRO  | https://release-monitoring.org/project/005225 | 6.9.7        | 6.10.0       | ORPH
        xdriver_xf86-video-mga |  DISTRO  | https://release-monitoring.org/project/005226 | 2.0.1        | 2.1.0        | ORPH
    xdriver_xf86-video-nouveau |  DISTRO  | https://release-monitoring.org/project/005229 | 1.0.17       | 1.0.18       | ORPH
         xdriver_xf86-video-nv |  DISTRO  | https://release-monitoring.org/project/021711 | 2.1.22       | 2.1.23       | ORPH
       xdriver_xf86-video-r128 |  DISTRO  | https://release-monitoring.org/project/005232 | 6.12.1       | 6.13.0       | ORPH
     xdriver_xf86-video-savage |  DISTRO  | https://release-monitoring.org/project/005235 | 2.4.0        | 2.4.1        | ORPH
xdriver_xf86-video-siliconm... |  DISTRO  | https://release-monitoring.org/project/005236 | 1.7.9        | 1.7.10       | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/005181 | 4.14.6       | 4.20.0       |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/005182 | 3.2.4        | 3.3.0        | ORPH
               xfont_encodings |  DISTRO  | https://release-monitoring.org/project/015051 | 1.0.7        | 1.1.0        | ORPH
 xfont_font-adobe-utopia-75dpi |  DISTRO  | https://release-monitoring.org/project/017200 | 1.0.4        | 1.0.5        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/015055 | 1.4.0        | 1.4.1        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/005188 | 6.11.0       | 6.13.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/006382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/005191 | 2.38         | 2.44         | ORPH
                    xlib_libFS |  DISTRO  | https://release-monitoring.org/project/001618 | 1.0.9        | 1.0.10       | ORPH
                   xlib_libICE |  DISTRO  | https://release-monitoring.org/project/001638 | 1.1.1        | 1.1.2        | ORPH
                    xlib_libSM |  DISTRO  | https://release-monitoring.org/project/001726 | 1.2.4        | 1.2.6        | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/001764 | 1.8.7        | 1.8.12       | ORPH
                   xlib_libXau |  DISTRO  | https://release-monitoring.org/project/001765 | 1.0.11       | 1.0.12       | ORPH
                   xlib_libXaw |  DISTRO  | https://release-monitoring.org/project/001766 | 1.0.15       | 1.0.16       | ORPH
               xlib_libXcursor |  DISTRO  | https://release-monitoring.org/project/001770 | 1.2.1        | 1.2.3        | ORPH
                 xlib_libXdmcp |  DISTRO  | https://release-monitoring.org/project/001772 | 1.1.4        | 1.1.5        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/001774 | 1.3.5        | 1.3.6        | ORPH
                xlib_libXfont2 |  DISTRO  | https://release-monitoring.org/project/017165 | 2.0.6        | 2.0.7        | ORPH
                    xlib_libXi |  DISTRO  | https://release-monitoring.org/project/001778 | 1.8.1        | 1.8.2        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/001785 | 1.1.4        | 1.2.1        | ORPH
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/001788 | 1.5.3        | 1.5.4        | ORPH
               xlib_libXrender |  DISTRO  | https://release-monitoring.org/project/001789 | 0.9.11       | 0.9.12       | ORPH
                    xlib_libXt |  DISTRO  | https://release-monitoring.org/project/001793 | 1.3.0        | 1.3.1        | ORPH
                  xlib_libXtst |  DISTRO  | https://release-monitoring.org/project/001794 | 1.2.4        | 1.2.5        | ORPH
                    xlib_libXv |  DISTRO  | https://release-monitoring.org/project/001795 | 1.0.12       | 1.0.13       | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/001796 | 1.0.13       | 1.0.14       | ORPH
               xlib_libXxf86vm |  DISTRO  | https://release-monitoring.org/project/001799 | 1.1.5        | 1.1.6        | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/001613 | 1.1.7        | 1.1.8        | ORPH
                  xlib_libxcvt |  DISTRO  | https://release-monitoring.org/project/235147 | 0.1.2        | 0.1.3        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/001781 | 1.1.2        | 1.1.3        | ORPH
                   xlib_xtrans |  DISTRO  | https://release-monitoring.org/project/013441 | 1.5.0        | 1.6.0        | ORPH
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/005269 | 6.03         | 6.09         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/007736 | 3.24         | 3.27         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/005272 | 389          | 397          | ORPH
              xutil_makedepend |  DISTRO  | https://release-monitoring.org/project/013528 | 1.0.8        | 1.0.9        | ORPH
             xutil_util-macros |  DISTRO  | https://release-monitoring.org/project/015037 | 1.20.0       | 1.20.2       | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/005277 | 5.6.4        | 5.8.0        | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/005280 | 0.40.0       | 14.1         |     
                            z3 |  DISTRO  | https://release-monitoring.org/project/007812 | 4.13.3       | 4.14.1       |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/005492 | 7.2.3        | 7.2.5        |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.5.1        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 7.1.1        |     
                           zic |  DISTRO  | https://release-monitoring.org/project/016905 | 2025a        | 2025b        |     
                        zoxide |  DISTRO  | https://release-monitoring.org/project/098400 | 0.9.6        | 0.9.7        |     
                       zziplib |  DISTRO  | https://release-monitoring.org/project/013802 | 0.13.74      | 0.13.78      |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-2152    | https://security-tracker.debian.org/tracker/CVE-2025-2152   
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          dpdk | CVE-2015-1142857 | https://security-tracker.debian.org/tracker/CVE-2015-1142857
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2024-45778   | https://security-tracker.debian.org/tracker/CVE-2024-45778  
                         grub2 | CVE-2024-45782   | https://security-tracker.debian.org/tracker/CVE-2024-45782  
                         grub2 | CVE-2024-45779   | https://security-tracker.debian.org/tracker/CVE-2024-45779  
                         grub2 | CVE-2024-45780   | https://security-tracker.debian.org/tracker/CVE-2024-45780  
                         grub2 | CVE-2025-0678    | https://security-tracker.debian.org/tracker/CVE-2025-0678   
                    gstreamer1 | CVE-2024-47613   | https://security-tracker.debian.org/tracker/CVE-2024-47613  
                    gstreamer1 | CVE-2024-47607   | https://security-tracker.debian.org/tracker/CVE-2024-47607  
                    gstreamer1 | CVE-2024-47602   | https://security-tracker.debian.org/tracker/CVE-2024-47602  
                    gstreamer1 | CVE-2024-47615   | https://security-tracker.debian.org/tracker/CVE-2024-47615  
                    gstreamer1 | CVE-2024-47603   | https://security-tracker.debian.org/tracker/CVE-2024-47603  
                    gstreamer1 | CVE-2024-47600   | https://security-tracker.debian.org/tracker/CVE-2024-47600  
                    gstreamer1 | CVE-2024-47601   | https://security-tracker.debian.org/tracker/CVE-2024-47601  
                    gstreamer1 | CVE-2024-47606   | https://security-tracker.debian.org/tracker/CVE-2024-47606  
                    gstreamer1 | CVE-2024-47774   | https://security-tracker.debian.org/tracker/CVE-2024-47774  
                    gstreamer1 | CVE-2024-47777   | https://security-tracker.debian.org/tracker/CVE-2024-47777  
                    gstreamer1 | CVE-2024-47776   | https://security-tracker.debian.org/tracker/CVE-2024-47776  
                    gstreamer1 | CVE-2024-47775   | https://security-tracker.debian.org/tracker/CVE-2024-47775  
                    gstreamer1 | CVE-2024-47778   | https://security-tracker.debian.org/tracker/CVE-2024-47778  
                    gstreamer1 | CVE-2024-47835   | https://security-tracker.debian.org/tracker/CVE-2024-47835  
                    gstreamer1 | CVE-2024-47834   | https://security-tracker.debian.org/tracker/CVE-2024-47834  
                    gstreamer1 | CVE-2024-47541   | https://security-tracker.debian.org/tracker/CVE-2024-47541  
                    gstreamer1 | CVE-2024-47543   | https://security-tracker.debian.org/tracker/CVE-2024-47543  
                    gstreamer1 | CVE-2024-47545   | https://security-tracker.debian.org/tracker/CVE-2024-47545  
                    gstreamer1 | CVE-2024-47540   | https://security-tracker.debian.org/tracker/CVE-2024-47540  
                    gstreamer1 | CVE-2024-47537   | https://security-tracker.debian.org/tracker/CVE-2024-47537  
                    gstreamer1 | CVE-2024-47542   | https://security-tracker.debian.org/tracker/CVE-2024-47542  
                    gstreamer1 | CVE-2024-47599   | https://security-tracker.debian.org/tracker/CVE-2024-47599  
                    gstreamer1 | CVE-2024-47539   | https://security-tracker.debian.org/tracker/CVE-2024-47539  
                    gstreamer1 | CVE-2024-47546   | https://security-tracker.debian.org/tracker/CVE-2024-47546  
                    gstreamer1 | CVE-2024-47596   | https://security-tracker.debian.org/tracker/CVE-2024-47596  
                    gstreamer1 | CVE-2024-47597   | https://security-tracker.debian.org/tracker/CVE-2024-47597  
                    gstreamer1 | CVE-2024-47544   | https://security-tracker.debian.org/tracker/CVE-2024-47544  
                    gstreamer1 | CVE-2024-47538   | https://security-tracker.debian.org/tracker/CVE-2024-47538  
                    gstreamer1 | CVE-2024-47598   | https://security-tracker.debian.org/tracker/CVE-2024-47598  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                    libarchive | CVE-2025-1632    | https://security-tracker.debian.org/tracker/CVE-2025-1632   
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                   libopenh264 | CVE-2025-27091   | https://security-tracker.debian.org/tracker/CVE-2025-27091  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                     linux-pam | CVE-2024-10041   | https://security-tracker.debian.org/tracker/CVE-2024-10041  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mupdf | CVE-2024-24258   | https://security-tracker.debian.org/tracker/CVE-2024-24258  
                         mupdf | CVE-2024-24259   | https://security-tracker.debian.org/tracker/CVE-2024-24259  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2024-49393   | https://security-tracker.debian.org/tracker/CVE-2024-49393  
                          mutt | CVE-2024-49395   | https://security-tracker.debian.org/tracker/CVE-2024-49395  
                          mutt | CVE-2024-49394   | https://security-tracker.debian.org/tracker/CVE-2024-49394  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2025-26465   | https://security-tracker.debian.org/tracker/CVE-2025-26465  
                       openssh | CVE-2025-26466   | https://security-tracker.debian.org/tracker/CVE-2025-26466  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                           orc | CVE-2024-40897   | https://security-tracker.debian.org/tracker/CVE-2024-40897  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2023-0778    | https://security-tracker.debian.org/tracker/CVE-2023-0778   
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                       qt5base | CVE-2011-3193    | https://security-tracker.debian.org/tracker/CVE-2011-3193   
                       qt5base | CVE-2012-6093    | https://security-tracker.debian.org/tracker/CVE-2012-6093   
                       qt5base | CVE-2014-0190    | https://security-tracker.debian.org/tracker/CVE-2014-0190   
                       qt5base | CVE-2015-1290    | https://security-tracker.debian.org/tracker/CVE-2015-1290   
                       qt5base | CVE-2017-10904   | https://security-tracker.debian.org/tracker/CVE-2017-10904  
                       qt5base | CVE-2017-10905   | https://security-tracker.debian.org/tracker/CVE-2017-10905  
                       qt5base | CVE-2018-21035   | https://security-tracker.debian.org/tracker/CVE-2018-21035  
                       qt5base | CVE-2018-19869   | https://security-tracker.debian.org/tracker/CVE-2018-19869  
                       qt5base | CVE-2018-19871   | https://security-tracker.debian.org/tracker/CVE-2018-19871  
                       qt5base | CVE-2018-19870   | https://security-tracker.debian.org/tracker/CVE-2018-19870  
                       qt5base | CVE-2018-19873   | https://security-tracker.debian.org/tracker/CVE-2018-19873  
                       qt5base | CVE-2020-0570    | https://security-tracker.debian.org/tracker/CVE-2020-0570   
                       qt5base | CVE-2020-17507   | https://security-tracker.debian.org/tracker/CVE-2020-17507  
                       qt5base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sngrep | CVE-2024-3119    | https://security-tracker.debian.org/tracker/CVE-2024-3119   
                        sngrep | CVE-2024-3120    | https://security-tracker.debian.org/tracker/CVE-2024-3120   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                      unixodbc | CVE-2024-1013    | https://security-tracker.debian.org/tracker/CVE-2024-1013   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                           vim | CVE-2024-45306   | https://security-tracker.debian.org/tracker/CVE-2024-45306  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                        xerces | CVE-2024-23807   | https://security-tracker.debian.org/tracker/CVE-2024-23807  
                      xwayland | CVE-2025-26601   | https://security-tracker.debian.org/tracker/CVE-2025-26601  
                      xwayland | CVE-2025-26600   | https://security-tracker.debian.org/tracker/CVE-2025-26600  
                      xwayland | CVE-2025-26595   | https://security-tracker.debian.org/tracker/CVE-2025-26595  
                      xwayland | CVE-2025-26599   | https://security-tracker.debian.org/tracker/CVE-2025-26599  
                      xwayland | CVE-2025-26594   | https://security-tracker.debian.org/tracker/CVE-2025-26594  
                      xwayland | CVE-2025-26598   | https://security-tracker.debian.org/tracker/CVE-2025-26598  
                      xwayland | CVE-2025-26597   | https://security-tracker.debian.org/tracker/CVE-2025-26597  
                      xwayland | CVE-2025-26596   | https://security-tracker.debian.org/tracker/CVE-2025-26596  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2024.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                     angularjs | CVE-2024-8373    | https://security-tracker.debian.org/tracker/CVE-2024-8373   
                     angularjs | CVE-2024-8372    | https://security-tracker.debian.org/tracker/CVE-2024-8372   
                     angularjs | CVE-2024-21490   | https://security-tracker.debian.org/tracker/CVE-2024-21490  
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-2152    | https://security-tracker.debian.org/tracker/CVE-2025-2152   
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                        bento4 | CVE-2025-0870    | https://security-tracker.debian.org/tracker/CVE-2025-0870   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2023-1972    | https://security-tracker.debian.org/tracker/CVE-2023-1972   
                      binutils | CVE-2023-25586   | https://security-tracker.debian.org/tracker/CVE-2023-25586  
                      binutils | CVE-2023-25585   | https://security-tracker.debian.org/tracker/CVE-2023-25585  
                      binutils | CVE-2023-25588   | https://security-tracker.debian.org/tracker/CVE-2023-25588  
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                         dav1d | CVE-2024-1580    | https://security-tracker.debian.org/tracker/CVE-2024-1580   
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                           eza | CVE-2024-25817   | https://security-tracker.debian.org/tracker/CVE-2024-25817  
                        ffmpeg | CVE-2022-48434   | https://security-tracker.debian.org/tracker/CVE-2022-48434  
                        ffmpeg | CVE-2022-3341    | https://security-tracker.debian.org/tracker/CVE-2022-3341   
                        ffmpeg | CVE-2022-3109    | https://security-tracker.debian.org/tracker/CVE-2022-3109   
                        ffmpeg | CVE-2023-47470   | https://security-tracker.debian.org/tracker/CVE-2023-47470  
                        ffmpeg | CVE-2023-46407   | https://security-tracker.debian.org/tracker/CVE-2023-46407  
                        ffmpeg | CVE-2024-22860   | https://security-tracker.debian.org/tracker/CVE-2024-22860  
                        ffmpeg | CVE-2024-22862   | https://security-tracker.debian.org/tracker/CVE-2024-22862  
                        ffmpeg | CVE-2024-22861   | https://security-tracker.debian.org/tracker/CVE-2024-22861  
                        ffmpeg | CVE-2024-7272    | https://security-tracker.debian.org/tracker/CVE-2024-7272   
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         grub2 | CVE-2024-45778   | https://security-tracker.debian.org/tracker/CVE-2024-45778  
                         grub2 | CVE-2024-45782   | https://security-tracker.debian.org/tracker/CVE-2024-45782  
                         grub2 | CVE-2024-45779   | https://security-tracker.debian.org/tracker/CVE-2024-45779  
                         grub2 | CVE-2024-45780   | https://security-tracker.debian.org/tracker/CVE-2024-45780  
                         grub2 | CVE-2025-0678    | https://security-tracker.debian.org/tracker/CVE-2025-0678   
                    gstreamer1 | CVE-2024-47613   | https://security-tracker.debian.org/tracker/CVE-2024-47613  
                    gstreamer1 | CVE-2024-47607   | https://security-tracker.debian.org/tracker/CVE-2024-47607  
                    gstreamer1 | CVE-2024-47602   | https://security-tracker.debian.org/tracker/CVE-2024-47602  
                    gstreamer1 | CVE-2024-47615   | https://security-tracker.debian.org/tracker/CVE-2024-47615  
                    gstreamer1 | CVE-2024-47603   | https://security-tracker.debian.org/tracker/CVE-2024-47603  
                    gstreamer1 | CVE-2024-47600   | https://security-tracker.debian.org/tracker/CVE-2024-47600  
                    gstreamer1 | CVE-2024-47601   | https://security-tracker.debian.org/tracker/CVE-2024-47601  
                    gstreamer1 | CVE-2024-47606   | https://security-tracker.debian.org/tracker/CVE-2024-47606  
                    gstreamer1 | CVE-2024-47774   | https://security-tracker.debian.org/tracker/CVE-2024-47774  
                    gstreamer1 | CVE-2024-47777   | https://security-tracker.debian.org/tracker/CVE-2024-47777  
                    gstreamer1 | CVE-2024-47776   | https://security-tracker.debian.org/tracker/CVE-2024-47776  
                    gstreamer1 | CVE-2024-47775   | https://security-tracker.debian.org/tracker/CVE-2024-47775  
                    gstreamer1 | CVE-2024-47778   | https://security-tracker.debian.org/tracker/CVE-2024-47778  
                    gstreamer1 | CVE-2024-47835   | https://security-tracker.debian.org/tracker/CVE-2024-47835  
                    gstreamer1 | CVE-2024-47834   | https://security-tracker.debian.org/tracker/CVE-2024-47834  
                    gstreamer1 | CVE-2024-47541   | https://security-tracker.debian.org/tracker/CVE-2024-47541  
                    gstreamer1 | CVE-2024-47543   | https://security-tracker.debian.org/tracker/CVE-2024-47543  
                    gstreamer1 | CVE-2024-47545   | https://security-tracker.debian.org/tracker/CVE-2024-47545  
                    gstreamer1 | CVE-2024-47540   | https://security-tracker.debian.org/tracker/CVE-2024-47540  
                    gstreamer1 | CVE-2024-47537   | https://security-tracker.debian.org/tracker/CVE-2024-47537  
                    gstreamer1 | CVE-2024-47542   | https://security-tracker.debian.org/tracker/CVE-2024-47542  
                    gstreamer1 | CVE-2024-47599   | https://security-tracker.debian.org/tracker/CVE-2024-47599  
                    gstreamer1 | CVE-2024-47539   | https://security-tracker.debian.org/tracker/CVE-2024-47539  
                    gstreamer1 | CVE-2024-47546   | https://security-tracker.debian.org/tracker/CVE-2024-47546  
                    gstreamer1 | CVE-2024-47596   | https://security-tracker.debian.org/tracker/CVE-2024-47596  
                    gstreamer1 | CVE-2024-47597   | https://security-tracker.debian.org/tracker/CVE-2024-47597  
                    gstreamer1 | CVE-2024-47544   | https://security-tracker.debian.org/tracker/CVE-2024-47544  
                    gstreamer1 | CVE-2024-47538   | https://security-tracker.debian.org/tracker/CVE-2024-47538  
                    gstreamer1 | CVE-2024-47598   | https://security-tracker.debian.org/tracker/CVE-2024-47598  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                    libarchive | CVE-2025-1632    | https://security-tracker.debian.org/tracker/CVE-2025-1632   
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                       libheif | CVE-2024-41311   | https://security-tracker.debian.org/tracker/CVE-2024-41311  
                       libheif | CVE-2024-25269   | https://security-tracker.debian.org/tracker/CVE-2024-25269  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                   libopenh264 | CVE-2025-27091   | https://security-tracker.debian.org/tracker/CVE-2025-27091  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                     linux-pam | CVE-2024-10041   | https://security-tracker.debian.org/tracker/CVE-2024-10041  
                      linuxptp | CVE-2024-42861   | https://security-tracker.debian.org/tracker/CVE-2024-42861  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                         mdadm | CVE-2023-28736   | https://security-tracker.debian.org/tracker/CVE-2023-28736  
                         mdadm | CVE-2023-28938   | https://security-tracker.debian.org/tracker/CVE-2023-28938  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2024-49393   | https://security-tracker.debian.org/tracker/CVE-2024-49393  
                          mutt | CVE-2024-49395   | https://security-tracker.debian.org/tracker/CVE-2024-49395  
                          mutt | CVE-2024-49394   | https://security-tracker.debian.org/tracker/CVE-2024-49394  
                          nano | CVE-2024-5742    | https://security-tracker.debian.org/tracker/CVE-2024-5742   
                          nasm | CVE-2022-46456   | https://security-tracker.debian.org/tracker/CVE-2022-46456  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2024-20952   | https://security-tracker.debian.org/tracker/CVE-2024-20952  
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2025-26465   | https://security-tracker.debian.org/tracker/CVE-2025-26465  
                       openssh | CVE-2025-26466   | https://security-tracker.debian.org/tracker/CVE-2025-26466  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                           orc | CVE-2024-40897   | https://security-tracker.debian.org/tracker/CVE-2024-40897  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
              python-multipart | CVE-2024-24762   | https://security-tracker.debian.org/tracker/CVE-2024-24762  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
               python-werkzeug | CVE-2024-49767   | https://security-tracker.debian.org/tracker/CVE-2024-49767  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2023-6683    | https://security-tracker.debian.org/tracker/CVE-2023-6683   
                          qemu | CVE-2023-6693    | https://security-tracker.debian.org/tracker/CVE-2023-6693   
                          qemu | CVE-2023-5088    | https://security-tracker.debian.org/tracker/CVE-2023-5088   
                          qemu | CVE-2023-3019    | https://security-tracker.debian.org/tracker/CVE-2023-3019   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                          qemu | CVE-2024-3567    | https://security-tracker.debian.org/tracker/CVE-2024-3567   
                       qt6base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                          rust | CVE-2024-43402   | https://security-tracker.debian.org/tracker/CVE-2024-43402  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sngrep | CVE-2024-3119    | https://security-tracker.debian.org/tracker/CVE-2024-3119   
                        sngrep | CVE-2024-3120    | https://security-tracker.debian.org/tracker/CVE-2024-3120   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                      unixodbc | CVE-2024-1013    | https://security-tracker.debian.org/tracker/CVE-2024-1013   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                    util-linux | CVE-2024-28085   | https://security-tracker.debian.org/tracker/CVE-2024-28085  
               util-linux-libs | CVE-2024-28085   | https://security-tracker.debian.org/tracker/CVE-2024-28085  
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                           vim | CVE-2024-45306   | https://security-tracker.debian.org/tracker/CVE-2024-45306  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                wpa_supplicant | CVE-2023-52160   | https://security-tracker.debian.org/tracker/CVE-2023-52160  
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                        xerces | CVE-2024-23807   | https://security-tracker.debian.org/tracker/CVE-2024-23807  
                      xwayland | CVE-2025-26601   | https://security-tracker.debian.org/tracker/CVE-2025-26601  
                      xwayland | CVE-2025-26600   | https://security-tracker.debian.org/tracker/CVE-2025-26600  
                      xwayland | CVE-2025-26595   | https://security-tracker.debian.org/tracker/CVE-2025-26595  
                      xwayland | CVE-2025-26599   | https://security-tracker.debian.org/tracker/CVE-2025-26599  
                      xwayland | CVE-2025-26594   | https://security-tracker.debian.org/tracker/CVE-2025-26594  
                      xwayland | CVE-2025-26598   | https://security-tracker.debian.org/tracker/CVE-2025-26598  
                      xwayland | CVE-2025-26597   | https://security-tracker.debian.org/tracker/CVE-2025-26597  
                      xwayland | CVE-2025-26596   | https://security-tracker.debian.org/tracker/CVE-2025-26596  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2024.11.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                     angularjs | CVE-2024-8373    | https://security-tracker.debian.org/tracker/CVE-2024-8373   
                     angularjs | CVE-2024-8372    | https://security-tracker.debian.org/tracker/CVE-2024-8372   
                     angularjs | CVE-2024-21490   | https://security-tracker.debian.org/tracker/CVE-2024-21490  
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-2152    | https://security-tracker.debian.org/tracker/CVE-2025-2152   
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          dpdk | CVE-2015-1142857 | https://security-tracker.debian.org/tracker/CVE-2015-1142857
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         grub2 | CVE-2024-45778   | https://security-tracker.debian.org/tracker/CVE-2024-45778  
                         grub2 | CVE-2024-45782   | https://security-tracker.debian.org/tracker/CVE-2024-45782  
                         grub2 | CVE-2024-45779   | https://security-tracker.debian.org/tracker/CVE-2024-45779  
                         grub2 | CVE-2024-45780   | https://security-tracker.debian.org/tracker/CVE-2024-45780  
                         grub2 | CVE-2025-0678    | https://security-tracker.debian.org/tracker/CVE-2025-0678   
                    gstreamer1 | CVE-2024-47613   | https://security-tracker.debian.org/tracker/CVE-2024-47613  
                    gstreamer1 | CVE-2024-47607   | https://security-tracker.debian.org/tracker/CVE-2024-47607  
                    gstreamer1 | CVE-2024-47602   | https://security-tracker.debian.org/tracker/CVE-2024-47602  
                    gstreamer1 | CVE-2024-47615   | https://security-tracker.debian.org/tracker/CVE-2024-47615  
                    gstreamer1 | CVE-2024-47603   | https://security-tracker.debian.org/tracker/CVE-2024-47603  
                    gstreamer1 | CVE-2024-47600   | https://security-tracker.debian.org/tracker/CVE-2024-47600  
                    gstreamer1 | CVE-2024-47601   | https://security-tracker.debian.org/tracker/CVE-2024-47601  
                    gstreamer1 | CVE-2024-47606   | https://security-tracker.debian.org/tracker/CVE-2024-47606  
                    gstreamer1 | CVE-2024-47774   | https://security-tracker.debian.org/tracker/CVE-2024-47774  
                    gstreamer1 | CVE-2024-47777   | https://security-tracker.debian.org/tracker/CVE-2024-47777  
                    gstreamer1 | CVE-2024-47776   | https://security-tracker.debian.org/tracker/CVE-2024-47776  
                    gstreamer1 | CVE-2024-47775   | https://security-tracker.debian.org/tracker/CVE-2024-47775  
                    gstreamer1 | CVE-2024-47778   | https://security-tracker.debian.org/tracker/CVE-2024-47778  
                    gstreamer1 | CVE-2024-47835   | https://security-tracker.debian.org/tracker/CVE-2024-47835  
                    gstreamer1 | CVE-2024-47834   | https://security-tracker.debian.org/tracker/CVE-2024-47834  
                    gstreamer1 | CVE-2024-47541   | https://security-tracker.debian.org/tracker/CVE-2024-47541  
                    gstreamer1 | CVE-2024-47543   | https://security-tracker.debian.org/tracker/CVE-2024-47543  
                    gstreamer1 | CVE-2024-47545   | https://security-tracker.debian.org/tracker/CVE-2024-47545  
                    gstreamer1 | CVE-2024-47540   | https://security-tracker.debian.org/tracker/CVE-2024-47540  
                    gstreamer1 | CVE-2024-47537   | https://security-tracker.debian.org/tracker/CVE-2024-47537  
                    gstreamer1 | CVE-2024-47542   | https://security-tracker.debian.org/tracker/CVE-2024-47542  
                    gstreamer1 | CVE-2024-47599   | https://security-tracker.debian.org/tracker/CVE-2024-47599  
                    gstreamer1 | CVE-2024-47539   | https://security-tracker.debian.org/tracker/CVE-2024-47539  
                    gstreamer1 | CVE-2024-47546   | https://security-tracker.debian.org/tracker/CVE-2024-47546  
                    gstreamer1 | CVE-2024-47596   | https://security-tracker.debian.org/tracker/CVE-2024-47596  
                    gstreamer1 | CVE-2024-47597   | https://security-tracker.debian.org/tracker/CVE-2024-47597  
                    gstreamer1 | CVE-2024-47544   | https://security-tracker.debian.org/tracker/CVE-2024-47544  
                    gstreamer1 | CVE-2024-47538   | https://security-tracker.debian.org/tracker/CVE-2024-47538  
                    gstreamer1 | CVE-2024-47598   | https://security-tracker.debian.org/tracker/CVE-2024-47598  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                    libarchive | CVE-2025-1632    | https://security-tracker.debian.org/tracker/CVE-2025-1632   
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                   libopenh264 | CVE-2025-27091   | https://security-tracker.debian.org/tracker/CVE-2025-27091  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                     linux-pam | CVE-2024-10041   | https://security-tracker.debian.org/tracker/CVE-2024-10041  
                      linuxptp | CVE-2024-42861   | https://security-tracker.debian.org/tracker/CVE-2024-42861  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mupdf | CVE-2024-24258   | https://security-tracker.debian.org/tracker/CVE-2024-24258  
                         mupdf | CVE-2024-24259   | https://security-tracker.debian.org/tracker/CVE-2024-24259  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2024-49393   | https://security-tracker.debian.org/tracker/CVE-2024-49393  
                          mutt | CVE-2024-49395   | https://security-tracker.debian.org/tracker/CVE-2024-49395  
                          mutt | CVE-2024-49394   | https://security-tracker.debian.org/tracker/CVE-2024-49394  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2025-26465   | https://security-tracker.debian.org/tracker/CVE-2025-26465  
                       openssh | CVE-2025-26466   | https://security-tracker.debian.org/tracker/CVE-2025-26466  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                           orc | CVE-2024-40897   | https://security-tracker.debian.org/tracker/CVE-2024-40897  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                       qt5base | CVE-2011-3193    | https://security-tracker.debian.org/tracker/CVE-2011-3193   
                       qt5base | CVE-2012-6093    | https://security-tracker.debian.org/tracker/CVE-2012-6093   
                       qt5base | CVE-2014-0190    | https://security-tracker.debian.org/tracker/CVE-2014-0190   
                       qt5base | CVE-2015-1290    | https://security-tracker.debian.org/tracker/CVE-2015-1290   
                       qt5base | CVE-2017-10904   | https://security-tracker.debian.org/tracker/CVE-2017-10904  
                       qt5base | CVE-2017-10905   | https://security-tracker.debian.org/tracker/CVE-2017-10905  
                       qt5base | CVE-2018-21035   | https://security-tracker.debian.org/tracker/CVE-2018-21035  
                       qt5base | CVE-2018-19869   | https://security-tracker.debian.org/tracker/CVE-2018-19869  
                       qt5base | CVE-2018-19871   | https://security-tracker.debian.org/tracker/CVE-2018-19871  
                       qt5base | CVE-2018-19870   | https://security-tracker.debian.org/tracker/CVE-2018-19870  
                       qt5base | CVE-2018-19873   | https://security-tracker.debian.org/tracker/CVE-2018-19873  
                       qt5base | CVE-2020-0570    | https://security-tracker.debian.org/tracker/CVE-2020-0570   
                       qt5base | CVE-2020-17507   | https://security-tracker.debian.org/tracker/CVE-2020-17507  
                       qt5base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                       qt6base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sngrep | CVE-2024-3119    | https://security-tracker.debian.org/tracker/CVE-2024-3119   
                        sngrep | CVE-2024-3120    | https://security-tracker.debian.org/tracker/CVE-2024-3120   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                      unixodbc | CVE-2024-1013    | https://security-tracker.debian.org/tracker/CVE-2024-1013   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                           vim | CVE-2024-45306   | https://security-tracker.debian.org/tracker/CVE-2024-45306  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                        xerces | CVE-2024-23807   | https://security-tracker.debian.org/tracker/CVE-2024-23807  
                      xwayland | CVE-2025-26601   | https://security-tracker.debian.org/tracker/CVE-2025-26601  
                      xwayland | CVE-2025-26600   | https://security-tracker.debian.org/tracker/CVE-2025-26600  
                      xwayland | CVE-2025-26595   | https://security-tracker.debian.org/tracker/CVE-2025-26595  
                      xwayland | CVE-2025-26599   | https://security-tracker.debian.org/tracker/CVE-2025-26599  
                      xwayland | CVE-2025-26594   | https://security-tracker.debian.org/tracker/CVE-2025-26594  
                      xwayland | CVE-2025-26598   | https://security-tracker.debian.org/tracker/CVE-2025-26598  
                      xwayland | CVE-2025-26597   | https://security-tracker.debian.org/tracker/CVE-2025-26597  
                      xwayland | CVE-2025-26596   | https://security-tracker.debian.org/tracker/CVE-2025-26596  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
