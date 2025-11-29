Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB93D116EA
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 04:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A1F983896;
	Sat, 29 Nov 2025 04:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9b5CHpcmisx6; Sat, 29 Nov 2025 04:20:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F20682BED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F20682BED;
	Sat, 29 Nov 2025 04:20:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3526C708
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 04:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5FC960642
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 04:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9-IvJmFwYOL for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 04:20:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 24479605EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24479605EF
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24479605EF
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 04:20:37 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso23590365e9.0
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:20:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764390036; x=1764994836;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YR5hMrUxvV5QwV7DLI1vj7dmGAJu9Ej1ic5ePtrepbI=;
 b=HMKbrgawGaUr1+mr/TPyFTWv112oI5SSpdSDzCqDfnK8+qo4cF1dRiGcKvnZG8vPZU
 ngLl5+1mss79IWoL2P5neSIiY/PNZw0k691ME/0GDOorOXCc4oczRhgGHGbAfNcZO1Ib
 f1jqjg0vxZmVbxxMrI92XQrOTptO1Nw1vTre7oR6gQUQSciM35Funt/sOLTjDJ4xDBHz
 s14YcE6omOGo2BI81tfA4udrpmnFFrC1n0Ov4esvJyPoBu/eEMS137qhRda20DJDOZi0
 8qqvMD23BNDSZ3ozDdDGl0pee8SxJ1OqOW7df6tS+bhSJnH1exApF8oN1enZE1EuMhSv
 sc/A==
X-Gm-Message-State: AOJu0Yy2CBFj/tJusldXyhyKE2O1IJFO/C32zIEIC5eZbHJay15x8FGL
 M/5eN7FPm0UbX4p9WE3tiuj1w6MuiS/58JPrt9SEoZd1zSifTzg9kmQcmUttvA==
X-Gm-Gg: ASbGncu+5437Qo1HAFiSXw6/yPCcy3cdwfukjN9f/npukJzi4sThmqWQvkOcu1b1Ndi
 i4+LOfibViBj9jM6XAl28lH7wawTU7R5ja0QcAmQK5B/Q52CY7RLO3dYobhjQIcaSzAXbo3zO9j
 aKb7esV2ojiH09p6RgJsuAc9WMWezRpGqIgFPV1AiR10PpDlmjzoxM+TuHOlaQU/alg/8nj0Yyr
 rfc+oDM8d15KNUMGq/k4QdHM8SNOwaOTo0dB/e8KpCPqE8zYj4w87kFGO7AXeRmu9qSI0BIlwqc
 b7Q+mk/yQYsxlDo5CZ2LiFXjbdd9/t/9e6XCbKioBNNTpkB3v0mWKYKIKzVepCmcsfAmjsZJONi
 Rz6CRSEmDh7iUVU3bDCngN7LjrX6yh6SY3cu48l23hUshUP6KROhlHFDa6/uj8Ioxx/AgwBOepx
 /1zsadnVFTOb3h4gSVZA==
X-Google-Smtp-Source: AGHT+IET4G8+KAlM2bBZAs6cjEfq1e/Eop4oifhti5oAL9sE+LLPt9145zf4UNMtql5+lFB3Z0k3vQ==
X-Received: by 2002:a05:600c:45c9:b0:477:af07:dd1c with SMTP id
 5b1f17b1804b1-477c0212123mr319657085e9.35.1764390035694; 
 Fri, 28 Nov 2025 20:20:35 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5e3857sm13661798f8f.19.2025.11.28.20.20.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 20:20:35 -0800 (PST)
Message-ID: <692a7493.df0a0220.37aec9.5bee@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 29 Nov 2025 04:20:35 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764390036; x=1764994836; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YR5hMrUxvV5QwV7DLI1vj7dmGAJu9Ej1ic5ePtrepbI=;
 b=nbjLBxwhsJnVocXSeadw3y4lue6QzgQT7BYXQR3mVPCHubtwz/hfUND25eJEf9Kqir
 R+EnlLvlUQXesMcMLR1dZGsuZ2wGR4AT57oYuLe9OOfdXrr5b797MPMV1b9SZVdxnpr+
 qGrpoTFJ+EMVYzBeLLZgN+qAC/AKfPsqoHD6F4uu59R4MBAop4xrioD4nEpnMLIOkQwg
 c/T+ir+kFXLVJ+PU3sT+ZA/H15pRrFsjOpZ+onwPSW4kVgxRioN+ID46T9J4BDwcSLBq
 m9R9x1KIyH+2T2u7qKJ0tV/5KuBzKgQSlCMBJ/FtxBMlr/MnN7GeyjC1ys+HMJiY6fPL
 EvFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nbjLBxwh
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-28
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

Autobuild statistics for 2025-11-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  | 10  |  0  | 19  |
  2025.05.x  |  2  |  1  |  0  |  3  |
  2025.08.x  |  0  |  1  |  0  |  1  |
    master   | 44  | 64  |  0  | 108 |

Classification of failures by reason for master
-----------------------------------------------

                   cvs-1.12.13 | 6 
                     kbd-2.9.0 | 3 
                       unknown | 3 
          aardvark-dns-v1.17.0 | 2 
               asterisk-22.5.2 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
  gobject-introspection-1.84.0 | 2 
                  iozone-3.508 | 2 
                   libcap-2.77 | 2 
     libphidget-2.1.9.20190409 | 2 
      passt-2025_06_11.0293c6f | 2 
                python3-3.13.9 | 2 
               valgrind-3.26.0 | 2 
amazon-ecr-credential-helpe... | 1 
           crucible-2025.05.28 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
             drbd-utils-9.21.4 | 1 
              e2fsprogs-1.47.3 | 1 
                    fcft-3.3.2 | 1 
firmware-utils-86739f2b3ae9... | 1 
freerdp-2.11.7-18-g0ee17e2f... | 1 
                 host-gdb-14.2 | 1 
     host-python-maturin-1.9.4 | 1 
                  jack2-1.9.22 | 1 
               libcgroup-2.0.3 | 1 
             libgphoto2-2.5.33 | 1 
                libmpeg2-0.5.1 | 1 
              libopenssl-3.6.0 | 1 
                  linux-6.17.9 | 1 
        ltp-testsuite-20250530 | 1 
            luaossl-20250929-0 | 1 
                    mpir-3.0.0 | 1 
                netdata-1.37.1 | 1 
                nushell-0.96.1 | 1 
                oprofile-1.4.0 | 1 
                  pdmenu-1.3.6 | 1 
                pipewire-1.2.8 | 1 
                    sdl-1.2.15 | 1 
                 skopeo-1.20.0 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               syslog-ng-4.8.3 | 1 
                tpm2-tss-4.1.3 | 1 
                   trinity-1.9 | 1 
           uboot-tools-2025.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/0c159072513e8afd7f81a2186fb4a6487e39c917 | ORPH
   armeb     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/54c16397279099004f1daa95377e3616fca94d3d | ORPH
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/3abc66b30543b6c9cbdd3e39e43ef6acf0c02493 | ORPH
 microblaze  |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/bab2c8b68790da42838f6bab487ed437209f0780 |     
   sh4aeb    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/54cdcdbefcff196d56acb1e48b5011f944bdf8e0 |     
  riscv64    |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/a1a4f3b4db4299772e1dd2f6d00866ad878c002e |     
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/109119744ae887cf3c2573f1d939d3ed7543b1e3 | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0b756e60a54e0bfb695fcd68761d57df8fdfe094 | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c0414aa4d0f4b595671a13d63f94cb4d3965ad2b | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/90dbc54beb84606a258c19247bfe216e107755be | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ae05975bc4a4507d6d4831121678697fa6d8f2fe | ORPH
    arc      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/35c3849f3ddbe43dec447d3879412c83f0457d5a | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/48d36a27a7649cb7c6b5599a76b62fb177456195 | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/299c1291dc496c4468793bceed784a4581df7464 | ORPH
powerpc64le  |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/abd9fe3f8b8051b8fac278bcd56e1c11aa056737 |     
    arc      |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/f0ee87957346d40e8281aa7845c7d8fae5276ce2 | ORPH
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/510327a797f77a46297c75b3e65653658a02f223 | ORPH
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/01557bdd4904fb7b5815c85cb0980a7c24a7cd07 |     
   x86_64    | freerdp-2.11.7-18-g0ee17e2f... | NOK | https://autobuild.buildroot.org/results/362cd31e5f5f1e0066ea82372ed53d91e9cf32e8 | ORPH
    m68k     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/16eb09be0004bf6d2c2e69fe78a0f7201b515f25 |     
   arceb     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/2ae170687bb43bb4734afcd58edce25b1f134787 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4974eaca4bcc651694614a57b34cf98adac58f6a | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8b226843b069217b0c990b354cc44df9f62e415b | ORPH
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/5179cc8684b9c62485a82af63ed91a1b4c4b907f | ORPH
    i686     |   host-python-maturin-1.9.4    | NOK | https://autobuild.buildroot.org/results/64983a4b23b819f634821c580246f12ced23e3d5 |     
   arceb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/7d88adbe72d7734ac29abbb1cd40023d402f1d43 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/533a087a081bd68cb9d79efa4f4b6e871f3b9264 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/4c3526fd15eb10da1dfda0828c8cd248fca6ec44 |     
microblazeel |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/3ea7ea71863702c06058b174fb5f3ea7f46072e8 | ORPH
 aarch64_be  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/a6798818bc46b4807ff83574c047740eb84a413d | ORPH
  sparc64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/28eb3f72af03dc187a0dc48a46a6630fc320b1a0 | ORPH
   xtensa    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/7f06a9bb47fda871e77372b156b23693516cf8cb |     
   s390x     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/ce2feca2126e1a0e93eabc2072f84a2312625994 |     
microblazeel |        libcgroup-2.0.3         | NOK | https://autobuild.buildroot.org/results/827818832fab6f4ee11bff057e3c11f36d121741 |     
   arceb     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/b010299b5119935283a9549bb6fb10e7fba48643 |     
   armeb     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/d071c6139e43b545a0fa5fa52eccb0f47c417a60 | ORPH
    arc      |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/0e650a721c5fb0c48b0ea698000d78c35654298e | ORPH
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/0f2b12526e8e739bf52247cbfd7b1e5528d66602 |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/62ff3ec6fd368f8b00c0308bf47166822642af84 |     
    sh4a     |          linux-6.17.9          | NOK | https://autobuild.buildroot.org/results/5e9f281b31d3959c233b717d06222c18a79d281b | ORPH
 aarch64_be  |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/4086ec05e8e216cb8780262bf3eec71160597d7d |     
    arm      |       luaossl-20250929-0       | NOK | https://autobuild.buildroot.org/results/8122148fa6ab04fef1cbfeb20a604b9ffe03ed13 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/975182eca17c58911bd725c1b882208237bc5c96 |     
  powerpc    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/e1dbc23b33b8a641370980cfa5757261020fb116 |     
  powerpc    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/d27004dd62cd0c87fbfbe0eca8057b17d84c799d | ORPH
  aarch64    |         oprofile-1.4.0         | NOK | https://autobuild.buildroot.org/results/e12de278cb7bb0ecc0d44dd9c69d3832ede946de |     
  riscv64    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/fdd2ebaa814ff4df9a88ba4c5bf3af6e3f0868e4 | ORPH
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/2e95ed67d562fd0f29a68e5d8a6598882bc69890 | ORPH
    mips     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/5545162ca0206cacfca1617280f074237e72aec1 |     
   arceb     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/217f4500a7dadf089b90438e1eb06aaa9c50f4c5 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/72118f80f96c59821a5bd0a86833dbf5ef184b9f |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/62b5d3823b37b4d7f7b3bc0d396139fbe6ceb7c1 |     
   s390x     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/cfb1f9a0137332cf080ce862722e4fe8ad275031 | ORPH
   x86_64    |         skopeo-1.20.0          | NOK | https://autobuild.buildroot.org/results/b9d123986c2a65427bfca32ee3ea792a988e6890 |     
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/960c62b2296bfad10af75681e975396ea49f22a3 |     
    m68k     |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/03adc83ecc940eb0317fa2e08efd507440307ec7 |     
  powerpc    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/82265597f057d4f2460a22d349634cb188b00cfa | ORPH
    arm      |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/0bdc4af270f3eee4cdcea8aeec9da23f3d0628da | ORPH
   armeb     |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/6b48e276398af282c95fb58ca8593eb5c0c0cd02 | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/125f1957fd03e39f9422ee7e759b16523a41be2e |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/966d188bfb7370aa95a5dee3ac4811eb929c2e76 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/d8f59d71c72431afc90f889109f433fb3ef51297 |     
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/34f8aff9e11dac54c42baa410355695205d9f651 | ORPH
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/762d219d23d19e2f7d05af970d9b83808c3449f6 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                 expect-5.45.4 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/3fe71d5b449b9c5c3f6cc9f1a782c5a6fa2d3241 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  cairo-1.18.4 | 1 
                  ffmpeg-6.1.3 | 1 
           ghostscript-10.06.0 | 1 
host-binutils-arc-2023.09-r... | 1 
   host-python-glslang-11.13.0 | 1 
              host-swipl-9.2.8 | 1 
                 libgee-0.20.6 | 1 
                   perl-5.40.2 | 1 
                s6-dns-2.3.7.2 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/a1cd490b30c655083c0983aa501874d3adfb30f7 |     
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/ab8da15c6e72013555321dfc89267ac7c2998eb6 |     
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/d6b167abda836280576b859864b8839af31ea58a |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/50e407534bbcbd9cd8249071fec9920f0b2a7bd3 |     
 aarch64_be  |  host-python-glslang-11.13.0   | NOK | https://autobuild.buildroot.org/results/55efe9cc3029fb9444e6c63e955b6c216e0af6f2 |     
    mips     |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/d7b62d0356eea6c7d9031f9fef659615992c43f9 |     
  sparc64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/38dcfc9f6c498207956842e223eaaa8ba0f17166 |     
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/535b016ecb088bcb6d2c6f10e4446502a6543e90 |     
   s390x     |         s6-dns-2.3.7.2         | NOK | https://autobuild.buildroot.org/results/2a9a2e12b609937b04ed8100d40535ea0ceb3eb5 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/753854b0b7500a0bf5910eeb24cc237c486474c1 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                 libcddb-1.3.2 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/569254246cad7ac95d94514e2ebc6b906fc24764 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
