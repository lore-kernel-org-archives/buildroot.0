Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8D8C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 03:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8004C84026;
	Wed,  6 Aug 2025 03:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYVLFPrJI6V0; Wed,  6 Aug 2025 03:15:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 897A884081
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 897A884081;
	Wed,  6 Aug 2025 03:15:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10A4031
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 03:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB24841D24
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 03:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulLml-JPLzo9 for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 03:15:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 28D9A41D2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28D9A41D2A
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28D9A41D2A
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 03:15:07 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ae9c2754a00so1494205666b.2
 for <buildroot@buildroot.org>; Tue, 05 Aug 2025 20:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754450105; x=1755054905;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oUR/wkhuTabUy6cOh457ovbNPtf8e8EQrixI5hEaMrQ=;
 b=saiFghsPLvf/oSLRiih+AfRlEnw/6mvtORCEa/DVseGC5E0aHUgERF0u55t5IJjS6O
 AwORw0bybgZK3cZvGyx4z7Jcba5RZx+llebGpKSnRJ6fedS0pyZivY/uz+c1DNIYXkrs
 HNSCjXVtyCRirE9PeO06OGQt3aufSn78+Xss9QDc2v0gtL565mJrgBc4QX7aFYklTUaQ
 7WT+FzEnB0LLCYItXlWzK2lPoRCpuNrXFBGupEorgTs9sPXx88OVrqPfCulZ3mnjk/ty
 +97pd51IFHTzNRwE+NnFhZxdtl0BNYqKByLR6qr+G7zAFl61LjRHGwdAd6sjSaO8DMQs
 6W2w==
X-Gm-Message-State: AOJu0Yx1HQ+xyQI8Eja6+jh7wSFcgTW4uP8zZFmAk/7gCpIr5dgErV8H
 LIdfi94309/JI1SPS8Qb1W7aMRiw/ptTiZ3vvwLOK7m+ejvzCWN5uqvf+bitqg==
X-Gm-Gg: ASbGncvf8QTe1Ya6qvEY3QtjhNsVh53RY8cK160Ok6OGrFuV6XHNv1i2ywPZ18ziv2e
 wA1gy9rmoc1vwkVzeHCm5OxiEe6Du4PtQOFkdJv+K5NFQdLRJPB4MUP/d3+YCffQvgJlAztw84l
 PHFBOKy/Umk6my0Ca01/btb2GfRGlqcd+LrWEo2ywv03IpQI4SeaDkXy6z90X11awlnA55c2y2x
 TfDywn44x4o7iNR0gw1Nv9Ld3c7Yqx42tI6PLOIOYUsx6pYEpoFSPF+fh6z5IQUcMSRtyAK7AxL
 Ple8cvcE+/L/ToS3TGG8xT8gkzwQup14CBjuIVsxCIx3FXzRG5oYZ/BhlGMPXFWMjYg8jEwmXdd
 qkJO00RaUBBx1KXrxM2pXyPmTFg==
X-Google-Smtp-Source: AGHT+IG8HrbxyTTXbZNC7kLPUM50L8YMtIg6ItPJo7mXmWu+nUR3HbC8rU+22qxPpaVnLbLJ85uxxQ==
X-Received: by 2002:a17:906:6a11:b0:af2:3c43:b104 with SMTP id
 a640c23a62f3a-af9904bbdd1mr116117666b.54.1754450104768; 
 Tue, 05 Aug 2025 20:15:04 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a1bf9sm1016165666b.31.2025.08.05.20.15.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 20:15:04 -0700 (PDT)
Message-ID: <6892c8b8.170a0220.36b2cf.f51d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 06 Aug 2025 03:15:04 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754450105; x=1755054905; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=oUR/wkhuTabUy6cOh457ovbNPtf8e8EQrixI5hEaMrQ=;
 b=dm9NEHC3h9bEYWrK1khtwn65oGrSoiwr169+8cYgqLxkegaYzlbdnKC7HQZ62H1EYF
 C3/3dVmH7hzWGVckpAMwfz610EosZmmIbjGn6LB/n0MMDbTIS1YX0BJKk4gVOmJRW8nG
 p7TFbBX6U2ZrvjXp6PITZM8PwTGzN1oLTN4Zt653z3EmAvUVQhkmNp36pJC3DUCfMcwo
 ANFJsaJuWtF2hczPBKDP3dzh3t0Np5wemGTdGNYukcB0O++CE8GSJBv4i1mrZJUw15jL
 +brM1z5yiCQapoydhhw1W/Ljif1vZVLD4CKhskFRBOV20qKkjkFQa3IlR8Iv/6iusYeF
 tLYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dm9NEHC3
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-05
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

Autobuild statistics for 2025-08-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  2  |  0  |  8  |
  2025.05.x  |  3  |  9  |  0  | 12  |
    master   | 26  | 148 |  2  | 176 |

Classification of failures by reason for master
-----------------------------------------------

         linux-headers-6.1.147 | 9 
                       unknown | 7 
host-binutils-arc-2023.09-r... | 5 
       host-gcc-initial-14.3.0 | 5 
                   cvs-1.12.13 | 4 
                 host-gdb-14.2 | 4 
libdbi-drivers-0bfae6c43134... | 4 
        liblog4c-localtime-1.0 | 4 
              libselinux-3.8.1 | 4 
                   nanocom-1.0 | 4 
                setserial-2.17 | 4 
                   bash-5.2.37 | 3 
               bctoolbox-4.4.8 | 3 
      libabseil-cpp-20250127.0 | 3 
libsvgtiny-ea9d99fc8b231c22... | 3 
                    linux-6.16 | 3 
             berkeleydb-5.3.28 | 2 
                  cairo-1.18.4 | 2 
                     crun-1.22 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
         host-gcc-final-14.3.0 | 2 
            igd2-for-linux-2.2 | 2 
                liboauth-1.0.3 | 2 
                 linux-headers | 2 
        linux-headers-5.10.240 | 2 
                    mpir-3.0.0 | 2 
                 netsnmp-5.9.4 | 2 
                   perl-5.40.2 | 2 
procrank_linux-21c30ab4514a... | 2 
                    sslh-2.0.1 | 2 
                   thttpd-2.29 | 2 
        vulkan-headers-1.4.317 | 2 
android-tools-4.2.2+git2013... | 1 
                apr-util-1.6.3 | 1 
               asterisk-22.3.0 | 1 
                   avrdude-8.0 | 1 
        b43-firmware-5.100.138 | 1 
             dahdi-linux-3.3.0 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 expect-5.45.4 | 1 
                    fcft-3.1.8 | 1 
              fftw-quad-3.3.10 | 1 
fmlib-lf-6.12.3-1.0.0-3-g7a... | 1 
       freeradius-server-3.2.6 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.84.0 | 1 
host-am335x-pru-package-5f3... | 1 
          host-binutils-2.43.1 | 1 
       host-gcc-initial-15.1.0 | 1 
  host-gdb-arc-2023.09-release | 1 
    host-llvm-libunwind-20.1.8 | 1 
             igt-gpu-tools-2.1 | 1 
                  iozone-3.506 | 1 
               ipmitool-1_8_19 | 1 
kf5-extra-cmake-modules-5.91.0 | 1 
                  ledmon-1.0.0 | 1 
             libapparmor-3.1.7 | 1 
                 libavif-1.3.0 | 1 
                  libffi-3.4.8 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                 libgee-0.20.6 | 1 
                 libiconv-1.15 | 1 
               libsigrok-0.5.2 | 1 
           libzenoh-pico-1.2.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                lmbench-3.0-a9 | 1 
                 logsurfer-1.8 | 1 
                  mbpfan-2.4.0 | 1 
            netstat-nat-1.4.10 | 1 
               openblas-0.3.30 | 1 
                openocd-0.12.0 | 1 
            python-yarl-1.18.3 | 1 
                python3-3.13.5 | 1 
                ramspeed-2.6.0 | 1 
         s6-networking-2.7.0.4 | 1 
                  snmppp-3.5.1 | 1 
       sp-oops-extract-0.0.7-1 | 1 
              tinyssh-20240101 | 1 
              udpcast-20230924 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/a817d8fd90042f010fee76be2866d160c63f7166 |     
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/8d89e90ed566f4afc765c503ca094205c569a9ca |     
    m68k     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/2cc03fcdbc441b88e614effd70d8f2c13568e55d |     
    arm      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/3013a71ceff742dea98f546f4a81f8142584362c |     
    sh4a     |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/b5b16947aa97428dde1100d47615c2e213e91922 |     
   armeb     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/289be59b30b4525ca530ddaf9909ae7294672795 | ORPH
   mipsel    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/7dc861b7e156a32d897f52ed79f105982230d523 | ORPH
   xtensa    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/72e6cfea93b254b6452048ef28194cf36d8192f7 | ORPH
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/eff22057cde60de04bfcc302057687a98b60be05 | ORPH
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/d78c4caa0853ac2c30d757d5b9717d58f19dd482 | ORPH
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/65ee8ce2b3e3ee6a67834a22501d1b54ac821811 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/2118288bc35008f92982862b0a55ac52d899b969 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/f01f61ca4e0ae5336e1cd8324dc16165ab61f022 | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/afce19d1bf4ef39aa7159eea17b2384b52fddd18 |     
    arm      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/ca0be6013417cac7f8498742d94f213febd819fe |     
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/cddbb3008f2b09f16d37478cf3d797ee07da9d88 |     
   s390x     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/4f77bae58b34096fd06349a0b9590d894c885cbc |     
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/cdb4ba3bfb82817cefa3d78149fabf69865c81a8 | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/31b9b077cc8e85d7696a865b46c8ef4304bacf20 | ORPH
  powerpc    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/883ea2819006e502c3d68749b12bd242463cd461 | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8dcff9634bf10caa7112dbffe52da669a6950330 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4f0d4923493ee4aaa1779e62c52c783328575342 | ORPH
   armeb     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/f56c6dc16b01fc3dc8be747a46553f339581f09b | ORPH
  sparc64    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/44096a6ea9a4b8afd1d71ae5d8993fe85b143c38 | ORPH
 aarch64_be  |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/2f15a0234c14ae47e3f99c181c85457484809b50 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/0e5b079ece08480c7ee90f9408a02d4fa751ba12 | ORPH
  aarch64    | fmlib-lf-6.12.3-1.0.0-3-g7a... | NOK | https://autobuild.buildroot.org/results/1a3ce8757911678a1206413fc993d8b96f03b8d1 | ORPH
   mipsel    |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/a29b220b6618175f22cf44edeee12d4a27b6eb43 |     
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/34d64c0585d89453219a4d15db4e0fed56f73b56 | ORPH
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/aaa17c30f446825279f0fadfc3b45b2db7a374a9 |     
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/a6e9b69b0875cf5743c0d68b64bc6bef4871be97 |     
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/960b7136a9653fc098f1d2291be941580d2ec5e5 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/fba58617ab5763895d1a6eaee97ebd48b04da484 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d2dc1e522cac2169eb06371675175d900e90a27c |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/e12ba801d205ec97fa36073672bce62049e36356 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/7c1501c45833d3c0d97010da6101177c4d40d760 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/a28c6f2db5d6ad1a839c6604af36b7ffeecc0366 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/1b5c78c33a43bad1c339e331cb165d5429f7ead2 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/3992d9e32a53661eed4372b2e79c3f3d1c8bd180 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/4148b7797175b30273d621188d515c3685bc3fcf |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/7a7c8ca76f00132c2e5f4e4f5e649a22fc8a4e98 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/3915fa6f8da7768475f138c1bafda856094e6ddd |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/02c6998164423add185e196409400ab40093f7ce |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/b786e5270a21612067d8ce3a91d3384029e0cef5 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/cdb875e3a86c9efda651484a7921a79d5168f44a |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/883c25d97aafb1e0d614a0c30b7aa368024dfb83 |     
loongarch64  |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/e47d55b8fa616e15ed05fe98120d6690105253dd |     
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/935f43243f06a13541b7dadbf1dbc28b5e6402e9 | ORPH
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/48475a89a876282b64fb91eea4f93b2354e3952d | ORPH
   x86_64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/3e43046e880e2f74a3cc78a4ab4c24c0953682d2 | ORPH
    sh4      |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a90530ff8191b1e5d7304b58c72037ff4c0ef059 | ORPH
    arc      |  host-gdb-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/5577c17db5bccf603371cd211784a0908b99806e | ORPH
   x86_64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/2eb5ef482544b0c8f7d35564eb920a88979cea7e |     
    mips     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/003e9538f3e407717601e42ae6af6d0406c15474 |     
    mips     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/855a38b8de9e7bb714e823b30a51f002f27cd250 |     
   x86_64    |       igt-gpu-tools-2.1        | NOK | https://autobuild.buildroot.org/results/885abc59767d7ad9a0c620e8ceee455df58dde15 |     
 aarch64_be  |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/f5ff0b77f0078fd2aab990f106ed56415fe54f85 |     
    or1k     |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/37c5fa57c6c67a66ba6f712e7194cda17a92eb11 |     
powerpc64le  | kf5-extra-cmake-modules-5.91.0 | NOK | https://autobuild.buildroot.org/results/7f313fce738a20bcc1406bdde30ea4ce96e7ab46 |     
   mips64    |          ledmon-1.0.0          | NOK | https://autobuild.buildroot.org/results/85525428015b9903f4e8681c0fa5842811eaaeba |     
   sparc     |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/73aeb84d91176e59cc6bf6d4480bd11e0371f56d |     
  mips64el   |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/76404e8ef98d34a5a14c82f6f3bd18a9f63be37f |     
    arm      |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/187db77f5e4c4d275cc7fe543c6993c241985ad1 |     
   x86_64    |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/72389fa78dabaf168f540bdf8c2b469264e7059b |     
  powerpc    |         libavif-1.3.0          | NOK | https://autobuild.buildroot.org/results/f1aadbe2873b751d82456bd1a0103546aae83f8e |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/736ac6c6a641309f95818a83aea32c0417c062d8 |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/da3fdc92f00d945d9a5085d06e38705f9c0cd135 |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/31918b20a2f63d269f00fc0047fa6f9ce32a04ab |     
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/976721ea46bb05f41ed6fc44fb7dcbdbb91f71db |     
loongarch64  |          libffi-3.4.8          | NOK | https://autobuild.buildroot.org/results/923ab29e494f2d49775718b3e35c59b65121c0c4 |     
microblazeel | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/5a4aa3e80775023ca20168c0ce05e4e2d51c7d43 |     
  aarch64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/5b0a9389d41cd830342745ab9c673ea99618a2a2 |     
   x86_64    |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/d6c723692d7a152085fba29b9db046c6b50ae048 | ORPH
    mips     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/8efeed1aee306737b6aac600de2061644b827c30 |     
    i686     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/9973fdb812253096fceaab5baf4f9ccea370e88c |     
    mips     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/ac9b64c9eae494a4b08e80e2cb2f295044a957de |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/b2e1411b51007c8cc59a7e9c8e202405c0ad5e1c |     
    sh4a     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/29b616398f5c1758ad2bb04e376163c1701d7962 | ORPH
    i686     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/d9c92edca0bdefb0a85375fdfa3c0cb9bfb2a3f8 | ORPH
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/acc32fccb7e8f41e5d9fe22706d0262e7f9cabfc |     
    mips     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e4950198898604d838bd3a1cf2844fb7ba7881fd |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3089ff4d8f988e0579383e371d02f72c263af37b |     
   mips64    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9cbd68e187b2eb439e2b6d7a0db396d10c147a27 |     
  aarch64    |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/2642c49e565a5d16eb7ee7c7c9b1d96bfd01bf75 | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/4a515f32e4f4c9d226052442c078abfb56cbc690 | ORPH
   mipsel    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/615eca3a93ef11cb047d9c3c1c659c831ee646cd | ORPH
  sparc64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/12a514b4d185026c0673ba39050a01ee20bffb4d | ORPH
powerpc64le  |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/dd693338623b1ae3ab62ec4193af1a60fb54e81b |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/869dad2fdd04059d972294a4e08a16fe9dee2323 | ORPH
  aarch64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/8842c91f8ffd6b838ddaafcdc52788750134b94f | ORPH
 powerpc64   |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/853cc5558a77b25a435c84d8ffca6fd3c008f4b3 | ORPH
loongarch64  |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/2008b7d46ede7e9a6c75a707e2520e78fc119de7 | ORPH
   x86_64    |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/03f142e0c167aed651782424006761829497aa40 | ORPH
    or1k     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/3fd2eb7959228d7fd6670f9c0625410884a77102 |     
 powerpc64   |         linux-headers          | TIM | https://autobuild.buildroot.org/results/ca195d00a1bf2d0205a5451af56cf6cfb2da9cd2 |     
loongarch64  |     linux-headers-5.10.240     | NOK | https://autobuild.buildroot.org/results/a83073e27c748654314e8d59eb07f23c7d84ac09 | ORPH
loongarch64  |     linux-headers-5.10.240     | NOK | https://autobuild.buildroot.org/results/597556d57009f29e835807c0dfc2d853b6c60593 | ORPH
powerpc64le  |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/8600b8345a588e5617605bbcadd39f5e9a43ce44 | ORPH
    m68k     |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/5d273e3bbe2d701c757eef3c90adb831dbb16e8b | ORPH
    arc      |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/ecd81cfb21b744fb1aefb6cafafe1cc6d60f16d8 | ORPH
  aarch64    |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/e90a86c7f159186296a688a472e783fa4c0d50e4 | ORPH
    m68k     |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/ba8020e38aba8f89b5f7568d285272e8265573cf | ORPH
   sparc     |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/1ce60771cc3654b18dd699b12c6774557756e054 | ORPH
    arc      |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/7df7d8c5389935ae792536dc4336d21e7ae5405e | ORPH
   xtensa    |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/f46e7e706ac263e63e6ee754503317abe9aeadf2 | ORPH
   mipsel    |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/dd6438c0da840000e0bfc9f6026ce7308b2546c3 | ORPH
   mipsel    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/19812635a7f7ba417609f9a76ac099f8f2581bbb | ORPH
   sparc     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/a33d0e0fbd19f6a11a9990cb8aba0f6ba6cb8531 |     
   sparc     |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/2407ba99dc3ec96f571fb93c04bb526951f5c4c5 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a9d63a37217bbf53232254697d9844255c5388e8 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/7fb95c773f8b8c554457b1e94054ed675db2a83e |     
loongarch64  |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/a6774cb58d1415adf545dc61ffb931c0e3d84de2 |     
   x86_64    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/563a799a32380075d2509099262812d0e8e8cf05 |     
   armeb     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/9daaccb61db683d6d5236c18089df9c73c851418 |     
   mipsel    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/bfce9f3a7551a71bf3b1e4915777fd6856b89173 |     
    or1k     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/b42080aa6685635cbaabd18b2f5c01ad64da7b5a | ORPH
powerpc64le  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/fc0182f55044be3b97bac30a9d949c0726d6bfc2 | ORPH
    mips     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/add3dd566317be2ba8a9ae888fd79d1931920a7c | ORPH
  mips64el   |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/153091d90c20fc90279a76ed3c3712a813677bbc |     
    m68k     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/c8d4d8f071de1791e2a56bb51e4d8ae892d56806 | ORPH
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/63ed6f359aee766d91d332149efce1cd01d30293 |     
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d2b076f0be3b76c46024a6558e02ccd2d07a3f71 |     
  riscv64    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/76a3e15e6ad86109e055467456aad3da2033ce95 | ORPH
  powerpc    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/3b99db27f046a186b36c16d74dea16dec0e41bc5 | ORPH
microblazeel |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/a7233ddb6186db68238e2796a003c59d57ad9d7c |     
   sh4aeb    |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/e072dec1418e6f3754a2b5df4deeec28468cf141 |     
loongarch64  |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/3711481c6b6a46fe1455f1d47397a7b3f4d57154 | ORPH
microblazeel |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/98d4233e65729c1dd6ca959d05839d944809785d |     
   s390x     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/af238bbd0528bc39c979cda8d64f5a3fea34cabd | ORPH
   mips64    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/2a8f55d92ceff2bd817b2836f21aeecb1395a853 | ORPH
  powerpc    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/8b81b1c211156590cb83e1e9330ca9410a1b2347 | ORPH
   x86_64    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/f034e980c6bddfec8047ba4c2a469467af2d5cdd | ORPH
powerpc64le  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/0d1501a015e06ecb38ac3158f1bd900bc9cb204a |     
 aarch64_be  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/21d54bbce4397059bbb0278054317ded73afca2a |     
  powerpc    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/55a9596cc61a40ac2ae9537c2a108cbf282a0810 | ORPH
    mips     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/725a67b23481c0e0f94ee3979f06339f030d892b | ORPH
    arm      |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/ba455c01ff73ab349d710f16d0b9956993d4f985 | ORPH
 aarch64_be  |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/0de009f6b8d0de8d37ef08d93072289bae2a10a5 | ORPH
 aarch64_be  |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/8b50721b81ef288b50066bd358690b211c307369 |     
   arceb     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/f76c8a4089bef3b410ecc891b989a4856adc8d6c | ORPH
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/910b5720b9f50dfc5049721bd3658f4be99022d3 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/2d9097bcdcb692e3198759256f64c5d44a66c043 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/7cb2f9aa7c5f33a0e973487401e443262be9a6d3 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/401b125ae09673b68bb6fa3b734720db302630e0 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/d6b80a9f96c7ed0784d3ae6731615af85a7f4c49 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/0835e606805127a1341e5121e34898e386aa257f |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/308771b1cc409e7938d7318225de67ea5487dabd |     
   sparc     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/f1c67e5e8fc8492f06c6cfc23e29a0eae8b7f16a | ORPH
microblazeel |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/57e4f21831d29b4b6a3d9c3a408595cedc29ece4 | ORPH
   mipsel    |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/b7d846789c8f201f0059297de97d02ff99b40bd5 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           at-spi2-core-2.50.0 | 1 
              mariadb-10.11.11 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/5da4f618655079ecb7c2d451eba55d689a827213 |     
    m68k     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/f2b749cb7019856c5434c27987e8bfb2dc179cda | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                    azmq-1.0.3 | 1 
               bctoolbox-4.4.8 | 1 
                  bcusdk-0.0.5 | 1 
  gobject-introspection-1.82.0 | 1 
               graphene-1.10.8 | 1 
host-binutils-arc-2023.09-r... | 1 
          sane-airscan-0.99.33 | 1 
               syslog-ng-4.8.1 | 1 
               valgrind-3.25.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/5ee48f199f8545321a5980fed4f797def1ee4499 |     
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6107a49756ee1cd21147dbf269ebc6fac6e0e277 | ORPH
 powerpc64   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/80d5efa5cf2be064694ba9c821d8c8c9f46a51ec |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/34328c06853f9bfccb1c43210c6779eac7d44559 | ORPH
  mips64el   |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/a7e14816eba8570e6e06837fbcee912eaa5c1da9 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d87803884cd0f444a26565cce1f778789d5d6730 |     
  powerpc    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/76e2d09b27c501a61b5983705d48c99175bef949 |     
 microblaze  |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/f3b9c48e8c8a6f3edfbb042d64fd0a778a9243d0 |     
  mips64el   |        valgrind-3.25.0         | NOK | https://autobuild.buildroot.org/results/9611c52a303f8dd5eb5c85c3833b2585c5904957 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
