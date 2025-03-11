Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D03CC28B2E
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 04:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79B2780E94;
	Tue, 11 Mar 2025 04:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuubDBTUQZ9G; Tue, 11 Mar 2025 04:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9F0280EA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9F0280EA9;
	Tue, 11 Mar 2025 04:15:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E7BDEDF
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 04:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EFB56067A
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 04:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHQ-fRludUNC for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 04:15:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 829C260672
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 829C260672
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 829C260672
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 04:15:08 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5e5e34f4e89so7347790a12.1
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 21:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741666506; x=1742271306;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IFxZegaoQ9X/k73yKMBqmqhDEPthpIIUTinrPmo5Q4c=;
 b=cH5sqKgNbem58hMlVB66Udomj4oxGI2Kc24OrhLBGz5AQR97H3GjxOaJKs4tGguwYM
 9Wlv6Y6gCiVzgGuEQnd5b5YsPX3zikcNicciquohc7LoolRgJqAJs3vGUxqJ1z7irLxO
 4LE1Sc3LD4UfSZic6Uhd1z8b8VqoRkDC7gaOOq41J9m+SuGckDpKBEXPGU3fbZf0YKcm
 xnVjzv/4yoJHTWRYlir91FYFg59bESjyasCtDv3+sljArl+OwD2u3QfE23ZPJngDhC3R
 H7ZWGmPMFdztDrszflmz/YtvMzk9hRGAzhT8kbxE76X3JHC245Xph4rg39Qxok28/D0P
 QyPQ==
X-Gm-Message-State: AOJu0YySjrvDbYA/iPZ8eY8DrckNE4xw+QFLRLNxx+3HUWwmsG0Fs7Q2
 g00Gx7/aythx/bn2e1aDaKyE0okJyQk2KFVi1e1Wn0tG6TaU4Twihg7plQ==
X-Gm-Gg: ASbGncs+ae+67J7avyfZjtcFyPMSL8YL1H9OYx5tuWR8Yt2Cn6YZ/RCmwYaFav/1oNS
 NnH/rUqQKdfibQauOFKdSfjJKGFFQDdMwSV3fSipaqldH+eW5lBjRilmFQntSl96dk6AlSLv3dd
 ddC2Mk+i/gqqzYU5k+HOXIknDNwn6ZW+QFbcG3II6JEl1EE4qY49PNKtzsTsJGbvxH51h21d5Uj
 Gbd34CF3Mla+nWCGSHCH7ssr/VayPjQuvK1GNeyCiMSDxPBM/aleO43bFDxvSm/sliBuBOyXC2l
 jL4xUPgWAEoP0gJRjVM5u8BNwAW/7RS0Ei/3FClNXKWSDbDEL5UrcEdBTpM=
X-Google-Smtp-Source: AGHT+IHkCCMqETdd+wU/Nx8LWAE0BgFoOJznpJCAsA5IX2wXbQEhFZmdEwrlxWVDfWLsNTtmt921tg==
X-Received: by 2002:a17:906:f5a1:b0:ac0:f164:31cc with SMTP id
 a640c23a62f3a-ac25273810dmr1793120466b.8.1741666505993; 
 Mon, 10 Mar 2025 21:15:05 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac29b36772csm314349766b.147.2025.03.10.21.15.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:15:05 -0700 (PDT)
Message-ID: <67cfb8c9.170a0220.2f6b8c.bdaa@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 11 Mar 2025 04:15:05 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741666506; x=1742271306; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=IFxZegaoQ9X/k73yKMBqmqhDEPthpIIUTinrPmo5Q4c=;
 b=O0MJFWAJiqtULKrcEj5ymUsQdwNI3g1rZ/WT9LPmQyMUrmsZaQwkzbrK027jQi6k9z
 aSwu65Rape5o0PVTil1nESk2HBNyxx2LkN/HNMVV8IaHMVjtoa6DO2lQToq/9NpcZRou
 TpUYNS9GaX1yqyiCOFSbIVpSrT1AjjCeszEQIJ0hrNiJMTnrAcGTbwLj6coCd+s7/STH
 OVIW+39hku0DBYZb7ysJ3NsD5BcKkqgPTjU9CuSB+uKVtU6r4kPyb0LiRppUqdM6JdI6
 VM9wxWtSEHMlJ/BJbUZzZ9qDV5ZekJ+e+QhLJ2ebd8VtM/OaM/Fy0Zm8Z2iEk8DQHaqa
 3uwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=O0MJFWAJ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-10
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

Autobuild statistics for 2025-03-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  4  |  0  |  5  |
  2024.11.x  |  2  |  3  |  0  |  5  |
    master   | 21  | 58  |  0  | 79  |

Classification of failures by reason for master
-----------------------------------------------

                 libcdio-2.2.0 | 5 
                       unknown | 4 
glibc-2.41-5-gcb7f206537240... | 2 
    host-python-greenlet-3.1.1 | 2 
 host-softether-4.30-9700-beta | 2 
           libzenoh-pico-1.2.1 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                 linux-6.12.17 | 2 
                 openssh-9.9p2 | 2 
                   perl-5.40.1 | 2 
         python-remi-2022.7.27 | 2 
           v4l2loopback-0.13.2 | 2 
                 agentpp-4.6.1 | 1 
           at-spi2-core-2.50.0 | 1 
                    azmq-1.0.3 | 1 
             bluez5_utils-5.79 | 1 
                    brltty-6.6 | 1 
                    dust-0.9.0 | 1 
        edk2-edk2-stable202411 | 1 
                elfutils-0.192 | 1 
                     fd-10.2.0 | 1 
              fftw-quad-3.3.10 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
                      gd-2.3.3 | 1 
            gettext-gnu-0.22.4 | 1 
  gobject-introspection-1.82.0 | 1 
             libapparmor-3.1.7 | 1 
             libargtable2-2.13 | 1 
                libdrm-2.4.124 | 1 
                  libsepol-3.7 | 1 
                  libva-2.22.0 | 1 
                   linux-tools | 1 
       matchbox-keyboard-0.1.1 | 1 
                memtest86-7.20 | 1 
               procps-ng-4.0.5 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                    snooze-0.5 | 1 
                   uhd-4.7.0.0 | 1 
        util-linux-libs-2.40.2 | 1 
               valgrind-3.24.0 | 1 
                 weston-14.0.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/9237e47e6f9ff995e8b594a034fcabd406f27935 |     
powerpc64le  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/0b9c5f36fb2369f2a7a10b830de87382dbc321b0 |     
    or1k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/f3c4ca674aa45747945f923b26a1cf65f52dedf3 |     
  mips64el   |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/e90af48e673d329140caeedf08a6e25041d8b6bb |     
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/fa2433edc5e47bfd641d678417a8ceacf0a0f386 |     
  powerpc    |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/c1080ab2b63dd0dc0fce2dccdad2c6128ccb9472 | ORPH
   x86_64    |     edk2-edk2-stable202411     | NOK | https://autobuild.buildroot.org/results/70b0bc91b2ecc4e9f8ac6823c342dc42484902cc |     
   mips64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/72975b002df1226d85264a5bfb5c5b6bf3d650ca | ORPH
 powerpc64   |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/bea792b46844e2faafe11e550744a252fe0c44f7 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/9a9434f084c191fca05ab963a6685e8923e07343 | ORPH
 microblaze  | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/e3a57d9c534e9c60409501d9f257d991801a3268 |     
    arm      |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/ec2b8c0e2730b4498ffb42dbb7d9abd27d8e0c31 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/0ca256b99ff836a6751b1222079a05a5f14e48d1 | ORPH
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/1e673b6485edf52eacb6ebdd319610c3b818d199 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/385b002cd38b7856dafbc237ef41ab4ae90405d5 |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/3a40a041f993e3fc2d0b37676db42a7b1d5b784e | ORPH
    i686     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/e7082145156200901aebb8a76ecaad05deeeae7d |     
   sparc     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/c0aac8160c5fc8ffd9de8fc690011dc58680d067 |     
powerpc64le  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/db8ce250ece74f5cdb470d11c093ab2616b7d653 | ORPH
  sparc64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/779a4ab1d537e9f5f2fd9f3c8b9070fc5648892d | ORPH
   mips64    |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/5b6d1fa10614d24df53741bf071c89d6575b7874 |     
    sh4a     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/3810354859e1db7a5aabcb9eff3bd757b8debd7e | ORPH
microblazeel |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/b10cfdcf9dc3180dfc66da3ed7091dbd1a851b06 |     
   mips64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/41fc3879ad018295435468d909901937cb3f78b4 |     
    m68k     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/70bd16286a3b43bddc62f9831873018a528b980a |     
  sparc64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/6f01788082507652cc8d3b9f523fbc8d4883e8ff |     
   x86_64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/e7ea245ce9c14bded14340ce4647473843fdcee6 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/3ea632fc9c65e8fc45ad88b33825f3a7c59a06e8 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/a3c1d1bd2e5f564fd45b53352648db7bbb64dc32 |     
  mips64el   |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/2c882aae9f11860fe66b3869936cec036e50fd2f |     
 microblaze  |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/1648e1e423b6e2ecd094bde46f5ebc14466da6a5 |     
    arc      |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/4a15b49eea2b465f729e894c688bd7ab0755d00f |     
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/fc47db1cc720877b5ca5de9f9fd41fb9e1b38b2b | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d55eac1bbf797ed938e61d8984e829a94d9bd06b | ORPH
    i586     |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/ebbaf3d244ac42242a9777207d2c5f1389adffb9 | ORPH
    m68k     |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/3966ae56991bc0a46e9e9965f17e9a72c727bca3 | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/d909d157727e38e3fdfebb1b8e188db57cdc5f09 | ORPH
   x86_64    |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/205d825ab61be6ec72818a2da85917a327184b94 | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/f8648bdd828f5c6d0b1437ca2f7e588593a6884c |     
   armeb     |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/e52280ac6e0ffc96e1999423b668c4d58fa6f937 | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/efcc18bb68ed702209befb71f41103782c075b00 | ORPH
    i586     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/9a5a77d241e90a8b062a32c36c28e4fd4c410f9a |     
   x86_64    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/c43568e9c27fbfdc363b8ca7510710ab42e0391c |     
  riscv64    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/5d5f56602a209ad5b87ad35ff22a70147da639a3 | ORPH
   s390x     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/43c9e746dbfbf5e480161137189aa5a09253ca95 |     
 microblaze  |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/47a6775c1237d7d1719ea26ebfcdcd2c13cd4509 |     
  powerpc    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/d6c8ca92d04519208764f013e05d77c9446f91ff |     
   mips64    |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/ad589bd55aa24260fa85ff3a7d236146c693f5f7 |     
    mips     |          uhd-4.7.0.0           | NOK | https://autobuild.buildroot.org/results/a4dd151b2f9e1dd71d02b69ca9b5fe8e6b8d308b |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/cf4dae97e290814d6934defc843c88d1f924417e |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2cf68fc81756ea25e17c1d59de7ff9dc0a18f26e |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/219743abdf444e0ce111a8e3138daf257b3b30bb |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/a3c5ac21856adbfea19a8c577c735512841f0027 |     
  riscv64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/8876dc43c2ea157345614942a28e1b0d51ecf093 | ORPH
microblazeel |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/0dfeb1cf33ee5d552bbb96110df110e8fe547555 |     
   s390x     |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/23c80b4c0b94bfbac17655e19092f9d19fd4d180 |     
   mipsel    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/cb1fe0c7d7dc3022459172de45920ba363e12903 | ORPH
    or1k     |         weston-14.0.1          | NOK | https://autobuild.buildroot.org/results/9ad122d85413c02e502fbce8be8085991400e892 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                       unknown | 2 
                 openssh-9.9p2 | 1 
          perl-net-ssleay-1.94 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/4f502a519eae512d09260a34778b2ed92734e26d | ORPH
    sh4      |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/e45cc55aa9c266f9a9c511ba9f56c2e133051f4f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/7fe665f0d619d129cb99cc3b876fee71a1fd6fac |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/756bfb5ac27aa4a35c4fa6088c410059c8c591c1 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  ffmpeg-6.1.2 | 1 
              fluent-bit-3.1.3 | 1 
            gettext-gnu-0.22.4 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/1ff8a5356d4320c223a7c1d3fdccd53b5f7cfe0c |     
 aarch64_be  |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/ecaa21b3fae7381741f4521b654293971a50cf12 |     
   x86_64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/52433df3281d55aae6d0ee611aacbe2e8d75948b | ORPH


Gitlab CI results for 2025-03-10
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355544232  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355543955  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355543875  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355543762  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355543733  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355543717  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355543679  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355543674  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355543586  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355543483  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355543460  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355543455  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355543412  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355543399  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355543123  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355543117  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355543073  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355543022  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355542988  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9355542962  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
