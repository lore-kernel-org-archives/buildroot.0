Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F11CA0EE4
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 03:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18492405D2;
	Tue, 19 Aug 2025 03:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8riV4a4Q4_fn; Tue, 19 Aug 2025 03:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2C4B405D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2C4B405D6;
	Tue, 19 Aug 2025 03:24:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E36C5DE6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 03:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9EAB40098
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 03:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDWVhGlBk0GI for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 03:24:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 969E640042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 969E640042
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 969E640042
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 03:24:24 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-619ff42ae79so4115483a12.3
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755573862; x=1756178662;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q8HSYzLPq7ZnCnC6UAP5XhmPvAnxuolZmRfBqCnBdB4=;
 b=rsbx1ssNjn5+0fhQgDviNT+e/vBErCV/qbPinw3BIzM+VruDpJW/gRt/uHsH35Egj/
 Jz8A2HJUcnZSfc0FdOehvghYpN7y6zjHKWtWSVl0qSPnS8l4J4xBRWgBxv8XAvKD+MXw
 9adqlGzYKe5Y36ijNSK6sPkSIs6Qp+wQf9yphvWpNRfMHtA6f2YpyuVL7I7N7cna4hEu
 pCcx1lRddrZnSprSGofYT1EjpzTupcezIYNMnl3d9Kk/WHpI7NbXKJCenPDBrr3MQ9Z5
 vKAsNrBzb+c8kGAI5dN8mImyZ2OVGS0HEQJMChUGskBY5+hnYem4jGgkV0sbThn6RzwA
 VerA==
X-Gm-Message-State: AOJu0YywMiyWJ2RtS/ZGoIpYDuJyZWztkjlifcmQxIbmhy6zJJk/MgSQ
 aeTyJu818/i/6XsNyJrqVY9165coXKxyLgt6rGg3fII3n9u562Ttadi7psGAFw==
X-Gm-Gg: ASbGncuPYcbX6b9XoVvTLFCiyVK92obl6/vyXqo89rSMn6UpBrJti894dPUGZg2HuQz
 ogHwmtU8bMT9V48d1X1JsEU0277ljGOUILFUCDeBO8im8XIIV3mg/K8uCS/baAgI8SruOM1YGJz
 sgWY/mLT07SZqnlKRcTS9kwsvtui2WbSJRzBv4stT/x1H7/sX7c8ipLlGuL72TLXNC9DSnUu1H0
 TbM1I/DaE/Qf6tklcTGay0hEtfmv6kQjXKDEXWUGts7k4Tcjv+uny+A8aSF4fIsqpXH7ovNB701
 kC5KmNMvb28WNbiT18p/4dbeeKnVphde/7h5GwQ1nhBXP6hQ0PMaEyAbHFBYXYX0tjwSBKfbX+3
 WTalfbutbq9FoYuOgLwtIkBmNtw==
X-Google-Smtp-Source: AGHT+IHaYFbM0rUI4BjUusDo0tdYLoiWeYOMBIGcMVKYnhIj9IzGAWcAupPP7jDwwWqglYBrcN2skQ==
X-Received: by 2002:a05:6402:3494:b0:617:cd9d:e267 with SMTP id
 4fb4d7f45d1cf-61a7e6f6ab7mr718213a12.8.1755573862186; 
 Mon, 18 Aug 2025 20:24:22 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a755f8760sm965630a12.15.2025.08.18.20.24.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 20:24:21 -0700 (PDT)
Message-ID: <68a3ee65.500a0220.397724.30db@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 19 Aug 2025 03:24:21 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755573862; x=1756178662; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Q8HSYzLPq7ZnCnC6UAP5XhmPvAnxuolZmRfBqCnBdB4=;
 b=dWh+Sbd/SwmZIQ1ENbjTlZod4kLpwS3djN+bgbs6q+LFkKik+X2UGCCbA7XhvmwFHY
 WAREnfPSM1A9794bClfyAXBYXNPEYKCJYaEEogv+rJVD4v5BAGgOIC2NaAyLuV3vTOzs
 0CvXEYPJEizh3OvNMHgWExURlSEebglO0ocLaz/yvmulHopaOFNa0MYCKcp28U3nhtjw
 YOh2N4LZAwj63WqEhqR/fgXFyxK2dJUq+aH8p2kwndOlmVYwOb7lh/mxKY9vGizGqZoF
 nAUvnBRoUvkJuAUkMsGdsZwYB5pDsEMxijVKkn07mfJizVoJPhrC/h61DFfovc/E6spk
 M9KA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dWh+Sbd/
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-18
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

Autobuild statistics for 2025-08-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  3  |  0  |  5  |
  2025.05.x  |  2  |  3  |  0  |  5  |
    master   | 24  | 129 |  1  | 154 |
     next    |  1  | 14  |  0  | 15  |

Classification of failures by reason for master
-----------------------------------------------

        liblog4c-localtime-1.0 | 9 
              libselinux-3.8.1 | 5 
                 logsurfer-1.8 | 5 
host-binutils-arc-2024.12-r... | 4 
                liboauth-1.0.3 | 4 
libsvgtiny-ea9d99fc8b231c22... | 4 
                  mbpfan-2.4.0 | 4 
        vulkan-headers-1.4.317 | 4 
                elfutils-0.193 | 3 
                 host-gdb-14.2 | 3 
     libphidget-2.1.9.20190409 | 3 
                    linux-6.16 | 3 
                    wipe-2.3.1 | 3 
                   atop-2.11.0 | 2 
                   cvs-1.12.13 | 2 
             dahdi-linux-3.3.0 | 2 
              fluent-bit-4.0.3 | 2 
          host-binutils-2.43.1 | 2 
                 host-gdb-15.2 | 2 
                 libgee-0.20.6 | 2 
              libopenssl-3.5.2 | 2 
                  libsvg-0.1.4 | 2 
          linux-5.10.162-cip24 | 2 
         linux-headers-5.4.296 | 2 
                openswan-3.0.0 | 2 
                setserial-2.17 | 2 
                   thttpd-2.29 | 2 
                 agentpp-4.6.1 | 1 
                 apitrace-10.0 | 1 
                    azmq-1.0.3 | 1 
             berkeleydb-5.3.28 | 1 
                   bird-2.15.1 | 1 
brcm-patchram-plus-15bd6638... | 1 
                 coreutils-9.5 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                  dpdk-24.11.1 | 1 
                     dtach-0.9 | 1 
                    dust-1.1.2 | 1 
               ebtables-2.0.11 | 1 
        edk2-edk2-stable202505 | 1 
             erofs-utils-1.8.5 | 1 
                 expect-5.45.4 | 1 
firmware-utils-86739f2b3ae9... | 1 
                     gdbm-1.24 | 1 
                    gpm-1.20.7 | 1 
               graphene-1.10.8 | 1 
                     grep-3.12 | 1 
              host-guile-3.0.9 | 1 
 host-softether-4.30-9700-beta | 1 
               host-vde2-2.3.3 | 1 
                  iozone-3.506 | 1 
                       jose-14 | 1 
libdbi-drivers-0bfae6c43134... | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
             libgphoto2-2.5.27 | 1 
                libkrb5-1.21.3 | 1 
                 libusb-1.0.29 | 1 
                 linux-headers | 1 
        ltp-testsuite-20250530 | 1 
                memtest86-7.20 | 1 
                    mpir-3.0.0 | 1 
                openvpn-2.6.14 | 1 
                p11-kit-0.25.5 | 1 
      passt-2025_06_11.0293c6f | 1 
               pcsc-lite-2.1.0 | 1 
                   perl-5.40.2 | 1 
                s6-dns-2.4.0.0 | 1 
         s6-networking-2.7.0.4 | 1 
          sane-airscan-0.99.33 | 1 
       sp-oops-extract-0.0.7-1 | 1 
               syslog-ng-4.8.1 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 
           xtables-addons-3.24 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/c0562c8a9519540d179f45687d4c8aecd005ddf4 |     
  mips64el   |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/2267f84f10d2a7db9d03d4388920a5a3cb7486db |     
 microblaze  |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/7c712ef16e05d0b00fee837508b5beacc8dfdb41 |     
    i686     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/1344c77026e22a962b6eb50482d18adfed14ed05 |     
  riscv64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/480e0e71940aab51f7ea535c7e16f36dbe0c0cc0 |     
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/5d7d1a35e09cf6b3120816af5633a9531e49e7ff | ORPH
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/4f23d2d13fe303218e73bc9b5ee84a53bccddbb9 |     
  aarch64    | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/dbf7d9d696b1f8de37ca8aec1d70ec73d8c65b7d |     
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/78e47d81c776ab55ce17662e189cdb43d8b54df8 | ORPH
  aarch64    | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/41893000cb8a1f8a22d149807e6ab2af747ebd8b |     
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/65b57f4776588ccc26dc8fb6c6f7bf8588810cdf | ORPH
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9a1e9c95ba3c351123a96c6205e502ca6c39b54d | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/799d5b4a282fb35e87f54fbca536ae2c25991107 | ORPH
   xtensa    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c82c7386c4202b4121116b5ff9bf4dbc271f067b | ORPH
    sh4a     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/d08b15e9291165d5d58ff7d52cfac0d325f606a1 | ORPH
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/35ca42fb3a57d63288157d71f13512825c7a9d05 |     
   xtensa    |           dtach-0.9            | NOK | https://autobuild.buildroot.org/results/d2d0392fcea876e49b8cfb562f82830ff583b753 |     
    arm      |           dust-1.1.2           | NOK | https://autobuild.buildroot.org/results/3d6ee2c06072cbff437c30dd17e2f065a3e73cd8 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/7a9dd84e2a9e6b56ead8a69f2cad420ba3831407 |     
    i686     |     edk2-edk2-stable202505     | NOK | https://autobuild.buildroot.org/results/a33b02a89365d7756f2e4756a2eee40c487136c9 |     
  sparc64    |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/00f72b8aec9ce0e30cc1ed1c80e74e0c4b6083e8 | ORPH
   sh4aeb    |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/154866107a001fbf7a9b0e2ffc4e42611a6dd239 | ORPH
   xtensa    |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/02fcbc0d71990a49ebc0ecf444efa7fa9f2f5c01 | ORPH
   armeb     |       erofs-utils-1.8.5        | NOK | https://autobuild.buildroot.org/results/8660df701d39ff857131efabdbd278df05af1aa7 |     
    mips     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/d3e95b089db1b9871b4965bb05367abd3aaf4f31 | ORPH
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/e79d7de7c69347dedac9bea9a2dc00929d428e97 |     
   xtensa    |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/cc16c71667ed4bc7bf894206e39435b71cc3a976 |     
   xtensa    |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/f57d5cbb92ad55feb0c9ab7f677aac5e205c9f08 |     
powerpc64le  |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/f097b49053a0730b7767035cc636bfe5f84658f1 | ORPH
    sh4      |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/94174210d20c62d22497b4f02398e0b01a8d1a2d |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/5aa76babe2f11c8a7c85326b676285e750a21b62 |     
loongarch64  |           grep-3.12            | NOK | https://autobuild.buildroot.org/results/2d2bcd86f12d070b7ccc16e24b01a1e195ad69ee |     
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/646ea2bdcf82f862a6ef6832d30fd3fb53e99539 |     
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/caac24c27946a550d6a07a34554cd651ea2858af |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/33cb304a3b910ada1739fe14398b11254b78cd68 |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/c3611bd789a94bbb6d39f046b6cbd9a110d38794 |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/156a92da7fb6b9031c251f0ba32bfba65b560a1e |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/3e1873e585320a7a9d8a696324916b55d85dae5f |     
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/aa4dd277dfc93864949d993e531ae765fe5e0f46 | ORPH
   sh4eb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/bb103f3bbc5049cf0e160d4b016893611adc16cd | ORPH
    arc      |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/33bac3e1964a011cc6234e5682d26bf40a083126 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/2a7ede0b26140201a3029a78592eefbd7f865002 | ORPH
 aarch64_be  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/cc52ed2659bea242dad21e42907f7af7150b5ec6 | ORPH
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/ab657b5a76218be6530a18fbb65ac615a7e46d2e |     
microblazeel | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/b4914798888b2f8be67c50de2a04854d8a6146f8 | ORPH
loongarch64  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/3af3891ac3496c4ad292b5194e7e6da1a42a6714 | ORPH
    arc      |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/653e7d56c26641596eb4c15618d1bd834d388666 |     
loongarch64  |            jose-14             | NOK | https://autobuild.buildroot.org/results/6fbe0494a4d24e33b8e2888521fab48645426857 |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/539f4c0f93ea657cf22858610ee7ed14b98a67d5 |     
   arceb     | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/760d63b8c3ca154147ea084a48f6ee948a2d3c93 |     
   arceb     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/6934459183a1c62a375907037fa82fff103362e2 |     
  mips64el   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/4405700564d269fa11ce353f0c796d55e8b64aaa |     
    i686     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/60bf62b5486f1accee70a3f9e3542141c6a900af | ORPH
    arc      |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/99bd0cd11fcfad7c1e5a53580599c476a2e8c5b8 |     
    sh4a     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/1c1864457340967d6ad881b7ac4fa251e2f1a235 |     
   mipsel    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/d5d99f5ce152728eea9448f433f7b08670adc655 |     
powerpc64le  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/bb619e5e5c3dc2118b25f5c414496e7624be5e33 |     
   arceb     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/dab64025e6a1688d5fadc2b9bd3738a2c886aa9c |     
  aarch64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/22e8ab8252cc2c7ac33e6eb657d1287eafa98c39 |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/3103a30d15cb9f119e1ccbb093dd3922e90697ed |     
 aarch64_be  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/4c044873d6059ff5809de4ffe1c2d843657f6815 |     
   s390x     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/4256d81c3e8f90d24df31e71b9565d0afd3841c0 |     
  mips64el   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/e7ab005bfb13656276a7e0b9a2743277f6c252b8 |     
 microblaze  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/1d74a8f28844e3ef90df2e76355d64d502980663 | ORPH
  mips64el   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/3e008fbb255c18951d31b6c25ffa352e098e7161 | ORPH
 powerpc64   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/4651ff773ce7b0415d9d3fbc0bfd60d55cbe1f82 | ORPH
    mips     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/9de4603d26fd72b6bcbbf74b7b18556109d2104a | ORPH
    arc      |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/914f0d5c70c30d28a6e83d2093e690562272867b | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/61c1fa721a1f20556bb061c64216a0e02ae29bf2 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/cb4650565350c5d0f9e37ce8edba0ad98073a388 |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b1ce995faebe17c771d6758c6406d65f62291707 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/87e44fa3be63adbb5c793ccb32892ee86223f8c7 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/76dad1d36f8f303dda38bd0751be13536b9be66b |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3605cce4a7c3b3a0284289f19a13f834c5b2835d |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5d56dac864f7adee36c4e60cffe52da8f9b3430f |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/80f988edaf6cc41963cb65155bbc95db77e9f163 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b981468d2dfc79005895ff4bd8a2212336461633 |     
   sparc     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/ea2eddf2b240771b6b7765c7415e54c95aa33656 |     
 microblaze  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/01810bbd3143b935eda1a5829296a3aca1cd4c09 |     
  sparc64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/24472d73dcefae09c45f700f0ca433e5ae6d1c35 | ORPH
   s390x     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/95b8be857cec582d7dbd48251079b45fc7073e56 | ORPH
    mips     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/c3d703663faabe40448d908afbdbb351a016aece | ORPH
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/94bd9ff3f36b1cc640fcee234856d95cfe3fed38 | ORPH
   arceb     |         libusb-1.0.29          | NOK | https://autobuild.buildroot.org/results/0a69b637dfbf45d46a3317bacae0ee49fc526356 |     
 aarch64_be  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/333f66c986ae4d68d57f68b3c2653b26059b8070 | ORPH
    or1k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/3a5573f987d4854ed43c7738e8abfe48c15569fb | ORPH
    sh4a     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/d8cd4bf17177e22232177a08276c326ca9880bfe | ORPH
    or1k     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/1a739eee39bdef8986279a9e21f8637fbe263353 | ORPH
  riscv64    |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/acb62b7a486f3f8e99c6cc2b52b0c259bfa18a0e | ORPH
  powerpc    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/bc9d6c4b1180317b35f53f0835e2cf3161393cf6 |     
loongarch64  |     linux-headers-5.4.296      | NOK | https://autobuild.buildroot.org/results/b1ecbe434a8d1a7e779aabf1a5c6c9c19d7075b1 | ORPH
loongarch64  |     linux-headers-5.4.296      | NOK | https://autobuild.buildroot.org/results/35b134fd969fae29a48b3c1f320ee92cae4e1d77 | ORPH
  powerpc    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/a4b2772084ec0c0ebf512f712c6062148556aa7d |     
   mipsel    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/241b920690b687f5c6a5117a25b55761b78dcefc |     
   mips64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/8d8f2a6e2c22c8bcb9e2f0a87554a954db06c5b0 |     
loongarch64  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/376d0953ba85f94b3db748b5b1a2faf1a743a759 |     
 microblaze  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/e0d1e0da0f9afcd05149ed740b42690c42410bae |     
   x86_64    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/a0b32ef4a58ef50ef811e4508a47c9b728a27660 |     
   sparc     |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/e4afd39242aaa2b543abf2341787abaeb4aef2ba |     
   sparc     |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/8479b3b13f15ea991432c5760c89a1facac03302 |     
    mips     |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/ea07d742a0128002ea384a0a1a19ceafa0df2c23 |     
   sparc     |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/7474090d84f2a822b3e70e94c750de807152fb1a |     
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/2cf4fbd1415033a8ab87e98272986868fa491ffb |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/32243dd7350a3e472a3d71eae3b509697742e616 |     
    or1k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/4f5e04ebe1b87f8cc50a14cb2dd906573281e16a | ORPH
   mipsel    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/f17d50e650aca9d7dce05d73f4af479fe1f42f19 | ORPH
 microblaze  |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/fb2cd04cade2019d574a110d99cc63afa27ae630 |     
   mips64    |         p11-kit-0.25.5         | NOK | https://autobuild.buildroot.org/results/005869ed802498e12d1f97bd433d0c8373c04379 | ORPH
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/66fb8651cafd4c9aec8c2d5cc5359bf8652d6af8 | ORPH
   arceb     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/22e56447926eea59fc2250337cd47248deb96eed | ORPH
  powerpc    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/8a07304c44a0bebdd70b9c9296dfac12eb2a0b54 |     
    or1k     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/5fdab36ae705025eca8522cae7e5a938e66b761e |     
  powerpc    |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/840d351d927cbef660d5876e899ea6c4f6ee34bf |     
   mips64    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/95302101d90a330385019a55526baf324daa20d3 |     
   s390x     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/1734f75225f4e42523ad1e594c34989b67b8d68d | ORPH
  powerpc    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/ff7a9c3c42f11a2ab71fb04ff0f6d593ac9ee327 | ORPH
   sh4eb     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/2fd9434a384456fd5421be69c3403e2434604d5c |     
  powerpc    |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/b6a9a6c8ab3489314c78250ead0a6783f7bef05f |     
 microblaze  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/a570e52632c550851e978f6f072fb13efbe120e7 |     
powerpc64le  |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/57639b845338a05bdb179abf3297766951fd498a | ORPH
microblazeel |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/975c61a4bc6dce60399a88e8a803db5a91a8b327 | ORPH
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/7151f58962e9137d5dd5730920b1a07ae6b909c3 |     
    i686     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/3b2c7b9244f726210f8855b21def6be71eb5fbd5 | ORPH
 powerpc64   |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/ac2f2e496c45bd61cea99ea727aadda1ebc5563c | ORPH
   sparc     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/c0373da0dd0de0dc99d66f59886b97594966f358 | ORPH
loongarch64  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/b749d2d46fc456c1d280a5831ac95dd4e26bc378 | ORPH
   armeb     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/2ad0605b1f0df48b4c4253c44ebe870b5d273176 | ORPH
 powerpc64   |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/22c9a1e4892e1dbc15722f9db05be4a90aba69f7 | ORPH
 powerpc64   |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/0bfbb2c75fbd886da5b65ede2c7d0b204b960eb3 | ORPH
  sparc64    |      xtables-addons-3.24       | NOK | https://autobuild.buildroot.org/results/eb6b5353a16bafedb5008699d475fc4a11af195b | ORPH


Classification of failures by reason for next
---------------------------------------------

        liblog4c-localtime-1.0 | 2 
                liboauth-1.0.3 | 2 
               bctoolbox-4.4.8 | 1 
  distribution-registry-v3.0.0 | 1 
                 expect-5.45.4 | 1 
                     gdbm-1.24 | 1 
host-binutils-arc-2024.12-r... | 1 
              host-rust-1.88.0 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libkrb5-1.21.3 | 1 
     libphidget-2.1.9.20190409 | 1 
                openvpn-2.6.14 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b7ef1d2ff16a3226a4245226ab694229123986c1 | ORPH
   x86_64    |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/415d2f3d10f0246c804480fb22d6f4091bc4b65f | ORPH
    or1k     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/41ce38c8e4470ced3efb17091e9d38ad4ef20a79 | ORPH
   s390x     |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/0f39fa2a771e0b730dc107c72dddd7b5d0d396ec | ORPH
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/3c35b49abecda6da62d0e9f0c569aa5a5eb84286 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/b764174fde53fd8445168090b026eb3c6a1c682b |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/474846390e5c8eb0162a91f4d062f2c4144c9820 |     
   sh4aeb    |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/8d070fa77cfbb116e95a4bc2821a8138c541eac7 |     
   armeb     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/ad33c460ec2c92706f6a930e322497aad1b46bb0 |     
 microblaze  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/0996c13eb4ba136705ab463a033be036ecc8c241 |     
powerpc64le  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/8694ece6874a5fe297e707b12af85eeaef227675 | ORPH
   mips64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/99b2634f25e68898576c86f3cf7f0f887c5b10d0 | ORPH
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/dce028b83971a0f062badb6af4fa7895899ee0b3 |     
    mips     |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/30ad6bc12cd4ab8962c7404f933d59ffedac66ae |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  bitcoin-28.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
       sp-oops-extract-0.0.7-1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/2d9cca188b901423b3467cd7b73009119928ffd6 |     
   s390x     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/80aea71f8d5391f0df4fe92bf82065f7f207f2c3 | ORPH
 microblaze  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/310f6858a8883fd679daeff8e615c403352c9a58 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

  ffmpeg-n6.1.2-27-ge16ff06adb | 1 
              libselinux-3.8.1 | 1 
              mariadb-10.11.11 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/3d1230a4811402c61779ad768a9eb9795c19e3d6 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d235a032e99e1240ea2fb5285b0000f70fdf91bc |     
  aarch64    |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/e1fed5aaf22ed1aa59d112337998cb787a40c085 | ORPH


Gitlab CI results for 2025-08-18
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295200 | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295166 | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295077 | ORPH 
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295064 | ORPH 
                  TestZip | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295061 |      
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295059 |      
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295055 |      
                 TestZbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295052 |      
               TestXvisor | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295047 |      
             TestXfsProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295046 |      
                 TestWget | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295041 |      
               TestThttpd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295030 |      
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294980 |      
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294894 | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294887 | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294872 |      
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294871 |      
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294856 | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294841 | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294837 |      
          TestMicroPython | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294810 |      
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294802 |      
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294792 | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294772 |      
              TestLibCurl | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294712 |      
            TestJailhouse | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294698 |      
               TestIozone | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294689 |      
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294663 | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294659 | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294658 | ORPH 
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294651 | ORPH 
    TestFirewalldSysVInit | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294650 | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294603 |      
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294602 |      
...mdRwIfupdownDbusbroker | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294599 | ORPH 
...emdRoNetworkdOverlayfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294596 | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294594 | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294587 | ORPH 
...mdRoIfupdownDbusbroker | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294586 | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294585 | ORPH 
...yfsVarBackingMountUnit | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294584 | ORPH 
...erlayfsVarBackingFstab | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294583 | ORPH 
...SystemdRoFullOverlayfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294582 | ORPH 
...emSystemdRoFullFactory | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294581 | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294580 | ORPH 
...InitSystemOpenrcRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294579 | ORPH 
...InitSystemOpenrcRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294578 | ORPH 
...temOpenrcMergedUsrFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294577 | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294576 | ORPH 
...InitSystemBusyboxRwNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294575 | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294574 | ORPH 
...InitSystemBusyboxRoNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294573 | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294572 | ORPH 
               TestYaffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294571 | ORPH 
                  TestUbi | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294570 | ORPH 
 TestSquashfsMinBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294569 | ORPH 
 TestSquashfsMaxBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294568 | ORPH 
             TestSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294567 | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294566 | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294565 | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294564 | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294563 | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294561 | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294560 | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294559 | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294558 | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294557 | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294556 | ORPH 
                 TestF2FS | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294555 | ORPH 
                 TestExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294554 | ORPH 
                TestErofs | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294551 |      
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294548 | ORPH 
              TestGitRefs | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294535 | ORPH 
              TestGitHash | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294534 | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294508 | ORPH 
          TestGrubi386EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294481 |      
         TestGrubi386BIOS | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294479 |      
         TestGrubX8664EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294477 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
