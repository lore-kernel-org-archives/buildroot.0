Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56951C28B30
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 04:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B92E9844AF;
	Wed, 26 Mar 2025 04:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsPrEkInOBTk; Wed, 26 Mar 2025 04:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE058844C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE058844C1;
	Wed, 26 Mar 2025 04:14:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DED2E4
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 04:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B34860708
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 04:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QW4Xqxo1ifMc for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 04:14:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 07CDC6069A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07CDC6069A
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07CDC6069A
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 04:14:46 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ac6e8cf9132so30943966b.2
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 21:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742962485; x=1743567285;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x/VojxicMusBUuladjIldQpNiJNjuUU/B4z0Ahoy/co=;
 b=Nzl/LRytscdfmdZrO8GBxn+22qGO4mwxumtBwuiLe1qBuXH7snkmOD1K8uCwYPqmfc
 xgAtn/6WVl9wW1Hspke0V+I6sk7+7p3O/9V8ZP/lxP9E+YWfr1Nm61OOBSsLOyFPhRX4
 htcvMa/ITl6FmjtNWHlYoi59oygOlePRLbC3z55W2wwqnjUacDsvDpmbDtJZMIswj9tl
 6VS2AYEeb43tDD6vRcIc+32GBaxX5cGVK4xtBt2CH8Vb3SjWCVOyjHVjTkHHSTDU1qmH
 UQaGt58Vz9vwsl24EnwKdgXYlBsvKUQXMk1qGD+PiX0N7u/N408kc6sAlnCRyVhQYsax
 zrCQ==
X-Gm-Message-State: AOJu0YweoXeF4w1MTQIdqpm7R7dZmrEnUdeaalMp2ChwY8GZIKTyVxEU
 vTb9jYfVg9wuqe+cW8ZrQxqQKe2rDZTQ0XVu/gcU/sP809bXSwM3wbd6vQ==
X-Gm-Gg: ASbGncvBswHCgYcdbDk8jAG4yQKIE4VFooI5NjtHlrSJxUW877Tui+rZSk2h3Sg0U4o
 REqy26xWT5xcbboUkzUGJ7MDi9reTwwtPvLzcVsYYDfHKtghop/NTuIe0yRG8RAQvvuGVm9s28K
 aZU2XO9/pxa7wNvgsCBr8OCIDiUxHnN8aUbHp+RkAOnZjihiy4mNKJ3RTvVKNbSWUdwnWAjzPmA
 UZt9EK42buTr2a183Y51j+HbrIsyYX4SgJgWNG5WOBJWz0R+lTRaCAqIPcPRIQke+mzAe3Xpj51
 cxKxLiTCgkPJoegZyz8yqcsrkj4qfuodYuC9ort6KYtOzcDe
X-Google-Smtp-Source: AGHT+IHNLhN9ByWIZ88sffbp0vxvXKkYZqUgecY6CKBWvfSz9Vd/1A/MFz/TinUVdygXsxdLVru+qA==
X-Received: by 2002:a17:907:7f06:b0:ac4:491:1549 with SMTP id
 a640c23a62f3a-ac404911872mr1574297766b.1.1742962484601; 
 Tue, 25 Mar 2025 21:14:44 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac6932e843asm537100866b.83.2025.03.25.21.14.44
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 21:14:44 -0700 (PDT)
Message-ID: <67e37f34.170a0220.9d5a7.2eb0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 26 Mar 2025 04:14:44 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742962485; x=1743567285; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=x/VojxicMusBUuladjIldQpNiJNjuUU/B4z0Ahoy/co=;
 b=ZGjxueOZqFcOhdhI1QXbcZIrFsPCcvF0+BEuzyKPAqfoYrp9zCJQeL/SS5b7zQRQ+X
 0+ndw7TrMqS8tiaejnSyUF6CZEKrqKywzwtYX8aTydMzgu9ikxOsEqMtmceToE2qLGa4
 1wCwF5L3jkEEeZB6pF3GvS+yEvCTb484+Csf1ViBTsl3583E+mBsWWq+yw5Ul5xsGnSy
 crvBjypL8n+lpW/o3t+Y61+38GdvKse9Brac6K6KTxo0HzfACaXLmnJun3/xy3Ry1UGA
 D3vEZm6+mrdoJ4dGOsRB4CZpPaLEoSwSyTmmLc9j2ZUayKC3/kMe4Gwe9+yiSUZ/26Os
 6MoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZGjxueOZ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-25
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

Autobuild statistics for 2025-03-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  3  |  0  |  5  |
  2024.11.x  |  0  |  5  |  0  |  5  |
    master   | 12  | 179 |  0  | 191 |

Classification of failures by reason for master
-----------------------------------------------

             host-cmake-3.31.5 | 69
    host-gcc-bare-metal-14.2.0 | 13
     host-ncurses-6.4-20230603 | 10
       host-gcc-initial-13.3.0 | 8 
            host-ccache-4.11.2 | 5 
         host-libopenssl-3.4.1 | 5 
                       unknown | 4 
 host-binutils-bare-metal-2.44 | 3 
      passt-2025_02_17.a1e48a0 | 3 
  gobject-introspection-1.82.0 | 2 
              host-bison-3.8.2 | 2 
            host-fakeroot-1.36 | 2 
       host-gcc-initial-12.4.0 | 2 
               host-mpfr-4.1.1 | 2 
    host-python-greenlet-3.1.1 | 2 
                 host-xz-5.6.4 | 2 
        liblog4c-localtime-1.0 | 2 
          perl-net-ssleay-1.94 | 2 
                python3-3.13.2 | 2 
               valgrind-3.24.0 | 2 
  binutils-arc-2023.09-release | 1 
                cifs-utils-7.1 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
               cracklib-2.9.11 | 1 
                elfutils-0.192 | 1 
esp-hosted-927a34f99724bb74... | 1 
fs/erofs/erofs.mk:69: /home... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
glibc-2.41-5-gcb7f206537240... | 1 
     gst1-plugins-base-1.22.12 | 1 
          host-automake-1.16.5 | 1 
            host-coreutils-9.5 | 1 
                host-cpio-2.15 | 1 
         host-gcc-final-13.3.0 | 1 
       host-gcc-initial-14.2.0 | 1 
           host-librsvg-2.50.9 | 1 
            host-libtool-2.4.6 | 1 
            host-libzlib-1.3.1 | 1 
    host-mender-artifact-4.0.0 | 1 
                host-mpc-1.3.1 | 1 
       host-nodejs-src-22.13.1 | 1 
      host-policycoreutils-3.7 | 1 
                jemalloc-5.3.0 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                libdrm-2.4.124 | 1 
                 libjwt-1.17.2 | 1 
           libzenoh-pico-1.2.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.13.8 | 1 
                     mtd-2.2.1 | 1 
                  musepack-475 | 1 
newlib-bare-metal-4.5.0.202... | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
               openblas-0.3.29 | 1 
                   perl-5.40.1 | 1 
             python-webpy-0.62 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/6627069b445f8b91006b563d280573fa78acd971 |     
  sparc64    |         cifs-utils-7.1         | NOK | https://autobuild.buildroot.org/results/90c5dcbb77d7f53fbae01cf2cb0d8ef1afca2849 |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/5cad63eb962758e8f50a3a8c75efa342c89392f5 |     
 microblaze  |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/d9bae9b976d469ec2174047e3aa40e12e840d0ae |     
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c69d62c26c20c8423ae341c055d4428d4430f690 | ORPH
   xtensa    | esp-hosted-927a34f99724bb74... | NOK | https://autobuild.buildroot.org/results/549b77d394e41cd7b3f45bd63498920d43cead67 |     
  mips64el   | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/81cec5a2e7521089524c4984b7e977c6751ff64f |     
  mips64el   | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/20feb6fec607c6781d79659d503763e67c4e1a81 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/190cff178872722cee61560bd70db2d2c71b3801 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/b68ee0ddad44db9e3fb4ff6779d29f8ecafd246b | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f0a547bf07af3920d22e2b1d3ddc399164acb3cd | ORPH
   sparc     |   gst1-plugins-base-1.22.12    | NOK | https://autobuild.buildroot.org/results/73e839d772c98f3933109c5dac1cff5eb915ebb8 | ORPH
  mips64el   |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/ec583fb124580ab553aecd33f59831d2a7b8a073 | ORPH
  riscv32    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/1a21dc4011b3f8870612e1d72d3d41481d4b0975 |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/17b47a911a6e6deac5bae54a359136d075213bc5 |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/b46563700afb53bc94173bc2b14762ec3fe38eaa |     
  powerpc    |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/7f28adc30e53964b4c9bae7d69343c92078a0ac7 | ORPH
    m68k     |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/2d03b22659fc2ac53f9374eccc2e2c898f647c1a | ORPH
   s390x     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/e3cc43b8bbf4cc7d15f14541ac93704a55fc03a1 | ORPH
    arc      |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/397f3125105342849f0e3d2c295af62488c28991 | ORPH
  powerpc    |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/aab89aae64f61413538384ede9965b4365eb0a1c | ORPH
powerpc64le  |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/af5e9a4f5c1d871b69fce97756971477fe744bd1 | ORPH
   s390x     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/e85158f7780e836db83766b876a2e2cca60d765d | ORPH
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/94152843d077aec9d62ad60073a79e4e8c2888cd |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8e96fc741168eb121801888e4f09816cc6d710ad |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/53f9d6d0d54f7d493693235122f9c0ce85ad0c4d |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a7db4495cd97b998f3a64c84c97a7fcc9bae8ea6 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/19a244bcd9a1fd916bc5081c2bb61661b8c0fd34 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7a39aabb23f04b95fc1765b3ea0ea5f7bebd9cee |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/92391330b3d2bba7f25198702bc0904a4ac13dd6 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9dd30ac9d374626911f5c608a82ddf138421dd6b |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cd9129977f94767efa527a1d2dbf31ddc4eae2ec |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/177da451a10e4fa71a597d28aa8bc5ad85003cc7 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1c4ff938b96e1253df5008602532f8c20386f007 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b6f7a6f05509b57a5cb5920987f6e7f9a2753b6d |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1b06194b5e7dc93d5da89a55caa6dc89c7d4c747 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0d48a67213ac9a83b70b80e2fb43db04ebc4c0f1 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bf7cc9d7c1713007944224e53045617763cdd4b4 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/16a2e439167b042dde8d8163c5a1ac987c9b732b |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9889e1f9f0895ccdba51105f77bfcdb11864c67a |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4d43c2e09230e13a5398bbc4a71c9af5d5a03d24 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/42b84331b7651fef3fed095c0adb485637187e14 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/936312fa33d497aa75f43bcd4e526e3bab7e64ea |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/31b8d5623bd4397104cac7d3ce523b1a90fbc974 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/083f1b5cfca9927dcbed238cd9f4605e41238e6d |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/73318b3a1c78f2772b70f9e235158b055f917aa0 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9d058b6beb79ca29f80a09af332365b0609d14b3 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cf8fc41f098b297a7a60dd858efeb76750df24c9 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e0d85611a2d6d194b241c05924f2949507c44c26 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5c238d1aec18f0f13af09183805369eb65f2ec6f |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/893a0444765046042d7039097ac69288c71dd6ff |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d0d9639a09f19ae4456ec1993a0a48bbfa14a939 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4be77210bf452ae58b0d7ab6395d0090b46998f1 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/39c73392dcf3b8a957d44e7cdd9961d313d34158 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1d2adbb395eb678cca25f6fb619ea962e554dbf6 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8330aa5da3623faa4a2c9aef3cbf23e20389aff8 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/71e0b48866ce4ca388fadfcd0f5fd4b31ebf5209 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4cd4d93303a375c20433f78039bdafc6ab8ff7cf |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f61613d3c1dd318c76014ada14beae94896d3a8f |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/65ec7b300f9be0ce71f92035f02b466c434fbfeb |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e88bcfc9f7b294416ebb7401df636bf489df9c50 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5b91de8dae9071c99cd8fb78f34db8a450d50fc3 |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a1df7fa59c447b67a010bfc1de202f1b4349b246 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4a2a8ed4ef20a5076294821836096963a52641fe |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5a5b406b6ffdcc673127f17225bfb802240de963 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/01b8712772a56799dfb716d3dd3be75ddbaa00cb |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bab182e3d82afc3e58c6b8ee137832b4ad57f1e2 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/65b282c89348937727b05cbd50fb30c2909a9d9a |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ee3c34d45c78bee914d7c9e67c81453460c59518 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2a81569d42e68307938681954f4fd5e3d88df3e5 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b263aa26c9f7194f8a6aa822d331005b9bae7d66 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cc1c7852e7f4566cefdade4594cf936301ae3ac8 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4327ae84bf957d7b545ccce4c7f8e8122c924119 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/017afe7a56c30b53b3bea1b0ed0ce31093b7b9c1 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/80294fd9811186a70af917f2fc46cbbced98a7df |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e6d72528a41b3a092c0f814893d75ca4d7038163 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cda0c56391e35192bb31ad2de4b8534c3cb9ebb5 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/da42dcc868e7af7d212ee6b55a12b1ceb8fdb180 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b6108a209529f256a3b96cbdc79a1f7a72c367d6 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0f03ea0023c5275b19c5cb61b3871a833c7d3c52 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4ba3ecebce978430b59e77dd69b95e69ff3b1327 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/697c30712ad9076426a05897bfe60d92668ff221 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/486dfb842f73ba43da6a71c1d49d8d0aca7ac5eb |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aee841e1e3ae519dba9ed757013b12160f964691 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/393c6a6fde8dc6ecd865ee442a79f6b9a7a6ba46 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1a7e397de4b8457ac99a11637e48d17626e45789 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/41d5e16b26e07151a767339bf91e3996f80aa387 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cf5739e323cdf0d89e4af00192a74d6f15ca40a3 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8c6e21bd1eee541b0b17de1171c537db4eb13be6 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dcf8fac77d63ce2d6c718f8c47e413084c6c8878 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/377533bc9f7e2dfd84cdeca1fa4719e00d46fe2b |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/992daed9bfb890d262194fb58dc936ea1fe65a42 |     
  powerpc    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/30430aa3cf455043c71b76b1bb6b921c0cd5692b | ORPH
powerpc64le  |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/fb3771f30e6eff716b38aad6168e3cc082330667 |     
   x86_64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/ed5a98003f989e2883aa3ebeeb47538fbaa87be0 | ORPH
powerpc64le  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/28d43ce52da8e6be684d63020299030360970f3c | ORPH
  powerpc    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/3649be5d5e76c4050cb20bb684f51e747c727397 |     
   x86_64    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/dd632a9d7e8ac8b18221318c986e2eb6e686894e |     
   armeb     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/307e58cade140a8912567a22ea4715f4a223e588 |     
    or1k     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/d2ee9c21e529ac5bdc0e847d1f7444b6df9b4fcb |     
 microblaze  |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/33049f5bb6a01f620ac735cdd11ebf1eb652862f |     
   s390x     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/283bb14d0756912956826697bbf9bdab64ed9700 |     
   armeb     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/fabf5ee03b22b57559a79159fff5fb64abff8e36 |     
 aarch64_be  |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/0ef77315885e45b5a709beb3ce0ffad3d12945c4 |     
powerpc64le  |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/2c577cad8f88d1e2bb8b4fbd5c36488f394ce559 |     
   mips64    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/eddff23d55bffa053730976a16d8f1d54b501984 |     
   xtensa    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/9488db03528394589dcdd369ab1d8d1f94c7059c |     
   sparc     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/65cdb5a3a14b23f48ea5ace6475d7eb0e6272d71 |     
    arc      |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/116ee6aa6a26f9e8e7dc5a781f9351e0ad5fb7e6 |     
   x86_64    |     host-gcc-final-13.3.0      | NOK | https://autobuild.buildroot.org/results/25165b508d81d515f39fa9e07f9f27c009a2a0ac |     
  sparc64    |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/d43fb2f06c488e45d5b7685d4cabdca530ff1dfe |     
   x86_64    |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/1a62969876e318e15a27b9083e0e27b520aa112c |     
   s390x     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/f19c9b154ef2caf5859e0a836a3d9ea420860ad9 |     
microblazeel |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/722826b4974065440ed2ff9df44a540de0863844 |     
   sparc     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/5d9077d95e3b1c9f86182f0d1d91590f9dd2d046 |     
powerpc64le  |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/2e65cd3a13d8b91ce26791714da42d804ceaffc6 |     
    or1k     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/90b0a26d14703f545a7cf52d78a7aa18c50fc084 |     
 microblaze  |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/1685c8d851182b3d4f1c1783efcf0513e026f7a8 |     
 microblaze  |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/abf2dd617a5e2e7b34f324dcdabb9841ef959de2 |     
  powerpc    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/de3c9ea8c4c41ce9974102e07f8dc9b918a7ad36 |     
powerpc64le  |    host-gcc-initial-14.2.0     | NOK | https://autobuild.buildroot.org/results/8ed7f60b994862ed8b891c0a33e88942931b13a5 |     
   arceb     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/520f5e731a0016aa3d313aea12011cbf1116968b | ORPH
    i486     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/b374265464d297655d16df78a9a1af4e93fd1e48 | ORPH
   x86_64    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/5f4f79b7e18ad0d63cb2de9a78a5dd88ad488970 | ORPH
  powerpc    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/1215a5d8370d02acf21d4b14344085862fff922a | ORPH
microblazeel |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/cbbdae489f260761db36a3afcfd54562665ab325 | ORPH
  powerpc    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/276663a66c187eefc52abcd1f349a9607e9975a6 |     
    i686     |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/9bfbf30ae38b39da948832e243f7c9efa66c068e | ORPH
  riscv64    |       host-libzlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/5c16547c177b335ee5d3b9370a022f910e1f2d8d | ORPH
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/44f3c2f4753a5aaefc088dbb606148047d8130e4 |     
  sparc64    |         host-mpc-1.3.1         | NOK | https://autobuild.buildroot.org/results/3d2c4d04a23c6e8d9f6c6aeb8f20c67ff43d0308 | ORPH
    i686     |        host-mpfr-4.1.1         | NOK | https://autobuild.buildroot.org/results/63a07163701d0432e25dcfe53052c7359802950e | ORPH
    m68k     |        host-mpfr-4.1.1         | NOK | https://autobuild.buildroot.org/results/74254703233715e16f9d356b4e872ab686b36caa | ORPH
   s390x     |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/f32815edad461d3f99412765dceb1b6158df0a3c | ORPH
  riscv64    |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/3e4073caa33b6facd321b18e8d64f79f56d609a3 | ORPH
   x86_64    |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/3ec20585a34608ef6587d2c41f11070f766c4dbb | ORPH
    or1k     |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/570102daaf9cd2b78de3d78e8f5062dcd98f73e8 | ORPH
    sh4      |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/2c5ed1717d0d7730bccb0b8df1077f586533214a | ORPH
   x86_64    |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/f2a51f34cdb63ededba7b740b72c9a0772efa265 | ORPH
    mips     |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/a6813f2b38376ecfec656321c603a22e2c258fab | ORPH
   mips64    |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/73677a807d7795a1143d62680e9ce81aa8ffb3d6 | ORPH
   x86_64    |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/0dd136b0bc51012b542d3ae17b2051d5a6809342 | ORPH
microblazeel |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/0e0aeaef590b1e79547b14da9fc8680b4dcce60c | ORPH
   s390x     |    host-nodejs-src-22.13.1     | NOK | https://autobuild.buildroot.org/results/f71816affadc432effa0b7179d3596dd777e1034 |     
  sparc64    |    host-policycoreutils-3.7    | NOK | https://autobuild.buildroot.org/results/793b9e104e81614d2ecc968fac5e3685d270c894 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/ad679b2031d2d88bedcb813224253ce9bf14c209 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/776bb18f328bed55620f4af95b2093f0f44a66fb |     
  riscv64    |         host-xz-5.6.4          | NOK | https://autobuild.buildroot.org/results/f0c77919c0852f7761fd7dad92fb81bc65f38d3d | ORPH
   mips64    |         host-xz-5.6.4          | NOK | https://autobuild.buildroot.org/results/ef7a11c11392d247e0dc482c608ecd9f17f0b53a | ORPH
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/247cd8f3358ba386eb30c46ede4dc5b0178760da |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/5000c6d2b6b97d8329f84fbb38514f91ae7edf27 | ORPH
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/e696f77d92462e53433a6af7fe4e976a2521b51c |     
  powerpc    |         libjwt-1.17.2          | NOK | https://autobuild.buildroot.org/results/5f3eae9b08b7131dc84a6995f0f1576cd2dc1c8b |     
   xtensa    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/b280a900f65f01faa6c0a2b8efb847b88c59b130 |     
powerpc64le  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/b988f106341596dfa1b43a0f638eeee303031ce4 |     
powerpc64le  |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/0e9c3098ff8c1aa2c65923eed7f6821a48ef16cc |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/c12f46667b6895c1809d9f7afab9e48dbea8c09b | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/2cf4414fadd84153bb2a2d18c8740be2bc4c3e82 | ORPH
   armeb     |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/af1f04d355c5bd9e9bca6f48d6984811203081a3 | ORPH
    or1k     |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/ac38cbc86213edc78a8537762c8c3c303b8ee66d |     
   mipsel    |          musepack-475          | NOK | https://autobuild.buildroot.org/results/f47be3a66634de927761eeb3d04ffeaf04b247e5 | ORPH
   sparc     | newlib-bare-metal-4.5.0.202... | NOK | https://autobuild.buildroot.org/results/22b8f00b77677038cf5c741fcb7e394aabe22ab4 |     
 aarch64_be  |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/8640a9485c99ee5a073b05a37648928b0cd6af21 |     
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/165afc127d54cff8f22035cfdb76af2d253c6bfc |     
 microblaze  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/ffd703c2ea20bb8b0b0d527fd692acf588b4954c | ORPH
 microblaze  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/fa4e9244efcabdad024fb5a1aa9002fd69920d7f | ORPH
microblazeel |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/7a12f35d3d1d87b3979a1a1e67725382265ef0bd | ORPH
    arc      |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/6239d6a0d3ed04352a927eb818baace48b211840 |     
  powerpc    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/94bc87553ff851214a28a6307d242a1a4e8da274 |     
 aarch64_be  |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/408e799fc40a9aed21189b51d51b86ae2bbee700 |     
  sparc64    |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/c7d51a3b4961dff01446602624c7c18ec3a5ad3f |     
   armeb     |         python3-3.13.2         | NOK | https://autobuild.buildroot.org/results/428aa918c3ee0ebb7b2fd8a6aa261af07742f12b |     
    sh4a     |         python3-3.13.2         | NOK | https://autobuild.buildroot.org/results/7f6a93f06bbd1b2bfa6ad48728f60ff1982ad3e4 |     
    sh4a     |            unknown             | NOK | https://autobuild.buildroot.org/results/b385e24ab18809c83c5f4bbafd0d457cd74c8f41 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/c26af5a6a15e4e1b270f1caf9ed95837b9928040 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/52327d673bb6db7868ca87cc73a1388aa63db6d2 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/24c6074392057c3aef22150b914e6323a96c9326 |     
    mips     |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/115f64db3f918a0c61b96c653d2720d9c714a6ff | ORPH
   mips64    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/095a4650ee8f67023772498d0b82a5500b7a25cd | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               host-go-1.22.12 | 1 
              host-rust-1.74.1 | 1 
               libglib2-2.76.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        host-go-1.22.12         | NOK | https://autobuild.buildroot.org/results/85a76ca71cdcd55bc6e8aad732b21403213748af |     
   x86_64    |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/cf460b3bbd252699de2d1ba7e5a10f99657edfd1 |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/8703d44383009b2a638cc16b5fb2d311c78a9459 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

             bluez5_utils-5.79 | 1 
                   cvs-1.12.13 | 1 
        gmrender-resurrect-0.1 | 1 
  gobject-introspection-1.76.1 | 1 
                 libv4l-1.28.1 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/9c65588a64286473cc493598dc40171ba0481241 |     
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0cdb525e1017b627095198a1463c177fe0efea9c | ORPH
  sparc64    |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/8d0bac39a5bb4070228b6972d6d4e8705727c29d |     
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/915b0a4a335e26d546f13b52bedc249b4e39c87c | ORPH
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/44cbafff3344d3931a626d0e10caa732b8904c23 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
