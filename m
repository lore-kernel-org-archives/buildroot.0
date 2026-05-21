Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDB1CD4F3D
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 03:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 616D3615A2;
	Thu, 21 May 2026 03:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bOWgcI_k8Tv; Thu, 21 May 2026 03:22:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94AD46159C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779333732;
	bh=ivaKVxFZxFmvb7olukWCfxo04pADYg1hDIdnJtBfnt4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oiq44gmmSWexY4mN+c06GGegJb/JdcL+CFW7LrCS+sCo8NtN6GigQPbSiDPM4wB5e
	 0dPTs5nNzAQqxBBAXIYpILt6ZouvE8ZV6g3D9YwnrlQ+yGQ7M/jp8nZ9c04qrOF5Iu
	 85I51WkrJEcxFRww7urGFwNTAy2xTeFslZ/weFKfosJnFNCJIjV+byYXhtaoEZnPjy
	 lStoONfARLZvPd6bKdVj+INn18c97GWUoir22umz9Bez0NxtU1ZrsjwxbBYmGVoWMO
	 uGo6zQNRerA6a+P0O4B6yOe2EVEeRUqLXhoD6tpeD9NVk4+RB4bq4al87/KTqPcSh0
	 VwCTUwCrb3u0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94AD46159C;
	Thu, 21 May 2026 03:22:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F58A282
 for <buildroot@buildroot.org>; Thu, 21 May 2026 03:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CDC684375
 for <buildroot@buildroot.org>; Thu, 21 May 2026 03:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u78VFjUsctn3 for <buildroot@buildroot.org>;
 Thu, 21 May 2026 03:22:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 888D484374
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 888D484374
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 888D484374
 for <buildroot@buildroot.org>; Thu, 21 May 2026 03:22:08 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so31906925e9.1
 for <buildroot@buildroot.org>; Wed, 20 May 2026 20:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779333726; x=1779938526;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BBtj9celzY9pJYUf8DI9rB8obFBezJPSRPXJ6aCXTAE=;
 b=fIPlLdIoRziDyEnN43pM502bPL+++0NARUJlwLIRJLzPbjKyqdj6u/Tv1Sppbz0D4Z
 yVYWUv3zWacgvUREZznxNBC+5lMIyXZD5BF0OfBwIoXkmMWSxkBGRiBJKvqnO4TW4PnT
 XjAI9wcOBceFEn9oVJOot7Bi+M9B+bqjb4+awytUptG2adlcbEeR1I7TjNRtw7BCPbl4
 dwXCRmBrsemdzLzFVafEjp15s3bXWtxmirRMQI7KZgsRJR8PZ+BqpzGa+CEp7PH3vke+
 O5tnlp+7XNYDNNr9jMRlIcCVVQsAQ1FcskwgRNbHrq/eDLBpuSafP97G46RnvIlVRltv
 chMA==
X-Gm-Message-State: AOJu0YwMws6OjCqJj1j8OPjndsDWAyj6BTqAATh2QD12jyMMMZQlSK/A
 +6zDUGgsTYqZmm+z+iVvHfUKLZ6J2z594lhVVCNJJgQmsiYS7goPdBKU0G7N82vb
X-Gm-Gg: Acq92OFEAXbU8qs1P043GHo45RaXS9FVuc3HGi1cR7f9tKHfOGkAoi6iVWTG+XYvy25
 QRXsNxWOUcbBjMbONUff4+nsEVV3wWNaQETEQHzdmZPXgLDnARuwz0UmgIxUiAjHHE81iKXuMfr
 P2AQ67t45TElEY8h+t5oWCa8fXcoMf2baQtb0ZmVG6QMEfjCZslypkQv4qqVAuAfoZrT9FzX2kz
 aZo31ZAgQcfFyottbt+bxkI556AnCFxDdqwwX0NFLEepaQqGbBd1o0u6lfeN/xCGy6mM5xshOH0
 2Fm93lboEyALZbYaRIX2qNXQaF6ExFWb1MsqnvJ4uYUItd/51ER5pGDvO83tJkyJjEmcAvAfxE0
 /MvCXRIWPX9bgx9yVtg7xULTCFZA3OeT/wVTmfRqM5UyNhv0GeVSjWRH3JEOXywfXuwvZuIzYfN
 Krz14XR6rh2eACqTK/9LYrPGY6XRLEaciQppMGNFy2
X-Received: by 2002:a05:600c:35c8:b0:490:2640:a982 with SMTP id
 5b1f17b1804b1-490360478dfmr10828615e9.3.1779333725825; 
 Wed, 20 May 2026 20:22:05 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d9eca8sm31275585e9.12.2026.05.20.20.22.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 20:22:05 -0700 (PDT)
Message-ID: <6a0e7a5d.1faca35a.348338.1b85@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 21 May 2026 03:22:05 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779333726; x=1779938526; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=BBtj9celzY9pJYUf8DI9rB8obFBezJPSRPXJ6aCXTAE=;
 b=qup677jFs6ya9JOQqr1lBIwvtq5+KbJoMZmP8Y4LdylIioKqEd/kneaxsptzQCGlmd
 QtFNlJCJuCyjruyXGJY8xgZ8I6ZDZdGfyxxyajV4eHV2E60OesysIaC8f0mQSeWG2EFi
 YlqPzSwKuc9UF/ytdG+dzJkldUbH3TqXSSYrxXOqqXVNBl4epu6dOaiRBdV6mmeyW6LF
 CxTgoXaKm1rkaqUCWm0+iPybdVv/dHvWOfR/UlpVtT5MIXaY4p4XTrIyTyemADjFZhPh
 ugLM5qGBsgwoUvopQ26OtGA/brEkFQMVtqgCChds97ED4OcjIGJ1He9YQdzFx0eQzeC/
 8FjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=qup677jF
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-20
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

Autobuild statistics for 2026-05-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 14  | 59  |  0  | 73  |
  2026.02.x  |  6  | 25  |  0  | 31  |
    master   | 96  | 323 |  1  | 420 |

Classification of failures by reason for master
-----------------------------------------------

    host-gcc-bare-metal-15.2.0 | 24
               host-dracut-110 | 16
               linux-pam-1.7.2 | 14
glibc-2.43-27-g4070d808bea1... | 10
                       mrp-1.2 | 7 
                       unknown | 7 
host-gobject-introspection-... | 6 
             dahdi-linux-3.3.0 | 5 
host-gcc-initial-arc-2024.1... | 5 
                host-odb-2.4.0 | 5 
                 libavif-1.4.1 | 5 
           libmicrohttpd-1.0.5 | 5 
uhttpd-15346de8d3ba42200249... | 5 
ustream-ssl-5a81c108d20e247... | 5 
          host-binutils-2.46.0 | 4 
                 libmbus-0.9.0 | 4 
               libpthsem-2.0.8 | 4 
            18xx-ti-utils-R8.8 | 3 
                   dante-1.4.4 | 3 
            host-binutils-2.44 | 3 
                 host-gdb-14.2 | 3 
              host-guile-3.0.9 | 3 
              host-pahole-1.28 | 3 
                 host-tar-1.35 | 3 
                  iozone-3.508 | 3 
                     kbd-2.9.0 | 3 
                  ntp-4.2.8p18 | 3 
                    olsr-0.9.8 | 3 
                openocd-0.12.0 | 3 
phidgetwebservice-2.1.9.201... | 3 
      shadowsocks-libev-v3.3.6 | 3 
                 sqlite-3.53.1 | 3 
             util-linux-2.41.4 | 3 
                enscript-1.6.6 | 2 
firmware-utils-c42a3bc53da8... | 2 
               freeipmi-1.6.16 | 2 
                 gnupg2-2.5.20 | 2 
  gobject-introspection-1.84.0 | 2 
               host-attr-2.5.2 | 2 
          host-binutils-2.45.1 | 2 
host-binutils-bare-metal-2.... | 2 
       host-gcc-initial-13.4.0 | 2 
                 host-gdb-15.2 | 2 
host-google-breakpad-f49c2f... | 2 
            host-libtool-2.4.6 | 2 
               host-make-4.4.1 | 2 
    host-mender-artifact-4.2.0 | 2 
                   i2pd-2.59.0 | 2 
                      lft-3.91 | 2 
libdill-32d0e8b733416208e04... | 2 
                 libidn2-2.3.8 | 2 
                  libnfs-6.0.2 | 2 
                 libzlib-1.3.2 | 2 
          linux-5.10.254-cip72 | 2 
     linux-5.10.254-cip72-rt32 | 2 
                    lua-ev-1.5 | 2 
            minizip-zlib-1.3.1 | 2 
                   perl-5.42.2 | 2 
                  readline-8.3 | 2 
               tcf-agent-1.8.0 | 2 
                 aichat-0.30.0 | 1 
           alsa-utils-1.2.15.2 | 1 
amazon-ecr-credential-helpe... | 1 
                      atf-0.23 | 1 
                   atop-2.12.1 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
             babeltrace2-2.1.2 | 1 
                  boinc-8.2.11 | 1 
                  cairo-1.18.4 | 1 
                coreutils-9.10 | 1 
                  davfs2-1.7.3 | 1 
docker-credential-acr-env-0... | 1 
                    dpdk-25.11 | 1 
                   duma-2.5.21 | 1 
              e2fsprogs-1.47.4 | 1 
                  ffmpeg-6.1.5 | 1 
                      fio-3.41 | 1 
                     flite-2.2 | 1 
                      gdb-15.2 | 1 
                     gdbm-1.26 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
                  gnupg-1.4.23 | 1 
                   gpsd-3.27.5 | 1 
                     gzip-1.14 | 1 
                host-acl-2.3.2 | 1 
host-am335x-pru-package-5f3... | 1 
            host-autoconf-2.72 | 1 
host-autoconf-archive-2023.... | 1 
          host-automake-1.16.5 | 1 
              host-bison-3.8.2 | 1 
           host-coreutils-9.10 | 1 
       host-gcc-initial-15.2.0 | 1 
                   host-gnutls | 1 
                host-gperf-3.3 | 1 
                host-m4-1.4.21 | 1 
              host-rust-1.95.0 | 1 
          host-xfsprogs-6.19.0 | 1 
               host-zeek-4.1.1 | 1 
            igd2-for-linux-2.2 | 1 
            igh-ethercat-1.6.8 | 1 
                iproute2-7.0.0 | 1 
                  janet-1.41.2 | 1 
            jpeg-turbo-3.1.4.1 | 1 
              json-glib-1.10.8 | 1 
                    lame-3.100 | 1 
                 lcdproc-0.5.9 | 1 
      libabseil-cpp-20260107.1 | 1 
                libdrm-2.4.131 | 1 
                  libenca-1.19 | 1 
                libglvnd-1.7.0 | 1 
         libhdhomerun-20210624 | 1 
                 libiconv-1.19 | 1 
              libopenssl-3.6.2 | 1 
      libphidget-1.24.20260127 | 1 
            libunistring-1.4.2 | 1 
               libupnp-1.14.25 | 1 
           libwebsockets-4.5.8 | 1 
                   linux-7.0.9 | 1 
               llama-cpp-b8117 | 1 
                    make-4.4.1 | 1 
                 mdevd-0.1.6.5 | 1 
                     mtd-2.3.1 | 1 
                     nut-2.8.4 | 1 
                   oatpp-1.3.1 | 1 
odhcp6c-f19dd37fb467c9cf10c... | 1 
          openfpgaloader-1.1.1 | 1 
                openssh-10.3p1 | 1 
                   patch-2.7.6 | 1 
                  pdmenu-1.3.6 | 1 
                     pigpio-79 | 1 
               pistache-0.4.26 | 1 
                    polkit-126 | 1 
             pptp-linux-1.10.0 | 1 
                   ptpd2-2.3.1 | 1 
               pulseaudio-17.0 | 1 
          python-grpcio-1.76.0 | 1 
            python-numpy-2.4.0 | 1 
                 rtl_433-25.02 | 1 
                   s6-2.13.1.0 | 1 
                      skeleton | 1 
               tcpreplay-4.5.2 | 1 
toolchain-external-bootlin-... | 1 
                tpm2-tss-4.1.3 | 1 
uclibc-ng-test-132c6134d691... | 1 
          usb_modeswitch-2.6.2 | 1 
        util-linux-libs-2.41.4 | 1 
               valgrind-3.26.0 | 1 
                 vmtouch-1.3.1 | 1 
            vorbis-tools-1.4.3 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/010d17e99bbb21ec74b981b79652d755d77151be |     
   s390x     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/8a0e4d5393b0db7e8a4f5c9fd01b02ef54725f0b |     
   sparc     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/3d5784090bf2186e27f636d716f91725bf425392 |     
   armeb     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/bb52a7c31e971f031bc10ac2add029d921e8720c |     
loongarch64  |      alsa-utils-1.2.15.2       | NOK | https://autobuild.buildroot.org/results/2d6930233d75c3682b619bfed9cebf572d0bf146 |     
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/3aea949a0e5e29ebc495c6b794f0955f32ce4268 | ORPH
    arc      |            atf-0.23            | NOK | https://autobuild.buildroot.org/results/a3f7e93f6afa6301d33af4539cc4ae69c8fe8a29 |     
   sparc     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/40a72b902d2de305b4167db471eb679db086049e |     
microblazeel | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/465d0e4a114df73952c9239003c7ce16eed9bfa4 |     
   sparc     |       babeltrace2-2.1.2        | NOK | https://autobuild.buildroot.org/results/6be67336f184e13ecbcdb6bea0f0f0b5abb174f6 |     
   mips64    |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/ac5903529e5f388f37ee4739e0942fcbb8974a5c |     
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/b7a8013656d3c1035b363939783eb5151ad9d1a8 |     
   armeb     |         coreutils-9.10         | NOK | https://autobuild.buildroot.org/results/1786115d26db0f0d66d5561ade01c1b7aa186a63 | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c9b941ad2b50d8f74f4d6cb09e40aca7dd639f7b | ORPH
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1292ed3b7d606182db62b63cd8cfc2de10a5c23f | ORPH
   sh4eb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/76c122232b078c77aebf84e0e27ed904f2c715e7 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/624ef38e6608d8803f826fba0856a114f439c1ba | ORPH
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/37d6031939140800db1cbb57ae3235f4395ac233 | ORPH
    or1k     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/a9babc7ea4edf5fed7c2a4daeaa53c5a2d6761c2 | ORPH
   mipsel    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/37d1fb7b7d088fb9087af53ab1b4f49bf9d0c8bc | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/5e15a08c532e6509c3d193cbd6917a1753565fbf | ORPH
 powerpc64   |          davfs2-1.7.3          | NOK | https://autobuild.buildroot.org/results/b3c4e7097aaf8e4fa5032a6aca8b82147b4e4659 | ORPH
   x86_64    | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/31fecf901c265f8510be63092b7ea25ab4aed390 | ORPH
   x86_64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/73e762aa850275aa6b9b11945a77386957d70cd6 |     
   mipsel    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/107384da1c2f89b93ff2339a3bc03d2686e8e986 | ORPH
   mips64    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/291a7f26bb2fa6169df20e18667e0242cbf7a21b | ORPH
powerpc64le  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/09c5a77f407f69ee84b026dab3927e1bb66fb023 | ORPH
    hppa     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/d9cb188ed5f888f3271f44a3339cb9996f8ef0ad | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/e6a1bb89d01af364f62fb1462490674728c99e24 |     
  mips64el   |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/6fe8cc7fbcdada4b2c2ebff3ee28a1eede646d2a |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/3a5097adfff0cbb74a8c72968487f60222c6819d |     
    or1k     | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/d8104d276a39cd87463016deb3f4e5b3afab4084 |     
    m68k     |           flite-2.2            | NOK | https://autobuild.buildroot.org/results/848795d271720efe0460f189bf8e93441e3a7e61 | ORPH
 microblaze  |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/71b885afd1ff5c555d07155ba9165ee224db2ad6 |     
microblazeel |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/5abe0ebc6acccb55de74bd849c8990322a9ce3c6 |     
  mips64el   |            gdb-15.2            | NOK | https://autobuild.buildroot.org/results/2bf067ab51b45c5ce081d2eb3e92542e7361567f | ORPH
    hppa     |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/22b59404fd1461e43255634e4c6b0649b22cdfb6 | ORPH
    arm      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ec7e6c861e82b6f7f0688c5a425ed9a94c62b5dd | ORPH
 microblaze  |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/1b776ecc06bf127773e163e3b9c0c59be5c8f7b8 | ORPH
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/ae661875bfc75fd68b559cd5c2417679396a7b1f |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/938387ef34c2a84c46d021932d4759759b7db4d4 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/55cfc388fded9b852d71e8477e3d9d01edb0d2a7 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/56485480cc48c9f01cf096cd7d2f495918901b6f |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/d8e2526d7b66f83b90e13f5f7b10bcf950488c9d |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/5cd19e5733eb68c142b1f0b668800878f50a0d6f |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/13548a5d5edb10f2909f343267c80a5aceeeac2b |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/072195f713ded908fb8dbbbe83809cb66079c869 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/4343a86c995305699f03941686c55b2c578a5f1f |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/4e78668af19f9b525b4b6df366df774d7c3acb47 |     
    i686     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/d181d7b2bb7b205448df9344a133650a0dc80d4a | ORPH
    or1k     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/44187034da0b755dc2ffcb40cba0f7429a5f9ebd |     
  riscv64    |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/b7e187602e6baa9765a31bd8983c2d82aa096784 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ca8f9e34c39805133a98fce698a95fcb4f199724 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1ae8fdd453a29300bcf7dc39fb0f4d81ebfcf561 | ORPH
    i686     |          gpsd-3.27.5           | NOK | https://autobuild.buildroot.org/results/a7d13a898da58eb99ac18065a199586985994109 |     
    or1k     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/0f00ebb8ad543fb48fa8dde9f90f4223e772b8c1 | ORPH
 aarch64_be  |         host-acl-2.3.2         | NOK | https://autobuild.buildroot.org/results/075e1e60b22a2e705052e6b3193842f28031498c |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/e55a77952c3bce41057f97af3c16dfa178a3d77c |     
  riscv32    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/003a14a7c1526043f37759d11c4cab20e7d44a66 |     
microblazeel |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/dfef021016ec99d10da2623d57c08a2ecc0e7beb |     
   mips64    |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/92506c8184b8988e437dd62e25bae0c25743050e | ORPH
 microblaze  | host-autoconf-archive-2023.... | NOK | https://autobuild.buildroot.org/results/91c807a041a7ee8a0c5354f50de0e8d9b8b4f380 | ORPH
 powerpc64   |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/d9aa7742c0359a2c5bb92928e012ea60c4160b06 | ORPH
    arm      |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/7d901804b423e9924944def32a040266cc928445 |     
   mipsel    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/b7adbe22acb826bab0da9134abc7660cb619230a |     
  powerpc    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/324d5ee973db571b8a9f6cbaafe21ae79fd1b4cf |     
  mips64el   |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/67b680e9aa9fbac15fc8d399ea0ab171ffbd97b4 |     
loongarch64  |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/9be2d5f55b89651aeb62fc545d2fe9d0eee9994d |     
  powerpc    |      host-binutils-2.46.0      | NOK | https://autobuild.buildroot.org/results/519f99f7be5034587e2b377f5a62b6d371d8820a |     
 aarch64_be  |      host-binutils-2.46.0      | NOK | https://autobuild.buildroot.org/results/e467891b6c3060527b207e954fe07cb9a0392392 |     
    mips     |      host-binutils-2.46.0      | NOK | https://autobuild.buildroot.org/results/43d03c414fde8b7fbf4dea4b31b68ae70684bb29 |     
    arc      |      host-binutils-2.46.0      | NOK | https://autobuild.buildroot.org/results/48173185e8281e11ba978335246d8af80c5da9b3 |     
    hppa     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/779a3574448eac54a21f90fd4e537cd3158c4496 |     
   x86_64    | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/d8bc67045166da520cae1230f2383b89255e3e92 |     
   armeb     |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/42d15153499994e312b2fe43662c38f876ae801b | ORPH
 aarch64_be  |      host-coreutils-9.10       | NOK | https://autobuild.buildroot.org/results/26569e239f6dbea5a7ee2c86ce52b04ac981e8a4 | ORPH
    arm      |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/f627f55f360a6a4ae9d008767c23e356d9bc8dab |     
   x86_64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/e85235fcb8ff4fb630be2a83292054bd9c26d4a9 |     
  powerpc    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/3b4221cd3d0758af502b00097b4f663eddc4b893 |     
microblazeel |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/4b54065596d69fa723aaa898e554d51f163684a0 |     
   sparc     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/cc830f19e861f26afd9e11716490af1075d5e568 |     
    mips     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/998c15afbc345be532d30984e4aac2f4b4f77eb7 |     
    hppa     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/ed3ea57ee3a2e5ae4920ae7865d87c62d728822e |     
    arc      |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/0fae604db0e4dafd05136eaf13fb5e0c09ff4fed |     
  aarch64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/77dcabf39e6e42842dc275f0df8d2ab633d8e13a |     
 powerpc64   |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/5357ff998e36b28ce8b2ce0e86a9828dec7a55f4 |     
  mips64el   |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/a36c2dea58183f4bde3732adcc9af14ffc3f40ec |     
    arc      |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/8b2d7b4932d3842767122f4be390a56ef221c860 |     
   x86_64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/1250460bb243ccca8ba69915e64269b559e0cd2a |     
  powerpc    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/f844c7e58bd830a168237a38064736b3420049d1 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/05f1254848be6df4f41674f26d95b779f80f0d9d |     
    or1k     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/0c0fa8daa6ab67de406b5c74354baefc822e5cfa |     
    arc      |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/fccfa74c0a36a21d58063e77c090b57dc1db7df1 |     
 powerpc64   |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/0605f6d8ebd2e62722151b403fcdec3033b3ce0a |     
    mips     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/53c944986655a6125ff5640298454a8d4a9489f5 |     
    sh4      |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/207a2b9953cccde2a1b483f7ad33c25b1c7ef5b2 |     
    arm      |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/b7c8ae5a5685489d06122a6a5eb27f60e37c6283 |     
   mipsel    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/cb23606fa54b46ee658ca8bbdf9fb7e9e65e39b8 |     
   s390x     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/8135394e166fbb3c10335cb4554c33cda4c2ed0a |     
 aarch64_be  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/e8449f48a11156885693c020e1244e596a3589c0 |     
 aarch64_be  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/d69c8ade675c9899d8140d88a52c58a8b8c54cbc |     
  mips64el   |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/c27ed0525089ff4fe1ce03d878dcf94660a99b0d |     
 powerpc64   |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/7054995489bd4cf893ccf72576a478edfd5f8218 |     
   s390x     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/98e93990ef46b34741c537808d7b683296be8a30 |     
   s390x     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/ff8cbd134354c99105b03db66e90d04ce1ff8668 |     
  mips64el   |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/b01865cb27cbd9c37562c0e9fd24a374df3d2ddf |     
    m68k     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/ef2d5d1270d6e627a521402ed04af423995f3b5e |     
   mips64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/ced18ea892fbff0c12d235aaeaaa94a0a8ae3eda |     
 microblaze  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/feb877a4c56da48a92a5cf2c11dcbf6a3bd316dd |     
   mipsel    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/fab41d2944c2bc64960d083c3defa5b1781354cf |     
 powerpc64   |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/bfb37c2da11bad9a6f85256d4d56e950e50b0e8a |     
   sparc     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/488660138bc07af57174e151d070c87d573441b2 |     
    mips     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/7dc15bb266cbaa7ee555022e7a06152b58611c2d |     
  riscv64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/561952bef10951f91239110bad80a1d8a5d247dc |     
  powerpc    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/7bac8d7641574cd3d1c9806f9705dc7a1312dff0 |     
    sh4a     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/111284dea34ae7a4cf74e62e7d5fb0197b4d05dd |     
  sparc64    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/ef49c17f1b09f42fc4a2e922ce5a403003ada7a6 |     
 powerpc64   |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/f1f60d84c0b5307ae496924d5a5c73c286709eab |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/5dc698785a324430c078b2e4643f369840c73eef |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/bcd636beb1bcf3c1db3d4028ca365fb0646f074c |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/1a6b3e558960e31cc55ca970353fcc7b25d47a1a |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/6692430dc905aca81eb546ccc3da463257a47ca2 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/4af0e16ce21339af1c5d41d4393f191b935ae94e |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/62d08e080a5f411142dd25eea63fbabad3e2428c |     
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/cb57601f0e61870fd652ee35f50874cd81eb0f92 | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/3f98ced999c3f636609a7a531348fc442badbeb5 | ORPH
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/24d1e75fecae98e0eb9f7720ca918873b0bfaff9 | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/30ccbcbfe03cd936019af0da8859893e7994b807 | ORPH
   s390x     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/748d424b91276f1acaf28911bd92750db97af3ea | ORPH
    or1k     |          host-gnutls           | TIM | https://autobuild.buildroot.org/results/6c734846aa556cf59c323fe471db66682b307763 |     
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/aca816118d6a54f2f8ef5d273910efbc6cf59d74 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/510255a317744232b8148013c527fd20756cf5cb | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/da8e489b84f0bf021024dbf93aa68660ffe78773 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e24760476854706e17f48acebe07347d54ae3dab | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e0b7b37c0fbec35f4e4287547a811dad918babd1 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f8a3ba6a72fcc67c22322701766896bbe17cf66f | ORPH
   x86_64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/e7a4ca33a2c101351db4e4b0bc4150d0edc58c5d |     
    mips     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/cc42aea15eaa16d136c0382e3a7c2bc572ad7913 |     
 aarch64_be  |         host-gperf-3.3         | NOK | https://autobuild.buildroot.org/results/e2b29b6b2519bf22ee5e22eac6b7066047b50b0f | ORPH
  powerpc    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/2d42dead90a0e324c681c80f5a37c4818047e826 |     
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/18ce9d44ae44398f3460c50070d57fec4dd660fc |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/b35489062a7ec6087f0c2c75ecb45db1ed169232 |     
  sparc64    |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/35c07154021d6f48a57fac7d0d65cdcd484a86ea | ORPH
    arc      |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/12117f8237721a38e692495b0a2eff7f6e8cb7f3 | ORPH
    arm      |         host-m4-1.4.21         | NOK | https://autobuild.buildroot.org/results/d89f96868e40dd37d8833b28f3849da5f9096bb9 | ORPH
   armeb     |        host-make-4.4.1         | NOK | https://autobuild.buildroot.org/results/994e52c0cf9475a3b1e48119565a2b9b7f3a007f | ORPH
loongarch64  |        host-make-4.4.1         | NOK | https://autobuild.buildroot.org/results/a6de43a6f8b84222ca76b0c6915176c4bf0996c7 | ORPH
   x86_64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/8315e9d483844a516bb324acaacde41334845a68 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/3152b573aa848c5dbdaa4ffbc8777a3ae856ba33 |     
    hppa     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/6bb1689347cd3f7ab91228d4b92d1ba691e583f8 | ORPH
loongarch64  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/4bf1109426a0b8678bff3e70c17df255992076ab | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/d02786cc07966881aa6c7efcf59cb5be9d2d43cb | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/28082113c53986d1b79d788ac596060c10f2fda5 | ORPH
   mips64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/6c0912af73423e11e31b08ba21eb26ca973b55f0 | ORPH
microblazeel |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/ad8390309964ac285b758bb4cf82ec1f5f12881b |     
  aarch64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/2770570bec152b44d56fcc0be4a03593032ad7bc |     
loongarch64  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/ef582e36d3e36072fdcc943505afaf75940006d3 |     
   x86_64    |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/02364acf419d8c827c02d8d55bc014b44f832232 |     
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ff6774ebd9d1133653112ec08454887a40f3440d | ORPH
    hppa     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4b9310bbcdddfc6f3fe88403482b5f5bc735cfcf | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2ea0f42591ce2c25e7bfc59dde190f9095584d9c | ORPH
 powerpc64   |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/7365ca39854356f046b0e4277edf1ed6555d384e | ORPH
   s390x     |        host-zeek-4.1.1         | NOK | https://autobuild.buildroot.org/results/cbc6378722c0468e6093f788291de34b6276a3f5 |     
    m68k     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/dab5b661116ce1c9baddecbb12770bae5d245633 |     
    sh4      |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/c13fe7e9bd8783769f7b954e9733435394811f27 |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/0600e4def70250f73a4a2dc87fc258845131637c |     
  sparc64    |       igh-ethercat-1.6.8       | NOK | https://autobuild.buildroot.org/results/59fcf4e62146bc245eda7f496d5a64c50d339f17 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/fe8d01196978cc9cfdc639c9357483b70e69fab6 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/ce90495bc3b1a8b2ac154d0e593901d8e8338270 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/fff80450b4db8bfc38423cd5c761f69f1605f388 |     
   s390x     |         iproute2-7.0.0         | NOK | https://autobuild.buildroot.org/results/a1f3949017ff38b552c449bd3023831c4ed83407 |     
   xtensa    |          janet-1.41.2          | NOK | https://autobuild.buildroot.org/results/ca2f8419415384ef7b556611464093e4869801a7 |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/8f8918f29cfd40d1c90df9a3c79964993533f10d |     
    or1k     |        json-glib-1.10.8        | NOK | https://autobuild.buildroot.org/results/d673facbe187836591ee7c0f6ad874d95fcd8929 | ORPH
  aarch64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/93a8de4a62bb1cef5fa2bbb94eab73cf3af90d2f | ORPH
   xtensa    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/dcfea4cb708d119deb39666343392cd5557fe00e | ORPH
   sparc     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/98de0a747323c7e88303afc6a907aa9747a7d48b | ORPH
  powerpc    |           lame-3.100           | NOK | https://autobuild.buildroot.org/results/5a00c4e6cafd0a32052ff64027bab9e134a1a136 |     
   mipsel    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/084009b43727d384fb2f3bd2f5fe306667ae3f61 | ORPH
loongarch64  |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/5cc98fb79abde92f8ee1907305b30f04c1ee473e | ORPH
loongarch64  |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/7cbc39aff2776743c83d6dd17d20ccb6e7e814bb | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/bf21eb3b2f0902c6919eda99062615af4d85fe7f |     
   xtensa    |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/19c7e9a495ea34940da7636d4bc993880e0bdeac |     
    arc      |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/c6c5ae342d8ab0f1007789d0b3c98a33555386cb |     
    m68k     |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/98c7b3bedc93abf2da88404db0fc7a3ac2356f6e |     
   sh4eb     |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/71741dd5e189b5253c6e3555f2bad41b83e758ef |     
    arc      |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/fe6ebf16c3dbadd348d2fdfa6bf4fbf04931f195 |     
microblazeel | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/c3ca7c2496007396f16525d7121bb1d744479a4f |     
   mips64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/746d42808c79683bec255e923efa4eebfee8ceb5 |     
  mips64el   |         libdrm-2.4.131         | NOK | https://autobuild.buildroot.org/results/e7b42d93d26417407be136c3bf8ea3693a87a961 |     
   s390x     |          libenca-1.19          | NOK | https://autobuild.buildroot.org/results/791d7cd5c33f1aa691fbf47cca5413a276650ddb | ORPH
    m68k     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/b437e4f9e95ee68e6b08848c98d26558b760a76b | ORPH
   mipsel    |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/bbce4e101b36bbc9cac9784f7b8070af099c8a4f |     
  riscv64    |         libiconv-1.19          | NOK | https://autobuild.buildroot.org/results/722643696f044c2244ee248e3e5362cf5f33eeb3 | ORPH
    or1k     |         libidn2-2.3.8          | NOK | https://autobuild.buildroot.org/results/1ac1b2a1836e38fe41610c4137b33fa0fe850e6e |     
   s390x     |         libidn2-2.3.8          | NOK | https://autobuild.buildroot.org/results/3b8fcac60f8ccabc21a97ee2737e9eeffda4e953 |     
powerpc64le  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/5a4122a4507cbf519cb381ea8cb11eb432c960de | ORPH
    mips     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/5c15e6a0b60ad1c1c802d430ec7a0e03a2bee053 | ORPH
  powerpc    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/7db1e8f9edb8640079f4fd5c173f69c9d03e4b90 | ORPH
 microblaze  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/6ec17a189e6ab557537132604d197d32d18b45ba | ORPH
 aarch64_be  |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/e517b791a2e0926a9d9aaf8fcc831462c27edec7 |     
    sh4      |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/309f634c712c3c3ae9472f1a66577efd26321d47 |     
   sparc     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/f118c001843def83943e405bb928492f747db4f8 |     
  riscv32    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/abf001372b7776789552dc02e3d6569dcce49dbf |     
 aarch64_be  |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/5c87c7000d4737ee09c9fb82cb43f000d408d3b0 |     
    or1k     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/a844583e1e4960a054410aef224f44b55e970b4a | ORPH
    mips     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/2fa1d1930de75a4a0acce29c06dd9be57c6791e2 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/a73520f7b87f8524e3d3ced4f39289e57434e3d9 | ORPH
  sparc64    |    libphidget-1.24.20260127    | NOK | https://autobuild.buildroot.org/results/76db8ccf704e35264bfa23be29faa0fc0e3ee118 |     
  powerpc    |        libpthsem-2.0.8         | NOK | https://autobuild.buildroot.org/results/36ae591e931d6dc7285d1a2a6ea4431afdc6bce3 |     
    arc      |        libpthsem-2.0.8         | NOK | https://autobuild.buildroot.org/results/ac4d118c1985abe7625a7423ad889b190698ee12 |     
 aarch64_be  |        libpthsem-2.0.8         | NOK | https://autobuild.buildroot.org/results/d12020663668a159ddfd58970f293487d207083f |     
    mips     |        libpthsem-2.0.8         | NOK | https://autobuild.buildroot.org/results/2a73a1f61493c20c0a6235d1e4fb6cfdf21734ca |     
    or1k     |       libunistring-1.4.2       | NOK | https://autobuild.buildroot.org/results/162e8436e3cfc9969c1516321d982815953834f6 |     
 powerpc64   |        libupnp-1.14.25         | NOK | https://autobuild.buildroot.org/results/d1e5827f2c48866402c0a34f48f6a8860af99472 |     
   xtensa    |      libwebsockets-4.5.8       | NOK | https://autobuild.buildroot.org/results/637e9bbe3e776f9a81ef99ea81cf9b99da3799f2 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/14ae2782472b54580eeb633d660b45d676c41df4 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/603b3c7cde865e2444c9541eb27d7e4c9dfc65d3 | ORPH
  mips64el   |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/87c607d8f8c28a091ddeb3048489ef67f0a1252e | ORPH
 microblaze  |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/6e68b946ed9afaf9c1f3a4e36139300a6c260cef | ORPH
   mipsel    |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/1cba36bf65f6f9020a08704999a5d38d8c5f7470 | ORPH
powerpc64le  |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/27af50e03cc7a2e136e30b15a67e7a24dd4e1a10 | ORPH
    sh4a     |          linux-7.0.9           | NOK | https://autobuild.buildroot.org/results/a9b94b10f09e202c1c14f984063af94b2df0b4dd | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/3fa2efcb0008172a794efb568ed305269840e9b6 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/4c9928b744c09eb0582cbd101c0c476b7db4e339 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/6a80f586978f212b2b4c70f65efb11d2361b1ad4 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/979169f096ab75d71a84c83e83f1a430478aa879 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/da8f5d5d0f7fcd6005f66c076cb6f88be1c390aa | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/a6591da9573630c9553f78fcf56e1595ec2f602b | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/e2bf361f86b83e4e08703ed93ce53cabbcd25632 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/11f86f767aba084f96c79e2b65ef015f3158ac9d | ORPH
  mips64el   |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/27dc5ee51c9d9fff865ed4f4aa96d442c35bf9df | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/a44e4c0489cf188872f38d9d425a8819706c41eb | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/146a270d5b6553066150d935d6346af22d409fe8 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/437ef1f13689384bd33d716aed81fc30e2693ae6 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/30ec499aca261d2baf8ce9fa9a97c7e854534026 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/1ab1289890d60cff82aec2a652d025a16a7644cc | ORPH
  sparc64    |        llama-cpp-b8117         | NOK | https://autobuild.buildroot.org/results/f7fcfff46116cf9d91f8a45199ba7a040ae836bc |     
    arm      |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/5c77232e7dca0405e23b4691b01bb15022c03be9 |     
   s390x     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/b0724f916fc4360f6ec471db166d0f64f1539520 |     
   xtensa    |           make-4.4.1           | NOK | https://autobuild.buildroot.org/results/53045d2e6175f0c607ec0078415c77e72e50b511 | ORPH
  powerpc    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/363bbd2209615bb2d7a6d3111ed7f139fed5fa8e |     
  powerpc    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/d0a171762806b40fa35a9f80d0961ee2017729f0 |     
   armeb     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/e373d99f3dc24ca67e2dad44318a4cbed0ca4f52 |     
    i686     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/2ed29bf1cd3d5b3f99f116f3635fb134de0fed7b |     
 microblaze  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/7ede1151944c93592c28004abd9d1708f17648a7 |     
 aarch64_be  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/19b70be467160ff729a4f445b33d61aac7223651 |     
    i686     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/97482bf3d0ff1939b62182c1b66c8b04383aa3f5 |     
 microblaze  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/8ad8b3d02b90c931f87bb2c325fc5d84127f2fad |     
  sparc64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/683e25ba4512f864ecb88944f9e9cda4394cf23a |     
   armeb     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/60bfa5d6408e589a7f6e434980a755fb9b3f9d57 |     
    i686     |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/82aa6f7f6839466c4f538d2df6fa225c6955f70e |     
powerpc64le  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c1c20b4306f81df6ccafeb087d32777a23ea978b |     
    sh4      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/09721c868d091dcd88b0f5cc8fb84158d6475833 |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/47cf24a83f8c36797123a7eb1db5876a2df1ba1a |     
   sparc     |           nut-2.8.4            | NOK | https://autobuild.buildroot.org/results/c887d1246c4ae3f9ced5cdb1a9dca892aaa882a8 |     
microblazeel |          oatpp-1.3.1           | NOK | https://autobuild.buildroot.org/results/edac31d38958580c4f99e0d1e97b54852c684656 |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/005908d3476531bc1a40be409bb1278b77d77669 |     
microblazeel |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/b46e31c757f79b064abdfb2858cca8b3066c8b30 | ORPH
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/89f6bdf5335ba3acee2f86e062f229fff120cbae | ORPH
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/2af98d1f3ece67e04f33ee5953f5f18298768745 | ORPH
microblazeel |      openfpgaloader-1.1.1      | NOK | https://autobuild.buildroot.org/results/c70ce5434a8c38c8414ebd55c758d19254e622d7 |     
  aarch64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/83cb39dd0d6e1afc2841b6199a63d3d45f20d4de | ORPH
powerpc64le  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/85e8d0dd8d3d7edfd61a50d1915197b042f84087 | ORPH
  riscv64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/06334097fc657cce81706c3f26b17e8df3aaab99 | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/a7a7fe6d4cf201cc4b89480483ee275fad5dd866 | ORPH
    i686     |          patch-2.7.6           | NOK | https://autobuild.buildroot.org/results/4bc3b3fbf685fbd858b506bc0afc1e36521ad089 | ORPH
powerpc64le  |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/61de0326185647eea1f97aeb0fe1731c49f3b462 |     
    or1k     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/a21cc7be3dbc18c87714ffdb645c58bd53b0ca42 |     
loongarch64  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/f261b4519cff9af49fcf4e79b3641b5f9369984c |     
   sparc     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/58586b41078c9dff51e80e7b3cebd50517334bf9 |     
   mips64    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/e65e781e8e73376ca67fc731c63cf63b2d32bf0d |     
   mipsel    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/8266d6f2121a4cf5419359b6ce2941576446c098 |     
  aarch64    |           pigpio-79            | NOK | https://autobuild.buildroot.org/results/09e2213727205674284204ce0604d34b10a5a543 |     
   sparc     |        pistache-0.4.26         | NOK | https://autobuild.buildroot.org/results/5e70e43e2b2bb6363a6fa31f98f77a5bc57f78a0 | ORPH
loongarch64  |           polkit-126           | NOK | https://autobuild.buildroot.org/results/bb8d222e5212426599107d3f774ac782a87933e9 |     
    sh4a     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/ce8b00f8e11b0eef4ba6cb30183f40eecbc874f7 | ORPH
    or1k     |          ptpd2-2.3.1           | NOK | https://autobuild.buildroot.org/results/f4057fd05d5324058f9048760f02ce485c1345ed | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/4537fae515180ace3f7ee5b554b6e676dce4e6e9 | ORPH
   mips64    |      python-grpcio-1.76.0      | NOK | https://autobuild.buildroot.org/results/4e337e1d5726e86e0f7a8df809b8ea9962dc83cf |     
 aarch64_be  |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/b033bc570223c3c2762f846cb3956bc2844bd8bd |     
 powerpc64   |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/f13c152de749a2c9932c8fd0439ba1040bfbef13 | ORPH
   sparc     |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/add1a35e65d9ddd1a56c07927a36420f0aa34f90 | ORPH
  sparc64    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/6d8f40d9c5bfab67a326b42d770235f1c6d78ef5 |     
   sparc     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/4573fb6f501a34086dc821797c4d754a3bfbbc99 |     
    arm      |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/6a02ee7a09d0533137e4d1963e783107778c1f26 | ORPH
    sh4a     |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/f1a83cce6216135a96611cc4e4eaa5766ebd730c | ORPH
    arc      |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/6be5a9e3f8c46142e10d7fc06c6f9b7cf5620b5e | ORPH
    arc      |            skeleton            | NOK | https://autobuild.buildroot.org/results/5a4a054e43faca231e5380fa11ed2d36e64930f4 |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/79b5032f3721e44e3ecb7abf14d4cef18bc3c3c1 |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/1e1e78b4b40049d7dc06c4b1f6cc63ab8b4ba7bd |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/d42e1d6d19fcf7eec335fab282d2c2a0b7138e7a |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/71cbcf5e8d16f3e93d6ae082e6f1bcdf63c7ada6 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/63c97f3754081928ebc7dcfaf8281074b54f01f6 |     
    m68k     |        tcpreplay-4.5.2         | NOK | https://autobuild.buildroot.org/results/c9b9c9652d65c47bff57aed5f749e7e19d079f28 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/a35cc82e61fadf41ee5896d416c16fe3ab924775 | ORPH
    mips     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/a198718cffa6bc606308e43bcb97f39eba3eb1e2 | ORPH
    m68k     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/abfff17294fa5b99b6ccc3419d1079598c23ec5d |     
  sparc64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/3e6a6dee7423e4257161fa5545445506266c1dc2 | ORPH
    or1k     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/13cb326e9a24f3f8748cdc7c8ecfdf316bbabf06 | ORPH
    sh4      | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/f19ea7b743f6f4ff02f5c167fb110f6417d2e4bd | ORPH
loongarch64  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/976158c6efee12643443d4fc52456175b24d5ab3 | ORPH
  sparc64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/3da595fa0cb21f13a5bacef40891fa21c36732d5 | ORPH
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/b410749d8ce33330dbcfe1e9e4896ec3cf12f548 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/66630749e81f72d5c4b441fd23828577e38aacce |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/d3f96c52d2805bdbe7b7af5a4c6dbf4d2462b032 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8e28ffd81b76bcdf9ef7952b49d895cecb3ede10 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/1d88d2da666f7356ced82f47546a2c7b24aed18a |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/75b3c04e82ffe08466d8282eb3a731298ecf12af |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/592948c3eb52ad9828e53c3c749ab8b170a859e7 |     
 microblaze  |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/4d517d9cfac39b164bb4498f22cd1adcb9278381 | ORPH
   mips64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/39786da0908f7fcc7ce4be209b1a4e1c257c3f36 | ORPH
   sh4eb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/830ca7f325365e69fefbe33eae04f3cd980c6186 | ORPH
 powerpc64   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/01595749f76f770df76b83da3ccc95d95c447c27 | ORPH
   armeb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/35d7c1cea6a5153852fdd0d08e726ae5531b7930 | ORPH
  aarch64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/1d239fda5a0796e5a134c65bf35894117403d4d8 | ORPH
    mips     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/b1fde4ab63e0e7b077115b83a24712a8c55c06a5 |     
    arm      |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/458f24cfc924d5ecdeb4c46e4a6b6b9eaae88515 |     
    m68k     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/7b3f34bc220348870e4b934b4b1cb33dafaa4448 |     
    or1k     |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/c989d719a8e86903623c7e037c8cc474b6abc8c4 |     
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/8d2abe5fd911337a4708b99083d1044a2899c368 | ORPH
    hppa     |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/cf875feb0ec21c223b710fcbebf896adc8b0bc93 |     
   xtensa    |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/df4857e7341e486300069c71ddb6f96411a346ee | ORPH
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/b852b9e510a520fdf3df794068a118afdfdb9789 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                   perl-5.42.2 | 4 
                       unknown | 3 
host-gobject-introspection-... | 2 
               linux-pam-1.7.2 | 2 
                 wolfssl-5.9.1 | 2 
                   exim-4.99.2 | 1 
               freetype-2.14.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
               host-attr-2.5.2 | 1 
    host-gcc-bare-metal-15.2.0 | 1 
           host-libtpms-0.10.2 | 1 
                host-odb-2.4.0 | 1 
              host-pahole-1.28 | 1 
               iproute2-6.17.0 | 1 
                 libmbus-0.9.0 | 1 
                 libzlib-1.3.2 | 1 
                 rtl_433-25.02 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          exim-4.99.2           | NOK | https://autobuild.buildroot.org/results/6231bb22f7a3ffd74827274702110f97e2a597ae |     
  riscv64    |        freetype-2.14.3         | NOK | https://autobuild.buildroot.org/results/c8dc8c504674f402d5cde755cd8ce2117050efed |     
loongarch64  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/9a18808d17f1d5af9c248be63161e4b231e30025 | ORPH
  powerpc    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/3a12562b2f8fb416b8fcfced13948eec2733f8d8 |     
  mips64el   |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/a7ef20ca77f2324de90ea9e739d288e95ae7d0e4 |     
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c2fa1700c8d56d46d913f58222e300bcf555f23a | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ea3db077c5e0d7bdcc164c4c110828b1f8134889 | ORPH
loongarch64  |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/77940b463308fc37bf1efacf26bb7429bfe2fead |     
   mipsel    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/57588e46e442a35d8b5db789ca1f5c5d4c54418d | ORPH
    sh4      |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/78ea44284424809bd1fe31bd3adc936b2a64abde |     
   armeb     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/0cfa4e78374139845068ad25e0440202a3752d75 |     
  powerpc    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/ef58e1724b4ca4b3dedc9d0fe2ed590ea7553b10 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/63cd502b7c4615230d6a7fca4d2542c126c19ab3 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/3a47e2f044f9302daa330a64d7c10c7480f5d9f6 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/cfec2e820349a90c1ad241e812df4d15d4d7da7c | ORPH
    mips     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7aa8ca61cf0fe379ddc1c0673bca195678c04eb0 |     
   sparc     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/412fcf95d05f2ede917ab1b9d2a4ca8b2ead6aa8 |     
   sparc     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/8bd14ffbdbbdaa554f3b13f1777f239eb2925c06 |     
    mips     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7fe849c7c0e692690993437444fd69681be0a142 |     
  sparc64    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/5a222bb9fb94a95f41aea915267a5134d6b5dc33 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/5e114357d9bf69ef12eed71c61d501af22d20519 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/97aca068002c142eb15a33a7afba1f4ba896022f |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/838694c9f2931dc87f3531f72d8a21422afcad44 |     
  mips64el   |         wolfssl-5.9.1          | NOK | https://autobuild.buildroot.org/results/b92dba97167f4dfe989677c576fae1f022191452 |     
    mips     |         wolfssl-5.9.1          | NOK | https://autobuild.buildroot.org/results/cbcd80bd110bc50b09a72c3152227894614a52cc |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 7 
                 libmbus-0.9.0 | 4 
                       unknown | 4 
host-gobject-introspection-... | 3 
                 libzlib-1.3.2 | 3 
                 host-gdb-16.3 | 2 
host-vboot-utils-4b12d392e5... | 2 
                   perl-5.40.4 | 2 
                  boinc-7.20.2 | 1 
                 ddrescue-1.28 | 1 
        edk2-edk2-stable202411 | 1 
                   flann-1.9.2 | 1 
             fluent-bit-3.2.10 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 gerbera-2.4.1 | 1 
            host-binutils-2.44 | 1 
              host-guile-3.0.9 | 1 
host-heimdal-f4faaeaba371ff... | 1 
           host-libtpms-0.10.2 | 1 
host-netsurf-buildsystem-75... | 1 
                host-odb-2.4.0 | 1 
              host-rust-1.82.0 | 1 
                  iozone-3.508 | 1 
      libabseil-cpp-20250127.0 | 1 
                 libgee-0.20.6 | 1 
           libmicrohttpd-1.0.5 | 1 
              libmodbus-3.1.11 | 1 
                libsoup3-3.6.6 | 1 
           oath-toolkit-2.6.12 | 1 
               openblas-0.3.30 | 1 
                 openmpi-4.1.5 | 1 
                 openssh-9.9p2 | 1 
               pcsc-lite-2.1.0 | 1 
                  pdmenu-1.3.6 | 1 
                    polkit-125 | 1 
             pptp-linux-1.10.0 | 1 
               procps-ng-4.0.5 | 1 
           python-numpy-1.25.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
              udpcast-20230924 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/b6d35ffb68039df7563d661894b52d614fb1b2a8 |     
 aarch64_be  |         ddrescue-1.28          | NOK | https://autobuild.buildroot.org/results/66d258b4575433f3003fd529a502f5a5c971430c | ORPH
   x86_64    |     edk2-edk2-stable202411     | NOK | https://autobuild.buildroot.org/results/85442a5023b204e03cbaad8992cfebeb07c9fe56 |     
    or1k     |          flann-1.9.2           | NOK | https://autobuild.buildroot.org/results/1e8dca73cd86de359a2bcd653f4bd131eae253fa |     
 microblaze  |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/4905e5c3dd847b57e5d7c178950d367360ff3113 |     
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/bb83a244a01384142a261662515ad067ca1ac695 | ORPH
   s390x     |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/f470dd22186d7f47a36528af50e89485f88cd31d |     
   x86_64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/88782951575cf9263acc83a7f6c186f0764c6105 |     
   mips64    |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/2dc7bd7bff75ad8963f3ed1da447e1ca5cdc0454 | ORPH
   mipsel    |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/b65cd4b51490650ec40b897991695d7c28dd4e54 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f7bc9d59846d86d1051efe6afdece0a62e1205e1 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5c73f96ac3c0a9132032bb53aa2f2c287adeec9b | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/43f3837ee638a286f3be0e4a2aecce8d3b08c8e0 | ORPH
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/9e571a1cf63d817dd893aa832a978d30230d807f |     
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/eba22afede0adaee02da22f2acb67edb89af6ceb | ORPH
   x86_64    |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/36e87c985ca298e0e7fb353ea480297350f11f24 |     
   mipsel    | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/52fe2b4dcd0fb9f05231e008bb8e2585557a299c | ORPH
    mips     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/b5faed84d9fb347a2099892a9e23eef374c74277 | ORPH
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/89b646e26732ac810327db439f850fb6a1785dea |     
    m68k     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/f7375c3a56a676bf75963faca5c9fd7dfa9876a0 |     
powerpc64le  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/08c87df976a9fedb4f9dcf25104221394d67fb47 |     
   x86_64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/62d95c06551e65bdd8f7a50d10485103cf0711c9 |     
  riscv32    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/4f5f734daabc7c04d7cace15d904e53fbc146c87 |     
  riscv32    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/5e06f0bf9748b9d9f674d4f48bedccc07ce4fe9c |     
  powerpc    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/12e8726a9c74b7f046784a7bfc7a3ffea65156a6 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/7822c986227eac79b274f3a188d1cf69ac6c5099 |     
  mips64el   | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/f0ed5a8d5756ae2204440a9bf43c1da8d8266286 |     
  riscv64    | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/aec16991ae6381ba225553fda138b822f252a634 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/2003516a7e9f0bdd668382165415c163fb09b71f |     
  mips64el   |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/5812b64e2baf436ea1c36cc155556defead4383c |     
powerpc64le  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/c4084248bdd90de4b392b9c6cdd4c422a32302e5 |     
  riscv32    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/0685f09fa74c13dd58bbfb825bcc088650183631 | ORPH
powerpc64le  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/218bcf69a8d95d77b5d596c70d074b94af2e29b6 | ORPH
 microblaze  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/4f571e16ba7b26e7389715f8bb716e256064d004 | ORPH
   xtensa    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/08ece8d0a37f97ab0b0576d733f1ed18373a36b9 | ORPH
   mipsel    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/84d0327d996db743305641ac0519da6519f060d4 |     
  aarch64    |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/22b2529997e5ca98852caa59898edacbcbce2f00 |     
    i586     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/2c6b0197cc16d82615716453a2f18dd6d18f8db3 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/67cc6ae0e2a1f65a89509ef2e8098a6019894b49 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/cb6138efe631109952aa8c34c3219f27de067a20 | ORPH
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/8a1c6db111eae6b2615a44fc089d10362ace63e5 | ORPH
    arm      |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/bdc3b3dd187dc9d6207848be048ffde3bb99a920 |     
  mips64el   |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/d2071e2ca7c927a66ea54da38e58bd1a10d0ae35 |     
    or1k     |         openmpi-4.1.5          | NOK | https://autobuild.buildroot.org/results/ac6cab9e8acd690619b229f90f3c4cb6eb88a168 |     
  powerpc    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/b16bd85803eca3c27125ff9e1a5966087f5ac4e2 | ORPH
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/9cdbe12084263587bcd23b4566d916017a5e1beb | ORPH
microblazeel |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/fa9e3b6c1b9630fc11e1480b806d43e137222141 |     
 microblaze  |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/f39f1710d0c9558b111f264bc69cdbab382e94be |     
   sparc     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/a61763c043e094c572ecfd6b6b28a4b71a2af4fa |     
powerpc64le  |           polkit-125           | NOK | https://autobuild.buildroot.org/results/e39f766efdd4de5e1caef4f2d553439d853da366 |     
   sparc     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/4d3113c844f27ea0e9131b5e0f1a755a63506057 | ORPH
   sparc     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/7b26281446315e29673d5e843149854f38cd305d | ORPH
    i686     |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/7042768a25714066cc4c0d28e1e029f6eea81b88 |     
microblazeel |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/78b9f5f55c0b415884c608fcad9a8ba2671d5f3f |     
  aarch64    |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/a9efd06efd22fad9cc670e49317b22cff2cd0e33 | ORPH
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/b980ed0f72ada2be209a5ebde1578d80c1e96194 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/1468befc651e96412a3e06c489f5b53cd947f4a6 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/fbf581e26073e6ff45b909b7b082b9c9296aa824 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/934f914fae1362e507cf683c428dca6f62b437f2 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
