Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3192C8303F
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 03:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BB5E42866;
	Tue, 26 Aug 2025 03:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8qxBEYVmtEc; Tue, 26 Aug 2025 03:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCB2C41C5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCB2C41C5F;
	Tue, 26 Aug 2025 03:22:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28BBC114
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 03:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B0D16F6FD
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 03:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VeI8KOG0PTcK for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 03:22:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5BA636F6FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BA636F6FB
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BA636F6FB
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 03:22:35 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so809421466b.2
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 20:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756178553; x=1756783353;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gOPbjEZx4dT5ljKmlstzC3D3Y5dOSaRH0pkHWLRcu6w=;
 b=U+LVUAeS9QY3GL94wnwG80SgdHn584jYWyduwgkQJs7SUsHBzdYGI0oHoGWJ1kbauy
 g9lPg3lnb2KsFRUkVeYWxl68gQ1hiR7ssTnblbeMOEMMaZOoL0OyJDO3wcUQN1YOWrFi
 u3VmtMa//9fiTPqNsjMAKjo4u1ZdmNDWYPSzyzs2tEP5RL6Zo3YnyhZklHd6x4VCj7Zs
 1puaqahJZZu0r5zihhMLdE1jW38Wi/nHtwKByg0w68r1aiSZkYfYWRIGJXjpjdDXROEh
 m0KSLDhXe3Galp35dVWdLYu30YcsgDM9Nb9y8p6/OhS6Bbwdo0iKs6G3F6ytQF4F/1Bc
 6n0g==
X-Gm-Message-State: AOJu0YwvZ41kAhH5PxYQlO2ZoD6z0nXybUBOinZTgiuPQeTryZ4XpPE+
 aV44aHSj/g3sJ9HDGf3WMCt7a/mjUeW0z5RZVevoOgoRphkj43Wk4vGVlsh6Bg==
X-Gm-Gg: ASbGnct1VECErefer8vj/LkplPRkUFFgnbbPg/G2ym5llFRgy5q7efpZF2IYua+XFxY
 yu6vPb96jwOklvGHXLQwfAu/q6NGIYrLxrx2xuf380xfoOIoFRYOAEdfh/TKkhHCorARoDqksGg
 lCerH1udCnE8SeyVapJdgY1UdztJvAog9877Qbo5bRPLA+NQCQQ6uMJOn85RG5EpVZj+DNoy1q+
 Bg+SFpfL2xLrMQ+izwJdibAVAw/o7J1i+wp/qVxmyVvRFiPmWPG18mWBYQtbsBbX+8qvp03dNRx
 MxBAXdkrmIW/qUVEL9QjcxhYerC9+pUE8cDa+Sekf5Sj3k/Jtn8eetrSm/gHvnD/dsbW7WHd3WH
 vOcOXKZiXYHneHI9HFxI0PRoEJ26o3zdTDtOIewyu
X-Google-Smtp-Source: AGHT+IFwUpIaOn+6aF0j9HBMsKuwDrY6/LglqVw3+JBpy6uxBwA7xzilMvPHeA/6A7x6Ecywpuc+mw==
X-Received: by 2002:a17:907:6e92:b0:af9:bdfd:c5d1 with SMTP id
 a640c23a62f3a-afe28f76042mr1071688966b.8.1756178552802; 
 Mon, 25 Aug 2025 20:22:32 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe8d03f981sm221570166b.60.2025.08.25.20.22.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 20:22:32 -0700 (PDT)
Message-ID: <68ad2878.170a0220.2a7282.8d58@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 26 Aug 2025 03:22:32 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756178553; x=1756783353; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=gOPbjEZx4dT5ljKmlstzC3D3Y5dOSaRH0pkHWLRcu6w=;
 b=eQP13+i1IYGrAQNfrAS3FZsVe21ID7VHAvLbzv9p6NLN15MTWO7UJuN8Y2tAU+CB6/
 sP1y2gIi04npC3KmcbszR1mDDElzlV0ZgT8jSKMifGUuQcvoHjp/dX831c6j+TXGMBdu
 f6DAvylG/9DGC2xmRKhZYhaPmikVRZ0d3oCNOdsAg727osogncnvuqCqxJuQqMyMvSSQ
 I1lEg1oWiXyki6aS80pBISKI23MAQ5QsISZo+fB7/4wTRfuyE8LoaEwXm73CZhNKll9Q
 DAjWhtX9nOTMptlMgrnOMZGDZ4V6U4D5iJllc9WOCY4hjqIrWjx2ylWpDQugqa9S2yJ3
 ERfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eQP13+i1
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-25
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

Autobuild statistics for 2025-08-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  4  |  0  |  6  |
  2025.05.x  |  3  |  4  |  0  |  7  |
    master   | 15  | 85  |  0  | 100 |
     next    |  1  |  5  |  0  |  6  |

Classification of failures by reason for master
-----------------------------------------------

libdbi-drivers-0bfae6c43134... | 6 
                 logsurfer-1.8 | 5 
                    mpir-3.0.0 | 5 
                liboauth-1.0.3 | 4 
                       unknown | 4 
  gobject-introspection-1.84.0 | 3 
                   cvs-1.12.13 | 2 
            gdk-pixbuf-2.42.12 | 2 
                 host-gdb-15.2 | 2 
                  libsvg-0.1.4 | 2 
libsvgtiny-ea9d99fc8b231c22... | 2 
               pcsc-lite-2.1.0 | 2 
                python3-3.13.7 | 2 
                    sdl-1.2.15 | 2 
               acpica-20241212 | 1 
           at-spi2-core-2.50.0 | 1 
                   avrdude-8.0 | 1 
                    bat-0.25.0 | 1 
             berkeleydb-5.3.28 | 1 
                   botan-3.5.0 | 1 
                    brltty-6.6 | 1 
                busybox-1.37.0 | 1 
             cni-plugins-1.7.1 | 1 
             dahdi-linux-3.3.0 | 1 
                   dillo-3.0.5 | 1 
                    ficl-4.1.0 | 1 
                    gawk-5.3.1 | 1 
                    gcr-3.40.0 | 1 
                 host-gdb-14.2 | 1 
              host-rust-1.88.0 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.506 | 1 
                 lcdproc-0.5.9 | 1 
libdill-32d0e8b733416208e04... | 1 
                 libgee-0.20.6 | 1 
             libgphoto2-2.5.27 | 1 
              libopenssl-3.5.2 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libva-2.22.0 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.16.2 | 1 
                   linux-tools | 1 
                 netsnmp-5.9.4 | 1 
            netstat-nat-1.4.10 | 1 
                openvpn-2.6.14 | 1 
                   perl-5.40.2 | 1 
          perl-net-ssleay-1.94 | 1 
python-remi-2022.7.27-37-g1... | 1 
                    sslh-2.0.1 | 1 
                 systemd-257.7 | 1 
                   thttpd-2.29 | 1 
           uboot-tools-2021.07 | 1 
uclibc-ng-test-132c6134d691... | 1 
             util-linux-2.41.1 | 1 
        vulkan-headers-1.4.317 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        acpica-20241212         | NOK | https://autobuild.buildroot.org/results/6333cae1cb357bbd34814832af78fa943079a4be | ORPH
loongarch64  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/da9c57756858d71eebaec741e06fa78af13219a8 |     
   s390x     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/c998303c5d1d0a8e6de215659eac31dfd72f8c72 |     
 powerpc64   |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/d92a59fc7e095d9fd562291eeae6442225df581c |     
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/ed7d636348f9f9f42442b61a7bc4dedb7e3a47e7 | ORPH
   armeb     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/d7e04501725543205a6f92757d8e24f113e2c3a4 | ORPH
  powerpc    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/ada693663fab8e9f120030f5c83fb4b2c488d657 |     
loongarch64  |         busybox-1.37.0         | NOK | https://autobuild.buildroot.org/results/27af2d13f46f25dda260de842af00cd2cae3a58b | ORPH
   s390x     |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/1609ed22e31ac26082292cebd59ba3ef1318d6e8 |     
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/894f02f9d55b49b6b88bbc88fdee80964881b66d | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/63580718aa4f455c5f7452f4cef94633a1875ed2 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b558c48a66c38c550a3ffdeec7b60a3ab5377471 | ORPH
 aarch64_be  |          dillo-3.0.5           | NOK | https://autobuild.buildroot.org/results/9d4979d358107f61b3842c65ac76f464b80f4f1b | ORPH
  mips64el   |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/41a8dce2870b00d1d6a57930d545255ba7478f55 |     
 microblaze  |           gawk-5.3.1           | NOK | https://autobuild.buildroot.org/results/18d2674aa2b9b7f8b899e0303c1990c0d4b44b6b | ORPH
    m68k     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/1817eb25de4b223eb4190e3524a97685e0dace09 | ORPH
   sparc     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/68696ada47c507efc4c0adbe5c95af5589a6f658 | ORPH
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b297277c4cc5b763bc5188cc7c34432c67024c14 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b335e23edd4b68bf1c3deac7605139b66e77608a | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ca8168f10d6c0e783dcd5af7d39056ce0a35f334 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b6579b17f1969033d80d3be761c18cb8f0980f88 | ORPH
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/7dd49723fb8a13575257c21488da62d9c901bd6f | ORPH
loongarch64  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/4dab7e3856a66ee952b55b45336f5b2c5fe0c894 | ORPH
  riscv32    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/05031f1c406a2cd2ab042769d716989958485c92 | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/ec4c4521924ef1b4915d911c9dcb5f0ca897d3a6 |     
   sh4aeb    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/e4f6a2f98dcbc67ba05488106373c0ea47a0b2b5 |     
 aarch64_be  |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/ca51bc255ad48850d23f1a92cbd44b6cd9cd1af8 |     
  powerpc    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/0ef67743cc289b71e528a85329bfb48880e850ac | ORPH
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/7ae475ecd59fc19cd769a69f71330b978bb5a7cc |     
  aarch64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/857fa748497c6d6e68187cfd6e826cb70bdfef7d |     
   xtensa    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/35299e35f535f9915381e46ca69dea0b84587d8b |     
powerpc64le  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/fbbf513b2641045acb574eb520bc9f3cec77afd8 |     
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/ef13531ba65ebb8127c3804b6ecc8e84d3fdbb6f |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/dd538b2cd617b174c6e3cc3cd32623ee228b8d20 |     
 aarch64_be  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/f9a254c70687c97913686fedd0d50c7ac30bce1b |     
    arm      |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/0a288ad3307ff23bac5523c1ce9d2e96e0772242 |     
    or1k     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/acceb3047ea477d855541d8df6f944781d0c89de | ORPH
 microblaze  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/9872fd326d90657826ccceb833753f8b7cdbae7b | ORPH
 aarch64_be  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/addd6ef02b966411b7cdee1a2100a8ea95b14119 | ORPH
   x86_64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/3b158596cf849f2a7f79c59460b616b7ad0728bb | ORPH
    m68k     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/34617b2bbd0522342dc05baa2136e564982fae14 | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/cdd7be20e8c070c587dc85600859854e9340dcbd | ORPH
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a61e248150eb68c92bbe5bd6a3072fe247820fe4 |     
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/91a302840b2a43f0434af3e425e8bea5bc11f498 |     
   sh4eb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/52d64897e706c54f98203fb48b50f6ab32e49a67 |     
    i686     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/025c3035a23b773d1a11d7b8279bec5874e7dd21 | ORPH
 aarch64_be  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/e8c895811ab46a916e59e97c002caafc1e01db7b | ORPH
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/b97438e5387c494f344686112f3bfd4b07f4780e |     
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/afd7b7ed5c1a45245eba1ce90ce209cd30346a0f | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5fd5d7c2d85e0180c4d61b6caaa1a1bae2895769 | ORPH
loongarch64  |          linux-6.16.2          | NOK | https://autobuild.buildroot.org/results/883ff789192a7be212bd6ba9c5cf841d9262910b | ORPH
   xtensa    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/364ac7da07b62301f08e49279733336b0cdfd795 | ORPH
    sh4      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/de790f3796d4dc653d25ce4e44fd65de6c125a51 |     
    arc      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/fef8ee831088a90811a50e1562b619343530a33f |     
    mips     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/2d1d0ea407d45324db7920401a0eaa456339b55f |     
    arm      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/1d2f7f316277ee5f8989a666da5500711b3a0e4e |     
    arm      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/824601f9d5e13b0c0e2ef0e0904716ac9292a3f7 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/4b2ed1eb30dcd6d4d3c4aef494ab46378a2c8b34 |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/89134983c269d39a338213857ebd874d8c545e23 |     
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1c66566cd4d3c503f71d23f3a386ca97e72a5b9c |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/4cd5522feefcbb4384fbcee5932bab1c92050746 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/3b2152c33bb3a833d371dbb65f204ae18244e82b |     
microblazeel |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/a0c67bea644f3ae299589c5046ef7669d844dd2e | ORPH
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/5dd8dd14b6ffe8646ed6172aceb5a9cfe1adb72c | ORPH
    arm      |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/e46dc663e060b67794c2bde69543fc55d85391d1 |     
   arceb     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/f97d50e7a51f993bb6efe9857f500bd3f4e46da9 | ORPH
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/7ba7fd63f77a7a7e0e570f023f1371a3d760d6a5 | ORPH
    i686     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/acba03c3aa2f5e6a570795275a65eb6ff1548ce6 |     
   armeb     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/597c23b82c21f65a7e699bbc59e7369003496fe5 |     
   s390x     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/c72d037ce85bbbde5ffb789c2da3a7d62eb5cd21 |     
   sh4aeb    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/a2546541d570b5e2a9dd0f6ac9f4787c10d7c1c4 |     
   sh4aeb    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/524e51d85c6699fdf03a829b40e8375f0fac2384 |     
   mips64    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/c20b4177357017eafbf542acd02d3a48cf7d43ee | ORPH
   mips64    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/d15efc46d7c450f82914f935ad730a1763db8955 | ORPH
   xtensa    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/5ffce02a0dd10dc64cbe8b85b0e2209763249d53 | ORPH
    m68k     |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/99d235cab0400aef4ebe8f2301dbf4ffda2c575a |     
   x86_64    |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/12b986aedaa1bbb07e6dc68bcfa90746026ad69b | ORPH
  powerpc    |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/018bfb4c9f5b9bf2427ebbd67592797d6338e91c | ORPH
    m68k     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/2d38d34e7054e4d4dc60aaeb58dc2090b1ee186e |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/8a93ba5c6c21a4d63ee0b1344a93023edd65dc48 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/44cd267b675ae287df344b03442f114f16f0b3f5 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/62ea5ca152d4866da1224284f113134cf06797b6 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/38cd270c7712080893dd2d750ad524590c4adf81 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/fb05842920da51ca700cea9b161011c2951bb170 | ORPH
   arceb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/eef387f13ec3fc879385c2d59e9921f682055e68 | ORPH


Classification of failures by reason for next
---------------------------------------------

                 apitrace-10.0 | 1 
libdbi-drivers-0bfae6c43134... | 1 
            netstat-nat-1.4.10 | 1 
                   perl-5.40.2 | 1 
                setserial-2.17 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/29b38a6dbc66a35396f9a37161031a18ace144b6 |     
   sparc     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/61d7fbb3800c3d1609f512d00d03a3988386c980 |     
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/2aeba39f368576ef3b464ca571e7b70d553cda1b | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/03e40855f342648ef2b11d39554a7ef8cdf774cf |     
  mips64el   |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/ee1ca2a4425e697f2af35658b4327a375bac3230 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   dillo-3.0.5 | 1 
  gobject-introspection-1.82.0 | 1 
                  iozone-3.506 | 1 
            python-yarl-1.18.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          dillo-3.0.5           | NOK | https://autobuild.buildroot.org/results/8b40ce1c620666c258927f694efd387b5669c232 | ORPH
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/d9e68fa802defd3ddbd646373e164335a3da6187 | ORPH
    or1k     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/7167f9d8a665124981cabad9e8512b2ad6201eca |     
microblazeel |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/95cfb07e2ebcade8c82e7caf7a8f4ea1431c77be |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

 host-softether-4.30-9700-beta | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                libsepol-3.8.1 | 1 
             python-webpy-0.62 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/84d36cba2ccb167d4032419b283f0c2650086c1c | ORPH
   armeb     | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/eaafc784382e0fe0593fe8be1423bedce93d903f |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/caa872c5b34500871a82df17a674f1646d05af23 |     
 microblaze  |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/f6cb42ae7e82c6f9f606134dc643819369957d11 |     


Gitlab CI results for 2025-08-25
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                  TestZip | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035547 |      
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035546 |      
                 TestZbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035540 |      
                 TestWget | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035527 |      
               TestThttpd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035515 |      
                TestSWIPL | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035510 |      
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035454 |      
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035373 | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035339 |      
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035321 | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035304 | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035300 |      
          TestMicroPython | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035269 |      
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035258 |      
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035249 | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035221 |      
              TestLibCurl | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035172 |      
               TestIozone | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035157 |      
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035138 | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035134 | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035133 | ORPH 
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035123 | ORPH 
    TestFirewalldSysVInit | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035122 | ORPH 
              TestGitRefs | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120034983 | ORPH 
              TestGitHash | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120034981 | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120034950 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
