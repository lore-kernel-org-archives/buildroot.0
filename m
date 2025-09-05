Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64F6CA1002
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 03:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C1F940A6A;
	Fri,  5 Sep 2025 03:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QotkKQNVz7uI; Fri,  5 Sep 2025 03:20:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFD9240A6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFD9240A6D;
	Fri,  5 Sep 2025 03:20:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA2E5B69
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 03:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC7AB60A5C
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 03:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGGH5Rpdryh8 for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 03:19:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D93D760A64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D93D760A64
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D93D760A64
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 03:19:58 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61cb4374d2fso2600421a12.2
 for <buildroot@buildroot.org>; Thu, 04 Sep 2025 20:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757042397; x=1757647197;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kdPmF4agGFcyaYEHncWFBsIfC2wkw/+jCzmCynjOtCU=;
 b=UcqNtgQ7keuPayQHWGzX+mkHC6ZqoYJO+GYhWxPaLjzxOYQH7MspkYmH+34MxlSKG0
 vnNjCh3cGsdzFbMys4dETUDk/HEqsCWVgSubj4fhg/CE8fUssclraxUi7iQBnCmlyI8U
 c0oGptPKMT6lStnUZU3svdHxYMxdrOzm3j/TCY9GwgW/QepV85zxNShRVWen7AxfiMPG
 QiqUoEudsaiRqTeN8H8wSHQpihF7UFPIWaza+xXjU1xG5yb9B0BpQQE8Xbe1zJUhghH9
 SOw63h/2c3LE2ARHX7lpxb++wHgl9jQXhHTbeUf9+OpQZNomqi/kPXukfR3qfiAM4TIV
 eRYA==
X-Gm-Message-State: AOJu0YyTKGQJyPNS8ow/Rxtiq9MkMu4W2xRQlpsos1j/9NKagVBdFEwG
 +K53YJS7JtvoW6FmKhrfjVwhIXVNYG6rQcRrbBaMt0tIi7B2gH7t3EuHjtJfug==
X-Gm-Gg: ASbGncuV/9YR+I8TtW0Z1D4Ku8LoA4Tmrydsa/722bn0w0XLluKws0/aqxmy9Hehzad
 XO2rq/5Jxv4p5w/ZBWRlP3KT+zx6XiQew8D6te2e8zZfbyTyCLGToW4/XO7wxQkoyaMmnl4HTBt
 WDAXD5YjNem5oC04ADp21LpA1o9YyGuESX9VzT04/sx2Imjzv8w+pzWidBcKdYuzN4BnX8iYkeR
 WbOzw1JnZctMSmwXUQFJ/EwStQqHfNc1i9hUFB4v0p21m4Gi71khkYFaGFJghrIb2OxgRnA8BG3
 8wpcV+sjo2l1HkO8N3nCGRWv2I6qKk1EV5P5YAPQA0Mnlu536jPYYd+WOjgaJrch3zEX4Fj++xV
 OZT0g2PoTlPnf8pgYvjCrgf2YdiqsxR5CDkzi3KMy
X-Google-Smtp-Source: AGHT+IE2g2lm0A1lypYJR8hhrpWgf9hpip9lMle1Id5h7Qnm7MtrHkaRdXzmb+CQ+SSRs6YHc/ml7g==
X-Received: by 2002:a05:6402:5108:b0:61c:fb8e:ab61 with SMTP id
 4fb4d7f45d1cf-61d26eb420emr19864912a12.28.1757042396458; 
 Thu, 04 Sep 2025 20:19:56 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61ea07e9564sm11010266a12.28.2025.09.04.20.19.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 20:19:56 -0700 (PDT)
Message-ID: <68ba56dc.050a0220.3eeda.f6ea@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 05 Sep 2025 03:19:56 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757042397; x=1757647197; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kdPmF4agGFcyaYEHncWFBsIfC2wkw/+jCzmCynjOtCU=;
 b=SvovwigSTCu01mhrcHiujBioIoDNHobuAb+ugo1X2uRko5TAD/t4mIuc/iEXbup9gB
 xhkTQidfcLpYTZG7m6qJbUhy0Urj0oPh5ZX7NqJl1RIOvHHjSj9hhDbNfrAJSxZ+0Kjm
 i4VT90+F58A8ziSFQvWlovBAeNd56oVI/TxUM6O2yamlqdGINDuYCCes8Zihjl4o3ieM
 sj1ZDMa+dyxqcPPCLUGUIR25+pZlnn2EJIXSDW6ZBQA0Z5yplJrH4H+n4KOLgzHIN3xw
 EBMhT5k4Z1QFquO0WOXSx5gGAMarNDf2Arreq+g2YFck77NJdUv/MfBvDJYY7mLBKLCz
 FO/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SvovwigS
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-04
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

Autobuild statistics for 2025-09-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  9  |  0  | 11  |
  2025.05.x  |  2  |  4  |  0  |  6  |
    master   | 38  | 95  |  2  | 135 |
     next    |  1  |  9  |  0  | 10  |

Classification of failures by reason for master
-----------------------------------------------

                 host-gdb-14.2 | 5 
              libselinux-3.8.1 | 4 
                  mbpfan-2.4.0 | 4 
                    sslh-2.0.1 | 4 
          aardvark-dns-v1.16.0 | 3 
                  cairo-1.18.4 | 3 
                   cvs-1.12.13 | 3 
  gobject-introspection-1.84.0 | 3 
              host-guile-3.0.9 | 3 
libdbi-drivers-0bfae6c43134... | 3 
             libgphoto2-2.5.27 | 3 
                    sdl-1.2.15 | 3 
                       unknown | 3 
                 host-gdb-15.2 | 2 
                libshout-2.4.6 | 2 
                 linux-headers | 2 
procrank_linux-21c30ab4514a... | 2 
             alsa-utils-1.2.14 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
amazon-ecr-credential-helpe... | 1 
                 apache-2.4.65 | 1 
                apr-util-1.6.3 | 1 
             batman-adv-2024.4 | 1 
               bctoolbox-4.4.8 | 1 
             berkeleydb-5.3.28 | 1 
                    brltty-6.6 | 1 
                 c-icap-0.5.10 | 1 
          chocolate-doom-3.0.1 | 1 
             dahdi-linux-3.3.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
             drbd-utils-9.21.4 | 1 
               ebtables-2.0.11 | 1 
             erofs-utils-1.8.5 | 1 
                    fcft-3.1.8 | 1 
                     fd-10.2.0 | 1 
              fluent-bit-4.0.3 | 1 
    host-mender-artifact-4.1.0 | 1 
              host-swipl-9.2.8 | 1 
                  iozone-3.506 | 1 
   libcdio-paranoia-10.2+2.0.1 | 1 
                 libgee-0.20.6 | 1 
                 libiconv-1.15 | 1 
              libmhash-0.9.9.9 | 1 
              libopenssl-3.5.2 | 1 
     libphidget-2.1.9.20190409 | 1 
                libsolv-0.7.30 | 1 
                libsoup-2.74.3 | 1 
                  libsvg-0.1.4 | 1 
               libvorbis-1.3.7 | 1 
                lmbench-3.0-a9 | 1 
                 logsurfer-1.8 | 1 
            micropython-1.22.2 | 1 
                     nvme-1.12 | 1 
                openntpd-6.8p1 | 1 
                openvpn-2.6.14 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.2 | 1 
             python-webpy-0.62 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
             strongswan-5.9.14 | 1 
              udpcast-20230924 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/6b0c840aa0bd20454acdc658f855331d4a6823e6 | ORPH
   s390x     |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/c2bd09bfbd254d2aa9da897cd180487280a992f2 | ORPH
   s390x     |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/c247ffe9782e2e021f4ff7c2bfb0f2e8cf64a625 | ORPH
loongarch64  |       alsa-utils-1.2.14        | NOK | https://autobuild.buildroot.org/results/e3bb1216813ce8373cda22351586684abf74e309 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | https://autobuild.buildroot.org/results/34a28cd4e95f6c49b6fbd97523e15bb8184d74fb | ORPH
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/32df8fe0993a14e54e4f5f05670c6edb865b6c3f | ORPH
loongarch64  |         apache-2.4.65          | NOK | https://autobuild.buildroot.org/results/c8a29ebcc3cca1acf6e222ecf186944310ea549f |     
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/fc968c7d3e94e025e1762b32e25b2cf18b6dadfd |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/367f9ba2b8c828a065bfbb561a64970a74cdcb6d |     
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/98133670a958751b99bf87d7273eae9a0dfb7f3f | ORPH
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/6a62314a0b998f47a6f719f6c1ce4dbb8e0e1246 | ORPH
   sparc     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/aa7fee1368db6be30e82f6ff71c658d49f9fe079 |     
   mips64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/c8d8708c36e0c0ddac3e3968fe929a1edf2a84cf | ORPH
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/4cec8a932dc94a07eecb6b69da5707d074b1f54f |     
   x86_64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/4926e6059fabb6eee2af0132046475a6243a91d5 |     
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/fa04eea9a0ec45479315df9e0ddbd8be5307c0cd |     
 microblaze  |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/7dd430520e3c5591dc41ea141a5536749614840b |     
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/679cf028b406370a7ea742a6f7971ada7e6942c6 | ORPH
 microblaze  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2d18f9a70764bbbbea312b1cacb21b4456070642 | ORPH
    sh4a     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c12efc41449eaa7933f20863559f6a428a52855b | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0669c4bd206b0354184509089a69713b5f9f75ec | ORPH
    i686     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/e90a428ed892d2386c501a3353a550d8b751cb93 | ORPH
    i686     |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/c2cc3144a292924105ce6501e475267c5014a720 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/23d3c71fec6c0b5ec9b3e62ff339a98f676893bf |     
  riscv64    |       erofs-utils-1.8.5        | NOK | https://autobuild.buildroot.org/results/319cf08071e059f48db0cb8619f201e0cb6edd44 |     
 aarch64_be  |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/161571ebb623ee430d0413e77d5547c15ca504a1 |     
  aarch64    |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/3acfe6114a00ddb6e689f467d4f47249b7d9e982 |     
   sh4eb     |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/bf9cc3df35c8908d3691aadc5b85bcfff3517e5f |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/9b51add83148377ee1c573394764eb115dc86bbd | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/586369f9ddc6449c1cfb7fd7c0cc7ec3d38778cb | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/da2347ff2eac4c5ccb9e0dda8d8c2b6e57d4b03f | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/86343de16c0571599299172dfc914c7869debe6d | ORPH
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/db774aa6a55093db6aaa9e0b24492a54b1d46be0 | ORPH
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/6c473df35869bb799fdaabdc3ecd6be125e1e4fd | ORPH
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/378da0f99a7f9b9abf7f5e8e389e5e9b1a7e6c53 | ORPH
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/fc4505500a4559274a88f616e17f752799b35f54 | ORPH
   armeb     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/2ea5d8fd4d5f29e92ca0e95843f9cd64e0a90826 | ORPH
    i686     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/21dbe3935018fec1a66d7c1b798e72578ee69288 | ORPH
  mips64el   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/a61d74031f535569d84a53cf675603815cf1d911 |     
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/b4327e3ea046c428214a684140b8a3c822f7f663 |     
  powerpc    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/f07018a5c9870b7f94630acbd303634d02ee12f0 |     
   s390x     |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/a9e29c1d63130cf25b81249070a2a326b038c36b |     
    m68k     |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/98dcf5cc828b1a6893ea39f17145bf3eafde4ff9 |     
    arc      |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/924e7a4654e1cb7359f654732dc367788bebac2d |     
    arm      |  libcdio-paranoia-10.2+2.0.1   | NOK | https://autobuild.buildroot.org/results/b2a356202083de0d7adfab47e3ddcb4e4369cadf |     
   sh4aeb    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/983fa2be0433cdfb22a561fd62e32498475ef244 |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/1a4c8e145d506d4bfd6fdb0e23727d8f207a451d |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/69f8911eed7b45080ad95dd206e9053940ea860e |     
   x86_64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/8e14b830b388095366d24482913d757db9c3d4dd |     
    arc      |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/4c405378d4e212352d02ab3523e75650475dd6e2 | ORPH
microblazeel |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/9957b8bf8f5f3548e1f1b33f13813709318fcfb9 | ORPH
    mips     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/b64e961f8436d8e35f4672432648adec13f7c8ed | ORPH
    sh4      |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/9017f5c7e4c0e105aaba2f254d7262525211758d | ORPH
    i686     |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/1408fd9ab720726ebae0f7b32e2a058da3f9c439 | ORPH
    arc      |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/67b6b1507f115ac1c03d8f11dd241269fb694b57 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/4402a14fca79161ea27bc531996e76c916afd07e |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f68e065ff34e707e54545978a4864c3f7c3ad689 |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/bb84c1bede11e7f83cbc90d77a7f5e553ae4b0ac |     
    mips     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/bed000beafdda3d1f775fcc5ec128707ab2c9bb0 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f768e4af7438a8e0fafa81a58f74ca9dbd14d8b2 |     
   sparc     |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/a3634fbb7617ac6a0dd827548d8230ae685cf74a | ORPH
powerpc64le  |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/9b3e9bb5ac25f6f94b5327ffb0b3cfdaa436ff59 | ORPH
powerpc64le  |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/86ae0cf633d61595577a99489c6cddd9b5195c47 |     
loongarch64  |         libsoup-2.74.3         | NOK | https://autobuild.buildroot.org/results/97ac047e1aa3a3d805576ec314483b8d18fb6f08 |     
   sparc     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/0ee80a92cec81a6e4d3407d8271a7eb007330e20 |     
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/3c44e9a19c9979933ea6997d15fe1cdf13359e62 |     
    m68k     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/fbf522741a9d6d9e36602143754e63290e3d92fb |     
powerpc64le  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/496d22fe43cc4f49dd5f4deb58bfa38bb14b10f1 |     
   armeb     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/f37dd14d7ada103ff0da615e7234c2442ac4a917 | ORPH
    arc      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/ef04194ecee16670fa59687cadb6094bef3dc007 |     
    mips     |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/32025137c030b4d774b6e46f043d932d95e9d67e |     
   xtensa    |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/d0e42061e7990f36d502106d79dedf15ef61b773 |     
loongarch64  |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/885534b67c10fbc4543b70a2a92053c7ad33670b |     
   armeb     |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/785be6231c1edc4e5461ce083a3d65fd27fc5843 |     
loongarch64  |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/f9a8232b582a8921317494cec807d37da27471fc |     
    arc      |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/c1d2c3862546fb05d40ac561cdacc66b2a632d13 | ORPH
   arceb     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/8263197b06fc4d36fa474b1679c4a81a11df4d7b | ORPH
 aarch64_be  |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/9a3801c3ff1367868019f82ef7cd9d8d1b130954 |     
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/02a00f668af8e446d15d37ce6ce3672312dc477f | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/12ba0b71e1b351b8df5d3a7e50b32f1284492a8d |     
 microblaze  | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/289114758bb061e9ffd2e9167a8c6f8f7bf32e86 | ORPH
 microblaze  | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/086fd4bb6b70e569f2acfd4909601dbbf9d93837 | ORPH
   armeb     |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/8c21776894be3f84fc350bec9b81990b2942ec1d |     
   s390x     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/d5a0fed88776d4a5dda7bf166945a1530a18e61d | ORPH
   armeb     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/9b3eac2c20aacdc09321e47da0f4bebb3a126745 | ORPH
  aarch64    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/6aa4c05c0129fba715edbbbf82d8bee94cfd4327 | ORPH
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/167be39a23bb6009dbcb4a342adb7d10743af895 |     
 powerpc64   |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/738b895ca762a06c80ba6e280cde966fa5b2f5ee | ORPH
   arceb     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/c0d6c38a5652f9cb77b7959ecda76df45b71324b | ORPH
   mipsel    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/86c3ba5e8b2e50a1ac898894220b930adebf8318 | ORPH
  aarch64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/0cbbb75c4aab19b9d5f42695359ac6fe97e5989b | ORPH
   sparc     |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/5b4b2fed6d82931bd75259efaf6beb89f7b69b54 |     
 aarch64_be  |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/37b3e3993d74341d0b4076ddf48342f8b228627e | ORPH
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/d3e50142806350eb16200ea8cc094c58a5621574 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/2b7a9cc04f32044566f3e26f7c20f56e9b6427d4 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/faaecc1d8184ae85c6e83673bf5cabf8c6065661 |     
microblazeel |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/a914d9b30c2540f59a02c014ed1204fba5ebe647 |     


Classification of failures by reason for next
---------------------------------------------

                   avrdude-8.0 | 1 
             dahdi-linux-3.3.0 | 1 
  ffmpeg-n6.1.2-27-ge16ff06adb | 1 
                 libbson-1.9.5 | 1 
libdbi-drivers-0bfae6c43134... | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                 libmbus-0.8.0 | 1 
                libsepol-3.8.1 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/1ccab5ab3990ec58e15eaa5f6ae3599cc820f224 |     
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a58af1d83dadb3c5fb0b44c1027e012cb4cac3d1 | ORPH
 aarch64_be  |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/c82f2e274456386e3d86cfdd8f97b756a1a38187 |     
   mips64    |         libbson-1.9.5          | NOK | https://autobuild.buildroot.org/results/9a9ea67e2221f8f44469fef5ed84e15fc7152d7c |     
   xtensa    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/1b1a8ef65e71b5748bfc411679bae8c91f81b88f |     
   mipsel    | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/9f19d61b660c94d4016e6ea1667b0720e70e5778 |     
    m68k     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/49d7f951704bc8b4c91900f252f597c4b3792424 | ORPH
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/2891fc84337ae12c2288d19812028749ce7059a4 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/829cc6d666bbc9c99ffe94819041bbdfb85841f9 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           at-spi2-core-2.50.0 | 1 
                    brltty-6.6 | 1 
        edk2-edk2-stable202411 | 1 
                     fd-10.2.0 | 1 
  gobject-introspection-1.82.0 | 1 
                libdrm-2.4.124 | 1 
              luabitop-1.0.2-1 | 1 
                    php-8.3.24 | 1 
                pipewire-1.2.8 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/32d9d897035dc920e1b1925e096ca06345a5f29e |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/e6c245c9ed0385cb9aa3dbf4aed65fb087ca0142 |     
   x86_64    |     edk2-edk2-stable202411     | NOK | https://autobuild.buildroot.org/results/b270964474d5b8b1fe392a19d22209423d6c261f |     
   x86_64    |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/85bc673c28df213c16fcdd5e48c6d1eded130484 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/9bb44b6aa9fa41c9e61f3658100856f8f01e9646 | ORPH
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/01af26ba498a97d35e7e532fbd4cda602a4d4132 |     
  powerpc    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/a70b287ae695811e24a32957cf4ec6adb46ee08c |     
   sh4eb     |           php-8.3.24           | NOK | https://autobuild.buildroot.org/results/57f405e489994f3c2a72abaf2ccfbe5ae0f458cc |     
   arceb     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/41c7d0e6cf9da21c7e2f00027674bb1098196670 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               graphene-1.10.8 | 1 
              host-rust-1.86.0 | 1 
                libsepol-3.8.1 | 1 
                   perl-5.40.2 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/002b7635e2c4aa8d1015648e661723289d4632d1 |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/29f92204d3c0fb0c04965eeb4749a41b18c9f803 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/0920aa3f342a4d96e2715ae382d959891128df4f |     
powerpc64le  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/7f79168938acbd33212d6fb5c1c7439a9fad4179 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
