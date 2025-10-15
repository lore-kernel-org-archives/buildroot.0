Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FC6CCD184
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 03:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E25461440;
	Wed, 15 Oct 2025 03:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1TmENbc3HDJ; Wed, 15 Oct 2025 03:23:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8DD761361
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8DD761361;
	Wed, 15 Oct 2025 03:23:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A33694C4
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 03:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89B854084D
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 03:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IojmbreRh67y for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 03:23:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D44C0407E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D44C0407E6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D44C0407E6
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 03:23:48 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42568669606so4406788f8f.2
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760498626; x=1761103426;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MT0DwF8BKNcS4Rm/Iw94IaCvGXe5JZrV2IR+qngCZ0A=;
 b=ENIN8uQD/Oswqy9nquYNWJmbGvpBslmusXZqGqoomcssC248n0URYhTlMqPiUa+86w
 lB1aQpfZDaVbx3xDRzbgwDkYl5hfMUQqyYuz+kNseb769jZzOk4mDJh6lKMMCbvH27BC
 cEYzr8VR4LqmGX+vGwKlNLvDqrh6o8lrihl3qnhitikzOIF+J8Tqm+T8523f1Ft7GzyK
 v8950Be9ympOwhfq7WqzFIf1y9Qoqg1F/Zz4yjUdBxfLNEfGsnkW5TVx1v7QXo/j9yEE
 LHrmthZXk3Z092bXfPyWHl6cmFItH/gS3S1pt883tJo/qsEBfggwliBOI3lMl9jxc+b7
 GtdQ==
X-Gm-Message-State: AOJu0YzrTg1+5HScxVbmCSSiB6uzZxNhH4MZd2rMFqOxIkNYr6uMtRMD
 ICCpVsSXYOdJ0By972xRkVbTts3SOuHTyqXNy6SejBbTnU6IMVgvEc+nywgchQ==
X-Gm-Gg: ASbGncsYTL6cZgDlfVqazfZKvceZ6S3X5XucQH5ufMgR8/Ac3tjIV4j48pQuNr3V3eu
 mje+zhN8Cz7BahlC9SEONjrwOTXwR2wTS+FWexfpTxkj44wpK/QvyIx9n346yaTy+oqVj9U70MD
 fUBXJGDZFE8Q1tHxKL8zmEkMSoGKrsq0wcKxEmpLtil9P2+xIHeIRcOsCb1fG1/NTgQ+FVdB1zH
 RGkC3spaLydFXUFSm950okGr8EDuBIbJtDXxZHA1ZFAaOpZjna8QQNn4c30MchRfRnIqgZXCpI0
 M6QkfhENS1sMxP7F2OKZv2AD7ob9b99H1Z0BHL0AysygfXvDuKtVxiLyDSI7WalZVkSJx5evWS8
 siw4PdgIHG7sW+Hd8XA2UpjMGcA6am9NI79tbC+z1yK3leL/BA1cfNokZAL0=
X-Google-Smtp-Source: AGHT+IH+gkuq24yFqYgg3pOrCE+H/AGvvumJcZvG6pWIEWcKx7rOQvWdeKiGkmls0vxzH/zvSH8WGQ==
X-Received: by 2002:a5d:64c4:0:b0:425:75ce:9f5f with SMTP id
 ffacd0b85a97d-4266e8de573mr15356748f8f.48.1760498626172; 
 Tue, 14 Oct 2025 20:23:46 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cf71dsm25608961f8f.29.2025.10.14.20.23.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 20:23:46 -0700 (PDT)
Message-ID: <68ef13c2.050a0220.20304a.463f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 15 Oct 2025 03:23:45 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760498626; x=1761103426; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=MT0DwF8BKNcS4Rm/Iw94IaCvGXe5JZrV2IR+qngCZ0A=;
 b=fsjaiNmH4fVUSHYmpzNh779lq6Puan8QAKJQLclTRXIU+qQbMYkv5BDQs301PUkDdn
 2COHRr1NPq6fpKmkyNEShsF9RaE81/+XCnYoCnQ6fOdonupRBEcj2kCEZomIlQEMft12
 25HtE48T6hOAnqM5X5iGFrn/mrUK2OJalS6h+4+4A5hKozf/eDylKU9AWUUHKlX6sF71
 CiMY8P+BtBrd1jT3fM2urvOIFRKFCKzAwoUV5PPam+xQS06A+C4uJNjeakRES5PXOmi0
 1oxGqi5zqjnlMSGyClAr4SHsw3A2n0MHCfFH2tl77MNt35l7oA4LkpxTtxIBSQXktbz7
 //Ng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fsjaiNmH
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-14
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

Autobuild statistics for 2025-10-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  7  |  0  | 12  |
  2025.05.x  |  0  |  3  |  0  |  3  |
  2025.08.x  |  0  |  2  |  0  |  2  |
    master   | 38  | 92  |  1  | 131 |

Classification of failures by reason for master
-----------------------------------------------

libdbi-drivers-0bfae6c43134... | 7 
                   cvs-1.12.13 | 6 
                    mpir-3.0.0 | 5 
               bctoolbox-4.4.8 | 2 
                 c-icap-0.5.10 | 2 
             dahdi-linux-3.3.0 | 2 
               dvbsnoop-1.4.50 | 2 
                      fio-3.41 | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
                 libgee-0.20.6 | 2 
              libopenssl-3.6.0 | 2 
     libphidget-2.1.9.20190409 | 2 
                  linux-6.17.2 | 2 
               linux-pam-1.6.1 | 2 
                     nvme-1.12 | 2 
                   perl-5.40.2 | 2 
                       unknown | 2 
                apr-util-1.6.3 | 1 
                    brltty-6.6 | 1 
                   exim-4.98.2 | 1 
                 expect-5.45.4 | 1 
firmware-utils-86739f2b3ae9... | 1 
       freeradius-server-3.2.8 | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
  gobject-introspection-1.84.0 | 1 
                haveged-1.9.19 | 1 
    host-mender-artifact-4.1.0 | 1 
 host-softether-4.30-9700-beta | 1 
              host-swipl-9.2.8 | 1 
            igh-ethercat-1.6.3 | 1 
               libassuan-3.0.2 | 1 
              libatasmart-0.19 | 1 
             libgphoto2-2.5.27 | 1 
              libmhash-0.9.9.9 | 1 
                  libnfc-1.8.0 | 1 
                  libnids-1.26 | 1 
                  libsepol-3.9 | 1 
                  libsvg-0.1.4 | 1 
               libtheora-1.2.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 linux-headers | 1 
                   linux-tools | 1 
                      lzo-2.10 | 1 
                 mbedtls-3.6.4 | 1 
                      nbd-3.25 | 1 
                 netsnmp-5.9.4 | 1 
open-plc-utils-1ba7d5a042e4... | 1 
                openssh-10.2p1 | 1 
          perl-net-ssleay-1.94 | 1 
procrank_linux-21c30ab4514a... | 1 
               pulseaudio-17.0 | 1 
             python-webpy-0.62 | 1 
        s6-linux-utils-2.6.2.1 | 1 
         s6-networking-2.7.0.4 | 1 
                    sdl-1.2.15 | 1 
                  sdl2-2.32.10 | 1 
                 siproxd-0.8.3 | 1 
             strongswan-5.9.14 | 1 
               tcf-agent-1.8.0 | 1 
ulog-0389d243352255f6182326... | 1 
                 wolfssl-5.7.2 | 1 
                 xenomai-3.2.5 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/21dea33f65f2ff6c59b59b86c55ebaf60a638e46 |     
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0618cfec123b998d92a544098ad4f1933f8c4e87 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/1c43db50a61af6344a67b4c7eb82b2430130944d | ORPH
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/d82ed32b63cd19bfd597ad72d0c98c2b4947442b |     
   x86_64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/766c77cce2ffb1f17b7a6a640b05fb86b93a1168 | ORPH
   x86_64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/4a4393d80690aa2fdae055e22abb77ccc1f4af7a | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/99654c493fec2f1b00d05078e94465990b584ea3 | ORPH
 microblaze  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/33079c409a99b23c4a9b0ba1a2247130bf766951 | ORPH
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/62003c5d6ff701c4786301fc55ff11ecc3e5f46d | ORPH
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4133794ea344d68e0741e9d21c4e72610a97da8b | ORPH
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/cd1b663d8359c8596e31db8b4fc6dbc3627e5eb3 | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b8a7c61267a03edb90b122dfe84edaed750854fa | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f135d588cadabacd0dc22e3ab7b26accf38f59ef | ORPH
   xtensa    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1578e7228e1aa996130c63305c4f74ea26a6b3cb | ORPH
powerpc64le  |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/61c478a82796ce1babccbd975604de6776558115 |     
   arceb     |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/125e6af948754638584b5a98bee1d33e17ffa5f1 |     
   arceb     |          exim-4.98.2           | NOK | https://autobuild.buildroot.org/results/5e9b50d531f81c32f5bd74adb027ad120564ed44 |     
microblazeel |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/8daef413beca428170229434632753a1f468ac0a | ORPH
 microblaze  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/a44aa216c35e150592a699a65b7394d83f13f95f |     
 aarch64_be  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/ae407070a57d1d9ec89ae8cbc25cbc41979b93fb |     
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/9a09a48112f4d40e053a331ed7280c24f01f55fa |     
  mips64el   |    freeradius-server-3.2.8     | NOK | https://autobuild.buildroot.org/results/b7a50f0c03f25b20e335bf2b7ab6bbdb8bd3bee0 |     
   sh4eb     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/517e3de9fb323fb6dc9ab971103875ccbef97dd1 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/69cef96f41042d78246118284e37c64a806a20c8 |     
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0307be6410285038a8d332678e37c098647eaa3f | ORPH
   xtensa    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/4a8146e6f2fbea8b50633707b6780a8eb247316e |     
  riscv64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/0c5100c3498ace7c7bf13738c1ad659b906c8ad1 |     
   sh4aeb    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/150a21cee5cac4255340a9237a60aa73af41a0a5 | ORPH
   mipsel    |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/d729da549b6d5bf7756edd434f3254244ebdf373 |     
   s390x     |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/feeafd76e59976cd3d86a7f0d7e9c40bd65beb93 |     
    or1k     |        libassuan-3.0.2         | NOK | https://autobuild.buildroot.org/results/cf0aab01af2677e0d72b8937e17a10b19da6249f | ORPH
 powerpc64   |        libatasmart-0.19        | NOK | https://autobuild.buildroot.org/results/588f03138bd8c8ae453b07e519a651d46b5146b3 |     
powerpc64le  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4dd4dc685ed47408ffd4648bb8345c70b919fa9d |     
    i686     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/0f9344422e1e3733f10d6ecaea45aec0a45aba82 |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/1c5888c6c4a089a4014506c7f645a694133fef08 |     
  aarch64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/bf46ad7d82ee869309fc493dbec5fd4fbbf24acc |     
    arm      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/259f24197f545952ae39112437439fe25c9fb4ff |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/b3315089bf06739c4358f95b2e918d587f3d3f95 |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/82db5edc1e476493659c7779c7213fae41519a2d |     
   arceb     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/24c4cb5a66c87aafeec339f3728736f39ee61028 |     
   arceb     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/6b619ca33b64eb8df7e029efcf44988f5c902268 |     
  aarch64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/5d5da77ceda300c654b72d7fb5da0f5a9bb27d81 |     
powerpc64le  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/bf240beabeb0f6c6e2fad2854c68fc2557de7c83 |     
   arceb     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/948a5481a1edd46749dffbf3a11172288eec172f | ORPH
powerpc64le  |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/a8c28f2790bd23cd2d56abb32895d6dcea6bd4e8 | ORPH
    or1k     |          libnfc-1.8.0          | NOK | https://autobuild.buildroot.org/results/6830dd7988c4fa7494e70aa58a3eefc8f749d576 |     
loongarch64  |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/36efbadf682b4ea604e81e88c903d6e2a561c53d |     
    arc      |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/1efdd3c2aedd27d082529ef252f222926160ae60 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/1736570abc2f9f0ada98ca0f966ce68b179d6438 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/fb060bbc55484a06dfb668c0bc4b425c71cccb22 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d902946bfd03c115f50cbb79fa39666f429ddf8a |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/d17f2067d899a586995d9e40edea91fec1b5d46d |     
    arm      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/155cf8c260bf2bff1cb8c3bc3ccbf194baf50af7 |     
   armeb     |        libtheora-1.2.0         | NOK | https://autobuild.buildroot.org/results/268e1a2a94eca18c5f34d446b9882615a4ba827c | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/416f9481feb37a9ffa4b416f44f85555adccffa8 | ORPH
  mips64el   |          linux-6.17.2          | NOK | https://autobuild.buildroot.org/results/6bc7b10c67f6afa94a97bba62b1fa44b9b79ba2f | ORPH
   mipsel    |          linux-6.17.2          | NOK | https://autobuild.buildroot.org/results/8d074ada50672368cb57bf41feef8d01239bfa76 | ORPH
  aarch64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/617ab6f7ba7ffec1dbe7ec1b9ee5c1a067cd2ad5 |     
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/ac980183573e7204b98268fd2ec9994c51fe12de | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/305c95dbac29508fdf909791fb4c5e019ec3e107 | ORPH
 powerpc64   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/3c8b11f0a78ff56388d5af7c2e35237df521bc39 | ORPH
loongarch64  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/c6265c713bdf22d50ea5c256c9d2409504d987e0 | ORPH
  aarch64    |         mbedtls-3.6.4          | NOK | https://autobuild.buildroot.org/results/da5d10aa2dc0d94379cb53832402474e63b5bcde |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c5ff3fbf6f3595dece9298558631bf19dd88a938 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8c99b5b1bc01d941530fd3d97460f6321c17b613 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/bfa01bf69e7983e62c6362c0ba049f71ac5f9a63 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/6ebe61a18067bd0dfbeac53651a96013660204ce |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/7db018dc4cf3d9053435483b8bf90095807ff52b |     
 aarch64_be  |            nbd-3.25            | NOK | https://autobuild.buildroot.org/results/11a468f6c7877ccdbc5c11afd459fe77e1a518d2 | ORPH
  aarch64    |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/865e3928bc8e7b4fcab835a8fa36f7a86b9a0726 | ORPH
  powerpc    |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/49c13c0e3cac44ff7072762e7312e354de26d3a5 | ORPH
   arceb     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/11add9dfcad8435fcc228ade585e24a650ac9aba | ORPH
  aarch64    | open-plc-utils-1ba7d5a042e4... | NOK | https://autobuild.buildroot.org/results/61fc9a2f589da1ca46ba3e98d075de7bc7ee4d85 | ORPH
 aarch64_be  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/08a1856afe20310ecd4676f0664045f0f45bb73f | ORPH
  powerpc    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/1c2b8979605a98f7153f0580ed43a4e340cde02f |     
    mips     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/95e0f3dd3b775c889f4f8130b687043a3d492a14 |     
   arceb     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/09bb78d4c44349ba2129ff5f0b871e2b77f3895d |     
 aarch64_be  | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/4880bb1880818278c07c01871ed603713bd7b815 | ORPH
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e494efb63efe308c5cad7b85700b8eac0d4e728b | ORPH
   s390x     |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/5a7382250d33ddfd49de2c7996fb54aaf20dd62c |     
   x86_64    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/481f335acaac52ef1e264abf4a4596eb82511e51 |     
    i686     |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/085cebce7ff9b05de1dd4162398bb2885a61613b |     
  mips64el   |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/1c6bf3b8f6f217438ccc7513c552033fe3684b6f | ORPH
  powerpc    |          sdl2-2.32.10          | NOK | https://autobuild.buildroot.org/results/0995aeaf719dac6180f2913536c13f92e84cf791 |     
   mipsel    |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/ff2fe4eae07cbddce669000cdcc4ec69a0105101 |     
 powerpc64   |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/90c1364edafa38128dff1885f940328f0cb6f18f |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/fa734b33b35c65c480923f04f9d0e1b024ef5763 |     
   mipsel    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/75825d034a52aa24338b28ebea19d7c7bc10ed58 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/ac30f102e646d2274e7cacbadb333719583e95b7 |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/c12451832151976debda3e27525c2f262724f6fd |     
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/03867f59dca69bc57d9ae6ec37f22f25d7552d58 |     
  powerpc    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/b4c110dac867afb0fb446eda618013ce24b988d9 |     
   sparc     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/3613cb1a0f823fc87a04739874eae338329ada5f |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

              fftw-quad-3.3.10 | 1 
            micropython-1.22.2 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/e0cf90c0672dea3677c97ac561bd5b91de81291f | ORPH
microblazeel |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/b1005d89e8536578dc30d8345c167d3a9a83be7e |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

 host-softether-4.30-9700-beta | 1 
            igd2-for-linux-2.2 | 1 
                libcurl-8.16.0 | 1 
     libphidget-2.1.9.20190409 | 1 
               linknx-0.0.1.38 | 1 
                pipewire-1.2.8 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/d4f5bae974f3c3356935a6c726d0feb87a51ee20 | ORPH
   armeb     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/f924d862c1255855aeeb4b8c7ca58bd63d68f0b5 |     
 microblaze  |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/a541d3b7f326f904a52b70a90f964ac43e2f7cdf |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/4c18e23b3fdefbf9d307e0469d5b1f5e18e1ff70 |     
    arc      |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/c2ebd290b2a257b196d5b2e19498337046ec440e | ORPH
   sparc     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/3e179e1d568a517f908b583993a17de7ab73833c |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7cea9f4755e58a2bae606e47a7e92023535f8762 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                libcurl-8.16.0 | 1 
                 libgee-0.20.6 | 1 
          sane-airscan-0.99.33 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/5a6cf08651d5b2120598691da3382e1eadcf5435 |     
 powerpc64   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/d76aaf703db9593cc2745ad75bd94a981c118d9e |     
    mips     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/821dc6ff3d9a5f1bec51bad826e7db1892386d7e |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
