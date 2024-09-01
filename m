Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B285CD3424
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 03:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 565B740334;
	Sun,  1 Sep 2024 03:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9oiUSnBfpkG8; Sun,  1 Sep 2024 03:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FEBB40351
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FEBB40351;
	Sun,  1 Sep 2024 03:17:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A4FB1BF847
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 03:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D7C340232
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 03:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQNS-2Z6Zejh for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 03:17:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83E9640153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83E9640153
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83E9640153
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 03:17:06 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2f4f24263acso47282301fa.0
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 20:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725160624; x=1725765424;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ysxaECijahWJm1VLGGz4mzfU4fniIiv9Kv80hpJcTNc=;
 b=mU97TPH5lvGfNjieVBkNSxc2W653ML+D4mnTF9eA8WA7vDK/8YVz6M0W0dKDLjwRmv
 O/GruN8oe2wZnL8uMTjgrScFWth8l7Ec/USuy9NN1yo8ymTpyEG/WMz5758vI1jjO/p7
 aWhP1NUq538lKS2yHbI9QeAmkpM41Pz2EQTM5+qaB0n8ojimwaRsEAc1iVusqOIzBYQZ
 j+2EjJGelkBri4s0rRXqWMMap4+KsQcO0S2+2+sFDWRgzopPLGm+FvvL7ITanM4IDx9K
 stbb60ier584h25MpRNCPK0DPHWUU4MjUqwj5DBX3MVTepnSTv36geQzWnBC/meL5ryJ
 ocmg==
X-Gm-Message-State: AOJu0YyfYDADC5MEbRlrxV0lllvMdna1WgztqRVM9v6jlCq5pupMzOIo
 7RuYtN3hyJkV2VZVZvIGsLK/6YzShj7L5YYDQvhq02/74O+vG5qHrJnBaw==
X-Google-Smtp-Source: AGHT+IHWpXXocB7jbmJKeN7qr8jS5LDzDCk7a1QiX1Y1NUrVGHNeKhPo8e6mnP0Q7/d47KqE/gitTg==
X-Received: by 2002:a05:651c:2112:b0:2f5:7ed:abb0 with SMTP id
 38308e7fff4ca-2f61070787emr96596921fa.26.1725160623398; 
 Sat, 31 Aug 2024 20:17:03 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c7307bsm3783561a12.34.2024.08.31.20.17.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2024 20:17:03 -0700 (PDT)
Message-ID: <66d3dcaf.500a0220.3a1193.d5d8@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 01 Sep 2024 03:17:03 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725160624; x=1725765424; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ysxaECijahWJm1VLGGz4mzfU4fniIiv9Kv80hpJcTNc=;
 b=g5yPKaD2+XPF2FMCN2H3a2La894L98omDsu7pESbKZFYCnnrNgGLs4nZ2SFR46YNKw
 qCiP/NF/6VfL4Tc37Sn/eFY6qhZnAyBxn/rFkILsc8Za3tPXKnMlnhO2hIWcmuFjkGgh
 iuqyGGpPa8EX1nl3PKCuHQtrO5yECsExSNIZBYjj2bZSp0G6IEk3XNYdF6QXEMwsOJmW
 CtEeW9dIuh5r9YvOwuwBSBXHx2vpp08a4+IbkujzgqnIr7EGmxtr9wzY+ZWVWP1Hk/Ob
 ulS672bJn4AJYI/Mj2U1wiuESuGEdv5ih4/541eQ8HPkPGkhnEEeU8nQo8712e/ayZ7c
 6x7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=g5yPKaD2
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-08-31
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Autobuild statistics for 2024-08-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 12  |  9  |  0  | 21  |
  2024.05.x  |  5  |  4  |  0  |  9  |
    master   |  5  | 251 | 10  | 266 |
     next    |  6  |  8  |  0  | 14  |

Classification of failures by reason for master
-----------------------------------------------

               procps-ng-4.0.4 | 30
                  linux-6.10.7 | 17
  gobject-introspection-1.76.1 | 15
aubio-152d6819b360c2e7b379e... | 12
         gobject-introspection | 9 
glibc-2.39-74-g198632a05f6c... | 8 
           host-doxygen-1.8.18 | 8 
                  babeld-1.9.2 | 7 
     linux-5.10.162-cip24-rt10 | 7 
                  ntp-4.2.8p18 | 7 
android-tools-4.2.2+git2013... | 6 
           host-librsvg-2.50.9 | 6 
               linux-pam-1.6.1 | 6 
          cryptodev-linux-1.13 | 5 
                   duma-2.5.21 | 5 
                 gnuplot-6.0.1 | 5 
                    bsdiff-4.3 | 4 
                     file-5.45 | 4 
               ipmitool-1_8_19 | 4 
            linux-fusion-9.0.3 | 4 
                 apache-2.4.62 | 3 
                      fbv-1.0b | 3 
            gettext-gnu-0.22.4 | 3 
                 libv4l-1.24.1 | 3 
          linux-5.10.162-cip24 | 3 
                   lsuio-0.2.0 | 3 
              mosquitto-2.0.18 | 3 
             armadillo-9.900.2 | 2 
             batman-adv-2023.1 | 2 
                  cairo-1.18.0 | 2 
          cloudflared-2024.6.1 | 2 
                directfb-1.7.7 | 2 
                  ffmpeg-6.1.2 | 2 
            host-ccache-4.10.1 | 2 
                  libsepol-3.6 | 2 
                  libsvg-0.1.4 | 2 
                libxml2-2.13.3 | 2 
               mariadb-10.11.6 | 2 
                   pcre2-10.43 | 2 
               pulseaudio-17.0 | 2 
                python3-3.12.5 | 2 
                xenomai-3.0.10 | 2 
                acpitool-0.5.1 | 1 
                 agentpp-4.6.1 | 1 
                apparmor-3.1.7 | 1 
           at-spi2-core-2.50.0 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                   botan-3.5.0 | 1 
                   bullet-3.25 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 coreutils-9.3 | 1 
              fftw-quad-3.3.10 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
            gdk-pixbuf-2.42.10 | 1 
           ghostscript-10.03.1 | 1 
 host-binutils-bare-metal-2.42 | 1 
             host-delve-1.22.1 | 1 
host-riscv-isa-sim-00dfa28c... | 1 
                     host-rust | 1 
            host-skopeo-1.13.3 | 1 
                latencytop-0.5 | 1 
                 lcdproc-0.5.9 | 1 
               libdeflate-1.20 | 1 
                libdrm-2.4.122 | 1 
                liblinear-2.45 | 1 
                  libnss-3.103 | 1 
               libpthsem-2.0.8 | 1 
               libunwind-1.8.1 | 1 
                  libva-2.22.0 | 1 
                 libvpl-2.12.0 | 1 
               lighttpd-1.4.76 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                 mesa3d-24.0.9 | 1 
                     mtd-2.2.0 | 1 
               openblas-0.3.27 | 1 
      python-autocommand-2.2.2 | 1 
                 rtptools-1.22 | 1 
                  tllist-1.1.0 | 1 
                tpm2-tss-3.2.2 | 1 
                       unknown | 1 
               valgrind-3.23.0 | 1 
                  whois-5.5.14 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.org/results/e886cec73c18f51455537629099c09785c27c206 |     
   armeb     |         agentpp-4.6.1          | NOK | http://autobuild.buildroot.org/results/91a926acb042e9a7393c7928b28e03272f923aef |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/cc671fb32660cf6eb855742900127ae767bc89f7 |     
  riscv64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/b879432ce129c2e3adcd0861b8a0f7a042733b2a |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/744ba97c96f387d99e37ccfb67eb662b2182997d |     
  riscv32    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/4c31a40616bc1e6807f219f9395e1880e8d99df2 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/d096d632816de2b4b844d5d71f23c922e8ae1ea5 |     
  powerpc    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/ec1d76b6ae55fdac9ad0526df676252600cfb3bd |     
   nios2     |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/d19a649269324e0d7054c9f0271ef67cadc87527 |     
  sparc64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/d31b6038f29a89fb13d78b865086f74be65bd32a |     
   mips64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/c06efbc4cfe557f6bcae0535aba6af435d21f87a |     
    arc      |         apparmor-3.1.7         | NOK | http://autobuild.buildroot.org/results/ee9ba1a30ee40d43ee7cc0a2910ae77f861c1d53 |     
   xtensa    |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/0e5e13af62711759a650f9a455f5bac309bdb544 |     
    sh4      |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/611cfb8e17a114c1197fd98d8b8bdfc5ea24b8d6 |     
   xtensa    |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/2ea962dc7ba5c8081d3065b16de51634cd2ce37e |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/57944cae6b0d13ed7cbd01f7ae295c7a6a9abd70 |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/0703829ce90ac812c1f33ed84dbf6a0fe8f464f7 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/b737398621040873cb9f9301abdc0badc6442157 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/0b0605799991824c7b6f8344d9b0382cdb17c620 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/63321f201069430e660920395e6e7bf24226ff22 |     
  powerpc    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/b45b80d4fd42bd2a3d022007af8e1ef96c366fa1 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/460d38a13f49ab3c4532efee94c8739dcb654b58 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/c29c8ec8adecc9bc6229d3572769fab8190c2f90 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/cecd563f5f561c93f06ed84662da5439b59ec5e7 |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/8a6f2c6f88c56306a7db589b99d74e67a7e9aa19 |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/a7c32aa6f195540a72fd209b49911aff5bb42649 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/2bfde1222df1adb5b2db62f8286775d678734c61 |     
    sh4      |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/86762206987c3b7fd842b0b8c3351d80f088510e | ORPH
   sparc     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/a84d65026833fef36e6b7d5723e5c3966a459102 | ORPH
   nios2     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/3ca931ec215afd10d389b832c29842d35f4557ab | ORPH
powerpc64le  |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/8dffa00f5f21bfad0f921d48d5f01cd18e01db45 | ORPH
  sparc64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/43c2c4e53a549a6cf1af8ee7f07dcd037fce227a | ORPH
   mips64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/b60debc1b1d9e94fd5f1410d704847934a32452d | ORPH
    mips     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/eac41e47c4a743367f2ac27bd08bec56902b2e27 | ORPH
  mips64el   |       batman-adv-2023.1        | NOK | http://autobuild.buildroot.org/results/b775e2e410208cf8428aaca95d46d51fa3e8b529 |     
   mips64    |       batman-adv-2023.1        | NOK | http://autobuild.buildroot.org/results/3d51a7fba70964afb8b864466d08baf456611334 |     
   armeb     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.org/results/7dc74f2f137c8ec98dab8f1aa31b9fd3b2dee2b9 |     
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.org/results/eaf54a8955fd9662013d3dd93915411b091a4d9a | ORPH
   sparc     |          botan-3.5.0           | NOK | http://autobuild.buildroot.org/results/4355e81dc88ae5ac3a8e96373c73988fb318c766 | ORPH
   nios2     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/15105d6cbcd5bce94ce15bd2d4ba71f2dca60e88 | ORPH
   s390x     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/824e20c679c385ccbfb101995c148122f24c0424 | ORPH
    mips     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/89c5abc91e2fe6ad3f672b217a693624dccd6577 | ORPH
 microblaze  |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/f39b1407cdae034cde8ba7db3617e5eb4c460025 | ORPH
    arm      |          bullet-3.25           | NOK | http://autobuild.buildroot.org/results/4837f74ad41c4bedf749dffaa9d74662833ff6b9 |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/bb569ebe7625a646eb8c76a38fc4895b6bc562bf |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/17f9947018344449d5e1e88c0bc62ce8147beadc |     
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.org/results/7e8bf576f54b37cce0e155d1dee1ba51681955e7 | ORPH
   s390x     |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.org/results/8fe8dbaf09e47533e71b2e40dbea896d5a7e8467 |     
   s390x     |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.org/results/a4f548a84f6a36448bf0f78e03ffbc07f0d80771 |     
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/365bbfcc4781eff315e44ce107662c599ca266ab | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/cb549580d432fd998bc1d6fd98b4f6f5714c81ff | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/a87785e53b4e787f97111a0c6ddc89be2dc4b182 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/414c5a689703845fb2f5255516bc3ef52758b9f8 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/52d0fbf325c7b84d196b754743c8eb8a2a3e07f7 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/666cb2b7fb9b57901eb628128eb2d641f1a5cba1 | ORPH
   mipsel    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/b865b26577a65e57cc8a058b7d869286d5e0891f | ORPH
    i686     |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/3ed6dc101ce6f7e2cb8491ef6bc1e473016e4f83 | ORPH
    m68k     |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/fb43247f269f2297b307f77e1c7aefb767cd8ad0 | ORPH
powerpc64le  |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/e3cf7db50afd42736dd97cea2446e4d2cda3b049 | ORPH
    mips     |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/39d5ff8a9325019b27b762e1922ec84a0511424f | ORPH
    or1k     |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/5e421df2e743344ace139a2dbea5ea14a6f2c300 | ORPH
   s390x     |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/fb57bc00e62db5d1065d64e5f1ddc4d60e9be094 | ORPH
   x86_64    |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/34d5e05b483236d30524ad82720880ef7aa79c41 | ORPH
   s390x     |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/979a596e4faedc5fca7727d63e21cb8ce4c47dd3 | ORPH
 aarch64_be  |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/2197cc995081a0e10d179c35df1ce09ab22b7bf4 | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/54eefb6217debf2c6687e185a96d05d577d2f36d |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/d714a27f36f276dce9142b23f07e1ab5922c8236 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.org/results/9be84ee83c82f9b0d9e05353cda93dd7d983b93b | ORPH
    i686     |           file-5.45            | NOK | http://autobuild.buildroot.org/results/16c905d971797af22280898ed696097ee77d590c | ORPH
  powerpc    |           file-5.45            | NOK | http://autobuild.buildroot.org/results/107087964267d13a0535828b21995b90386bcf81 | ORPH
    mips     |           file-5.45            | NOK | http://autobuild.buildroot.org/results/8ba4b4d297b7475f7cf8591d1375d43f4ded2f7f | ORPH
   armeb     |           file-5.45            | NOK | http://autobuild.buildroot.org/results/256d28ffe42847154c4812c79494102c3234f4a8 | ORPH
  sparc64    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.org/results/9319e3d4d5e50ee361647aa28c8196c8bfdd64e9 |     
    i686     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/4466695b4bd3c0ae3b5d4ae94dc853a461bf2269 | ORPH
    m68k     |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/1493ce1b5b5d5ed86f629fac45669ed282391888 | ORPH
  mips64el   |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/7b874156c607c5454fb948b49cd54690cae78702 | ORPH
   xtensa    |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/691effa733df3e60b33e35ed011633e2767d1bf2 | ORPH
   sparc     |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.org/results/4d318df91c833bbb6a4ecb65ee2b0ac3ffb65bed |     
  riscv32    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/b38a0b7fd6dad30e7f95bca2622fb84de8293107 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/21140d81434340f9cda928a006a082a903c009d9 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/e412071e0c0e61c99f9e0a9528a822fdbae44621 |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/4646ec71bd59f7d16afe4f0fe6dcb1408c492289 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/6f372cb7342e6ea5406a0e1547ea3b91cc56861a |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/e84fcb46379ef7a7030470eca4046f04ec0481e9 |     
  riscv64    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/0ea2b2e8cc635e7a9647c4476b7ae86d77b21c3f |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/eca05766d68541787a00a80c9b629f0ebd21811f |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/fad51ec9185f57327df98ff28e59495004c6e62c |     
    mips     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/b3e1ab87f3538fd78048409a15809e6c173ef9df |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/a30f22871cb3ee1da51c8992b83298cef67ba665 |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/0691d828ca3cb19d02cd07811686c3303193a0e8 |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/e88a3a42c64fc8c28340c99ea857a0f2784011ed |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/c0f06dd4c50a41a9888142b9b59814512c325ef9 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/dc5ad8abe7064ddfa379bff0a418d9bbf20d5df5 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/f337877a519a9521416553e89e4819ca69958df1 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/cc8f5313404de34803c8c30fd8e770a71ef25530 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/4b3a8a0d042986c76473ca650fa4b0c2619db809 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/b13aeba2b8adfcee51e0e6ace211b4c82b8d46a3 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/7b6bc8719e81219a7a51c8c0d2d6e6d58de73b07 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/80c6f1127194efedc79ca0728797ad1c7af53a45 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/76218db6f611e5c0f4b2a77895f407e5c72bef5b |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/6a6d7ff20405027b3ae2bedad55971320bc81cb1 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/ab16325129df829c7ac7934ca85f0252f40fe33d | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/684d67fa0b1b507ef1438aca9c9511c38d733ccb | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/a6ead4ef787be00b4510ffd4a6b045055aa09afc | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/11329815d0a4d9787c9ff27145cfe259f51ef354 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/043a2edf50a8f7960d8eb76f1f341d6d643160c0 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/665889344e59dc23eba9b45ab42709c119b872d8 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/d008c8e453f2fc63ed31c20a36658b8fa099b7dc | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/7f6dff8c838d0ad1406e49c91e163f96aa0cd456 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/60a788982109b171bda4ea11d36c82996c9b640d | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/89ba6fc2771cad04872f541c6427809965e1cae4 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/dac2b6a410df6c2f7aba23655cad39828f29f478 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/c5bd5f0c22834d64412c248e0bb9e755ff870b5d | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/d1c68d09b51c086d72d0513a2398d6875a4f187b | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/92a32974ebdbceefca8b584bec935cd1075a3a59 | ORPH
   mipsel    | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/efadbb106f436790ffcf2f9badc3524279ee2908 |     
  sparc64    |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/42bff3b8351119bf531ac1e7f2cbb7479f91c06c | ORPH
    arc      |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/d664e3c47d54be7394abbbeb4c3e77cb7cce69e7 | ORPH
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/ba7a70e1bb1f388728ca54b4363c69f87d7ccf7b |     
powerpc64le  |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/0afed4f7c2b745260f279d810b8ac9e0bdd204cd | ORPH
  sparc64    |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/b1e5d4dc49976c7e6966fbeba4e3e836c346c343 | ORPH
   mips64    |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/3e71e3a81783e2b974cfa89e3d9585de8900706f | ORPH
   sh4eb     |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/e0d0b486473326723b680cc906a1c644227f11f9 | ORPH
powerpc64le  |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/0c1243d0ac25ba993ebd333af800460b8b025a73 | ORPH
  sparc64    |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/f472109a96a52df5b08f56d6a4d30ef8b6398ee2 | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/ec5adb2a0b7f3b5ed7214ba64e3d4c33228edba1 | ORPH
    or1k     |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/8284a66bfca44d9d8071104b246fc524a0b76026 | ORPH
   mips64    |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/3752284d83c2e54b0db4cc6b38b6f819d951c5ec |     
   arceb     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/8a88188b50c661900b2a26205371bcfca724f600 |     
   nios2     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/5f3ecfae2d484c7395aa52a029917aebc88d9614 |     
   xtensa    |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/8fdce330c9cc3b046b1cde3ab7640089cc9a4f5c |     
   s390x     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/bba186f503e7e90b4a34159defb807d7880f1d5b |     
 microblaze  |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/3516279f191886b19c9f796aeded3f79ede5ffaa |     
    m68k     | host-riscv-isa-sim-00dfa28c... | NOK | http://autobuild.buildroot.org/results/2d5b8bedc5c555a459d6c506b4422d28e242ae3d |     
  sparc64    |           host-rust            | TIM | http://autobuild.buildroot.org/results/0226a1471b5fdf29f62dfad8962bfeb3e440bede |     
  mips64el   |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.org/results/16439d9160a240fb1d0aaea4dd8064c513917d58 |     
   arceb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/f3fa26a6a6b0f8f6faed2ed6b85803861bf3fe6a |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/4b635182acd5ea0ed2dc652de8d21b1ff01a5f7b |     
   sh4eb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/6da8b3b94d04e606ba8db109cf956776e8d57f69 |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/5190c877826fbb53c89f5bb0df2299702d0a1e84 |     
    i686     |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/52ade82b3888577a7108355c319b1fba7679472b | ORPH
   mipsel    |         lcdproc-0.5.9          | NOK | http://autobuild.buildroot.org/results/58fdd0cca0c828fddd1f16f543d218ef9dbdc45c | ORPH
  riscv32    |        libdeflate-1.20         | NOK | http://autobuild.buildroot.org/results/21c6380ad90368dfeb38d9d215249247d11ff2e7 |     
   sparc     |         libdrm-2.4.122         | NOK | http://autobuild.buildroot.org/results/a7795c26640583be6b94dabfae19c319035638ca |     
  mips64el   |         liblinear-2.45         | NOK | http://autobuild.buildroot.org/results/075ae43844bf793e3e33f9c5091fc0eccde4904d |     
microblazeel |          libnss-3.103          | NOK | http://autobuild.buildroot.org/results/d9dd4c44ef209fd5adde5a5c71c6524b936f1a13 |     
microblazeel |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.org/results/ef55ab4db84938a1504a237a3c3e0d1ce4ab9fb8 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/6e2a9a5134275e929b71c01c75d32727354f0c9c |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/0ecd62b7bd5903254d66f5d08d32ca317088dd45 |     
 powerpc64   |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.org/results/c54dd1902d8b08be0c3e72319c7176cc91c8cb00 |     
   arceb     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.org/results/9f249029ad870ae07f133048d83dd92aeca52842 |     
  mips64el   |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.org/results/48ce6c39a2ab1cda88a0b9088170092bdc4cb0a8 | ORPH
   sh4aeb    |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.org/results/040f9bfb287a8f245af030045ff11557b91b3080 |     
    mips     |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.org/results/2759d85d6bb45b529ce19bccba78213ba202f19c |     
   arceb     |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.org/results/3ddadf45a4c81c668e9e71d13cf7b4feb488adc4 |     
  mips64el   |          libva-2.22.0          | NOK | http://autobuild.buildroot.org/results/fdd99429277293147eaa98a91c6e1e7d6ab856d1 |     
  mips64el   |         libvpl-2.12.0          | NOK | http://autobuild.buildroot.org/results/5126af1fb6a1bd0373857a50670d003c63e4f2ed |     
  riscv64    |         libxml2-2.13.3         | NOK | http://autobuild.buildroot.org/results/5ad9776fde9de176582bedd100c8f1426774c6ff |     
   xtensa    |         libxml2-2.13.3         | NOK | http://autobuild.buildroot.org/results/0e442ceae668494af00001a84c649494675d17ac |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/f356f48237ab6eeaca853c4adb1159cb2be887cb | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/e22f93fc146750d696a10e8d9d353a8a0baec87f | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/187a0a67d6f87114ee40597b671946cd6b963ce7 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/7e8400e258ec83269058bfa09fbc1ee9b87386c4 | ORPH
   sh4aeb    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/3d9d88574ef923674606a996a51b25069e5abc97 | ORPH
    arc      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/9b93d6d18c154e9d028f9e00a671fe880e88f812 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/31968da5737b8a08def8ebe74a257e62bcf4967c | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/ea9a3a5342d8797d4d79f4213d9ba073ef51d6bf | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/e03773f888e6dbc6244521d9a9a65dda0b4c56c1 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/a3c322f2982873154ca57053dd46fa5628148d67 | ORPH
   sh4aeb    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/0294c9b8a31e6db9f0aff710dfd3e3bc14dd5d7f | ORPH
  mips64el   |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/7fd50aa854cadc526b61bec2eaa43363db3e7005 | ORPH
  mips64el   |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/e177d1c4f4dd9aeea863251a8cae130091e8b986 | ORPH
   xtensa    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/3d0946349b23258444e07e029e84ac322520839a | ORPH
  mips64el   |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/710514bb148d8b61c94ff0c916756e15aa45bd85 | ORPH
  powerpc    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/5a98d7264666397ee8e3fca70723a7fe26e427de | ORPH
  powerpc    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/1e87c854d46c0ee8b7816a3db58fe3350ab4081c | ORPH
   nios2     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/f1c281ea1304c501834d9a18c467cba17948494e | ORPH
 powerpc64   |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/a3f39428577b5aae5c321e7791a9622b03c1a9e7 | ORPH
  mips64el   |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/3fb2d6630134edfcddaa88787f1afe2474f45aef | ORPH
   sparc     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/a2ab10c5335f828b7ec3ae4f2a61ca0c6bc1006c | ORPH
  mips64el   |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/26a195e01ab41b6711e350fc54b499b09da63caf | ORPH
   nios2     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/a20e837c30f30d5860a63703321bddbf078ec0e6 | ORPH
   sh4aeb    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/afaf0a0055cae6802c39c41d2579d6145a5f46e1 | ORPH
powerpc64le  |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/5ae4a0b2b6da93017d13cfa97564b3299ac50232 | ORPH
  mips64el   |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/3bbf98353c07018a547a55b8c9042e8e42d450bd | ORPH
    m68k     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/d82001544a191dabc5bb786751b4fa9a4cd06ace | ORPH
  powerpc    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/9a4e3a2c5f6ffc38c6a71fe4e2d3f611e85b45ad | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/dfd60c97db0350f495b132e093a68a7e15a10fbc | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/850fa1a0ec996593a736e40966d864421980195b | ORPH
   armeb     |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/f38b50f9a7a5e3ffd9bd17422285cf48da75b599 | ORPH
powerpc64le  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/4afb3e9526e182325efacb041c2981c6729f8442 | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/2902ea5af91d0442b6eb3416bcd348ab33aee033 | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/486b4208d55188a6f8dc8a1a937ddd03401c7124 | ORPH
    i586     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/d44b6c3406aece4b94a6db080eb12399522f484b | ORPH
    arc      |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/7f827f251805c1ebbba60070c05b6bc99abcd58c | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/9e47ada6c055c054b078447ae3a709fb558a54e7 | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/c99fc0815f800af2a4988405ece1ac4352a71948 | ORPH
   s390x     |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/c12af56393552aeeeae313280ea2e1a5626c7b8b | ORPH
  sparc64    |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/d33cad7e2863303101e9690020d4d29775cdfb45 | ORPH
  aarch64    |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/469553c186f749eb12af5dc0c29481a4fa343f4f | ORPH
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.org/results/02d4f3fc553c35a8c543798130e5bab001444d92 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/33b70309a7250d25ba4db890a9793f67f5dfad13 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/13cf9fed42238c7d44e1842fe19042d288ebf826 | ORPH
   sh4aeb    |         mesa3d-24.0.9          | NOK | http://autobuild.buildroot.org/results/70827ef80c82df662391e5c3029c4c045d7f7d77 |     
    or1k     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.org/results/409fdee1c1ccdd618b1caf01363d4cd034790014 |     
    or1k     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.org/results/adcad48dbc9f1a7278d4dc8aaa1deb2204e54a8b |     
    or1k     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.org/results/708f2aa6698d764d759273cec67888d3ebe80b7e |     
    or1k     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.org/results/beaa0f6c0696f090b53e82c28dea716044ab8cd3 |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/0435a35514ee0c3e78fd311574eb763cedd73d67 |     
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/0c19dc97768c9b29036be8eb39109f3446e35293 |     
  mips64el   |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/3660db65ab99735c040e3937f9b9e20a877c5172 |     
    i686     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/26640dfd7a032109c702d63caf96de737d9970f4 |     
   mips64    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/941c8dcdcefee09d25b9856df542292d4dfdcb46 |     
   x86_64    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/44e4eaf933a7787d48ec75574400a8282c53711e |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/eaa39ff6fbabd487436528b6687c5a3d6bbe9f67 |     
  riscv64    |        openblas-0.3.27         | NOK | http://autobuild.buildroot.org/results/7db4f6064622a3ea7faaa571f02d0c86fd535994 |     
    mips     |          pcre2-10.43           | NOK | http://autobuild.buildroot.org/results/dd21b01c7b2c859dab8344242757d1a0021a9516 | ORPH
   mipsel    |          pcre2-10.43           | NOK | http://autobuild.buildroot.org/results/5312a2fecc13a7036e71b787e2dab195d8451949 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/72d8bf3e618ae7797f3311fbbdbd90d77dfed4ad | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/809dac9945e24c7e0bb6cb37c38cb258b41b3276 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/12b348238bd3ef8116ac48a35d0a9d18dad38f04 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/f86546cc0934f44e0d1851a932d64d2d29790f17 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/e7665f43b97c6f90a7a8ce83eb16cfc364c3fc1a | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/93ca9899542d4ef31f3609219e09ce1db8ba7cad | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/901e5a5e394d6e0b67bff15946ece9d66398b73d | ORPH
    mips     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/10c23c9f5d79dcb8a68551a15009e9d1b3be1fff | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/38e8aeb5469314f31c78506f62a714f57ff030d9 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/9e09b7ba0c6213471c73ffc6cb3c777b4aa33b23 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/82d747d0d6b7150cba0b921cc9431c0f5bdf86f7 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/f3fe4f3cc3faee784d61006c2d8342339797af26 | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/cab7c994d73f422c33044d442099804cc4e8e57e | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/be09b888f008e2ef71ac0576d99c86c1950e615e | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/52c5fd9404896d1bff356f23d0adb852b4fde6f7 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/23f21b36a04f952447dd2c92f6b24bbb5d76e319 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/e1e9a1455587580e9888704de5f9f8cf998d8ed0 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/f744cc29f561eaf5ace3ceffea61675e5065c3ae | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/00b9dd1f574d574d4ca8151c8b312405f5359f16 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/f4e2b578385f0c3ee8df8b55656ad6e49aab1207 | ORPH
  riscv32    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/a0a39b2371e1111fba4899ef681fd348d98e64e8 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/7a7ad8157c2ff686e4356b136dce2de09e1f86ad | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/ce1327ccc6bc1517a865d46dbd533e7135668e30 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/f0c581773a7520303a38281dd3a0287389ab2d39 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/4400cf84071c078f8f015df7cbc7ee7becf0b3a5 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/1beed40c8133671944cc168713a7b644202d80bd | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/b4c0c7b230c0fca8c7061d40bfa6c301db4c398f | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/e9ab0d0453a61a9ab0877a0f5bd111eae91db4ba | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/0620e376dfd58f9cb1195d6bad4a425a6cd4a780 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/b7319fd14b169ebe471227062cbb121ccda99d4a | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/3bf3665afc0b910d1caf4966f1128f27ad5654c9 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/ce0060600347c50ae755d465aca74040f8b1ba65 | ORPH
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/389a27f104e3f948061e4703844d868c1fe346bf |     
    arc      |         python3-3.12.5         | NOK | http://autobuild.buildroot.org/results/3418cde78b02a9264e3f36c73b48549344038b20 |     
    arc      |         python3-3.12.5         | NOK | http://autobuild.buildroot.org/results/06b33cd80f4b30a34a276c2360f4b584cef708df |     
   nios2     |         rtptools-1.22          | NOK | http://autobuild.buildroot.org/results/c1cbd2d16b8cff6efe104c16594d511bedeeed09 | ORPH
   s390x     |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/7eb076b485904af7fde4d02e301c3469f8d579b5 |     
  sparc64    |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.org/results/8d727c15bdcfc434866236fccbad5c33e063ccaa | ORPH
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.org/results/bca5400fa553257ccaeebb1558c147657d142ada |     
   mips64    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/6b5136be946de8f143be6eaaec9c6848e973905f | ORPH
  riscv64    |          whois-5.5.14          | NOK | http://autobuild.buildroot.org/results/6336b172b81a651cf04d212eeb78d012fa90c4d3 |     
    mips     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/f4054e254335e9e4bac0aa84193107e1a1f3f5a8 |     
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/fb0ca47aac85a8bcb99b0f3edda853f8f1d82e90 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
             docker-cli-26.0.2 | 1 
                    fcft-3.1.6 | 1 
                   foot-1.16.2 | 1 
                gnu-efi-3.0.17 | 1 
host-prelink-cross-a853a5d7... | 1 
        ltp-testsuite-20240129 | 1 
                     lxc-5.0.3 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.org/results/d48d40e354e5a5f4b2c2feb08615640b55f4c542 |     
powerpc64le  |       docker-cli-26.0.2        | NOK | http://autobuild.buildroot.org/results/9f7f8177f1f3b236c472cc129a5c81a43547f1d1 |     
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/c276c72e9aaa4f844cfdab3db56758f122ffa61b |     
  powerpc    |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/2631e5480a8fc4f557960272af0d4b1a2bd00e7e |     
 aarch64_be  |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.org/results/bfc837fa893618e5f7117ab4dfa1d8c96a8eea00 |     
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.org/results/e405e4afe618c5c0b0047e178514d94dc0b0dbbe | ORPH
   x86_64    |     ltp-testsuite-20240129     | NOK | http://autobuild.buildroot.org/results/000ea2efabb819c1d9804927391565cda793aa0a |     
 aarch64_be  |           lxc-5.0.3            | NOK | http://autobuild.buildroot.org/results/89d36a7000a8ca981e8860634e4806868c2c03ae |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.org/results/08447d0316c516b351de17ab9b539769eb23ebe4 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
         host-libxcrypt-4.4.36 | 1 
host-prelink-cross-a853a5d7... | 1 
         python-pymupdf-1.22.0 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.org/results/1ff9dc3dd8674efd39d28565d67a8254ce8ae893 |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/ab5e7fafc0e7e4f4fa1baf1b1adaf210a8adf3bf |     
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.org/results/1daafded4dc5b456a15a74141ef847253fcfa693 | ORPH
    arc      |     python-pymupdf-1.22.0      | NOK | http://autobuild.buildroot.org/results/2c0fbd8dc5bdc779ac97caf19878aa982f991f6a |     


Classification of failures by reason for next
---------------------------------------------

                       unknown | 3 
                 libssh-0.11.0 | 2 
                    norm-1.5.8 | 2 
      python-sqlalchemy-2.0.32 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/703594d477a3cb3b1a6a6b10e55406af89b54a64 | ORPH
   xtensa    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/10e357a939aa1746d20d2db0be9f76e4151c2e53 | ORPH
   xtensa    |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/63f7a5ad7068c32794350fdf03b4f23bdb48dd42 | ORPH
   s390x     |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/9ec7431323fd9f2087b372bb1744c83332691994 | ORPH
    arm      |    python-sqlalchemy-2.0.32    | NOK | http://autobuild.buildroot.org/results/38c4b5fae65e22d93238418ce12ffd6ba3fb9573 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.org/results/c7b8ce418821c912931066623ccb2e2326020615 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.org/results/c172c9d6b45716ed12a9140e43d6127077ceab14 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.org/results/9292376eace8a30ba0361e19d22736147db7bbd9 |     



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
