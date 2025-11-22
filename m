Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE4ACFC504
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 04:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F18A142C53;
	Sat, 22 Nov 2025 04:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeoaVE7aUm9m; Sat, 22 Nov 2025 04:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C212D42C59
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C212D42C59;
	Sat, 22 Nov 2025 04:22:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7A52158
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 04:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9FB842C59
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 04:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a87Baf7-LK8q for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 04:21:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CEF5742C53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEF5742C53
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CEF5742C53
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 04:21:57 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so19387905e9.2
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 20:21:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763785316; x=1764390116;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PgNFZcSoRDw7/BhilAqBuuwDnaudsZ+p8mTZ1QM9jDc=;
 b=N17rCsu7lhQmeZBbsBICwxLxBxg4vQISkOgyRRFhDyEJkEmWEfuIFxXvaLGmshwzX2
 DItpcM6BTXtLTZTo+8+6VTIgUQDaacDpUH9O2yyXGqozl8DL57W4y6muOcq0KbOHxVrq
 MTFm4Z3OgGuQ2I4HZkxgn0yYblufa8LwINxXVdr3yjjLd8cT9KsN5ibjPP4Ut4xRk7f3
 uAj8aPLx0pLyAuelr2s8ZN6cCIkow5dmconRnTK4USsKvRIxB7AfDBwo+6XsZOD7+szD
 cZ8JoCfoVxIfcZ6/8DTCdXCES4Z+0Z+hdOzq5RzdgGWg9OxRHynP3w8q5OANjRcrMQZ+
 iBJw==
X-Gm-Message-State: AOJu0Yxav6jGWHBCDXbigYN3nQ/2vhN3y2M6YS2uhNF2Z3MSIGw0WSN8
 CGSV8MjAkbEBdihYOD1oaOYCcBTXK7on5JEZ6+nXt7iwaBu/YpOqumujoml9Ig==
X-Gm-Gg: ASbGncu6lsumjS+b9yJlMsxF+o/Z0dMSxmwFpz8oFIfQ6qQ7DnQaK2h4Ow8PMXn5DYv
 Vk3Lr7lAC6v8NemNqJaxj7NPYWFzDVkkIF/R15Z4eFo7DfcWztntTUJ8TkDcAdTQq1lhtAXEI2O
 GczJ3fepAodUR4Qhz47Nni+y1Mas12G/pL+eWWfdFG1XJ6LxQqta6x+5bP0v93j+bmEEX1cbfwE
 KjC7ZFViwu8FjceVJyxCSl+LE4mbXJK72pyQRWjWrltyzKskbYEthopMW9vTU0vK7/fmSolBgTN
 amB65kzhqxGz049Tsb3WF31OeF5GRX//sI8yqXpHwWFrheMWhzTmfxdLyuoWsC2zuYM3b12Cuno
 A6qo1WuGl8Iv6tiK35Ylm3ywUc51nGQYit/c7WiIjb8SMBscHTMJVduJxQ1YvDMs+3bLycOQKNG
 1e/D0b3m4DK8ECCSZgh6v6zMEfRIJz
X-Google-Smtp-Source: AGHT+IHHzvYTWOFPdKPV17NCzOL/jX6TXYWr3sfwX6tEPX7Y8KQwUiyH+mP5U0AWWr8Pv2aA/UVplQ==
X-Received: by 2002:a05:600c:1994:b0:477:a9e:859a with SMTP id
 5b1f17b1804b1-477c01c0073mr40765545e9.22.1763785315252; 
 Fri, 21 Nov 2025 20:21:55 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a9723a6esm103029835e9.1.2025.11.21.20.21.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 20:21:55 -0800 (PST)
Message-ID: <69213a63.050a0220.138abd.7673@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 22 Nov 2025 04:21:54 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763785316; x=1764390116; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=PgNFZcSoRDw7/BhilAqBuuwDnaudsZ+p8mTZ1QM9jDc=;
 b=PpvOI+NTzA0HD0feY4qSC+45RHTjP2x+xoHxOms4RvnOqG6yw/DvRnmZmYiQwIf6wR
 Si0sbizhU+gQNrOFtd4smkyWdjjJaD7G5bgUeWph+NvN5Xlgd7LPzWH7kSuINt2WFXU5
 5Ult31KSBRDhwE9PsLZgOqkZgTirNVSBF6rPY/fMT0tsW4AhIqwU9XOSS2JZBGjLK9Cr
 B9FZVNs7MeqYVqPtMkTo6uOB+38d3UkBH86dn1SyJ+XbzVeJrydZTCiN4kcl9aZ4Nxbm
 SCHypyEUf0aq0sAL9iy4BnsoFkGa9WLYlzX0OS8r2e0fuzt8NIDIj9XXaJ2OYEJOKFZ6
 ndfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PpvOI+NT
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-21
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

Autobuild statistics for 2025-11-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 26  | 37  |  0  | 63  |
  2025.05.x  | 10  | 18  |  0  | 28  |
  2025.08.x  |  6  | 22  |  0  | 28  |
    master   | 67  | 183 |  0  | 250 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 8 
         host-e2fsprogs-1.47.3 | 6 
                     kbd-2.9.0 | 6 
             18xx-ti-utils-8.8 | 4 
                 dc3dd-7.2.641 | 4 
              e2fsprogs-1.47.3 | 4 
                   libcap-2.77 | 4 
                  linux-6.17.8 | 4 
                    mpir-3.0.0 | 4 
                netdata-1.37.1 | 4 
          sane-airscan-0.99.33 | 4 
             util-linux-2.41.1 | 4 
               asterisk-22.5.2 | 3 
             dahdi-linux-3.3.0 | 3 
           dmraid-1.0.0.rc16-3 | 3 
glibc-2.42-3-gbc13db7393773... | 3 
            host-binutils-2.44 | 3 
 host-softether-4.30-9700-beta | 3 
     libphidget-2.1.9.20190409 | 3 
          aardvark-dns-v1.17.0 | 2 
                     bc-1.08.2 | 2 
                   cvs-1.12.13 | 2 
                     ed-1.22.1 | 2 
                enscript-1.6.6 | 2 
                    ficl-4.1.0 | 2 
  gobject-introspection-1.84.0 | 2 
                     grep-3.12 | 2 
                host-acl-2.3.2 | 2 
            host-autoconf-2.72 | 2 
       host-gcc-initial-15.2.0 | 2 
       host-gettext-gnu-0.22.4 | 2 
       host-gettext-tiny-0.3.2 | 2 
              host-rust-1.88.0 | 2 
                 libmbus-0.8.0 | 2 
                  libsepol-3.9 | 2 
     linux-5.10.162-cip24-rt10 | 2 
open-plc-utils-1ba7d5a042e4... | 2 
                   perl-5.40.2 | 2 
          pkcs11-helper-1.30.0 | 2 
               pulseaudio-17.0 | 2 
amazon-ecr-credential-helpe... | 1 
             berkeleydb-5.3.28 | 1 
                   botan-3.5.0 | 1 
                    brltty-6.8 | 1 
                  brotli-1.2.0 | 1 
                 c-icap-0.5.10 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                     crun-1.24 | 1 
                   dante-1.4.4 | 1 
             drbd-utils-9.21.4 | 1 
              erlang-26.2.5.15 | 1 
                    fcft-3.3.2 | 1 
              fftw-quad-3.3.10 | 1 
                      fio-3.41 | 1 
freerdp-2.11.7-18-g0ee17e2f... | 1 
               freetype-2.14.1 | 1 
                    frr-10.4.1 | 1 
                     gdbm-1.26 | 1 
           ghostscript-10.06.0 | 1 
                   guile-3.0.9 | 1 
host-autoconf-archive-2023.... | 1 
            host-binutils-2.42 | 1 
          host-binutils-2.43.1 | 1 
                 host-gdb-15.2 | 1 
            host-libtool-2.4.6 | 1 
                host-lzip-1.25 | 1 
    host-mender-artifact-4.2.0 | 1 
               iptables-1.8.11 | 1 
              irqbalance-1.9.4 | 1 
                  janet-1.39.1 | 1 
               libconfig-1.8.1 | 1 
                libdnet-1.18.0 | 1 
           libfreeimage-3.18.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                 libiconv-1.18 | 1 
                 libidn2-2.3.8 | 1 
                  libite-2.6.1 | 1 
              libmhash-0.9.9.9 | 1 
              libopenssl-3.6.0 | 1 
                 libssh-0.11.3 | 1 
                  libsvg-0.1.4 | 1 
               libunwind-1.8.1 | 1 
          linux-5.10.162-cip24 | 1 
                  mupdf-1.23.9 | 1 
                 netsnmp-5.9.4 | 1 
                openocd-0.12.0 | 1 
                openssh-10.2p1 | 1 
               pcsc-lite-2.1.0 | 1 
              php-xdebug-3.3.1 | 1 
                      poke-3.0 | 1 
          python-grpcio-1.70.0 | 1 
                   qemu-10.1.0 | 1 
                    sdl-1.2.15 | 1 
      softether-4.30-9700-beta | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
             strongswan-5.9.14 | 1 
                 sudo-1.9.17p1 | 1 
               trousers-0.3.15 | 1 
                          udev | 1 
                     unzip-6.0 | 1 
vexpress-firmware-901f81977... | 1 
x264-baee400fa9ced6f5481a72... | 1 
                     xvkbd-4.1 | 1 
                 zlib-ng-2.2.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/7c30ffdb3d4c5a2eef646166f82b88da2ceadfb2 |     
powerpc64le  |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/dfdf75da4981bb87144f7378be19b0fe22f46cd5 |     
loongarch64  |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/8b9b15e578ee13c47bdfe77f8bd79cd34c49de91 |     
 powerpc64   |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/7c44c4b601fd9096b7830e0621d8225a44d53a15 |     
  aarch64    |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/6bc4c6f60fd0ba59c6ebca553dbf8b2a229b9954 | ORPH
 powerpc64   |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/ecfe7a3e7cae4a87684aab2f253c5ab694346fe1 | ORPH
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/ab47e6cbd209bf00eb3e3341d1e9bb7e8dc224c0 | ORPH
 aarch64_be  |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/1c5460914b4fc2909bd225e7afe50045095fbbec |     
    or1k     |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/af9c127965260044095f1fa98db88e1d1d762646 |     
   x86_64    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/3e9a2086c8fa41106d785a9fa346b407cb8b4330 |     
    mips     |           bc-1.08.2            | NOK | https://autobuild.buildroot.org/results/7f6950b597455db5db1fcbd7790109976313e599 |     
    arm      |           bc-1.08.2            | NOK | https://autobuild.buildroot.org/results/624229603d9e5b2dead49e8f37d77f1ecff02828 |     
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/28388ccb35071735af69cb5ca272843ff10e99e4 | ORPH
   sparc     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/b363a9fb9c6ebd38328a22e5fc1118c4337ba0c2 | ORPH
microblazeel |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/1f8df17d18216254a6d993613befbd5c8c3d578e |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/054eb54ebd45732727e86502401f5becc2e68f97 |     
 microblaze  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/7acb5acd805a1fe152ca414be7c9d9df25bcd807 | ORPH
   x86_64    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/a0879c8130af929cea4dfe3b937767b38bace4d5 | ORPH
   arceb     |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/8f2006b2e5645ea5d598f29aae1db2878fafd3c0 |     
    sh4      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6a29a6b1d57a3f5ff5395488470653e80645692e | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2edc77531180dcc3111e3b7ea42b60e094832178 | ORPH
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/600d3315ef00bf3f99a389278c4e3887ad6909e5 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/793f6ed330e94fa19d1044265861325d6bc6434a | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ee860924546376662f5adf90f978162837d9de9a | ORPH
   mipsel    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/6a46ded1c55156aa8b711107be3619ab8435c5fc | ORPH
 powerpc64   |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/503ea7289759e7252c83720fd83a3a5a5c801eba | ORPH
 microblaze  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/2fcf589a29d902ee2fc6d0a78cd46f351d229b09 | ORPH
  sparc64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/d015b8f674ede5c1da8d7182c0783c5e54ccb1a9 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/c6ade7b7cb1b83bf18ed8748d5ae77c8c9b32ed5 | ORPH
 powerpc64   |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/a8c1c51680ca8693ae7b903918ba6a6190468b65 | ORPH
  powerpc    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/c36e805e830aa36bb7a41ed6b53a83512f827f67 | ORPH
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/3e4069b253a1b1dc1008691f0d919c0ddfc5ee9c | ORPH
   mipsel    |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/3fdb3d6501f7e8735b1a31f0d8eae8fd88fe2a3b |     
    i686     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/0badc0fee283b619bb5a97ac98daf93c801bb823 | ORPH
 aarch64_be  |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/3ba915f1682fd4046da8abde01b0065c82cd071e | ORPH
   arceb     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/454d97ab73d28ac64825d0ff5e68f12347fc00c5 | ORPH
   armeb     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/e5870a1b263360950f16cbc83707ed53f01a1fba | ORPH
   mips64    |           ed-1.22.1            | NOK | https://autobuild.buildroot.org/results/38292ae5ec01a8769b75c3b1fdaf1be45a7a0df7 | ORPH
   s390x     |           ed-1.22.1            | NOK | https://autobuild.buildroot.org/results/33015c510c05a6c5f2cc24031b3df153446daee5 | ORPH
    sh4      |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/18fff40e7b5efa86cfc867c643353cab0b7a63a7 | ORPH
microblazeel |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/1966090a1448107c897e75fa71670a423fe8aff9 | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/2631e721438cc9f4b7388dd7ad21287512a8f19b |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/5529d858afd6501cf6c1899e9480d86c7bd0c4d5 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/18d0f11c09b2cf728c7d586ae48df465c55d55c9 | ORPH
  aarch64    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/d94e53e0013a2b3b201232a1bde5767cc471c184 |     
  mips64el   |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/125fa1c0a3b37b4d09389a49640b90121838c665 |     
   xtensa    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/7a9932db282d4ce327573a2f156ef0236ce039a3 |     
 powerpc64   | freerdp-2.11.7-18-g0ee17e2f... | NOK | https://autobuild.buildroot.org/results/c0d6c9b88c980223b264d3c2f24268697dcdd89a | ORPH
    i686     |        freetype-2.14.1         | NOK | https://autobuild.buildroot.org/results/2ffcbeea55dae292c6fc29635868c5ccd1600786 |     
   xtensa    |           frr-10.4.1           | NOK | https://autobuild.buildroot.org/results/0991aaa4768922ec20176ce40f67514b4ef14d2c |     
 aarch64_be  |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/2a2fa8bdbeefbcb153ae5a24c72afa3f7538bd3c | ORPH
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/ecd9357a7aa3573744d10724b21edf5ca7e6ec0a |     
   mipsel    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/60670adf1b5d05ad7b39b5976cd858d6c87f2cdc |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/8bca47c7d91b14bc834c828c69736be999b43fab |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/4cb727faa1952887163ec5ec2fbcd3d6fa2fbabd |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/135a36b05b41be95daf35b3bbbf981404d763545 | ORPH
   armeb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3ce68c9a2825a9d0a90a6cec3d14a82b6daf505b | ORPH
    m68k     |           grep-3.12            | NOK | https://autobuild.buildroot.org/results/3adbab40abdb82bd0d695a9a1fd788832788fe00 |     
    i686     |           grep-3.12            | NOK | https://autobuild.buildroot.org/results/018ecbec776731d3d4b269026a911e33fd8e2926 |     
powerpc64le  |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/01dc3ea0cca8ee3c450ece7539af025247c6068d |     
    arm      |         host-acl-2.3.2         | NOK | https://autobuild.buildroot.org/results/09f3996316def2f92409582f0d1770a5a2895b33 |     
 powerpc64   |         host-acl-2.3.2         | NOK | https://autobuild.buildroot.org/results/dbf733342c09c08178e12da4d7a97805d769ae77 |     
 microblaze  |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/6e92915b8078f08e1501d56e56fb95bce11ffe21 | ORPH
   mips64    |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/6c2831cab54bf3db8effa062e34c22e907be735b | ORPH
loongarch64  | host-autoconf-archive-2023.... | NOK | https://autobuild.buildroot.org/results/73b3b311765bd03ac1019007b83402d357ccc582 | ORPH
  sparc64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/594e31eedbae4eedd4759b22dc47d99485405a1d |     
    m68k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6a8db23aff561ad3490f8662d79964485f2e8bfa |     
    i586     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/fb693aabd3fac41b96db78dcd4bcd4e3317ca41b |     
   s390x     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/e02aa86e45daa4c1a9185307394a617b0ff84c7b |     
  powerpc    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/16cf113a3ae580ea9a0d85e43b85033d8286cd66 |     
 powerpc64   |     host-e2fsprogs-1.47.3      | NOK | https://autobuild.buildroot.org/results/3bb29c6970242985eb187afad7105ad2c50214d1 | ORPH
   sh4eb     |     host-e2fsprogs-1.47.3      | NOK | https://autobuild.buildroot.org/results/2d612ff7b6e6f6116bd771b76f9b172a87bbe171 | ORPH
  mips64el   |     host-e2fsprogs-1.47.3      | NOK | https://autobuild.buildroot.org/results/561b8701ecaaba2e1ec1aedaf381827e705c5728 | ORPH
    m68k     |     host-e2fsprogs-1.47.3      | NOK | https://autobuild.buildroot.org/results/3d42835d50d763ac32ac2b65cb31b34269cd15d3 | ORPH
  mips64el   |     host-e2fsprogs-1.47.3      | NOK | https://autobuild.buildroot.org/results/ceaa754bec8d9486fa20f80f2e949a28b65032eb | ORPH
   armeb     |     host-e2fsprogs-1.47.3      | NOK | https://autobuild.buildroot.org/results/4731755e0dd80c75e599ce57950fd1837dfce7c5 | ORPH
  sparc64    |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/48f5cc7e6c16f004a116ca2b4af80a88627e2db1 |     
    or1k     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/52b49351128aa8fc6f81543e501fc2f9b4b0dbd5 |     
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/5f0804817312e309e452f643e1b3170420b1cb8c | ORPH
  sparc64    |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/53c8e1f3e86ed6b083dae904e09c10e8f925e636 | ORPH
    arm      |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/33c40a596efd5ed5bd392b57f5b51f72d352375d | ORPH
  mips64el   |    host-gettext-tiny-0.3.2     | NOK | https://autobuild.buildroot.org/results/8b22013f9742d2a6cc13e16525ef6b02087b11d2 |     
loongarch64  |    host-gettext-tiny-0.3.2     | NOK | https://autobuild.buildroot.org/results/aeeee9ca7abfb87eb27beabf4b15b5e31284d009 |     
  riscv32    |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/529fede40bd71fb80ae1a82aaf3502ce525c5f8d | ORPH
   armeb     |         host-lzip-1.25         | NOK | https://autobuild.buildroot.org/results/7549e0ecb7e6a9a878486229dfb4d42c2bad3fe5 | ORPH
   x86_64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/5d655bd3d31e336ea5f6eee9978978400bc313f5 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/d71c5d998c28472b4d92d1a948de1fe2349d7bb9 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/c18f79b762309b7f42aeb425d9b598755807456e |     
  aarch64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/c62d1cc6f4248a0101f9fbd316c93c7ada2fd1f5 | ORPH
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/ba4d3118a30357902791fc453c6c4b805909ca74 | ORPH
    arm      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/b53207643a813f4ed63bf6b373f2394690b0972d | ORPH
loongarch64  |        iptables-1.8.11         | NOK | https://autobuild.buildroot.org/results/34752dcfb9b17bc832b8182d95adfb624ecfd50b | ORPH
  aarch64    |        irqbalance-1.9.4        | NOK | https://autobuild.buildroot.org/results/3b609fe191e03330480f647b09dd06916da13317 |     
   xtensa    |          janet-1.39.1          | NOK | https://autobuild.buildroot.org/results/23de2a179ca5623c8ba9ab0f0607a095d26242bf |     
microblazeel |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/99a227d20698e458666895dc84a21f8bd8e47a50 | ORPH
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/0e76b972fd0aba485ca3e42506af0ff268bca2f3 | ORPH
loongarch64  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/d9f482590127d5a59a5111c7abc02bbab0aa3742 | ORPH
   mips64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/27e37b5c358a2d9aac6f289ac03fe8f6f6cb86c7 | ORPH
 powerpc64   |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/c0fefa92d93b6ceb1dd78b74a8f4023e702eb6ce | ORPH
    mips     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/47a115808539c4f03ffad5ef68497653e3da457f | ORPH
   arceb     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/5f8b36dd25d936a736e2ee9f4930947dec1aa4c6 |     
 microblaze  |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/065a69f57d0007eddd0017cbb7bbe3201d6de514 |     
 aarch64_be  |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/fdfb99673d0b7c511aae1cfd728c30f9c92c475e |     
    mips     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/dbe5209b20876f974367d87309e8fdf65bcefe47 |     
    arm      |        libconfig-1.8.1         | NOK | https://autobuild.buildroot.org/results/04acd19f88f906d963c912264df191711667a259 |     
loongarch64  |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/41f495867522591bc1b0f4104207b74da7f7cf23 | ORPH
  aarch64    |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/c8463a1324f63e21e4e52ab76b7e5db0b13a881e |     
    or1k     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/db4ad577314ce06e56b370e85649648ab028fd50 |     
   arceb     |         libiconv-1.18          | NOK | https://autobuild.buildroot.org/results/fc9313490a79d90129fd8b9a8fe90345db215f81 | ORPH
  mips64el   |         libidn2-2.3.8          | NOK | https://autobuild.buildroot.org/results/f7e6a32cbd33f92919fe2f5313a5f06e8bb5cbb0 |     
  riscv64    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/d67ee690ca16c515dc8b2bd7be4b1ba8e56d415a |     
powerpc64le  |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/f65aea084fd7f96f175c31e1ddc92e8ab3161136 | ORPH
   mipsel    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/a703513239d486d1ff1f97ec3012824a622d5344 | ORPH
    or1k     |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/2065721a7275b400776d009bc814220c97cfb518 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/8168d7b2e9dafe5ce141800651d1f4c041237ec0 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/61dcbf1302d6b28ebde833edea528d688a2dbd9d |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/2cb2a4b43d5be9fb6dceb8365ec5430d36ac69da |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/bc7d3ef732ab011aa55f8809b66054ad9496ba32 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/eaa7fee3d137b3a7b98ce56cbe40605b93fec71c |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/545bd2e67cbb1a1b7a10051aa9bdf963d806f7f6 |     
    i686     |         libssh-0.11.3          | NOK | https://autobuild.buildroot.org/results/86a1e69446c46a24bbed09a5dfa2ceb257e364c6 | ORPH
 microblaze  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/02b6f272ba48ff83791e47bd7c8a8dc2fc5a1108 |     
   mips64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/74a701254b64aa4bcce94f2e5b50c1ac0de8530c | ORPH
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/4be7fc41ba7026eda2408e6d7f4d6b2039e417a3 | ORPH
 aarch64_be  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/af08254f8654d8e18e1e8c35fd50b970d2a16769 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5b3f6136f3ffcbc1b9a2b6f195b67eba616d4fbf | ORPH
  powerpc    |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/2ffc5cb5b793d43c69f152a53a98be1cf4887d7f | ORPH
   s390x     |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/efb6fdbf23eec0025da71dbdc9869a5b9d1311fd | ORPH
   x86_64    |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/6357ec9341a68c1f0e8facdd9a9c780738790496 | ORPH
 powerpc64   |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/93cea7524aab5d075811e73f0e208e0cad8161c2 | ORPH
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/fd6ccce6985036bbd5e97ffbe02df80f2e7c6b83 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/afaa5cb52cf5b712b88ef9aa339fe5ddf1f9ee0f |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/06bcd4295daa63625fb04be0e35f11b1133a22e0 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/aa90dfb005b376194ccab12085faa57f23537de7 |     
    m68k     |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/afb7968d923fdd0ce6638bd1cbb93c3321a877c8 |     
microblazeel |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/1aaa04534b18337f84e8add66f2f88283693b9f0 |     
   sh4eb     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/7a4c15534e1ee2470491b2a81f4275b44af30ae3 |     
    sh4a     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/e7dd189bcdaf539d7acfae66a4065cd5bf421293 |     
    mips     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/b283ce1a865521de8f1be449b9792fd793e74099 |     
   arceb     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/6e8477ce5c30519e2cd1ea333f568698245a1adf | ORPH
powerpc64le  | open-plc-utils-1ba7d5a042e4... | NOK | https://autobuild.buildroot.org/results/c99e32c8cd16cb2ca27144549800be3b01571317 | ORPH
microblazeel | open-plc-utils-1ba7d5a042e4... | NOK | https://autobuild.buildroot.org/results/c74730bbadc9ba20cdccf448dbc508d0afbabf41 | ORPH
microblazeel |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/0b09b002e56e2b121ac174703f6c0f412cc90d10 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/2cc3b4ad828d9fb744c8aa8693e981990b841371 | ORPH
   arceb     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/6e29dadc9ce8ddf933908b1a5be21f334b943f32 | ORPH
    m68k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/b5bd65f5d5235f11bde4c7c91e6d7cea057b7ec4 |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/3b779f34a23172cf43b6b290ce8f58cdcb1aa499 |     
 aarch64_be  |        php-xdebug-3.3.1        | NOK | https://autobuild.buildroot.org/results/1bd6190f49a4f228a8e90758e7054f5b4dbee751 |     
 aarch64_be  |      pkcs11-helper-1.30.0      | NOK | https://autobuild.buildroot.org/results/a9dc9695d490694712cfd7cbcb95d2fe06e40438 | ORPH
 aarch64_be  |      pkcs11-helper-1.30.0      | NOK | https://autobuild.buildroot.org/results/7696516d9c0281329e9fa4f3bcc8d02b9a447206 | ORPH
    i686     |            poke-3.0            | NOK | https://autobuild.buildroot.org/results/82800656a35ad399a881da5c898af91fbc196860 | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/885ea9c3b993051bae8b9b98e600e87cbe0fba9d | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/076483be66e23dda820c6c41f0d633547d092e14 | ORPH
 aarch64_be  |      python-grpcio-1.70.0      | NOK | https://autobuild.buildroot.org/results/cbd1502bf058c965945c20bbc5805db9f6ac0352 |     
powerpc64le  |          qemu-10.1.0           | NOK | https://autobuild.buildroot.org/results/e22844e9b95c9f25e4ae67bd29918ba88af02880 |     
loongarch64  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/378e2589bbecccdc5e9b9644d110c5b30ec444c2 |     
  aarch64    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/c2be9309f4c2ddf74a737198b3ed85d15d7ac0ff |     
 aarch64_be  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/ddc13aef92af0dab7e90ca95cf60b64e42237972 |     
powerpc64le  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/27f096643dae314651f8e0e13bd69b44bbfe715b |     
 microblaze  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/6f075c4c5f9055a1f02c5342eca26d44146f73cf | ORPH
  aarch64    |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/c5c6c549739c9a692a22cb3a2ddf2f72d8b3953f | ORPH
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/27a14d2c159832e1a2f675c369980aed8680f4e5 |     
  mips64el   |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/868009fd69256aff8c068d337a35832849244179 |     
   armeb     |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/6b2c4f1621aee9ee693ca47a488c97d82e971a17 | ORPH
powerpc64le  |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/76a2685523bd865016ceeac43ca38273b134de8d |     
   armeb     |              udev              | NOK | https://autobuild.buildroot.org/results/53e5b5239dd269e962e68b237cb32424e6ef7c2c |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/e606f657131e33cfb83789c242b312e97f8a9aa5 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/189b9ff3633dfbbddab1735509d397acf5add23f |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/876bf054ab7cc81a4b8fd3620c423ce1a9f7bf78 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/595e9af38fef4729ff3d6f32ad320d46c8c88594 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/b55d8bf1809e99d2379a3c1c591ba956cf9ce098 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/ebf9a81f7e225ecdab20bbad8ad8daa136fddb46 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/63572e5a26fea327f45aa45bd3b03747b9b167c3 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/0a3b1deb850a7548bf26d8f0fc6bda38ca47e496 |     
    arc      |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/ab35587bc2a0eb02538560e4d8a8616df8a49769 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/ed2160e3d2b4776e71dde817118d717fe1007bac | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/8d542e603ccb0b4053fba96e28ab3c34d23dc132 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/563683e4ea0ba376b003e30e6851cb08394d4018 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/0dbc9a512c8b6cc2212274621a6a3d1d76bff4fb | ORPH
  aarch64    | vexpress-firmware-901f81977... | NOK | https://autobuild.buildroot.org/results/71ee7c6a9974567f3a36287d1d529864cc7e626d | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/eb3f28da220f268c9119c1b6863834e03d243d3f |     
loongarch64  |           xvkbd-4.1            | NOK | https://autobuild.buildroot.org/results/86f2ba051e864375bda620dd92e01cb7b8532ac3 | ORPH
powerpc64le  |         zlib-ng-2.2.4          | NOK | https://autobuild.buildroot.org/results/06d5622f6b4ea64c7bb023761be3eb59b4c89b68 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

              libopenssl-3.5.4 | 3 
           at-spi2-core-2.50.0 | 1 
             berkeleydb-5.3.28 | 1 
                   dante-1.4.4 | 1 
               dvbsnoop-1.4.50 | 1 
               freeipmi-1.6.14 | 1 
  gobject-introspection-1.84.0 | 1 
            host-autoconf-2.72 | 1 
            host-coreutils-9.5 | 1 
       host-gcc-initial-14.3.0 | 1 
       host-gcc-initial-15.2.0 | 1 
            igd2-for-linux-2.2 | 1 
                 libmbus-0.8.0 | 1 
     libphidget-2.1.9.20190409 | 1 
              libselinux-3.8.1 | 1 
                  libsvg-0.1.4 | 1 
                  libva-2.22.0 | 1 
               mongrel2-1.13.0 | 1 
                     nut-2.8.3 | 1 
                openswan-3.0.0 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/5cead042e823e38cbf1b3b84035ee7061ccf48cb |     
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/10dc71ac06f0626076186dbb22dcb86f4b9d0458 | ORPH
   mipsel    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/e3ddae2879d6ffa1c1c3a422e7fa25ca3ba8eff3 | ORPH
microblazeel |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/abd784285a83d6686d69458d55ca8717f68a5aff |     
    m68k     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/7c270a4eed86de6ef486ebf30328cc49aec11e8d |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/90427832efbb9e10d0b496a3c69f8cbed4d183de | ORPH
   sparc     |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/ff76968b0407595431d9b53d6a40eccae0b05d75 | ORPH
  mips64el   |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/7d8df0f06801ba3647e66d2c2c975cf4e91642ce | ORPH
   xtensa    |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/ca28189092a7b39797a90fc59df08e20f4b58951 |     
   x86_64    |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/a61162c3af53ef050f07b73d8fb2b61b642b7f80 |     
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/0063138853f265dcbd17d67995b80e1b054f926e |     
   armeb     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/1e2254bdd490d5e59bed4bec17479c09d92b45a6 | ORPH
  riscv64    |        libopenssl-3.5.4        | NOK | https://autobuild.buildroot.org/results/e660fa408347a8733bf0c0dfd236bc97549f7ae2 | ORPH
  riscv64    |        libopenssl-3.5.4        | NOK | https://autobuild.buildroot.org/results/9235ea6f5586364d13b9ab109e5f57aafc0b4eb7 | ORPH
  riscv64    |        libopenssl-3.5.4        | NOK | https://autobuild.buildroot.org/results/56e48ad58b445a9a50528f825513be1169641677 | ORPH
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/9a5f749cc185dd87b3d683ad5bea861093158e11 |     
  aarch64    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0348ece52141912a7cd47e1acbc3678c758ad6c1 |     
    arc      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/4bd6f499a4b83133ddcadaaa59f2dbf7e1a73be9 |     
   mipsel    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/ecce0e2e95068a5cdd0c0ca640a26b08278d8989 |     
   mipsel    |        mongrel2-1.13.0         | NOK | https://autobuild.buildroot.org/results/b23f3f07ac27454bb81082a0de2ec799b3065b22 |     
  sparc64    |           nut-2.8.3            | NOK | https://autobuild.buildroot.org/results/aae9af5a058256fc1183ed125b54322beef6b8c2 |     
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/cfad083ac978b160ce7372d3b1a3dc22c0aa595a | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    mpir-3.0.0 | 3 
                netdata-1.37.1 | 3 
               bctoolbox-4.4.8 | 2 
             18xx-ti-utils-8.8 | 1 
               arp-scan-1.10.0 | 1 
          cloudflared-2025.1.0 | 1 
                     cpio-2.15 | 1 
                  davfs2-1.7.0 | 1 
                 dc3dd-7.2.641 | 1 
                enscript-1.6.6 | 1 
glibc-2.41-70-g1502c248d58c... | 1 
                     gzip-1.13 | 1 
          host-binutils-2.43.1 | 1 
                host-gperf-3.1 | 1 
    host-mender-artifact-4.0.0 | 1 
               host-ola-0.10.9 | 1 
                  iozone-3.508 | 1 
               libcgicc-3.2.20 | 1 
                  libnss-3.108 | 1 
               libunwind-1.8.1 | 1 
               mongrel2-1.13.0 | 1 
           oath-toolkit-2.6.12 | 1 
                   perl-5.40.2 | 1 
               procps-ng-4.0.5 | 1 
python-remi-2022.7.27-37-g1... | 1 
rtl8821au-8ea0ed9da764448c7... | 1 
        s6-linux-utils-2.6.2.0 | 1 
                    sslh-2.0.1 | 1 
                 sudo-1.9.17p1 | 1 
               syslog-ng-4.8.3 | 1 
               tcf-agent-1.8.0 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/4042c32e71d2e57786f117c4b96f800c54b713a0 |     
    arc      |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/0ef596ed5a2639250b05a6450e27f012bfb1737e |     
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/66fd97a0bca11b154e84e4510214f1a26e538c1e |     
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/23fa56e0ce88ecfa4469a37363e818e54a0bfceb |     
   x86_64    |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/6a6b8cdcc4e78e2026169a701c17d2dcb81abe60 |     
    or1k     |           cpio-2.15            | NOK | https://autobuild.buildroot.org/results/92ccb26ae57e5fa0208eb2074f92a6daf090ff84 |     
    m68k     |          davfs2-1.7.0          | NOK | https://autobuild.buildroot.org/results/9d1db7b2af3e0f98e5729ebd26910e522659752e | ORPH
    arm      |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/cc5f0d199f8d438fb1bad9b7f89950bbe49e0592 | ORPH
 aarch64_be  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/bf2cae67d6cf43d91ba43a99ea5a209ccc9c01bd | ORPH
   arceb     | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/e6c71cf3368cb829451f0f7d757587f62b2686e4 |     
    mips     |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/e3b8592a9f3a888e04302715ed6c8774e6eef366 | ORPH
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/aec80afa8a7fd39f7da4b33411ad154ca4c7db2a |     
    mips     |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/41f9e288bac11edcfb5c89f3776f5b2ef53b8d96 | ORPH
  riscv64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/7c68e18a50502298ca47896ac674c8f4b3b16379 |     
  sparc64    |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/71c55919db06ed43c604976bc6873373ac5f65cd |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/948baab4dbd3154a59cdd4e578f7147324017609 |     
 aarch64_be  |        libcgicc-3.2.20         | NOK | https://autobuild.buildroot.org/results/44b49a8ac1e381cbd9e7c53765c090d9f213d2ce |     
powerpc64le  |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/c78592863e28ed3dc280206afd05632f715966aa |     
  riscv32    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/90ed615a20556440e73dead549aa6c62175c5c10 | ORPH
 microblaze  |        mongrel2-1.13.0         | NOK | https://autobuild.buildroot.org/results/ca88449fc37f5ca33b293a7fb24c45e0b6c2b182 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9e6e10b99dfea063655d63ce0473bf0b6b27f586 |     
   arceb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/3ab55af538e97e97c903dfdfa879df41864f2f61 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2cbf0944e1e562808da0525e8aafefd4540bc37d |     
powerpc64le  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/2e53c7c68bb4773d96e7d61755571d60917114b7 |     
microblazeel |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/265846e4424fb29fd8531875f9f604df5b1bb79d |     
powerpc64le  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/d308a5a6c6595142cdb42518ed562eda050fa3e3 |     
 aarch64_be  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/b6aa051d7cb1b3a60033afbd7373cd1097cfe785 |     
    mips     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/b9ee2bcbe48f9caf80e6365b73330b47362a03f3 |     
    arc      |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/1940f4d6f912050f2044767a421ab4b12c1b60fc | ORPH
  mips64el   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/99122c4cc00f73e3abb5b995907e068d10ac16a3 |     
   xtensa    | rtl8821au-8ea0ed9da764448c7... | NOK | https://autobuild.buildroot.org/results/71a7aa6afb5a28d833698732880323b1414e3dd4 |     
    arc      |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/17c2443f47399534b36d07c3bf1a491416c8eff2 |     
    sh4      |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/efbe76124ae48f4ee9fb9376b05ec476fe2e11ee | ORPH
    or1k     |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/46166778aa288a21ccf31157b8afc5135d7c0be8 | ORPH
powerpc64le  |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/9eff778f04a2acd72a888eddd8cf9f9b33109427 |     
  powerpc    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/017c47cbe40e907be3baa8c36849421b521799be |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/c3febfaea40c09396defb24f0f56b6829cd12908 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                 rtptools-1.22 | 2 
             18xx-ti-utils-8.8 | 1 
                  davfs2-1.7.0 | 1 
               dvdrw-tools-7.1 | 1 
                 gerbera-2.4.1 | 1 
          host-binutils-2.43.1 | 1 
host-netsurf-buildsystem-75... | 1 
               host-parted-3.6 | 1 
                libcurl-8.16.0 | 1 
                   libidn-1.42 | 1 
                 libmbus-0.8.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                    mpir-3.0.0 | 1 
           oath-toolkit-2.6.12 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                       unknown | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/c50ebc3bfb49fbb9b9eead770de3fec7c7dd8d17 |     
  sparc64    |          davfs2-1.7.0          | NOK | https://autobuild.buildroot.org/results/ce85af7cedf412361b66d7ee7a28d50e9f651e8a | ORPH
 microblaze  |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/94ec9719b33a1b3a406f2e41dc3ad8f443bf2dc1 |     
    sh4      |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/cc148d53d2cf6e232a30684c425179ced5fdd3ae |     
   xtensa    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/35a7241603eed01119311160670a8569702d0708 |     
    mips     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/845864e4da41c544749e589ffd6dfda91236e55b |     
 powerpc64   |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/5c8b1247f8acf716604b289cf6f54a2d56a68c4a |     
 aarch64_be  |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/070e9865bfe51a69636d29d52ea72063b3568edf |     
   mipsel    |          libidn-1.42           | NOK | https://autobuild.buildroot.org/results/9fb19df7d6c3fc52e87865d64aa3ea17e3d64a5f |     
  aarch64    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/01251fdf17878bf92f6ec4254e9b362f347dea5c | ORPH
   sparc     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6a6090ec092686189c559f5d75b1d37cdefa8fca | ORPH
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e0f14be7fe3635561e90ed6c42a8fdbab2266ec6 |     
   x86_64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/9df92215670b9b58d15ab104989cc5f5966f0954 |     
microblazeel |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/2c7d3af652157d3b38fd3d199205557491da1717 | ORPH
 aarch64_be  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/e6938bc11923d65a97b861217242a10a6e668522 | ORPH
   s390x     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/e702b715af3e37e17adad51256e07dc46d1ddbce | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/4a4be50c617ab8189e60f24186f4eccb73282c26 |     
microblazeel |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/920600b5ce2db538acc5ebd9c67b2bade14a22b8 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
