Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B590C19776
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 04:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9EC480E45;
	Fri, 28 Feb 2025 04:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zehX73u09h5u; Fri, 28 Feb 2025 04:16:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5476881CA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5476881CA3;
	Fri, 28 Feb 2025 04:16:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2BC7711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 04:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91B1F84099
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 04:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEEAyqnqI4-e for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 04:16:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1CCA780E45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CCA780E45
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CCA780E45
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 04:16:00 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5e4cbade42aso2005468a12.1
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 20:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740716159; x=1741320959;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u9RXsMtJaaHT+nbUgkTac6TOtjF4NbJWs99nHTYuyS4=;
 b=ZM2D2pdQSg511pt82SE/ttJEqXl6jdtXsqzrnmXjMQtH40KtNhkROX5d/w4N726/08
 2hnWnyuAUzvLY0xCI+uw3EzPtvIGO3V4NsSyC2lA0v7X4DmyE1Ab833/jXFi4F0xX9R9
 pw+bgrT1SxFYvfr90L43K4vZy3fF0ChZnhLIW/LF/oJlDhxxpMqKqTJy5LrAYS95LkIJ
 8MKLhi7V0x5SDCutm4W1ogTwv+o1nhx/t+noSScy2UyfcN8hYRpko8JkJ3WzDUU5KNnS
 2TmxzO22hT9cVF3GFHNWn18WkfJESHSnAwHYxu9h2UfJG2IivO1214q7D6cIz2+vVkcb
 UfEA==
X-Gm-Message-State: AOJu0YzP2jaC2UphDEwLTVI6rRYq1sGulYBhoNjwJMTjthr7GO23lj32
 lZPyW7L2KztVL9aDlTpPA5Mw5DLwfTbJijF+EyMXe2HRMDbJ7RliWiwbXA==
X-Gm-Gg: ASbGnctFsGs5iJlUMlUSsP1cS4VchSwD7Qqf0HKKTTQxKb+BZ8QhPiSyH5FMnqkMngt
 JV3DfBP1p479U/KI1f5ByRj7ll1dxmPhlT47vQfuvHvNcNRsHj7frBX3q/1LEBpK0plFT1qqnx+
 paWHkB/jPFuJ7dVd82YxpvY/5RwEuWnurCaM2VP/ZXlTEF7YqDizlBxuSyNnL9cTa1++L7dCHO3
 55m/1370UCKSYbvBgq6VTlhanznl+qFNTSEd0tV4PYO1SwRnwKDiBkuCOfcxJT010XdxVVF5E8d
 rOPjx/LgpAnxaAVlStjv1evmdn0x1w==
X-Google-Smtp-Source: AGHT+IECUKjSJfeYauVEO0HNvGST2giZe0ImUAzZbig5kmILNWkjoHmH0eLdF406WJqW/Npi7yHwIg==
X-Received: by 2002:a17:907:c8c4:b0:abe:cc65:8721 with SMTP id
 a640c23a62f3a-abf06288a45mr747873666b.17.1740716158614; 
 Thu, 27 Feb 2025 20:15:58 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c11131csm222911366b.86.2025.02.27.20.15.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 20:15:58 -0800 (PST)
Message-ID: <67c1387e.170a0220.54989.65b6@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 28 Feb 2025 04:15:58 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740716159; x=1741320959; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=u9RXsMtJaaHT+nbUgkTac6TOtjF4NbJWs99nHTYuyS4=;
 b=VcfYYjhuGweZd7jNMpfOqSToT5FtIrqbfq35NP84p6jF/S1RGv3BWVRSGX+s+0SA/s
 KjjRuwD20OH4U6TjN/SAB40NmDqaDyWWG354QnCU0Sqoh//nGX0rxQjcBsrB0hAwsHoa
 Igh6aPkqqwPIJN33SwN2kxUJ20npTq48lsNK6jG3n4KAF+VG138J1HRT51GJ7VmLaNW7
 Y3BBaSj1BNDlVNlk7KMY9/4qCqYnZ4h0wi9y007RMjMnXxMlvWP4Sj9Onv8TgXX0Znhu
 cJTi3BwPnnR1AIcNIz/lL0WIGGa1Ta4K9jEthd9XMywcPK8yBMSvLksvdYlRBOxMqFeZ
 RsXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VcfYYjhu
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-27
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

Autobuild statistics for 2025-02-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  5  |  0  |  6  |
  2024.11.x  |  3  |  1  |  0  |  4  |
    master   | 27  | 187 |  1  | 215 |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.192 | 14
    host-python-greenlet-3.1.1 | 8 
                    mpir-3.0.0 | 7 
           at-spi2-core-2.50.0 | 6 
                 libcdio-2.2.0 | 6 
glibc-2.41-5-gcb7f206537240... | 5 
                       unknown | 5 
    host-mender-artifact-4.0.0 | 4 
           libzenoh-pico-1.2.1 | 4 
                 linux-6.12.16 | 4 
               openblas-0.3.29 | 4 
             util-linux-2.40.2 | 4 
     bandwidthd-2.0.1-auto-r11 | 3 
             bluez5_utils-5.79 | 3 
                     exim-4.98 | 3 
            gdk-pixbuf-2.42.12 | 3 
  gobject-introspection-1.82.0 | 3 
                   linux-tools | 3 
               postgresql-17.3 | 3 
               procps-ng-4.0.5 | 3 
               valgrind-3.24.0 | 3 
                  bitcoin-28.0 | 2 
                    brltty-6.6 | 2 
                 c-ares-1.34.2 | 2 
               collectd-5.12.0 | 2 
                   cvs-1.12.13 | 2 
               harfbuzz-10.3.0 | 2 
         host-b43-fwcutter-019 | 2 
host-heimdal-f4faaeaba371ff... | 2 
kvmtool-4d2c017f41533b0e51e... | 2 
                libdrm-2.4.124 | 2 
     linux-5.10.162-cip24-rt10 | 2 
         lttng-modules-2.13.10 | 2 
           lua-markdown-0.33-1 | 2 
              luabitop-1.0.2-1 | 2 
               mariadb-10.11.6 | 2 
                  ntp-4.2.8p18 | 2 
                 openssh-9.9p2 | 2 
                 rtptools-1.22 | 2 
                 agentpp-4.6.1 | 1 
                   crun-1.18.2 | 1 
                cryptopp-8.9.0 | 1 
             dahdi-linux-3.3.0 | 1 
                     daq-2.0.7 | 1 
                  dlib-19.24.6 | 1 
      docker-cli-buildx-0.16.1 | 1 
               ebtables-2.0.11 | 1 
                  evilwm-1.4.3 | 1 
                  ffmpeg-6.1.2 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
                   fwupd-2.0.4 | 1 
                 fwupd-efi-1.7 | 1 
                      gd-2.3.3 | 1 
        gmrender-resurrect-0.1 | 1 
         gobject-introspection | 1 
               graphene-1.10.8 | 1 
     gst1-plugins-base-1.22.12 | 1 
                haveged-1.9.19 | 1 
               host-ola-0.10.9 | 1 
 host-softether-4.30-9700-beta | 1 
                  iozone-3.506 | 1 
                   iperf3-3.18 | 1 
                  jack2-1.9.22 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                  libsepol-3.7 | 1 
              libunistring-1.3 | 1 
               libunwind-1.8.1 | 1 
                  liburing-2.6 | 1 
                 libv4l-1.28.1 | 1 
        ltp-testsuite-20250130 | 1 
       matchbox-keyboard-0.1.1 | 1 
             matchbox-lib-1.12 | 1 
                memtest86-7.20 | 1 
                 mesa3d-24.0.9 | 1 
              mosquitto-2.0.20 | 1 
                  motion-4.7.0 | 1 
                  musepack-475 | 1 
           oath-toolkit-2.6.12 | 1 
               pcsc-lite-2.1.0 | 1 
                   perl-5.40.1 | 1 
                pipewire-1.2.7 | 1 
                    polkit-125 | 1 
               pulseaudio-17.0 | 1 
         python-remi-2022.7.27 | 1 
                ramspeed-2.6.0 | 1 
rtl8189fs-94cc959d56c1425fb... | 1 
                    sdl-1.2.15 | 1 
                   tini-0.19.0 | 1 
                tpm2-tss-3.2.2 | 1 
                   trinity-1.9 | 1 
           v4l2loopback-0.13.2 | 1 
            xlib_libXau-1.0.11 | 1 
           xtables-addons-3.24 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/849cb0a9c21db5f4ed3711de162197a295767281 |     
 aarch64_be  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/bb76a15a65ddffcae45a418ef5c1abc002a27562 |     
powerpc64le  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/18696a920f323015000e6b47eb26716b77ab972e |     
   x86_64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/32889de920c53c22b1c5b69e868e74a926900245 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/9e7fc373781f526876dffb650510da6482f49372 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/a9e460e09dd57c31ff8e30f0d37f9471a83c53b5 |     
   x86_64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/5c0bdbe8fc1fed2791adf42a7599cc66500437eb |     
 aarch64_be  |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/690f04220f5da0ef331f826be15fb0bf1b29c7bd |     
   armeb     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/fc0277c995c23e8e3143acb11c9b4e5050359363 |     
    mips     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/7aa3b8b0f4f600116f79b09af5b90dea5412308a |     
 aarch64_be  |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/d9bc3a635db143c38b41a49b467e7025a90dfc4b |     
  mips64el   |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/28c2b1b256cf6e29f95686e7a0a2f1d6ec1f09ad |     
    mips     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/47ac1b91e9b8aee05bd72ed985dd7aced8ac98e8 |     
   s390x     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/0622df35c484488d662900c0470417254f5137f6 |     
   mips64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/1d888deba5f1ba2016fce1c20df282e554240ad9 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/df30e7810d9f502e9ca6667f2deb3b8f71f74b2f |     
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/c2bf98da2054c5bc4ae579b800eeb70a688dcc47 |     
 aarch64_be  |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/b24b7657b1d1b5b1bed757a407fbc17cd525cce8 | ORPH
   xtensa    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/b93ec97c246cc5bd20c13b83c09d1a6f05976808 | ORPH
powerpc64le  |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/9261dbaad5a5aa485c0464b66a6a82d3f398ca69 | ORPH
   mipsel    |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/1206efaf3df75b7d2e7cb0a1f935edf46b52dcf0 | ORPH
  mips64el   |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/ee718db89f5273f4fa5fe96a1b268943f5c94930 |     
  sparc64    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/f96fb2359aedb5d68039050419ff05f270d7691e |     
   sh4aeb    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6d3c30ddd9858ad2c839d9030d5d20c12ed67c8d | ORPH
    sh4      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ae8349ae9c05ad3b14580e8127c1a04f1db31bec | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8d1fff81e7251482ab3fcb19582f8f2d1d3bb3c4 | ORPH
 powerpc64   |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/c685cd6a978fa7a716c175a1d1135bbd70524ee2 |     
 microblaze  |          dlib-19.24.6          | NOK | https://autobuild.buildroot.org/results/e8a3623d735e37127d8b93c82a35af326ed8e7f7 |     
   s390x     |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/25a4a413aa617dbde6999ffb45dfe05e7a984128 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/72f279b7036861eef070cde4140ddc9c003524c5 |     
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ab37d30bac1d9f94efb50491b4ee1265b5674d73 | ORPH
   sh4aeb    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/526df3e3c5713e1b8f64d88e327d8d7c346598fc | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/6c81ef631e981064dac48843e248eba3357954ba | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/fc2494e2f3488db05503c803d0a5dc5fa160bce8 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a09b534bcb6d3d3de8c1e29a7f3767cd3935a4bf | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/59abe69846829cf6608e66cf9e5f19bcefdf9411 | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/037e93e6fd2ff732fd77c1df1f5a20bccff5d57d | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0a4b3dcc8c4d72bd7ebf3b49dc71471a75690233 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/bd025fcf54f08269a3bf60e1b44faaefb56b797b | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f2b634c41a5ae15540a2dcc28daab9abf1ca051f | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/79d5b400ba7877bb953dd1161e8a17e0f59a0e22 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/144183c1990a14ea178287a8bf695d63db4765ba | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/3242b974ea6a578a7ae6f9e23cb59f73c9bd3ff8 | ORPH
  mips64el   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c83d4ebfac56264e1d2fbcedaeac1eb676e1c3c2 | ORPH
microblazeel |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/4dd3f08a8c0c9901cb456c02541c137a5e3eaba1 |     
   mips64    |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/f4073bbb56c2dff3da06ea9e62e3a38f7e5d6ab1 |     
microblazeel |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/abea953d4588e9f1f924a92e42985854062c8db3 |     
  mips64el   |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/d6fc3fd80c05616898dfd1278c5cb5fffe9316e8 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/12f42ef30e3ea1f151408cbb723c5ded845941c3 |     
   s390x     | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/743b5d91542fb91576830b87c03bc5419ce8954a |     
microblazeel |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/fe04f3d306aa55f450c077e2bbee46a4b9dfe1d7 |     
   x86_64    |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/28b7ab2e25da8ce1ffac964fa4ba66e75792c639 |     
   xtensa    |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/c01d939f20b650406414de1842f20327e3210bad | ORPH
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b8625860c209bdd5e352b733652566f847e67e75 | ORPH
   sparc     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a47e7552a73345df86b4b3020d3f3d8dbe9b4e46 | ORPH
    m68k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/054d4f18781bdb79a7062ac25c118c27cadd33e4 | ORPH
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/e78954454823e76ad077ee50e055c1af49b95b42 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/e889afe1da9df541637250f6d86355c7df7edc69 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/361f7614a015d33c5978f96e4238bdc47ac3f911 |     
  mips64el   | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/eaf898f8932d7c2d77a2aa63afa8f3aa57835814 |     
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/3129d0b528fedd290abc5d501ea89e28bca66e9f |     
powerpc64le  |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/9afcbee744b81d7efeb96bba95475fcb8b5ba44d |     
  powerpc    |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/2348075794c8a9e83c47273185a16880d8cb3d48 |     
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/61d9892bbcaffc2d5af2c0481c5d4320a4dcf281 | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/1a22b2a74120ae010c779b7e6af69871b43dac55 | ORPH
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/6119b3eab290b38aed5957d2efbce6b2286c6abd | ORPH
   x86_64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/e4164455a0664b96033f9271a8e313fdb0e74729 |     
    i686     |   gst1-plugins-base-1.22.12    | NOK | https://autobuild.buildroot.org/results/f28ac9a741be8f8643a46d19356563c2394e1c93 | ORPH
    or1k     |        harfbuzz-10.3.0         | NOK | https://autobuild.buildroot.org/results/f35aead42122ae38519035702a7320b2d88de276 |     
    or1k     |        harfbuzz-10.3.0         | NOK | https://autobuild.buildroot.org/results/9938a369517ce01f77a03b1705d143439c23ec49 |     
   mips64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/6098ac40424f7b0aa8fdb7dc0e8c564f9b61220a |     
  aarch64    |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/0c1fea90a01fb77eab4712771bbfca85fb198d11 |     
    or1k     |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/2a10b58f94b5de14b4206227c6c9149c5383cffb |     
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/a19005eb128d56d7821ef4a7bd10f72c01400880 | ORPH
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/9e4aa679d44f053b011b8382f07d0324a15067a1 | ORPH
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/2d0bde71b06a39e216e90b4ac4c2f5a24817d972 |     
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/10a204d4301c005a8ed59a5df3412d33fd7e7880 |     
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/573aaa5275c6b5d6ca3562b064a15a31f2e2b022 |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/d39884e3deb4947ea270db4e87eb92edde547217 |     
   armeb     |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/81e32ebdefde991ed1b60b48c18e7f695042ad5d |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/cb5bf7dd8bca34165bc39780d324f4c8d687d3e9 |     
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/ed972fdb7639711aea6bac5095f92872c4cf2d02 |     
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/5903c7e830739c3a61126dbcc95042b3cbfa57e7 |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9d8cfd59002d1a4adc0b96ee76d3a0fe57ab61e1 |     
 microblaze  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/06d230c5f441b5494aee5238e8ac26e61268502e |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/daff46d3c51c288b3899f67f990feaf5c713ad2e |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0f09392b10c2f456c8240594d7cbad044d00257f |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/e4ad6e5eccb263505c0ad80ceb6716786904bca8 |     
  riscv64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/cd823595309d5d90ec7407f55dfe6c56d60f3b1d | ORPH
    or1k     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/8cb1f57021205be7ec81184b814f29f32168dbcf |     
    arc      |          iperf3-3.18           | NOK | https://autobuild.buildroot.org/results/c2e049027ad4ae5919551809a616a5fccb80b84e | ORPH
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/ecf7696dd882797499bff1fcda87a69a2963944d |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/b32723fe1800e33788ea3c1b7ef35a1406e41bdf |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/d55f187be20a9eb1efc9d71f650c259cc2a665ae | ORPH
   armeb     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/308b69c6aae16dcad85e51b4ea7f785e305cf579 | ORPH
   mips64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/828a565d0066b713ed152f33d341b126a656e95e |     
 aarch64_be  |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/9586f3ad6b80d15b5de08a6e35596e88b56af97d |     
  aarch64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/591918c8470808950eecbccf54fe1f63066ca963 |     
   armeb     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/85064220666d4087fd21341f28631d7c3fd4313d |     
 powerpc64   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/5c91636c9972a0fa77654190d6908ba6544c58ac |     
   xtensa    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/ccd464f0d61788c46468110db1cf9d3e29538005 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/f819aa7283ed430c8598400b4061da5baa309023 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/9ad74de5f414745be24f4f99647e32b4483deb18 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/cc6162c858890bac1e20269215c93741fb154b9c |     
    i686     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/cf6e93754c6677c5a76060ff7533fb1425bf5cb7 |     
   armeb     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/5696ebd55367bea977f7a0bfc0ca86833b476c07 | ORPH
    sh4      |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/7eae49258fcf8130c32f5f8c74776a725df4b2cb |     
    mips     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/939924591eb533236e19ecb7f9755c117db7ae74 |     
   armeb     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/62342597f0fbb32436ce30fcdf4a1700da5a5620 |     
  riscv32    |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/c0f101446a6925a2b9b072476563db680acd327f |     
   armeb     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/c4b7b13b2b85c599ea13e738b59af9dc45ef1946 |     
   mipsel    |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/f881a97168cf9496a54e7ac0dc3e820ca130c3dc |     
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/3cfe4a3da27e4174bac556e0db246502256c19a4 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/2bf9c61bc15443b4072007bfe835937a5c641078 | ORPH
    arm      |         linux-6.12.16          | NOK | https://autobuild.buildroot.org/results/5b930a8f9624a25da8abf42725646dfbab1688e0 | ORPH
   sh4aeb    |         linux-6.12.16          | NOK | https://autobuild.buildroot.org/results/0bbff3d78c9bb293f924c87d377f979cc06158ba | ORPH
    mips     |         linux-6.12.16          | NOK | https://autobuild.buildroot.org/results/653cb662cd9820a823602e91e0cf09f848c3a686 | ORPH
   armeb     |         linux-6.12.16          | NOK | https://autobuild.buildroot.org/results/2dc2124afa4c19c8d173e2e3a4fcaac26860b2fc | ORPH
  riscv32    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/4bbfcefbb622f7bb3db8b6771a4bb50b93538dd4 | ORPH
 microblaze  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/4641ed6be64eaf40729c2d4c7da7cd6a7edf7983 | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b0b26d3bc1b54a23bc5b980ab52e10ce2f17e311 | ORPH
    arc      |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/bb0ec60915271b900c0ff0c7abb16eaf08a96e5d |     
 microblaze  |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/ecc15d1cba0db4a6d983467804f56f9b1a035047 |     
  riscv64    |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/a763b5829975927ff3e5722807435301bf9161a1 |     
  powerpc    |      lua-markdown-0.33-1       | NOK | https://autobuild.buildroot.org/results/d7d930ec51f22cd206df844cd36f41ff37c992a9 |     
    sh4a     |      lua-markdown-0.33-1       | NOK | https://autobuild.buildroot.org/results/27652ffeed6fe8057abedeea7c528e3a425dac39 |     
   xtensa    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/ef37d9214d4f22e81ee6fffbd0a975caf6ac8f88 |     
   s390x     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/bf701b864c1f222752d3c7f71d94acbdccc6dcfa |     
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/63b73c7d9e95c543736156cd70ad209b2ef3ac6e | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/10caf71fc84de2e75e326c32cab2410bed083430 | ORPH
   s390x     |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/b65928460636dfdeefa8ac2a578b9ae7801879ad | ORPH
   mips64    |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/6d0d9255bb8612c9006842b94a31312054d6ef72 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/921aed1046171f5c17198b111e14ee29f4a14dd1 |     
    i486     |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/bc9fd463499ebcc2da740e7467668ac960bac66d |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/bacf63a0be2053a827a55e5bfe533ee8d76c9ecb |     
    arc      |          motion-4.7.0          | NOK | https://autobuild.buildroot.org/results/480e2639db5dd162b876bf531ebc2609842a32c0 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ce8d6c37ff8500eaa9285c2570697620587fbdc1 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9e8bab334606c77e76c7741eba9d8d34981d5871 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1a8818b68e79fcbc1ad4ea6a947bf445b53afad8 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/6027164900bf1c4bfe9b04a5a90f8f25f47390ca |     
   sh4eb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/81a62d342cc718733d62b9078be0d481969e3ec9 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9c86cedee530fac83b6ad58f2454538f78d03bc8 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/118449af0f42aa8b8d3524b97b1f0d573aa421dd |     
   s390x     |          musepack-475          | NOK | https://autobuild.buildroot.org/results/e6131fc4075b951a3a6c22df73ba78c00b3a719b | ORPH
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/da4f1a750277d9bd14c9a80ca33e04e9981e5bcc |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/8a6f917aab4e408fada4fd4ba794d9640c4c979e |     
    arc      |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/1decf03268a956350dcd964c7137fa6ab98b37c0 |     
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/fdc1d2ffc358712e06fe04947b148e2c9cd94991 |     
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/5b1c3643467fd627403775eb22c0a0781f4eab97 |     
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/bf4e05de6c7b6e5b8dce6de38a63b713f5672e79 |     
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/aadf57251a23d933737c0698ef333062839e2db5 |     
    mips     |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/ca488a440fd37ce75cb5cbfc2872e357e59f3eae | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/efe509cc204f341537cbbf0938d5fe2cacd76ee7 | ORPH
powerpc64le  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/50e7d88e1c8dbb0ce178f3446fdda24bcc24bae8 | ORPH
powerpc64le  |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/a7a9c19f91a1ec20107483653dca5fdaf39c3437 |     
   sparc     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/ca6513da2027609d27c9d72940c6b1ae23d1ed9e |     
    or1k     |           polkit-125           | NOK | https://autobuild.buildroot.org/results/255ff97c533fc06c38b71a905da0a5c3c2ad8e55 |     
    i686     |        postgresql-17.3         | NOK | https://autobuild.buildroot.org/results/2f750e4d29e1cd1add1848e3d087455058cc74e2 |     
  mips64el   |        postgresql-17.3         | NOK | https://autobuild.buildroot.org/results/093eb215947ddf5cd4da55c82734ed82d99db8b5 |     
    sh4      |        postgresql-17.3         | NOK | https://autobuild.buildroot.org/results/c9671ea70a7e2b0618adde984a5943a9e40c1e51 |     
   xtensa    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/5806ffa52a5e0fa8a2b2ac4fcff3f5eff7f9b94e | ORPH
    arc      |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/c37c217ec8da34e30fb7cf865aea544b3c003a85 | ORPH
 aarch64_be  |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/63c9310a0a6e4cded244356d6a8617ba5edeb858 | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/4ef595e7ffc8fa65477be3c3d7cf22dbddb0cb79 | ORPH
   mips64    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/f7c5063a56442f4d9c295c72656f8c0a53f723f6 |     
    i586     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/0acc8d0a4f80f51c0562449639aa38319bd8e458 | ORPH
 powerpc64   | rtl8189fs-94cc959d56c1425fb... | NOK | https://autobuild.buildroot.org/results/72f2afb4d9fff280a91c40d180cd1723460859e9 |     
   armeb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/c14f6812f11133411fb83b4f4ddb7ac182e1daa1 | ORPH
   armeb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/5d0f4a032475d207435bd20d0d68850ae9ab8e83 | ORPH
   mips64    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/c22f7fbab1290d8162d3601c2ed3276000c13257 | ORPH
    i686     |          tini-0.19.0           | NOK | https://autobuild.buildroot.org/results/867c8381dcb942298c22496e4ed77afa0c43eb18 |     
 aarch64_be  |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/2979753a7016215621fef8d3e304ccea5ad5d80d | ORPH
   mipsel    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/80e2c180583f1d8b17952c9e2021a7c8b68a8e8d | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/cb0217fe21e4bfc65edc515d9e2b10aa3f2b6414 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/31e89e1dd1a3db2bea839e587e385a723030a9ab |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/48a315d6109f443236b294ec864b9742928717a5 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/84502aa42576cce32abf5ce064a473819d5d0dc3 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/578c1cb01aea06862c1be5ed678f739644f6848c |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/4b0be7ecad5c922aefa7d1991ed61e58f286d2f0 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b80f820b6d1fc42552429d50b38df5b8f6ff7adf | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/86e3a5eb23d16147fb8a7c20058a98a3b6adb195 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/fef94c1ae931a27516abdb864b606863de4b42ac | ORPH
 microblaze  |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/e1e9b0aaf157b8ae6250b1bd0c9e22b64f57d340 |     
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/5be7ffac9975902463926830a556780bf9d8df3a | ORPH
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/cb246d6ce06df2b27bbc0f17718d5c6e2528f2bd | ORPH
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/ed04f465a3f6cedd91e5a016b7032413e1ec7bad | ORPH
    or1k     |       xlib_libXau-1.0.11       | NOK | https://autobuild.buildroot.org/results/04b2070e0ed770c386566e4a1dc156fbe79bcc18 | ORPH
   armeb     |      xtables-addons-3.24       | NOK | https://autobuild.buildroot.org/results/612a9794eab932d16e75d0e3ad5e68383c62af60 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   lsuio-0.2.0 | 2 
host-prelink-cross-a853a5d7... | 1 
                  linux-6.6.79 | 1 
                 openssh-9.9p2 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/edb6c251712e3c254e59e8f62a43ad47e101e4ef |     
   x86_64    |          linux-6.6.79          | NOK | https://autobuild.buildroot.org/results/7ced3f233749857d0775a1504ed9f1759c9b7a9d | ORPH
   sh4eb     |          lsuio-0.2.0           | NOK | https://autobuild.buildroot.org/results/d1e4a07fdd3c8d15ab0b7cd5fd4472039ec5d20d | ORPH
   mips64    |          lsuio-0.2.0           | NOK | https://autobuild.buildroot.org/results/0db39212abf28d88f48cb356890eeada443161dd | ORPH
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/6edc86372343b56b8d02af775387f449d2a7ca05 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

   host-mender-artifact-3.11.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/6826839388a38c497d4b05358654585068f4cb80 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
