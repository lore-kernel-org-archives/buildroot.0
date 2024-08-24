Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F19C52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 03:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D73E581E4D;
	Sat, 24 Aug 2024 03:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCmju_4cBpUQ; Sat, 24 Aug 2024 03:17:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE04281E43
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE04281E43;
	Sat, 24 Aug 2024 03:17:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 88D351BF387
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 03:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 787EF81E43
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 03:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWHs8CxohuTs for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 03:17:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::642; helo=mail-ej1-x642.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 421E781D18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 421E781D18
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 421E781D18
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 03:17:24 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-a866cea40c4so310365566b.0
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 20:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724469442; x=1725074242;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bxsRV0a7ptC39a4XQvZ5udOHaGOvI6tqtDv4J4qFrbo=;
 b=ZyQ88bnDIlvuaRIB2U51M5qA5YkRppzT0De4fs2c9JCW2I5FxOE6iq2gKwrhmXy79l
 QrGa4rxcTecGHMcfKQRl460DYnIwV7K04+uMtuQCfCXn7XXIRgSaLqPFTR4EnqrwDagH
 lmUIRd3qGc0RM1f9uX0BZ3b5BlIc+0Y26uhxDlyrB/HyNub3M8OJTLY4BsOchkhUOM45
 C/F2KZ5eYeW63QvuJS7HZBlzkRsndnjpvWAejoTgw5DncfLkQBtS+n8RVwpkG1WRyJOA
 KSXxfsGNqQqGw14gL0IzS4W4Rppmf7J49JYQy113NWKg8rXkEP1jN/7gyF2O+ii8+msS
 3YVg==
X-Gm-Message-State: AOJu0YwczjCWLtBOgnhaw3+/Xr5eY2btE6A97jIxr/BMJbU3zfBs0aS7
 5y21YXMEaANytGd7iaD69PtGGk/ryM7l/Krtu7bus54ShQ0xPx3UplwMYFs2
X-Google-Smtp-Source: AGHT+IHJ/IEZww5bTnLos2nhVR48TI24PGv+InrKkL1t/R6MkTsDxfR2LzoNwlgbU/WSm/56zPJZcw==
X-Received: by 2002:a17:907:6d27:b0:a86:a948:705a with SMTP id
 a640c23a62f3a-a86a9488920mr299030966b.57.1724469441231; 
 Fri, 23 Aug 2024 20:17:21 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f4f384bsm342160266b.192.2024.08.23.20.17.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 20:17:20 -0700 (PDT)
Message-ID: <66c950c0.170a0220.23512b.bb0a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 24 Aug 2024 03:17:20 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724469442; x=1725074242; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bxsRV0a7ptC39a4XQvZ5udOHaGOvI6tqtDv4J4qFrbo=;
 b=azbK4EC3/44/AAcQNTiMtzm6k8qYC019Ki/ifkXAbgNDAnAVmOyBbq8Hzp3TuqtPW3
 ejcfVUj+s+KTipR4WqDldW82brEzXxdVxFLwB7VVZD4O6//AuI2EnYPCLzGspbRMgjRy
 c3S92J0s5QlABXotZsuUmW7UoddHfJT0X5NT6Oov235pozvT6MXyLbHklg3oslsbMytc
 TeiDxaXIcIaxG7XZAq+4khdYJk8D7LzEiNc95VmeDLzJWwwVzIsdOnfb7Pl49TzrlUSg
 RNwxvtE//reMXoWklEq7iSSTc4RK/a1b0S5wc3MLl93xq6/a+qzUNUgOOZlLP2uR9515
 A8uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=azbK4EC3
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-08-23
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

Autobuild statistics for 2024-08-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 11  | 10  |  0  | 21  |
  2024.05.x  |  7  | 14  |  0  | 21  |
    master   | 136 | 320 |  4  | 460 |
     next    |  3  | 17  |  1  | 21  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 16
                     libuecc-7 | 9 
                       unknown | 9 
                    norm-1.5.8 | 8 
               procps-ng-4.0.4 | 8 
      python-autocommand-2.2.2 | 8 
host-heimdal-f4faaeaba371ff... | 7 
                  linux-6.10.3 | 7 
glibc-2.39-74-g198632a05f6c... | 6 
                  libsepol-3.6 | 6 
                    fcft-3.1.6 | 5 
                    szip-2.1.1 | 5 
                  babeld-1.9.2 | 4 
                elfutils-0.189 | 4 
                  fbdump-0.4.2 | 4 
                      fbv-1.0b | 4 
                   foot-1.16.2 | 4 
                gerbera-1.12.1 | 4 
                 gnuplot-6.0.1 | 4 
         gobject-introspection | 4 
             host-delve-1.22.1 | 4 
           host-doxygen-1.8.18 | 4 
         host-libxcrypt-4.4.36 | 4 
               libglib2-2.76.1 | 4 
          obsidian-cursors-1.0 | 4 
                 openssh-9.8p1 | 4 
           python-daemon-3.0.1 | 4 
android-tools-4.2.2+git2013... | 3 
            host-ccache-4.10.1 | 3 
 host-softether-4.30-9700-beta | 3 
                latencytop-0.5 | 3 
             libargtable2-2.13 | 3 
            netstat-nat-1.4.10 | 3 
             parsec-tool-0.7.0 | 3 
         python-remi-2022.7.27 | 3 
                ramspeed-2.6.0 | 3 
                 rtptools-1.22 | 3 
                  tllist-1.1.0 | 3 
                    brltty-6.6 | 2 
                    bsdiff-4.3 | 2 
              cache-calibrator | 2 
           comix-cursors-0.9.1 | 2 
                cryptopp-8.9.0 | 2 
                   duma-2.5.21 | 2 
                espflash-3.1.0 | 2 
                  ffmpeg-6.1.2 | 2 
               freeipmi-1.6.14 | 2 
            gdk-pixbuf-2.42.10 | 2 
            host-binutils-2.42 | 2 
 host-binutils-bare-metal-2.42 | 2 
     host-moby-buildkit-0.11.6 | 2 
               ipmitool-1_8_19 | 2 
                   libglob-1.0 | 2 
               lighttpd-1.4.76 | 2 
                    links-2.29 | 2 
          linux-5.10.162-cip24 | 2 
                  linux-6.10.6 | 2 
                  mender-3.4.0 | 2 
                   mimic-1.1.0 | 2 
                    mosh-1.4.0 | 2 
  python-pypika-tortoise-0.1.6 | 2 
                    qemu-9.0.2 | 2 
                  quagga-1.2.4 | 2 
             sofia-sip-1.13.17 | 2 
          sphinxbase-5prealpha | 2 
                   swipl-9.2.6 | 2 
             util-linux-2.39.3 | 2 
               w_scan-20170107 | 2 
                xenomai-3.0.10 | 2 
               alsa-lib-1.2.12 | 1 
                    bat-0.24.0 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
  binutils-arc-2023.09-release | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.0 | 1 
             containerd-1.7.20 | 1 
                 coreutils-9.3 | 1 
          cryptodev-linux-1.13 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
               ding-libs-0.6.2 | 1 
                    dust-0.9.0 | 1 
                 erlang-26.0.2 | 1 
                      fd-9.0.0 | 1 
              fftw-quad-3.3.10 | 1 
firmware-utils-86739f2b3ae9... | 1 
              fluent-bit-3.1.3 | 1 
              fmlib-LSDK-21.08 | 1 
       freeradius-server-3.2.3 | 1 
                    frotz-2.54 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
                  fwupd-1.9.20 | 1 
                  giblib-1.2.4 | 1 
                gnu-efi-3.0.18 | 1 
               graphene-1.10.8 | 1 
                 hddtemp-0.4.3 | 1 
                 hiawatha-11.2 | 1 
                   host-go-src | 1 
              host-runc-1.1.12 | 1 
            host-skopeo-1.13.3 | 1 
              hyperfine-1.18.0 | 1 
                    ipset-7.16 | 1 
                libcuefile-475 | 1 
                libesmtp-1.1.0 | 1 
                 libgee-0.20.6 | 1 
           libmicrohttpd-1.0.1 | 1 
                   libnl-3.9.0 | 1 
                  libnss-3.103 | 1 
                liboauth-1.0.3 | 1 
              libopenssl-3.3.1 | 1 
                 libp11-0.4.12 | 1 
     libphidget-2.1.9.20190409 | 1 
               libvorbis-1.3.7 | 1 
                 libvpl-2.12.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   lsuio-0.2.0 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                    mpir-3.0.0 | 1 
                  ntp-4.2.8p18 | 1 
                nushell-0.85.0 | 1 
                     nut-2.8.2 | 1 
             open62541-v1.3.11 | 1 
               openblas-0.3.27 | 1 
                   p910nd-0.97 | 1 
          perl-net-ssleay-1.94 | 1 
                    php-8.3.10 | 1 
                 pixman-0.42.2 | 1 
               popperjs-1.16.0 | 1 
                  procs-0.14.5 | 1 
          python-grpcio-1.60.0 | 1 
           python-rtoml-0.10.0 | 1 
                  ramsmp-3.5.0 | 1 
            resiprocate-1.12.0 | 1 
                 rp-pppoe-3.15 | 1 
                    sdl-1.2.15 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                 systemd-256.4 | 1 
                   taskd-1.1.0 | 1 
               tcf-agent-1.8.0 | 1 
               tipidee-0.0.5.0 | 1 
                   trinity-1.9 | 1 
ulog-0389d243352255f6182326... | 1 
                ustreamer-6.11 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        alsa-lib-1.2.12         | NOK | http://autobuild.buildroot.org/results/f891a60a3c668907b8a8183958b1cf745f361b7c |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/6ba64f4d079f35dcb784fafc753e2bbfc0f1dbc6 |     
   armeb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/a2a86d2f1fc304f4a13bdf401eb1d8b67b921796 |     
    or1k     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/479894fc2b1ad3fc44c34071fcef8e75c45572e9 |     
    mips     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/a7816a1e8afd8cfa2229908c7e994e0819b4f775 | ORPH
   s390x     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/67133a6d576e86ace68fb4f76a4392a658ea507a | ORPH
 aarch64_be  |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/309753584220c928ed537504340c02a91444237c | ORPH
   nios2     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/9b6c1dc7ee476e9e32286b6be014e3f5f8e459ba | ORPH
 powerpc64   |           bat-0.24.0           | NOK | http://autobuild.buildroot.org/results/6982e05b1dd256664d53261b1c9e3a2c5ca48ab4 |     
    mips     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.org/results/2f358b6bfa32f3968f2f586c35ab57958fb17964 |     
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.org/results/de956c4cfcca2d9d4a8c88890b498116bf21e800 | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.org/results/f592b5cb4258311058a72bce4aac9dd3df7ae260 |     
 microblaze  |           brltty-6.6           | NOK | http://autobuild.buildroot.org/results/63260410487037bbe1926008a02208ca6f811b77 |     
microblazeel |           brltty-6.6           | NOK | http://autobuild.buildroot.org/results/a8240ea14ca8e2f2ff185b72f03057166c1d750d |     
   nios2     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/0490d87838c8e03b2f90de8629777456658dd9d9 | ORPH
   s390x     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/91db2d0a994d80cdac63c0646638c6fee64002e6 | ORPH
    arc      |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.org/results/5cb8bbc633df19c009b928834ddea5483ca45383 | ORPH
   nios2     |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/da13d426a5c83a8d9e665ca03670430ae30c1b8a |     
    i686     |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/9f7593e4b559ca09fb6976c2c6b97431318be31c |     
    m68k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/37afb85b34b0a58ca2fdf3d7347476a85fa24a88 |     
   s390x     |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/a40edb0ad7633d5ac704ad42735332d08c7dd507 | ORPH
 powerpc64   |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/d65544e6bf81fdace023e947be013ea2b1229920 | ORPH
  aarch64    |       containerd-1.7.20        | NOK | http://autobuild.buildroot.org/results/4b169c272ec4d726a7c5d68996a06cf39d06d6fd |     
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/2aaaf722d8be933d3d79a9cf7f8cf96418aaee24 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/05ebce7b6cebb337895ea3b15de579c892bf8f78 | ORPH
  riscv64    |         cryptopp-8.9.0         | NOK | http://autobuild.buildroot.org/results/4a2abeaf5aebd0e1b7d35c172a448fcb76639497 |     
    mips     |         cryptopp-8.9.0         | NOK | http://autobuild.buildroot.org/results/d23ebd1c8956937777d42d1a1831a091a4c1fcf4 |     
  powerpc    |          cvs-1.12.13           | NOK | http://autobuild.buildroot.org/results/a50147b80111f9412e8b4148a524df969a663e00 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.org/results/bee6d56059e90b814836007936896d5cee207a8a |     
    arc      |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.org/results/0a4d17ea579d7c863d3d44e3fb810525ea3ceb7a |     
   s390x     |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/5ff5466c54305c9e14bb9bee774af5be4c4df2a6 | ORPH
powerpc64le  |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/3bd53bb0b13e2e840e443001cd66af2fa93cf28b | ORPH
  powerpc    |           dust-0.9.0           | NOK | http://autobuild.buildroot.org/results/c5d76e0288043afdd8c4bf6cb76786d113b26e0a | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/702958d0e4d432db4841f853be14cd53af19f820 | ORPH
   x86_64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/950e6a707e5f2c6fb0e216721879f8ba08b65499 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/75ae2f37070a33cdf8c6c1b0aa8a11f676fab283 | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/fddce5a25e2abdd93c482f6e53507d42f370c7e4 | ORPH
    arm      |         erlang-26.0.2          | NOK | http://autobuild.buildroot.org/results/d7bdb39131734c623a440f9864d6395d8ef280f0 |     
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.org/results/fa33d7e3b24ad3eb6d674c8c4a7a191bde619b6d |     
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.org/results/b81b9325888afc02240ffdbe0685e1c2a3579910 |     
 aarch64_be  |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.org/results/42faec4ba766b3a4f260068f5a414686d63df8ae | ORPH
powerpc64le  |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.org/results/488b693fe86fef899e7ebda209928413b84ce5cf | ORPH
  riscv32    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.org/results/5cc35f98c48d68286696eea961ad1cb3cc9647d0 | ORPH
   arceb     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.org/results/9a552f5982f44913dcd0b2bb49935f725df1c6e1 | ORPH
 microblaze  |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/01f3540a361fff0b5e73db64721769da3100ceba | ORPH
   sparc     |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/e8ed7f94d1320a583e246792a8c5d890316c9de7 | ORPH
   mips64    |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/cf91f42021076fd3680b67e53f6791ff1f9c1d5f | ORPH
   armeb     |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/b6bc6b277b176f00b4c9c9f865de11925b6c00c2 | ORPH
    or1k     |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/caff524fbbc25dadfdde41e724025cba1c0fd0ac |     
powerpc64le  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/7c06c928e01ac0fac182bfdb37200275b321fc9c |     
 microblaze  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/eec65169820c5a5d740352a6ac7b3363a7de5473 |     
   s390x     |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/c0edf5281a78540a22460338c83e4700e796447c |     
    m68k     |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/53320e214b36deb489107383c0177c82fdb4a17c |     
   x86_64    |            fd-9.0.0            | NOK | http://autobuild.buildroot.org/results/70fadbfd89bf0933f0e38d9f5c7b68ef72e20673 |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/89a076ef057696c525b67f2d19b22d33c11845ef |     
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/f55b6e5a76dd4c3ce35f015ed892c66d58b15288 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.org/results/9eb0244b643416e91b8576debfd229c6f22d9634 | ORPH
   arceb     | firmware-utils-86739f2b3ae9... | NOK | http://autobuild.buildroot.org/results/693870cfd33a15d3c3c4035810b2b7f5653273d5 |     
  aarch64    |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/0ef298a869975ad25dc849b49551841aff164d72 |     
  aarch64    |        fmlib-LSDK-21.08        | NOK | http://autobuild.buildroot.org/results/d961296fea1e6dc083d5ed457282e8344851b64a | ORPH
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/2bf5766d6fc5410a9c1f1049c6de1da935b3fd22 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/fb1c7900768cb4295e71af3981f5a19867d05a11 |     
  aarch64    |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/44f9110e05d8564e89bf2f36a7930748affee4b7 |     
    or1k     |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/73b077c5824e85f49ba9e34ddea7e02cce76b017 |     
    arm      |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.org/results/0157326c51c89f7e187d46560c1c9648b575890a |     
    or1k     |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.org/results/e067ef499bdc9cfa14291231455691311d00a2b7 |     
 aarch64_be  |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.org/results/dba9781fcdc4ef79f54ff4eb245dca5eb13f264e |     
   mipsel    |           frotz-2.54           | NOK | http://autobuild.buildroot.org/results/077e4756e56903f094b935af4ee8829507e0c3de |     
   armeb     | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.org/results/79659364d39cfa2139141688109c452db11b07b4 |     
 microblaze  |          fwupd-1.9.20          | NOK | http://autobuild.buildroot.org/results/a2fb94416483a2481ee8fa083a5a1222c5fea3b9 |     
microblazeel |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/90873a024ee1f94b64b08cd4bafaba92e5ff35b0 | ORPH
    arc      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/3eb2aa3e70abc3786622bef76e927c0f7418958d | ORPH
powerpc64le  |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/349b3448d393676565259d5283eeb12a51afa190 |     
    m68k     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/20d16b2590906c1edd66acc9ea56d4a9c4452d4a |     
    i686     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/94060ef699f8ef652d7c35b67d343bd03399955b |     
   sparc     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/fba3224d25a90e0c3b2418b1a1bc2b8e3a054267 |     
   sparc     |          giblib-1.2.4          | NOK | http://autobuild.buildroot.org/results/99810afcfded061e6f244098a42ed6395957b280 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/9a98ec0fcb4acdb72c13c7ce3552613a25cc8d7c |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/64af5e3c2f593fec6b7e339763e0d1869f758b4a |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/0e593df5c86cbf1b1f8678f69331afce3e91dafb |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/9f0a4d69aed71a840b1c278a9623c9687207ffc6 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/81a0d234d01b60e305cd35e30efac4b9178965ba |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/2b7765f3d96fadc98f66b2a68a938856d28b7388 |     
   x86_64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/fc1061b303cee492480e21dc9078b6df34f514f9 |     
    mips     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/fe9a40cbbe3b08cbcfb86de4c3c85981841dc048 |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/09c5340e3cf2304c8c42698fe5322dc2e1a9dca9 |     
microblazeel |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/8fcb9d358a7564224f6ebcf2275f332351c7c4bd |     
    or1k     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/f5d05dccb9c49111a4c7105ff4031f41147ece50 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/e24ab546694d6368a5bbe1716164ff0bebb1741d |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/10ffccd97cdc92238ccf24a473ce3b6b547a29ec |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/4a9073f65d60b16adca70506108af8c6325b3735 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/c97b0a79ddd2a8989b7479adb305deeb23ba268f |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/c010ee375ce9245557fcb94868fe5bc62ddc9920 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/078ed2a193c235f24d54402a51ef1f494b479917 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/f930ede3aafd88b7550fb1334a068cb87fa16990 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/82ecf5656961f8657d2c950e3085d75848299cdf | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/c0e75ea681324e9422d37502e6048d98b6689649 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/e6063e1ce7fe38b746fd582aedf7444505ee26b6 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/3dc80714f93e84e3684a94144dfde5cb020dab46 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/4980790483e413fbf7432022a4a8b8a8ded501b5 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/c7d3d51dd496e87604dd230bf6aa38c618f19605 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/67cd37ec413b29cc06ea9fe69fc3df2621f0bb92 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/9be28bc7f1dae41f18c702c915e1a5aa676e3170 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/1583091593746b5dea93b4539601d65032794a7c | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/ff6cf8b2097eb57a204b63e9b48e17bb1602c87b | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/83cba4694d1fef9f69718034227e8c3be78fe07d | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/0449df35a544adab0d4c383795e0991dc60a9fe0 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/9d7496da043c978893169b6e3307ea67116231cd | ORPH
   x86_64    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.org/results/90962270e5b1e20f69d07eba08a5c9ed869d1c38 |     
    arc      |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.org/results/71d10b034013b5e5abcfdbc14270bbc8470cc44d |     
 aarch64_be  |         hiawatha-11.2          | NOK | http://autobuild.buildroot.org/results/a7cd01a1e834cd9c1e7fdade68dad4b0b2b383c3 |     
    or1k     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/dd186d383664909ef30545bef89f3e4b406c0dc8 |     
  sparc64    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/079cc6b832990e22071fcdb5bf22d2394c86bd22 |     
   armeb     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/bb9094bd34c86c92ce0e6684626ca77e5094cadb |     
   s390x     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/76f3322c2e9e7136c1fb5594ef8782a67952d9ca |     
    mips     |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/b1b728ca3b0137541a755f6c7d4b6bc54c77302b | ORPH
    or1k     |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/12eba7865ffcb3dc8b97c1639876033b7ccc362c | ORPH
    i686     |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/02ec374db470a126df6a8097d14a2f0ba69e8dec | ORPH
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/ebd5a4048a0a32f89d514d24473641c880d0a985 |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/7a3ffe3ef9804696e89fcd25d6676c4212b2de3d |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/c0303f7a894b42b971ec527db496c8c069a3b96b |     
   x86_64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/176ce1c979f04a154b41591560ddd3d7c1a2df9b |     
   x86_64    |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/78f9f0032a09d3f11428b4ba05da58500cb6005a | ORPH
   sparc     |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/23e6ffa2df5b728325a012be7088a3ee5ed9b1d7 | ORPH
 microblaze  |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/5d878aaa375e1490edc70949ed9cec034543e72f | ORPH
    arc      |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/3a5775902a9e55cfdcb49bd51f05d4f23df03baf | ORPH
    i686     |          host-go-src           | NOK | http://autobuild.buildroot.org/results/ae2fbda8af9e0f15733286e2832cfe8c7389edcf |     
  riscv64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/83607a6dc54812e530864ce3f8bfb8c3929a74bf | ORPH
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/db62b16e2f9bb754f646c35e0c5b680f44f51866 | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/e375d2569a86eb23a42aa8ab9f8175a1df99eb6e | ORPH
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/cbd69228a852e221a4ac79c5f883ad6e0130b714 | ORPH
    i686     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/37c6eca6233512316460753f0be19e7a23138d4c | ORPH
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/835e0ce2956db66a18b2cc90fa03069fe0f484bc | ORPH
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/6894231a489ca2e6d703c37bf6cc74b3ea553517 | ORPH
microblazeel |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/d20a634090948f4b78c30f0198503968dcdb4142 |     
    i686     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/665355dc5cbd62420bd7570d285697873d798899 |     
    arc      |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/b651fb5d00cf51e5b25cb77113dfcfd8c6ea49f1 |     
 microblaze  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/6cedc8c388054f4a1c89726360002cbccc278bbc |     
   mips64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.org/results/7a67e74f793104e7e0ab78cb446e15ddfdaca396 |     
  mips64el   |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.org/results/91f57ccfffed1326860e32b5f43bc04fec6d7edf |     
  riscv64    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.org/results/36ad6368c9cb9e95b97efdc27447a4b7802d5044 |     
  riscv64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.org/results/b8d96920404cd2d3455e292bd8379f356ff1173f |     
 microblaze  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/af679d138336f6c526727b3b777a3f86bc9aadfe | ORPH
    i686     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/d001624388fce614ec6c631a1870c88dc492ba25 | ORPH
  aarch64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/fad20bfe492cc831982a500ed79f2766cd069b63 | ORPH
powerpc64le  |        hyperfine-1.18.0        | NOK | http://autobuild.buildroot.org/results/855365673fae4cfab22400017838b6805ac1de2a | ORPH
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/9bd307f834b56c8c16190c20a1e8a867363d7544 |     
   x86_64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/84aac60326b131626e38a3dcb98acd95dc411aef |     
   x86_64    |           ipset-7.16           | NOK | http://autobuild.buildroot.org/results/ad7cbdf93ec7e490a6bde58f593958c6980344c9 |     
   s390x     |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/b34c9b26f4f8df13d5e1d90f82eda546653943ac | ORPH
 aarch64_be  |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/692bf80a0a648dd1e64f644e97ab0c1efee2721b | ORPH
   nios2     |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/5ec8ae765b2017efbf4aca4e9314c0853b96fe7a | ORPH
   x86_64    |       libargtable2-2.13        | NOK | http://autobuild.buildroot.org/results/79fd68290e49fe7607b3c912a0ca9526440a7425 | ORPH
  sparc64    |       libargtable2-2.13        | NOK | http://autobuild.buildroot.org/results/5b5efa818f3573d6805268bbb0f44e1d076175c6 | ORPH
    sh4      |       libargtable2-2.13        | NOK | http://autobuild.buildroot.org/results/593e7954b35156a1f400506ed6ea7b779292a9e8 | ORPH
   armeb     |         libcuefile-475         | NOK | http://autobuild.buildroot.org/results/143ba472a0c8d11c79553b142a344d3e1d475207 | ORPH
   mips64    |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.org/results/78bfedbc971b4a92caf54541a5db3794f815a6f0 | ORPH
 microblaze  |         libgee-0.20.6          | NOK | http://autobuild.buildroot.org/results/f15a116ea7354d47e31101c3e8b8dfd0fc891d2a |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/f2765cda855e0bbb161d5b62174af83115cd770f |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/53178183236ba77e386fcb0c048c8fa59a9c77a7 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/78483ad0079d5e4d93fb2c954a7fb1dead17dd10 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/d05fc2f1237f090e28c15117efd344be1587e3ca |     
   mips64    |          libglob-1.0           | NOK | http://autobuild.buildroot.org/results/0975c8ed7da478c7547fd1730c9d346c9d5fe927 | ORPH
    sh4      |          libglob-1.0           | NOK | http://autobuild.buildroot.org/results/b231f95ceddf759cdc731ed2df8c6c6aac1f9d85 | ORPH
   armeb     |      libmicrohttpd-1.0.1       | NOK | http://autobuild.buildroot.org/results/33003f2473814e220b54983ff748ed8ac68b2ee1 |     
powerpc64le  |          libnl-3.9.0           | NOK | http://autobuild.buildroot.org/results/58597fdde8b3bc6afc5acba4b4c4fd4a9db6725e | ORPH
   armeb     |          libnss-3.103          | NOK | http://autobuild.buildroot.org/results/e4d24753b3506c804ad3432fecb036395e236600 |     
   xtensa    |         liboauth-1.0.3         | NOK | http://autobuild.buildroot.org/results/40b959f86c1773a7847fc57f51e0b37f45d6ebe7 | ORPH
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.org/results/0f25e7f33878e77bc230b3c4a4d3e2b5831d2d3f | ORPH
 powerpc64   |         libp11-0.4.12          | NOK | http://autobuild.buildroot.org/results/9080a705bd44ae9f153fe66b62e61deb44668b94 | ORPH
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | http://autobuild.buildroot.org/results/950be0cce22f0ec03b2364617ef05d8fea2c344f |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/242c4ee6bf55badda71675d92db978e66c9f59b2 |     
  riscv64    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/9f63dc59c049a0268ce88b509fc532dc3b0fbafa |     
powerpc64le  |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/bb76e96229800cf16370f9667cfbc8b248da8a7e |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/0d9372ce34bf1bf0db5e59ddbbc4dedc5896eb53 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/909603237c07d1bb8f83642800b3a8f6a55a0785 |     
  riscv64    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/794fff6b9d37a9993291eee4eb35c3acaec0fd91 |     
  mips64el   |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/04fc3067ca2da008f283817f3541ae600501c68a |     
   mips64    |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/1830401a76ce98cf0a553cadef8a88ea08d02181 |     
   arceb     |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/66db6fd3432a5deafacb210b854ce18a7757c75d |     
   x86_64    |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/c4c24bd06bc7889c46d78e14d5bef528340d4463 |     
    arm      |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/cc23c36d57f7025930caa68e0b3fb8f11c8668bb |     
   armeb     |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/e601cc0e25d33cc6c8073adf75f44baa24ea4310 |     
    or1k     |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/7bede9eef63b8746519630091fd9ce6dc8447204 |     
  aarch64    |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/8c33d5d6328d6f1869c9c7ddda150639aadd19b2 |     
  mips64el   |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/a0dd17dd3303d29a5f64b681ce7d417c7ed690e5 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.org/results/e6ed489dbdd047842d79a3d29723042575eeb9c6 |     
  mips64el   |         libvpl-2.12.0          | NOK | http://autobuild.buildroot.org/results/a4bf867aba6ff86787730c5d7578a0679262cdd8 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/2ee819882d1165d3b3b838cacc66afe6be6b4be9 | ORPH
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/88a052599e21d50f198462a9894567dd1e65e9bf | ORPH
   arceb     |           links-2.29           | NOK | http://autobuild.buildroot.org/results/3127181f36e0ca77ed429246ff121b5a7a290d7b | ORPH
    i686     |           links-2.29           | NOK | http://autobuild.buildroot.org/results/09ccbb30a9ced2655670a1b45ef16b680708fa2a | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/d3808720ee84dfb82e67030464401ad286f24186 | ORPH
 aarch64_be  |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/c5c99a2493d7d72dc2d47e531b0d04e6f1f59386 | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/543f2e163875898f00ed17068a4c4212f801657a | ORPH
  mips64el   |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/1a327d4344d95c2c07d53f737dfe6e3a8a51c415 | ORPH
   mipsel    |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/8a4d14f262fb2eb144faae80bd49aa965bcd67f3 | ORPH
  powerpc    |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/e8ebbed1603e935c5922db16bc47297a467c2dc0 | ORPH
  aarch64    |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/bedc31a4e16aeb87049a01500bda2990681d30b8 | ORPH
    m68k     |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/258518c767adf3d4419b8d93163587786d0c5d29 | ORPH
    mips     |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/d3d77bb758dcc5052c5a77b3ae885038207794cf | ORPH
   nios2     |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/de147bfd6796a1d3ef721b0f577b20938ba70050 | ORPH
   sh4aeb    |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/f54fd2a889607fc373be86946f059ed9df736ba9 | ORPH
    mips     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/6441d8beb2a92b4064142073b91a5af4fee070fc | ORPH
    or1k     |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/0c6b91ad979fe9e4145f2b991fb52fa60a65a662 | ORPH
    i686     | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.org/results/8f65a8ade1b62067d192ed712aa4292952e5babf | ORPH
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.org/results/d21fb386cd2bc941695d2006c487b68896916cdf |     
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.org/results/92508995044289c11cb5aedebf2f86472d8cb85e |     
 aarch64_be  |          mimic-1.1.0           | NOK | http://autobuild.buildroot.org/results/1883b3ab7f36ad310bfa059a408183c24e2034bd |     
  sparc64    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.org/results/dafd44e4852638b8ba7a83daea12441465cb1a06 |     
powerpc64le  |           mosh-1.4.0           | NOK | http://autobuild.buildroot.org/results/4a840f0ed2259408f3a2be615ee89e2698db2bf5 |     
 powerpc64   |           mosh-1.4.0           | NOK | http://autobuild.buildroot.org/results/8e8ecccf6a390d7110ff93f1e9a06b2cf92ecba2 |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.org/results/9981d74a7c77069abc708d10c7bd5be624f92ad1 |     
 aarch64_be  |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.org/results/1f2f01cd4ee821db7747a07138477cd3f4bdf689 | ORPH
   x86_64    |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.org/results/828023782459c795032496f65ca2ffadd07b00cc | ORPH
 powerpc64   |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.org/results/90291680db1d6526eb6a2396999e0432f8e87b79 | ORPH
   s390x     |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/753150b83496529aea9ebe5229d9340ab36f8f3f | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/01a4889d45668786a5a9a0ddff04b7ba171208cd | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/3dc0ec035a5d72265d7022df67c9907c99df5955 | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/1e5ee7cf61a4e87da97ebfa59864f7eafafb0ca1 | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/6fa9e5989ad6cc4a691d306629d60c22a0949068 | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/a231a28681fa86b7ee110bff11cecf3e7e26a097 | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/0aa28836019c522438f6e3c796a8716ad2f04a95 | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/36c6964b262f5f23fc8cd31b8607c572ff81b9d1 | ORPH
  powerpc    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/a2306331f99dd9aaa5b65ebfa1bce06f495b4261 |     
powerpc64le  |         nushell-0.85.0         | NOK | http://autobuild.buildroot.org/results/222358b9d6d96e1899cea9708b0a88df66a36f58 | ORPH
   sparc     |           nut-2.8.2            | NOK | http://autobuild.buildroot.org/results/5c1305901b1edc63ee3e61c6f49ca83de78c66c1 |     
   sh4eb     |      obsidian-cursors-1.0      | NOK | http://autobuild.buildroot.org/results/eda1153c04b497f406339a2b953f524d43cf8e81 | ORPH
   x86_64    |      obsidian-cursors-1.0      | NOK | http://autobuild.buildroot.org/results/3747fbf72e8c83e8951a5325533222c91e5264c5 | ORPH
    arc      |      obsidian-cursors-1.0      | NOK | http://autobuild.buildroot.org/results/0df3f133d75a5b488929b6fa5a097fc0f5367e07 | ORPH
   s390x     |      obsidian-cursors-1.0      | NOK | http://autobuild.buildroot.org/results/e9d91de3a584d97cc047bc835da0f2380432130a | ORPH
   nios2     |       open62541-v1.3.11        | NOK | http://autobuild.buildroot.org/results/c1e0252a99f3d8f07ffa56540b91949d914b235a | ORPH
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.org/results/ef02ff1a794c770ded4cb9eff5ddcbd3a5404e45 |     
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/46e5c97ba227a3c1b3a84296edaaa99b7242fda1 | ORPH
   armeb     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/bd67d439561aa684209630f720b45db07557a45e | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/3c47fb385085e8c7e4601e96102cf0898244da28 | ORPH
  powerpc    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/62fcc6b7243f2e4da8464b0acfaca7df63043651 | ORPH
    or1k     |          p910nd-0.97           | NOK | http://autobuild.buildroot.org/results/ca3d0276c7bc0478c566a1a53984584390157e70 | ORPH
  sparc64    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.org/results/1ec09e28b6616c09d12940858f936f3a562025fd |     
  sparc64    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.org/results/4f2f25c50b8d9704a935d2989ce194d85f827207 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.org/results/9396ec0c8b546c54ca6f37b01242623093bb778c |     
   s390x     |      perl-net-ssleay-1.94      | NOK | http://autobuild.buildroot.org/results/f930c7b3219a57421c1b0a0ef3a4445c19b43e97 |     
   sh4aeb    |           php-8.3.10           | NOK | http://autobuild.buildroot.org/results/ba87aaeed033a67cae7a0973b2205b883a42bcff |     
  aarch64    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/35add57655a9e915fb0e1de2ec67ddb3567d19cd | ORPH
    m68k     |        popperjs-1.16.0         | NOK | http://autobuild.buildroot.org/results/c7fd2fe60366f368b91f29ae3e7750bd4d32d713 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/05ca5ae0e5439d5c8f3ac3b16848753b2eb70875 | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/d2dfc28e349cea28d200c7f168fa7e6b29e86685 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/94050f9522f29e9a4240ca601e5017fe2c8c693f | ORPH
    m68k     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/7b60b12cb824defec0cf3e27c2a2ca70bf1cd20c | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/4133c2fe5984b48aac2a4e390b21c80927440b5c | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/f97d11a746087ebcc43979698ada502e54d6ffe9 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/68d672e116f84b8bf0f43bf4eddc01485f08e663 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/df035e205ce0c57c9855713489240df767369657 | ORPH
powerpc64le  |          procs-0.14.5          | NOK | http://autobuild.buildroot.org/results/2aa65f101f1fd64e5c550b91d5b679edbd788db4 |     
  powerpc    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/14552fc2076c59e797524518d776176553763a52 |     
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/8ca771b8720c26292b5f31bb9df487acf0d37edf |     
   armeb     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/93ab4cb11915f80204660de31069b727b4cd429d |     
  powerpc    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/3ab4b082ef247f8fcfb45c4fc99a286a2bdac295 |     
   sh4aeb    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/478743e4eb1217f27ad3445b7c6b9836b9ee6689 |     
   nios2     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/b3d6d030707204eade99d6db1f8c4c92ea12e9a3 |     
    mips     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/06d4a6f92792b967a2566d4d28a95ddfad0a0305 |     
    or1k     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/006aff89e3914b7265372ce5420dba500ff6a14e |     
  sparc64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/bcadbfa8bf7385822c0db4ed989b6e72c576a88c |     
   mips64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/b9485a7b1258a63e73e7f95388b7ea4196e3d9de |     
powerpc64le  |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/e68f3d71fbe1f0b73443c78bbd6a42bafdc95156 |     
    mips     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/e13597a7eae8045f97b00a0a4bd34bc16a7b59c5 |     
 aarch64_be  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.org/results/a5ffa2b4bfe02257e56c8788a04dbf305aa7d758 |     
powerpc64le  |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.org/results/d794a493ff2fd235001334ba5b2a5e3a984105e5 |     
   x86_64    |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.org/results/aa100a4782a506a6184b330216945c7366b4480a |     
    arm      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/2a1b162c77798abbe33808ede6862f30882363c3 |     
    i686     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/aa12961307a1f7f0f26160641261a6d97da01c64 |     
 microblaze  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/b744038f3f1d9234f7b410d1ea73207526b6805e |     
  powerpc    |      python-rtoml-0.10.0       | NOK | http://autobuild.buildroot.org/results/4b6aa118e53f4b771d88e86b4aa4f83a94ffc393 |     
powerpc64le  |           qemu-9.0.2           | NOK | http://autobuild.buildroot.org/results/faaedb6ef71be4955675a1e46fd2602e271d8cf5 |     
  aarch64    |           qemu-9.0.2           | NOK | http://autobuild.buildroot.org/results/29eecd2802d43e559880fd01fb7e96d9f80f2b8f |     
   sparc     |          quagga-1.2.4          | NOK | http://autobuild.buildroot.org/results/ed732e0e8345e9ecc2a728648baebe7291e58a0b | ORPH
powerpc64le  |          quagga-1.2.4          | NOK | http://autobuild.buildroot.org/results/a73a6c5a69fc984d279dff1bdd615813a8ae2b39 | ORPH
   sparc     |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.org/results/e5a937ec51ae080e19e190628560023dc63e938f |     
   armeb     |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.org/results/25cc5b16f498c95e0c25ac0985053eca9ee35fe4 | ORPH
   x86_64    |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.org/results/a90811cf7fb5834a6bbbdd6acec4bac116802a28 | ORPH
   sparc     |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.org/results/fd3a198e6013af443296670816bbceb24ceeab37 | ORPH
   mips64    |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.org/results/05902145aa7e7f8b64e190508dd5b8b51457ac4a | ORPH
    mips     |         rp-pppoe-3.15          | NOK | http://autobuild.buildroot.org/results/17792c73855a9fffebe04421aa7f295bc56d8a72 | ORPH
   mips64    |         rtptools-1.22          | NOK | http://autobuild.buildroot.org/results/6f42c5e9a31b22b56ad8c082232412baf3ce8ef5 | ORPH
   mipsel    |         rtptools-1.22          | NOK | http://autobuild.buildroot.org/results/92de1c9f0092cbf323f8e77c62172e4ed317829b | ORPH
   armeb     |         rtptools-1.22          | NOK | http://autobuild.buildroot.org/results/aab805ad32320833b435ccd5285bd4cf916ded28 | ORPH
 aarch64_be  |           sdl-1.2.15           | NOK | http://autobuild.buildroot.org/results/41d9913f74de9f1dcc8097629e75216835d12cab | ORPH
   arceb     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.org/results/8a4a75f252fefa3e005f2244dc1347f58e86d212 |     
   mipsel    |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.org/results/1b9906563f2d9369fb0a834a132cbf1abc7141f8 |     
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.org/results/4927e93e40ec8bcda107f4bc3d8aa83024deb674 |     
   s390x     |      sphinxbase-5prealpha      | NOK | http://autobuild.buildroot.org/results/804f64a208b4737d1c1a2462d1cb213a2b8fd18f |     
   arceb     |      sphinxbase-5prealpha      | NOK | http://autobuild.buildroot.org/results/d82ef26ed9e6c94edc0f6e2514190209053b14b0 |     
  mips64el   |          swipl-9.2.6           | NOK | http://autobuild.buildroot.org/results/f9d11e910feb60956485bb0805c91bb75bb0ee17 |     
   mipsel    |          swipl-9.2.6           | NOK | http://autobuild.buildroot.org/results/31c288d45c39bbc9d63140de44e8b0465d753d75 |     
   x86_64    |         systemd-256.4          | NOK | http://autobuild.buildroot.org/results/64e7b3a1d21c0afe1f70abb016c008f85ff3d28e |     
   arceb     |           szip-2.1.1           | NOK | http://autobuild.buildroot.org/results/7ede7e03c6bd34a45043d49ac56c9be254bd71e9 |     
   mips64    |           szip-2.1.1           | NOK | http://autobuild.buildroot.org/results/82cfdf1ea7e234092ffdf4e1116b6ddc7311fc11 |     
   armeb     |           szip-2.1.1           | NOK | http://autobuild.buildroot.org/results/22e87fc44d99054024ed875eedbcf2f53bce9b87 |     
  aarch64    |           szip-2.1.1           | NOK | http://autobuild.buildroot.org/results/35d08103bbd0da22a5e111f1f86f28aba7062ee6 |     
    or1k     |           szip-2.1.1           | NOK | http://autobuild.buildroot.org/results/de3f83c81245308a3c5579a0873a215f57e1569a |     
   nios2     |          taskd-1.1.0           | NOK | http://autobuild.buildroot.org/results/860d0c2f06a0c4cd1221a64b419b37037bb78030 |     
microblazeel |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.org/results/bd28ff2ae4d8a4a64dbdd8ed77573600be442b46 |     
    arm      |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.org/results/53f0eebae6660a993db0522d6168701fa6a59e7d |     
    arm      |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/9eb1b6848cdbfa9b93f0934dc8053f66c09b9910 |     
    mips     |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/968846f36e7ade49a249e6a2aac1f3f27cfa0b45 |     
    mips     |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/9b1124c676c2e11c73b0075ade17488dc3f3e742 |     
   armeb     |          trinity-1.9           | NOK | http://autobuild.buildroot.org/results/87aa8f6396186a782648ee2e0b6b9efd8abb3858 | ORPH
   mipsel    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.org/results/3019d64931bc8140a9f470ff3a0a707b48f17263 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.org/results/587cedb9399d5856e5703866ece80fbac348e903 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.org/results/b557cf25d087d317f0e61b044fb54887667e293d |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.org/results/fab217d68351c40cc5831d99b2f9b3e7d7dc9ca9 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.org/results/237c13a89863b6c739cc0591bc9aa83014f04ede |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.org/results/2725b9baf9fa196077cccd9c87aaed611dbf0eca |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.org/results/5619d04f901b4bc6496304236b362925a3b4625a |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.org/results/fc5c32ef27b2b28e2615d43d73c45de1639024bd |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.org/results/d37b9e5832abcaefe1c1d195d0b24f29eb6d8635 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.org/results/e37a553abecbbb10b0206c627faafcdb3191eb77 |     
   sparc     |         ustreamer-6.11         | NOK | http://autobuild.buildroot.org/results/747d13fc4afb7c51161772c2806bf95291b5ef1c |     
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.org/results/aca48a7c6f4b4c8ffadaf63c68641d108ecf39be | ORPH
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.org/results/9e4a31937fd8943f65262d890460d08a2de11d7d | ORPH
    arc      |        w_scan-20170107         | NOK | http://autobuild.buildroot.org/results/9bef51c5cdea95f904247e1d3570683533e657de |     
   sparc     |        w_scan-20170107         | NOK | http://autobuild.buildroot.org/results/065d4ba92f3d373b4048be004bb8c1b70900f91b |     
    mips     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/3eda15d1f535df5156fcaf1c78ad7a8b3e1bd38b |     
    m68k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/986b43246c97386216939e075ef2c604c2553cf5 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

              host-rust-1.74.1 | 2 
          libcamera-apps-1.2.1 | 2 
                  bcusdk-0.0.5 | 1 
             containerd-1.7.18 | 1 
 host-binutils-bare-metal-2.42 | 1 
             host-delve-1.20.2 | 1 
               host-go-1.21.13 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.org/results/4639757ad669afcfedc8fc19996dfeeb12ff913e |     
   x86_64    |       containerd-1.7.18        | NOK | http://autobuild.buildroot.org/results/1ab0f16aada77e32093810b854a8468459278139 |     
   arceb     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/3cb14a4f0381e4aa1ede07c6af9e73b0ee8bcbef |     
  riscv64    |       host-delve-1.20.2        | NOK | http://autobuild.buildroot.org/results/624a85cdd4a3d1c5546aec99db183ff8be74129d |     
  mips64el   |        host-go-1.21.13         | NOK | http://autobuild.buildroot.org/results/fc9e541a1a91fee9e3b7202b3336852e653efee3 |     
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.org/results/21b7bfcc9f6c0c792240df44d32acf39e2bae19a |     
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.org/results/62d8cd14b5fe49c24d7e5cf827431e4bbf70e108 |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/bec6984899dd5f51aa592ec2105d82853164f041 |     
powerpc64le  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/2bb80dc9478ca5b80d933ed25bac0a89ea568814 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.org/results/b2f70a302707732d137804c778d7750cc9201a71 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                       unknown | 3 
                gnu-efi-3.0.18 | 2 
                 coreutils-9.3 | 1 
           crucible-2023.11.02 | 1 
                elfutils-0.189 | 1 
host-heimdal-f4faaeaba371ff... | 1 
           mediastreamer-4.4.8 | 1 
               openldap-2.5.16 | 1 
                 shadow-4.14.5 | 1 
ulog-0389d243352255f6182326... | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/8dae73447bcf9da383c8feb30e8d4ebd0b86b2b3 | ORPH
  riscv64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.org/results/423fba0862e2443cec7480fc7b1f0f7a56a2bb9e |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/e93b9b1b61ad4000d13c1b4ce9608567ae5b8657 | ORPH
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/625846db496c24039ae9e50d1bc24106387f8354 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/f12782f034d22ea9d8af949fc5876ae100bee708 |     
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/17d2d19c2424916a2cd21ae210264b9d5cb4e441 | ORPH
 powerpc64   |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.org/results/e2a54412f920b16f371c65f1acbbed13fa46411f | ORPH
  powerpc    |        openldap-2.5.16         | NOK | http://autobuild.buildroot.org/results/aad2deec885a4ab05e5dcdfecda423a0afa71750 |     
  powerpc    |         shadow-4.14.5          | NOK | http://autobuild.buildroot.org/results/6796ea8e51574ac992909a5d5b337d77228c3866 |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.org/results/c7d33044e9abc283c6db95ef673dca9ee0286246 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.org/results/19b68b9015d404ae265b3716853dede332a3fe4b |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.org/results/cfb30bed7a832f211673768671d3aa77519db087 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.org/results/8ee5583c45dc31119a2f437bedfb7252800f047b |     
  riscv64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.org/results/28c71cc081059f963a1d63374074f788164c06a8 |     


Classification of failures by reason for next
---------------------------------------------

                   atop-2.10.0 | 2 
                    bat-0.24.0 | 1 
                    fcft-3.1.6 | 1 
                gerbera-1.12.1 | 1 
                 highway-1.2.0 | 1 
            host-binutils-2.42 | 1 
host-go-bootstrap-stage3-1.... | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
        ltp-testsuite-20240524 | 1 
                    mpv-0.35.1 | 1 
                    nodejs-src | 1 
               pulseaudio-17.0 | 1 
           python-daemon-3.0.1 | 1 
          python-grpcio-1.60.0 | 1 
         python-remi-2022.7.27 | 1 
                       unknown | 1 
                ustreamer-6.11 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/75fe0ef89720ec6a9baa3df11781684ab4b3beb5 |     
  sparc64    |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/a5a359b5bee5c39ac2cde1df9b3c264782791783 |     
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.org/results/88eb320e7d6fea52263a3dbadbed8e98c9a20d4f |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/81da808183c23d05e48a05b66325deeb27d44578 |     
  aarch64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/9707e0eafbb9dbcc4847c3c8ed717a107e38ccc6 |     
 powerpc64   |         highway-1.2.0          | NOK | http://autobuild.buildroot.org/results/cef5380814d46c5b94982c9bf867ec8f2703581d |     
  aarch64    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/72c48003acb422667f0765d0a367724a2e1f9532 |     
    sh4      | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.org/results/dce96bda999c498bc952d0988a7ede5e3b99009c |     
  riscv64    | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.org/results/014dec6e6bc1f57fd37827bc608776009277c4c7 | ORPH
   xtensa    |     ltp-testsuite-20240524     | NOK | http://autobuild.buildroot.org/results/b7814823af15f6adccf9cfbae442251dfd820d28 |     
   mipsel    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.org/results/5cde61d2f4c763d57f300c6c4354f421b6dc5544 |     
    arm      |           nodejs-src           | TIM | http://autobuild.buildroot.org/results/d289858edd4403594bf7e88471bf9d6754fdf3a2 |     
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/e37728902adac6802f87384946659d4e7592c78f | ORPH
   mipsel    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/187a7ed31474ffdb02b3886b105c6f8cb135af88 |     
 aarch64_be  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.org/results/da276705591dabb825afd51d8d5d9f1ae297e5bd |     
 powerpc64   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/2a2aa5eafd32501b84e9efd3329925a869dafa11 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.org/results/9a1a031b921bcdddc3675f045e920082e013a5eb |     
    arm      |         ustreamer-6.11         | NOK | http://autobuild.buildroot.org/results/fc61b43c1af9d4674e97d77cfb6c31031fd0aed5 |     



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
