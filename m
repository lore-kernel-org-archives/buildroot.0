Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20B7E7717F
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 04:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E744860767;
	Tue, 17 Dec 2024 04:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lMw-kX9AVcs; Tue, 17 Dec 2024 04:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F03560F36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F03560F36;
	Tue, 17 Dec 2024 04:14:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ACAAFE3
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 04:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A40581FD9
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 04:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pH_z66xlOQ14 for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 04:14:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8DD0E8134A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DD0E8134A
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DD0E8134A
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 04:14:49 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5ceb03aadb1so6700624a12.0
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 20:14:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734408887; x=1735013687;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Co0uX+6vMDwRijVQ5KDnLyF7JJfJcFvT91I/a2Tc/Pw=;
 b=WxNsu5ZASdQNAo9E8t48ze0/CQApNjDD1ZvBL+ZE1y1KeRkvzdqFLQPaX8DIoLoiq+
 STily//m/m7SQskshG2NypOS+cQf2DN3VVMu59J86RiyFz6Dd3bXXXp1ghN3CEA71ZOq
 WNUPcKbQ4x7xBTKEtQI2ozOOliLfzHLpU+VvXj4+c7PAhAHuLJrB17vE/px86XYmJIMB
 cGgOxlTFz2aJ6ZlKRueQ6oWQnKciurs6J+x8r+gloOACfYM79AQ5PZ/X98xamfCRrA+e
 Em0HTlDLVa5SofxPBAjWk3pQ9YA3/xTRwA4Kqc0NYKotHkwW+RqX082cciGGRPgHdsZr
 Zn2Q==
X-Gm-Message-State: AOJu0YwfLm+SdI7svkioZeIbx3qtIunsbTezjuLmZBXxxoLegaGkU/nd
 Q/X9PTnj2TRiFFgyC4SFiCsN+mLvuFmOrNukHwZS0DCBxmWz+9DSClMfSw==
X-Gm-Gg: ASbGncviJeyj3IEDAN0oqbrxnasQZ/ITmqm/mUqb22fEYuIYfYdbAT9IIn+rgC68Kx5
 oE+0InTky+iWkRvPS62ne7oVCVBRIaaYGl5vtVRNsb8tLb66qLw+5OqgFZBZ5L8UJ7txI9NGjvB
 bpjMczmE97xFPDEjK4AWS8+qghPR4YNWRequr6m4DBvf+AQpwWdEA1EAWTpPxYEejqBlLMKzwxw
 OeHon2+zUHbuoVBCqqh4K4Yn7R6SWs86Hw+QjHu+93PbhnbQcMmXMcZOLHr
X-Google-Smtp-Source: AGHT+IFbhcaPC0sg5CK00m3A4a98Brt2L1kTiLWXeHV6WauIzMLFkvBeY1PTZbKWFP4SRNdKIXwi7w==
X-Received: by 2002:a05:6402:5213:b0:5d0:8664:9f56 with SMTP id
 4fb4d7f45d1cf-5d63c30bb5cmr16228070a12.11.1734408887159; 
 Mon, 16 Dec 2024 20:14:47 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652f35859sm3842428a12.72.2024.12.16.20.14.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 20:14:46 -0800 (PST)
Message-ID: <6760fab6.050a0220.1d6666.d554@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 17 Dec 2024 04:14:46 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734408887; x=1735013687; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Co0uX+6vMDwRijVQ5KDnLyF7JJfJcFvT91I/a2Tc/Pw=;
 b=cTFlNy0/lNH34N8Xk4rOPlOeKnKB7IAaErnE+jFzdabUdorobzGKjwEckrUKd40Fg6
 mbuRXgngg5pTwQsL1oV8g7GT5bMMsO7hy3uNp3R7y4qniGZGGajOfPu4uMKAjaXx7c1d
 2nlYl/LVeapgdOlOkJMp1OsgivReUVbdRZDRkTXwASwHQDjQGBteUtGusO/71aB4Ui8i
 ZSbF5Z7NVnevTAU2tUYBtVh+venal5Jd+XS6kchb8zDHNbOq5FFJns5xLeICNRXEEkNU
 SfTBDyG6mMjY3TXkwqfSd4Lj2vViAZIoQAclwXMsikf5zBNJgefE/Ps5yBsSukJL5G+1
 rOyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cTFlNy0/
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-16
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

Autobuild statistics for 2024-12-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  4  |  0  |  8  |
  2024.11.x  |  4  |  3  |  0  |  7  |
    master   | 19  | 74  |  1  | 94  |

Classification of failures by reason for master
-----------------------------------------------

           at-spi2-core-2.50.0 | 4 
             batman-adv-2024.2 | 4 
                  ntp-4.2.8p18 | 4 
                  curlpp-0.8.1 | 3 
               postgresql-17.2 | 3 
                 c-ares-1.34.2 | 2 
                    emlog-0.70 | 2 
            gettext-gnu-0.22.4 | 2 
httping-0e26c53d5fe504eb720... | 2 
            igh-ethercat-1.6.2 | 2 
                  linux-6.12.5 | 2 
               linux-pam-1.6.1 | 2 
                       unknown | 2 
                 agentpp-4.6.1 | 1 
                  assimp-5.3.1 | 1 
                    azmq-1.0.3 | 1 
  binutils-arc-2023.09-release | 1 
                   bullet-3.25 | 1 
          cryptodev-linux-1.13 | 1 
                directfb-1.7.7 | 1 
                 erlang-26.0.2 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
glibc-2.40-18-g564178076272... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
            host-binutils-2.42 | 1 
    host-python-greenlet-3.1.1 | 1 
              host-rust-1.82.0 | 1 
                  libnss-3.107 | 1 
                  libsepol-3.7 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
           libzenoh-pico-1.0.4 | 1 
               linknx-0.0.1.38 | 1 
          linux-5.10.162-cip24 | 1 
            linux-fusion-9.0.3 | 1 
        ltp-testsuite-20240930 | 1 
            netstat-nat-1.4.10 | 1 
                nushell-0.96.1 | 1 
          obsidian-cursors-1.0 | 1 
                 opensc-0.26.0 | 1 
                   pcre2-10.43 | 1 
          perl-net-ssleay-1.94 | 1 
                 pixman-0.42.2 | 1 
                    polkit-125 | 1 
               procps-ng-4.0.4 | 1 
      python-autocommand-2.2.2 | 1 
rtl8189fs-9a82349c2c40515f9... | 1 
                s6-dns-2.3.7.2 | 1 
                   sdl2-2.30.9 | 1 
                   strace-6.12 | 1 
               tipidee-0.0.5.0 | 1 
               valgrind-3.23.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/c9c4803068b36682dc3772bf3fad27f22265a8f4 |     
    i686     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/a698d2573f2569d1614858409e9c7edb6c86ee8d | ORPH
 aarch64_be  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/cdb0f4293982b6cb5f6979a48b2f4b32d48bb931 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/5d30ff480919fe2dae3010287b7330c6f9a9ef89 |     
    arm      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/f64638aa03c57f0f9a1cf0de7af349510f787256 |     
   armeb     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/45c3d5c30e7614c30aafe1ac500a4b55c5ec3175 |     
   mips64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/e9d197ddc624ec79a100226522fea057da6826c0 |     
   s390x     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/dc42333f11c2b5b665dedcb3a0904297524d80ab |     
   x86_64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/517e67e840149d2fd0f99760092d42e7dbd1cb04 |     
 powerpc64   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/16d8ffd4d3f43f7aaa7bf4be492e37eac254fe24 |     
   xtensa    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/3a5ac183f8cdeccc9240d3b3a100ced244929211 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/42d748339e056ce220473cb6dc94998cfe972d19 |     
    or1k     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/c39522c7df5a0e346ce535647acedbea698e4a79 |     
   xtensa    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/2f002047087c59afbcea4375a0db780b9a4949ea | ORPH
    i686     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/51b40f16036b9ea898feec3226cdfda89608ef3d | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/6ddf8905007f23f777a8ad218d2e50e1fd5aa5e3 | ORPH
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/f02066dfed11ea8d6f39405f1c213547fb5a7eca |     
powerpc64le  |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/efed719c08596ec03ff3cba21077fc2d255b79cd |     
    mips     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/cc5a3e30d9dcaca7e4ed66d785e2a03db094ecb7 |     
   arceb     |         directfb-1.7.7         | NOK | https://autobuild.buildroot.org/results/c5fd2fb23c91477b56b9421364cea65d0131d270 | ORPH
 powerpc64   |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/e9bc4730e1e46333b663619d52a21be79a83c36f |     
 microblaze  |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/ce80ba810cfb89d27fa830f6177a8309b772e049 |     
    i686     |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/91d2771e14ed3c1e5ca009afb3ba69a5d84c0ab5 |     
   s390x     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/00fda1966db7c0ca96c2baf23b9075738f9565a3 |     
    i686     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/73bf090ad999d7b7aba1f8e48db7a4c16439d4c7 | ORPH
    arc      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/f892b8af607b7c55c9188272aedbf117df29f085 | ORPH
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/b3053f8bf2634c9c2c44ffbc9a34046db506a464 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/56ecf6c1c79ba82a87e80e7ac8d923eee6b08fc4 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a775fa3c073e2de8c359d5bdb41de2c9dac72c19 | ORPH
microblazeel |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/1a1347b575d0be7a605923dce19c117e6e5d4025 |     
 microblaze  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9145fe12822d10b4225e84c15b8feaaf7672c2ff |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/38d831b5ffc57baac78382afd6c75ce855617d1d |     
    arm      | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/f621d5eddb38f5b14de307280980b771b85e0bfc |     
  mips64el   | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/ff8a34d64b2460dc60c60e89cec09f8792fc7ab5 |     
   xtensa    |       igh-ethercat-1.6.2       | NOK | https://autobuild.buildroot.org/results/b949342ae10bdcb5d21d8689c22cc1ea4e3602fb |     
  sparc64    |       igh-ethercat-1.6.2       | NOK | https://autobuild.buildroot.org/results/acc49b1015543b4f23f1e27a0512dea53a96633d |     
 microblaze  |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/aa562b41135f12eb9fc0840f553eeb7a4555674e |     
  riscv64    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/cc2ecf73110c48faff14d119fd4751967c4c9001 |     
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/de1fee18fa2c88ba010681264e697b8f363273df | ORPH
    mips     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/05f2a697a8637c6e1977992f43ea3dfcf557aa6d |     
    arc      |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/2eed9f4069d774cebf38251b6f4e7893eab52652 |     
powerpc64le  |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/6b8371253ea241957f87021201a4f04e4db8d17b |     
   nios2     |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/acb578b014be797e874710345b54125c4c9b231e | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/5dc0af37f7dc54466b83c455704febc3e39bfb86 | ORPH
   mips64    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/b4807d78a0cd949446673aa296e73f874e0e0b17 | ORPH
    mips     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/089b43ef05d3e614d367528f22b6fd9ded65f283 | ORPH
microblazeel |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/28a0a329eef4d8418c82cd55795d8c92f76edc91 | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/1c1d250a7021bcf92605eb0fac2814a0b144f091 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/6c1589e50da5ea8e860b7dc770cd819a57e014f2 | ORPH
   x86_64    |     ltp-testsuite-20240930     | NOK | https://autobuild.buildroot.org/results/cf151beb4ee45b3efd1c844df5d3b3e13c9480a5 |     
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/2286b8e9174501702b35c35694e1818ecfeb99da | ORPH
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d06758e7e1dc04c4e41227f8e97c97b5ffa5daee |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ce45e5bbc441cbbb8ea9749684b092e407a8f11a |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b6c3fdb86463db769d1198d4c187545132cd2383 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/978abc93ce168af663384eb59565853a4ee6f1a7 |     
  aarch64    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/796a96e7c0a7ad3518f49be9b8f572ffb89e9fc4 | ORPH
  powerpc    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/06633ec822c4b9eda5983fd16f52c2affe460244 | ORPH
   s390x     |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/ca51b3e8e3ac83e2a69814caa84d9862385b956f | ORPH
   mipsel    |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/1a5ff1901ee7d1e17435858fb42c22a71f1ad840 | ORPH
 aarch64_be  |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/d57a80bd67f81c5ca3c4e2230e830d45175d0917 |     
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/7ab03320fcbf497c5cc22b3f675fce9511ecb226 | ORPH
    or1k     |           polkit-125           | NOK | https://autobuild.buildroot.org/results/38c2ee316caf63a6b28c0e8b00772340d93da70c |     
   s390x     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/994e6433572899e853f314a9f3fecebdc7a49c7c |     
   nios2     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/989795f2d0abd98e82db4f410d3c7092bb008a53 |     
   mipsel    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/75fbb48f9f6222848146c6ea7b651da644219c03 |     
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c85b352e7d4c3528e188cb431228bd8e72662a81 | ORPH
   mipsel    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/431f98fc56167c72cc406b0cb7d0ee0f7caef6e8 |     
powerpc64le  | rtl8189fs-9a82349c2c40515f9... | NOK | https://autobuild.buildroot.org/results/ce7ed15c71a20a2b7ce78f0918753d03c6956986 |     
   x86_64    |         s6-dns-2.3.7.2         | NOK | https://autobuild.buildroot.org/results/bc6eb9a4902d673406346b55c0fb21a18201b029 |     
  sparc64    |          sdl2-2.30.9           | NOK | https://autobuild.buildroot.org/results/43ffe27a59a113dc54e42e3220a4989bee20418d |     
    m68k     |          strace-6.12           | NOK | https://autobuild.buildroot.org/results/0ee8f7c179c39b0e1d2a33fde9039daa9c90ba61 |     
    mips     |        tipidee-0.0.5.0         | NOK | https://autobuild.buildroot.org/results/5c138e9f181ea1cc577dd780d3c52e11772045b8 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0af38ca3cee24037ff81038a7171e38fe78d3b78 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/9c9c62f62901bdcb79926043e761d251485ab210 |     
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/e88c56b0c69d472c81198a68670c9555c27dc54f | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    bat-0.24.0 | 1 
                    flac-1.4.3 | 1 
        host-python-lxml-5.1.0 | 1 
                  linux-6.6.63 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/1eec9c9bdcb126cd4460ff9f6a0b78d24bb7bae2 |     
    sh4a     |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/0792721f4f7ec7a5cb29c43c59db49a45df35145 |     
   mips64    |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/726d961e2b39a96c295273af406a940db362e9f4 |     
    mips     |          linux-6.6.63          | NOK | https://autobuild.buildroot.org/results/333fe6b55f1cd83a6c4cd1c8eac217ebd550b1c7 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

      python-autocommand-2.2.2 | 1 
          python-grpcio-1.67.1 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/12a02f2cb8e7411986b85f4156871e8a1e7f93c7 |     
    mips     |      python-grpcio-1.67.1      | NOK | https://autobuild.buildroot.org/results/bc17a742be8f63811f111047a0453c6ee71df7b8 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/710b1b167f40500a8d2a17b0f0977b5b06f4f262 | ORPH


Gitlab CI results for 2024-12-16
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648487321  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648489544  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648489546  | ORPH 
                 TestGawk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648488547  | ORPH 
              TestGnuplot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648488613  | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648488123  | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648488212  | ORPH 
...yfsVarBackingMountUnit | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648488241  | ORPH 
...nDbusbrokerDbusFactory | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648488308  | ORPH 
      TestLuaLightningmdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648488847  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648488857  | ORPH 
           TestPostgreSQL | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648489030  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648489033  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648489054  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648489135  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648487498  | ORPH 
         TestRootPassword | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648487571  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648489214  | ORPH 
                   TestXz | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648489220  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
