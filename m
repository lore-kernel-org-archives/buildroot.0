Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF212C021B1
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 04:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 550B182254;
	Thu, 20 Feb 2025 04:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGVEwdXyhmmb; Thu, 20 Feb 2025 04:15:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1859682264
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1859682264;
	Thu, 20 Feb 2025 04:15:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07A70194
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 04:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E77F540B88
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 04:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJTxtkBQ_XKn for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 04:15:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED0E840A84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED0E840A84
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED0E840A84
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 04:15:27 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e04861e7a6so821769a12.1
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 20:15:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740024926; x=1740629726;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4hCfpFhmatI2EZ1ZlTnIvcOomOHZxYZcRKwiQUoNUsY=;
 b=IjTN6XJ5SFQrp+n2BDPjpvXlmwMvAO6mJuRSrsJZ+fpXFpj8nGKruS8Iiovt9VSCoN
 gIB0O1qLkQnr5MV7iMdiNMi6Dk39leQoOT5WXoAY5us8XUT4HdIHV7zIrqa13aw26OQU
 DaoE19NGtuFOLanfhHhgUxS0Rr77uu/phj4oG0YjUb9ZISIvf6rCD3t0hlzo9MjROYSB
 0N9rtqw2WAC0fqhKii9uAXPaCA45ikC5Fq9j09iRT0a2aGtYK3uPKor5MI6WDsrDEG7U
 Ano0+W/sO/RFyfFQRSNy6V59bDBEQR1+8VQZSiUiXhqnk67gypNufatn+OD02mJ7LQCl
 crpg==
X-Gm-Message-State: AOJu0Yyfwz2MB26sv/IE+p2boUx/iuJt/Pzmkk1LBHVEUY+AWgy3V6Lm
 BWQ4ePvmhRB2bb6QVRHxCkKeetQ+JuVnngNRX5NW1dSInpkNodWYjmblag==
X-Gm-Gg: ASbGnctmiBHfeTiLqt7W/R5+LjHzSDIxEHzvrm360vQQvPVJ5P/XB1MBWneNi1BIz7h
 b6uvhe5uui5sBiaacscpmK6cWePGDMK4e+wUxIIBWfK9Aw/nARwKOPfJKqLwkVBGwSChl79/ZHh
 hmC3If1MIgeXPr7PI5wpbPsuwIuSn9wjEKuclE00j4GvY07Fcq3WA33oE2Ix8vm9F3L2I6645Ln
 G+KDRRxBnquxzniwQcCWtaGi1VwVuiLG6trCbpfloYw7ZWwHL/q6blt8Yn1DWYF4Mqla73krSVQ
 RoVW5vdF8tvSbfzN6MQ=
X-Google-Smtp-Source: AGHT+IGpeemKD8Nz60u6DTCu+6Guq1vUpKAuDgTB5L5tUEoOBvGj4ezdOEoJcBW7Z2GZrlWJs21pEg==
X-Received: by 2002:a05:6402:5306:b0:5dc:c3c2:225e with SMTP id
 4fb4d7f45d1cf-5e03607063fmr18267927a12.8.1740024925437; 
 Wed, 19 Feb 2025 20:15:25 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece2866e7sm11358290a12.65.2025.02.19.20.15.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 20:15:25 -0800 (PST)
Message-ID: <67b6ac5d.a70a0220.1943f.bf70@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 20 Feb 2025 04:15:25 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740024926; x=1740629726; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=4hCfpFhmatI2EZ1ZlTnIvcOomOHZxYZcRKwiQUoNUsY=;
 b=Oeo2w9bJ1BJJBIEAPxjSndu5JgD1+uBM9vssO0o7rClrRN0EbsOoa2s9JjqTOq5hRy
 B9s57zQIuoVhtUIO7IDiz6vzlpKKl21IH+gaV0Xp8/ArDaK/Gge14EB/FeH+iHiqMcwX
 NAHaMMAaeLUqiOQT37qAXNP4FApn630yZaEvkl8RmR2u5X+gGP9VESeh3bcQHwV1YZNO
 n8y7EZCthqlTGMdm14mnkV1C0TUQ/hSfMP9Jt7fnqcaXTWY35In03jCzCa6n0qBGmZek
 2uPZrlZX94RDrV/+JE0vPMkiXKRZz9cb3cEhGSNQWfyElUcjsgUrqf5v6eNGiP9vgQLj
 uw+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Oeo2w9bJ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-19
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

Autobuild statistics for 2025-02-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  4  |  0  |  7  |
  2024.11.x  |  6  |  2  |  0  |  8  |
    master   | 15  | 200 |  0  | 215 |

Classification of failures by reason for master
-----------------------------------------------

            host-sqlite-3.49.0 | 15
                elfutils-0.192 | 13
                 libcdio-2.2.0 | 10
                 linux-6.12.13 | 7 
glibc-2.41-5-gcb7f206537240... | 6 
           at-spi2-core-2.50.0 | 5 
                  ffmpeg-6.1.2 | 5 
                 sqlite-3.49.0 | 5 
                   foot-1.16.2 | 4 
  gobject-introspection-1.82.0 | 4 
               harfbuzz-10.2.0 | 4 
                       unknown | 4 
             bluez5_utils-5.79 | 3 
                 c-ares-1.34.2 | 3 
             fontconfig-2.16.0 | 3 
          host-nfs-utils-2.8.2 | 3 
    host-python-greenlet-3.1.1 | 3 
                  libva-2.22.0 | 3 
           libzenoh-pico-1.1.0 | 3 
                  ntp-4.2.8p18 | 3 
                   perl-5.40.1 | 3 
             util-linux-2.40.2 | 3 
               valgrind-3.23.0 | 3 
  binutils-arc-2023.09-release | 2 
                   bird-2.15.1 | 2 
                     daq-2.0.7 | 2 
            gettext-gnu-0.22.4 | 2 
                  jack2-1.9.22 | 2 
             libargtable2-2.13 | 2 
                  libsepol-3.7 | 2 
                libsoup3-3.6.1 | 2 
     linux-5.10.162-cip24-rt10 | 2 
              luabitop-1.0.2-1 | 2 
                    mpir-3.0.0 | 2 
               procps-ng-4.0.5 | 2 
               pulseaudio-17.0 | 2 
        util-linux-libs-2.40.2 | 2 
                    azmq-1.0.3 | 1 
                  bcusdk-0.0.5 | 1 
                   bullet-3.25 | 1 
                cifs-utils-7.1 | 1 
              containerd-2.0.2 | 1 
                   crun-1.18.2 | 1 
                cryptopp-8.9.0 | 1 
                   cvs-1.12.13 | 1 
                   duma-2.5.21 | 1 
                espflash-3.2.0 | 1 
                    fcft-3.1.8 | 1 
              fftw-quad-3.3.10 | 1 
              findutils-4.10.0 | 1 
       freeradius-server-3.2.6 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/erofs/erofs.mk:69: /home... | 1 
               graphene-1.10.8 | 1 
            host-dfu-util-0.11 | 1 
       host-gcc-initial-12.4.0 | 1 
       host-gcc-initial-14.2.0 | 1 
                 host-gdb-16.1 | 1 
                host-gzip-1.13 | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-mender-artifact-4.0.0 | 1 
 host-softether-4.30-9700-beta | 1 
          host-tipidee-0.0.5.0 | 1 
                  hwloc-2.11.2 | 1 
                   iperf3-3.18 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                    kmon-1.6.5 | 1 
                lesstif-0.95.2 | 1 
                  libbpf-1.5.0 | 1 
   libcdio-paranoia-10.2+2.0.1 | 1 
                libdnet-1.18.0 | 1 
                libesmtp-1.1.0 | 1 
                libglvnd-1.4.0 | 1 
                  libnss-3.107 | 1 
                 libpng-1.6.46 | 1 
              libunistring-1.3 | 1 
                  liburing-2.6 | 1 
                 libv4l-1.28.1 | 1 
             lirc-tools-0.10.2 | 1 
               mariadb-10.11.6 | 1 
             matchbox-lib-1.12 | 1 
                memtest86-7.20 | 1 
            netstat-nat-1.4.10 | 1 
                  nginx-1.26.3 | 1 
               openblas-0.3.29 | 1 
                   openrc-0.56 | 1 
               postgresql-17.3 | 1 
         python-remi-2022.7.27 | 1 
                   rnnoise-0.2 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
    start-stop-daemon-1.20.7.1 | 1 
             strongswan-5.9.14 | 1 
                   trinity-1.9 | 1 
                 weston-14.0.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/c385de2c6d4f5379ab3cbfdd1d3c704d39c0b3ec |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/44a492d75549927cdb7daeafab84417062e1c9ca |     
    arc      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/f232f153f90f880ad75ebed80218af32f0433553 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/926a87ab81575dda702dd5fe2fdff71b76d8316a |     
powerpc64le  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/80082ac88086906708ca1261e8b0ce2d1efc9c78 |     
   mips64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/bf49c800cdb60f6a91d7998d62fe6eb2894feb52 |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/318f1b7e412914a6eab6dc922605e55baa321b59 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/9142d3af52706b6e94c64291a6e1b81731a696f8 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/44a61b44ec43b438e42ffea11054253e31900083 |     
   s390x     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/71324909922bd70dc9cf41bea35e82172ed02a29 |     
   mipsel    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/4b034acb931e21b94e4deea46ea9f002a1dba513 |     
   armeb     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/cf0cf01c2baa610e20caaf567102b2a1a9eeaaf0 |     
  riscv32    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/25d617e919722d3f99e0ffad076a3e1ef4c3937e |     
   s390x     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/d080ad95d98d2ef795daf1307c3f52de5a7270fa |     
    mips     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/09b209b738833e101330c1dd0ec27a0390a63638 |     
   sh4eb     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/30efb95b147078fff6b897d50254b8d79db09571 | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/8b3cdea72f8aea71af018a32b0f08273646de532 | ORPH
    arc      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/72ed9d80857348ceda1f478f75d9af485d5d6d74 | ORPH
  mips64el   |         cifs-utils-7.1         | NOK | https://autobuild.buildroot.org/results/81077e83393602af0cfb6e0d8ef041f81cae14e6 |     
    i686     |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/c93233bba1d435b7c2d257afb12e88dd918eb0c4 |     
   mipsel    |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/9940227f532468d6d9730aedef8d44afd8968ce4 |     
   s390x     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/60d54ad4945e1c548c35aefbf1ef1207ab2f2a0f |     
   sparc     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/91a1fb6bd1bb9c5fb9065c06cb46bf52aa12f94b | ORPH
   mipsel    |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/aaca932d9eb31a532fd4fe6acfbfb38e621dcf0e |     
   sh4eb     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/afc42939335f19e5f0c0386a5a280fe30a8571ed |     
 powerpc64   |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/de4f60a6adf1e8370cb19bf22c62d3b0ff84edf8 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e758a0182c84db017fd317cff63e42bcd1ed598e | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/84fdabbace687bdc5ac27ce3f7c6d353048e15f8 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0b68b6c5534cbfd6a15cc2b5502309e20b6b8290 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/51014eaecafcb02c1963f4e5360ceb3196a8576d | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ed428cab9004aa29a82cf8fddd01b3900ba98c8f | ORPH
   mipsel    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b639404c473553309353432bbc26ddadcbbaf87c | ORPH
    arm      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7d98aa41a7be4861f2590a975a58b3cd1e88be81 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b4d31f9ab009dbd54ef4b293aae86d625c9049b1 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0b7e37d1a093eb7b0467b98f70b08b53f47c2f8a | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/580c8ea7bd978a3ea085a1144e1ddf6289ee3812 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/fafe19fec0bbc51223be349c2801152ee6ab4435 | ORPH
   mips64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/26de8bc9e5c1fb1f115f042f912bc3ed028c9400 | ORPH
   sh4eb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/649e1eae3266978486aacd5d80da048ae781e30e | ORPH
  sparc64    |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/dcc692315cc32b2dc644f9e686fe451afceb2d74 |     
 powerpc64   |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/d395a93d0aba7ca16359f0acc4ec006ce2b5e727 |     
 powerpc64   |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/962a951d8ae746e4f2432d20ee6cc3cb5cf87618 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/4a3f0891cff7634dcadab0e1e52a5ffc05672658 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/9ed178f9cd8b59c54b75a9ae95527cd1757272e0 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/8cea46299a87fff423589641c837741be35f557c |     
   mips64    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/587705255832b619e3eca99a538df079ffc2e0a2 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/143f9fbe0454d9920cd884f6f143d0174487ddd7 | ORPH
   x86_64    |        findutils-4.10.0        | NOK | https://autobuild.buildroot.org/results/abf1c081a3e2f20005f8d24d669643194dd4b803 | ORPH
   xtensa    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/dfca65af25afadf2a082b72498e79566bc204975 | ORPH
   x86_64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/68640a5cd6dc86df87b47767665525bac3f61229 | ORPH
   armeb     |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/19812f648434b1b8b3ae3de7a33134094e7c1804 | ORPH
powerpc64le  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/c6fc4a12779f57e7b8d7aab89084fbdc72935268 |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/f6114d47b511a53abcd76faf4beed1472b8278c9 |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/d3e4a6c34d91a26e93e3ff489ff9dd176873dc68 |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/b9a493e391c029ed3b32fbf29d1d3e5c8ef7ed73 |     
 microblaze  |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/1388423ebd2f17ad78f44fa99309fe355a563a54 |     
  sparc64    | fs/axfs/axfs.mk:32: /home/a... | NOK | https://autobuild.buildroot.org/results/603cc84db3a5f2d7752930a9075e1e17479c86f4 |     
   x86_64    | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/cb797b25984dd954267920e2a9877865a5eeab29 |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/fab7649a160f9e2888afdfa2baf997be9a098ee4 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/9143e52e83fd8a1051115770087a2af23aa02a0f | ORPH
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/0469849f943765b65a55e93a3fe345cd2e2bb6c0 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/c5e8acb0fca52764b31fdc431d2f4ad0ace0cc9e |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/cd37c5e64d77d7f07eb90f6c92dd4d6d48de00d6 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/8cea4bc407d969c7be4b01e360e1bb80d0e2a381 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/5cc13aa434f67a280981b17f3f2f796726756d10 |     
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/922b4d849a05607c946e4d65e034e5b9a063cb78 |     
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/815cb224a6196074ce421680f13194f55a6ae635 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/401138831628f1c2ad7db0ca9e4f7ddd53c9d9d1 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/76b907ab9f1e89899c772624f42e07d9f4d7b62b | ORPH
    or1k     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/c11e2e417ccc3c5f3b6633e77e7ebe0ddfff1ed1 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/5751f827b25b97c130e5e88b6bf749b09641869f |     
    or1k     |        harfbuzz-10.2.0         | NOK | https://autobuild.buildroot.org/results/1bf2a6f285389131ce302252b5fdabff66e0f2b8 |     
    or1k     |        harfbuzz-10.2.0         | NOK | https://autobuild.buildroot.org/results/e448d27e79bacc29c068471f717a4d4261b850c9 |     
    or1k     |        harfbuzz-10.2.0         | NOK | https://autobuild.buildroot.org/results/af093acb6c98b81f8c864675db25329981cc6086 |     
    or1k     |        harfbuzz-10.2.0         | NOK | https://autobuild.buildroot.org/results/f3ee7a1e44039873c8a59ded3f5f81f4f5f7c2e9 |     
 microblaze  |       host-dfu-util-0.11       | NOK | https://autobuild.buildroot.org/results/f6d7e8493cc9c8d23a0f3b990a0819864490de9c | ORPH
microblazeel |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/9df97990efff40f6d8ebd08d683967ed7f36a852 |     
  riscv64    |    host-gcc-initial-14.2.0     | NOK | https://autobuild.buildroot.org/results/bd00ac471ba3177e765dd781b5774726ed1dfdc9 |     
  mips64el   |         host-gdb-16.1          | NOK | https://autobuild.buildroot.org/results/f4e3adbb65043824fdcb3c9cfa5438eaef2350cf | ORPH
    mips     |         host-gzip-1.13         | NOK | https://autobuild.buildroot.org/results/3adeeba2ca540ed8e42a8a95c274a963610f3c37 | ORPH
    arm      | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/0ca04b82114fc8d98a2aad4399e96ee0279417f4 | ORPH
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/8b1fa705945bd97795f53e71ff23c153e3443b88 |     
   x86_64    |      host-nfs-utils-2.8.2      | NOK | https://autobuild.buildroot.org/results/8999a7ec4be14ae80e13d00bcd71599da52548d5 |     
   s390x     |      host-nfs-utils-2.8.2      | NOK | https://autobuild.buildroot.org/results/c7beb1820cb1dac0453ea5beff63ef3f3f454f28 |     
microblazeel |      host-nfs-utils-2.8.2      | NOK | https://autobuild.buildroot.org/results/5f1d879787a424bec01c9100de04c9ce0881b579 |     
  mips64el   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/057842e7495dc4924c1bee2a53a4f6f2ddd1c8a7 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/dbf3fe07ac48fe445d21385122eb0aba23b01555 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/688bb9b65a6c413c9687fb560be62b804f719328 |     
 powerpc64   | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/49dca87d34d1768afddfecf60d5a820d12ceed4d | ORPH
   x86_64    |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/808bf637e79e5e9de6e417bcee00b82105723421 |     
   x86_64    |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/bfb97213301062bf63e4ef33da7a9e9c45eae058 |     
   mips64    |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/1612bf0fa278414d6403835a6c82cc9d21d0c458 |     
   s390x     |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/b25774c9e1d3cb6d91dc967f0c7919021c517c75 |     
   arceb     |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/8b9f34a9c51517a36726b9742785267f7dc626b3 |     
   arceb     |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/63ef9ce960a332b266967b8f0c7826d9e3521577 |     
  sparc64    |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/69828fe1b3c67fe9e185caa7fdcb9fd35892ca92 |     
 powerpc64   |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/b0f595d2259ea9ab4e7d7c7e5b0e06083f59e876 |     
   sh4aeb    |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/a7e97cd746a1a71edf85cc4bf686e358e60e5e10 |     
   s390x     |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/6dfd35b5aff677521fb648dc204148b212d7ecee |     
 microblaze  |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/c1e35ef5228d873b64bffeb3ff42ffd866a35b46 |     
 powerpc64   |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/cd725b582b4acd59a6e818d10f75fd8d0f311497 |     
   s390x     |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/90715ffc11ed62709e347f9a3018be7154ac0c78 |     
    arm      |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/68efa424c4196a33dcdf2a7d2fedb7aa4b09c622 |     
   sh4eb     |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/8da7985d99b7c41a60082e181c056b04fbcb30e1 |     
  aarch64    |      host-tipidee-0.0.5.0      | NOK | https://autobuild.buildroot.org/results/a6720e709b85815f4b3020d400d5dd027ddef2f5 |     
   x86_64    |          hwloc-2.11.2          | NOK | https://autobuild.buildroot.org/results/be5dda73ed6c6f0250ad85aab6a9e3d199eae7fe |     
   sparc     |          iperf3-3.18           | NOK | https://autobuild.buildroot.org/results/f8ac7c4daae89bdf2fdfd4cc6a1bc92ed27e7f47 | ORPH
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/b4b5f8d21c59e60df49c099865fcb1920058ecce |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/269f14468bf370e139e56f7122ef0b8b3831906a |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/a08ee2fef0ef8016ff9a0a57ea86ca4cc7641679 |     
   armeb     |           kmon-1.6.5           | NOK | https://autobuild.buildroot.org/results/f504f0d32d769fcbb90e58a7385ca38dfb2cfebb |     
   s390x     |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/15e95a737cb4c315ef4db24295371c18f279143a | ORPH
   x86_64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/2f18ac23ace04e36ffc94e3ffa854fcd0bb631e6 | ORPH
    arc      |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/44ed1e5640b957c8fb79dad474e07162873ce4a4 | ORPH
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/5ac18f2471837f3a15ec8bcc66fc8bd1a168a770 |     
 microblaze  |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/02e58f84e78f8f4ddb8e3f570b0e9a7dbb92ebab |     
   mipsel    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/a00d0f81183746c24db2efea828f1282fed871fc |     
    i686     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/eaa5ace45f51c26012f337baa02e37036efb0cba |     
 aarch64_be  |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/aaf26016e974202edbffb814b7aba3f6f691ca6b |     
   s390x     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/f23c4197c4b6edb3558310096d1d974586156786 |     
 powerpc64   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/3517b7fe5cf9291375ecde5fbc753eb5838aebe7 |     
  sparc64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/3f6b9211b7f43e5fc7f9c5b890b84edc680ad7a0 |     
    arc      |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/ac80ff39a1b8bd010ec5e9128db3512b2916cb08 |     
  powerpc    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/2be34c6eafb6daa13b58f88f72863779c0f2bbaa |     
    arm      |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/3350b8102f6f758a65e81f44811d17eb70875787 |     
 powerpc64   |  libcdio-paranoia-10.2+2.0.1   | NOK | https://autobuild.buildroot.org/results/0d64978ffe9153490cb7570e3da498c9763e5463 |     
powerpc64le  |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/57ec68ea4fb3e9305a04cf14ef3283a00faf07b8 | ORPH
   sparc     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/a05e3969330c20ef4b7c8810eca9aa2b078cc0f9 | ORPH
   xtensa    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/e1181fb3cef130fea048641318b12f3bd13917d1 | ORPH
    or1k     |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/93fe6c61bca360c0dc65e03b48bcd760d6eaf7cf |     
 microblaze  |         libpng-1.6.46          | NOK | https://autobuild.buildroot.org/results/3403a4e1ca0c9171ed3689105c3261de76e9b20b |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/600748457f15fe84dd639e082da582045956d644 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/0c96b94f3b9e3e8a8d004d82362d3fca8071dd19 |     
 powerpc64   |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/3d81132c481052e5e2264b38f2743805441d4d95 |     
 powerpc64   |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/2e4c62257ca48070f20845b5316277efc5e46d96 |     
    or1k     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/a31d608388b0ff28334f674baeb501b023bdb4bf |     
   arceb     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/9de6ff213d91827959e3d9896e4ec3e74852df67 |     
   armeb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/911414af940b06612cda9075649f435ee7d71465 |     
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/a5de094aae34dc250ae3663cd065fe9d5afb4323 |     
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/10ed1a8dbcd5d6ab6d6f49fe814eaa7bafc75ad7 |     
   sh4aeb    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/49c3d75fd5488fabaf2eeb5b10526174235252a9 |     
  riscv32    |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/8f9c660d1354f61deeb644a3f1a279adebea5049 |     
   armeb     |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/70e7480bc895770f5b2e87424a62bdd60f5cb03f |     
microblazeel |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/ba6eab57a8047382a3fba9df5481a3fa557ed9ea |     
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5d5de755373116b787cb2fc300788a4341b71d2f | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/eb73416c6ca3a0691693aa130e54376481b7c343 | ORPH
   x86_64    |         linux-6.12.13          | NOK | https://autobuild.buildroot.org/results/40b72eae69a22209692dd94ce02477fa13512906 | ORPH
   xtensa    |         linux-6.12.13          | NOK | https://autobuild.buildroot.org/results/31701a9fb9f2aca5b2528443ca05531937a82491 | ORPH
    sh4a     |         linux-6.12.13          | NOK | https://autobuild.buildroot.org/results/67963768b685610a1cc300bf712dea294f60a7c9 | ORPH
   armeb     |         linux-6.12.13          | NOK | https://autobuild.buildroot.org/results/80cc1cb9ec533ca695937bf6a2c17896bc773aa5 | ORPH
   s390x     |         linux-6.12.13          | NOK | https://autobuild.buildroot.org/results/b6a981483b398a20804e036f549548184a818538 | ORPH
   armeb     |         linux-6.12.13          | NOK | https://autobuild.buildroot.org/results/4636d0fcaf3b4664c8b854f64732090d63201f8d | ORPH
   s390x     |         linux-6.12.13          | NOK | https://autobuild.buildroot.org/results/196f58b2f6ecb16ef5aab606012f1e7e3720dd2b | ORPH
powerpc64le  |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/ed375c368bf38b6aed139e04f0b55ba61e5496d9 | ORPH
  powerpc    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/fe4928c2941e3743d5fb2ee271d20ab3ae2384fd |     
   sparc     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/e5c5e14ff74429221ccf7ec19813d3e01133f035 |     
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/5ead6f1e5446f0ca3b618775a6e86cdbea3307f6 | ORPH
    or1k     |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/5f7df8342f2f184b5d4736c9677c18a6481d8e0b | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/8713df0294df3278757e890f5227e0704d4621ac |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ff2179ecd5a16cd7f5a9662eaa76b4fada880dec |     
microblazeel |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2a99352ddcbaf551d194be046874d09f5627c467 |     
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/6b51d117235f10032285255c8fa9a4675ba04eda | ORPH
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/eecf3121f3ab6d682c118824b6086b60d6919d1a | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/4d10a69ae5cbb4d72cfeb941b29d59dd8e4f81aa |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ae0bfadaf897e3e8ae1919b543831b10c8e046f3 |     
    or1k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/7a719d63d3d6da7127ce7c6fa9408ec391c97eac |     
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/47fbd9a943927fdbc0e83758bff7229dcbf3496c |     
   mips64    |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/cfe057cb6969164fb51c1fca0278c5bafbf2c63c |     
   armeb     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/0714150597f0e221922881dfc28933372e606536 |     
   xtensa    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/0c1acb3a5665dfc42909faaddab2582a12960447 |     
   sparc     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/dc20c9d8ab589dc71fabed2fb7d4670a2aed71b7 |     
   sh4aeb    |        postgresql-17.3         | NOK | https://autobuild.buildroot.org/results/8438c05d1b600002f3d728dc2b6284bd3dbab709 |     
microblazeel |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/401a7d91fca24ff147b0cdbfafb279b0502169c0 | ORPH
  mips64el   |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/bc63e4eab4774887e52162df4043ec4a95d4a3d6 | ORPH
   armeb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/3c5949e02c4c08c1961dfa6dd280356f3982ba63 | ORPH
   armeb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a50ee9675b15e3c8e9072acb41c36855c4b9e514 | ORPH
  sparc64    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/972d29264f55c881e07a9fc572348799b36588d2 |     
   sparc     |          rnnoise-0.2           | NOK | https://autobuild.buildroot.org/results/c01ede4a6ff30717d66108506f8c0a249bbe7ee4 |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/7fa8eeb40dddf01ef2e5508ad5add7dd9eca2c60 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c9bb0d0128507302910a69a0aaec95942449afb6 |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4eb0a29cf0eab6f0d0564e55d19595394bb771fe |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/84d12adc03caabc77c8ba1bebc639524fc692498 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c17125338b76d789f4a2d901d1f392b12a9fe34e |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/89858a839b3ad091bcc1ca331518b1fe64fcd299 |     
    or1k     |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/256fc4386355fcf077f3bfee4c34751500797598 | ORPH
    arc      |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/a0c00bf2bd146359a02e3fb8b3b379b04621a0cd |     
   x86_64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/c9f3268c89da65559b33f7baca8186649fc0d841 | ORPH
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/ed5b9776d48d7d5c07d8af27645d8b10f678679d |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/29421680398c766a1bd94031c7432ffeeabe5e7f |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/f138e7f142fb773e57eca1bf8e04e66177718e3a |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/6dee76a192caa801f0fe930be9f0c74a721d57fc |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/c7ab9751f481934f25cb3ce0f406b51054f4a85c | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2f8032e032f3a77f924fab2fcb4378a2ad0dc67c | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/6d0df80095bbe167b0e6f031de2bc62571b35291 | ORPH
   mips64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/a85a970d093f94465ea5b49c3c42de5623356d67 | ORPH
   mips64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/804c967e99a3f802fe74b9f935e3ad60c224fdaa | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/7381d5c951dd92f402a2869771210126485337c9 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/d4d6c976a63455f7908595e974a45ee9bf044a2e | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/a769ae060522fa1f959e27f9f742452ad6422362 | ORPH
    m68k     |         weston-14.0.1          | NOK | https://autobuild.buildroot.org/results/f902b4374f38ae410d47ab0e74e49cd38810bfe4 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
host-prelink-cross-a853a5d7... | 1 
                     nut-2.8.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4ae2ea8adb1b9241c61aa48846252f51b6a88fc3 | ORPH
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/647ab45ad36274812520cfeb560a57a8f20e36bb | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/bf0dbefe34318f17b3d7cb460f91d1e6cb0c2419 |     
   sparc     |           nut-2.8.1            | NOK | https://autobuild.buildroot.org/results/4fd9e0a1a411605a32cf8a2ef2cb3f7cfdd8b7a5 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

dbus-triggerd-ba3dbec805cb7... | 1 
        liblog4c-localtime-1.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/768ed763018cb4ea248b01555738834ce6212a78 | ORPH
  riscv32    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/a8b89d4f9e656d0e895297f8ac2ab39ce9700630 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
