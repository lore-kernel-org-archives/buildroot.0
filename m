Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1F2E7716B
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 04:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEC3F42B89;
	Wed,  4 Dec 2024 04:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHV2YvZ7BS_n; Wed,  4 Dec 2024 04:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F419B42B8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F419B42B8A;
	Wed,  4 Dec 2024 04:18:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DA04236E
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 04:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EACFE42B73
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 04:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anlkV8mS9uJX for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 04:18:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EB63641E92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB63641E92
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB63641E92
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 04:18:14 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa5325af6a0so888501366b.2
 for <buildroot@buildroot.org>; Tue, 03 Dec 2024 20:18:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733285893; x=1733890693;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tXDfYLuwnLklFfdpGyjojtL383VcaAbn3DclZ2490Ag=;
 b=OWfVLLra57sDGbXshkfOqeJspLWIKJgyyRmGF6f9/EId6ADS8EJYBLMVMgEAjCGi87
 wNsEn8nj/epz8nGKCCH4k2KN+GM/U6f+bhEPNphS2EDgXNOEvd9dGaWmr8dPivCLwpGw
 6AfmOJikIB6e4MNCzhxWmlT4ePbiy2DBxatQ/CeLFKsQ9J3rRnzy+S8ZODNuavq7iM5N
 Up0fXfj1BWQnYIP+L8Ju1gFhpNzamLePQ9fUcNH5VIIW/GTk56Dzu+Ad7fPaGuMthR2K
 uU2yy/HwsSdrt6PSYdgccVTf1Aw5gJ7p0giO2NC6/uXB9OESKhR0sLPxqI9ijgOY1y7n
 borQ==
X-Gm-Message-State: AOJu0Yxf4aUWeT2gRh2m3ZF0LHAKskkBKkwW/GQSSjAbDGj3mbgxK377
 7/GhmVKXSZ+om7BaB7rvn14Ziq2K/6rrE1gXKuE2Ec0Bkoslh5y0OpFkSQ==
X-Gm-Gg: ASbGnctKyO8wD4+VG/4IDwzaBrkYgG+ymLRX/m+jO2i40aMuot/82cC6U0iq880OWNv
 MeOxwp5bsTjJlBt5ENBcrYvLZGgVUlsz/iRKDSs50RTGpfAexjC0Mz+tWG5Mp0xivtPAjiFSH/p
 IeYJ64NKsAlPogFzc9xg9Eg8nLLIuNRGZMdnTkh4QH52jCWBge3xdkPLHRhjFFjEfqFIrTMrWIx
 aipzNp/dBCsDvOC3YXRUT2gPwY5FqGI3ldbq5dDIAASaLku/p81dQ==
X-Google-Smtp-Source: AGHT+IGwYuwcGsBwkvj5NdT/M582W+hAuY73f7VENdCe/iDCKkYYDkFbIH6Wx3TroLvamfv6eemytg==
X-Received: by 2002:a17:907:6eab:b0:a9a:3e33:8d9e with SMTP id
 a640c23a62f3a-aa5f7dab9d4mr529203466b.28.1733285892716; 
 Tue, 03 Dec 2024 20:18:12 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e6491sm687757866b.101.2024.12.03.20.18.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 20:18:12 -0800 (PST)
Message-ID: <674fd804.170a0220.30966.dac8@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 04 Dec 2024 04:18:12 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733285893; x=1733890693; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=tXDfYLuwnLklFfdpGyjojtL383VcaAbn3DclZ2490Ag=;
 b=hXHEqj9F+xtDRfVV/Z/1pIVBelih5aoxRS/GLLFpdSeZ3CAsXIYyF1Gdgz3luoSvqO
 rvBEgsXoQ7I9dXt5utChfRpM/6xjhAT/KYdO5X0+LwWyrP3aAiNqUK44dL0G2+ahUT0O
 K8iKxq3413cymQENZmLtk1H2U6c5wpOYGJ3GrI7f+y7xc/uP4VhZ+ibhhW9aop3YJn7V
 /+VdT0/6a/R1xMKzFzj4p7xZVqAb//GYmhUsX9A9K7P5y61vvI/h885IHxqrceonm8dl
 FlLrpHtpdv7AiBTuTztjffyDIio5+0ye7X7VohLrFfeJ1vrKOxUqJIV6RiRLXhmQ93Qi
 SkLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hXHEqj9F
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-03
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

Autobuild statistics for 2024-12-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  0  |  1  |  1  |  2  |
  2024.08.x  |  0  |  0  |  1  |  1  |
    master   |  9  | 61  |  1  | 71  |
     next    |  3  |  6  |  0  |  9  |

Classification of failures by reason for master
-----------------------------------------------

                lmbench-3.0-a9 | 7 
    host-python-greenlet-3.1.1 | 4 
            host-binutils-2.42 | 3 
                 linux-6.11.10 | 3 
  gobject-introspection-1.76.1 | 2 
              host-rust-1.82.0 | 2 
 ibm-sw-tpm2-rev183-2024-03-27 | 2 
      python-autocommand-2.2.2 | 2 
                  ramsmp-3.5.0 | 2 
                       unknown | 2 
             util-linux-2.40.2 | 2 
               alsa-lib-1.2.12 | 1 
                    azmq-1.0.3 | 1 
                    bat-0.24.0 | 1 
             batman-adv-2024.2 | 1 
                  bcusdk-0.0.5 | 1 
  binutils-arc-2023.09-release | 1 
                 coreutils-9.5 | 1 
             dahdi-linux-3.3.0 | 1 
                elfutils-0.189 | 1 
                  ffmpeg-6.1.2 | 1 
         gobject-introspection | 1 
               graphene-1.10.8 | 1 
               harfbuzz-10.0.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                  jack2-1.9.22 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
               libdeflate-1.20 | 1 
                  libsepol-3.7 | 1 
                  libva-2.22.0 | 1 
               linknx-0.0.1.38 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
                   pcre2-10.43 | 1 
               pcsc-lite-2.1.0 | 1 
                 pixman-0.42.2 | 1 
               procps-ng-4.0.4 | 1 
               pulseaudio-17.0 | 1 
    python-cryptography-43.0.3 | 1 
           python-daemon-3.0.1 | 1 
             subversion-1.14.3 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        alsa-lib-1.2.12         | NOK | https://autobuild.buildroot.org/results/58113f70da5f8e91cb28274aa64eccf0eec81204 |     
  powerpc    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/7ba995aa9109f32bbd3187134a71c4073b282c67 |     
   x86_64    |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/07050a037d27bab488f2412894ab8357798aa882 |     
   mips64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/f08df73001dda99ce9c18186def22286c8f8e5e0 |     
    arm      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/5cbab1b52d1f17d9fc497cdbdc390b94ad2aa8a6 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/09e5aa1f333d62976f290a490a3380493d01e271 |     
   arceb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/4ba839fd911fcf6d4190c7011d3f859d7170bdae | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/32df09485e6ad8376455bbc712512feff69fbdc1 | ORPH
   mipsel    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/ebc1bbc7148137e10784408b739485b778058102 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/dc3778af9504fc93a40a1b246a5bc6f4ebaa6353 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/b79aa80e58f468f046ffeafccae4d29d461113b7 |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/31ad31a6c3dd38f968ac6aa4425054c1a2b3328a | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/14a99ec9635f4057d412ecbbd2e7852391c8ff91 | ORPH
 aarch64_be  |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/c2237b42c5c31b6e1c812e68278541281596b733 |     
    mips     |        harfbuzz-10.0.1         | NOK | https://autobuild.buildroot.org/results/6f7063ca3dc8c8c94815124cf68f16b93dff9ff5 |     
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/0a301ea7e0dfb661aa146fb547ea2ff3ab64aa6c |     
    m68k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6f78c11856f2bbb0e6120e923b51c4ed265c4367 |     
    m68k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/043f82fd1da19b7519892de8902b064e23732978 |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/2b74c3d2cfe9ffeb826f4d4b458246cb6ef9bfb4 | ORPH
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/46a88a3c16d81fa70417183c217d1c62afd2252e |     
   nios2     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/add34ab38ae88c5d3ea1506fe21972b89efeb79c |     
    sh4      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/378b7e8e5bb0c0a1ec8b8bdd02c74b178896fc8c |     
   mips64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/c32c48deedfa6d014b788d2e0fdab62cf6b87cf6 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/66ca4f651009b71d87b028c19a58d1819bcbe890 |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/935619eb4513a67b442c69a93e924e02e081d7f5 |     
  powerpc    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/33b93a9cabfb155c93f5e40353da542be8c5e75c |     
   nios2     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/48910ca202e1d0ae417731c954a15c89d9d560ca |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/c447eb11106b50e3fb9e812cabd2f7cf0d45e483 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/1c4f641dd6d1a3a4dad389e5ddba70258eeee4c3 |     
  riscv64    |        libdeflate-1.20         | NOK | https://autobuild.buildroot.org/results/44337ba760fdbfabff9db956a217b4159d86851a |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/ca2fb8b263f5b15e1b1232d1a2767ff3f4c258ae |     
   mips64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/450f354920db6dfdd0c7e5ee0a103d1222c496e4 |     
  sparc64    |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/87dc4cdeb3a8e1f6e50506f4101981f12fe49a7d | ORPH
   mips64    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/86c00c36f555f9161ded4c4d1184d1c66a5ec6d6 | ORPH
   armeb     |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/7d64457cefb123ad6c396958c71c0d7c50476f83 | ORPH
    sh4a     |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/4f6ccff45090879089505d23b391fdc382309c8a | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/2f5a34f5e806dc17ea5f5f31820f237d4ef80f0c | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/6d8c105d7583354fe3d68c7b9dd45a6517d13e2f | ORPH
  sparc64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/7c2f61d682a99cb5a0015146f61e458d16a7ea0a | ORPH
   s390x     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/d750308c94fea41fde491260ac5fd84a131da537 | ORPH
   xtensa    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/08098a5df383462a9c10bec005c180608026d831 | ORPH
  powerpc    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/518a5de9ede78a9056e2d8f5cd2db188314c80f8 | ORPH
   sparc     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/d6b3e1ab05ce677823fc86f2b64aa719b9c6f904 | ORPH
    m68k     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/2dc2d94ba69a7cd401186f31a3104972e6fc3a97 | ORPH
  mips64el   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/cf32c17f01bf9f5d6751e48db5041d98aef6b664 | ORPH
  mips64el   |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/a2de49ca08b277f0b980a97e16629accf561d3c7 | ORPH
microblazeel |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/6cc4664829817240cf3015a69c97614590c7b79a | ORPH
    arm      |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/7e92ee14f714e1699458ea8c9f16ae5cc2f743d9 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ce7ff3a6354b5d31dd2fff5160c54db9a56dd8dd | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/9a97d56d00241fb3076ef86b7ac2d06a4062ce38 | ORPH
 aarch64_be  |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/069212f068ded7b747ed76f9f8e5c0f99fd309cd |     
   sh4eb     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/5c7b5b7345f95b2f4d5d1b8555f87faff03f1ef1 |     
   armeb     |   python-cryptography-43.0.3   | NOK | https://autobuild.buildroot.org/results/e0c68c520d4a54d6f2413715722aa1afbf6ee4a7 |     
   sh4eb     |      python-daemon-3.0.1       | NOK | https://autobuild.buildroot.org/results/c901b7fcd29dbb69a14e44e504b515b5b16f9a54 |     
 powerpc64   |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/f1824f0097c68984ba0a58102a84d1a61537008a |     
 powerpc64   |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/d909cef199ac15e0d6808c4e72c077e11f9a9c27 |     
   nios2     |       subversion-1.14.3        | NOK | https://autobuild.buildroot.org/results/0a6960e78ca733904011c777108280bfbbf2fe24 | ORPH
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/5fe46c6375bebd426138e9e057a4f90fd684d73e |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8af4e67b7769a9c840327f18d960a5166a74e6c4 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d42847079811e52da580a2685f8ec88052988084 | ORPH
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1a782a0e03935ee251bea9a92ac5333dcb670e79 | ORPH
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/4969019e5c7e941d771c7c125a520fc9292c53a8 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

         gobject-introspection | 1 
                memtest86-6.20 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/2d7718bcd962998b84c7e4695680fe06eb439ebf |     
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/8cca190b48cfb83a0d2ada0239ecb2fa7a7ddb24 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

         gobject-introspection | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/0ece4b5a8c1f61abd0c6d7b427e5d79319012836 |     


Classification of failures by reason for next
---------------------------------------------

              fluent-bit-3.1.3 | 1 
            host-binutils-2.42 | 1 
 ibm-sw-tpm2-rev183-2024-03-27 | 1 
                jemalloc-5.3.0 | 1 
      python-autocommand-2.2.2 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/dd81993ea6ab61facf2b366f45a14f8c5cccbe45 |     
  aarch64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b17aa940084eac22ee220830762090dc66497306 |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/efba0d9c6b959018cd5dd2f2f4b7e2d6aaba3a35 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/1b2ec3a9740a2b0f87c2ab00ec9a697c7972d643 |     
   x86_64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/dd7b89c28e020b8cc916cae931c01c56b5b4a426 |     
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/7d6b05900337989edcaf0f20a4237340049bd764 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
