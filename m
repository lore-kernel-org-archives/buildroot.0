Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CCAC369B2
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 03:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25A4C81770;
	Tue, 15 Apr 2025 03:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgOGDcZIdA-m; Tue, 15 Apr 2025 03:19:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BAB581EB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BAB581EB4;
	Tue, 15 Apr 2025 03:19:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 348EC108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 03:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 317BF401CE
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 03:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYDT4wiVllMy for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 03:19:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7CBA4019C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7CBA4019C
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7CBA4019C
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 03:19:49 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac29af3382dso822726666b.2
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 20:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744687188; x=1745291988;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bqcnLXXR53kZqPspM+0HfFVFlWEGTO58TLo1sQN6tjM=;
 b=HRboQEJ61KWT4RGnec4cZWTIkkqcTG1ZowBCZwVuz8F/GHQSRHV/zpifu8pskKEH87
 OQ9+NYGks6O4v4P8ITa5Ey/zvf7SEKhlWIXggDCKj05pIxQ1sq2lmqDL4+hK6YhrEfa0
 +74QawaffSPauoWjWXArF61P5WrPsgYwo72ZxAa19EdyIp6FRGcRQ9+eMxtMGv2i0L2J
 GvrvAhJInpYXOdjOA7iXLvzf+FSUjYnKswCg6afH5hjLVWeeS5ZpZFfkNHS1qbU0vFCx
 19Fyv/tB9v6KzxkqE+C+CqJaRtN3nFeznTzolJVigpR2fWVRiAqTnr7SFLzyCou4nHrd
 ZOBg==
X-Gm-Message-State: AOJu0YwrI+VAOjpsHdHQP74cV3Um0DOAzI1JXQgjt6wi2CRQQJq3di4K
 xgygZ+jC9tGorBOzHTr9hO1wL/cdtqn5nlzNZBsarMx7g22iHPmW8ntZtk6z
X-Gm-Gg: ASbGncseqOkebgdqzdpfxckuCLv7QkIlY1yyrSPAd1+fEfr+lLwQzrg8BscuJ16qiyg
 1LNKuEkJ83CVvXY348epSRJmnoEVcjxtseb+oo0+8Dq+TtPaSkk7bjDCLotY4EFmUWH+K+E1UEr
 aXoAhO+NJksIzf4sd2M+8+bj0andYl6NdGGT4hhDBPNSJuRYPXUk0tCqZXWZnBGsD8s9Kuh3kbK
 /KXyh6PWqZQ++MyBaLYLHtdwpQIUTMtXnxAUd9ks/vh5d2Rv81JBuS93wJXvPtPSvhbfMmL2rQP
 hhyR7krul6MeNVo+zgUctjAwAC9MGwLPdxpl5ZLfFDOd
X-Google-Smtp-Source: AGHT+IEIwRJMAW7wXjvLH5n/f72jYiX0+8uTMj+2UZZKDnvogOVkUiMY1sSqIr9fBwK7dos454lFUg==
X-Received: by 2002:a17:906:c111:b0:ac6:dfb0:292b with SMTP id
 a640c23a62f3a-acad34e5082mr1103311766b.32.1744687187630; 
 Mon, 14 Apr 2025 20:19:47 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1bb3df5sm1004528766b.26.2025.04.14.20.19.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 20:19:47 -0700 (PDT)
Message-ID: <67fdd053.170a0220.dd210.0081@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 15 Apr 2025 03:19:47 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744687188; x=1745291988; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bqcnLXXR53kZqPspM+0HfFVFlWEGTO58TLo1sQN6tjM=;
 b=TpGIvVdUj3iH2td9R8Cj5Ikn7YuGPEF4u22WSvO7mXCi6AR6FSrRxmg+2pLbcBOfSx
 IJ0k85ud51M6zg9sX6GScEtgPamRZVx+nC+D6YlqE1t53ZBXowhQfmcMwZBw+RadK/bq
 BGz/pdR2X0ruodShGTiac9iTDbOCcvrTFhWeQSvT9Hn9TcSR17k+BP53kCfP471shRrk
 FKeAwXk/d4F9rJVBfPW5zxJ86uEOVnwtBhW4c9O70Cf6a7sKPw1MzFTWQRwYVS8kF3ak
 DF8oIf7aE/yXz5kBivFkKOCo0jURN+eg0ncQCKNHGcabYKD3Dafb5RqQww/d1v5cBno4
 O8Ew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TpGIvVdU
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-14
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

Autobuild statistics for 2025-04-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  2  |  0  |  4  |
  2024.11.x  |  5  |  3  |  0  |  8  |
  2025.02.x  |  2  |  4  |  0  |  6  |
    master   | 21  | 52  |  0  | 73  |

Classification of failures by reason for master
-----------------------------------------------

      passt-2025_02_17.a1e48a0 | 4 
  gobject-introspection-1.82.0 | 3 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 3 
                    azmq-1.0.3 | 2 
             bluez5_utils-5.79 | 2 
    host-python-greenlet-3.1.1 | 2 
                 openssh-9.9p2 | 2 
                   perl-5.40.1 | 2 
               valgrind-3.24.0 | 2 
               arp-scan-1.10.0 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                  boinc-7.20.2 | 1 
             dahdi-linux-3.3.0 | 1 
                    dust-0.9.0 | 1 
              fftw-quad-3.3.10 | 1 
                   foot-1.16.2 | 1 
       freeradius-server-3.2.6 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
              host-rust-1.82.0 | 1 
        host-sentry-cli-2.20.3 | 1 
httping-ffb9201042813c58d02... | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
           janus-gateway-1.1.2 | 1 
                 libcoap-4.3.5 | 1 
               libfuse3-3.17.1 | 1 
                  libjwt-3.2.0 | 1 
                 libmbus-0.8.0 | 1 
                  libsepol-3.7 | 1 
                libsoup3-3.6.5 | 1 
                  libva-2.22.0 | 1 
           libzenoh-pico-1.2.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.13.8 | 1 
       matchbox-keyboard-0.1.1 | 1 
              mosquitto-2.0.20 | 1 
          perl-net-ssleay-1.94 | 1 
rtl8723ds-52e593e8c889b68ba... | 1 
               tipidee-0.0.5.0 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/03d02a6e2a7e55aebd5d4fbee554b930f4bb7bac |     
    mips     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/99eb3f14dca4345d9730816bef4d6fdc6dc4a9c6 |     
  mips64el   |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/17490ace6143848ae0c6334a6a5ec1449dc19d63 |     
  powerpc    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/e6fc89f72b089919ba69af61ee05a5c562b5f97e |     
 microblaze  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/90ff3dfd4e480b2cf9f65c324f1ba63d237fb975 |     
 microblaze  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/740361298e36432eea6b3e4acb23c63891f12638 |     
    i686     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/bf239e3d651e6e4598699f0936031a36515b0a0f |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/31e258da52abaedfbd2f2cf16accbc98322d3bf9 | ORPH
    arm      |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/5b3f3eb31136203c6a8e0c41ddf43bd9596a0880 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/d656c25ec3e6d81f51b9539f6661149a454d18f6 | ORPH
 powerpc64   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/b40274c99ee3a8c1015ea4434c2b26d476bac7d5 |     
    or1k     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/cc3870d85ea41a064e09e39c99f848a2c4a336a1 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/2496c493aa9b4ff0d1437b1cb2102211ab870119 |     
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/61db2174d6955d48e4179178b1edf618ea084677 | ORPH
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/5c6d1ddec08229988f2cc85c9b3c7c952f753e3f | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/30ea34537f77c2eca803e3e16b2ed18ee6e5010a | ORPH
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/12659e368cdcc6477ca70fc6d5e2094dccd0e4cb |     
    arm      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/349b1512f8830ccd8932bee22fdc13af36c5cfb2 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/087b9455df78276198d6c47e0fa4982bdce8e55c |     
microblazeel |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/50011ccdb70810c76660c58ac0ff668ca76ae8f5 |     
  riscv64    | httping-ffb9201042813c58d02... | NOK | https://autobuild.buildroot.org/results/90947e9869bfc53565b758a763bccdffa87275ec |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/fcb12a6160bbc33c1bc1f1860768a4c6ccdc1b63 |     
    mips     |      janus-gateway-1.1.2       | NOK | https://autobuild.buildroot.org/results/161f91c4f86e8eac19d2de119e38b71be65e4b3e |     
    arm      |         libcoap-4.3.5          | NOK | https://autobuild.buildroot.org/results/8e9d0dbc18bd65756c4bb68125662d1ac5bce84a |     
    arc      |        libfuse3-3.17.1         | NOK | https://autobuild.buildroot.org/results/dd4be30336c0fa3c8d8eaeed511efd093df809ca |     
  riscv64    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/765267a7a2b825a362ba2e368d488906613d049f |     
microblazeel |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/6546a905cee7c9b88aa3682d405617f15d8208cd | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/8ae0f86a3e7d8ca6f20c4964e5a55d428ca13d9d |     
 aarch64_be  |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/09763f278182171e99f8f822dd61def5ba6bf4d8 |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/b176f9ba1e0cb1d0409b0ca11447c52ff502c782 |     
  aarch64    |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/66715d1865260bd457f48bacfb95bf19f98cf71f |     
   sh4aeb    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0974719fc4cfd8f9bbb37151c38188065017e7a1 | ORPH
   s390x     |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/72149d29549a07c914fa3776b2932093caa5aead | ORPH
 powerpc64   |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/e48939925f9329fd1a5c68b05cdf08195522b05b | ORPH
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/b0f069187a9d76bf4f83b6cd0f021fd3a66aadbe |     
 aarch64_be  |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/b98df4ffbba19f23246e029f6f76c05e4cec1d74 |     
   armeb     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/1a3079249a5a5c4efd738696b9c17657692fd284 |     
  sparc64    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/78eb526688fed21f23174835dbbf45beebd02c27 |     
  powerpc    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/445e397f00e91e0d5e0eac90eae7c0ed1d7611a8 | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/844f9de85e4d114c268ca0e054fd780e42bc3fdd | ORPH
   arceb     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/33d7ee396b2ea9c9a487d8d36c910981a411feaf | ORPH
 microblaze  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/85063c2114f82e7880d2fe89d7dc79bd34d77adc | ORPH
   xtensa    |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/a2e91a3cca92e26d543f47468349bbcef7c93994 | ORPH
    sh4a     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/50b3b14352845385bc9dffd827c4aaae25b8c89b | ORPH
   sparc     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/57ec36f40d69141b8772df4c1c4626dc5b481640 |     
   sh4eb     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/75ed988bfbc59ca0975c80d3e394a578784b60a1 |     
   s390x     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/11e10be862053e6ccf8b80208bc79ec9c5d96aff |     
 powerpc64   | rtl8723ds-52e593e8c889b68ba... | NOK | https://autobuild.buildroot.org/results/cf6f5574ddcafe9d6281d30a09930f4821d48c5b |     
    m68k     |        tipidee-0.0.5.0         | NOK | https://autobuild.buildroot.org/results/d3f1a646fc9b004f1d695d7a7436486aa0ee2101 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/da413379f660df43f06b6fc97b795fd421b02b14 |     
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/499748bb7084cbf041cacf8d4ed2ba246353cf8e | ORPH
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/07d3a5674ca1ed37ec3cf965c7b6e28e59b5b504 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               ipmitool-1_8_19 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/70a3471dbed335371ee8228157760d6a24b1fca4 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/8d4348ab68d9f21dd3105fb65f50f3ed3617afb6 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
                       unknown | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/829c03df88dc8abc8e6a7fade9d18950c3e48835 | ORPH
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/426c174950a5f4931be88ec5be01c17ce000efaf |     
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/96de79cdfa12ea01f811b3f701a5035bfaf34ddf |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libdrm-2.4.124 | 1 
                libsoup3-3.6.5 | 1 
                    ncmpc-0.49 | 1 
                  nginx-1.26.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/977b4587baaca132285562b8b44fca69109cf5e7 |     
  aarch64    |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/0acab00bfbb3f6f5982bfab3f48dc44f9d8ec76b |     
microblazeel |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/d0596e2623fd9c6def60b5781730c07ea909ca92 |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/76adbd84505a0381ade5ab5802251e12bd848ddb | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
