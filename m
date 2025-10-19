Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA4BCCD183
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 03:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5654383E96;
	Sun, 19 Oct 2025 03:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69GJUkcamDPl; Sun, 19 Oct 2025 03:27:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECAE083E97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECAE083E97;
	Sun, 19 Oct 2025 03:27:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E62181CC
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 03:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D82BA401C8
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 03:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJTSKSz3R3xS for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 03:27:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 152DE40128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 152DE40128
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 152DE40128
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 03:27:45 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4711810948aso19442215e9.2
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 20:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760844464; x=1761449264;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e4kMNvzG8Fer4Pbt17Xj8Vp2nx2g/cVTV3sJDRbJ6qQ=;
 b=oMnjegxFcoT8mtQFCHfaqxg3BWXutRBLRhW1lIw+RrEWvwL62BrSjnQKfF6GUAengr
 HQeyyh5Q5AuP6LQzzXDRi9v7rzlmnIhqMxZcLHGZvhKKYjWhQ04cyieqdSke3cj9EbEV
 7S5TlxbQoZKhqJjb+opAvWHFbDD43q5lLfUvHL9K06QoZj0U7vKJ+mh3rRw+4bGFn2Q+
 ZC89e7FmWo7SaBpaCdqkCRRsZyoIerAXyrA2mzyMPojYFcO5E8oPQ3UU+NB+vtoQKfT0
 VPO+0bCDeT/LroubyGWW6svurZEYL+KX06zTPvf38B9jcxhuAGo9s9tzxZudAq6x52J+
 4OOw==
X-Gm-Message-State: AOJu0Yz3Vr57Gxr+SLbvo9h8wr/H8D/kH/Xs2cTkfQEi2KpBrbCAEoBx
 4t1sFLnRgizwLreEUV3dlpxIuXOuSqYjfpRqGD2sCKUdZkHj8oCaPlDa0v/RBQ==
X-Gm-Gg: ASbGncuns6JWXN0wWnImHBDpIZtAoxaDjhmw6cFq8gdJKfDTU8lrYzCLGgaCrEgYXxR
 rTyF1ulGHN1vnb08EDvmvuByylIrN2Gi07cjoVCUvaPvLT7hPRYx3bjRvtEoSLikDHeUghQDueG
 v3K5JhSrtF7dYiaLszqIDCu0vR6k+aFFWxcaAIeEed1qMmN8/VyPCTkBBhZO/iLFNBGly7D/BeX
 1mN2yytB0xjVEaxkMtLApSjyLyKP5SJNRcSYEXF043Rh/HsrxangmdLuCULJkpv8WkZLOKP6gbN
 sWk0vvVPR7ep1boSywS7m+3TMmC6C23AliSbfoCj0bcx/1xINe2xKsx0umKyXbZwkUkaTVGNwuu
 fsnKpVOJ3K0BakmPpYtBK7V7KbejGYIj85RgZXebreF3DgbHYUug9GQ9bfTOGF/nYmDntIaKmXy
 rt2DdS7Vc=
X-Google-Smtp-Source: AGHT+IGgX/xgJKvvq6fyNmlBglIPh83ub/vtr39c0PDlw76CIbxZDIap+0tf8Oj7XWvCdN7YkOjKkg==
X-Received: by 2002:a05:600c:548c:b0:471:16e6:8e60 with SMTP id
 5b1f17b1804b1-471177c0948mr60889055e9.0.1760844463555; 
 Sat, 18 Oct 2025 20:27:43 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3affsm8067288f8f.12.2025.10.18.20.27.43
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 20:27:43 -0700 (PDT)
Message-ID: <68f45aaf.050a0220.17a399.1418@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 19 Oct 2025 03:27:43 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760844464; x=1761449264; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=e4kMNvzG8Fer4Pbt17Xj8Vp2nx2g/cVTV3sJDRbJ6qQ=;
 b=g+RnJsSOP0TmIteccSZ/KwNQmhhZTnSuh3g7fz7nXp12ThUU/PAnEHGRGvk/BH5k7n
 DIXtNCOfzKRyGPMb9fYPmRbrMqYdioKfa2NGQoVcKQwiFD16pQpolCRWftKqFVTGCnMI
 bOjqIH8+mFL+CKnC9E21WOYahd71RhLMTgezmOeAwp5uWzB26fkqUE8oYtLSxrLhkynb
 egEN8oRWxQJQjU6RhjIckkumxmxX9faLorRQklUMDltKReo516uehq/NS+VUwGAMDxVw
 X4aALdYn9qzIcNZ7cUhmWM8ZrEtKdGpLToZVattpeUhcXsEzsOFSUQqz1/XWSgRTqv1m
 V7zg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=g+RnJsSO
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-18
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

Autobuild statistics for 2025-10-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  |  6  |  0  | 14  |
  2025.05.x  |  1  |  2  |  0  |  3  |
  2025.08.x  |  0  |  8  |  0  |  8  |
    master   | 41  | 77  |  2  | 120 |

Classification of failures by reason for master
-----------------------------------------------

               iproute2-6.17.0 | 4 
libdbi-drivers-0bfae6c43134... | 4 
                 c-icap-0.5.10 | 3 
                       unknown | 3 
               asterisk-22.3.0 | 2 
                 dc3dd-7.2.641 | 2 
  gobject-introspection-1.84.0 | 2 
                 libgee-0.20.6 | 2 
              libopenssl-3.6.0 | 2 
                  linux-6.17.3 | 2 
                 linux-headers | 2 
                     nvme-1.12 | 2 
                   perl-5.40.2 | 2 
                python3-3.13.8 | 2 
amazon-ecr-credential-helpe... | 1 
                   atop-2.12.0 | 1 
                     avahi-0.8 | 1 
                  cairo-1.18.4 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                  cmake-3.31.8 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
           dmraid-1.0.0.rc16-3 | 1 
                    dust-1.2.3 | 1 
                enscript-1.6.6 | 1 
                 expect-5.45.4 | 1 
                    eza-0.23.3 | 1 
                    gcr-3.40.0 | 1 
               gocryptfs-2.3.2 | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
 host-softether-4.30-9700-beta | 1 
                 htpdate-2.0.1 | 1 
                libdnet-1.18.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                  libnids-1.26 | 1 
                  libnss-3.117 | 1 
     libphidget-2.1.9.20190409 | 1 
                libressl-3.9.2 | 1 
                  libsepol-3.9 | 1 
                  libsvg-0.1.4 | 1 
               libtheora-1.2.0 | 1 
             libtorrent-0.13.8 | 1 
              libudfread-1.2.0 | 1 
               linknx-0.0.1.38 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                lmbench-3.0-a9 | 1 
                 mbedtls-3.6.4 | 1 
mjpg-streamer-v1.0.0-1-g310... | 1 
                  nginx-1.26.3 | 1 
                     pound-4.8 | 1 
          sane-airscan-0.99.33 | 1 
                    sdl-1.2.15 | 1 
                setserial-2.17 | 1 
      softether-4.30-9700-beta | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
uclibc-ng-test-132c6134d691... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/b52397a9351c8ad777cd62781a16c07d232d74b2 | ORPH
  aarch64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/0f1678d07e98cf0336bcc8aa6545be45435196c4 |     
 powerpc64   |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/7f8ccfe149a861181718c64b3276bdf7107444d2 |     
    mips     |          atop-2.12.0           | NOK | https://autobuild.buildroot.org/results/a9049b18e5de7e226b9e189cce25e9fa3a2eaecc |     
   arceb     |           avahi-0.8            | NOK | https://autobuild.buildroot.org/results/719987ecdcd7db20b72698f6a2573d9bfe0da0f8 | ORPH
powerpc64le  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/6bde91c9b94b2bfb675aa9634548fd37cc1d5dbb | ORPH
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/e79227c0706167efc22f76a45f2689e5ec88639d | ORPH
   sh4eb     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/83450ae3a0952e720f93137e5c744e2068403474 | ORPH
  aarch64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/d40366a9ad8bd69fce016c948ef8b895054cbb4e |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/9539a3dac4cf377f4a1e1eb2e1b057f6386839f9 | ORPH
   mipsel    |          cmake-3.31.8          | NOK | https://autobuild.buildroot.org/results/92b1ed36e750d9ad756793814f9d1133bda0e013 |     
    sh4a     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/20b5db4c1922580173730dd67524c13b8f18f7b0 | ORPH
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/47fe1bfe3b052c7c085536569b895e62ab4ce5e8 | ORPH
microblazeel | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/a11a5f500fde8889080ec1091d3179504c16b95a | ORPH
   sh4eb     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/03b9bf462e40ebdaf426da20ef0c7e1049e010ff | ORPH
    m68k     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/d5c53f9d30cf69aacabf94eabee050ab0088cd79 | ORPH
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/a7f1b0a3daefc7f537d9e1b1a141b1fba21d79b3 | ORPH
powerpc64le  |           dust-1.2.3           | NOK | https://autobuild.buildroot.org/results/fe97237a4fe6fd12d04e759dbd242758d4b231fd | ORPH
loongarch64  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/dfbfbc40f515c87f2e56a19aff363dd6dabf83d4 | ORPH
   mipsel    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/ff6eb9c155404e037666ecdcbc4b31744ffca482 | ORPH
   armeb     |           eza-0.23.3           | NOK | https://autobuild.buildroot.org/results/7962495aa2f8cc61f08f6d7a8520b9f420e130e5 |     
    arm      |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/9d7842f7517222a039e31bc21adfe1c5940357f7 | ORPH
   sh4eb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/df841071168e66ec24cafdbcf173f669b70489d0 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5ebf764b13b4fd4f505dfe783a81460ec18d3568 | ORPH
    arm      |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/c4fb5b3d8174df25542b183efca85b57814c30f2 |     
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/b301367c4da34f916fd2faf0146875f3d5d99cc2 | ORPH
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/2e511c86b301ce75939721a44d2928388e87a209 |     
   x86_64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/b5b0ef7a602ee0a56c6269bd1384196f95110b2e | ORPH
    i686     |         htpdate-2.0.1          | NOK | https://autobuild.buildroot.org/results/b4ca79ecd9fd775d8df77c48dcfda5f3903ae2b0 |     
    or1k     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/bfe103775c64385a8ad8a6dcf6d093c3617536d2 |     
 microblaze  |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/2b9d213d05ded3db219a1f7c70e1914fe7e12eb6 |     
  powerpc    |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/0184678d2707c4701afae1b01efea17b97f1467a |     
 microblaze  |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/951e4198b2ba109fd9c746fe2e6316a29085aeeb |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/9c09208dcf451c49cdd02bc3043edd4f485a4717 |     
  sparc64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/bbad65edeb39eeba5e9e3cf9af558138fc283ddc |     
powerpc64le  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/585243880b61eb23eec93a54a3b5cc1781f44823 |     
    arc      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/1c2122c76e1e23042d5216c4b131698695a0547f |     
 powerpc64   |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/f4d3311f61e1e137b046747f8979b1ad38bbe3db | ORPH
    or1k     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/5ecc4ed4e70501c9a6a82e6c51eb2023b1c39e56 |     
   s390x     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/b614e2ad7c550800d3af663f6b252987ff654441 |     
   armeb     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/44778d849d6627159df7fabfc3af92dc9b008a4d |     
   s390x     |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/58dc14b1ab1354848ea6c0ebdd81a44d3e13b201 |     
loongarch64  |          libnss-3.117          | NOK | https://autobuild.buildroot.org/results/00d9a8713defc377bf82a539417aea161326e2c7 |     
    i686     |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/81340607b81990be02877b4b790274c149345542 | ORPH
    i686     |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/214b918f6b56e005b180145d245491971f3e3476 | ORPH
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d2320130af70068b180acbfaa95cef5442d564f5 |     
    arm      |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/cab39e9ae9224ae9ce61ae26bdb7b7645e7a1033 | ORPH
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/776385e24884d28c7b6a669316df02c3481a1e1b |     
   xtensa    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/9f966ddefe442922151c7e861257551420ad17d8 |     
   armeb     |        libtheora-1.2.0         | NOK | https://autobuild.buildroot.org/results/f2462a3e644f2f044e8390a870d0fd4c51b7d3a9 | ORPH
  aarch64    |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/067f3b5d2baf05d921e3880eb4d239fd28e24dc1 | ORPH
   mips64    |        libudfread-1.2.0        | NOK | https://autobuild.buildroot.org/results/dc5552ca9576ae7d5a96cadf1bd0bd1136d77e4b |     
   armeb     |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/664de798715ff6c980a63bd93f3648c0f9a89731 | ORPH
    arm      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/2888b0b6f5473e9c7ec7c443b02b42e1f5d4c814 | ORPH
   sparc     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1124aaef454f87143bb3095d865d83b5f4f5a8e8 | ORPH
    m68k     |          linux-6.17.3          | NOK | https://autobuild.buildroot.org/results/6753b24e37b2ae298134b5bd12fdf6a974e1de3f | ORPH
    m68k     |          linux-6.17.3          | NOK | https://autobuild.buildroot.org/results/f6d48b805724cdb28324fe683a5a92c621c5eb03 | ORPH
   arceb     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/3cc1ed8d7a1222e308681f38d8ac6c845df7f9ce |     
   arceb     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/b729a88ff97d16a331fac9c566b3014d4190b977 |     
 aarch64_be  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/6f966b33be938beaedab0f872be71e7e2105e774 | ORPH
loongarch64  |         mbedtls-3.6.4          | NOK | https://autobuild.buildroot.org/results/8494b3e53722fd0cede48541e4de6aa105c462e0 |     
    sh4a     | mjpg-streamer-v1.0.0-1-g310... | NOK | https://autobuild.buildroot.org/results/3a5674e4e7bb3f2894575191af24598e2a696912 |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/4efc8282bc474f63c2f803d3733c826bc98d50a1 | ORPH
microblazeel |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/af78d0ec432b4a9515cf6ddb641264271d89f340 | ORPH
    or1k     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/0994ad55dc56a8934e22a0ed7f043dc088274100 | ORPH
  powerpc    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/3cadd94e8062171d723c511524ac38cd66fece25 |     
powerpc64le  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/2a056b32756066c67d226b582b46c04e6a6f911e |     
  aarch64    |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/764a01fc034e7fc884d1c033900de92713a1f08e | ORPH
  sparc64    |         python3-3.13.8         | NOK | https://autobuild.buildroot.org/results/986b520f8496d9792a39731a80d782a6848e2a00 |     
  sparc64    |         python3-3.13.8         | NOK | https://autobuild.buildroot.org/results/1fc1934fa6f573663f4fee4e4f606082d5f488be |     
    sh4a     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/1d8a6f255dadc5f16a052f36263546f73142621a |     
   armeb     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/fe7da3e6dc6599fcaf973cfba9dc723d62fedfc5 | ORPH
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/4ab1ddad23c629303df7b2c896f6721574f07cc0 | ORPH
 microblaze  |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/de4f73bf2c2eef909a0b1308a4813b9a922b3da3 | ORPH
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/6772daea7ba1034e89e9debc7cfcfddab52b1841 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/41a2cae89a62fcf47ce6601d7a71c4f08d81f148 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/69ba9aa049d6ebd201f858c2d74f92cb699b9817 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1e2fdc5c157b856018fcd8788d428fdb757e7788 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/a59f8a2bf677377d43c3b4933d7543d3c7d70cfe |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

             libgphoto2-2.5.27 | 1 
                libnice-0.1.21 | 1 
              libopenssl-3.5.4 | 1 
                libsolv-0.7.30 | 1 
                 linux-6.16.11 | 1 
                    mpir-3.0.0 | 1 
                     pound-4.8 | 1 
          sane-airscan-0.99.33 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/134edacd2cf15d302d02d66e4fee389c0e8ea381 | ORPH
loongarch64  |         libnice-0.1.21         | NOK | https://autobuild.buildroot.org/results/0af07261118c273d05f53ccc5f7f9ad971fbf640 |     
   mipsel    |        libopenssl-3.5.4        | NOK | https://autobuild.buildroot.org/results/86277471302b27d1b558bd4140b94883dbc5354c | ORPH
powerpc64le  |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/ea39943a739fe24df32f94cc2e3b64d25404a2c7 |     
loongarch64  |         linux-6.16.11          | NOK | https://autobuild.buildroot.org/results/404d0585a1b5695b065598cde459c06240d9b354 | ORPH
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b3934ae5bb26036a090c10029f5c1c8abd5c0ce7 |     
  sparc64    |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/b81e10c4c4dc93255ed9db983c632b214f756819 | ORPH
  sparc64    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/c1fac4066b5ca86258dd218bdcd8d0a2dbdc54ff |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

cpuinfo-8a1772a0c5c447df2d1... | 2 
           ghostscript-10.06.0 | 1 
                  libbpf-1.5.0 | 1 
                 libgee-0.20.6 | 1 
     libphidget-2.1.9.20190409 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/4771fe4f899d30118aed51d8167f7cf68e0491a1 |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/046e7f3a38a906561116347ee75db6b338cfe394 |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/ffbb925e2e690ba4f3395b828589863fdd564c82 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/2f05b3e025b58e76677049cf7e919ada2e7d6db2 |     
   x86_64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/b7ae5a040eae3933ea57c503ff5d3232d7ceca65 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6ea57e8dc3cb4fab4a1d7ae4269b0d63de3887e3 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

google-breakpad-f49c2f1a202... | 1 
rtl8821cu-96c65c58b54424117... | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | google-breakpad-f49c2f1a202... | NOK | https://autobuild.buildroot.org/results/3f8e708632c08e5a81b15322fa650c3af38f9255 |     
   mipsel    | rtl8821cu-96c65c58b54424117... | NOK | https://autobuild.buildroot.org/results/33c044909a537ad1e84757fe6c286fb3add24526 |     


Gitlab CI results for 2025-10-18
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/11732222705 |      
                 hifive_unmatched | https://gitlab.com/buildroot.org/buildroot/-/jobs/11732222972 | ORPH 
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/11748713478 |      
                       nvidia_bf3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11748713653 |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/11748713848 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11748714969 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/11748720110 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11761751535 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
