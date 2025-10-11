Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B7DCCD184
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 03:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67054608CE;
	Sat, 11 Oct 2025 03:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DypUeAeB4K4q; Sat, 11 Oct 2025 03:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCE01608C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCE01608C3;
	Sat, 11 Oct 2025 03:19:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DA5723D
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 03:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A8DD81772
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 03:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eC-x6_Ciw-e for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 03:19:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F00358176A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F00358176A
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F00358176A
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 03:19:42 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e34052bb7so31081825e9.2
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 20:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760152781; x=1760757581;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PfgEEayDRmzBNCY7W8W9x+yw4h4aj7Fehr417pD/rDU=;
 b=rb98XpZe9lg2ixla8gxUeXNr9REecyrAkdOpJaK/iJH6sRrZS3/QgVTPO0DXsu4OtX
 3XhsDcdYi8N3zXWfqf1iAQyvMzghyLuzoNAYHzDEfTc8zWPnSCwgAj4zOVQbnlJba4eg
 S0/SteEPfGfOIj+X1kNG4JHIHWgdHXwj1gjqpTPyAj7vLSBGwB8/GNnHRaoDM7XJ7g3T
 ivcssTu/IeHg8I1FO0mAFbXluygTcvdKdkW10cINLqcr/6IHI+zcBazkZaZeGYHeCtxL
 lbvE4rGBlsFpC+KednKz8RVhb/jUifFDfh8slem8T2ZlT7M88S+xKsScKojTlhTG8ER6
 s5ug==
X-Gm-Message-State: AOJu0YyETTCnlYzNdUY7bZg2ZXL6DtHyVgjlVOK8OBsw+1WvkPcFrRbx
 3ChdjgiIVuKuvu0a/2pCfohroKPLKaL3e2daxWg9a0/61w66vU3L2rLhUbQbwg==
X-Gm-Gg: ASbGncvbVzjnik6/lWf4YcYMdq05fHIqo2B4+MIwtg3y8MX3dJARhLnx75JJkIoUbZT
 B5twP1TONOtj1Gv3lWw93SdlFvDgDYrmOyiWOpPSmrspPbbf8bjsVQG69tfT/HsuCU0ZTsf11Rl
 dmwK5QYuJpYH6iEUKnZs+15pXdTJkcCGmvSkcpvS5CVQ94NzwcEgOlDsm4571wuu0AYeFgiwdMc
 7WHJJHhCStvLDmLY8gwiBL8qRMvM6mrOQg/ZoHoD4B6Y6awGqQQG+MjEWrkJqh3c03wWXLxHmdS
 BDSRdSj+znHZZs44pxQaVQQciofC7pDbe1FWSU1xoSiJ6M7o3hOlxe/cE/2wr0MP2fNE8ROzJj6
 2Geevqokb3m/a+Xz4NCHxDZVdsDRcxMcXJNnIxzegyCED6eakQJdZU/x2vQI=
X-Google-Smtp-Source: AGHT+IH9ss552XI3e33SrdzuZS2MJrCudWHWvz4fuBMz7oB98vKXWV7HSjzgJ1BWaPM5d/sFWyLDQQ==
X-Received: by 2002:a05:600c:1c23:b0:45b:6b57:5308 with SMTP id
 5b1f17b1804b1-46fa9a892a0mr93875665e9.7.1760152780475; 
 Fri, 10 Oct 2025 20:19:40 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb49c3eeasm71533585e9.14.2025.10.10.20.19.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 20:19:40 -0700 (PDT)
Message-ID: <68e9cccc.050a0220.e5668.3095@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 11 Oct 2025 03:19:40 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760152781; x=1760757581; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=PfgEEayDRmzBNCY7W8W9x+yw4h4aj7Fehr417pD/rDU=;
 b=MdLZ8AEc+fB5ANqNy3DFbsVZsoQ+wAsJbyx+xTyH0rZ6JjF93i65/HLggMP2qtm/kf
 ZClfxchFTIAbegR0CNF4Qm6QgJmp6N6ve3EWRUbhrPaZMaa1P0eebcj352jxqkfI3ywp
 vMYA8nMLDqIKV0CR567tZ7m9zOv8/ebPYqyDUMCUYmQI4TSwyeyPPcvx0KgGUMQsrtDZ
 F7cG+Bhtuu+WIy5Qym+nAfEB4f7v6xCLke8kXyEGhVfNR9XL9Aq3emnPS+fASziIgRqG
 rgjLiVwLX/bp0Rrh7aUvbtt1rTV4n4AXST5m+gTjgd8wstJnEtc3b5ohVDIk82Z5k2Ap
 W0tg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MdLZ8AEc
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-10
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

Autobuild statistics for 2025-10-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  |  3  |  0  | 11  |
  2025.05.x  |  3  |  1  |  0  |  4  |
  2025.08.x  |  2  |  8  |  0  | 10  |
    master   | 46  | 86  |  2  | 134 |

Classification of failures by reason for master
-----------------------------------------------

                    sdl-1.2.15 | 4 
               bctoolbox-4.4.8 | 2 
                  cmake-3.31.8 | 2 
 ibm-sw-tpm2-rev183-2024-03-27 | 2 
libdbi-drivers-0bfae6c43134... | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
                 libgee-0.20.6 | 2 
     libphidget-2.1.9.20190409 | 2 
                  libsepol-3.9 | 2 
                  linux-6.17.1 | 2 
                 linux-headers | 2 
               linux-pam-1.6.1 | 2 
                    mpir-3.0.0 | 2 
python-remi-2022.7.27-37-g1... | 2 
                python3-3.13.7 | 2 
                       unknown | 2 
           at-spi2-core-2.50.0 | 1 
                  axel-2.17.14 | 1 
             berkeleydb-5.3.28 | 1 
                     crun-1.22 | 1 
                   cvs-1.12.13 | 1 
                 dc3dd-7.2.641 | 1 
  distribution-registry-v3.0.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                   duma-2.5.21 | 1 
               dvbsnoop-1.4.50 | 1 
               dvdrw-tools-7.1 | 1 
        edk2-edk2-stable202505 | 1 
                enscript-1.6.6 | 1 
                     fd-10.3.0 | 1 
                    ficl-4.1.0 | 1 
                      fio-3.41 | 1 
firmware-utils-86739f2b3ae9... | 1 
       freeradius-server-3.2.8 | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.06.0 | 1 
               graphene-1.10.8 | 1 
                haveged-1.9.19 | 1 
host-am335x-pru-package-5f3... | 1 
       host-gcc-initial-14.3.0 | 1 
    host-llvm-libunwind-20.1.8 | 1 
    host-mender-artifact-4.1.0 | 1 
            igh-ethercat-1.6.3 | 1 
                  iozone-3.508 | 1 
                  kexec-2.0.31 | 1 
                   libcap-2.76 | 1 
                libcurl-8.16.0 | 1 
               libglib2-2.84.3 | 1 
                libglvnd-1.4.0 | 1 
             libgphoto2-2.5.27 | 1 
                 libiconv-1.15 | 1 
              libopenssl-3.6.0 | 1 
                 libpng-1.6.50 | 1 
                libshout-2.4.6 | 1 
                   llvm-20.1.8 | 1 
                    make-4.4.1 | 1 
            micropython-1.22.2 | 1 
                  nginx-1.26.3 | 1 
                openssh-10.0p1 | 1 
package/mender-update-modul... | 1 
                  parsec-1.4.1 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.2 | 1 
              php-xdebug-3.3.1 | 1 
                pipewire-1.2.8 | 1 
                 procs-0.14.10 | 1 
                    quota-4.09 | 1 
               tcf-agent-1.8.0 | 1 
uclibc-ng-test-132c6134d691... | 1 
             util-linux-2.41.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/6f6bd3a10ab317f2420a7470741b7e839f640ad8 |     
    arc      |          axel-2.17.14          | NOK | https://autobuild.buildroot.org/results/a27fae12e916edb970c75abbcf1fa7bfa4158b8e |     
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/76f2256233da29552093852d947024023ce1adb7 | ORPH
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b783524abc08ef4cbe7a7e4a8ff30e864de26edd | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/34eaf55b694ce4c861f8443d3527a38c0eebf8e8 | ORPH
  powerpc    |          cmake-3.31.8          | NOK | https://autobuild.buildroot.org/results/36fc149579ede0378da88cfbd6bc822a7de1edd1 |     
  mips64el   |          cmake-3.31.8          | NOK | https://autobuild.buildroot.org/results/ac2452221ceccea63d8bc1da166adf5aec2a7b3b |     
 aarch64_be  |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/7cedbf9f0c310b1910f4e69ef288081e50af189f |     
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/dc91d3553edae8f98876dcefb954afb9a8fb818d | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/2957cd34c6a46c44907339f61c25c098aca222e2 | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/cb59287529a55362dc54a6a30fb73d1cc0db14f2 | ORPH
   sh4aeb    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/bbb1b58f617774997aa1f9bc954a05dcd14f2283 | ORPH
   sh4aeb    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/b3c743ad031cb92d90632d3a186006acc0cf2c2f | ORPH
powerpc64le  |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/7fc05a48d267c5a27504159bd5f573cdd4a3fa42 |     
  aarch64    |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/7376bcfd7cf119ea190acf48666d3e13527d59fd |     
    i486     |     edk2-edk2-stable202505     | NOK | https://autobuild.buildroot.org/results/5e79bc4368c01c37015678ff625accfe5eda3c41 |     
    arc      |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/83dd57f513404b8e2bd2bac8682c9e108c8ad816 | ORPH
powerpc64le  |           fd-10.3.0            | NOK | https://autobuild.buildroot.org/results/804f0f83952ee767ffe45d51f92adaf937086771 |     
    m68k     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/47eb31da39691a82a70302219eb7bd8b9851cb52 |     
   armeb     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/87c8ec1bc6a1f738e766eddbe53283302fc413bb |     
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/5101538de1a210eab877ca2ea8e2ce4852c92530 |     
    or1k     |    freeradius-server-3.2.8     | NOK | https://autobuild.buildroot.org/results/64b525a05429a4daeb35aca4db34094b6073d322 |     
   xtensa    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/42162da0c0e5cbfe88ae8b5cc93d49e5aa64266d | ORPH
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/bdf92f1662b7ec947dc887c09694f41461c5f837 |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/cdf8a2ccf56fbe46b843f9b727e2523e61465b5a |     
   x86_64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/2e125a110968a2343e6e7c58313ae8bb41ad99d3 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/2017e8cef275b69387711214529fb82d1b3fbc93 |     
    arm      |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/6fe8bcb51b7d9da07c218652a3581d92023b4618 |     
    arm      |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/6c12258b2f50b4295515297ab4d2ebe16c2637be |     
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/cb1617078ffbd7201207487df529a9e9b77a1ad2 |     
   xtensa    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/48a2a7c52e2689a64f5505c3cb64bb0346fcb264 |     
  powerpc    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/6fbd850b733d8bb3e2534599ebb0c5dc464cf859 |     
    sh4      |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/4cf22da9919861915ed809fcfb461f90e947ea67 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/747d359fbf795316a23bfa67bb8c3ce6e65f7a9d |     
   mipsel    |          kexec-2.0.31          | NOK | https://autobuild.buildroot.org/results/fb68fc0226847bf4a4946dbfe97abe3321bc60c2 |     
    arc      |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/7dbb439cdbef96331151f44d1add9206724b2f0e |     
    m68k     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/939cf4f12f3b52f7d5e68349206d7f7211437e41 |     
    arc      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/0312fe4d5bfdc7ef7701c4eea8f68a080f3dd2bf |     
    arm      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/c7175cafc3cd950f780ef61ea9426ff57a79ad2f |     
    arc      | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/5341229dfedc8a4df2f06667298d7024977835f3 |     
    i686     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/fe72a7433a9af4c8a214a493a577510bde86864b |     
powerpc64le  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/a2d7a839f76ac9d27af9f8723eabf23cfbc6656d |     
powerpc64le  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/0a0567c365aed79fc794469f3336d2286d3d1328 |     
    m68k     |        libglib2-2.84.3         | NOK | https://autobuild.buildroot.org/results/b26340cfa91c61a87d131249620575a8d2d026e0 |     
    sh4      |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/4de11a7c83f497232b9c7015ed572aff1b258ffd | ORPH
    arc      |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/e7b96456822df34447bf4db01d695a985bc32c21 | ORPH
   sparc     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/16395d8526ef73e7e04f6ce49095d1acbcdb4fd7 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/7e18eba0f597b26a6953deb880c6ea78fdae6380 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/0c102731a88347d926089b1a345d0bd1cdd6a282 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/92f33171bd5de8177c71fb7590b6153096316961 |     
  riscv64    |         libpng-1.6.50          | NOK | https://autobuild.buildroot.org/results/03bb5da8151ac3e922eb327690114ccdbcfea160 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/eefaf7904b47a542f1b468a72697ce80b0a66be2 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/900c5574a33d1eaa6bdc3d0d2bb9a8f6a8910d70 |     
    m68k     |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/6d95bbb2b5bcabaf3ed7167dd377f4cfb480cab9 | ORPH
   sh4aeb    |          linux-6.17.1          | NOK | https://autobuild.buildroot.org/results/7b6039527c034cbe41cc582c67039e6212aaab3e | ORPH
   x86_64    |          linux-6.17.1          | NOK | https://autobuild.buildroot.org/results/fa3bb3d4d46ceebbb9b7080e235014dce63dff73 | ORPH
   mipsel    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/3725519a7750672dde9587517b5d02401c2556a8 |     
 aarch64_be  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/2648d1d7b3d6e4c596b897161c4fe1d136a93ab6 |     
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/42134608e1329bc80c163637c2ac10d4a4f185a7 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/1021930d523b77bf2eeb38687e08e26a0cef7ce8 | ORPH
    arm      |          llvm-20.1.8           | NOK | https://autobuild.buildroot.org/results/f0d54dc3f92cd587ced3eb0a34dca309088e53fc |     
   x86_64    |           make-4.4.1           | NOK | https://autobuild.buildroot.org/results/950b8a3ac9437b1ab941b8ae66568b87b24c0fe3 | ORPH
  mips64el   |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/b7c0359fc19b0f269733bed26d0cac5beaeb73c2 |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c8deef957b6667fbe759a6345f4f9daf45b0e66c |     
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/29623ea00ff0822f34902ef14c35c99816e1d3a0 |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/b4bd110c4f20fb42eed1386a456ff2a3179ef686 | ORPH
loongarch64  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/246eaeec0940c51f9dee0f3f7120e8debfa2fabe | ORPH
  aarch64    | package/mender-update-modul... | NOK | https://autobuild.buildroot.org/results/271cf746924f94a4c582b235698730e39c564352 |     
   s390x     |          parsec-1.4.1          | NOK | https://autobuild.buildroot.org/results/50669ed785f24078e8248e93d0866d22260fc671 |     
  powerpc    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/b4930373dad39eda3c54db7b06797a421b0ff863 | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f3e46904b2ab3b14b95f2567bc686b7943036d7d |     
   s390x     |        php-xdebug-3.3.1        | NOK | https://autobuild.buildroot.org/results/4e4edde96821e2dfcd33121c43951b640c850415 |     
    arc      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/0d48a5941e720a2bf9b19653aa090329f084e165 |     
powerpc64le  |         procs-0.14.10          | NOK | https://autobuild.buildroot.org/results/1ecf3d7a847422c8be0b804cd03d6a5fea73e2dc |     
    mips     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/bf93e089e97bde5234cd8c20667ccbaf27b452a9 |     
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/c4d83d310974f468f3bd10ada399bb23574f2692 |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/8b21af3ba8f6960f8c993c9d98b8c0cefbb618ce |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/e6236dac83497cec0a8312254ea6a6e2c85cde38 |     
   x86_64    |           quota-4.09           | NOK | https://autobuild.buildroot.org/results/4eafa3c1282b3e66a7c98eee2acc4089cc57feb1 |     
microblazeel |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/0bf4ca75ac8b0ca15a5ac42d9795f32748d37e48 | ORPH
 aarch64_be  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/9b90d438c5736a0b9d12081a2c143902a2044c2b | ORPH
 aarch64_be  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/f4aff765bf5b18ed390ae2bb826223552d2cae71 | ORPH
    mips     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/619b58f580b14b339eeef0123c2e2394c5f7158f | ORPH
 microblaze  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/014c423599492f8964efb0ce9b39fff8d376af49 |     
powerpc64le  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/a83161ea2136c665ad35a11835f864e34ab60bf2 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8063dc032e282f41498f35bbdca1c23dd9dc3a29 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/965b99146b5b8b78e4df1858a281e23b343b7806 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/5710f47d940607a2900765150c463964637eccb5 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

             batman-adv-2024.4 | 1 
             berkeleydb-5.3.28 | 1 
                  cairo-1.18.4 | 1 
               ebtables-2.0.11 | 1 
                  kexec-2.0.31 | 1 
             libgphoto2-2.5.27 | 1 
            micropython-1.22.2 | 1 
                 siproxd-0.8.3 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/dca95e4463f6e91e11c4f55e93c21772ae2e3c72 |     
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/aa5e7cf6cea1011182ebb381d6f81fc96c138098 | ORPH
   sparc     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/55a2fede02856eea64e1f9eab4996a140735898f |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/cafd0db30f2a3af4c33fe7c7698e7aa4e4a0c708 |     
  powerpc    |          kexec-2.0.31          | NOK | https://autobuild.buildroot.org/results/7eedea3c63637bff9904ac020b9e7d5b9fa250c7 |     
   sparc     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/8c35f9dd175b528583a6acb7418cec744f263151 | ORPH
    m68k     |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/44b6b3fbca2086afd59897f74ec44ddf0bea22bb |     
  mips64el   |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/823fe757e5f92e2a2574eeb2ff37d83bca711d9b |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                libcurl-8.16.0 | 1 
                 openal-1.22.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/bec30b0bb8a59010d932388bb5bfaf2d8a75577f | ORPH
 aarch64_be  |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/dcf02d14c00cb68efa52dad73a6e5f7909cce690 |     
    arc      |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/698cce8fd9d7ffe798aca489341d0704d8936a38 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                openssh-10.0p1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/05aac406f140d6fc3c0636fec172e2101b4011dd | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
