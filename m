Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE770C02192
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 04:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 569AF60870;
	Sun,  2 Feb 2025 04:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4eyVZLUhmBP7; Sun,  2 Feb 2025 04:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A31E8607B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A31E8607B0;
	Sun,  2 Feb 2025 04:15:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 703F6198
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 04:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C3014018E
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 04:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ll502ftKP0L for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 04:14:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 019A9400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 019A9400C1
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 019A9400C1
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 04:14:57 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so636520966b.3
 for <buildroot@buildroot.org>; Sat, 01 Feb 2025 20:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738469696; x=1739074496;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4WPXM0uIiWlsmF8OxbaBcnOI2Lzovs5AFcXQd+W/hCY=;
 b=JME9ZKz6mdw0BhJ1fBckjXW/ZvXyeack9bBTR1Vu9vaCpw+YdlOvNkRfTfAAm2y4Qh
 THf6+b2om/PQhP3m26eZW78Th2Ae2UddOUi2xMh1XFkEeIG2Oz6G4+xAanpikSt+HjCf
 KChjOkIV5Hnk6C4ufP2528AaiqdVJCpjAATSeCzYxXfFTH6atQW22iUYJVTAWd+Nu6I1
 9XWa50DFN6+bJNO8sl2RuMyBOxyxTdwUEeu0/zR4+QvwSAzxr/MOd6F3UcZnJwEdE9a8
 C+qDeX9t6ixVzCbheOHEW1FucA/uJLRvc9Cq7aAPecYbtmAuAtIrDOABGcuOmebfInWP
 U/Lg==
X-Gm-Message-State: AOJu0YzK6pT9OzCiv1OO8454YJ+L5lHBCtLqOHYBJ+XPVWLs+GafmfKA
 +8Si/D1/akm9ndJxvR4WAWVZ4ZK+Q8iL0GvhAyjqKtRJDtu6aHweE+SIaw==
X-Gm-Gg: ASbGnctnKsWYVMXIkbumPfWHz+2IfCPKYyWqLJ/n9Ey7M17rKXEccKUVsB8wTy0bbox
 HpxCHDF6GXkmeYBqLgYTvMHx28ZEN1DJd5g4XruqdclTh+1CI0R4W+yX/RtrLabuXQdIZLklT3f
 FmTDp9d1y4Tep87GWU5+/4gSVBPxqYa+qLtOwHGg03u2iwkglZHhH0INX6scN1i6coaVyoxVMK3
 2i/aOOAyjalfDnRcJtjYilBEBNNIFdzCX1C4020qGltpj0ktj5bC62nzU5NnTR67tjwDnriiXNn
 19AIlxVPP81UOUM98KI=
X-Google-Smtp-Source: AGHT+IEfFqk4Xz+Oyoez9QCpY2KVImW9BnIhPP0+fNuKWuIVRtXY6aWFG/J37vzqzZzQt8Y7lf/8mQ==
X-Received: by 2002:a17:907:da0:b0:ab3:85e1:f11a with SMTP id
 a640c23a62f3a-ab6cfcde2c4mr2101679266b.13.1738469695302; 
 Sat, 01 Feb 2025 20:14:55 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a320e0sm513390966b.151.2025.02.01.20.14.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 20:14:54 -0800 (PST)
Message-ID: <679ef13e.170a0220.8bfc3.335f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 02 Feb 2025 04:14:54 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738469696; x=1739074496; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=4WPXM0uIiWlsmF8OxbaBcnOI2Lzovs5AFcXQd+W/hCY=;
 b=MhkcDJGQ80HJluoHQpvrWCOWtL9u56oXD7di5aphV9bBfxhtzBoRKwvpeAgizeAVd0
 Kq8b66Klw/mu8cVUZC+3ihhvGHFaF+QR1h/8Fqf2mjYrLVzxIoGwirfgXsc/d82/PcW1
 sGAfYj7lDW4JpHkv6cswblz8jtqMq7AZ/gI6XIyjr+pZoVEnJrcBybzBntvV8g6ge74S
 IyUeYfsGz6ct2BxZku3ZwXLkBdd1Tc29eIpACwDMSKMUkm3VwE8bd0Je458ksvJESUZD
 /jP/euQr70wfYiEH/aIlLA9dkLHYMaMV0m0IWS1hoJlUYBx2o5wM6qwumUbRI4LEDNxl
 w54Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MhkcDJGQ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-01
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

Autobuild statistics for 2025-02-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  1  |  0  |  2  |
  2024.11.x  |  2  |  4  |  0  |  6  |
    master   | 28  | 237 |  0  | 265 |

Classification of failures by reason for master
-----------------------------------------------

         host-cross-ldd-1.26.0 | 10
             util-linux-2.40.2 | 10
                   foot-1.16.2 | 9 
libbroadvoice-f65b0f50c8c76... | 9 
libg7221-dbfc29d4806ecdace5... | 9 
     bandwidthd-2.0.1-auto-r11 | 7 
               mariadb-10.11.6 | 7 
               pulseaudio-17.0 | 6 
                  bcusdk-0.0.5 | 5 
                  ffmpeg-6.1.2 | 5 
                latencytop-0.5 | 5 
libsilk-4268a02240c35c6055b... | 5 
             bluez5_utils-5.79 | 4 
                   cvs-1.12.13 | 4 
                elfutils-0.189 | 4 
            gstreamer1-1.22.12 | 4 
    host-python-greenlet-3.1.1 | 4 
                    mpir-3.0.0 | 4 
                  ntp-4.2.8p18 | 4 
                 openssh-9.9p1 | 4 
                   perl-5.40.0 | 4 
  gobject-introspection-1.76.1 | 3 
         host-b43-fwcutter-019 | 3 
                  libsepol-3.7 | 3 
                 libv4l-1.28.1 | 3 
           libzenoh-pico-1.1.0 | 3 
          linux-5.10.162-cip24 | 3 
                 linux-6.12.11 | 3 
                   linux-tools | 3 
               valgrind-3.23.0 | 3 
          cloudflared-2025.1.0 | 2 
                 coreutils-9.5 | 2 
                cryptopp-8.9.0 | 2 
      docker-cli-buildx-0.16.1 | 2 
                 erlang-26.0.2 | 2 
            gdk-pixbuf-2.42.12 | 2 
                  jack2-1.9.22 | 2 
                  libnss-3.107 | 2 
              libopenssl-3.4.0 | 2 
     linux-5.10.162-cip24-rt10 | 2 
              mosquitto-2.0.20 | 2 
                   swipl-9.2.8 | 2 
                       unknown | 2 
                     ace-7.1.1 | 1 
                  assimp-5.3.1 | 1 
           at-spi2-core-2.50.0 | 1 
                    azmq-1.0.3 | 1 
             batman-adv-2024.4 | 1 
                   bird-2.15.1 | 1 
                  boinc-7.20.2 | 1 
               bpftrace-0.19.1 | 1 
                 c-ares-1.34.2 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                  cmake-3.31.5 | 1 
             cni-plugins-1.3.0 | 1 
                  dlib-19.24.6 | 1 
             docker-cli-27.5.1 | 1 
                 enchant-2.3.3 | 1 
                     exim-4.98 | 1 
                    flac-1.4.3 | 1 
                flannel-0.26.0 | 1 
             fontconfig-2.16.0 | 1 
       freeradius-server-3.2.6 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
              gcc-final-13.3.0 | 1 
glibc-2.40-18-g564178076272... | 1 
               graphene-1.10.8 | 1 
                   grpc-1.51.1 | 1 
                 hidapi-0.14.0 | 1 
       host-gcc-initial-13.3.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
   host-mender-artifact-3.11.2 | 1 
httping-0e26c53d5fe504eb720... | 1 
                      icu-73-2 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                   libcap-2.73 | 1 
                  libdex-0.8.1 | 1 
               libglib2-2.76.1 | 1 
                liblinear-2.45 | 1 
               libunwind-1.8.1 | 1 
                  libva-2.22.0 | 1 
              liquid-dsp-1.6.0 | 1 
             lirc-tools-0.10.2 | 1 
                   ltris-1.3.2 | 1 
          lua-cqueues-20200726 | 1 
            netstat-nat-1.4.10 | 1 
           oath-toolkit-2.6.12 | 1 
               openblas-0.3.28 | 1 
                   pcre2-10.43 | 1 
               pcsc-lite-2.1.0 | 1 
                pipewire-1.2.7 | 1 
               postgresql-17.2 | 1 
pthreadpool-560c60d342a7607... | 1 
         python-remi-2022.7.27 | 1 
                    qemu-9.2.0 | 1 
                     rauc-1.13 | 1 
rtl8189fs-9a82349c2c40515f9... | 1 
                 rtptools-1.22 | 1 
         s6-networking-2.7.0.3 | 1 
             strongswan-5.9.14 | 1 
                 uclibc-1.0.51 | 1 
                  usbutils-018 | 1 
        util-linux-libs-2.40.2 | 1 
               zxing-cpp-2.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/4e7c3c3a420b976eb18ca9d47902ee31e11c4b54 | ORPH
   mipsel    |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/acf4dd5d393453967f4430a20c983dde5109ef0b | ORPH
   sparc     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/14a1b2642a7cf4ab9fde671e35aacf1e1175cb52 |     
  riscv64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/b53f44acac3a37e5c3a2aded4df2531cff360cee |     
    m68k     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/5755a37ecc0c7f398d58198de03fa783578f910c |     
   sparc     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/3049276730b4c4e6128b6c591f997a295e25c2c8 |     
    arc      |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/9cf1a418ed9d24b0015078166062a5f8c3886685 |     
 microblaze  |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/05b7ff1f44c10c8c6fb50b5d0bdc2fdc54681dbb |     
  powerpc    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/994f395761e01e6eb7f2a57b70aabfe95f6c41b1 |     
   mipsel    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/77022064687c79e65230905872680e9c107e31df |     
   mipsel    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/9a876e3e210fa29b535491ad5fc0b5c2d425beac |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/ba47035ddc985d3baf600b1f7be17568102ecf7e |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/a99bd2d8db729b0433f43be9b3d947fd4a0a2668 |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/c74894dbd89e9ba3d13b8c88a3c186898ea1a403 |     
 powerpc64   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/2b8d6613814b249795e5b025e75f4f3499419083 |     
 powerpc64   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/f587174d06debf80006015f3d2fd1b2f6edb560e |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/4b83849f5c6588c79a7bf809c315a700348690c9 |     
   s390x     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/bea017ee179ce191e174a878339492b1b82e25c4 |     
   armeb     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/06d8d89280fd004c97eddd22c6aa776cb7e65869 |     
    or1k     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/f33f34ffc2d28c12f10b4430a33308ec5438ed0e |     
  riscv64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/c40db0839646ea07962017f6e159897bda88527f |     
microblazeel |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/99025896d66838abc90c519f96705df0bb60073c |     
microblazeel |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/d63d12407265bf6572b75fbafa14406776e78edf |     
  aarch64    |        bpftrace-0.19.1         | NOK | https://autobuild.buildroot.org/results/bd075cb8c55f9f8a017711dc804b8d81ae89b4c5 |     
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/cdda1f8d53fa56e1585b5907b782a1f13c468bb3 | ORPH
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/9b068944133393cf7bc8b441fa09ce437e6472f1 | ORPH
    i686     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/a460391be5a38bccfb00746641e752bf7bf2e3ec |     
   s390x     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/b900b0da7f01a4583605139a3826dd3d42e806e4 |     
  mips64el   |          cmake-3.31.5          | NOK | https://autobuild.buildroot.org/results/9c6af045621fc413cd844865d2721ae87559aa74 |     
powerpc64le  |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/7e9c4aa0f22e41f6b31b769cd74d62388848ebdd |     
 aarch64_be  |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/5b40c168665a213ecd6000bc5122c4a3f300d878 | ORPH
    sh4      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/f03b8df5a62930348b48649e37b5958851211233 | ORPH
   armeb     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/52af18791e0f0236f779515c59a2179bfcb2126f |     
   arceb     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/f6a59ff4fee430c83706554c80c0b9765fef8710 |     
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/02ebafea1d05e5eda137632eeadfc58387436bbd | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/271acbbc25ab114fe3c681c58599b956c08eb8f8 | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/dbb2ea93d5485653ff2d89e693aa110beb8ee691 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/718637c64608a6d604050bd0d18c78e6b4c263a5 | ORPH
microblazeel |          dlib-19.24.6          | NOK | https://autobuild.buildroot.org/results/5fb642ba8af984ca1b3df3766b5ae0793f57abc5 |     
   s390x     |       docker-cli-27.5.1        | NOK | https://autobuild.buildroot.org/results/60faff6c89da159fc9ae1e07a6376e86deedd1a4 |     
   s390x     |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/80dbc8e96768dbcf5419cf7fa5f03d84febbb550 | ORPH
  riscv64    |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/82fbfcdc181dbd85abbbe80c724855c715a428a7 | ORPH
  aarch64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/391edfba1dd654b4939ee9ba4ac0aa44c7a4ee6d | ORPH
   mipsel    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/b45b1f5bedb8ee544e2323a195ab80976399d091 | ORPH
   mips64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/764dcb8b92ac3fd2136630bd151783113e6eca21 | ORPH
powerpc64le  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/0bcbde24c5cc006e940626565ef3b3ce76c8ff3b | ORPH
powerpc64le  |         enchant-2.3.3          | NOK | https://autobuild.buildroot.org/results/c47c52a4494ef36be6d1794bee72e82f491dd7a9 |     
   mipsel    |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/f17682442e6bf9008671bec7fbaa09ca5cea6720 |     
    i686     |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/fa57b6412a80cf6e9e51a650810e25edda67dee2 |     
   armeb     |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/f14975c0920b9855d01cb124d803d6ee98f3a07c |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e2e1d85024f94e6978709f57a573a92453cd84e0 |     
   armeb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/b5a782db574dfab7ae61e25291c05b1537c44c91 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d4d38382639df2b7288fd80245064dc5b06c4cac |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/2448233282823a2a170f4ada0831b95d6c13517e |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/dfd465b4c32cc8ae7ed14b70a70fc4d7527c227a |     
   sh4aeb    |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/93949b210e3e2152b40084cb0d5722f516af0fb7 |     
   s390x     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/999345337dd13dec3a2158502d6fc960794d33e8 |     
   xtensa    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/5f992da64289b479efbda6f942ced6e2257e5a9a | ORPH
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/111a1fd3fe5deecc5280c37174849a1073e169d1 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/a76800a680e18408ce6914088d0456066336f8dc |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/b3e0179019d72995a8c1714d161154cdf8b9ddb5 |     
   armeb     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/0f014818f55c4b10ebd96506ab13db521008c5a1 |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/4431d56e1602bd80a16d5b25126412ecab35e399 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/2e450c88bc593f4d370f81bcb200b0452cd012d2 |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/f5bb1a145d4eb2e5edf165c21625b7a8998a7948 |     
    m68k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/b3fe1c1e51d852d3a665e21a32ad90a6825263f0 |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/21a5671c0961ce7f713446cfa371be421bb26300 |     
 aarch64_be  |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/28cd04a4135c83a29e268044a6fea490e1126638 |     
   mipsel    | fs/romfs/romfs.mk:32: /home... | NOK | https://autobuild.buildroot.org/results/6f770735a9702e2e11e1e5684b336305e898c4aa |     
  powerpc    |        gcc-final-13.3.0        | NOK | https://autobuild.buildroot.org/results/344cd371ab2167bc26cfe7e6e597a4d2e4a691e5 |     
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5375b4a6034d6705eddbe6c589f30178c8d5b936 | ORPH
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/26ad53321e7ee7d64e52b117377d1042588b5843 | ORPH
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/ca314743cc7a037329ae9a7e511d6d97ccb1c681 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/8d6d81c3a3241f14abfd14327d24e2b2317d01b9 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/01012db09b07016552f1b42456b0870e8059a47d | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a93eb97c8d10491adef9cd6ab58c861fe3ee091d | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/9e77305be5139f2c6263af55a624167cb8586f90 |     
  sparc64    |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/d4b3b97630e5637786fbb41e8d9643e59cd021dc |     
    m68k     |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/a8c9fd85df7a0e2120592c7e73e3750e0523c75a | ORPH
  aarch64    |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/6751563c7db592232291d65b79bee88367f42845 | ORPH
    m68k     |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/c961ddecff914471ef0ee013536a2558508b6ddc | ORPH
    mips     |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/18e8c76fe76391db0f52e989dfe2ec0dae46186a | ORPH
   sparc     |         hidapi-0.14.0          | NOK | https://autobuild.buildroot.org/results/f0b6bef596d827f3263bab4b0bb4d69038049a97 | ORPH
  powerpc    |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/432932b3bd8db249fcb3426b53db3821edd9716b |     
    i686     |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/44c344935ab589422916f0b664fcef44df788151 |     
microblazeel |     host-b43-fwcutter-019      | NOK | https://autobuild.buildroot.org/results/01183757a4b5e483245bdde0307030eb6d2c9846 |     
 microblaze  |     host-cross-ldd-1.26.0      | NOK | https://autobuild.buildroot.org/results/80122dca869b5bd7862ec02dd4e4f26707a449ca |     
  mips64el   |     host-cross-ldd-1.26.0      | NOK | https://autobuild.buildroot.org/results/d3d3e0ca89ef84ce831d83c14d6aa87d12fb7c79 |     
microblazeel |     host-cross-ldd-1.26.0      | NOK | https://autobuild.buildroot.org/results/5bfbb25747e395b207f65b7c917382e49da4e654 |     
 aarch64_be  |     host-cross-ldd-1.26.0      | NOK | https://autobuild.buildroot.org/results/bf47ecaadf389ff131850bbdbf24d58e5c8e6e18 |     
 aarch64_be  |     host-cross-ldd-1.26.0      | NOK | https://autobuild.buildroot.org/results/6ff808b879520d0d34883901ffa4197fdc4df553 |     
  powerpc    |     host-cross-ldd-1.26.0      | NOK | https://autobuild.buildroot.org/results/0caec114b61688b285c21b7990d1c9f75c023b70 |     
   mipsel    |     host-cross-ldd-1.26.0      | NOK | https://autobuild.buildroot.org/results/66578075a275ce264e91a809283bf6cad31dd5ed |     
    or1k     |     host-cross-ldd-1.26.0      | NOK | https://autobuild.buildroot.org/results/63070be9f3732a52f9d5b6e03ade17e33de239eb |     
 powerpc64   |     host-cross-ldd-1.26.0      | NOK | https://autobuild.buildroot.org/results/dcde6ea49d93806d5e5213a7c52c4d8f6e7b8ab1 |     
 powerpc64   |     host-cross-ldd-1.26.0      | NOK | https://autobuild.buildroot.org/results/00b7caca66bf991d4fc6504364ef892fb182d055 |     
  mips64el   |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/0baf60b5558f2d8c1c01e9def454a6036652c798 |     
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/bf430029e8b8cdd5c512b7e246ba7af83b9a5f07 | ORPH
  riscv64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/ea327f456f8dc3acfe6eb523bad2320228396e94 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/22ef1e109578a19d73d75a3daf255b493aaf1514 |     
  riscv32    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/bce094e2ef1235083b1ddaef89790af9d878e3c1 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0fae2a06212eb163b960248f4a60c9973f07bff3 |     
  riscv64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/8502c26f3c586d889db036e8507c3b28c7505189 |     
  mips64el   | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/dafb14fbcc51de8bf8e1f7f20f024c0a8b95b239 |     
 microblaze  |            icu-73-2            | NOK | https://autobuild.buildroot.org/results/42c2a505819ed33c21a5efaae22509f809646c41 | ORPH
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/1b772bf09ba667785a76685e95f57bd79913c99a |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/974a3271bd7fe9673da50a2ddbd389a70b3fe6b6 |     
  riscv32    | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/580dfa1f05136db4013b9e29da07e196e2835d77 | ORPH
   armeb     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/454310a91408c1df014909024481ef6fb51dafd3 | ORPH
   mipsel    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/ec51a6929132c8128debc9ce308afc765033dee7 | ORPH
   mipsel    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/2aae6ffc23d5f43d1f4a806a5336eed1a9b08878 | ORPH
    sh4a     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/a5d3cf0832683c95d120f58dbea2384c96879b57 | ORPH
  sparc64    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/a5bb8817baa5354ae4644f2ff55f4e572191ad25 | ORPH
   mips64    | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/b4ea75a8bf113409b6c890d422b99c2bb49c3ecf |     
   armeb     | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/fc6b571eb63548cb29eb95f38348a5925e18f85d |     
    i586     | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/6bb094ee82d5ca0664c997747196231a37901e65 |     
   armeb     | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/51c30b7dc21f8374ae0349fc76f8605bc4df531a |     
   mips64    | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/6141db96b0d0a18c1e38799e82ad5f98b5c4b587 |     
microblazeel | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/6059f5fd69814fafed91257e7118b97158f26134 |     
   armeb     | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/a0c01d5b453590c9a0fda8caa7b4c1f1df8c169f |     
   xtensa    | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/f79881cc585d6fc0070f9513b6383abae1fef6bc |     
 powerpc64   | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/a8c68a87d1449dbda3e4f1d79e2a3cdb5e684b6b |     
 microblaze  |          libcap-2.73           | NOK | https://autobuild.buildroot.org/results/423596cdabde3beb78211dda04465cbee56aa700 |     
   mips64    |          libdex-0.8.1          | NOK | https://autobuild.buildroot.org/results/46320bd736f67283ecdce2ba0bd099dc91b179e2 |     
   sparc     | libg7221-dbfc29d4806ecdace5... | NOK | https://autobuild.buildroot.org/results/a799442766f90607bb57cb2f767949e57ae7e1ff |     
    mips     | libg7221-dbfc29d4806ecdace5... | NOK | https://autobuild.buildroot.org/results/0b61db9b62aa053bb83c45effbf272ae110926fc |     
 powerpc64   | libg7221-dbfc29d4806ecdace5... | NOK | https://autobuild.buildroot.org/results/93595a3683aa8ba03f589a2d5939a555c5ed1d6f |     
   arceb     | libg7221-dbfc29d4806ecdace5... | NOK | https://autobuild.buildroot.org/results/90cbb0690193c129449df5cca353349c0e6c78ef |     
 powerpc64   | libg7221-dbfc29d4806ecdace5... | NOK | https://autobuild.buildroot.org/results/e43f2ac182d0c2492d97d322a0cd63e98849d45e |     
 powerpc64   | libg7221-dbfc29d4806ecdace5... | NOK | https://autobuild.buildroot.org/results/486d6928e1cda3c90741c11eccc46766693901b3 |     
  mips64el   | libg7221-dbfc29d4806ecdace5... | NOK | https://autobuild.buildroot.org/results/7b1449912e6eef71ab5a2399dce3337df650d84b |     
   xtensa    | libg7221-dbfc29d4806ecdace5... | NOK | https://autobuild.buildroot.org/results/938d5d2b0b249be792f267fc59b63b03466af296 |     
   xtensa    | libg7221-dbfc29d4806ecdace5... | NOK | https://autobuild.buildroot.org/results/10f70eb1802a20730e603828f9fe6e6c1f611359 |     
 microblaze  |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/82161bcfeddca21b015d8651514f053f0a5ea435 |     
  powerpc    |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/474bb141d7e5e306c7627482c77a1a38d0aade67 |     
 microblaze  |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/b20ae8962d86be1eb7a1228b1322cc6c3f958b69 |     
 microblaze  |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/6012e2c6a5151cfbbddedabccbb33c71da7a5417 |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/c78ee74b4e011458970ba0823ec450909d01aae1 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/c188fedbc2577ed6e7a53950d6286055eec96a91 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/68cc1f5ea9a78b7045431b83278ec23b61459624 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/553737d3be21111510038abbb27b92ee5e43735d |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/9cb0a63dd47a1ddbd903e1d27bac3be8b9781490 |     
   sparc     | libsilk-4268a02240c35c6055b... | NOK | https://autobuild.buildroot.org/results/4a18ee5fce77d0429a00a151cbd5ad1e48d35405 |     
    or1k     | libsilk-4268a02240c35c6055b... | NOK | https://autobuild.buildroot.org/results/c3683aa5667f42f47af1c275ce79e17bea296a43 |     
   s390x     | libsilk-4268a02240c35c6055b... | NOK | https://autobuild.buildroot.org/results/3f5d7a57811514bbff87031ada94c70f6efc815d |     
powerpc64le  | libsilk-4268a02240c35c6055b... | NOK | https://autobuild.buildroot.org/results/da01410e6583d26f8aa178da85ebd8de2ff1c9c4 |     
  sparc64    | libsilk-4268a02240c35c6055b... | NOK | https://autobuild.buildroot.org/results/2801046096f25affb7c18f3000a0df42a347ae96 |     
    or1k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/11b97e66be1117ba72c904449ac6d1decf8c1466 | ORPH
    m68k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/d6c602e6de5c51b4e858c37ff0ce842d52915606 |     
    mips     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/3deefa05afabb0b3e85097690cd8b6c65e7ba468 |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/b8f37f1afada8c2f8be86d52d16cd6cfe181678a |     
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/2abd58d85b68ae4a5e879a37387170decd569466 |     
   s390x     |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/65dbbb1ccd41dc2747c2045c1b8d05df1b114c88 |     
  powerpc    |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/8614d6757e27912c37e5adef2ccd592de489a837 |     
    arc      |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/1a9ca35158baed5bacfc865a522e65377c542abe |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e0bb31e1ec692813f87225dd41430ea5db3a1827 | ORPH
    i586     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/61b47332d759dca1d793b4eec2da51b716bd4c5f | ORPH
   sh4aeb    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/8e1b9ac50a2487545c04ed73bce6f076744f0883 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d70ebfe45283f0b5701e9ceea18682c17ae9fd04 | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f654b74e02e7ba06b86ec83236dbf1d812df861d | ORPH
    sh4a     |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/d1ef9cd598d10de3f687effd750ee742a2bb4c39 | ORPH
   x86_64    |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/480b63d809c930a08a89521d98471b856c4428be | ORPH
    sh4a     |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/4fd171772c12b7e60e56525c6c5b9493255be4d7 | ORPH
  sparc64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/2ef1e22df4c34f66f5c3fdff0a73e5859c30d827 | ORPH
    mips     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1aea30161acf5d1ba9561f16d187ae47eecef24b | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/6529e1a67e351f836e18eb03a3acb10d7c035ceb | ORPH
    sh4a     |        liquid-dsp-1.6.0        | NOK | https://autobuild.buildroot.org/results/88af0da779eb41e7203e65b1903e969e4b4b3390 |     
    or1k     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/9f118e7c4dc868d079e158af27b064cdd55ab08f | ORPH
   sparc     |          ltris-1.3.2           | NOK | https://autobuild.buildroot.org/results/3d7091045f7653ed0f4ebf846d4afe9031061f32 |     
   mips64    |      lua-cqueues-20200726      | NOK | https://autobuild.buildroot.org/results/6f82233e074c33650a33281328cbad6e1c5fff93 |     
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/ca1a382e37398eb4f9d6155ecbec50fb67bdf4a6 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/7ed1f3965519546be6d0988bef44ef988e3774f3 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/449905c350bf40163457318c5af58e8a7c728875 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/0e9f397f32929de70127728d21f4dfb55327cefc | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/3bf147129eb8b715d803290d8f50aa49c1581c47 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/903a6f65f36b2838d4972a4cfdc02089ff55ee36 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/86e2bf0a2f4f036b422a66d0b7403c83dfbbe10a | ORPH
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/3a486fa1ae0835580bbdb846da39227e8c6c67b8 |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/7968191ea3bf5d74bfbe4ec7fd9c475d420a4c02 |     
   arceb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/735f260fadc3a46458135140989fc352582bcf47 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ec73288cad5a73bed174158e10171ee92cc8feca |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/43c0f8185788efd09fb925f57c75493330761890 |     
    arc      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/3c5e10db887f80259618e0008fef9841325296a1 |     
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/1cbb7e032207380aad5263e9b7bdc466489543c5 | ORPH
 microblaze  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/39a3637100330f158a7ec0191ae3fa5814fa167f |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3338220622d9e67e9abbd31552e597511cb0ef6d |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9a5c60f9a0137a1b00085238628c72e05a65c46e |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/77a52da3087182186a6b683df6121daaf6650611 |     
   armeb     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/22cffb929912ffb8f199e47cea66e07b3bec469a |     
   mips64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/9ffb0e26899c88667041c61d19eb09e29e850afc |     
 powerpc64   |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/114d1cb09e725e5631d1efe4bd5fe0b2db157a81 | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/2ff9dac38995499c5127797f86756e857c194f10 | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/f4e42135f4af67d30e767e04c8b8e02b318648ed | ORPH
  powerpc    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/7b4fed2f6efd8fbd83b05533cfeb982dd7a3fddb | ORPH
   mipsel    |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/4410199b2a3e9426e8b9e9636581a53f22eeec60 | ORPH
 microblaze  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/842a3b59fd5cae6f066aad896e598cc480672439 | ORPH
   sparc     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/166c236aad258d3e14528f20bc3c45f454b174c6 |     
   arceb     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/b24623316ac5cc8b51661977e0ccc3af153f96ed |     
    m68k     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/1fe763799cd38d07af057421eae73395054c7562 |     
    or1k     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/6c2944ed15bdd35c8761fd96474291cfc5dd493a |     
   arceb     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/021285b571bc17a6338345e07c4627e6b0ea0e74 |     
    m68k     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/d02cb0431b9cb545ba489e09789802b2d9c4da1d |     
  riscv32    | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/1c9e8bc58ef02f7b97d834973fcc150be23866a2 |     
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/198a54bf63511d662d291d19895889d9a640843c | ORPH
   sh4aeb    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/0a3d4461d51a359306332b31423e5e40631f4aa6 | ORPH
   armeb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/92e84c1a8b9f005f6afcb02afc606fd740883004 | ORPH
   arceb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b4eeaa90994f3cf11345b1329a5560d026da7097 | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/016643f930a2a8db4ea8657cd5ba375861be1917 | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c46b43c8bfbd2f7f407212f7b2e1e92762f56139 | ORPH
    arm      |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/160c54453eec15ed26de3274ce2470af406bf461 |     
   s390x     |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/8c78a6d8495125959c6258c9713862bcea76ce79 |     
  mips64el   |           rauc-1.13            | NOK | https://autobuild.buildroot.org/results/30dd93d82979b936b0442144121e30684fe8831d |     
 powerpc64   | rtl8189fs-9a82349c2c40515f9... | NOK | https://autobuild.buildroot.org/results/18a8e723cdaac28dafcd40cac16f2502285f9154 |     
  aarch64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/70a62edcaba1542d64fe37f51aaa9e48a000d8cb | ORPH
  powerpc    |     s6-networking-2.7.0.3      | NOK | https://autobuild.buildroot.org/results/7a80d13d98fbac249c8af2502062e1b3e9e83885 |     
    arc      |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/20c8c1f52f363e5baa0dc21f6ca1f01aab436956 |     
  mips64el   |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/1236a2325a97ae7ebc3c55575f6b7d8906fbb78a |     
   mipsel    |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/738fb3723f2bfeae038e6399ffa07f64b2404d74 |     
  riscv32    |         uclibc-1.0.51          | NOK | https://autobuild.buildroot.org/results/4972324be69bdf0c79409af3db4dcdfdbf5754fe |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/d824089ec4341037b364c587eb24e4b4973081f8 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/281e18564fcf3bb2d00599fc63dd242c9b2fcd53 |     
    arc      |          usbutils-018          | NOK | https://autobuild.buildroot.org/results/bca14ce4fe05f087e1d8821670ba3165e9820a7f | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5e2df3aa0fadaf7c01bde239087eb2cdc02e6b54 | ORPH
  aarch64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/17e1cca72726f90f8283923b44a936bd4e603dfd | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2af30a718954d7902eada46ceefba4b81fc1be54 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/c3e40c59381792a45a979d65391225c1eb640d07 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/34723ce35861cdd059fc695f533755a7da4f2500 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/59c423a9c78f3d4e068db1bacea76feb1e813f29 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/e8124a2674672fbc94ca5b3753ed5dc0e531272e | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/c864cd53567f713167cfc8d000fdaa2f740581cb | ORPH
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/11cee2f364a279ea3550a57b8e92194753294cdd | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/7a211945f74aa031ab67b71240747f11bf314f23 | ORPH
   armeb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/e21bc8c8687c362546d3036fa05d35c14b2e2ffa | ORPH
    mips     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/ccd8be5c455816289ea98254fea5611ffba68ae7 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/e572435f16cbf2668120708563c14114498cc6aa | ORPH
   mipsel    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/a8f398c5e2bc41141aaa80f60705d7bab27f7066 | ORPH
   arceb     |        zxing-cpp-2.3.0         | NOK | https://autobuild.buildroot.org/results/93ffa69b9f92f142c65169f9c3a7c7ad0e733551 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

            gdk-pixbuf-2.42.10 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/d7c0ebee6d2ace8c47cbca7718a9a1b3560cc8fe | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
             containerd-1.7.23 | 1 
httping-0e26c53d5fe504eb720... | 1 
                 linux-6.11.11 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/497db93162c093b0e1c3ec16136a11f7cc73f226 |     
  riscv64    |       containerd-1.7.23        | NOK | https://autobuild.buildroot.org/results/360381d19dd6a6ffd1c7d9c0aa92402bdea23fe6 |     
   mipsel    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/e493a5c218141f83b4b3510382e7f32ddadc7f41 |     
    or1k     |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/e052233191f6fc7e782897f71188788bc89a9c2f | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
