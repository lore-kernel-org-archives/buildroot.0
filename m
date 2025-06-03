Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F46C5AD49
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 03:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5DF4816E9;
	Tue,  3 Jun 2025 03:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OWJdAAPF-ySv; Tue,  3 Jun 2025 03:16:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C3D6811E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C3D6811E9;
	Tue,  3 Jun 2025 03:16:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 30B6A1F7
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 03:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1734A410B2
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 03:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CIvKnHq2erAL for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 03:15:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4A846410AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A846410AE
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A846410AE
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 03:15:56 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-605b9488c28so4693406a12.2
 for <buildroot@buildroot.org>; Mon, 02 Jun 2025 20:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748920554; x=1749525354;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fTSFcPzstVXOmDTPDQrdvFdu/BRPnfeGmzoFJOMaPic=;
 b=BYpQSpd+A5PGfqSdtVFhWDcQwJyU9BLyAn1n59OFNceXhEUPSNk/LNLG/vzSBXZ7Ba
 WJj5ASQVAYBNoTmCYoQKxzIpkK8Kqg+8dDrNT/deGZeteFXUXUsw9NoxMPfBSIesm7uM
 GTqkSaZqTgwj0ru8bevRdHmGi2fPOIXQUXhIIorf9OHiqmyhk5jH0CxLJMouEjlstzbH
 xmSWH5qiNgmZlv4Kp9e0UO3QlQ67j2xqohSJ5z83SEfZ+yUDo8t1UvDYxTGNvlIJvU7B
 unvguDNFN1vQq/QuS3Dhi5f5sNgKJ9LOqQ+rC6JmpwxOnToVhQhMFLqEPkty9B1TddC3
 eMSg==
X-Gm-Message-State: AOJu0YwWfkyh0PinFU8s6BAW/eAF06L+dmx4xnUpBujmLQ+LIvE2gE31
 OtVi84NMn7bEYHdj7DzThtoshBTebT4PAuH/lfmJ606XkqWBTkskQqPL+KPB6w==
X-Gm-Gg: ASbGncu/rn31KEyqP+HiBjnJvGVRTq/EgePjtydKUF+9wca9owSklOylVxJyCCoOSUf
 bR9+fyFj3bIrzSDEj4oD0gOKOgQO7Ef23PriglUIe6h6YJRUkcz1b0STTEphjBaiPxEunXVgvBt
 Anvxbfkzq7c1HKmZSX5bJKjNqIZJq3dOMAAoLcQ5gBx8U0uzAfA02BqVhGTqiGv0c3yvtS+dfqb
 pFmieUXTyLLvroDSL0/vf2ZhuSj7A6FJGycnz7ezFNk+7L7l09q4k+fmiFQNUAtDBfsTcMy/Aph
 onA1q2SOtzr8asTSx0yOlJS4/LbNUIlQVyWX+sfflT33GWLRQM8k3Bh9FRduiYIspA==
X-Google-Smtp-Source: AGHT+IEV3PHlFaplHNZusb1v3bOw9Z3W10AB8GwvRFJKTdwke6CQyLUpIApK//GkhYAHsxMPA8FFWA==
X-Received: by 2002:a17:907:720e:b0:ad8:9e80:6bb1 with SMTP id
 a640c23a62f3a-adb36b4ca30mr1424240066b.18.1748920553819; 
 Mon, 02 Jun 2025 20:15:53 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada6ad3951fsm880158166b.125.2025.06.02.20.15.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 20:15:53 -0700 (PDT)
Message-ID: <683e68e9.170a0220.26e357.352a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 03 Jun 2025 03:15:53 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748920554; x=1749525354; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=fTSFcPzstVXOmDTPDQrdvFdu/BRPnfeGmzoFJOMaPic=;
 b=HdqxBCXYY+Z5+iph4M8wa/+iBWFiG7A7RZBQ38vg919VosDJ+M9O1rvn+KjA6Go0zY
 9gMns5NiNV7igEISp3ZdsigVsEL2Mo+XfkXRkoI0zoSf//AbXtVE4klSc6R1A1XfPzjF
 x9qRV2kpNCFbHlTI7Z+2EPINPRZ9IX7FXhAJksgjggx6ceMfYxoTPFBs2mNki5viUye7
 NQL8XYaKrlpHrqFjs8EbP5YYttRbRGJBC0w1lKD7VYpTRfQB/NUqkzzI24E3813pRAfu
 HI5W9lGKokmsJBNFNP8wCr3aqn60aDo1TiS05ssXbPKKQIlLzfH8nkrlBG4xCqvQKNn7
 TH4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HdqxBCXY
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-02
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

Autobuild statistics for 2025-06-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  7  |  0  | 12  |
    master   |  9  | 330 |  0  | 339 |
     next    |  1  | 10  |  0  | 11  |

Classification of failures by reason for master
-----------------------------------------------

          host-binutils-2.43.1 | 50
host-gobject-introspection-... | 34
                  bcg729-1.1.1 | 19
              libselinux-3.8.1 | 15
                elfutils-0.192 | 12
                   avrdude-8.0 | 9 
                    bmx7-7.1.1 | 9 
                       unknown | 9 
            host-binutils-2.42 | 8 
          host-oniguruma-6.9.9 | 8 
               host-vde2-2.3.3 | 8 
                  cjson-1.7.18 | 7 
amazon-ecr-credential-helpe... | 6 
               bctoolbox-4.4.8 | 6 
host-binutils-arc-2023.09-r... | 6 
                     unzip-6.0 | 6 
           ghostscript-10.05.1 | 5 
host-am335x-pru-package-5f3... | 4 
        host-berkeleydb-5.3.28 | 4 
         host-mariadb-10.11.11 | 4 
              libebur128-1.2.6 | 4 
                libsepol-3.8.1 | 4 
                  linux-6.14.8 | 4 
                  ntp-4.2.8p18 | 4 
                 apitrace-10.0 | 3 
                       cfm-0.3 | 3 
  gobject-introspection-1.82.0 | 3 
              graphite2-1.3.14 | 3 
              libopenssl-3.5.0 | 3 
                 libsoxr-0.1.3 | 3 
                 openal-1.22.0 | 3 
               pulseaudio-17.0 | 3 
                    yajl-2.1.0 | 3 
               asterisk-22.3.0 | 2 
             batman-adv-2024.4 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
              host-rust-1.86.0 | 2 
                   perl-5.40.2 | 2 
                python3-3.13.3 | 2 
                  acpid-2.0.34 | 1 
                    azmq-1.0.3 | 1 
                    bat-0.25.0 | 1 
                     bc-1.07.1 | 1 
             berkeleydb-5.3.28 | 1 
             bmap-writer-1.0.2 | 1 
                  boost-1.83.0 | 1 
                  brotli-1.1.0 | 1 
                   bzip2-1.0.8 | 1 
                   cli11-2.3.2 | 1 
                     cpio-2.15 | 1 
          cryptodev-linux-1.13 | 1 
             dahdi-linux-3.3.0 | 1 
      docker-cli-buildx-0.16.1 | 1 
docker-credential-acr-env-0... | 1 
                 dtbocfg-0.1.0 | 1 
                      gd-2.3.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
              host-json-c-0.18 | 1 
            host-libp11-0.4.12 | 1 
               host-yasm-1.3.0 | 1 
                libdrm-2.4.124 | 1 
                 libmbus-0.8.0 | 1 
libmodplug-d1b97ed0020bc620... | 1 
             libopenmpt-0.7.13 | 1 
     libphidget-2.1.9.20190409 | 1 
                libssh2-1.11.0 | 1 
libwebsock-3c1615eeadb0b582... | 1 
             lirc-tools-0.10.2 | 1 
                 logsurfer-1.8 | 1 
              mariadb-10.11.11 | 1 
                    ncmpc-0.49 | 1 
                 nettle-3.10.1 | 1 
                nushell-0.96.1 | 1 
          perl-net-ssleay-1.94 | 1 
                    polkit-125 | 1 
         python-remi-2022.7.27 | 1 
                   qemu-10.0.0 | 1 
                  readline-8.2 | 1 
toolchain-external-bootlin-... | 1 
             util-linux-2.40.2 | 1 
        util-linux-libs-2.40.2 | 1 
               valgrind-3.25.0 | 1 
                   wget-1.25.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |          acpid-2.0.34          | NOK | https://autobuild.buildroot.org/results/4da6c362810ad2441066922902fb03d0335ee637 | ORPH
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/05e1ee669c02cbf4868682158830eff0d5fcf24b | ORPH
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/8f49ca8d3944c79c7f07f3a5e86ae6d5852c1808 | ORPH
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/8c07e7948115a32576b7d211a8f0bbdb9c9b9bd2 | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/7a0c02524b82c7d43df6d1cab11dc3e9a06d05cc | ORPH
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/c706e61107a68d2edf29b83bad17cdffc8f151d7 | ORPH
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/4845ab0e522adc43f703e873f77401b9f0c175ea | ORPH
    or1k     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/35562c83e99b057203120ff595b1b4a6381c1151 |     
   x86_64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/c4764c7b5bd85a3f989028d40540f556a32e97b1 |     
  mips64el   |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/6f73294f4d735989d084bd10bbd2631cb3d9feb2 |     
microblazeel |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/77e0d64cc2d479107dc092831d4c3d47249c0bd2 |     
 microblaze  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/d7fccfaf8d43e486ca11035f376808223b9d99c2 |     
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/6b11d3e85702df8843093e28f9d4de1ed2fd3606 |     
   armeb     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/47b17639db1d97e0af96fac8922e5b5ac16946fd |     
    arc      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/3e1db07ff08c51f3f1645f9744f0ba9ca78d549d |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/d77fce931f1d897706d8c9d4d438695edf994591 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/7b11b0a1115438a0e89d0fc01cedde3371ba8398 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/b138b2361ebf18b7297ce77cc004c6d0f96e527c |     
   sparc     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/114b7582773c1ca8af68bdd2652b39d24a809ac2 |     
  sparc64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/e1d66bca80ab68ae090b68ccb62d6424eb714727 |     
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/ed49c0a66244a2a1d0b453c60f294d0cc0de305a |     
   xtensa    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/28e29ce760c9f6e09ae9c6c059350a1f930b8688 |     
    arm      |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/e5847d401b84f7d7525feadb766a2e62b2af989a |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/b54acd325727421ccceb95b220d85a86def145c0 |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/e0aa2600a3f2a65b2bd85559d161f9388b52a1d2 |     
 powerpc64   |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/84772acc6f5e7bc60450f41151e50432317ea2a2 | ORPH
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/aaa2cc1cbd83da96adf15977de21b788c003e2d9 |     
  powerpc    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/854f838f2dd3901dbdcad83fb640e795eba2b1cb |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/fa29dcd18e08f3ea99839c2a01cfd9136d3df41c |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/bd2baf49c688d46dca98638ce1bda76a7fd6e29f |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/e86744fdc2b57750acc33cfcdec59c4e3a21a6c6 |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5a45b24230865d5f099a73a15a34a7e9590aae41 |     
   xtensa    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/25f953aadd7d1c90b28f7b23479b7910b3473f2d |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/86acd054e06a90fbde316a167700d87a855b2cf6 |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/b7a95ae7eb1a3efc9aea18e51925f83af2671d56 |     
   arceb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/39457ca1b4f31ffe4ea7779bfa50ed485c9dcf65 |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/7e97597bb99a8ee31e579a9ef957825f1d019bda |     
  mips64el   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/991ff219bf8032b4624b7e469b0bca6633bdbbc6 |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/25fe713530c384ff1633089fbb02bafaaf34e349 |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/af19609120c97fd0271393988cf1af009b96b53c |     
   x86_64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/edb72c62f621c5cd69e478c2fbe71e2e182fe248 |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/9f8a35be3ccae3df69a65ba6f79297d0055156d1 |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/1d073297eb156e818ea5e633da9b6a85cda077b2 |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/d04ec3fec68a0eff50d8a07b73a2b7cc48d80678 |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/7383531bd8fac8745bd2ee9109f9f51a1c945294 |     
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/143b729fb06d1e860171a7cb4d1cbd1711e21228 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/2fbe831c0784cf8b2a4456c1731fcd75ab8e56c0 | ORPH
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9ff579ee8221014fdbc69b4060687f079b04f9e5 | ORPH
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/628c4dcafbe6f2dff7a35eca06cff86c911d2a54 | ORPH
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0eb2a045957e13c5b49059913b036a814a6f1b31 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a803a25a2cb6445ffb4ecb9c544812014073020f | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/bbb71a9b7062da4a4b0902ad9e1aa28993828781 | ORPH
    or1k     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/f93dae2f665ed55365680654670ed084f7bb654b |     
   sh4aeb    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2ff7d25ce8ea34f4e78f3b6094b16f40302c9e0a | ORPH
   sh4eb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/296dbe425ca9f93a41e4afd8ffa03ae771c62b41 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/a21be21d5ca6efee9ef52951877d37b4318d2c7b | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/23b2de53b839df82b4a283dec406b535106b35e7 | ORPH
   mips64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2722c2a2898a25b259dca8242398b3cb2f862ada | ORPH
    m68k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/34830df771bb746f28180726e076eaa3a70567c3 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/02059b14d2e710f320aded0f2e4c3589bb471a15 | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2585f39fbdfefeb12008470958b4d2b17a573403 | ORPH
    sh4a     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/4b4bafaf2355c218bb5eaeb41958ca1d9445f63c | ORPH
  aarch64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/4e8fa7391080648af3bb857588354fd6b5c4aa61 |     
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/f691882c44a36e135513d9b906be4cfab13635cc |     
powerpc64le  |          bzip2-1.0.8           | NOK | https://autobuild.buildroot.org/results/5b7305d0763ddbcca514d791d87792f0ad4dbac6 | ORPH
    i686     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/40a9c8dfefc82ed80332af76fe46c7b797e77824 |     
    arm      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/109afa832ce101f25522fca72e656bdf00b341cc |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/b5bfef53a5460329dc0b6c657dbfa95d15191b68 |     
    arm      |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/c882c8ba2b2b13a062d360ccd2afba2cf2d0178c |     
 powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/7e76e356741dd6d8bb3734a2d18e0e27cd5e32f1 |     
  sparc64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/a986c0dd629d410501ddc1af4e5f3b14f22b51f3 |     
    arm      |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/e77a4a7696077c9863f37d3fcb45c1d2349f7256 |     
  sparc64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/d445de5c8a8af47276bc960700af7f633b7444b9 |     
microblazeel |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/cf0f51b0268dfea737148e73b7d426386679f9d5 |     
   x86_64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/ec2174f3083d69cbcfb694b0c7c2db3e8eb0144b |     
   sparc     |          cli11-2.3.2           | NOK | https://autobuild.buildroot.org/results/eed5dcb52bad7b02767a3c0e579a0aaf5ced9ac2 |     
powerpc64le  |           cpio-2.15            | NOK | https://autobuild.buildroot.org/results/fc377e0b1031c1e8af43d57463ae37a1c6de77f5 |     
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/6c825903c439f992aea843f368f0b7ec20941e58 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ab2c5f879c7acf72a89fd3ef9a83fe6ab2a2f44b | ORPH
   s390x     |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/888f0ebb341602af0a34687b470e0759b77612ab | ORPH
  riscv64    | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/c3508f6b34b8ac49f2d1acc7d7bbe15efc73d836 | ORPH
  powerpc    |         dtbocfg-0.1.0          | NOK | https://autobuild.buildroot.org/results/16032fe10c6a02d2792ab84d4936a40b6fcc71d5 |     
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/25c5d8efeac6798faca249bdada33b02d7555f00 | ORPH
    mips     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/fe28499495a581a555a8156273615d8ecff7a91f | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ecced2e20bfae7a068eaa3278ab231a975dc732e | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/1690f2e55e005fe373b9ebbf763ee48fd9d3ff4c | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/bcfe45fdb85787dc5c8e5aa2db9be52c071a6773 | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0acdd480075f06ba87c4df9468ae74ffe54b9a03 | ORPH
    mips     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ba9cf5df9bf0b2b74de27fcb0e53e5ac46c286cf | ORPH
    sh4      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/3b3f961b7d75c031855da4d35687eec555de163c | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/afb9f46277848f53c8e78c9bc611d2a668faab19 | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/decd7663f27eb635d1f3b1545f7580bcf7f08361 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d950a9f208d1179779875676e69873b90d742232 | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/6cde2aca857c09fbed6d381698d45429823b63e9 | ORPH
   xtensa    |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/bad1ed3f926374546381dceff74f4330fe57f631 | ORPH
   xtensa    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a50c8c003fad47865c0552041adb6f25680a386b | ORPH
microblazeel |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/b26639a25c71ed32c5c5cbcb9ef72983b6d821bb |     
   armeb     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/73ac0b79a855044f6ebdb3afa0f4f7c207aa6a8e |     
  powerpc    |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/a312c01a560020cb5b430debe489c1552ab4f77c |     
 microblaze  |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/4096e3b2550ff142383b7baf2fa6d77bd4e33bc9 |     
 powerpc64   |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/f9e43abacf6b7dd1d5cb88c23fa88d914ea9dc83 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/3e346ef56ad3796133a35f07390331e3d4a029df |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/50ec970da5443c380fbc127150e67f6f30663aa8 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/98db1538f3df83ca09113eb006c52aed2ed592d8 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/af2d538e23d05c8b94d593bbf1206ab313b233b8 | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/b6497b7cbdfee5c0c1172348f671c23e3f8977e4 | ORPH
   s390x     |        graphite2-1.3.14        | NOK | https://autobuild.buildroot.org/results/c563c1d881a159e9fd1ee1b357902a639541a5a9 | ORPH
    arm      |        graphite2-1.3.14        | NOK | https://autobuild.buildroot.org/results/bc8274966aab88c44cc9b2861eb63b07325f2086 | ORPH
    or1k     |        graphite2-1.3.14        | NOK | https://autobuild.buildroot.org/results/a75e373144c21208749017bd35d6788a3a7a5801 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/245d2b0d25c5925fdf3414557fed7a0c2ce9ae85 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/5ea40df5a5416a54c021c51764ddcab7d7a9d177 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/dbc45d848f6d756db29abac436d05209b150c6ed |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/a9fc0fd694bea6e60b9673a3dcf22b79c50a1ac6 |     
  aarch64    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/bae098fc54d6e5bbd490746d0cb95d3fe72cfadf | ORPH
    sh4a     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/9acd750239b2084fcce0df24278444aed3ce5e0c | ORPH
  mips64el   |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/807f7ecbc7978f70b7bcb9b964bffd844d98a76c | ORPH
 microblaze  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/e896f7f131d264c38089d050ad4081d9f968e048 | ORPH
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/8210af53c65ca5bcc9053a5329daf7ebc0aa8e22 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4b204e3114b180c96dfabd5e6427746816fdcfae |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/0db6e27752f0be3bb02c1aaa8d5d2f88f5004cd8 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/51d692b1c6646625a93d6d58465720453a5b945a |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/9ac62701056d1de0868b2c4fa69d51b259024c13 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/929cd4009f146f19eb61d5dd26b3af0840af48b6 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/0092c3c696e9557c89bdf45d36af564bf711831b |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/135bed207b4fa668c48fb3e34622af625f64d193 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9b99410c5cf327318c3ba326ca4e5fe00b07b78e |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c145865dcd3dd6a471127cb7c790b8c427c47d79 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/54cad551427e5cea920931abbcd56c12bee07a0e |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/12152d4e8207bbe179bd157dd590f65bde8ded5f |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5daa6eeba7bd398baa945d0236532103ea614615 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a6e3e5131ad6ce888cc434906df4eceddb1e3c5e |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/172021f1b018f471b0b384a95267b59736393c9a |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b6135979e4c30c9c359922644d1d7735ef0062d4 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/10baaebc2612ee8203a85b5cadf02d38c921917e |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a4df5b72888ff7b47f2161a23c9d78d372a0b3d2 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/acc0e13b07cb994bd0219d2fcc560d6013a55bcb |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/eb7e970926f5c3ccc23ed9cd83e27320acf605cd |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6d2d078b1e16ce05dbd554009c548f6ec8a61924 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/89072c964c141f12a2df74d599641490602d4289 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8912a009c40b1807b6d4db377e724c536bb10069 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fee8bf3d64849da082549b01d39e030e098fa513 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/84c04ac733076bbcb101e179d7847ddf3a4577c3 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/82fda09d0caa61f3458c1ad8c113695b37cc883c |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ee23b73b05bc7e25b503df77bcb338e8812eeb70 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d0956e618b661b70abd0808734a6be79ad2be583 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/20022b8c9b24fd4a1416c51b0e5463b0fcffa2fb |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c2ba5492c3fcfd9fb4fb7bea0c8ce11daaa62d25 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0d5611bfc497eb8b7d8ad3ea7c5229aa0e8ecb63 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5e258c183c6ea5e9204ea61f8d3716adf1c055d0 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b9338be55dff511224d81394d79e914f71334175 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1f5d062b928f3ea4c4fd632cf0893fd6e219203a |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0bad40cfbaf5953c6c254a50be255389646bda1b |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ed6ae4134be0dc3e193215df05921fb880bef5c7 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c7ae5df52f3ff1101d7b34b53d86037fc752ce42 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2aecf06dc64c432f1c55d974f317347281702ce0 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bc8406b274638ba3009bd3d76e5e1be0f48fe3eb |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/91cfbc3ad19442cb983eeef1734514f9d377e8ed |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7071974c5dd3b08a423461435c90cfe6933881c4 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/58e84ce8f4facc3cbabe4e07a49e59f4fbddd59a |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/08fce91221ccd33fdf01be702228c7b671de562c |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/648fd3024bbaac62080811c1e694e70fd5c67b2c |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a9ee5f71b2a1a08a651a2cf33be810d472311247 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fac2f33b64bd657254a860260bab86ae9313d998 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4c3f4852b413254ea920ca9dd7e61d22358b3b58 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/adf9741457fdd025a51f63b497ee808d4c97a933 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2a6d2f9e5e6a03b7984c0a0aad3eba98984f6297 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1b70b4c0629ccd1d5c33b96daf152d64f028543c |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/76c6949f553e97b7cdb15d8250cc4be426acb0d7 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e7c069ae3b60e0f2f7304f86ce4e8a5c6c7fd266 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0abdfccb4b335500292f8f2b47db288060769d9e |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3cb18f0dc0a0be5ff1fc679dea4c3d2183e86fa4 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cd1c5ec40ffa5c1e32d96c93ba6bb045806c93bb |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/749c35230f6ff47d1dcfcc5f6b7efd6a475a74d3 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7637fb784d37624b4f29cbc0069dd6db01a6b446 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c6ef01372950199c3cce9d6007489745246d4be7 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c3ec78708a4c48e62af5a8733f841e636ac42ecf |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/8ff745fb0d17d6d711522abea7327318f18b2e46 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/41605e7466576a24141d008b3c694f8ba4941cea |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/f100f5cddc39fea96824b2770f0124937e5321c5 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/270818a6945c17c2308f4708b8f99c9413d901dc |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/24cf9aa657568d2170be2ebac87432debf3b69dd |     
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/9d4a8351e921dd08c67e0ae07b2a3ea4677f733f | ORPH
   sparc     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/62e3b0332201036414d642f2e617a08a31d3289b | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b76c1afd88258bcd6d7665d38146dd9211e461d9 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/73841f29688db9cf06e046947642128f97a354f2 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e1b07513a03dec27e3bc51c2e1d5603278eb2656 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2cdce5bd4496d01df77f80943252215b028679de | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/852cb611f9be35065d71516b6146f1f82c3e7c2e | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1772621129e5bb8cf8424b27b17186590c97742b | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a90832090f71b1c099ec5bac8be0e1097d3244d1 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1276aa720d892c9b7cf5a6977e3a4d66aea1d651 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a2265ee5eeccd4aaeda6a7ae86cf2ad46b89563f | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/89094160751dc4257376ecdd2f92ac682b14407e | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0aecddc4ff4054f25cc02ba28f2d687b4aae04b8 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3258ead276d946f2c1582ab0ba81a0f3d0be242e | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/384181a02fe1c06046a6b7d94b2d9ebc15090a81 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fc6eb04ad2ecb5ab05804c4ae2e4960ecbcffe70 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/afa964cd2f7bf002fd3d7f2a8ab315bdcd7cb4e9 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/15197820b8b1efc2feeb8a262b2397eefe206af7 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/55e45a88f574e2a2cc876dfc9c1ade5f92b4c9f1 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7399802509d8bed7c150316dd9e0a8bb0c6e0181 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ba66d4d312165fd86281044ee7ff249113bec215 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/94ce5e8d9e136db052596ba970e0f618f80d56f0 | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9f0f609f725e69786be9b9ee4f3a5dbe0bd56172 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f9a95573ef0dcbdea1d646ca4197fcb150fb4393 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/11e683e5e9fd4ec3edc444f9635bed9341fa3889 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e3dac59b335bfb7ff7780a42db28c31982566d09 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0ee9b765fb021a037e9382250f8135584f0f44b5 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/17dbccd9267bc23ba71bbde03c30dd600f5c8775 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6fa162c9436e08d79a36d7c697fac53ed603963f | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cb272b27d15eef53b6cce82b6444a80d14291d8b | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/481807aa2a27fe4fb652c2e9135348a4b65450ce | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/72b567b93cd603fa2564460d7bd7695b62b51603 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/741d3cac09b1a66716ccd71c1aae431924368024 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a9dcbe21709797cbc10b7f18a41ae5dcb1d4baf2 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/94d4c2ef0612cbea694971304b0a62c65a9f6fa5 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5b022b74f47f626819fe8455b5206250b602313f | ORPH
   s390x     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/e3c1d4629792c6aaf6c27f4cb87ea751fdd04429 |     
   armeb     |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/352e31e868ff605139c65179974fda9cd6b2b2bd | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/c45a93866a013d3e9ac11a9fdaef952232aa97cd | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/62b86a1cbb5108ac817130436ed1d0ccfce9ac07 | ORPH
  aarch64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/ca9f63cac55c436a8f13ebd12922e585f7120f11 | ORPH
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/37602c6f244613479b953d6eabd44471a3054f12 | ORPH
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/087946a294e0b8cc9a23f6d1d0d99fea5c1f8aff |     
   sparc     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/0e330061bd14de5d0b4d07336a170d2a2d3899f9 |     
   sh4eb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/277a5d423761ec98ad7cc9fe08e9158859e4fb34 |     
microblazeel |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/f36186bcfce7196af17fd69db04ff044d5893f51 |     
   sparc     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/2f0953682a02e4869377921b99d7631509ce83ea |     
   x86_64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/5439f900932148567ea2b6ffbe6576c67273ff2e |     
  riscv64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/a8cf5dacb5eebf93f6ce25a61e60554e7bc09606 |     
powerpc64le  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/1b1c23cea35ea82165fa19f31a5e07b0c4f42573 |     
powerpc64le  |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/71bd2fb3d7dd11efb50d20011f4abd43d729907c |     
  sparc64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/faf00aaf663f0cf22442be2571db3a44b0169184 |     
    m68k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/2e266ab9a288e0a7df4ce7df042b0f5b778b0f01 | ORPH
    mips     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/11a0fd7442aefa487b3115a5e1c9717fd33f7243 | ORPH
    m68k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/c70bd66f848b040e2ea931ef8b71be59a413903f | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/e2a0269f45fad1dc7d1538fd6e803fe687c9bc2c | ORPH
    m68k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/ab052a65a610e38c9ecbe9516052f90abe499c15 | ORPH
  powerpc    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/7fa2545596a537385219c1f6c3d70d3d85be25d6 | ORPH
    m68k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/db4e091edb49b8dd24e4d604976e63a650009736 | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/e21c19de06cdeeeb9df947fc86fa4617b6c2bc1c | ORPH
  sparc64    |        host-yasm-1.3.0         | NOK | https://autobuild.buildroot.org/results/39fa4ca4c5283e2967d94ce9845df0fcbbf4730a | ORPH
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/b0f273400a2615f93a2e19006ac5f89f219a86c9 |     
   sh4eb     |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/32f8260d821aab9a025fb20a44347cafbd909131 |     
  mips64el   |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/598dd64b2f4185a41412b490fd9bb379e6fdf4d9 |     
microblazeel |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/81e22584ce90d9eed30b77f758425aa901a6e7cb |     
   s390x     |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/a274e5143a8b3713d1b384c90cff840f685317fe |     
   s390x     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/04e0815e2ab54be79b2b5c6110eac52dcc022127 | ORPH
    m68k     | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/32caa618f172185f7074683543fc84f94270f60b | ORPH
 microblaze  |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/fb60f48fd8638f8bc5dc36582253471977422456 |     
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/1f2678c4ea42409dbbba0903394e71337f406382 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/a877172ac10017020540ea8f6f02bcb38ab6f8fe | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/6ef9926936d2cf143c0c62fa5cc86d38f2c05883 | ORPH
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/2d291412a8c655c3ee797ad71930dea81a14ba4a |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/87c11b8ae7a16e19e939b42693000185274300e4 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d15586904649636c594158b16e2ffc6c1be45fc0 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2ef50b0bbae2db933dc2e6a5b162677b1fe7d98a |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a6fc855e3294597b78f21ce84d3b882be293a496 |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b643d5c5d86054bad6eb4bb01936b6eeed47f842 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2b2c17b40e682f161c0e498a33e8b2634a76cf18 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f8d8ee7730a48289b462a2a2be5ac10e722bf091 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/34f10c3e3eb29fac64f2687a4f32cf1cad587396 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/808c4ef23c0bf0a7daa18cab4fb9369418ccd2c8 |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/05029147fb3e40aaf7a6b43c34fb7762dff117c9 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/53c452c0482ff13842b6f9f3d67f615aed61ee1b |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2737c5151119c1d6cf9e1cc752aa784666b4ad82 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8145243278da742dddf8bfac6831c79769266824 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b7506b243d2a0a6e6fcfefc6e782802fdb6bfc40 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f057af5683e4f924642aad9f8f0843fe45131b2e |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/a530db03badbde3a8a7b3df42f1f37f93a1328c2 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/0bcbaac5ff09eeb9bd9c5df97ed3d71538865830 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/2c5479c5078e2ef32e5e967bdecfb0683db40cea |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/6d34740daace35a8768935f61fa6fa0e8094dedc |     
   sparc     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/56f6940b729359c5484c8602b92676eb66bcdb28 |     
   armeb     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/0e0c0fd2b2ab05c21dafa0a35d359e64b86b9110 |     
   x86_64    |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/0a573f93b4d88b049acd6f07e38fae2b58cdbf1b |     
  sparc64    |         libssh2-1.11.0         | NOK | https://autobuild.buildroot.org/results/aca37faac6fae0fe27fd1e15f4d6cfc272799c7d | ORPH
 microblaze  | libwebsock-3c1615eeadb0b582... | NOK | https://autobuild.buildroot.org/results/69bc2750ae8b0efbd14003a135e8f6e31eadcf3e |     
    m68k     |          linux-6.14.8          | NOK | https://autobuild.buildroot.org/results/3bd8588e4e8e24879190e5ab4a23c64ce0a02883 | ORPH
    sh4a     |          linux-6.14.8          | NOK | https://autobuild.buildroot.org/results/b022db4d0b47f14a5768867809647c2fc1cb2724 | ORPH
    sh4      |          linux-6.14.8          | NOK | https://autobuild.buildroot.org/results/d8ec971515b842477062018939f2ae385f7322f0 | ORPH
   sh4aeb    |          linux-6.14.8          | NOK | https://autobuild.buildroot.org/results/2eb1844643ca8f1ac8e1921294903de8353b13af | ORPH
    mips     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/ad75d21a6e5d9d9098f56c45d6042f6e67a5fd85 | ORPH
   sparc     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/e17eeece645e93dc9b8d43e8beb2b470fae80940 |     
 microblaze  |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/b055ceca65db632ada334a7f1e83401f85ea2c00 | ORPH
 microblaze  |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/ffb5376067b679debfdff488ae7f45e66f7b37b6 |     
  powerpc    |         nettle-3.10.1          | NOK | https://autobuild.buildroot.org/results/8eec41fec839e495c5053903967fc13a672e8a6d | ORPH
   armeb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/13364e35a986d031a5e301c842137d16e4a66e22 |     
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b4afbf33f8b947083904f4b111bd9d81d418929e |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a9c33a4be0b9945dfb7e53cfed5964d432df9e1a |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d890c9435f8f94969ce0a55ab9b9f3b12f63c4c4 |     
    i686     |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/323752595f61d6b06e9353c3097353ec85337022 | ORPH
   s390x     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/4026e514b21af20a9776844b111266ebb3529235 | ORPH
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/588e7fecda29f6f1e1e682906f55699aca2b7ade | ORPH
    sh4      |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/d30de316d4f0cc749504b169199bd17061f879a0 | ORPH
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d7326ab860adf756ff9dd8d6ccce9dbcaae09cc0 |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/6e5f21ba0d0bf85ff715f4e41c5492ad3ff8e014 |     
    sh4a     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/394300ac04d07a7566c1ad894bf8b913efeec273 |     
powerpc64le  |           polkit-125           | NOK | https://autobuild.buildroot.org/results/3af5102057ac93def80164b5f00508de8cb2ec44 |     
  powerpc    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/307430e20ad8637f2ba63d826fb16221b9912b94 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/530674302c058efc13a38eac9fc9105e92293504 | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e1309c6ab0051e804c4bd460bb81ba90b0a87116 | ORPH
microblazeel |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/8a969167f2b653bf5300ac607b0076e88045f944 |     
    sh4a     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/821fb30842a93e73260d135ea2ff9503ecc82f09 |     
   sh4aeb    |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/f1a0678cd7856ff97f40e265ea4375e647785d29 |     
    mips     |          qemu-10.0.0           | NOK | https://autobuild.buildroot.org/results/b200c2332263d88f00d350fa7d1b459867b48808 |     
   x86_64    |          readline-8.2          | NOK | https://autobuild.buildroot.org/results/3b4f76da8ed30eb3fe55eee00be53c13e7d88cac | ORPH
    arc      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/f4b1b62a14051c5d6e1f78fc6f5eed177b7332b5 | ORPH
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/fdb93e85b4c77307c1f680ee5b9eb0764751766a |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/2d98362fdc9b03271d8775d69bbf916e26b1b192 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/dce5f893aa65fcda1f2bf434597ee540165514ae |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/a0f55b5f4e393d5c17d6ce2115173f6b12d806ea |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/cf9ad6cd013b1f9769f15f53841c064171554604 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/83fa32a9d1f993be2052d0c6e6455e070df8606f |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f134f8d2f2a7c9ce6bc860b609755146cc7c6e49 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0f2d7ab1d5ff4909366efef08298224890a0419e |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/dd84274556c6efb5c261856a3b86af54f8be6a9e |     
    arc      |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/6eb60c7d3e045ebef4f8ed8b1b321b001c970e97 |     
powerpc64le  |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/aa5b809fdcbd32993baef39d2a57263564f1986f |     
  powerpc    |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/2c6186a25daa5cd76ef9774348f7ab37f325f3bb |     
  powerpc    |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/8883f2d88b7092bb68417c7ec9c5319f175d4c2d |     
   s390x     |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/49f1b08584bf31e78540b2045c29b5851260b77e |     
   armeb     |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/ac8cc114a7b92761f592f8a95f531758fab9bc4d |     
    mips     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/69e5224a9f0ad6509c8d8571b3932ad70bf56027 | ORPH
   mips64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/9bc21589b038a52abf04ea6c346179b1c7110c1d | ORPH
  mips64el   |        valgrind-3.25.0         | NOK | https://autobuild.buildroot.org/results/8f4b7feb25fc2d2037be4c32f042bfe5cc59cec6 | ORPH
   mipsel    |          wget-1.25.0           | NOK | https://autobuild.buildroot.org/results/933a415e6cedd28017c225a9aa1967e707af1827 |     
 microblaze  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/7972fd81eeb348c5edb9e35d39237085c7f2496b | ORPH
    sh4a     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/5c545c05a9d07daa243d596cb2f1243c004ae8ed | ORPH
   armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/428df3f72f378345f9582984e4a8d8b8071e7172 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             fluent-bit-3.2.10 | 2 
                    flex-2.6.4 | 1 
        host-berkeleydb-5.3.28 | 1 
                jemalloc-5.3.0 | 1 
                       unknown | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/00479b36377ea326ec2fa217e0c3e793a028b706 | ORPH
  powerpc    |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/22a464873c76fbebd6e95b450d6dd8aece0464d3 |     
   mips64    |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/abf16eaed9b044fbfbaf3ac5930a93cd045a20fd |     
 aarch64_be  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/0b679055f920c31addfc914d22b0e0b4f3c88176 | ORPH
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/4b4e1c59eda8d7ada65d261815a936a55b952b67 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/3bb7719fb59c7a1fdf21b3ac16a5d6e724b81fa4 |     
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/34957665d1b641fc3bea7f8906f4dcff1c36e9d9 |     


Classification of failures by reason for next
---------------------------------------------

                    bmx7-7.1.1 | 2 
               bctoolbox-4.4.8 | 1 
                   cvs-1.12.13 | 1 
                 hddtemp-0.4.3 | 1 
   host-bootgen-xilinx_v2025.1 | 1 
          libcamera-apps-1.5.0 | 1 
             python-webpy-0.62 | 1 
                       unknown | 1 
                 watchdog-5.16 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/679b8decadaca32c9ced3ffdd1bf81f9936eddfb | ORPH
    sh4      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0cfc74592071471a7c3c8df77c2b1e7051acaa10 | ORPH
    m68k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/51128adc22cdb892b4967226167eb63269458449 | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/07c5f934ffed5bb78b4377537b9a19892146c789 | ORPH
  mips64el   |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/3322689adba7504a1833445f99e4059b7b9de8c1 |     
 microblaze  |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/869ad6e37bc7f5781823deb4e8babe52873980f7 |     
    mips     |      libcamera-apps-1.5.0      | NOK | https://autobuild.buildroot.org/results/9c3d0083b2ec706da78eb4e0ed9c2db2bf21a5ff |     
   s390x     |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/52e176a4e104c16f3038f414066c317f0438203b |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c071e46765c2b541dd72d8fc501bf98c55ea43db |     
   armeb     |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/992cc2c1b1d97b69503c3754878db35ed003f128 |     


Gitlab CI results for 2025-06-02
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876579 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876576 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876358 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876336 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876333 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876330 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876329 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876327 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876325 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876323 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876321 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876320 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876316 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876314 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876313 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876312 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876311 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876309 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876307 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876306 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876304 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876302 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876301 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876299 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876297 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876296 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876295 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876294 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876291 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876290 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876289 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876286 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876284 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876283 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876282 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876280 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876278 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876277 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876276 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876274 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876273 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876271 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876270 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876268 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876266 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876265 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876262 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876260 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876258 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876257 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876254 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876252 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876250 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876248 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876247 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876244 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876240 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876238 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876236 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876235 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876233 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876231 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876228 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876224 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876223 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876218 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876216 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876211 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876209 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876206 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876204 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876202 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876201 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876198 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876197 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876193 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876189 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876185 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876183 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876180 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876177 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876173 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876172 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876169 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876166 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876163 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876160 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876156 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876155 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876153 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876151 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876148 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876145 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876141 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876139 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876135 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876134 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876131 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876125 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876122 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876120 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876117 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876114 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876112 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876109 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876105 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876099 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876097 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876092 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876087 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876084 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876082 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876078 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876073 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876068 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876065 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876061 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876058 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876050 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876048 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876045 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876043 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876040 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876035 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876032 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876029 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876026 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876024 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876023 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876020 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876017 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876014 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876010 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876007 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876004 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876002 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217876000 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875996 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875994 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875991 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875987 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875983 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875980 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875978 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875973 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875970 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875968 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875963 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875958 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875956 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875954 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875952 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875947 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875943 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875941 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875936 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875919 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875909 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875907 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875905 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875903 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875900 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875897 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875892 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875883 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875874 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875871 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875814 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875801 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875786 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875755 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875667 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875631 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875502 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875202 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875200 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875158 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875022 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875017 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875016 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875006 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875003 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217875001 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874996 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874995 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874988 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874982 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874979 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874972 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874967 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874966 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874963 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874962 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874960 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874959 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874955 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874953 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874949 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874945 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874941 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874937 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874933 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874932 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874929 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874925 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874920 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874915 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874909 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874905 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874900 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874846 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874842 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10217874747 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
