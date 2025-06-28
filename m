Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA34C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 03:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A430160C20;
	Sat, 28 Jun 2025 03:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6nFN5uaJuNt; Sat, 28 Jun 2025 03:15:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E4C360B83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E4C360B83;
	Sat, 28 Jun 2025 03:15:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52BCE154
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 03:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38FAB60EE3
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 03:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IaN1ggAF_3Af for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 03:15:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 902B560B83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 902B560B83
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 902B560B83
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 03:15:10 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ae3703c2a8bso21483866b.0
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 20:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751080508; x=1751685308;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YS7LvN49xAOMD63xmY0IZPGmHvUbRrfsDGJmwfGrZlQ=;
 b=HmktyAwOmXBDp1nsDlnsphV9ugJeESMm4qcKuHYSEqdLqKzfn2XIUGiRRuPj3eBKwq
 ha6csoRTKpmg8pN2jN5GOYr/Z3YJ74uqfvWqVguSglcoErqCw/5/wZhe7fZdgZMrBrSm
 huXHYGuAeb1VdeeWIV3VKLGwLTmUw9xZNJxB+lPGOso249ySF05N7hfAPGdKmz0N+WD9
 Dn2AkEAksoIjqC1HBxe84Fd1CxzVX8k9swvlTFAzs6jTyN/s7XBHaMAuF8afBoFL7NTJ
 MVsuUyUpxZ2lnOAcQ7AdonTKg6AIvOcL7jJ2u04DYRHsEiER3tu33ulX48oyLaB7dh0O
 i46w==
X-Gm-Message-State: AOJu0YxuHcIFN10LX/SNNPKaHYd+LbUfYRmtrjSm9QeKpkr/s5oo6pEf
 zFGyWzGLD1/p4gf1/6/WTuQnIA8aXSWpGIHFvVcxmi6WFP8MHBRZ0FIo1/D7vg==
X-Gm-Gg: ASbGncvOdpPwnHTpfLJ9n1kzFxBy4DuZxYSQeB5pgc8Exvh4CWFRDaIOGT3Rb3xji14
 xvLBqjjclImOjORvQqqvJDdV1BqBJDtJh0iyioWXrXsqIVTrLEk8iNei3XrSCmQKZUgsp+EPWDx
 al4R33n5+ScFKAkFqZkkixruzY100DarBjQH3SDNVB4LVaJLJ5RD31EfYKduzY+65XwR4cag+CQ
 IuHlZft6k/c37+2dRcb+yfs71eHRwAOAwUkKuVwUw0ShA8dezJORcV1NxVV1SpSMhmD6QgugiHe
 0dqQLYp8r8NBvv//gD/yKWiaDelmeTIcF2OmU0hxChDYbG31IKeXgebNAG+WrC6X4Q==
X-Google-Smtp-Source: AGHT+IExo7dRwS72+hHt/rHfhoDP+W3HVoq21udFXBJ1G3GFcNsT10tU1RfehytxRrTd2WORh4R7ag==
X-Received: by 2002:a17:907:c807:b0:ad8:a4a8:103a with SMTP id
 a640c23a62f3a-ae34fd44965mr545660366b.4.1751080508198; 
 Fri, 27 Jun 2025 20:15:08 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353c6bce2sm230892366b.123.2025.06.27.20.15.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 20:15:07 -0700 (PDT)
Message-ID: <685f5e3b.170a0220.35358d.64e8@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 28 Jun 2025 03:15:07 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751080508; x=1751685308; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YS7LvN49xAOMD63xmY0IZPGmHvUbRrfsDGJmwfGrZlQ=;
 b=JTBFprTBsmNb18zllM8eIlLaNa+hmKLvuxqCKaN4U/lACUfSEsVBgwiKzTLLzl8tnp
 nUXhNtOHf07yBnmL0ctoqMpb7hQeRPVW4D7cUeBUnqrXHpnUQsXo5ZofJOxf/LhpHNbd
 yx+piPZybhUA9LOmrmngUnH2t+aaR/VIeWvIKB0D9lf5M4zf4BnQaM4Vy5cCAlBTKHWP
 zzlyKiG9O63YzXy3Y8CE1iEnjeRo8A1YKT+7f6U6nVP6cwmaVP3dTiSEcCbKH0shm6ph
 ufJiT5H9a9h04aqdWEIndKkdz7AyJ3OnWiFe7dmwSi0aRPjRZa15En314YNRIal12cK9
 eKpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JTBFprTB
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-27
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

Autobuild statistics for 2025-06-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  5  |  0  |  7  |
  2025.05.x  |  6  |  5  |  0  | 11  |
    master   |  5  | 42  |  0  | 47  |

Classification of failures by reason for master
-----------------------------------------------

          host-binutils-2.43.1 | 3 
                  bcusdk-0.0.5 | 2 
                  cairo-1.18.4 | 2 
                   cvs-1.12.13 | 2 
                 hddtemp-0.4.3 | 2 
              host-rust-1.86.0 | 2 
libdbi-drivers-0bfae6c43134... | 2 
           oath-toolkit-2.6.12 | 2 
                       unknown | 2 
               asterisk-22.3.0 | 1 
                   avrdude-8.0 | 1 
                    bmx7-7.1.1 | 1 
                 c-icap-0.5.10 | 1 
                     criu-3.19 | 1 
                   crun-1.18.2 | 1 
               freeipmi-1.6.14 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.84.0 | 1 
host-am335x-pru-package-5f3... | 1 
            host-binutils-2.42 | 1 
                  iozone-3.506 | 1 
              libopenssl-3.5.0 | 1 
     libphidget-2.1.9.20190409 | 1 
              libselinux-3.8.1 | 1 
                  libsvg-0.1.4 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
               mongrel2-1.13.0 | 1 
                    mpir-3.0.0 | 1 
                     pound-4.8 | 1 
                  procs-0.14.9 | 1 
                    sslh-2.0.1 | 1 
                 systemd-257.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/1293621b661b2faa46e71aafcf96cd4d60ea663f |     
    i686     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/04b644409a57ecf9e219f3a693511856a88016b0 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/635857a644ad541f728ad417e2a77353792be8dd |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/7c1b6b73e8dfc82da5edf06e16c3f4fccd606e24 |     
    m68k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/542d8854c5c24d4acc28b6a0a64f70fb98054cd2 | ORPH
    m68k     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/96cf8e9753d1ef21a4588eb6fdfe44ebf4a3df7a | ORPH
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/4ef5fd94b7cd5967cead386a1ad6351fa187fdb2 |     
 aarch64_be  |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/9e8e3d09485591fb126462d00cddf068263df226 |     
powerpc64le  |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/ff7e73ff9bee2bfd904b9fa7311842ed45198147 |     
   sparc     |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/dfc8aea1ce8054b9733dad88783929b417e578f6 |     
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7801654aa1b20fc582333a76b04e2892adaee0a7 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/581e9653199489e7ef126f7d01a9292f4dafc1ec | ORPH
    or1k     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/4ec6649a0ab19cb36f3630d36bef6d7f9852fc41 |     
    arm      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d5663d6a4e80556b504a549dd7fa4bf3c432bdb0 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1710ed4d0b352ba0857fe1785784b59902ea7391 | ORPH
 powerpc64   |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/169ec9a56d63a81e6bb0e16422053e468f70db28 |     
 powerpc64   |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/f6c07fa5128fede7a9e1f1a88c4b09aab7ba7fb6 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/5595a3392ec5deca9e44f062321b2a71627859fd |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/527bd6fca9f40fafdeff27b6c70d8025aa9c7f05 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/42000746426967cd16cefff61d626a0b3d8cc869 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9405502978bc2414f16f108c27579c949ac6c5fc |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c59c5e1407b003e8a9d852ca21fdd610bbb46927 |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/27cd6bf8b1e295daef50687cc93409f30f7cd07a |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/8935a8049710245295c9d224dde9c70d8a9c8d71 |     
   s390x     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/c84370dc72f37c68b8990bc57b2db3ed2469ecb7 |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/b18617301e9f16a908101d85270d3997d5ef53b8 |     
  powerpc    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/dc7290c9b173df651bdaa3fe3e24994054c48bfb |     
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/51133d908bc7edab7c4e0e71a08a867ca01de57f | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/795caa55d5576dbce78f7185c5b3a3aae3b0dee7 |     
  mips64el   |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f30005a6d9e52e16f73c6f8df1d04a0755e71873 |     
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/cc85615016c41cc1482e4c6ab8313a1beeb7ed11 |     
  powerpc    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/787e96784fafc026472afc31450343d2122dccc3 | ORPH
    sh4      |        mongrel2-1.13.0         | NOK | https://autobuild.buildroot.org/results/0c3ffe90ca4adffe4a43511bea8dec8f43c8b067 |     
    i686     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/36638dbf947146e4cdf04a570f79f8dc1a940e3f |     
 microblaze  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/37b3c3af2bd7af2eb5b135da25061c41f616ca39 |     
microblazeel |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/56c8dbf7b67c5f694a3f39a48525d1f367d47fff |     
    arm      |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/b744aab36b1e391666f2ba4231113312e8d94f5d | ORPH
   armeb     |          procs-0.14.9          | NOK | https://autobuild.buildroot.org/results/f899a2dcbac565cc6692e51c076d9720fd26ae06 |     
  sparc64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/bbda1af99d2b38bc88ba7351b39e0a967c0020ab | ORPH
    i686     |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/3aa0ed2d6206136d3588f7fdec955539f0c228ca |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ebbf1a186ea1d2dc13683170b0510a0982cb38de |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/17d88c894d7eb5bfd7c1c69e9d71b8470fc100e6 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

          host-binutils-2.43.1 | 1 
       host-nodejs-src-22.15.1 | 1 
                  libbpf-1.5.0 | 1 
     s6-portable-utils-2.3.0.3 | 1 
uclibc-ng-test-132c6134d691... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/046307d93c543fc6a43a8fa7c82e93c6408e6b94 |     
  aarch64    |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/5da6ecbb51795224b474dd2610b112caa5e7e47d |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/bf21079facd21d684e8656e7ac44b4218a8fcb9d |     
  powerpc    |   s6-portable-utils-2.3.0.3    | NOK | https://autobuild.buildroot.org/results/2e01d9c0148e182291c966361033599100af10ba |     
   armeb     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/1b1461962bc2144038ae57591683d646163648ae |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                  assimp-5.4.3 | 1 
          host-oniguruma-6.9.9 | 1 
                 libcddb-1.3.2 | 1 
      passt-2025_02_17.a1e48a0 | 1 
          sane-airscan-0.99.33 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          assimp-5.4.3          | NOK | https://autobuild.buildroot.org/results/cdcf901e8df7fe606a3e390994debed64665111a | ORPH
 microblaze  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/9103383f493e20b2825e1b45c398e17ec3792806 |     
 powerpc64   |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/37a856ed875b51ff1611f0e16c1a14bd60fde7ea |     
microblazeel |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/b7eb50cb39a42d8b949ac13c1602826b1acadeda | ORPH
    sh4      |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/93f8e214c2f7e68437827652deae577cea5e0842 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
