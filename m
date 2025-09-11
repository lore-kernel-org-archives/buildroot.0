Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E0DCA1016
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 03:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4F8740DBF;
	Thu, 11 Sep 2025 03:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CoWPTginyluC; Thu, 11 Sep 2025 03:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57A9640DD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57A9640DD0;
	Thu, 11 Sep 2025 03:20:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CD13234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 03:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E0FF614BD
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 03:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QZZqiVlaXKV for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 03:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE204613F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE204613F1
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE204613F1
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 03:20:01 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45ded619608so1938015e9.3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757560799; x=1758165599;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KHeX1ctTNPbYyX22FsQ8Lcp3sE2vrReuM/O/35I4z+E=;
 b=kqaZwAojn5Cz/5jg3bzwJZIyA1QV8UiHCHRzXQk++dbmsyEe0dUL8tjXqp+IDUV/gm
 gCfAgYkuSv3aUslLoaZgPpGAfEOs0lRECzT2KHVsYqP5jFEA0GG9eGc1fwp+IVyyDOse
 DF1yIYflgMMOQTHR5tsSd/EZ7718QoNYHAJeViFzcCcFis3lfVxF8WmebYC1EZyw38iR
 Ya0bXGkh/tPqBmJpXtE83nrk7aYovILvZ+Pbjo+yHjaa4gAzwfJxbQ54FNt3X83/SPof
 35kwqIl6dzHdbN8eDZjynNtGy6h19zPRRC0CiLRz1BVYDU0tDjGJvnAicYpzs+d87PfO
 3Inw==
X-Gm-Message-State: AOJu0YwmpyGtu0x5Da04KTSH5PAmYXAQGdn2izr2VpAO1rp3w4RDTxVa
 VKo5E3e82OP5sGv5wMt8jB6TyKEi4tUp53+lLhcnnhHa7n6m1VYrD4iA0XLBVg==
X-Gm-Gg: ASbGnctn7Vt1YZxm25yDGf/D1m4r1k17cTWnYCpaipHoI9FTKg3jqMxpZFMGU2V/usp
 CFXX38EBivmjx9BnXvCk7066uDkzhNQGnExGLCV/XL8HUw20ymzYVPxvfails1CigIXvnBMnIpz
 0WyB03rxGAlDJdPITRmEULdYVE1u4+M9BJfFtRc9iycJC3xL5zny02w/juAF95Eny15ROGiEJcL
 v3r3NEEmoATi9e08vvFlYo43N7BEhRgaGHXHQUl4ZYvZMgPp1hz2hzHdtNooW8wpa1EiAyfwxWc
 KlBx+38MAE3yjG6BspPq+tb36PDwS16MWkD2S0fFjE9b+Kvrqhs8I+sfeuGaAZQjxCwoGv8JDGe
 onh4jf6G1zACqBSfngMrLKrDtC2zcvw==
X-Google-Smtp-Source: AGHT+IGSUJhGYEiCIJ1bPSZFIdDVN2aYCvdoUahjlchaa9GtBHeaXUqSiKNK0ll9+LHAoFyt801qmQ==
X-Received: by 2002:a05:600c:1d26:b0:45b:90fc:1ede with SMTP id
 5b1f17b1804b1-45ddde6a436mr170854745e9.6.1757560799121; 
 Wed, 10 Sep 2025 20:19:59 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e015775f1sm9937215e9.8.2025.09.10.20.19.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 20:19:58 -0700 (PDT)
Message-ID: <68c23fde.050a0220.3ab851.2cd8@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 11 Sep 2025 03:19:58 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757560799; x=1758165599; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=KHeX1ctTNPbYyX22FsQ8Lcp3sE2vrReuM/O/35I4z+E=;
 b=LXW3ELlwZwR5rCZJW9YLUjZj9wUEHGt7GGYeTlMDDvoyFBWD+Io7q9UsDFkbcYNNpK
 G7PNtghzMPh1NuSV3I8l+O93ViYRxjd4E0oauVR+2qLqteXklKWgLx8H6u1RTp55dYph
 NUTGEoqa8ddJZD3G2mEIHq4AKFBOlucLBu3KhjcCr0L5MX72l+zWKA0KDy4DkAmKfRah
 bAVNzNodXthc3Qx7BYk7jxc06JLXacJLMTBT5G7i5nogLYufFJU4uTpocYSG4q9gbdxd
 GlHC04lca/ba8+alJ45OJfvBvUqe/ItrmkndoR2qzYPyUMs+9FFBHrHFPt61XVzIDn+4
 SkDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LXW3ELlw
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-10
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

Autobuild statistics for 2025-09-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  |  7  |  0  | 15  |
  2025.05.x  |  1  |  3  |  0  |  4  |
  2025.08.x  |  3  |  3  |  0  |  6  |
    master   | 27  | 77  |  1  | 105 |

Classification of failures by reason for master
-----------------------------------------------

libdbi-drivers-0bfae6c43134... | 5 
               bctoolbox-4.4.8 | 3 
                   cvs-1.12.13 | 3 
                     gdbm-1.26 | 3 
     libphidget-2.1.9.20190409 | 3 
              libselinux-3.8.1 | 3 
                 logsurfer-1.8 | 3 
        vulkan-headers-1.4.317 | 3 
                    azmq-1.0.3 | 2 
             dahdi-linux-3.3.0 | 2 
              execline-2.9.6.1 | 2 
               freeipmi-1.6.14 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
                  libsvg-0.1.4 | 2 
                    mpir-3.0.0 | 2 
                    sdl-1.2.15 | 2 
                 siproxd-0.8.3 | 2 
                       unknown | 2 
                    bat-0.25.0 | 1 
                          bird | 1 
          chocolate-doom-3.0.1 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                enscript-1.6.6 | 1 
firmware-utils-86739f2b3ae9... | 1 
  gobject-introspection-1.84.0 | 1 
                   gvfs-1.57.2 | 1 
                haveged-1.9.19 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
                    kmon-1.7.1 | 1 
libdill-32d0e8b733416208e04... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                 libgee-0.20.6 | 1 
                  libjwt-3.2.0 | 1 
                libroxml-3.0.2 | 1 
               libxmlrpc-r3176 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.16.5 | 1 
                   linux-tools | 1 
                 mbedtls-3.6.4 | 1 
              netavark-v1.16.1 | 1 
                 netsnmp-5.9.4 | 1 
                openssh-10.0p1 | 1 
                   perl-5.40.2 | 1 
          perl-net-ssleay-1.94 | 1 
                python3-3.13.7 | 1 
       sp-oops-extract-0.0.7-1 | 1 
             util-linux-2.41.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/41ef3b68506bf84d438efb3224a5b7b7a1020110 |     
    or1k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/fe4e76f8ab89ae676cdfc687f2942063e486c8b3 |     
   s390x     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/455906b5e433971e23157728b567952bcef533d9 |     
 powerpc64   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/67f4f47e59fe85817909329d6f8615d392c944ed | ORPH
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/dad1e4ed880493f30744aa4ff8c14b9561fbaadc | ORPH
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/7dc62e1a1a223592aaff69c3c99ac345adabbc78 | ORPH
   mips64    |              bird              | TIM | https://autobuild.buildroot.org/results/007b906326fa8cf61046253bdc37d06ca59f5449 |     
   s390x     |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/835befe26aab5fd82731d031da0694fca2c7cc7f |     
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/eb4266282f9dd49714de44bfcf761fcc8adc4241 | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/114e07c3922c997f524c7dfcd34f3595643e5a0d | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9899c9c383461c2e8e1e5490b8bfaaa1d268e683 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d82eb5bf6c26b297836f56230a287194b6711dd3 | ORPH
   arceb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/95d53d5effbbb916059b52c5dd19408cc97e8679 | ORPH
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/d4453ef4bb3df0012925b42e6b5b1ea2c528e4f4 | ORPH
    or1k     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/6894d6d1d05073a6a4d39ced66df809d62675ad3 | ORPH
 powerpc64   |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/95d476a678ac1c9a300c43b8c9cf443fd6bd5441 |     
   s390x     |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/6fe3c4dec717c29a6bb1e269655734ed80af1bc9 |     
   arceb     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/e1f45809996c7dd6d46eb0b7693f703e3ec00a39 |     
  powerpc    |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/827bf3130c81132eb1128c1d9f66c761f5e1ec32 |     
  powerpc    |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/b541511d1fb4aaf2c819de29c06142fa40f5bb66 |     
 powerpc64   |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/29e9b1ea908800c80166a1ff698e6a8e121053e3 | ORPH
loongarch64  |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/0341d8284d9a069533b55103c1666b90467306d4 | ORPH
 aarch64_be  |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/2498ff8f72ba73b717e317ae0884730ab72dbc82 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/f23d7b06763e5bf6f131b1d6dd67699842f00b2f |     
    mips     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/01df0b7792e9605234d5d2da44df087229e617b4 |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/10e9a57ad5815e105e2da06994847a478327f545 | ORPH
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/65c97082061cf858170272b5c638777808b39067 | ORPH
   x86_64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/347e60f9a0d94dbddd71c84b56f38356dda92c29 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/09c401434dda31f8e7d007ea2062f4fbc704eff2 |     
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/7cb51a105f4ea0fc8a8baeab9772c5b24167cd04 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/f0110975b62143aeeec7aa2528f6b6ced9395c45 | ORPH
   armeb     |           kmon-1.7.1           | NOK | https://autobuild.buildroot.org/results/b30ea90d98c8a3158f8ad52e0aefc3fbd9da2c92 |     
microblazeel | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/f5ccf411eed4ae22120df347ce6e7dcf71fc0279 |     
powerpc64le  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/8f479b78b1c15ef32b5e4bd0ed6f22e89c4d13c0 |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/7a606245843c7c96833d87c2036bec2424813f2a |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/8e507e0a4a0a9ab95f8a73769fd3a662041f7678 |     
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4f7fd7a72343b8da9b4131d0be49cac72deb050f |     
  mips64el   | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/9a52ac17f8b679cf71e0cf76dbe6f68bf3677ed2 |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/9cd2ce9abadcff2f57ddccaa2f2f8322f31ec5a5 |     
  aarch64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/7082ccabcd478e557bf377797e9e646375d7fad5 |     
  powerpc    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/042d554f2e0cb1f11c2b2a3d241e03eeca936120 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/46ebf6b890f311df155b778864e6c9c1a3e05543 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/fc04d42fb9d7b1b57b4f04c267b8a1729bf4c9e5 |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/11ab5a3f6c90b062683be41d511967a85857b837 |     
microblazeel |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/030488fcca95b90e7c654d715c1477ed5fb811bc |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/6f2b637ff2fd32fb6ebaf01531146d426b2343be |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f80c53a5d08e264507c63e4c1a75d05924ee010c |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d300f3dd5357f15f2895662f829b7814f46df536 |     
   mipsel    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/bf60b2dfdcc393acd103d28348d8f238b4374033 |     
    arc      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/3a8f127535dd4745a031b97fb4fd9be9e108e0c2 |     
  riscv64    |        libxmlrpc-r3176         | NOK | https://autobuild.buildroot.org/results/10464159f2a9ff41ea0921a45ce12ecd0fa50ae7 |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/0308ec9b6e522a7e078f9137234b621d1a5a76b2 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/dc3c1c6e7f1b58a0fe9395946e7dbe52e339d04a | ORPH
powerpc64le  |          linux-6.16.5          | NOK | https://autobuild.buildroot.org/results/c8433528137c661e15efd99dfedfb2223b1863a6 | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/62d5932bc9196e2083b1b8590d6a6a4b390e2090 | ORPH
   s390x     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/e343b823297677c4c6b63f70f329e6b0a78f35c0 |     
 aarch64_be  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/2999c45f58f5d0f8e51dd14e0b4e06e03acd0db4 |     
  powerpc    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/ca19c436ba13069bb93c87796e82323dd597dc2f |     
 aarch64_be  |         mbedtls-3.6.4          | NOK | https://autobuild.buildroot.org/results/a6cc5dd9ede4d07a8d339e930cb11578f75e4826 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/fb7921c329a518b213d948e2a643a65bacfa1f89 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/bd928fcdb35578c855184ea40505bf3c63775a7e |     
  powerpc    |        netavark-v1.16.1        | NOK | https://autobuild.buildroot.org/results/1f3622d293a8694b3e6c3ca040d68079e42c571c | ORPH
   x86_64    |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/a4ded95b872e7cc4d1cc2006e3ed6508473fe2df | ORPH
   armeb     |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/39c906672ba603f2c17bc78cda3bd19adb4bd437 | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/7f1f54a4988c3bad748d631ce3cff2108a653464 |     
  sparc64    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/20c595c65a5604a8f7a55699c057c8c1a9a92d01 |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/f3bd74ca2b4621e35805866380d352b2f1a680b5 |     
  aarch64    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/0f6f4ee2e3b769c527cd55f3c55edb00f7db8ddc | ORPH
  mips64el   |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/7fa6a4e83ad824f3f5d1a33648e0bf991bab2abd | ORPH
  aarch64    |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/05687a03c60c7ca0cabea70c17475f94765a1994 |     
 aarch64_be  |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/292fa32e2e4538d398ec06f8b901039136fc09d3 |     
microblazeel |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/93c079713fd725389cf1bca843b4801f42c2a616 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/574c1ebd689efe080a1750954e1f435689327861 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/12852af8f549bd108b0e919bbce98036a82442eb |     
    m68k     |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/288ed3473c8ff842e432645fcd90571d01175f4a | ORPH
   x86_64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/f79be8f2ff966bb8894c20feccb1cb4c426a84e8 | ORPH
 powerpc64   |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/6ef3dae437b54d48c796212de7bafc9b05857bca | ORPH
powerpc64le  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/c350b222743f323f15408907d65500eb2fbbec91 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

am33x-cm3-11107db2f1e9e58ee... | 1 
             berkeleydb-5.3.28 | 1 
                openswan-3.0.0 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | https://autobuild.buildroot.org/results/973687857331b2b0b963b8f825f71fb74630dc44 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/ef59db4d47a0551bef45f5ed743a2a39d841383e | ORPH
   sh4aeb    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/2cbcd1502ec7e021b452d10d6e4a70dd77f5878a | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             fluent-bit-3.2.10 | 1 
                 host-gdb-15.2 | 1 
                  libbpf-1.5.0 | 1 
                 openssh-9.9p2 | 1 
                   perl-5.40.2 | 1 
                pipewire-1.2.8 | 1 
        s6-linux-utils-2.6.2.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/72f9e607794d672e2341b3b70ead5a1ec2a48446 |     
   sparc     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/5abfcf9a22f0f8f0abbd705072c6bcb4799a38f0 | ORPH
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/229096c94595f22c938b0a357e2061995a6893ac |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/65b7cfac757dacbe2a277404b19ac79aeab4c496 | ORPH
   sh4eb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/aaf0e01d04291dcaa38867b3672ee5aa90a2d6e9 |     
microblazeel |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/5b2cd3c021e6919b5fc05dbdad0e83e1e463eb8e |     
   arceb     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/e46351d7fcc836ec925f64cbb9b52c427b58f272 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              execline-2.9.6.1 | 1 
                 linux-6.14.11 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/8af641f72fb484039ba83aa12b2fde53bc961a2f |     
microblazeel |         linux-6.14.11          | NOK | https://autobuild.buildroot.org/results/d3193e5c5f8c3e8de238aa02f371172e6ab494e6 | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/47ceca00288bb233445b2575b3a3d2269690ac65 |     


Gitlab CI results for 2025-09-10
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/11284619275 |      
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/11284612551 |      
                 TestPppd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11284607185 |      
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/11284606653 |      
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/11284605584 | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/11284604496 |      
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/11284601772 |      
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/11284600884 | ORPH 
              TestGitRefs | https://gitlab.com/buildroot.org/buildroot/-/jobs/11271126415 | ORPH 
              TestGitHash | https://gitlab.com/buildroot.org/buildroot/-/jobs/11271126414 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
