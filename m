Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2FEC87FD3
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 03:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C9888083A;
	Sun,  3 Aug 2025 03:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MU7mWvq3KsY; Sun,  3 Aug 2025 03:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A89D80832
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A89D80832;
	Sun,  3 Aug 2025 03:15:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5433A13D
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 03:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 434E48082F
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 03:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WVgxGFchYX0 for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 03:15:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2AE8880831
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AE8880831
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AE8880831
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 03:15:13 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ae0c571f137so673822566b.0
 for <buildroot@buildroot.org>; Sat, 02 Aug 2025 20:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754190911; x=1754795711;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aOdq95gYl0qXzKQYi7duNpu0tPXzhOW0rbL5XYEmEKk=;
 b=TVgQ7YNKhdK+fgc5j41jyOCssZ5wholimEHpsbboNQHHKhAVZ3LH1CYiv6/IoQUpKI
 Ll/wI0MhYtd2o1H5AfFFJo0joeOaf+P9iGLnKTCe7zzMf+SceGyZk7plXkbihSvKrXDv
 1WZuwuJ4+Ix70rwhxXTAN/MiaC1R02rN4jglrVBdtmnnJt4Srr/1ICMlWtsLCilHySaZ
 Vq5y3e61HAYVa9JOxPucljdRQoF8bZQgfVlRn4XC1bKDuxJK3tXWLhdN2xBxmYTUSO+8
 B0GqWGP4dOKEdETyfLifcjtcO4dsa9NlQIu6Gxkp6DkTNf//hleP/CVsG+SAPJgAYUx4
 6ZpQ==
X-Gm-Message-State: AOJu0Yz2x7QF+Hh2jtNlXax9Epl+5QiMYh3HWzlKMq0ND2xlwW9bY/4T
 t26Z4AXWibj0TWM4cluvlJ8T9b+bW7G6NNJi7mYLi1LqBa1jLbjNSnZerCinqg==
X-Gm-Gg: ASbGncsjBWYlp5rhdNePECqpnUabils9Hxp28sHiYvheW39b1RPXKAiqMUl07YN8TyE
 qR+8DLYu9xijBBE+0tHkjH7g7ZfqUMxE2PTtefpqukesyaMOXStr76RSZRWkLoXe5mV7C8uBNXH
 Su0qRrxVVFU3bbCbt1MXQSVrjZLaRf/eH4OvneJj0FxA+awFiYuRzTN1WRZr8Vs1U5yEsI6iPCz
 a8fVzFtAHmyn57Hq+zZy0Byt9mChDPIUqDrzbuoEbx0vpkRJg5UjEEElTrWfkqZHbgToVtjavZf
 1Gsw1/D7/JZet+SPgIoTXOELagvVstQYwgzToFv9/11AKtbAA8qLjUQI6WrwKCUUeOXpgNSFLtl
 xlgoWEkJ6Uz74JokvvTbdpF011A==
X-Google-Smtp-Source: AGHT+IFvD5JGDTnFXqDskYJPb2F+d5q2Z4Yd9ZAJvoABVcEQBelc4tkGVy5aIu7xtxXCmoGtdWXlDw==
X-Received: by 2002:a17:906:c14a:b0:ae9:bf58:4190 with SMTP id
 a640c23a62f3a-af93ffcbfa1mr482687666b.4.1754190910838; 
 Sat, 02 Aug 2025 20:15:10 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e8306sm522730466b.83.2025.08.02.20.15.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:15:10 -0700 (PDT)
Message-ID: <688ed43e.170a0220.60f85.6dd6@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 03 Aug 2025 03:15:10 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754190911; x=1754795711; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=aOdq95gYl0qXzKQYi7duNpu0tPXzhOW0rbL5XYEmEKk=;
 b=f1tTDuKCX2tnjtBKgXmfqKYiDcVajOUvupVAKQbP7VsONYDiB5fmEFOuCR1G+4OCC9
 /YCp9UKmu1bh4fBP9LMChBSSo5HDHwM2OMXilWOqYPMbcGArg01a1LIPEfxD1l79o+9c
 kuODcN8tbt1j6XywHx3mW0pEnNaiGpg+O9tnUwNUITLKHM3d/2BoIAv1g2/uqp8m2NJ7
 uHwieb85L009nEMm6wcChcQAObQW0WY7+1J1B4hQt8nGmD3DAxr/eib1VT3J/Hi9seey
 9I4eRhtEzb+bX6CaAacreptfCcwqgnMuBm3v4ToaEKpCqKxiJk8k/03vErdPmeExL4iO
 3gcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=f1tTDuKC
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-02
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

Autobuild statistics for 2025-08-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  5  |  0  |  8  |
  2025.05.x  |  1  |  7  |  0  |  8  |
    master   | 19  | 116 |  0  | 135 |

Classification of failures by reason for master
-----------------------------------------------

host-binutils-arc-2023.09-r... | 5 
                 host-gdb-14.2 | 5 
        liblog4c-localtime-1.0 | 5 
              libselinux-3.8.1 | 5 
              skalibs-2.14.3.0 | 5 
libsvgtiny-ea9d99fc8b231c22... | 4 
                   bash-5.2.37 | 3 
  gobject-introspection-1.84.0 | 3 
       host-gcc-initial-14.3.0 | 3 
libdbi-drivers-0bfae6c43134... | 3 
                    linux-6.16 | 3 
                   nanocom-1.0 | 3 
                   cvs-1.12.13 | 2 
                flashrom-1.5.1 | 2 
                 host-gdb-15.2 | 2 
                  libjwt-3.2.0 | 2 
                liboauth-1.0.3 | 2 
              libopenssl-3.5.1 | 2 
                 logsurfer-1.8 | 2 
                p11-kit-0.25.5 | 2 
        s6-linux-utils-2.6.2.1 | 2 
                       unknown | 2 
                   atop-2.11.0 | 1 
             batman-adv-2024.4 | 1 
               bctoolbox-4.4.8 | 1 
             berkeleydb-5.3.28 | 1 
                 coreutils-9.5 | 1 
          cryptodev-linux-1.13 | 1 
             dahdi-linux-3.3.0 | 1 
            ecryptfs-utils-111 | 1 
                enscript-1.6.6 | 1 
              fluent-bit-4.0.3 | 1 
       freeradius-server-3.2.6 | 1 
            gdk-pixbuf-2.42.12 | 1 
            host-binutils-2.42 | 1 
         host-gcc-final-14.3.0 | 1 
       host-gcc-initial-15.1.0 | 1 
 host-softether-4.30-9700-beta | 1 
               host-vde2-2.3.3 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.506 | 1 
                       jose-14 | 1 
             libgphoto2-2.5.27 | 1 
               libgtk2-2.24.33 | 1 
                libkrb5-1.21.3 | 1 
     libphidget-2.1.9.20190409 | 1 
                libroxml-3.0.2 | 1 
                libsepol-3.8.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        linux-headers-5.10.240 | 1 
        linux-headers-5.15.189 | 1 
                lmbench-3.0-a9 | 1 
               lrzsz-0.12.21rc | 1 
                    mpir-3.0.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.2 | 1 
         python-web2py-v3.0.11 | 1 
             python-webpy-0.62 | 1 
                 rtptools-1.22 | 1 
         s6-linux-init-1.1.2.1 | 1 
     s6-portable-utils-2.3.0.4 | 1 
                 samba4-4.22.3 | 1 
          sane-airscan-0.99.33 | 1 
                   sdl2-2.32.8 | 1 
                setserial-2.17 | 1 
                    snooze-0.5 | 1 
      softether-4.30-9700-beta | 1 
       sp-oops-extract-0.0.7-1 | 1 
                    sslh-2.0.1 | 1 
               valgrind-3.25.1 | 1 
        vulkan-headers-1.4.317 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/e73bb37f29951a227ff5aba5e7e73767ee87de71 |     
   mips64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/86fcf37ec858763e20390c1046b64bb966114156 | ORPH
    m68k     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/f8765ab8c35d36ce066549065227e9dbadbe56ef | ORPH
 powerpc64   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/f77b6bb1ec9644c3dd80831ff2b93f8c458ceb5c | ORPH
 aarch64_be  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/c1e1e48ae5382e07f7d560e73abeb36210c787c7 |     
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/20e4988cc6c6a716ae2264786a21f8eec09795f1 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/f1fb6bf6a56538473ff537bbe043905a2b992f4f | ORPH
    arm      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/4c44bec4504bfddbd4181fe5f72c2d2e23c5c0f2 | ORPH
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/d59d62b9d67aa0ca9e3a07d3b1acdde223310804 | ORPH
  powerpc    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3e3e5b28e89ccef1b5fa01093eef230f51224ff9 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/abd856d6bfb2b47064a8b1c37da51327118535ed | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ab3469fc1d64bd416725b186c777df30d9af330f | ORPH
   mips64    |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/27c7c1597ff8a415e39b5d06c2a761d8f7fd302f |     
   mips64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/a90ff4986c1b71f44dfaf11cd702187891c16014 | ORPH
   mipsel    |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/b214857ae5988c593aca9ca821bd7ab4b13092dc |     
powerpc64le  |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/16a8b2f56b75f5140b9068ccb968c0e805a16361 |     
   armeb     |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/84d07f2e3ce748f7e0fd8523b9632853faa9eedd |     
   s390x     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/6cf53f448867fbd5bb142978e010b0fb41f00288 |     
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b1a299b999d4504e8d43a925d7fc99dc9c521b3a | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f6a0a5fc077d2bcefde4397fe5f6ff3ea8c51c04 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e423d5e2106ae0ec203151f93fd47dc79bc8c7b9 | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f5c133f9e93ae60dfacadb56fb1e91c14e100329 | ORPH
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/bcab2519e3d0bd54f1f6267303fa3e4866694a7a |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/55b8cddc23cf959dcb521976418864837431195e |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/636a94851749e1c1299fdae7aab550a25872f66b |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/2e50d9bd00c9ebcc4d1173493412df9d71a1b195 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b8e971f659f404f5ed43a3aa4bb4de7c83ffebd7 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/99a3ee66153e22e4fd9d7e0275d23fc81937446b |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/55d8e356236e62fca2bf37da078e8fc8927b75d4 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/33c8d14214e0456496464d08ec606cefa79db921 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/ebd7c10b39bf0334ba2ac3f90ee23570c2afe190 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/51544604e15955797261d9c783c84d7fe2f58527 |     
loongarch64  |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/292b0a1cb9b3d3702c5ce04d2d5adc08c023c532 |     
   x86_64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c23a5d97e0bc917a5879225d11572ea491d1e34a | ORPH
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/fd40870abdef80f1d4aeb495ab0114499f4f2542 | ORPH
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/44e4ae4cbcb820f73bd16b16fc755e1d62041e38 | ORPH
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/12ad19a1cea6d64c4b23027a5b972b2a4eb9a28a | ORPH
  aarch64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/894068f7c46c2184dca56b803202774b1ada75df | ORPH
  powerpc    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/a35fe96e222f127a54333aa05c3d8ff6fa4a7f4a | ORPH
  sparc64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/9985f19107649b61445a20de7d247c78f0746088 | ORPH
powerpc64le  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/c9d999ef583dc77643ff16b2c14187a85551012d | ORPH
  aarch64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/a3222bf79d5013c076c9d1f33b00f3763c6908e7 | ORPH
  powerpc    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/561b2e0e909e544d22520cc88f221a619b90f959 |     
    i686     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/3d8cfafda71e3342b98f639b4f15af1f46b6d1e9 |     
   sparc     |            jose-14             | NOK | https://autobuild.buildroot.org/results/37ded2d13ab10a3d3b740b6053e1bd39345d94bf |     
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/3bf08f0ffef70c9715fced06738ca2c1ba69ccca |     
powerpc64le  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/97d8404e143bade5d18624ca5de70f51c0a2efff |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/31d07a233ab9547790bdd7f48bc14fc6cbe51c9f |     
    sh4      |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/b2c962798b4161003d055fef1518506a1988ec76 | ORPH
powerpc64le  |        libgtk2-2.24.33         | NOK | https://autobuild.buildroot.org/results/3159709b206633b4cd83c151be4bdcd298b5b827 |     
   armeb     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/0e7657d6f30287a91c123d65ccde53ed4d27209d |     
  mips64el   |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/cdbbc25f6ccb26d1e9485fb1081a8a5dbc841524 |     
   xtensa    |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/b5e52a75ad9123004910b04c452e4a99cb4253db |     
 aarch64_be  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/e2b73a17b83ae656282225495da35a0201e9aa63 |     
  powerpc    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/8e1e7a1e5c1c4fb03642d525d7a38295982b9877 |     
    arm      |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/5739277f0505479604c2b7fc6042d8877cb58f63 |     
   mipsel    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/92c656440db6fab393472d9a91fb0384528702a3 |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/e0f8ea1490d242db9ea4213baf2013b864b81a81 |     
  riscv32    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/58d6cba60fe8ac96f9fdab06ddf60ef7c9a924d7 | ORPH
   armeb     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/f6d40531225a02c223b5bb54ebcfd9603ac3deb8 | ORPH
  mips64el   |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/ac68ed7d542ec7fbd11ba879706e1b9fcaf621a9 | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/a492f255dffef4ae73baf9c2af5e96aabe505b14 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/edde631dc5ebd139437f192eb3449769df3de340 |     
 aarch64_be  |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/ef4ab9aeb083990c139c6c865618b17694d6c91c |     
    mips     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c096afde794be3f265f5dbf7bbda137d409c8b5c |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0648dabf9617f590ec8ef7af4d568ffa09b68ec6 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9aae9bc2fff7ad16615de87ecb59a2b4f3853650 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/68ae160b7e11386e7763050ef15a20146d4c8941 |     
   mips64    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a521e57fa572f34dea8f21a1691b87afb4590f4e |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/aeb93c7c7c3bfe34d323d5fb86025d06ff7d643d |     
  riscv64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/6dea10d5285fd7cca5cee23d2b5fe5b81a7efab8 | ORPH
   mipsel    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/c38d2ebd583bb108f329420b86622388fa4d9284 | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/e745aaea6cfaa5bfb74b4d09ac505d0458c90711 | ORPH
   sh4eb     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/d1f6a50a2e14a99141f57128ad5241ba9ce1313c | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/12964ea453a2e29971bca1020607009b29b7fd4e | ORPH
    sh4a     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/7b366aafbc5f538345639b52aaccda1a711101e1 | ORPH
   armeb     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/c8512c8238967d909e6c05980e17b46ec3704eda | ORPH
 microblaze  |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/359a2eff20f16a5d709fc1084183265017109d2a | ORPH
loongarch64  |     linux-headers-5.10.240     | NOK | https://autobuild.buildroot.org/results/c61477cc86ffa4c5b03c510abcbb33a7842b967d | ORPH
loongarch64  |     linux-headers-5.15.189     | NOK | https://autobuild.buildroot.org/results/06ce675c34f47ff61d2f1859893ffdd0ab53f337 | ORPH
powerpc64le  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/c6a55a46ee9380964075dc7832c77bd08f832062 | ORPH
  mips64el   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/eb86e720456130f6d0db6e5c637f7fa117b7e435 |     
  powerpc    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/0df8ebfd0f8e3dafe03c6453a21b27d1a43cfee2 |     
 aarch64_be  |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/a1a5aad2ccc69aeff586d7a83620f10d51ccfdb6 | ORPH
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a0bb858251319c3e0db57ccbf12825f5e65b4206 |     
    sh4      |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/8180b8ae1c0266509f75f8d64680710841d96f83 |     
   sh4aeb    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/1c89c3188483ba19105d23acb0c0953e634502b3 |     
   s390x     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/aea79409a1d28d5e0ec5751261b9f5f574d767f9 |     
  mips64el   |         p11-kit-0.25.5         | NOK | https://autobuild.buildroot.org/results/f2d15136b0dc0d7361c86e9d7a49bb9fa73e9fb1 | ORPH
powerpc64le  |         p11-kit-0.25.5         | NOK | https://autobuild.buildroot.org/results/e91e762088bc36eca1b575ef9b081f838c1b2137 | ORPH
    or1k     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/d975eef0d1fbab64c516219e03662aebda2f7179 | ORPH
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/9450b1a6fc1967334b0706199d879b3eb2a092a6 |     
 microblaze  |     python-web2py-v3.0.11      | NOK | https://autobuild.buildroot.org/results/2de6fe1d2d56d7df65d83bad64dccf9aa865d49f |     
    arm      |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/743d0f8e59b4a371906695162bfc945288dbe0c8 |     
 powerpc64   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/da45ba5e90bf081cc1bb7cfe58a32777e68a0d2b | ORPH
microblazeel |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/988204f03513fb68a08ee642ba477ff9254cf894 |     
   sparc     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/49878db24a9770d43e2cdf046208970f11e114db |     
    or1k     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/020b9b810edfe646068d9a2079b8a86388f39b64 |     
  powerpc    |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/1fa2d133ca4a015d94bf8851d2dc17afbfacca99 |     
   sh4eb     |         samba4-4.22.3          | NOK | https://autobuild.buildroot.org/results/df55192a310786dc5c3e7cc759bc1fb13be43a58 |     
powerpc64le  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/0f934cdad4dabbfaae17f26e94afa7dd908793b7 |     
  powerpc    |          sdl2-2.32.8           | NOK | https://autobuild.buildroot.org/results/948dac1eed4f81ba205f66ff772274b82c178827 |     
   x86_64    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/b5d297e2b167cda49b988dba2c58bb3ca0798a53 | ORPH
   mips64    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/928bb67c54bd1f66ff62a759e4f0117fc9090166 |     
   armeb     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/3c2924c07919e53432a33ec8c9a4435cb82e4010 |     
  mips64el   |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/f8cc77524c390899f22d309cd0763075662688cf |     
microblazeel |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/2603599ad01d12c81217a63048adc1265dc7de85 |     
  mips64el   |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/cd8971ee6eff54c8e56ed661915a11ac64dcb703 |     
  riscv64    |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/baf123961e2f8bfadf344b11cc49c6a15c44bc1a |     
    sh4a     |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/de4a280a1fd808efacc5b53617787ac4bfe9de1f | ORPH
    or1k     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/e9d8872fd625f72b8d58967a115717de8d72d994 |     
   mips64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/bf3876a83be80093aae9edf81f95f7210f5010f9 | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/295e41cc4a8538a3e39b5ef379a77aba4db504f8 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3c17d263b0350d063f9df25965ed8c68c7163354 |     
   mips64    |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/281d0f49c9b66c05e471f5ba1e8cd96caeb48389 | ORPH
  riscv64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/24a615bebfe56154bc7f8dd8e36e21d1c2c9719a | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  cmake-3.31.5 | 1 
              execline-2.9.6.0 | 1 
               host-vde2-2.3.3 | 1 
                 linux-6.12.37 | 1 
                    snooze-0.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          cmake-3.31.5          | NOK | https://autobuild.buildroot.org/results/b0d2545ab16b4b47be18e3e1e946a8825766672c |     
   s390x     |        execline-2.9.6.0        | NOK | https://autobuild.buildroot.org/results/6733602cd56a0b081072b2f0799b4e5802d3398b |     
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/58cc58c18bd5da424d49b3b6a7623b20ee4426f0 | ORPH
   mips64    |         linux-6.12.37          | NOK | https://autobuild.buildroot.org/results/89c4513bd52fe8a76b72e4bd054df070e8c1acef | ORPH
    arc      |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/aec463f87094a47ee059113f08e8ee3604dcea9b |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

          sane-airscan-0.99.33 | 2 
                 babeld-1.13.1 | 1 
               bctoolbox-4.4.8 | 1 
                 dc3dd-7.2.641 | 1 
               libsigrok-0.5.2 | 1 
                libvips-8.10.6 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/3d8a80ccc3da9e7fd621d0ed413c3546db7b9a77 |     
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e7cdab2f1187c4421400a3ce02f7dd0fbaa0f40d | ORPH
    m68k     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/6543910b76e9b383f7223e808456c7ce2b874fd5 | ORPH
   sparc     |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/a5eb97b7bd1821338f51474dfd8cdf2da7a2ff3e | ORPH
   sh4aeb    |         libvips-8.10.6         | NOK | https://autobuild.buildroot.org/results/b943710f79c9a7337e3975bdde5feffd7b487b4e |     
microblazeel |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/b0bb2ce9f79cb3a477029ed455f3d355216e4d9c |     
  mips64el   |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/20c20318fc23899c631ca22946ddae330a5fcf72 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
