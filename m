Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF19C8303D
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 03:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FCCA610B5;
	Sat,  5 Jul 2025 03:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUZe6m1jrsL7; Sat,  5 Jul 2025 03:15:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A28B560DEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A28B560DEA;
	Sat,  5 Jul 2025 03:15:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB35D15F
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 03:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1A9340A92
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 03:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJ6SDP-urh7L for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 03:15:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB4CA40A7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB4CA40A7B
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB4CA40A7B
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 03:15:14 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-60c9d8a169bso2292604a12.1
 for <buildroot@buildroot.org>; Fri, 04 Jul 2025 20:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751685312; x=1752290112;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2o0aI/CXM74YBEKz1BZg44GepYK1paIyUdrZ+ts8Hc0=;
 b=iiDFmHuPatqFOE8CibQJG/MuhTwo0UI5EXMMYu6nbQ9zFwZ+p37nCvkwy4dAIawWEu
 ZPzbEk5AAq+Y0EQfJfqED++rBxz6xU43fxD50IIY43yk09kJIaZ7lH8LtM+leEhgMC4o
 2CRNmz9iTMNyShS3zRyHYZyWgRmpLjKQ9zib4FDHEKgMKzu22RXko+i85OzGks0D/wdJ
 pjxt1FjaP9E6XFuGYwvy6YygvEq0jKzX3oT0reRBJC4jI46zWIZH9M4ai3Ax9NuBFLI/
 LzSVvq/TfiUQdLhVyPlHz42fANRgOLDIEBrqn+pPZkVNeut00TkwEk74lPVBirf+0zPU
 rGig==
X-Gm-Message-State: AOJu0YwntidKuwnFa6wP4hXasUR2Xk78VoXwnfEvj4xmmBK3Qh1850hQ
 iqoq/6uaqks9f2kaK/ESWdE1zu45rK/yw6YRUPLgophybLlA2zLy30/rruH6IA==
X-Gm-Gg: ASbGncs8Nv4rArMfRd35+LxO39uwlQqGB2sTob+s7SIIbzNkrxZb6DyG6rTzaiy8DxS
 p2u2ZO/RTcU61p2TeFpWi1FWSNlH+oO5OoY1t1xp5uLGbb5VzERbk98AQR+SpGc31vSL6rWMPQT
 Veb4He7hZJXzRxa/Pnp399KyK+9e8bBbjY9FHW/fDIn7vtrQTIzA/3gxs8BVlMEFWZoqzBySfrQ
 vLrDrRjYcCszGnCh/Lqs+mOS+1SRlKyWPAP85j3GIe9KyOb4GiTAEfr/H/ncb7Tbdw16tEq4NLV
 6J57875MGV2FNLmPvXsZBychZjgbd+tqDp/wfuBTZF5EvMhNX1iJrhmwKq4DHPDfqg==
X-Google-Smtp-Source: AGHT+IHSgon/abYfWxMD7uNKXQks5WFpL6kUnShFfTTM3mVpr1B/Do3X+8MVO8/i9vW4b3QbwASQog==
X-Received: by 2002:a05:6402:3593:b0:605:2990:a9dc with SMTP id
 4fb4d7f45d1cf-60fd6d9701bmr4121971a12.27.1751685312169; 
 Fri, 04 Jul 2025 20:15:12 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60fca9bc848sm2047111a12.34.2025.07.04.20.15.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 20:15:11 -0700 (PDT)
Message-ID: <686898bf.a70a0220.302c2a.511e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 05 Jul 2025 03:15:11 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751685312; x=1752290112; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2o0aI/CXM74YBEKz1BZg44GepYK1paIyUdrZ+ts8Hc0=;
 b=Lc67ewXHaXYSxnEssACPtflQ4iIbIxvyuKtHM3lA4ZYOsXYG21QoPIf7ER7OFBJMF9
 ud13l/waLjHD8K5KDQRw7c3PIsZ//5QwJo4EYwgjFevACu0nvfD8Yuf6tN7EBZcLP+UC
 urd79qkiqZczjOrBaLnTlIrKZtoSKXhwd/j5/zpwJjvThWemUKF53UvqBZsqxTDPROZ2
 Xcp7WMKtV5wCvSd0I5/PBWeC+SWYhAg8PltEPa71SecLvAC6bVPh4iAnuCF1TkieFNYd
 oLVKbHeqPJFmY/yOIzxeXKwh9b440iRy7ogP8B6IXs/jeiZMlJaWIZQ5wvWR9egHOknr
 yQZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Lc67ewXH
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-04
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

Autobuild statistics for 2025-07-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  4  |  0  |  7  |
  2025.05.x  |  3  | 11  |  0  | 14  |
    master   |  5  | 30  |  0  | 35  |

Classification of failures by reason for master
-----------------------------------------------

                    bmx7-7.1.1 | 4 
                   cvs-1.12.13 | 3 
                  iozone-3.506 | 2 
              mariadb-10.11.11 | 2 
    start-stop-daemon-1.20.7.1 | 2 
                   avrdude-8.0 | 1 
               bctoolbox-4.4.8 | 1 
       freeradius-server-3.2.6 | 1 
               host-efl-1.26.3 | 1 
                  janet-1.35.2 | 1 
             libargtable2-2.13 | 1 
libdbi-drivers-0bfae6c43134... | 1 
              libselinux-3.8.1 | 1 
               libsigrok-0.5.2 | 1 
                  ntp-4.2.8p18 | 1 
             parsec-tool-0.7.0 | 1 
               procps-ng-4.0.5 | 1 
             python-webpy-0.62 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                    sslh-2.0.1 | 1 
                 systemd-257.7 | 1 
        vulkan-headers-1.4.317 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/8858969abf89b80f1b80b2906a027b7d3f1c6a91 |     
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/eb7902594824141e21dcb101d59039db6a2029d0 | ORPH
   mipsel    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/aecb6e5e63c00d5347de73f6f3afaa7da918f46a | ORPH
   mips64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/49a4cf791d0628481d59b1db02d5ba9cce1d209a | ORPH
   mipsel    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/5fade6ca23b91c438d5c35e9447ef930312d378d | ORPH
    or1k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/04ea8ff73845b42b3d5041afac2a653018003cf0 | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0bcd80cdca6bc851e81424e8a4e036d28248c438 | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/74dd58797d247cb87c13dd37b81ce28fea5d2679 | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7fe0aa1b990e46b8d0e8557e5511f942bbb01cbf | ORPH
   sh4aeb    |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/593b845141a2c088464eab264d5c3e4f66986b10 |     
   x86_64    |        host-efl-1.26.3         | NOK | https://autobuild.buildroot.org/results/5768617c1f53fb2c39edb92b0d48ecc02f96acfe |     
  mips64el   |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/0dbd8f04afa57704755f2dfe81dd86ba47cf83e9 |     
  sparc64    |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/4f75ce2f79cace48be69ebef993dddcbf9223c10 |     
   mips64    |          janet-1.35.2          | NOK | https://autobuild.buildroot.org/results/bdf7dca187682c3ff62168f4c58b6ad379651e94 |     
   armeb     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/a31b5bda425e2c2947819a91869211d9fe98bdb5 | ORPH
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/cc87c9d7a1ebc307dd828709e835f165c94483b6 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f694f698ea1d36b8f1ef11a6b9a5253e58fd0146 |     
 microblaze  |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/8654a21b04d4d9c52cce75525f7df75d72bc6590 | ORPH
    m68k     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/e539ab51b3857ce9f336de80ab28e594eba929f0 | ORPH
 aarch64_be  |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/073ecddb8c0d4028bd128a63e4dad7b1e86919c6 | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/633ddd87b6cae278bb5eb55e2c06d9823a4b5f8a |     
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/807d628718785804bd58d9f79755a577e1e7a864 |     
    mips     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/5d3bd8cbba1b625c223f47e0dd0811a957bd43b3 | ORPH
microblazeel |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/517c75a4924f41dfc662569c105cdb45660def7a |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/398387d46fac859b5b124172d48b2ddcb39df06d |     
   mips64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/2cd834ef671d20feaf56737c4c73e9dd1c5fa3c4 | ORPH
   s390x     |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/1c2360a55e97f7ad35465346dff85770e1d5e509 | ORPH
powerpc64le  |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/7d73401abe3b93f48ce340dd8303cc4a722be5bc | ORPH
    mips     |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/cbf9178558bb7ea8509149018566b28582fd5692 |     
   armeb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/ebc2debe25891c8aa4b4abcfa5a1a74e572c9170 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                elfutils-0.192 | 1 
            gdk-pixbuf-2.42.12 | 1 
                  libsepol-3.7 | 1 
                   swipl-9.2.8 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/5f7c9f7e573e55f30c4431db5f1be6cde8ac1062 | ORPH
    arm      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a4268791e3d385f11293f4dca871d02b20ebd544 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/9f418cc8f04d15c32876a6db44bd84fc6a437bcd |     
   armeb     |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/c815d397c7581ebf1f0c9924e3c49058af0fc9bf |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

       shadowsocks-libev-3.3.5 | 2 
amazon-ecr-credential-helpe... | 1 
               harfbuzz-11.2.1 | 1 
host-binutils-arc-2023.09-r... | 1 
                  iozone-3.506 | 1 
                  jack2-1.9.22 | 1 
              libselinux-3.8.1 | 1 
                   linux-tools | 1 
                  prboom-2.5.0 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/dd68a0e3bb845a449298512c3466977cc789ad40 | ORPH
    or1k     |        harfbuzz-11.2.1         | NOK | https://autobuild.buildroot.org/results/81d608d51c2722023ba10abfc27c8ad99e00277b |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/84bcbe20ee04dac130a3cc8b66a238248e9c91a1 |     
    i686     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/765df55596769503002c2b0fdb398e7d8ba20692 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/5c0b16171c1da6812fee4e45c606fb3017e370ae |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/94eee8e8de8a6eaf135e4cc80f65851cf438bf94 |     
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/3e6d57e4ce4847321334a9790b80c41492d0d962 | ORPH
  aarch64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/51edf1b9ded4fb1212f8daced996ff3bf6f00488 | ORPH
microblazeel |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/8917b104734a7a38f02073b5e6acf89ddae79add | ORPH
    m68k     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/4f9efcbd2457abf229fa235ae7de623d8f2ad527 | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/5b907866bd48668dd50b6022243e9863804a01c7 |     


Gitlab CI results for 2025-07-04
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548068585 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548068637 |      
             asus_tinker-s_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548068754 |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548068789 |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548068845 |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548068883 |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548068923 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069118 |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069263 |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069311 |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069399 |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069489 |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069554 |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069576 |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069615 |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069673 |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069703 |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069844 | ORPH 
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069904 |      
                   beagleboneai64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069893 |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069936 |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069953 |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069972 |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069976 |      
                        coolpi_4b | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069984 | ORPH 
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548069998 |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548070004 |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548070010 |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548070017 |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548070028 |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548070174 |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548070405 |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548070569 |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548070594 |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548070615 |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548070637 |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548070811 |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548070992 |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548071016 |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548071124 |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548071159 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548071166 |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561649109 |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561649190 |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561649198 |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561649293 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561649542 |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561649572 |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561649586 |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561649592 |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561649619 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561649628 |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561649684 |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561649752 |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561649871 |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561650202 |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561653273 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561653371 | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561653447 |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561655617 |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561656118 |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10561656502 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
