Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DC1C35FF3
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 04:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39CA38433A;
	Fri, 21 Mar 2025 04:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEI5uNb6L2Jl; Fri, 21 Mar 2025 04:18:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 250388433C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 250388433C;
	Fri, 21 Mar 2025 04:18:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A75FC12F
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 04:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DE0D41E64
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 04:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVSQzPcjZRHh for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 04:18:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33C3941E61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33C3941E61
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33C3941E61
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 04:18:14 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5dca468c5e4so2664020a12.1
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 21:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742530693; x=1743135493;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=omheYJVmpA0L3KLiY8drK/fRGKl6gPszo2cnRoWg7NM=;
 b=EMiSCOcm+UKBcAuxioxeEfMWZJaTq7V/XjuUnyx12iLEeQwl6dDuuJix3FPUuH0cRM
 zEWadfHLGrxIgwOIvHwxdrdLJnawyl8ecqZ6ONt+Tq2GdStqLTZF1nNv6duPbX5hNSsF
 7VDGynYMHWuBrCY5Scj44u7MLi41Sbtjf3NNucmmo81lqcN8+PIhdBULI8I7J1WusUl8
 YVpAeCCnQpYk+z2bP3oTfimkf1eesRwxlBNZKbpAuphKnn/uUuk7ZNA4Pq6D0qAi7sYr
 SoNjOLWOU1Ix2jMD03JDph8A8ySAXraD7xnSa6bsuxAkFkuDpsRBurTZb+NtYjJ+cSJJ
 dhhQ==
X-Gm-Message-State: AOJu0Yz7hXL9sGxEx3EiFrfpl2FI4c21u0j7pv3R7dYbuGLNyEbX5OXK
 KZ5hYUACcBh6Uza/HAabGxq2kWUT+ZPh/mrjf6n/P2nI3G9MfJbeSCzZGQ==
X-Gm-Gg: ASbGncsZGPyjZoC0GBrmouwn9PfGBh4nLCQyffBQg29Ti8eHRu68fPuirF3sUjSWH0M
 GXdC0LdQIj+pz44gV4KBkpqwSSvAagPMcNJUz0bXmwtdKLYjGInqntldUPVIlRl14eQf4MMyauK
 tYgoljh73/9Xk81yJco8/mggBS/1/TnF7FBcL4+JHDzz/jJNJ7h+HaI2OMLxibByedcyWrGWb35
 nNlxsAvozXf2j0cICEc6jPEkLj7Eg8FrLflSKDocAbqS4U/+TK4W4Zyns45/znW2UkOvDNuF7v4
 LJLlq5cKOWl50EH2e0DKP3ypWvlSrsIxAijTSzOmF2miPYfjCZKvQRNmFIU=
X-Google-Smtp-Source: AGHT+IE0G3nrvbPMRHb2vPWR00Z390k9GILf4k6kMtKP8DB/DJ1UGbA5JzZY7JMBzXULv7zj2l9Zfg==
X-Received: by 2002:a05:6402:268b:b0:5dc:c9ce:b022 with SMTP id
 4fb4d7f45d1cf-5ebcd428170mr1481920a12.9.1742530692664; 
 Thu, 20 Mar 2025 21:18:12 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebccf6822dsm620356a12.12.2025.03.20.21.18.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 21:18:12 -0700 (PDT)
Message-ID: <67dce884.a70a0220.306ed9.3283@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 21 Mar 2025 04:18:12 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742530693; x=1743135493; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=omheYJVmpA0L3KLiY8drK/fRGKl6gPszo2cnRoWg7NM=;
 b=ZFPH3S5zB75kEaUA6vBbdBuB+tBpl2+5kudOiA50G5wMlq6gjjLsa/fsUtI9gb8fmr
 ri+BZge7wKgs5jTXHvYapOhbNXIMvg0JfGESKY+07sKYYfp0uh1ZQIazlao8pFGlYW/a
 juJjR6uJ8BW1erO0nwOx9Nfv7axVKUpf6SOq46bQ9KPK20V8PaWYHkh2i4KoUXXach4B
 E739rXwUQ/GROS7TpFqbDf/Pxb3DP3wg8oGQBtA/wsF4sSiImft97PZKlgyHf5rax2pJ
 bKrK/k3MbB+lpvrlJzULwqV4ITA94HcNdbqRgnWhAiIQZA97vLLLM93KVxOmjUW20yQr
 vZYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZFPH3S5z
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-20
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

Autobuild statistics for 2025-03-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  7  |  0  | 11  |
  2024.11.x  |  2  |  2  |  0  |  4  |
    master   | 14  | 59  |  0  | 73  |

Classification of failures by reason for master
-----------------------------------------------

               cracklib-2.9.11 | 5 
          aardvark-dns-v1.14.0 | 3 
esp-hosted-927a34f99724bb74... | 3 
    host-python-greenlet-3.1.1 | 3 
                  linux-6.13.7 | 3 
           at-spi2-core-2.50.0 | 2 
                   cvs-1.12.13 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
                 host-gdb-14.2 | 2 
                  libsepol-3.7 | 2 
               mariadb-10.11.6 | 2 
      passt-2025_02_17.a1e48a0 | 2 
                   perl-5.40.1 | 2 
                    azmq-1.0.3 | 1 
                    brltty-6.6 | 1 
                 coreutils-9.5 | 1 
             dahdi-linux-3.3.0 | 1 
                elfutils-0.192 | 1 
                    fcft-3.1.8 | 1 
              fftw-quad-3.3.10 | 1 
firmware-utils-86739f2b3ae9... | 1 
            freeswitch-1.10.12 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
                      gd-2.3.3 | 1 
               host-ola-0.10.9 | 1 
              host-rust-1.82.0 | 1 
                 lapack-3.12.1 | 1 
                libesmtp-1.1.0 | 1 
                  libglu-9.0.3 | 1 
                libsoup3-3.6.1 | 1 
               libunwind-1.8.1 | 1 
                   linux-tools | 1 
                lmbench-3.0-a9 | 1 
                 mesa3d-24.0.9 | 1 
              mosquitto-2.0.20 | 1 
                opencv3-3.4.19 | 1 
         python-remi-2022.7.27 | 1 
                       unknown | 1 
             util-linux-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/99e87c9e8ab2b71348938ad3b1c766da731ec803 | ORPH
  powerpc    |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/a14009d66964497677cc9f8c0efa9418859bcebd | ORPH
 powerpc64   |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/05a505a63b0aee8810dc49bcc173b222b1436ecf | ORPH
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/ec45c709cd3cfb04a784066e2da02e5a502552d8 |     
    arc      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/87d0fbffde3b224ed1dd5bfcfd9be4cafb47248e |     
   mips64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/e5bdd30aeffe263454b4584eef810fe81b8fec90 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/a3ec4b228252566c7bac2855dd76aae457f28e96 |     
    sh4a     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/5eac4b5bc0c12c429a20a09c036d53d83018a3eb | ORPH
 microblaze  |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/bf527d2cc09b6cf350c861471e02b22a54da195a |     
powerpc64le  |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/e1133b6c2bbd24601e7c0af8a956ecf39455c13f |     
   mips64    |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/758737e039f211e4407788c7305fe58e572a08e2 |     
microblazeel |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/4360865a42faa47506080ee0a91361787d9dfbf5 |     
    mips     |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/179ba0c786712a2af336e3326a31f959e1db7565 |     
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/90835a7cb2e899018460eac5b8c0dc05d8f1c430 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/da545fa653ce61b7a7cd45e7159c3443242671bc | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6428379952039b37375a7f2290e5e420c5aa2b6e | ORPH
   mips64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/37f35b056a62b64ba44b3b5277cd559b6fea0326 | ORPH
  mips64el   | esp-hosted-927a34f99724bb74... | NOK | https://autobuild.buildroot.org/results/fea633ed7186c4966eaacc94da67d6922867e0af |     
 powerpc64   | esp-hosted-927a34f99724bb74... | NOK | https://autobuild.buildroot.org/results/a920ae5eae2659e158c9b03f480e77a50369456e |     
  mips64el   | esp-hosted-927a34f99724bb74... | NOK | https://autobuild.buildroot.org/results/31dc776fee06895142809d88de66e27e09fd8e0c |     
   s390x     |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/cb56d982d8af06a16db0655d8c93c742c32ec3e1 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/16b838fbd9541da9f8be12dcc444ce9bd21dc697 | ORPH
   mips64    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/01d0c4d4e47b973bab5586930c99499c4d9e1446 |     
 aarch64_be  |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/33c41d8da8190933d863ed6f75e5d586d1c22a2f |     
  powerpc    | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/4baa2df89d3ca040c1a0387991c37d0a246cfa39 |     
    arm      |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/eb56b1dea0b6699cb979d4dbf862184a9cc4fa39 | ORPH
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/5dba3a82991e4348a729cea86d4bb56243756e5b |     
  riscv64    | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/b318c6f391306a14aa5284e76e9acbe982dc9d2d |     
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/2d3b2e0be5e74e4507dfa1d28ac8ad2882bf33f2 | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/5ac5095f0501dc6a1d823b574b1e1a1e38ca27a3 | ORPH
   s390x     |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/8be45696c37c4c89541e4f1268461c2dd4093165 |     
  powerpc    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/66564adeaeba10088ebd061ad0beb8586b5207fd |     
  powerpc    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/2f8402e14c32ca5206af80c0fb234a014c237f07 |     
    m68k     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/64da16a05702e3d735f4ccc607cc75462e49733e |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/257010c544dc65e4829aa1a03f3b6ac96e8545b7 |     
   sh4aeb    |         lapack-3.12.1          | NOK | https://autobuild.buildroot.org/results/f782d2ea642ec33edbd442fecd28a9e9acca1a8d |     
powerpc64le  |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/a9027b1ec9b18cde806dc5282e3392152265f712 | ORPH
   mips64    |          libglu-9.0.3          | NOK | https://autobuild.buildroot.org/results/ffd19da99b861035f55401f0c376d4b81434e234 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/1f7ca6f1eb0239b9c84d6e1a2d99afc98338aff3 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/bd120c78cbda42118b94b1583211470566723ad4 |     
 aarch64_be  |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/3e6ec3fd9e615bcb2f33f68e23aa53ab1209164f |     
    mips     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/e749de221aa2904708fb524444f3eb6d53a4192f | ORPH
  sparc64    |          linux-6.13.7          | NOK | https://autobuild.buildroot.org/results/89e760613c9bf0906b8eb89934b32a871ca3d058 | ORPH
  mips64el   |          linux-6.13.7          | NOK | https://autobuild.buildroot.org/results/f21c0ed5aea4bc6da7bb7b7fe73370be0312cd12 | ORPH
 microblaze  |          linux-6.13.7          | NOK | https://autobuild.buildroot.org/results/770d4a42a62819c9c14514b58bdc13fdd3f2da0b | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/10ca0940efb15d556c2ad4e0f2e9ceeb980b54c4 | ORPH
    arc      |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/fa5bb0c1603b7923cb4dbce3a2218f872dad1e13 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/e69acacf436a3909e5926eb7a90b1867c7be4063 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/f36953e096cda7a372ecf79e64430288bb04f3d9 | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/e7ed10bfccf3af3b6f2dd1e259bdbdc55515cfcb |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/b7d7bc8c0c9ed09721e44c624b7567d3f7436fcc |     
 aarch64_be  |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/c4a6c42a86a1f5de5b541af3190f9a47c58923f8 | ORPH
    arc      |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/3db9321dd22a4171a29427c0a36c9cdf2e42aa4e | ORPH
  mips64el   |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/1453921e80b445740296bd8f20143b6fa64d0052 | ORPH
    or1k     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/ee37284ccd962250dd2f6ebe29686222c1a044dd |     
  mips64el   |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/a6f8af6cbb5c21cb1f036789558d7ee0a7171319 |     
  mips64el   |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/cab9dc808fce3e5211e89de3746f4965699308df |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/7543fda105ff133b357b2442e9350b6fc9758ea0 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ef58acbb8d754250b5107e3f27be4147a4d13ecd | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  fan-ctrl-1.3 | 1 
             host-delve-1.20.2 | 1 
host-prelink-cross-a853a5d7... | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.6.81 | 1 
            live555-2021.05.03 | 1 
               mariadb-10.11.6 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          fan-ctrl-1.3          | NOK | https://autobuild.buildroot.org/results/0dfda6809179555138485a3b50532b431d295145 |     
  riscv64    |       host-delve-1.20.2        | NOK | https://autobuild.buildroot.org/results/f633dfa74fec60b5811f95025bdc8b75095f89b3 |     
  sparc64    | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/203e4d4a1e5f51b945ed70f6a0be4adababcb54f |     
    arc      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/40629aedd141ba2f75b56029dc7d745b2ec5103a | ORPH
  powerpc    |          linux-6.6.81          | NOK | https://autobuild.buildroot.org/results/3d38b72481e618fe26f1c95625cb7cb3c8001863 | ORPH
microblazeel |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/8cf5a420c13fc1b61a264bcce2f1c6687c039bca | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/6a4375e784de99436eb3e16dc6587c8e1b78c76e | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                bpftool-v7.1.0 | 1 
            igd2-for-linux-2.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/5f893d363b87e5b61a908a93848e6fe79932cc5f |     
   mips64    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/305c96b0cf8d29677244b04e92a0e548b00cc421 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
