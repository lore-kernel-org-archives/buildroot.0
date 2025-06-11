Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E29BC677C4
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 03:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3780C81125;
	Wed, 11 Jun 2025 03:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8gqxc94gIKTd; Wed, 11 Jun 2025 03:15:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 595C181129
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 595C181129;
	Wed, 11 Jun 2025 03:15:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C105183
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 03:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18E484034D
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 03:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5g-57WdeohZh for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 03:14:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1ACFC402EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ACFC402EB
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1ACFC402EB
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 03:14:58 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ade33027bcfso624443666b.1
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 20:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749611697; x=1750216497;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S61QZv9AOjdEOON2Eoy8z9s2GQ9tDcrzSOSvomdFKBU=;
 b=vQ8J6l90g7K2fMkoxCGtD/fsKVqKnKcB+WYoq8cQwAlHF0jC8gLOin8vQgSO3wCoCQ
 tqnc13lFktdjBiulSkvAjHMkd3hPkhJjSbqGoqqEqgGBjPk/M8VqOXYdrAte6L845zri
 dVeMedb7xJHTkQKaVgAVcyCQANwfESrXO7zWCR5uGQq3aEg9xFstvtd60qNApHx4jaI/
 RHxxveW0aXGPhoN/UuxooydX6rd7kJg9FNh6//RieDzw+9Sdm+mx/vYQySeKFjxzgB6l
 idGDJ5QZh5r0zQFkKFHrKoufR3iwMmXlMiFMAWiA3aDmzCl1czp1TqK5FwTF6HCtSCBU
 R4MA==
X-Gm-Message-State: AOJu0YwSjpQuAcYqcLV0Vel3ASBPCBQ3+sFW2cjbR5YKW1LLmFdqvsnX
 9D/S/flwTn2c2ImfXMStZthAgU2qLKuZqF09/9vchACuoW9TmKG7Ut110gMNsA==
X-Gm-Gg: ASbGncuGjIpEzI4y1TrbUha7YfFrKXbQSeB5wKpzB+s3X2fCp57cCY8TSN6VDwa8Iq9
 D2WkJ4rBNa+aK14LUorhSOkaWBEXgr+VpyEWnu4eoVP2DclhupNovlohNDc01RCvQSEe9D8M7TI
 gehxLR0H/X+HHnjZSvF58iEX6J5l+L4nY4QfhuFuVXgX4dJzeqSjcvZ79aLXHRIs3/cp+P+QOzk
 47nB9hoMhJTZ5MmDcc/eNFdQZkfm3yj8PKV0LC9zPjD8H4EKce5NOm/lGXYICsLncX5ER/jCPlB
 LlNEj73oqxNRze/JFG6dmW5Qudw5E+4hAoCLWp2vQzGMeTEp709v6PeGcT3Kk6yunw==
X-Google-Smtp-Source: AGHT+IH4dRU2lJf9mZQQsNL47XScctp7/KZoz2Fo8SRxaZMTGYbL86Rx2jlmj2bHF+r7n7TmLb4B5g==
X-Received: by 2002:a17:906:f40f:b0:ade:8c7f:4569 with SMTP id
 a640c23a62f3a-ade8c7f4b49mr96217166b.51.1749611696486; 
 Tue, 10 Jun 2025 20:14:56 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc389e5sm809065366b.123.2025.06.10.20.14.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 20:14:56 -0700 (PDT)
Message-ID: <6848f4b0.170a0220.944df.381c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 11 Jun 2025 03:14:56 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749611697; x=1750216497; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=S61QZv9AOjdEOON2Eoy8z9s2GQ9tDcrzSOSvomdFKBU=;
 b=Rj2lYKoMrVj3DgxywmvhK6BAlzpjtjyemQhlNyemVLL2AYNW0cEBOODBm3Ss5QMNt+
 Eh52DlXK3tv6zM/7SYjCz23j1+7ZLRyBS1i/DgDdoT7gk6Uf2vQf/uvkVToUbjBmH+Az
 j7uoWuZWWXAYArvJtCt6dQqoOnsyoAFbCGIhfGsX6xBVmWUf0imXYdGl9dUwCo928H9l
 SCYWNNlq2Ubt+myQP5J+NocktIEOmmicoEYo1BrXsf7v4Jf1ZM5bM7IUNxjGjby4USw5
 NvwJmiX52E9pNIoTgoCumaalMIjyEDysMnH6kTZQS67X+jCB2VA6VbRA1pgNPS8iBOVg
 Cw2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Rj2lYKoM
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-10
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

Autobuild statistics for 2025-06-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  5  |  0  |  6  |
    master   | 12  | 467 |  0  | 479 |
     next    |  2  |  7  |  0  |  9  |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 58
          host-binutils-2.43.1 | 52
              libselinux-3.8.1 | 26
                    bmx7-7.1.1 | 22
                  bcg729-1.1.1 | 21
          host-oniguruma-6.9.9 | 20
                       unknown | 19
host-binutils-arc-2023.09-r... | 16
                   avrdude-8.0 | 15
                elfutils-0.192 | 14
                  cjson-1.7.18 | 12
            host-binutils-2.42 | 10
         host-mariadb-10.11.11 | 9 
                 openal-1.22.0 | 9 
        host-berkeleydb-5.3.28 | 7 
              mariadb-10.11.11 | 7 
                  ntp-4.2.8p18 | 7 
                   perl-5.40.2 | 7 
                 linux-6.14.10 | 6 
amazon-ecr-credential-helpe... | 5 
                 apitrace-10.0 | 5 
host-am335x-pru-package-5f3... | 5 
               host-vde2-2.3.3 | 5 
               bctoolbox-4.4.8 | 4 
              libebur128-1.2.6 | 4 
              libopenssl-3.5.0 | 4 
     linux-5.10.162-cip24-rt10 | 4 
                    yajl-2.1.0 | 4 
             berkeleydb-5.3.28 | 3 
             bmap-writer-1.0.2 | 3 
          cryptodev-linux-1.13 | 3 
                 libsoxr-0.1.3 | 3 
                 pixman-0.44.2 | 3 
                python3-3.13.3 | 3 
                       cfm-0.3 | 2 
                      dht-0.27 | 2 
  ffmpeg-n6.1.2-27-ge16ff06adb | 2 
glibc-2.41-5-gcb7f206537240... | 2 
           host-doxygen-1.8.18 | 2 
                 host-gdb-14.2 | 2 
                 host-gdb-15.2 | 2 
              host-rust-1.86.0 | 2 
           host-squashfs-4.6.1 | 2 
                  jack2-1.9.22 | 2 
                libsepol-3.8.1 | 2 
          linux-5.10.162-cip24 | 2 
            netstat-nat-1.4.10 | 2 
               openblas-0.3.29 | 2 
               pulseaudio-17.0 | 2 
               asterisk-22.3.0 | 1 
                    azmq-1.0.3 | 1 
                  bcusdk-0.0.5 | 1 
                    brltty-6.6 | 1 
          cloudflared-2025.1.0 | 1 
                   duma-2.5.21 | 1 
                    flac-1.5.0 | 1 
                flashrom-1.5.1 | 1 
            gettext-gnu-0.22.4 | 1 
  gobject-introspection-1.82.0 | 1 
             host-flatcc-0.6.1 | 1 
       host-gcc-initial-13.3.0 | 1 
            host-libp11-0.4.12 | 1 
                host-odb-2.4.0 | 1 
   host-python-glslang-11.13.0 | 1 
                 jasper-2.0.33 | 1 
                jemalloc-5.3.0 | 1 
                libgsasl-2.2.1 | 1 
libmodplug-d1b97ed0020bc620... | 1 
                  libnl-3.11.0 | 1 
                  libnss-3.111 | 1 
              libsodium-1.0.18 | 1 
                libssh2-1.11.0 | 1 
libuci-f3fc0b76040685829191... | 1 
               linux-pam-1.6.1 | 1 
             lirc-tools-0.10.2 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250130 | 1 
              lua-utf8-0.1.5-2 | 1 
luajit-a4f56a459a588ae76880... | 1 
                    mpir-3.0.0 | 1 
                 netsnmp-5.9.4 | 1 
                openssh-10.0p1 | 1 
           php-memcached-3.2.0 | 1 
             python-webpy-0.62 | 1 
                    snooze-0.5 | 1 
toolchain-external-bootlin-... | 1 
ustream-ssl-68d09243b6fd447... | 1 
             util-linux-2.40.2 | 1 
        util-linux-libs-2.40.2 | 1 
               valgrind-3.25.0 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/a188e7385605217f5668ca37ccfdb41f72f569ac | ORPH
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/f1be851f5d707ec9dfcc56ef2a8e7b172b05e575 | ORPH
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/689c2f067b8320fd57f1e2bfa6c97d31de31a571 | ORPH
powerpc64le  | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/321427dd84ab61ee600ed3084d68bbb15eaaf0b4 | ORPH
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/11479f69f6b7a7f33634e370732fccae507a5177 | ORPH
    m68k     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/a5a54936af40b02f081b529eefbe570e0e3f6563 |     
  sparc64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/165a4e4c50ed08173844119c801be41f8fc687bf |     
  powerpc    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/b183277a34cd3ed22121ab694c3c69070b834b00 |     
   sh4aeb    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/eec462dbd97c6ae935d11e41fb9dd20662e83e00 |     
 microblaze  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/0e9a91f2b78556ac463efa6dcb4652c7bd8c67f3 |     
 microblaze  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/7732cc709e05bdcaaf37d4d2bc4811a189aaf119 |     
   x86_64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/4905157673379c5713fa2503398b9bfbbc2ec965 |     
    arm      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/dd455e0701c3b6fcf6f530e61fc235a0d8141587 |     
   arceb     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/ee28dc632e110a1b31dcbed48934d4d37c8d3f87 |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/050f9f8cfca22eefb9bb9b44fa4efd6abafca4d4 |     
  riscv64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/39d37ff56828bd05d354f0afb9b765eb13861bf4 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/02b462e9339365f88106febc536076edbb4e137a |     
   sparc     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/54b58815d18c57bdaf30d53eea1e98dd375d555f |     
  aarch64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/dc1f53c8e41992ca507baad2e474a4ac5285f55e |     
   mipsel    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/6090846a979e88742dfb0d910a941fc2000e64ba |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/ca7b4548c7938234196582aa5c6f0c6009375fab |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/5dfe9d4c5400f46747f20f0cd2e1e801ebcedb32 |     
   armeb     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/b921e28fc4404e99c5f6551ef3af2607603fc639 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/831354f11703b469a4740da3127b0de6cf816464 |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/3acce06138a3491976b64dc6c3067422a8fd6680 |     
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/436e0daa2aeaf766eb7e58d539b5cd18ce122639 |     
 microblaze  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/63520a9ba89b35b2b4b3b843af3d929c2220b9f6 |     
microblazeel |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/13330868a3db94247e90f638c3e484432249e163 |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/bd7d58cb47cce48e00deaf670332703b25eda826 |     
   x86_64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/ed2eef5236b344d5265225a0abc56600c5419b17 |     
 aarch64_be  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/dc3fcbf0411892325e81ede61350abf444e20158 |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/9b5e2e09349af49ba48a992f68ac0b1885799588 |     
   mipsel    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/283c72270caed1cab28c254631331f997321b4a5 |     
  powerpc    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/36e7bd1650af764a77fbd3eedffc910accde1667 |     
microblazeel |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/ac88caa234ad832778e86e7d75298190c04630d0 |     
    arc      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/3e46b3239845f0ea715785c994ae469c44a93bda |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/a8d75e8bf3c8fb5df6c7b3d1804a718593da0bdf |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/0c206dc4351b798362e59021b42c058acc66faa7 |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/44f65e3590b47203d96a87f6187b81bac1c0a707 |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/9c59a64e131aa57bcf944ddd4d57629cf318cae3 |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/0e6a75101ddf8cf60fe9613cf34ae195a8640ae5 |     
microblazeel |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/eb44b7748bf6229c30204051120d216ab1041371 |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/c251947282552d626a13e877e31f1eb432356f3f |     
  aarch64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/3fe281c1f567863218f800ae28c89910d4f0f8d1 |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/c0eeea5e46be4dd72b6b5af78b260e1ef321342a |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/e5795c186178190cd3ec085b1e74ae5f380b1aa5 |     
  powerpc    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/8d93a04b3a4cb0bc030ae19714a55d5fd818666c |     
microblazeel |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/96eca1c84b400f64035383197af1dccf5dcb98fe |     
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a719bcfcef7a63e32da557ef0601e1c3eefa3964 | ORPH
  powerpc    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/dcdf1bc325a02cb31cc1f0b6fd32795fc03d1b6d | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/69c48cf87087a33dca9eef936097d0e069f0fa86 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/30877d3a258fac0572ed29d9371156efa8dd3874 | ORPH
   sparc     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/8b9f6a1a4467494bf71dfed79e38490e77ecf2d1 |     
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/c8249b24d41e2291ea7d12150f80ad41ae085225 | ORPH
  riscv64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/81b6642a5e7fcd98ac5793b25bb14778d9c7b438 | ORPH
   sh4aeb    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/b417fe43990a5128d670166cc7c43f3bebaad40b | ORPH
   sparc     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/ae1f7ea037562702cc55c8ae6d3429aeb5c0a799 |     
microblazeel |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/7b12ff24516fcac143386a820a12c4414b2f7377 |     
   xtensa    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/3dbbbafe4fc5509a6843a53ebf8c8224491ed47a |     
   arceb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/6f6ea5b3a328bfb0c2644a0671db2aa2c82f1960 | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/847aef86b48ce4f638e0fddfb0f0b73f0b5f0e96 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e5b5e47866b8fb5c77834615f5cc4e99d162a547 | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/860bfc86f330bca862c9fbfa3431024602108246 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/01658ebff0fae5b19e0895b001dc075ae0107314 | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2188fb44981b01ceaa1ad921cc63d9831a444019 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e9ffa9c7c8330522467ee850829a3d89ad895cd8 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/77c842d973d7464a83792106e9f8d73e2180a8da | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7f5852d8e3d6d06aa8b32c3a59b252dddb656965 | ORPH
  sparc64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e048482eea083642d281992dfc99616394d2c922 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/ed55fa97bd518849da4403c50fffab8ffa0a73b6 | ORPH
   x86_64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/1dc8c2416e72ca472242d499fc9931ba97442fa0 | ORPH
   x86_64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/c3b5fe7e199242c456deaf97445512eec5e856d2 | ORPH
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/76ff1f4057854a42fd0e9ee8368247effb82ba0f | ORPH
   sh4eb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/3003bb6e5049142577e1ed020644f764193efd1d | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/bb6dcd5c63a9fd7063aac80344798a35f1645b2f | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7f17c67b4e2f93f2f98e214013a6f03916020edf | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b9e9b66cf870068b0253c8b3f8fb4055527a97ec | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/6aa9b5e687ec3c40f204db0098798efcb1715101 | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7125671aa14a8f08e867bcb673e3bc70b995c388 | ORPH
    arm      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/22f3c139a281974a7365d21df81043b96f20227b | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/a5e0b3a7e30eb2c320ea6ed7af3ab9c8c165a1d3 | ORPH
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/085e5ec297a19d743e27461fce7f214d41adc38a |     
microblazeel |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/c50094eb4951c0dfff647c2a206ee4dbecb706fc |     
powerpc64le  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/a9004f0434bc6bb5bc43bd7faa4dd70839c5aabe |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/7029744dd0526d145fad4af7499537323a17f312 |     
   armeb     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/5e921aa3c914d74eee96aa6a0273796f35d02622 |     
   armeb     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/3aefa5628ae8e9b9238fd8ad16c65fae4cae8ac5 |     
   mips64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/ef48043b3724a6516d9d208c960bdcb0221015b8 |     
powerpc64le  |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/4b68dd86e9d29ee251d44e4ed1e0f6337754859e |     
    arm      |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/df6816ba1a31abe18f7acaa7fcce5846f8d7d87e |     
  sparc64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/5d536eb814b24c67483e124e466e56d96a9863a4 |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/4433f807775092980bd3b2eae12843fd8f73b6ad |     
 microblaze  |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/1c1c97eb12820a25cd8a0416db75c7aa455d6445 |     
  aarch64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/fa8fa937d4482de7ee73689304cbb4c15af2c25d |     
   armeb     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/2e57c72acec3785c28a5ddd1a9d20ac4f9a25201 |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/15cc97b883d5f80d31287f9cacf0cb9f0f63bf46 |     
    i686     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/e283ed78913ba38997311bda9eefae1ddc12d1ec |     
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/4611b9985259a5deb98a2e992500c2dbe7ef6a70 | ORPH
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/d079314c8c19adedc4105c86a9e138a34a618279 | ORPH
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/ba52f0aba0f594e765d80766c49c74f6f1951e7b | ORPH
    arc      |            dht-0.27            | NOK | https://autobuild.buildroot.org/results/5e77f5d44281c20657c4c9be0d78daefd32baa0f |     
 microblaze  |            dht-0.27            | NOK | https://autobuild.buildroot.org/results/722ef3db9695db2c7234b354584cdb3f257a40cc |     
  sparc64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/371ef7cd94943ce793179466babe7c2e75c2b143 | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/9cdc0662d31ee11bf9f68824986bfd65ae2c82ad | ORPH
    arm      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0c00d803550926e220bd8580294ce291e830f95b | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7e72423f33f5c21b05219c3b38f39e42a31c100a | ORPH
   armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/52ec43ca7043ae4de00546f4999a78ec33040ca9 | ORPH
    arm      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d67aa9402ae93c9e7d1b1198aca602d8a52da9f2 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/398b6bf2aa6463fdfe7fd57143a90e9f5f729937 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d1111fad1bb369483d00c6067d8100e029ff0f7e | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/fa131a18d6c77bd3b1c36210244cc76961d8c350 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b90fd6d1be771f94030bd4393e7b5f9d3de57ba9 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7fa6746ed6f958b41488983736ed6eaac316b6e6 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/fdfaec333ea6887ca18c1424ebe48226fe0f60b8 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/69ffdbae42bf83303bc2ab36123e9d7a0bb73d4d | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a5f609d1a5869931664a75136978f4d082b60b68 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/93ffe240c21e9dda273089cd34fbae370393629e | ORPH
   arceb     |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/d6189c511dc0c5c18bc8b2f822a763803b2656d6 |     
    arc      |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/fc22be1420089597cca58269e224c6e7a0a99112 |     
    arc      |           flac-1.5.0           | NOK | https://autobuild.buildroot.org/results/7061286bd88b2819bb98c00336c659e88b82c37d |     
   sh4eb     |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/ef69edde5aa188e4235d57077b633feb337d37b9 |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/b73ee8a8b35c1a485af69223e5ec1545f67ecf76 | ORPH
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/201ab1a2aede7c617f50ae69ccc2c345a1405603 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/7e6b4d50abd936db55193add31bb021f1f0ed50c |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8bce0e54777ad505a541c39ef4a97bf30b53109f | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/a8c929724984f1cd6c3ee58b428086942510c6ff |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/fb1344a4a2cd6f73d8c5e3cea6be8712ef3a2825 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/c0784fa2b9e755ef4cfcb69ec97ad55e4c6266da |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/52f7015a6ccd40537296a6f00e39bfd863e0ff6b |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/6e6fdd105f1cd4cc43298bc0aa133126ae37e721 |     
   mips64    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/5c3a7b960743ee1c2656b28c7e7ffcac62832f1d | ORPH
   s390x     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/f02b07f4760f0d843b3850e32e99fcb63fc4e2be | ORPH
   s390x     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/bf982999c83be45b219d273df9b868d0f7344def | ORPH
  sparc64    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/5e2fa90b8c28865215f2d8befe873996d4be0f95 | ORPH
   armeb     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/cd1c4536ade3cbbcf3c07775d9ea461c8b25f245 | ORPH
microblazeel |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/f58d033b69e509015cc785460152000d64ff8fde | ORPH
 aarch64_be  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/34fe91e166a51ef0f7f9f0b2dabf3f0b9ea25560 | ORPH
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4fb8d5c58143e626257febf36786d861aba636e5 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/e29eab089a44d03b6921eb5ad70027774e4ac209 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/16ed9d23ad693fedb2a8dcee1f22a8af5da3df9a |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/fbfdd67e0e5b8d4c751f2e8d4b8578dfaadc844b |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/922c88fd44088423b98e4f543813f84d5dba48b5 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/158147b78fce8e91d3ed1a613c2eac42d9c3a368 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ae8de4c9e855eff12c1ab38127b8421b4c458ba0 |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4d623177968f6af49388e8b9d3048eb251611932 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f9dd055823ae535ae92ca5bed950a47891a2cc9d |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/1d760b986055d279736c49515afeebf02851ba0c |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fb49f34aeaf10d275182bad4efb75a4b8da6771e |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0ac0859928ef309433740f21da49deccb4710085 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/aa429d93bebfceb93d28a69d66f6cc00ff0423fd |     
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/132f9ee11bc61857a2eaa381ad89af21c8963e35 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ec93822ce5afdb07f9b606be758d93fb04556e74 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cb81925374017d6f686eec20840380b3d5dc8b83 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4bdf9787c5e97fb6895f6263b977db1f3c2a676f |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7bf351cd93ed0bff3812d2719225ae9f52febcfa |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8835e79e5e8978ce873cf2425c22e7fb3304ab57 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7c5bb5e2581aa6c939346c0492a60549ddf4c617 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/44731e68029957e52db9963820ea635676266109 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/99925cf91e864ede83fbd77285b6f93ad54545d8 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9f93f2dea581e417c19969c77604a1e270b0039f |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ebe97969ef3cd6498a059f15bba60675dafe2d87 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/996b3dd30689620838b500a47aaa39a898240128 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/32bd7632647e5b6763ee9dae46aa39b9e047a159 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d07c2f2cd70375e78f3dbb6e1db9761e1362cb98 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/172b2c3182821a310e5041dee4728fbbc7054115 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e541201d914eaaedc0ab9cf29c1f1063f05ccfff |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d12eaa11989a47e4e313700b96f747aaf0dddd2e |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6e155d00700774efc5df61e41524b83333228db5 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a41cd172de509a4ca1348bd05036607529da3987 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/aa0a613accf433008ce1564fc2a85ef3eb906c80 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/35e5331f0f441f19b6d68b2f183c0419f4be109d |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f38ff364b963db5baa901d5e922d4f22ebb7cc46 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/89941c668f780e63efe80b14800835f8cc452b2c |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ab4e2e55b6d1ff3e9dadf09c819f0ecff4a4f1c6 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9bf0b4117acd84b08fedd06e0d3759a237ecb1fa |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b46e4738fdc8b09f087a7e213a5e0a99050f7a26 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3cddebd57b4af866d46ec7a8d4f095d377b64dc5 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c644e24081b5b81d04acf2bfed673fa65e171676 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d5100d998bab91c7c6d72f98e7610755c3b06034 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/dfe2b051ffd974e8ef868e9280223e0657479803 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/18cc2b5da3c51a321c2629f686a3f814358446b8 |     
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a152021610be4fb3516dff9b31bb3ef793490ea7 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e745c75e891921c21663d45598c5ada71c889096 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/81880bebb8ba7befc03e995c894b838d34919626 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ef7682eae116f9680c5b1eef0f5b601bdad5019b |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3a563bb3dda0580455b18fdf5f06cda33d879277 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/dbd5a40967645a453e5368756084cb8c578e415d |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0a486a414481eef60b8c99a5f494a57e51add12a |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/99db12b9564479de9d104b2b2b07dcb1c2d6cda4 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/360515861a47c67fdd3fb770da6ec333b6fe2701 |     
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fb47bb9a795fe73d214a2ac2898ae88c587b5e86 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/73f45d51dc117d56606bcc23cc84ac7761b5da78 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5550e5f8e66380d2bccd071b72a4e3e11d896855 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1ff3a80cb1c288a1604e9dc8b0cc3635ba579df0 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/57e6588fbd1a5127371a3d23d2fef4dd014bb591 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9e372a0ea77456e47ce0c71b096650d56641b6c4 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/730d1aaa9b2c17685bb76e77b4a2b0e83b18380d |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9ca8bc4d8f1424d338f4ca15d7947d017f538dd1 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/010ee8ab8518cf9251bdb3dad2cfc4da2d969014 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/194c92d706e16525f6495bbd969ff6b98faeca09 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/2ff891f8e41da9930cf26de3b3163e957da9637d |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/14598a4a33b0af14382315275a1800a876e5ef05 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/2b227a512a449eb61ccc358cef85a8d97bd7d01d |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c7677177257cb5d5eb5ce22d778405fbf9a553c3 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/77ee1b6c8c7b3f3ee17ec8a453380decf10986e2 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/14f821181a94f61ef7355c8028946b77a5cd7b20 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/ec8366710d4f1f9096c195a95fedabc9f64ab177 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/91c9a21b6365c28cd935a1de8ba9fd0b77ecb7fc |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/6fa64866220324c74c2f30fe434fa567095a9596 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/367843399a55a79af56c8b868039f759437a8c26 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b0f9aac831ef9dc49080a060893268d81d8c1b78 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/57170f1aacacb7c13c869fad013990b6fde3e9b8 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/63986fd5d81d3fcf5cb4efae6c645fde5a253d1d |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d518dce22125b10fc4e56fa5aaa8e53440c610b0 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c8a896260eb59c6a9967b3f6675b640f46fb5f70 |     
  powerpc    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/551ddbd3717b2cbbe07db286b6b2c3bac62c9740 | ORPH
  sparc64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/6f2df5219777144543bd52304015ef2c615e02ef | ORPH
  sparc64    |       host-flatcc-0.6.1        | NOK | https://autobuild.buildroot.org/results/b8543f38ac0e4db4d03c3942c789c0d8bfedd217 |     
    arm      |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/3d0c4ebf4876615dfb4965957a47e9818469d3bf |     
   xtensa    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c978011c327064fea50086be0eb19a77d2c4b3d4 | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/ed9a20810974274aacaa3ce1d25d3e10e4d66dae | ORPH
  sparc64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/46ec760a35b5320c3cd9ca64d482d87caa25fdfe | ORPH
 powerpc64   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/4c9ea3ad97f7c99efa7b9d00626b9a52e55c50ba | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5c7246e08c00c6c59d1aed322f9573a78ff36a0a | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fbd71f9fe2fb48c498b0aa7b8f25cd5fb9d718fc | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/513aecdee57835125bce11fb5885a66ab53c31f5 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b5e3dc1418082d459f5c4a4c6d2ba54e061043e6 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ca05e8eedc1d4b66ba6cb9bd6bcc0ec41bc7b45d | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/052cbb4f1e766f5fcae8b7df29c02d25a86ed754 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1a7f9291c80e785d9f6b7ccf6b157f41e0d253b7 | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/63e0a979f488180bd6917a17c8f4c15ab3c18bcb | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fd606eb121d44e16062465e59bd5e24c783940eb | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6952baba57b6f217f7bc95642ea1b86870e5638a | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5ad3eaac20676f41fceb3d0f94c14c34b855a1c3 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6089c9648f4ca3090c3756658703adb0e5fd5139 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c5be28a3dac942bf79809b7cfb693eb5570d3845 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b63a23a973991ec3124579e0587953cb7f33b55b | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/04ab784cce46d829bb69d5a72444b6e416df5171 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a09f0da19050ced0e845678e1564c3e4e1ce2632 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f136040c13f235b103da2925f279820d6f76a95b | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/645db3b1b8a616a97506e6412a50e48ca6cdaf23 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7c4475c3018dea83d9da39558e67da2ac44e762f | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b78d432541ffce73ebb7a6861b778f7c5735376d | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1a947aa57ff774bba1961fd8dc35cec14525ef8d | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/71e4b6c681ad77d14b495b1641bec41e3ff1c0fc | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/db1ca1932472297bf2335ffb6e90578dcc21b4f0 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4a7d638461e521ba78cad1fe9140ace92c461ee1 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ec915156e5aa56c8596b3a744e232d50435be739 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ff4cc741616d8f0294e16f1494963d232b274583 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e9d708943ef62b09fc527fa6f26fa3c6260ea474 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1de0d925c07f47a105dfc988e82de0731136ca58 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d8c8baca80593e5796e4ff717314358029653e6a | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/93a393dff997c314019dd089814424517f079149 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3822ebb0ff6238fc19333c1cba1ac92dbdff7aa1 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/47fde30b47ad8379a6685bedf81d6d9624a64326 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/189200bcd98887044a0f0e705384aa27e86e7870 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1ee0a7e3d2472a7f6050a918c07639af879c8869 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d549af0f1bc3cd366787559c58cc013549aa822d | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b83bf7f4b6097ce92b15cd5bf0f70372a6265d8d | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/78fb6f8be72da978aa141024fdef6f0c8a648617 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e24d0ba88b1117ae232fb2a185c8bc768fa65050 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fdaeae88f14569b78c2332283eeb6ddc0271d4fb | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6c0bcab200bcb595a9e626adcafea9e25f14966e | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/28004392dc5e27bf30613c7ba496b6055e4c8214 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3132cb20e51b112edba81cdbf0a01cda7a31b911 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2ca4f7103b33e4009ce4a927611d143ec0519e8b | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dc69fe5994494f7b9e5c97c67cdb60312622f36a | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1c02b26beec77df3bef9fe642ba06be729096e53 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/079b1cb24ec49711bb483e93173ef9982699686e | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f88cf96f14170cc0d2e5963b31249fd3d3ac0b25 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/103de58a72ebac078f9107c8e2a19f24576865c7 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bf50e317960a3f371288e2d0a0103186bc541e8e | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d3b7d843b0849c1505cab396867f38431e9f5174 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0f3cd37afafe2e2bc1dd001de985e6bebe03e77d | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a36a1cc68628daf35c8759a85d402603fb03fd65 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b3e6551ae8b228e90a0dc6ca4ac64dabe4136c7b | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c041e168d235ae16ae4a24a02362ffc4a85c4fbc | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/205d2fc9a5b2212e9d5a756ca2cc6bc9486bc295 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/79aabe99c4f218d7c87a879fc1f96fadcdc74e78 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0ac8e3278965cf4c5ff6f7dce79657df0a7b666e | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/24f87e9ea57f6cec18c796062667ae55e7369262 | ORPH
  sparc64    |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/ad82ba6ade4385906d0499cabb8fdb3be1c4b66c | ORPH
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/ebfe60260854e9455b13c12946247e785a656b9e | ORPH
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/a923a4dec232d78427c4ac599f61cd60025babd5 | ORPH
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/2cba6cfde6a6b4998b3ea86b64bbe6b0af1e79dc | ORPH
 powerpc64   |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/5fa12ec4f677b0fd91a64abc57e7cd8278101303 | ORPH
   s390x     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/16ddb10b1a036e122074ee401fc8a2a65ce68675 | ORPH
   armeb     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/77352663e371de1e45874895925a8071d170352a | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/eaf43f60e3930d65e858f8f3bb7343386c2114fe | ORPH
 powerpc64   |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/0e130f967d782dcdecdf3e1a44579d545de40599 | ORPH
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/df484a71146e0a7d9aaa512328600ab970b727a0 | ORPH
   armeb     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/e271b638286d764e0f68abdd04f364620480daa6 | ORPH
   sparc     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/9021ff373e0d0064b9dd2c58841d59e50084fa08 |     
    i686     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/9ca91014baec3fec90a97b54fb35f1c6f8f8b5cd |     
 aarch64_be  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/0962282a0bf7a836acaf99f28cfe166a4f08726f |     
   sparc     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/b04a412b37f30287a5e73942f1825dbdbca646d7 |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/7f6ff7081238a7dee34801288afa7125921c4afc |     
   x86_64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/63a9233bd4d761d0a1aa6e2d24ec4504e1a91d25 |     
 microblaze  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/ce6acbb1f9f560587bbbd1c3469eefbba5e4b8ff |     
microblazeel |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/ce3d92b4846cd2dd76ec14d60904a56e7b41eb4a |     
   xtensa    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/cc1a9dab2e26d234efba7c647b1abb3e7c1f05b3 |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/c47e51ff3b5366a8231995534d98285b0a92d048 |     
   x86_64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/e1705a70c2862cc6299b80bb0350f1b791bd3ec9 |     
 aarch64_be  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/360549e7c0950f314b097827997564d2dd6db169 |     
powerpc64le  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/b073514cf2ef95e269580156ea82eecc1e1a21f2 |     
 aarch64_be  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/0d2fc3150eab03f6c65eaf62e3f8bc53acda432a |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/e54998028025d8a1a4c7310c807b4b388ecc8d8b |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/c8c9de83229c0e7a8eb289d25093dc2b350c8f86 |     
   xtensa    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/de3e841bca841c40fad45652fd6534e844d956df |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/afcf29b11410048dbdd6a7d1f5d20148017eb4e2 |     
  aarch64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/b1b0f55a7a50ae76ea134839e8796e4667c77e4e |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/07be74bae36e04b01a900d9b2a13233fe732284c |     
  sparc64    |  host-python-glslang-11.13.0   | NOK | https://autobuild.buildroot.org/results/6c0e2e3ef55a8434900d4d842a1874ace0d1857d |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/d5d9fb38ef514eafc68bae8311b1a71aaf30d6e1 |     
   armeb     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/15a4b6b41e780b7b3426b618abeb4a2a10445396 |     
 powerpc64   |      host-squashfs-4.6.1       | NOK | https://autobuild.buildroot.org/results/5f01903033c65a47484a426be4b4290f8a48ee24 |     
    i686     |      host-squashfs-4.6.1       | NOK | https://autobuild.buildroot.org/results/488d3a68796c7949aa5a01163ff76d6ab791c38f |     
   mipsel    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/43472cea894b329f1e6595baca6b62345e18f0ac | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/d74567b3d89aead4f90d4d51f1e51e1c5534017c | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/71a693bce8e58b81ad193e7ec7d533a36317ee9f | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/b2e3a2ddba7290b60604e88693c54307666a0ecd | ORPH
    arm      |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/3c7d35a54e7bfe26b7d638bc54b437ca1797fbe2 | ORPH
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/d065083155ff558aef71b4a04f3ead40211b6a18 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/d4694b5e3852a1819e593e16c8096fc5e887daac |     
   mips64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/32e961513697528afa0d45765d9227314fc6dec8 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/6749a3398e8bfb105bc4c3d00720b3f912116d58 |     
   s390x     |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/d35f6d87b1e512646c49f4dc88a07b9a4ff36c8c |     
powerpc64le  |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/55d4eebc3bdf5d464e8aec94fce5a19fc1b75238 |     
microblazeel |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/f17b8fbfa336fd2ceac6b530848d7975abd38a92 |     
 powerpc64   |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/129e694644c501bd357a5bf92dd3af7b5cf0bf88 |     
    i686     |         libgsasl-2.2.1         | NOK | https://autobuild.buildroot.org/results/4938cc0be5ed5d66908c10398665db24a4844063 | ORPH
   sparc     | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/fd309f5123ab8d794db428849de0655bce1c7827 | ORPH
powerpc64le  |          libnl-3.11.0          | NOK | https://autobuild.buildroot.org/results/29b8494d96d292dae26a524eeb3fd2524f00de05 | ORPH
powerpc64le  |          libnss-3.111          | NOK | https://autobuild.buildroot.org/results/ca2b0f90919fc95e0f955fa6a7c90bf4faed4bef |     
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/bb752aff21c53e429acd7399b5ffdc2cb1eceb35 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/a60a95e8583981991e50397f7bb83889c1e2a355 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/7b7c69ee66a8380f5cfa525874c53bc35e1e0a94 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/5423d001968e1b9328eb4d96512811f17b1dde99 | ORPH
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0fd2645d27e46a4ddb603e53b11fea31c3f9caf7 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ff3f88e9f886974bc70f44fd869c68683a51dea9 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/299e9df4b9118ce1c3ef185600f80d91e6be2127 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/76a2adb137d78b3a95b1fddfc66ad7629e65537d |     
  mips64el   |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/fdcfa3d62a9482f1d0f9a9ffbd58b9ac1ed31466 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/14d765dab5db0957e98bb931e8813d4f86cd0594 |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/917d4f68559e869b7986de7e77b65840a6f10da0 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/56a7b87b9b0a548b87064c02d0d82549e9301e8f |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/30cc1ca5cebe06a4ac5e515b239d79203244915d |     
    mips     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f8fd3dce39eb30a26473c445546b637d2bb301fd |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b1f482a2c33a818b2956578ba21a4e77839fe987 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/737858bc9750237018e8a617211c7c9d914bb794 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/59b82486b45a433ceaf12f4dcc87844fa425f3bb |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/697c20048ef6a94fea461dbde50f9c8701660a38 |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e944715b6fe403080a3cb5e8b8aabdf672459c3a |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ff411ba2ef73e2dd9096ce585299385ea1f22e54 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ed579ffe654055c2f438a1b0911a0866b62bae3b |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c0c3921131f228a15e999f6c7a27108686c8630d |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/dc496d0206fa516b0291d609569414cd4d0667f8 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1eee1522ffab3404eda18a01dc96a595f3fe0b19 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/baa52554cc947a2da14d830f550e9631f292bcdf |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1151e9813712b2faaf1c15b547b3eacef2fe7570 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d2869c13f903d4653011b21c655a09a0be3eab71 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1e3c50d86ad131607dd4006ea7481d9cf47c1e1d |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a564caee71fe463dcf448a90cdb33dc2a32459c8 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/49b36bc0a4beace471e5a4151f7c47322fca32e2 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/2f29c405ffaf798455020c8ef234ee38456d2e88 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/e6af95e9c84819dcad921b5e0c1c164a0980fc44 |     
powerpc64le  |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/80ab835b65e396ba4aa4ba5ad91a061fd85954de |     
 microblaze  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/e13cccb945620d4690dec047f87c5d1fed7d6930 |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/b06b26124e21d8cf9227757af189fd57d41748dc |     
   x86_64    |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/a85f87e33ea38c5cd9c18867db8f6b473c055ac4 |     
    arc      |         libssh2-1.11.0         | NOK | https://autobuild.buildroot.org/results/8cd666607390cbba4ab12fa4e90ae460f44f367e | ORPH
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/b1f472ba39ca60f2cdab97f748ead5e48c2f42c4 |     
   sh4aeb    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/974d30755ba1375bd19cc1bf3eb343d2fc167ec0 | ORPH
   xtensa    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/9e4437889241a14239f9700f34bf59cd38f28d34 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/adb6db3e3fe80f95196db52d71a19487a5051266 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6f645938ee683c46d2d8c0722cde01daa6a947ef | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/52261f45683dac9b3456d497144355defb18a9c8 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4aa5f6631eae1232968c14b3923ba50fe73f332a | ORPH
 powerpc64   |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/64b9ddf4cc61fb712f62bfa1e972b36d813aeede | ORPH
    m68k     |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/899f4bf4948b635faa97ffa3993b3f38ec77201f | ORPH
  powerpc    |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/6a55ddb3d1a2eeb9b25537675cbb132d129f4150 | ORPH
 powerpc64   |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/d59a4bc37ee43429a16c6b069cd907ba1bcad102 | ORPH
   sh4aeb    |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/a30064ddb1af50ee427b6ef5a13b6f75615dd8ab | ORPH
   sh4eb     |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/4598a49398d0715ff7cf1cc371d0f9e85bf9ca43 | ORPH
    i686     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/6509641abfdb0afa7e642e61c56b7e1fc48f36cc | ORPH
  aarch64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/44f7ea10d21b783b27dfce2520e73e9e82793bc5 | ORPH
    mips     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/5e35051fb1df18d07356fd2719e03efcebd1bd7f |     
   mipsel    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/186b91776936dfe15fcccfd3ad209fa422ab4d40 |     
 aarch64_be  |        lua-utf8-0.1.5-2        | NOK | https://autobuild.buildroot.org/results/89504063c2665800edf75a487251e50a4d8269c6 |     
  powerpc    | luajit-a4f56a459a588ae76880... | NOK | https://autobuild.buildroot.org/results/1e68c6af76c5104d705d6746e03d8776eda15a14 |     
    m68k     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/cbe74b0f2e4034f10384dd8c8285d026c1e3c679 | ORPH
 aarch64_be  |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/ed9ca5622d1a538e27e7ddd9d5e9e02c68a6fa4e | ORPH
    or1k     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/163e016750911f65bafff82b7c7ba44f9ec74ba9 | ORPH
  sparc64    |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/a5688128cb113bfc3fdd2cf0d5a0c613c04afa87 | ORPH
 microblaze  |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/c22d32d1f6a0beb008a8c9f2577bd0e0753dda0a | ORPH
  sparc64    |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/4cc05c314354db1a8cddd2b00e4919c33f289a9f | ORPH
   sparc     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/7f87d23b6d59f6e2fc4dc1c7b4ecec16c0a98644 | ORPH
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a23c74dcfd19f37ce68164ee396f6f60077f01fe |     
   s390x     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/700d12332dc27cadb78e3de5743ce5aa8a473c8b | ORPH
powerpc64le  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/c280d23a9810b0177b9e90cfa6c5811564f39b52 | ORPH
    or1k     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/1e64c12ebab74902e1a79edb56dce7aaf01454cf | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9c61ac4916b55cb8e36af616462907dfdfdd09c8 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/550976f76bce2289408dfce8f43207be5012dc2a |     
   armeb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/cabed5800f4b797e7d63db3add21d25e081cbf60 |     
   armeb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e2f78d32a7d0a54f0d6e5a766e45a33342ab915e |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/691af68342a227ce01d39c359d4af19bfdf96910 |     
   armeb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d273a56d863fff55e6db05ff1b20e7488b917bfa |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/77df3d5361471ee76bbce11743a9609e41845b61 |     
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/818bbe6438409c08c22bf35ba1e71b23b5861eb1 | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/cfd42d464124cce390ea27fa38012c33f5132f1d | ORPH
  aarch64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/523d3119b0ea35d894634c02997b9cbafcb7111f | ORPH
   mipsel    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/86a10ee81fa387a82813c0166df1bf41c279b821 | ORPH
 aarch64_be  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/f3bf16d40c25742ba880e03efe130abb6710754c | ORPH
  sparc64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/3d6f5f7c7f4291eca6a9de36cff6ac16334dc39b | ORPH
   s390x     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/27e84bc528b7ab5c8409bc6fdb4131b0207a2da2 | ORPH
  sparc64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/7ef4cc50cc7690fc99308c7e22035f31e919f270 | ORPH
powerpc64le  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/5dd2dd7cdd9e12ca5efd86aee3350abd462f2434 | ORPH
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/97b914afb34c5532118f4da04728dcdbbac938c5 |     
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/b7a8a64f48c082939191902ed53a01aed38f9fb4 |     
powerpc64le  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/2c07ffa3a3ec0252f333f3fd6e7876c70a46d7ad | ORPH
microblazeel |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/984f2fe970b90170a297436d3441c9899b9b7d6d |     
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/3b57f9412565d48a3f04068986f743404c04b6f0 |     
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/8b499ac9cd771ae1c6c18233c17764890ef66318 |     
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a7097e7b9c8e243c5ae283c1e0243c969b03e1c7 |     
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/67906fa14da68112b7f8d9eceb9bfbb1ecb95020 |     
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/7b120246a31a0ade7e30385c1612176336251e50 |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/bcb8a6d3e6850d1eed4bf52e545d3734676baff5 |     
   sparc     |      php-memcached-3.2.0       | NOK | https://autobuild.buildroot.org/results/f17fc71b19e6fd7fce5276d54b87e152d9e493a6 | ORPH
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/26abbe371c77c2b55e1aeafbcdce113d894b1389 | ORPH
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/cdf6d9e85860d4e21f3d823a06206f634d3e1a9e | ORPH
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/daae43522eb9a4862c6f3673038aa06fa67fd3a3 | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/653ee0b9dda217be635a8c6be8262ffe94bd4d70 | ORPH
    sh4      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/f233e63e620bfbfab7bbb698e7fa4434db9891aa | ORPH
  sparc64    |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/29c0994a626267a31ddae041eae19bf7717e6b7f |     
   sh4aeb    |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/6acd7b46ee24b2058e04a57ee453c943ba382291 |     
   sh4eb     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/c380c5cc644fa17cbfe8b4dc77a0b985d6e0f7a8 |     
    sh4      |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/8975849fd61793389baaebff8d1a7e9f3b49388d |     
   xtensa    |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/2dd486d8318b1d8e45c07ef32f02d0352c26547b |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/ff391ca9715b7de44edd9560b56b24cabb1bc5f8 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/65ba600f85bcfa7ace1a8273ed88b85041a30dfa |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/f879c9298aebb565954d88ca9d27104e0fc85701 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/a2bd9505aef427e0344abb7e3f836cfcffb9bf4a |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/143ae3402ba825d7e6ac5989064e39119fcc2c19 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/5de4e62db21fbf48c954094e4ec3314f4f28fb34 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/f097c01436bdd5c1835ab747c7e88bb8787086d7 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/67b2e8ffb793a5d1907e0e0dcea3ed526676b3c4 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7c61dc4f81cd7c17e0105986fb64dfd60a4b9c5e |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/eb6925c5bf62eabb4d8a5c32bb1fa28af4749b6d |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/d59d3bbd86e33d660799d7379b3f8d1d3fb09106 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/eb046947a95c0a11eb58c94643bc1d3267ab56f5 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/09d8e8cc2d7ec26600a7adff921dfa769bdcf480 |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/c6f98f89e99b632d4b7679b3fe64dd150d60249f |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/3522cef651ecdd8b7648ff27a3bf25719fad6e1d |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c3a4a07ea15261298d6b8ed0504a9e8471f151f5 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/25146c0d35a5f4a8ff566a952a1f4180e2a116a2 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/0a026ace7023adf44f3c215d6f7802c4811320b8 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/01019896f8358452ce1a7f578cddd3a8ad63fabc |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3194d9baeff8aeaad8e84f3cf2935dc9ce3a3e3f |     
  powerpc    | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/6ead4a0ee679f459e97c04916848388c2b554147 | ORPH
   mipsel    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/795b280bc6b547d8b28a8c047d0932c7585dbbf5 | ORPH
   xtensa    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/9e4f15b21fe7d36ab43b991e49891fd01b9ed43a | ORPH
  powerpc    |        valgrind-3.25.0         | NOK | https://autobuild.buildroot.org/results/16ad0c9e90d7f03f71fc73eb8813b4cd7b2a2297 | ORPH
    mips     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/f018eb5fa9fbb3b30b1a2673289848ba75ef0eab |     
  powerpc    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/e3bfd26b2546dbb5ff52ba16957c3eb6b94aea13 | ORPH
   xtensa    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/5c2694eabca6055cf9f9caa33330080908646fbc | ORPH
  riscv64    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/fd682e4e2659285cddb252cc75050df44350f3e6 | ORPH
   x86_64    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/fac08365dea24b080324ee771be4bb581c5b5354 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 hddtemp-0.4.3 | 1 
          host-binutils-2.43.1 | 1 
                  libbpf-1.5.0 | 1 
                   openrc-0.56 | 1 
              skalibs-2.14.2.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/f62657375e6e6c69c1d3fb18cdfff5c4346d661f |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5f01898d71bae910058f5cde9cb649be19aa69a0 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/26093fdec793ebfa66f97b430332e77e42cc9fca |     
    m68k     |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/46aabc3c71058eab7bbee476ae97695391541ac5 |     
    or1k     |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/995657b50de4e5e926e3640548691479dc9f5b72 |     


Classification of failures by reason for next
---------------------------------------------

               bctoolbox-4.4.8 | 2 
                elfutils-0.192 | 2 
             casync-nano-1.1.1 | 1 
             python-webpy-0.62 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/70e6893fbcf421a82b16c440301fdd4f5d31aca2 | ORPH
 powerpc64   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6b86c08b521814d31b0bbdf60a915addc722fe62 | ORPH
   mipsel    |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/a7f614e8b929b216cc2ff4cafea187e37dbb7427 |     
   mipsel    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b4cd2f64de275c46e58ec93bed2232e3bc1e7173 | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/47cceaeb23f2d6aeae33e0bf7276bc8c9786abd8 | ORPH
microblazeel |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/75fd41674a485d27ed6b7375ebe0c947ebdb4380 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/a875692a7be72dc1e8b983a837816d9293954e56 |     


Gitlab CI results for 2025-06-10
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288350032 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288350030 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288350027 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288350023 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288350021 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288350019 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288350013 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288350008 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288350004 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288350002 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349999 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349997 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349996 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349992 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349991 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349987 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349982 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349978 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349972 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349970 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349969 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349966 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349964 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349962 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349958 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349955 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349953 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349949 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349947 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349946 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349943 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349940 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349936 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349934 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349930 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349927 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349924 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349923 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349919 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349917 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349916 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349913 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349910 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349906 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349902 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349899 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349896 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349893 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349892 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349890 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349888 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349887 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349884 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349879 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349873 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349872 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349871 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349869 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349868 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349865 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349862 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349860 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349857 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349855 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349853 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349851 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349850 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349847 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349844 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349839 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349836 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349835 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349832 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349831 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349829 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349827 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349825 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349813 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349781 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349763 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349751 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349681 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349674 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349670 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349644 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349642 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349627 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349624 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349600 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349592 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349562 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349510 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349444 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349443 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349431 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349385 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349367 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349365 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349363 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349361 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349359 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349357 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349356 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349349 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349341 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349339 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349338 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349336 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349335 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349331 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349330 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349325 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349323 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349316 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349312 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349310 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349309 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349263 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349260 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349257 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349245 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349240 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349236 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349232 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349227 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349224 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349219 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349205 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349203 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349202 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349201 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349199 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349197 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349196 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349195 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349193 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349190 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349179 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10288349138 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
