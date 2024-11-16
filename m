Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68276D68BE3
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 04:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 880196059C;
	Sat, 16 Nov 2024 04:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhp6sXxK5G4b; Sat, 16 Nov 2024 04:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08A33610BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08A33610BC;
	Sat, 16 Nov 2024 04:18:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 50A7E231C
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 04:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EA4F61101
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 04:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nEZjRXauQwCt for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 04:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B8CA6059C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B8CA6059C
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B8CA6059C
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 04:18:21 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa1f73966a5so59998666b.2
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 20:18:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731730699; x=1732335499;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yv2xoS0ZAYzuRzp6apyWV7fcTdkc7yciCdxq/yJj9DY=;
 b=KVWaUet/DBlNO9L+ynXKbmY2X12IKUiisclvnbnBXlZqBMOH8RpqUQttANczNoZ2h/
 Nto4IWU6dN9QWt0eAN5/dK8ZSatf2LdehALxMrTTUIi6sEdNcah9dfwVlnS22/xBf+r8
 vuWe9Od6IO6oiM1xD6nr4zvU6VO5boYMOMefp2fPSOKONtIB7XWukcIr7n/eSVSKlnpl
 dCVkPGCphDzBRJ24ksb9i7VlHRgYflecpzw5vSJPjPpsic/hvHHxbGu1Wfeinysp9bNJ
 VuSoDlYp9IJn4v4xmwb7GNtPOPR2BO/vyZl2hOkTCv70c2LDxsQzAjvEk8oYQVKPTjMA
 G6ZQ==
X-Gm-Message-State: AOJu0YzMaDtYVmMd+TPB8gXc9aS+x2rVU8t69Wmfm1pXaUubrJSQBTRr
 aAl56cMJP+RTTT5NZBK3B9P/WAwRkwp68/SOpWWTskBJkSmWbA+mj/h/1A==
X-Google-Smtp-Source: AGHT+IGvn+mevDg9gHGLTziNRMtKyLjFio9McJu0F4FCnvkaybvHQ7mSY0+U/5W/RvBMXFpDcNmjaA==
X-Received: by 2002:a17:907:7b86:b0:a99:d6cf:a1df with SMTP id
 a640c23a62f3a-aa483525e0bmr389984666b.46.1731730698957; 
 Fri, 15 Nov 2024 20:18:18 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79b8a4d4sm2162202a12.4.2024.11.15.20.18.18
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 20:18:18 -0800 (PST)
Message-ID: <67381d0a.500a0220.1b8de2.88e3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 16 Nov 2024 04:18:18 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731730699; x=1732335499; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=yv2xoS0ZAYzuRzp6apyWV7fcTdkc7yciCdxq/yJj9DY=;
 b=byGokDpuQWn65/yJdjzarZFUsTDcvVBYfzoW5LGdH25dIbq/ZSY/Yzh2bku0Mm9xOi
 +igiOiffw3Xr5CdpazpwqOnW4AxuSEi4xc6H14p2jP6TVG56wmAQ39SkBIefWj7mHk3i
 AvNMvfw9V66roDDPbOgeySjeS3nmZlcKyuIu6WhalAP+dTpB1wFPKUXrI9QB9q7hxRqG
 GyXLy/D7B4/4g7hV+GFiy34D/KFbfcj2mhmNM0R6SfQzBw4jqAp4tfIwfIe4ywk5Ul2v
 aay6p1yjRf0L9naKnDnOgtVxmAT4tY5DroDEMcKYhEVqyEn/2G4tgxZg0yRrGOhbV8Uw
 s3dg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=byGokDpu
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-15
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

Autobuild statistics for 2024-11-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  3  |  0  |  4  |
  2024.08.x  |  2  |  4  |  0  |  6  |
    master   |  8  | 67  |  1  | 76  |
     next    |  1  |  2  |  0  |  3  |

Classification of failures by reason for master
-----------------------------------------------

             dahdi-linux-3.3.0 | 5 
 ibm-sw-tpm2-rev183-2024-03-27 | 5 
                lmbench-3.0-a9 | 4 
     linux-5.10.162-cip24-rt10 | 3 
android-tools-4.2.2+git2013... | 2 
                 c-ares-1.34.2 | 2 
  gobject-introspection-1.76.1 | 2 
                latencytop-0.5 | 2 
                  libnss-3.106 | 2 
                  linux-6.11.7 | 2 
               linux-pam-1.6.1 | 2 
          obsidian-cursors-1.0 | 2 
               procps-ng-4.0.4 | 2 
             util-linux-2.40.2 | 2 
                    azmq-1.0.3 | 1 
                    bat-0.24.0 | 1 
             batman-adv-2024.2 | 1 
             berkeleydb-5.3.28 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.15.1 | 1 
                  boost-1.83.0 | 1 
                cryptopp-8.9.0 | 1 
                  curlpp-0.8.1 | 1 
                    fcft-3.1.8 | 1 
                  giblib-1.2.4 | 1 
         gobject-introspection | 1 
             gstreamer1-1.22.9 | 1 
            host-binutils-2.42 | 1 
host-binutils-bare-metal-2.... | 1 
           host-doxygen-1.8.18 | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-python-greenlet-3.1.1 | 1 
               libcap-ng-0.8.5 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
           libzenoh-pico-1.0.2 | 1 
                   linux-tools | 1 
               mariadb-10.11.6 | 1 
                   mimic-1.1.0 | 1 
                    mpir-3.0.0 | 1 
            nodejs-src-22.11.0 | 1 
                   pcre2-10.43 | 1 
                   perl-5.40.0 | 1 
               pulseaudio-17.0 | 1 
      python-autocommand-2.2.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/a05524d70fbf47fa4514ef23f6edbbaaa35b7a3f |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/57396d9176281c9ad1a7346dd128a725227fe357 |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/62f2e6fa28218a1b94d608df7dfcf4a98cfb33ff |     
   s390x     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/b5290c65598c3a8ec1f446f4d4b79fc3778edd59 |     
   mips64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/87ec04f0e628932708a2314539421640e98b448e |     
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/fd80e0d4797c12b3f89b5e03c670f6dd811b409e | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/1c5f3374691648c0ca0bda881a16f04b7452856b |     
  mips64el   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/9aec0cf4844bed4f32216d1738332ed6f658aaee |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/55f931d864e5816936f61d1b7e0d1f5e19503712 |     
 microblaze  |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/687ef58130d3d7b650be03b7cd113a68bd0aea06 | ORPH
 microblaze  |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/6f0f54c37ae2a7577658cd38d276fee446e642b0 | ORPH
   nios2     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/e825ff081d3b133a4ed2c7a1fb286942de37765c |     
   s390x     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/e3aa996c8dadfd5ac1745488d0eb5bb1b4147970 |     
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1a22cedeca7093f156c0effa31df6d8250516ebd |     
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e3726344830ef3abf6d6fbaa869b25f8881a6fb4 |     
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/007fcdea722f268876949238a099500b30a0180d |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e7db31d9dbb939f952109be465a16db30e6f7cfe |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/913abd360b9e87cbde3281c978bf72e3eb324786 |     
    mips     |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/5216342998dae53ed1d24c351b14dc9dbb7ba5e4 |     
   mipsel    |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/3525a735ef991873b76228404dada8c5b8fffbd1 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/90e1cbb64f0d8e1c9db5d730aec5ecc0ad9ae1b8 |     
  aarch64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/04b1629385003f80f9204441325b5ec8bd984dcd | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/5151c5bc222bf12eeee1ec17b502865342a88fa2 | ORPH
    sh4      |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/c1c2dd4bd93626778d74259484c66340431cc58c | ORPH
  sparc64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/dec63333bc38b8e1aca9c337afbd3f76be7798fb |     
    mips     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/3e9bdab1f04173e954563e1b47fe100cc585ac1a |     
    arm      |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/75d256bf542725b65552db63c4666bfcff5e5100 | ORPH
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/4578019c5c85e0c336eabbce98d5f85dafe0c560 | ORPH
   nios2     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/a096aa29950920e5ef8b118502c2b568c6cedfdd |     
   x86_64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/0cfd719f6a2d241b13b1c63bf3f972e96fef6568 |     
  mips64el   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/e489af407e020106355b21f06ca4f0154e3c667b |     
microblazeel | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/2c0b7c445271b99699d7c3906fda7659cca6ec91 |     
   nios2     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/7a48e03c935fb6d40d02cdefbd24a01b3c7eac8e |     
  sparc64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/a9ad9de8dbd9869bf9f75b7b011edd8613a8698c |     
   nios2     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/fbef5ec0a23c022010eaa1fa1953e2e2905adfba | ORPH
  mips64el   |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/48e53163b4506a6993b4452d51da3eccece862a3 | ORPH
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/40c5960174ee91002abbbe45d433ce60ec19cb8a |     
   s390x     |          libnss-3.106          | NOK | https://autobuild.buildroot.org/results/8dd142f7d06aa3464dd0ecb35ff0899f74a723fc |     
powerpc64le  |          libnss-3.106          | NOK | https://autobuild.buildroot.org/results/050b361ced4fd842ab7075087cb2bd1561c89b71 |     
 aarch64_be  |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/80517f5f3c9b609a64e24ec2585de2b9f0b8e42f |     
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/2813c695968d8a6af015557f989648205ec6604e |     
   armeb     |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/10b3695c3c9b733622eb379e464f2756a4a71f49 |     
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/9fd802af39687ec39eb4761eb14db94e5fc345ae | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0deb9a67762dcdd536cf0265c4de127b56414e09 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/250e1ea2387427785773f5567d54194b35211eb3 | ORPH
  powerpc    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/c6bb0f1e079ab5141b94a7c6b28fc3d0e5125c52 | ORPH
  mips64el   |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/0a770a52c39f3eedf0e948a51dc0a1c34c183325 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/15d3556fa6002e55dadebe92e1e650f62970b0b6 | ORPH
   x86_64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/e2bc4155af5d58e57ec927990d316e6cd9bdedcc | ORPH
   armeb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/235ea30e256ce3975598637a339b78db93f76108 | ORPH
   sparc     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/c13412c5be002432e11dfe3cef2bdf0503f2c764 | ORPH
    mips     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/ad019d721fdb7c56207b87b43755406872d33367 | ORPH
  sparc64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/687d3c9e5a58edd6c2f0021ee8a897f48ac28b32 | ORPH
   s390x     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/4c1fe8a5682ed8fb79e1c7d466761334ee260582 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/6bad65124beef61e3ad9e30dae7f926628c48046 | ORPH
   nios2     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/f896585862ce86f6c3b12e9546339d1b4cf2d8f3 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9d05d7e8d274cc1a5c1ccb38a9e0c8b551cc0e7c |     
  aarch64    |       nodejs-src-22.11.0       | NOK | https://autobuild.buildroot.org/results/1b7c113d7cf60b3f9e0cf3b1fddf1edc133bfbeb |     
   xtensa    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/785dc656bb92b249f102722004385a12deb2fe01 | ORPH
 microblaze  |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/b66526331622e4247960baad5ddb0f827ea52d2b | ORPH
    mips     |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/ce09cc03caedfee85123932c2dcce2ea29095dd4 | ORPH
microblazeel |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/d9e24ccce10dbc9314ca79e41b61c697ba81a027 |     
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/2a225e72e7cdef783c3a707cce93559a80e3457d | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9e05c6004a01eee8b150d4b1d61e0054bc4ae708 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a5be060c4879d1775796b4e158b9694cb4b1f475 | ORPH
   sparc     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/8ef7f0301242ff2d0da3d902ed723f5f905c3850 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/98783974d52a40c445a8b69d1a54b33321b9c26f | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b65444be51d480d81e97980aea4d09dd377325ee | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
                   foot-1.16.2 | 1 
host-prelink-cross-a853a5d7... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/5a02194d54087806e01ffdd01d340dcfbf745198 |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/70abd9db301d4937213c96355caec6f0aa0ab081 |     
    i686     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/52b88c1f80b5b2ab3b06e0f2bdbf3e48bdcd1355 | ORPH


Classification of failures by reason for 2024.08.x
--------------------------------------------------

              dropbear-2024.85 | 1 
                liboauth-1.0.3 | 1 
                   lsuio-0.2.0 | 1 
                   rauc-1.11.3 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        dropbear-2024.85        | NOK | https://autobuild.buildroot.org/results/e6fc6af595a964a3b4c5635a4510123238ba1615 |     
powerpc64le  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/d1ed5516622ba3736f71ec0f6ef2e2a1d4cd0775 | ORPH
  powerpc    |          lsuio-0.2.0           | NOK | https://autobuild.buildroot.org/results/4b50758d88d8c21076b9d8040037a6ecdfe44674 | ORPH
  sparc64    |          rauc-1.11.3           | NOK | https://autobuild.buildroot.org/results/8a275de6ef55ac0f69df104c0f1c67c6ecdc7540 |     


Classification of failures by reason for next
---------------------------------------------

  gobject-introspection-1.76.1 | 1 
 ibm-sw-tpm2-rev183-2024-03-27 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/2da9947661c0a09710b39d41130c9a579edb4192 | ORPH
  mips64el   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/b2de46eee12cd20261f9f94fd3a2fb06341157cb |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
