Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8FDC5B552
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 03:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04B0A615F2;
	Tue, 10 Jun 2025 03:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1w4FLj-_ys-R; Tue, 10 Jun 2025 03:15:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EF99615FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF99615FD;
	Tue, 10 Jun 2025 03:15:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB4011F2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 03:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD48C40836
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 03:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLa9rxeNwCkz for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 03:15:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C0DD40773
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C0DD40773
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C0DD40773
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 03:15:13 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6069d764980so10997411a12.0
 for <buildroot@buildroot.org>; Mon, 09 Jun 2025 20:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749525311; x=1750130111;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aQaWIGF+GWQ/2vlA7UJC6yG/tAB9MhNQqFEdsZ1gPoY=;
 b=GX/5eZTwdV0cCtiZ0nOT8aXDE5tiT1ermX8NiDgsGbBCNBLrmmC6HjBLkbyzOLkDH/
 hYrvIjiRBQuC2otHzNo7FTD2lyRmPFhVqnSURkWefDndhT2Cah+fHCQ5tM8IgEeG8Kp+
 Zd0aDsvxFLXO55+GarvtNZDDBzjbCSbHVcMSyLU4dBUor/1E5NKrP4LigadDUuvKQNhO
 QoyNyTNg1k5STIBhcXLu8U9P0UcruKMknF9vMpq5L5saqUKi2KCGsMiFusGg+pZX3+YV
 wMtCtWP3AbIqKT8FDrNt8Myf89RKU7BaWAXeyjDu1PCjFV/zaYUoMJM9Div4EJJLSGIL
 wP/g==
X-Gm-Message-State: AOJu0YyJ34ggRdnfgq3wF9ECzYtkqxCqceDu43NSJWjM7tCHj1237uin
 tIyThvzEGpZ77vsaeXUJYhMFITINZiMgObBGl3efyM+5SV69cxjAvdUYdLKN/Q==
X-Gm-Gg: ASbGncsr2tvJhSUCMIJdRduq1ze1n6jvPnh1X27YviHBsFq4G5wrFPP4TzSmDqtTFrl
 bvAiBb2e9weBBWBl9MSftD1xEs9CbASLkBi1fDbI2Uh0/vcArxO7nbV7M5TbIUC0RjGblxITqAs
 cXKjJ9Ua5fu1M1zN/OaL7+xe/uaaxB+ID3FLN0o6xj9BI4ZnZwhIumQwkOsQF6D+hF712dpNBsU
 Blonoj3gdBWLfMJts59WwOqTsyqQmvcMjmc5YC02EpRR4T9UYb2uRJY3yruzzpNXnjXM4+jB3P6
 DoKYGTMML9FcjstBAA0c4kfe4Ro8fKZDB20IfxcnXqJbmqJ2mowxrtvGJc4YrOWM0A==
X-Google-Smtp-Source: AGHT+IFOgKv1dMDT6u6wsCUSELkVqSfgvecuwr356HfAHmh7hvlVoKSDQ7PP133D7bPybpVMFjG2Rg==
X-Received: by 2002:a17:906:d54c:b0:ad5:a122:c020 with SMTP id
 a640c23a62f3a-ade772a6f14mr173925866b.16.1749525310444; 
 Mon, 09 Jun 2025 20:15:10 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc77994sm646843966b.148.2025.06.09.20.15.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 20:15:10 -0700 (PDT)
Message-ID: <6847a33e.170a0220.342a38.001f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 10 Jun 2025 03:15:10 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749525311; x=1750130111; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=aQaWIGF+GWQ/2vlA7UJC6yG/tAB9MhNQqFEdsZ1gPoY=;
 b=Qxzb13g9+7fsbCd9qjnztvluD50U8WKDGZsXubXMvZPSglotnY6Fh7wc7gXW2E94/9
 NZinMk7+/jkvp6Tay01ToCKJCLq3WHHEN6n46rMJANkRNSTc/44xYVcZcSDPcYvPAKTE
 nHLxfCKAFLtMACx2EQ6RXHsR/9dtpUYMvyowrRX3YIMIpq7UpejAr4HGFHRdt3vYxu6u
 xd2iShHvKoqoD9K0MI/SUVS8oEAtTLhkSm48Z1Y+jUb9R5F4Aw1nVhRYnHYcUYKcdylt
 S+HcRK3mUzhX88gEKApfvUmHmhBiplHyWvBVEU2K3elKESIdaMV/4JIFRX7RDLTijf4r
 Kxxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Qxzb13g9
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-09
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

Autobuild statistics for 2025-06-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  5  |  0  |  7  |
    master   | 16  | 489 |  0  | 505 |
     next    |  2  |  6  |  0  |  8  |

Classification of failures by reason for master
-----------------------------------------------

          host-binutils-2.43.1 | 66
host-gobject-introspection-... | 60
                  bcg729-1.1.1 | 33
              libselinux-3.8.1 | 31
                    bmx7-7.1.1 | 20
                elfutils-0.192 | 19
host-binutils-arc-2023.09-r... | 17
                       unknown | 17
            host-binutils-2.42 | 13
          host-oniguruma-6.9.9 | 12
                   avrdude-8.0 | 10
                  cjson-1.7.18 | 9 
               bctoolbox-4.4.8 | 8 
               host-vde2-2.3.3 | 8 
         host-mariadb-10.11.11 | 7 
        host-berkeleydb-5.3.28 | 6 
                   perl-5.40.2 | 6 
                    yajl-2.1.0 | 6 
                 apitrace-10.0 | 5 
                       cfm-0.3 | 5 
              libebur128-1.2.6 | 5 
     linux-5.10.162-cip24-rt10 | 5 
                 linux-6.14.10 | 5 
                  ntp-4.2.8p18 | 5 
              libopenssl-3.5.0 | 4 
              mariadb-10.11.11 | 4 
                 netsnmp-5.9.4 | 4 
amazon-ecr-credential-helpe... | 3 
                    azmq-1.0.3 | 3 
            gettext-gnu-0.22.4 | 3 
  gobject-introspection-1.82.0 | 3 
host-am335x-pru-package-5f3... | 3 
                    mpir-3.0.0 | 3 
                 openal-1.22.0 | 3 
                  bcusdk-0.0.5 | 2 
             berkeleydb-5.3.28 | 2 
             dahdi-linux-3.3.0 | 2 
                      dht-0.27 | 2 
            host-binutils-2.44 | 2 
                 host-gdb-15.2 | 2 
                host-odb-2.4.0 | 2 
               host-parted-3.6 | 2 
           host-squashfs-4.6.1 | 2 
                 libmbus-0.8.0 | 2 
libmodplug-d1b97ed0020bc620... | 2 
                 libsoxr-0.1.3 | 2 
                libssh2-1.11.0 | 2 
                 samba4-4.21.4 | 2 
                  snappy-1.2.1 | 2 
toolchain-external-bootlin-... | 2 
          aardvark-dns-v1.14.0 | 1 
   azure-iot-sdk-c-LTS_03_2025 | 1 
  binutils-arc-2023.09-release | 1 
             bmap-writer-1.0.2 | 1 
                bpftool-v7.1.0 | 1 
                  cairo-1.18.4 | 1 
              cannelloni-1.0.0 | 1 
               catatonit-0.2.1 | 1 
          cloudflared-2025.1.0 | 1 
                espflash-3.2.0 | 1 
                 expect-5.45.4 | 1 
  ffmpeg-n6.1.2-27-ge16ff06adb | 1 
                    flac-1.5.0 | 1 
                flashrom-1.5.1 | 1 
                      gd-2.3.3 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
         graphicsmagick-1.3.45 | 1 
              graphite2-1.3.14 | 1 
                haveged-1.9.19 | 1 
       host-gcc-initial-14.2.0 | 1 
                 host-gdb-14.2 | 1 
                   host-go-src | 1 
              host-json-c-0.18 | 1 
            host-libp11-0.4.12 | 1 
              host-rust-1.86.0 | 1 
                libdrm-2.4.124 | 1 
               libglib2-2.84.2 | 1 
                 libiconv-1.15 | 1 
               libsigsegv-2.14 | 1 
              libunistring-1.3 | 1 
          linux-5.10.162-cip24 | 1 
               openblas-0.3.29 | 1 
                opencv3-3.4.19 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                pipewire-1.2.7 | 1 
                 pixman-0.44.2 | 1 
                    polkit-125 | 1 
               pulseaudio-17.0 | 1 
                python3-3.13.3 | 1 
        s6-linux-utils-2.6.2.1 | 1 
       shadowsocks-libev-3.3.5 | 1 
                    sslh-2.0.1 | 1 
               syslog-ng-4.8.1 | 1 
toolchain-external-codesour... | 1 
                   trinity-1.9 | 1 
                      x265-3.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/d16b634ff1c295428e64f3a0a1aa0327a66857cf | ORPH
powerpc64le  | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/21f911695ac0f30b93debcabc6def2c06d212e3c | ORPH
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/c35114e4aecf741e7bdfa7850d4b27a7f6ff50eb | ORPH
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/4cf1a18d366c3c52fb661ccc91f9478c4af42ab7 | ORPH
   armeb     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/198294fcbaa88100c72119bc82806f737ebe9aa5 |     
  powerpc    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/6660118c53173080c4b0dc55c1cf0d87e3105b7e |     
  sparc64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/c6f1855f4a2772133e0777d4706cadc5bbf60d56 |     
   s390x     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/db691a7a230f53ccc7a324fb4e59e134eafb1048 |     
    or1k     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/183328ea58e6ff50bbf0ff1ecc9fc394e803d584 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/1b6dd460d67c40f6d53afde198a4169169efc713 |     
   sparc     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/64218bb8a6f266da5cd8afbbcc12033721f5e87b |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/7d1fc5ea43d9ac87440c3bbd75838517db3a3939 |     
  powerpc    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/e31a3f45e33e1e0ea2080f64185c72e0df7f0c0b |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/0b5adadb3e779d4e9218dc5343a04ec645006ce7 |     
   x86_64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/ef2573080e7ab73920e77c90a5ec173854aaf8e7 |     
   arceb     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/6a5e5ae4b7f7670316242f07caddd6bb989584fd |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/57fe883038ba0dbe771cd14ad46cd34c305e5013 |     
  powerpc    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/c470def09f900963946bc43dbbdb65a4c2a4d1e3 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/b4e2c6cee5ae50fc09bf1cb45791c0effe110639 |     
   arceb     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/8239df540daf069731e9d8ff0f4cf8fecc152171 |     
 microblaze  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/4a472c59d572d0fecc4d808aa71da1d56b58898c |     
powerpc64le  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/532ee2a69dbfef1bffa452b6faf9a898132499eb |     
 microblaze  |  azure-iot-sdk-c-LTS_03_2025   | NOK | https://autobuild.buildroot.org/results/814149545a841995cf0224ee63b65dba87065ff6 |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5da6a043955cb92b8b824646d9f85056383a481f |     
 aarch64_be  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/8f60a29885cd116a6cdd22e6f59997e5125ff84f |     
    sh4a     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/62049ff142e28661bdb6c945f6b378d001700a85 |     
   sh4aeb    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/18bc6492473f17cd92a5ab6d1a0d164bd56249b2 |     
    arc      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/7dc166877f41b4104937321f860b286d8128e9a7 |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/d4fec045453ab5dad2ca13b8b8e76ffaaa6c3e8e |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/a52a4293dea9013537022b59e154f3442e9f678a |     
   x86_64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/990c4a42005b3d6dbbb83f684f5df3473eab693d |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/3ae4c140a5b83edea686e8798a5417a8949bc0b9 |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/ead10c1111753aa00cd7fbb62e37184b306a48c9 |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/a158ab5ec5438fdd2c9175c35dd1ea9065f0c612 |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/84f91e9a9777065a1a287091f08f3ab52fd30743 |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/4863e1e7e3c3c94bb5cfa6542195166a9a1cb941 |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/ef468b65a945acdb171336c9948d398b2d27ee48 |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/fdbac8a1ac92d266aecf95db2b8c9cc3acc74876 |     
microblazeel |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/6433c3de1f35323a844ca380951f78a7aac2338d |     
microblazeel |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/2272f01e2782ee8cbf79e328919e7349bf929605 |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/a55d68e4a20857d945755ea38dd2ef963b756e9d |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/2281d737f9ce47dc3ea8e9fd540d8b7cb687e7a4 |     
    m68k     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/c2d65448ef5ca3ed2511c8c098165815bcb5f696 |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/48163ccb6ab38205008e091d78a4544939ca4370 |     
    sh4a     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/63ed291cace712937963b02f58beafd6ecaeb14a |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/42864bb3ed529b90422bdcb3c1e48460c88aa7a9 |     
  powerpc    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/419ca13d0ca2275a36f1c23ef755b176529da760 |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/f097b83132a1cf414bd05c8d44feee0765385751 |     
   arceb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/0aff19c5ea84bbfc8a9d8cfd06181a19ab430771 |     
  powerpc    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/1788087b945876101beb1874fd7fffaab07fd734 |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/be5578befeec5930caf7feb1b3ac1951cdcab3f6 |     
    sh4a     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/74a04d9ce7c964bf858aeb854f018896df838125 |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/c2787b0732bb116c7c9764bbc384f644759f2ed2 |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/7fb0fc01aa8fa4c185eaaaa4983f1ba3465170e1 |     
   arceb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5d501818913183282acf0f90a52eececa0c1b61b |     
  aarch64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/f3581f9947da5d7671ac6931cb9ae9934c05cb31 |     
    mips     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/bf760eddc99021e84dff86af22c15201bef01b94 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/530f4ff6614509d2b01cc97b0a07ca3725f4648a | ORPH
  riscv64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/05db0b309131ccb016a801794ee0ba763baa2b94 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/77634faea2a5c5c2d8e4b5ea19eea5e3bdbbf86d | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/8f4dcab6a2bc3faecc1a90494e18273480d92fca | ORPH
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0304c74190771dbe20a474760361f09582da9ba1 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/14207fe18dff6b8583f3c2c9aef4a0d10b9e95c2 | ORPH
   armeb     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/fd8c99e0214e6c69f4bfc60178b61e7469d76c4c | ORPH
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/133748a0eefc8e809ca7666161b62865364498cb |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/e6931be5f4bc41d67188120c90589b8df7d56fbd |     
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/bda9cfc9af4c8dbcd9a41eb83c7524ac5a2c6cb6 | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/3abefbe38c976f2f8102e53940fd44fca5bc5174 | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/4237b495ce3bf9fea19f68d85a1056f43cff179a |     
  riscv64    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/dfe03011bb20df68299a267a6ff6766b1b5445b9 |     
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/3f1b38adb5009f7fb0cbfa07f3ed07251c98da65 | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/36045c0ea2dec0d14dfe9bc94dd64da6095801b2 | ORPH
   sparc     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/ac447fb55798342f517e5d11af06309471b2a6b9 | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/1e09755b53bfbf6926570216fd00d40d0729f2aa | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/effa33b554110f4898f97560d4b9c8c05bbeb969 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/12eb1c8d5a8a6a52216cc5b87d9b0e7344cde1ac | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/f61860a6dfb582c2c18bf7bd0982457aee4d25df | ORPH
   xtensa    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/c30c4894afe3ed076c000b8326bb3f3bb6587014 | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b826fcc1b681bb5c52e73bc6492610ac37a52100 | ORPH
  sparc64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/dac1c99e0bcac89e10adf128ddf1df5a1bb327c3 | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/4abce48b1a18de9ec89c4114ffde2f705ef6b924 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2a028a8830e94573a6ac5df62c9b07d92952674c | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0903f57232d0e4a30be313c6953612c3ccbfec6c | ORPH
   xtensa    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/12636f9b9636233885c434b708663cc826d83d17 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/189c9c08e988c51bf915cf0bb8609c142187e254 | ORPH
   sh4eb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/6c36208c2edacd6c62df3bbe0f88fe60e17fd8d3 | ORPH
    m68k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/51eca1ca9ba918f74bbb3ce4734bfdc9ada4469e | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b2207ea5f327496e48d99381448ee50a7341a504 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/47c9df3319af7ca85e43f9afee8558a29403968b | ORPH
   x86_64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/a9327c89da51cf6b1efc6fa0901d1c024eac3b9f | ORPH
    arm      |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/4d5eaf700da82526c6ca82c726b003e347315176 |     
    arm      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/693c541e98ffbeb790bccfc886321d3669d3f094 |     
   arceb     |        cannelloni-1.0.0        | NOK | https://autobuild.buildroot.org/results/87d5ab39a84c51f340875ae365d4f39439e81645 |     
  riscv64    |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/2b56a6c353ff925b5daaa6c4f2e5aa5c80dc802d |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/4d0b1a2c88689df3ba3b295980d1cfe3b2f57a35 |     
  sparc64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/a15f49aa49d97c7f71af44f96cf72637982584b3 |     
    i686     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/06eef3ddb447807871f18d50e4cb17b732a06566 |     
    m68k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/0613877e46f8d2b37a54a84fb74bc9249f2a2282 |     
  aarch64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/441d9cdfec0294af9587779991f0acdfdcb6710f |     
  riscv64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/4619f11cd845697eb5e9d64337fa670f2e11356c |     
 microblaze  |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/1d3bc93f77fa472813d62d25150037746339ab64 |     
   sparc     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/c961c73c3738d90daceb311004739873f8bfb292 |     
 aarch64_be  |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/fa09f6665e38ada902144f1bfdfa2950a17a6b3c |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/e873f860c95be87033e630273d076f7c1369f1c3 |     
 aarch64_be  |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/1ecedb610f15a41c810214832f5fc9a9059822dc |     
microblazeel |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/57f31fd72f0bd2580a8c75ad2b41d00bf8fda989 |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/54f6377c5188e647ec1628a4a3abe319b2d37b6b |     
   xtensa    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/e5104bfb347186b96757766244002f25493d86d9 |     
    arm      |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/bf47648835d9b33010b5db694b47511c2f6fee2f |     
    i586     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/898e2a343baf3f6806f89aaa6854c6371e68ce42 | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9c171d04d6398ae497b7068cdacf4ce73ae44a8d | ORPH
   s390x     |            dht-0.27            | NOK | https://autobuild.buildroot.org/results/f282bdf3e81c028ad836d66b7a70e73c44c449e8 |     
  riscv64    |            dht-0.27            | NOK | https://autobuild.buildroot.org/results/346588458d8a45ea3f1d91bd9036427b6e975f0a |     
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/83e6a8229b14c100345a67b439ea2e08e842bcd9 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/5b93aeaa0b829be5596da756899315f77d9eb455 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/5db99d63a99882b85b50c6f90c3b032a17b382fc | ORPH
  mips64el   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/8865f4acee1123fe6c8c27599ec5757ee11bde4f | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/16dd8a2f29b6a839ce6294e3c04138c69beab982 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/21036edaf5e09389848304fe92d3fd5ab4f9a206 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f377712b2bc5cc38efd8838243edb75fdb7a1724 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/bd9107e87c422e29488ad7eb96127b2e5853c904 | ORPH
   mips64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c7f5997eb92e524bf9eece36c3ffd4ef5fd6aeee | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0e4d099bfdd73a08fc24f3aba387a76f1b8c0786 | ORPH
    arm      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/5f071f7aa15af7cc58545d9e9fa88a2674ee6dd0 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e1c9821323a55f6da0c2f88e28f3bc04c1d2f39f | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e129b9bc14fd31e931968f85b44d56502385c3d7 | ORPH
  powerpc    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/784d69f6f23d4fda9c034dacbd03167792cb2915 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/29dad7590075f1d9e6d8edbc2adf7060be38e954 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7197bf1b71bcdef137ad7899877d65e12a51eef0 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/25043717646b6ed08d090e2420089d41a6f50ba5 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/dead63c99b69845f13f6de9e66aab72bd7757ff3 | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/28fdccc8b08158946397768ae39651d781c68cc8 | ORPH
    i586     |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/bc3fd6371d5755e51b42008957bbb903aca4d437 |     
    sh4      |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/e7f19295e7598ec42e32a3b472c0938a91c2186d | ORPH
microblazeel |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/41848d636e8a4dcc12bc4dc8639c563f8e4331d5 |     
    sh4a     |           flac-1.5.0           | NOK | https://autobuild.buildroot.org/results/fe1c3bc1b021b969f7f5e9781eba8f37dda43a00 |     
    m68k     |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/a679924c48ce2fe4ebc939d26973b844f0f2ab41 |     
   armeb     |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/14c5557f384825359e5298abb8972d113bd2c524 | ORPH
   xtensa    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/23a115877d780da5ee601b62d770610437fa132c | ORPH
 aarch64_be  |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/5375c4ec3cfb2180232aeb76aefd9d1df2874ccd | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/7cd31f3c019c7954f9e0eb17c790a3021ae93d02 | ORPH
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/daee16c35201dd6bdda5c50238cf3ed1265f0545 |     
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f6203875ba406a27efc8f335b56e4b6787c2ff8c | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/c1c94316aecd7471cde0d98ef8d35b5be14d0a75 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/2501c2ba1b97daddfca7540e65fe9f5ee1e86eee | ORPH
   armeb     |     graphicsmagick-1.3.45      | NOK | https://autobuild.buildroot.org/results/0ae1d775b9ce9ef6d9daa93609d9b10a0e2f605d |     
   armeb     |        graphite2-1.3.14        | NOK | https://autobuild.buildroot.org/results/d5fd62872665aae319f8fb08d0aeeb7b32a7abae | ORPH
   mips64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/9c5d7e48fe0350a4cd47406dec049a558cfc12bd |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/8e75f4931b11b76ba5ee40920067bae9949f88cf |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/a25228b31ac232db2f8ec479ff79798954c30518 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/6919059ac82f50e71b6395f43c462c1bcbcea262 |     
   armeb     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/9cec89dab5d38d5d5ada5dccb8e0eb7a25cebe9b | ORPH
    arc      |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/6cf689960662a28ec445c9d7b959a48e94ecd3f7 | ORPH
   x86_64    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/84e1ef69a993d7ad4e322867ec0a9b3e5b070fc1 | ORPH
    i586     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/8622c7657e4987602bcb2dc58b871dc408005af5 | ORPH
  powerpc    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/f73beb91e317e5b3a6006593aecdc0dabdc82d67 | ORPH
   s390x     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/5fb7a9c4b14193a2a898d10174971b3491d0901a | ORPH
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/92a720395b4502825e6547aa7557578d848d17b0 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ea8604b9e711845698ac31cf1d7ec31971515b35 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a143e1cab3bbf6c045768d787ec8ba9ef93ab277 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c4de1cb3a870b246b23551238544469cf040a592 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/07d633224b5a837adcfe50f16916be7f88e9441d |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/80070efe7dbf4a1442bace18196bffd46b4e32b5 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a53fb40528c21064f5c82a4606aa4e945201dda9 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2ddbe67c86351aaaa19d913afd18666278119858 |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/068ae31930cee258b1155b1e85bdcec7a9e041a2 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/82f1c653427be225728affcaac6ad4b8d58bb26e |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b5906a94de5eb9c21734aba4af7523603b30bfb1 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/efbe8f4dcfa63af74c2114e549121cf88de0e1d8 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2ff0000799405225130af6a2a558e93760c46f3e |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/596e5e172b1a90f544874ab20b0575011c74855d |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6dbcd4fa30b38bc3a9623c8a820971caa911ea7a |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/abce8384bfd9f237540d9292370957ecef7cc713 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e9c1062b8c031bc3208b622c216ec2531e0b7d7f |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/010047403e151a7b854c21c0427226f443f24c3d |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/89eb3566a5968954b2a439953e7955fb4eff5280 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0b84d7c292c2874289dd452bce6233c0e7051bab |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5290150741dfb0785b9ccc8c932ab0f574d1b7fd |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5e9865ac6d7aa13bb09bf4d8b0c673392cedd1f5 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ec8ea9a911f369e6adde139e2a944bdf89f05886 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/eb58a966216ba93a6be5d140d2fe2dc158cc43b4 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1e995436f4f90dea1463cfc0c7c2db85eb5bfe15 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1b7426747f7aa605128de55ac3ab851f14c7cabc |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f4cb65695ecb0aed663fc46900455d5872303a41 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/509cf4af53967e4b0fc0715c0940115ceee7743e |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1d5b77319d94698627484b155bb06d3b87cf2425 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/21fb2ff7460064ea9e73ddab783d34d9e56a92a9 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1bd49bd1cfc0be76287bb37e57a268b048527c44 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/97c444ba38335f67911f077504cf1e1d0320bc5a |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3604be9ca5e6f143b6df773a61efbfea15cea3ae |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/413b023357176e29be95f25d0abbe3730a68554f |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f4e63c8a2243a90c96e75aad1cd560fb1a8c3df1 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/482ededf8c1988b0aa78644e486a0d2f33bdfe52 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7308ca4515f954854c63ebb85361c30fe54a5951 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/045de204161412cc3d443e623effc7e95a45469b |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ab00f5c5a2805eb2dd6bdcaeab4dfd050c047016 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4bcfd38a0ce60468f0fb757c34da45415c67afe3 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fe58355e9912793d99f87000d0ec837402c8b515 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5c171e7074855d7e33c77e4b43f9436fb4daecd8 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0100aeab7b08ab6bad62655140865bc7af1b4f11 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0b28a084d0086104bda89fadc23d82b0772df53d |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8ed6910c489f09f5f8ed48d3e9652e26aaf65fa1 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/428cc29f66bac73ba3ba3e9181ccea044031e100 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/035e698f270b495f3312488d8655fa4395c4cbf2 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c50485f7a5c60ee0c9266b271306d32af323d713 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/71a8cfa076bec59c8900534def6df3882c5397fb |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f9be11d96f2ff8e311d3747d088e09b587d0d207 |     
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b12a62f0ff6978634f1a05897062ae6cb875ff36 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/04b86ea0a9953f12ae294656da6e42a525737121 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/89d80def36b14d3fe70505ad2d8105afedfb03e5 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fa8c0006bf147a727507c0dcb5edfeee4b415f73 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f4e1c82f74f229a011807cb34c97099fa99b8ee3 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/57cbe7fa8a04f4cbb679e54679ee78cef796cf79 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/75ee5e27399aa03b5363f2ec53917b6eb44164a8 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/eec3afa76c4e541796ba6e79888c1bcddfe88455 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ec0ceba9892e008cbf14ee0ff042ee98174d83c8 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4f3df85ac4ef719e3fef50d728e34278ddfb9893 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8ff52f5eb71ca16d5e6fb1b250052745ec993554 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3e770ad66b9239c6a5327d557e9d6ecc66de745c |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fd2b8f6d1da3b7004db921c016365ccb166e9550 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e96653147e423f9e3740019484f86a18f74faeb7 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/599b9d97d9d1e759165e63f2859586abe60e9152 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/37a0f2f3721b1551bc677dde4107900836e7e337 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f8b76d8421593f664da0808be2c743114adea8ec |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c763e95d9bae945fdc60f799826aaad709a3c14e |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a0a6262edf1481eb861725746cd2a508fd6a657e |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d3492c0a1319c00d19127144b268d5ede5ebe998 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/abcfdf81443e4a8eafb7919cf3c20a0872d927d5 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3988b1dafe11578834eb5ee2c3d74b7d60e13fa4 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4a7df459646112cf1efd3020647fb64b00e244f6 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a929cc97530deff3fb94d6300565bcd6e9d365b6 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/194042ae5f0f724a9ee1e52821442159aa8421bb |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6fbcd200ab187e308c9b2ecf1a9a7751ec060599 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b9ace3e35a522d2733f13441cc24a9ec2d2fa665 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cc63fc6759e9032da3283d80c5846c65dfa7e7a0 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7eec3293d9a00d87f4b2c65e5aba74d882df4569 |     
  riscv64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/4a7003cbee4bc4ee48d6062a1179bd571d958037 |     
   armeb     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/0d538295aafab4119f78a187b21c995b512a1811 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b38e45bfba65361aa5667422ff9d0eb070666d27 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/393a1422e136d723118da3421eb6035b06739c91 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/a6049fc1f0c457c769712dbdcd867bad10414b2e |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/87ce055a4d9f845a73da2898288df4787fc9065f |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/0f232e882b432184bf3e71acf5a1b8bbb2028674 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/7f0a8528f6601b61949ba50585d57bdc8fb8886d |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/3320920dd8750dbb68c6fc47f72b0f792787b289 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/427c7411022d3ccb4a9763b31a2780675bb648aa |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/9d2632d54d1a2e1c21d7005b9a3f7c582af1ee5e |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/96e7f273674275db0665b233d3c23cc345fdc104 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b1f0e06ce16e6141a34ab9bf986451f99b56bef6 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/8127f21e2a67ff17882682654b7e67e905adc195 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d75c1e566e0d32b0d16f60e8a7f1269d99f04626 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/f4b0275986052f51182863054f23d4e7a44af283 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/8900452b3bcec911d784f1ed931a0574f1aa2d65 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c24537f3128c23ed78b2299c34a9d7b630a17a8e |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/bba10b0a3244440881320ad7486e870b55d0913c |     
   s390x     |    host-gcc-initial-14.2.0     | NOK | https://autobuild.buildroot.org/results/1b02e824e8f19ca6aef0b2eca581ad63d92f332d |     
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/362215c158ade85baaaa7aa4ea5fb0e6531f0ea8 | ORPH
  powerpc    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/6653273f61d33ac02c1dd2832622b43c4133e22f | ORPH
  riscv64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/7610bbde264f3dbf8671c46e895b28c3836f7e79 | ORPH
    i586     |          host-go-src           | NOK | https://autobuild.buildroot.org/results/14a4d1acfa20e21ea6d863da2c2c158d1e7c5e57 |     
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5bbe4484454625fef266ccfeb3b23e705046231b | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e431344d316de766dc1c7954a5f10f0b60de7fa4 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2dfffb81a8b1882b4f77f26c29fcfee589fe29b2 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/97d2a4724eb8f29065653bc55afc31430006cf4f | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/419ec0d2262d1ad4391db67244b91b0d3ae93b18 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8eb87b0f16763271d3467f62ac5425893d06bc63 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8c6fd815ddb23b051ae1d75f084d4914fb1036b7 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a07b45e1d002c38e9b7a913874c3fe31717fb16b | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/72dd44338b8d405353b4613179556d3778c25ffc | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5dddbb4bfeb2ad83b9f9eb1b91ba6aef47f821ba | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9c2abe0d5e57c3eca112a702069e653a2dcd08bf | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f94a6d0de98e69323c753ca4884aa05b0d55a3df | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/872270b01c0509f46852e43d4294e35793020bf9 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6d76539de287a870ea344d572787493211185345 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/88bf0c7946e09aaf92b2d4b3d8f11149a33481c7 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5112bf12f067cd8f932f0263b6b79e1130ca4d4f | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/60aa15976e8427b0ef0aea695e65fd9a3c4f0cb4 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/25af049c5a2dda8b6fa5832ab2df6e718c0696f2 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/141eb9b2a484257f443b88598a10ce9f56dacd38 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5b924cc3e0e16ccb685e1202e95a2092054765c2 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b17f0dc79620966a0e840ea3e504fcf5f973775c | ORPH
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d4dede6d5fce8322243946be114642cf8a9e4b9e | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ef236311a52c6ebe70ba5832ccd2ac1255804043 | ORPH
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7c93119772d4b6d63a5328d613670a927457bb0a | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0bbfe1996add690f66d7bf07813c4ae612d5e634 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f77c42d240421522170ef3d84e0a5a261e219501 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d3a47d3bad26db45f97b36b1314ae803560b8693 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8663119c691cf74a54e6e555b6600ecc0770939e | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/98630cdbe511ffd0317ba6161991f3f2204d71ed | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3c2e6a20482be031e7d35eecdfe27142c7f11171 | ORPH
   sh4eb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cf887b36e787201594d9e55d1e166e5c71af8bab | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/963ca3f4fbe903960aa8c690d6d376638b7ccdfe | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/24680ce8abdd8e1fa472fd00228d1ae3dbca8961 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fc7159e5d58e7a3a504ad5536615b7081930d258 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4353c4de0596b0be3275da4c718b71805dd9c77c | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bea7023b63a39648cee8d65dc3bf44308c36cb08 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c5945d9f0294a00cefbe550148c757dc401b6988 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ffea72d623e55f67213434505fc2f3ca49125bdc | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/af08d5c98d14a826cbc3fdabe89f4a500100d6a1 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ea0db169514ea31351fbfc1b4342ce736bcc16f7 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2b2bd5bb1436e56a947ef8b6e54daf6bce38e9ce | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c05447970ce0f0df2981c69f930a411f1a6b7cca | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3a40935815df3b7f56928ae27a699e5c3897b555 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/24b34bb0ac8721e773355f7d19e53f64898b3ce1 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/107bace616b7b12a62bbf370b119028643869f65 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a4bc45881fec9d580726e0ceb1f88efd5743948c | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/871520b63a9639bbde3efd6481c1f152001ef0ac | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/161534553633948f1c3379e1070a5c7c9f43b6a0 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ab5f31a0a397b0fa5966475b62c6ff88f58bd1e3 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7963d2bdc084683c005634e8b110a75bda84e79e | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/573cb212e98e983a7ddf59918e89038909ac29c2 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0823734112baec3eadeff2489e7b3a9665a62c1a | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/54839814af412215260133a09d16ea7b2bb5f6a9 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3316ad5361885c983e156f78ef0f6e056f0f7689 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f8927b639043c1c026de2e6213366eeff6745da2 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cce05c566b269dfd0df4416fa07e7d53fa606ee8 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/83e0353f030e2ae8ec9db9e484f6d2fa571bd449 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6a73e07398840149faa0ccec5662366d129e5baa | ORPH
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/951d5bce5745c9e370958452dc8d99bde1c95c47 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/87a64261c5e19e6fb4f2bac8acb3b40ddd7c4ca2 | ORPH
 powerpc64   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/0eb19f426a0c0f21048bcd0a857275bd4038f5e5 |     
 powerpc64   |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/036f77f7dbbe266e4367ffa818a3d842f1d56ed2 | ORPH
   sparc     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/3ea7751c80f6a9cb496c9151ac6245eda8421ff5 | ORPH
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/e98f7c5b6110a5941b91b3d5feb3a68498df0c13 | ORPH
   sparc     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/2ca8fd4d65a97c9048bdcb1eac9eb2b5dc0022b0 | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/82ebc6cd357221b2938349f6d42a26e1d1f3d12d | ORPH
   sparc     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/a2af5c14d458d2e730b633c6087d87dbf5194818 | ORPH
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/4d163abefee0ceddd8f470bbfb385dcf1bb0c1e4 | ORPH
 aarch64_be  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/0b19b9b37313933f45a82f5bca338be481a1e99e | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/2c3b4c7b7f81dc97b95941a92adc24fc0e849ee7 | ORPH
   armeb     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/695ff989b04d78ca6bc00d78d1a6aaa8c27fa36a | ORPH
   x86_64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/793c9b26bb49e569056a9178e8050d26ca97eb9d |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/a5a0d22f162e0354e6104f71ba0505ad28e22123 |     
  aarch64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/8a274cdc756e204f21cc956de6a7980af8ef9ead |     
   mips64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/be76d96ecee279f45db4caaf0549df01e9a464ce |     
   x86_64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/02b9effe6f98c1f67bc06e9aa5a73173f6345aac |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/c0920e91fcc91b0cdf9cddc0e08b5eb0da856ff9 |     
   arceb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/ffb50f0c025a6e3c57e092e863829ad8fd03af76 |     
    i586     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/355025766a2016b3d831357f01440b259ea924ee |     
    sh4a     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/3de13990b6e5e0e49b34758dff66a389cd63e180 |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/ae87ddbe80e9daa6840a4b26fdbe9e4c543c2ae7 |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/9805cb182f6461319321ccca596deac5177ba0a1 |     
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/2043dcdd77c91387e4e0714daba4ef766dac2729 |     
 powerpc64   |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/7864e96e57bb3af36430d021d7861ffbdffbe6c0 |     
 powerpc64   |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/7ff11daeafa751220e4ed6fb67ec5ed8e2c8a9dd |     
  aarch64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/6dd35bd126dff7770ddf282ad0e9fe020b55dbb7 |     
  mips64el   |      host-squashfs-4.6.1       | NOK | https://autobuild.buildroot.org/results/ecb627aaeae14d69c473224ce367c9df4266e850 |     
   arceb     |      host-squashfs-4.6.1       | NOK | https://autobuild.buildroot.org/results/fb1c8475dade62dd474437424550ed73899fe5a6 |     
    m68k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/784a8e57e52dd2d66e31be1cd1ac1c7ec4025062 | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/49fd6c5b0099f78455e0c245d704e277405c1e1e | ORPH
  powerpc    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/f0750f99b7bf32e88047ce8439622bfb8bc4ce1b | ORPH
    mips     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/7a2e7044a6c97fe4e7b73bc18b35736b1f5ac559 | ORPH
   mipsel    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/0c537adf65b0de24e944ccae3e49731b0063ecaf | ORPH
  aarch64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/517cc029b04dd88beb0befeeda4271e986040b57 | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/64f013499c939ddb60cc414551b232820f84d7ea | ORPH
   s390x     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/b0382e1780ba84f0d940826801f4cbc9164623e7 | ORPH
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/e228f4fd5877d7602ff73b7f431942df9b068255 |     
   sh4eb     |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/2133c3ae5b7d3883097456ca9a508ce489149c3c |     
 microblaze  |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/21e8675da8a472347f0e8bc63125af8d9a847ce8 |     
 powerpc64   |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/d7c22d013292bc10b764aaf5295838965236d676 |     
 aarch64_be  |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/fbeb4c68ec9d9bd09549f16fe866b74921e14194 |     
  sparc64    |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/d8615476d9076f3cc6d55a08dfea0ae7457bf126 |     
  powerpc    |        libglib2-2.84.2         | NOK | https://autobuild.buildroot.org/results/c3b320886a63c2cb7f440e6ac6795eace29a9530 |     
   sparc     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/6517b67e5fdbdc6064fc1c836eac017d047fe8ca | ORPH
 microblaze  |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/061aff07d9efd692998b4b730b17bff372257c18 | ORPH
    m68k     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/6c381bf3937f07ec978c90ba3a6606c517f0f202 | ORPH
  sparc64    | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/28b372cbcfb26226a7a1310879efe7c30ff2c7dd | ORPH
  aarch64    | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/3773f37e548daee1e16bebb293f0fb1e289e302c | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/2de132344d2de7b7a9e58000849d4ffd6c69450d | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/0d645472e0d5f6b0cfebcac13c8b96ade05eac29 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/f1c4407e3f03c54928104d09dc451953721d8035 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/9a055202e80ebc59db04835fd1a8a2148e6ae9a5 | ORPH
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/001b1517c7fc0d31d0551c2bd86c1cb8b13a78f6 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d800adb4acc4453a80f0bbd4b063f79d100d541e |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/57592ba7e37e63442bbe4402a6f8f163c196c1f4 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3ef0809c0b8406ee079c0aa68134fed3480864b8 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8690b011893a6b54359e6a22ece993bfa01b51e4 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a11e76a1374d45076b5d01ba1369c6ca7fc74886 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/28a9c79c7df6929d9a60aa46a9007119efcc1029 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5f8721db464335092fee7798761022ef5ec3d277 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ab52a54ec5e693cff9d3933b377b6575198c0a60 |     
    mips     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/bf38ccc6edf76fbd5193770bf66737ae68a89250 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/af0055def3710ee09f1dfbaef3aa61ec8b040403 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d0a8a7595abdebcdd65a14d2f38a52d72ec0477e |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2c289bfb68fa94f91cb7f0d0f616c4a905bd90ea |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8299f797e8518a7e6e04405d154d50192b713981 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/affe60b087e8c06b5329394c13e55b1eabed431f |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/deeda55f71352e9a8045742ecb57ac302cbca183 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4137e75f967233f5f67f8dd3f60ff6ade6dec4eb |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f247d85df01da0902606f382173801bd4ce44d95 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d03fb4273af5b45ded59dd1e334ba1e67b7a9f6e |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/52279d20378d16aad03652988668e368403fe71b |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c10bda749abccaed7d022715f806dd99336741d0 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8291f3fde9123910c2c6e2bdda52678ff7e261ae |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7402766b35c32468afee565f7b1ce8b195438473 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e744583881c7dd8b38252eac9fccab5334906c9b |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5f15e3fc67f33d40c0410a1970bf8f89ad5202b5 |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/40e5c6233ef627c8abafc543fc554b28a8b6d045 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/dba9f7eceeddba003af01045ecbc7903d1cd7a8b |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/adcc6361afc53e6b8c1f3c7addbba0de1cd0aeb7 |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a179bd594cb2af9f3af15119ec4c4db88b3d9014 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/fc79894b3119143c9ce902395de621db01cc4df6 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/183e640c70de43c200fb2ef211617eaf8ab4dc4b |     
   sparc     |        libsigsegv-2.14         | NOK | https://autobuild.buildroot.org/results/02d774be7df4113a94915d2cfae747fa41c6af9e |     
powerpc64le  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/912f2ada7b1d20e18b11985272a4859447f3efda |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/16d4fef0a7f92ab65346b899fc7dc8be038c3fe5 |     
    i586     |         libssh2-1.11.0         | NOK | https://autobuild.buildroot.org/results/a4db203c054d64fedf90724b4617f58ebfe6a1b6 | ORPH
  sparc64    |         libssh2-1.11.0         | NOK | https://autobuild.buildroot.org/results/8cf82af5d8bae742464f4f582f3116286a3bd417 | ORPH
  mips64el   |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/f542f1601a54962ec654816adfd3fac754bc8ac0 |     
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e593d45c002cc9adadbd671f1f17b09b64a9c793 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/34f1796f49f5858a6fd200b4cea4e327fae329cd | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e6b656a0025c1a7b268ad06435408d7b03adea6e | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/9809ace6ed4464af8ec0828feaefb9fddfd06517 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1add0bbf442dd65ecd217693d043bfdd0874e8d8 | ORPH
    i586     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f6244cde4f73f502eb84a9ee04e498ccf282aa29 | ORPH
   armeb     |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/fff043780be7b4f600d757b9220547691d47b387 | ORPH
    sh4a     |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/c6ca238fc4b4be7818129a644a145368676349c0 | ORPH
   x86_64    |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/9019de2c17663886a14487fa0145065b6ee87546 | ORPH
    sh4a     |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/7084c312e88780696dc1a783c026e2dd24ef2004 | ORPH
    arm      |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/15801c55256cf260fb4a835ff65a0a600a86112b | ORPH
microblazeel |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/97864ad34e0a1764ef4ed047e179f4dfaa6b082a | ORPH
   sparc     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/0b1c1d322668eaeb221840cca2579844333dc558 | ORPH
  riscv64    |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/e8990caaa81dd04ebf0aa6c068c5c12f2d1fc7f1 | ORPH
microblazeel |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/830a7ec18ea78f0749e066dc04bd356c4b1369c3 | ORPH
   sh4eb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/41add7ddbf925bbaf16660fb26d2a37640a1e612 |     
  aarch64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c38c7b6d86eba9c4a7f2c29330aefaf81bb05861 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/4679113c05360e3ef26aa05124e8f7eedc043d57 |     
    sh4a     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/b89f162b1382154254f719c1b22a11ad2088762d | ORPH
  riscv64    |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/ba96863c94a9cf4ce3b04dc9a4f8344186738578 | ORPH
 aarch64_be  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/5ea0b785540c5a181f60401cc66b77dd0afe435d | ORPH
microblazeel |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/a11785848aa171f4807d0da265ab7998d67793b3 | ORPH
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0415dbd280d4a40a6a590c24b63246fdd7e83d1c |     
    or1k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ceab94c01c2c676df0917a635fb666cf99967db6 |     
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e84b3d00eeeee82fd2c5197cb5eee62abcb0f552 |     
   s390x     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d5072ed39a1b6f281e24f34914996d9ad6b37e42 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3d9e430ff643f935f068a3cd8fe0e101e8ec3de6 |     
 aarch64_be  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/577a46f5ab795ff10f4ab316c0178c4f0501abf7 | ORPH
    i686     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/1c97af4077bf706af90577cdb6dd2ee331c0079c | ORPH
powerpc64le  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/846ab3af5e28c75a62b9fbd5018edcc64084f3ba | ORPH
  powerpc    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/97532d7b861642e768a9a4ef9a3c7eaf67fe4931 |     
  sparc64    |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/afe000b63ae4f6b9f5dbd1af412103c6afd250b1 | ORPH
    arm      |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/d6cde9e4f0a4925ed40a7d370bc778970708ede6 | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/4cee39bc4f5344d58468e70c001668e85ad21dd4 |     
microblazeel |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/9e24971cdfdf22fc6d0aaac480a86f3cd42be899 |     
   xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/05a7b4bc9f90e488e0eb22e05f3e1c83484fc480 |     
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/cbafdb99e77d9c4a83e3675364a8dd54cdc043f5 |     
  powerpc    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/26e8400c703bb435b55444860cb892011c9c2a97 |     
powerpc64le  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/ca2766bf561450ae26f48d3cd4db0a507ff0a45d |     
   sparc     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/c861969808579b308598dd9065d440c05b1ed3cf |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/f7347b092a5f97be83031ed83a45d90448ec2f26 | ORPH
   s390x     |           polkit-125           | NOK | https://autobuild.buildroot.org/results/73cb93b1f16eb8612677048441cf24b9547412ba |     
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/caffe481970c78a416c143838d8e99f810777d13 | ORPH
   sh4aeb    |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/a57680fad8a6e827c07861307978572ebfa9d752 |     
   arceb     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/1a8ae13cb1fb997361a7b74d032cb6e3a7d22652 |     
   mipsel    |         samba4-4.21.4          | NOK | https://autobuild.buildroot.org/results/6b7150184e0779adc35a8d9c58427565dae15b8f |     
 microblaze  |         samba4-4.21.4          | NOK | https://autobuild.buildroot.org/results/18940e2115c4de67e29fd6f618d36caefe9886b3 |     
  powerpc    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/2e294285cb6be168d7accbd1cbb854a95af1329e | ORPH
   xtensa    |          snappy-1.2.1          | NOK | https://autobuild.buildroot.org/results/0f18d1dc594ee92561e097a8c4e94be02916293c | ORPH
 powerpc64   |          snappy-1.2.1          | NOK | https://autobuild.buildroot.org/results/1baac66bc8dbff60df0e24e7616d46123a86633c | ORPH
    i686     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/3d9148d060a0d791c5169b942cdd14d43b9140a7 | ORPH
   mipsel    |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/08dee9084dbc749de1f6c0822072284ad0f5f43d |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/15f6efdebc6bf4ae78deb168086cbe3a40c673d1 | ORPH
    arc      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/e7a36a62894e773d2038823f9ced8dcd799bd8c3 | ORPH
    mips     | toolchain-external-codesour... | NOK | https://autobuild.buildroot.org/results/5f2d2de0fbd26e283689b2c187f64e8033d1b5d8 | ORPH
  aarch64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/4d71a728be22330a6925ebab27a8ce5415fe732c | ORPH
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/4361649f194f698ad0c272aba1b2e8ca9249b809 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/f6e2723dd813972bef9a0e0395efb2740caa6674 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/778ff56e1e61c1aecbaf5dfc021919ca20715025 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/a02404ab96d68c19ca2c661cb3b358178bd15001 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/79a7b53015450bf5def14aea20464cd69465d3ee |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/66e4e89bdb9e829c71eec69e47e12ac32d58180c |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/36d8b6b702ad08ab9e8a08b1574a76d385cc998a |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e8c17829f023dad66ca3db96055d27ed72ca26fa |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/d7b09fa871b397817958eb041b80a511f83fdf0f |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/6a667ff680dcdce253c35ebde1d14c205d86607c |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/a3d39736de4c1edfcc9d4fcfb3b088bd15a1015b |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/309083c3b7f525933d8033702cbca1af438f77c0 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/24b4d6ff3d35e403ff7a6c4f0cb6317e7bc2a3dd |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c9b974fe776923fef04e553fd4596a9e513f130d |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/b2117b8591d814f367fa9d4ac606d6165c09fcc1 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2b6d11f24c25f2c9a313f511f0f295b91a976e8a |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/53b0658fc10a2d3295a75fe194df8090381fd51f |     
 aarch64_be  |            x265-3.5            | NOK | https://autobuild.buildroot.org/results/c13859ec01c38b50116fd752bdd2089d1dd9273c |     
 microblaze  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/e29f5872f9bcb978a9f837fbcab2b962572278b5 | ORPH
 microblaze  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/225811cb5e65b4bf3430eef0260e7ecf65ce4f9c | ORPH
   armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/f9884a03eca6e381bcee446a6636994dbc81d8b8 | ORPH
   armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/5b7b1caa6deb46da4625fc26155084cafe9b983e | ORPH
  sparc64    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/9bdcfb74aece7de4858e8f79293d949dc86d29f3 | ORPH
   sparc     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/3d7ea1b07e8e85275be397abce8b5255042233b4 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-berkeleydb-5.3.28 | 1 
                   host-go-src | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 linux-6.12.28 | 1 
              mariadb-10.11.11 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/d01720674c022e0806430efd30a9a91c4fc3e9a5 | ORPH
    i686     |          host-go-src           | NOK | https://autobuild.buildroot.org/results/33c8535e35be56820992dac2a1c1fd23baa2ba04 |     
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0b17a3cfd2d412169b3a6d286d654572045cb2ce | ORPH
   armeb     |         linux-6.12.28          | NOK | https://autobuild.buildroot.org/results/1ab549935fb57ff09ee752d364eb9e26a4894960 | ORPH
    or1k     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/91ea32cece44f6ac539f00a9a9f39df0eafa22d9 | ORPH


Classification of failures by reason for next
---------------------------------------------

                    bmx7-7.1.1 | 1 
             casync-nano-1.1.1 | 1 
                  cpulimit-0.2 | 1 
      input-event-daemon-0.1.3 | 1 
                 lcdproc-0.5.9 | 1 
              libselinux-3.8.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2b43d0631a54d6af5bee56270bcc93af2e979f46 | ORPH
   mipsel    |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/c4a0707a74303fe042228fda94a0b00926e3af33 |     
powerpc64le  |          cpulimit-0.2          | NOK | https://autobuild.buildroot.org/results/0963cd39b0c5e45895283e9c8904d074c3957669 |     
    or1k     |    input-event-daemon-0.1.3    | NOK | https://autobuild.buildroot.org/results/0f7497193214b1c27a57c5437a0654f42b13fde2 | ORPH
    mips     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/09cdd86873abb7e4d23cd11144957e1e600b459e | ORPH
    mips     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e899e9165c343b0a4524052ff767e09348b3b382 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
