Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1902C3ABC9
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 03:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85529810C3;
	Mon, 19 May 2025 03:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDhbcmES7RBO; Mon, 19 May 2025 03:11:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E7E880E0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E7E880E0B;
	Mon, 19 May 2025 03:11:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 577C8E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 03:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EAB640B12
 for <buildroot@buildroot.org>; Mon, 19 May 2025 03:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IahjdQCKZ1ff for <buildroot@buildroot.org>;
 Mon, 19 May 2025 03:11:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 52A2A40AA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52A2A40AA7
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52A2A40AA7
 for <buildroot@buildroot.org>; Mon, 19 May 2025 03:11:44 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so26836425e9.2
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747624302; x=1748229102;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+JZXspfZ/Ql8bsHoaJ2DL8kxdJniPq82K6pQi5ON2x4=;
 b=m0hzjwOkoUJaYeRDH52PlX3/Y2gE9juuF6dKK1l15sa7JPKYeKLNW3SGT3gQDa4A8y
 FYIK7ePbxuArzgSUCQWqCpz12aoVn5Pire7LgEU/42a3Av1ObL9jn8xEAMwBctns7Cgv
 hEe0rxCbeNN/57KS9LXaSsv19mqfc9xwt2kr2x6hcV6rPSlkZ4flXyROv5EkxjGyZxj2
 8+weJtD+7bufifiHQLrJNzmj8V0EI9LdwLFBpXCkKDEPvzL3ovDbiQL3Vo4Iu/kc82mF
 uPxpE4SxvMEvODhSc05WOEiz+eNVQoNDc+Dcv/uuXE/24jFa5mUSe1x+hlvVX08Pd/Y5
 p8oA==
X-Gm-Message-State: AOJu0YzEjLbN1ZbckqJ1UqchSk89lPfe/fN2813A/ZgyFGZKq2cTNw1H
 uGi6h/YH9hefqdfCAm05A1bP1aqG5z/dlXcVzivtS2w7/zZg3FVvabRI0s0JAw==
X-Gm-Gg: ASbGncsPPe/UUf3dJ+toWDBU5ijuC6jM+kJeHzbvg8Ceqbh1XwaV5XU6O56bMGhdsXn
 2m72Kp+9Cp/O3LCmmG3w1DTfElGivgBwmUH3m23fXVdtJlqspgLN2mtbD9AzB+v6kkwqjysJEIo
 aWKChEWl0kQmR6oYV7KEJH+bd20g3miDvPPq5UF8112hLe/dPVKb0ydtL0o7jwCz36q+oCLfgw4
 Yz+q+naSrooz1vuxjSuDdriZzjtTr+1TB5HO5VC1LNXmoI6LpbG4m6NpAO6qw9X1IgxCfGc+IL+
 wAQyeWFi5AhFW7b2FbAM/ZunjsuOFfHDy5/14FVh0n4Hs05hv/yInh0=
X-Google-Smtp-Source: AGHT+IFkRRhQtgU5e3svH189hwsHiRuq62JTubuv/ckkpRJWVszCYUBbXbAPaAfEYPnQHvzYSwhQ0w==
X-Received: by 2002:a05:600c:1d88:b0:43c:fffc:786c with SMTP id
 5b1f17b1804b1-442fd64dfbfmr106856115e9.19.1747624301259; 
 Sun, 18 May 2025 20:11:41 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f33804d9sm193882655e9.12.2025.05.18.20.11.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 20:11:40 -0700 (PDT)
Message-ID: <682aa16c.7b0a0220.2529c2.3345@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Mon, 19 May 2025 03:11:40 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747624302; x=1748229102; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=+JZXspfZ/Ql8bsHoaJ2DL8kxdJniPq82K6pQi5ON2x4=;
 b=UY77mp+h+qufY6Bh1GqtvTp6qGmP3dZ9tfay1e+UeOfXOxgBeBOF0qAGQTsS5wUh0O
 bhWDjbNBXIV+Yyw0N7bT5XboJdSH4fxOHdbgsbqEY/FgV+88F1AP25/7e2+c3K8vkNG7
 EApiqynGrMwzPTpBzIKJ9HKd+NOSZE92wBlbY+XMiYSxNK0jxQ68cJrVrCBZaHgyLStO
 SBuwYsrqJt8zz1iXX5d0x6N6OrEZhuvkAzvo7QQI7SwJwi+7TCxisKT+xEMWcK74LYGJ
 Z8kJMfmYoSl1bqIN3oFrJ/8JtgvUxiSgpyeDwiZ0sjAYWF+oNYvuKEvhX1UAJKnbwKm3
 JnsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UY77mp+h
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-18
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

Autobuild statistics for 2025-05-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  | 10  |  0  | 15  |
    master   | 17  | 547 |  0  | 564 |

Classification of failures by reason for master
-----------------------------------------------

                 host-lzo-2.10 | 83
                       unknown | 58
          host-binutils-2.43.1 | 50
                    bmx7-7.1.1 | 28
              libselinux-3.8.1 | 28
                      lzo-2.10 | 24
                    flex-2.6.4 | 23
host-binutils-arc-2023.09-r... | 20
               host-vde2-2.3.3 | 19
                  bcg729-1.1.1 | 17
host-gobject-introspection-... | 17
          host-oniguruma-6.9.9 | 15
                elfutils-0.192 | 11
               bctoolbox-4.4.8 | 10
                  libftdi1-1.5 | 9 
  gobject-introspection-1.82.0 | 8 
            host-binutils-2.42 | 7 
         host-mariadb-10.11.11 | 7 
               pulseaudio-17.0 | 6 
           ghostscript-10.05.1 | 5 
                  linux-6.14.6 | 5 
                 apitrace-10.0 | 4 
                 openal-1.22.0 | 4 
                python3-3.13.3 | 4 
          aardvark-dns-v1.14.0 | 3 
           at-spi2-core-2.50.0 | 3 
              libebur128-1.2.6 | 3 
              libopenssl-3.5.0 | 3 
                libsepol-3.8.1 | 3 
          linux-5.10.162-cip24 | 3 
                   perl-5.40.2 | 3 
                  snappy-1.2.1 | 3 
toolchain-external-bootlin-... | 3 
amazon-ecr-credential-helpe... | 2 
               asterisk-22.3.0 | 2 
                  boost-1.83.0 | 2 
             casync-nano-1.1.1 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
host-am335x-pru-package-5f3... | 2 
        host-berkeleydb-5.3.28 | 2 
              host-llvm-15.0.7 | 2 
                libdrm-2.4.124 | 2 
                 libsoxr-0.1.3 | 2 
     linux-5.10.162-cip24-rt10 | 2 
              skalibs-2.14.3.0 | 2 
                   avrdude-8.0 | 1 
                    azmq-1.0.3 | 1 
        balena-engine-20.10.26 | 1 
             batman-adv-2024.4 | 1 
                     bc-1.07.1 | 1 
                    brltty-6.6 | 1 
                       cfm-0.3 | 1 
                  cjson-1.7.18 | 1 
             dahdi-linux-3.3.0 | 1 
                  dbus-1.14.10 | 1 
            ecryptfs-utils-111 | 1 
              graphite2-1.3.14 | 1 
              host-guile-3.0.9 | 1 
              host-json-c-0.18 | 1 
            host-libp11-0.4.12 | 1 
    host-mender-artifact-4.1.0 | 1 
          host-tipidee-0.0.5.0 | 1 
                   iotools-1.8 | 1 
               iproute2-6.14.0 | 1 
                  janet-1.35.2 | 1 
              libarchive-3.7.9 | 1 
                libosip2-5.3.1 | 1 
                  libva-2.22.0 | 1 
             lirc-tools-0.10.2 | 1 
           musl-compat-headers | 1 
                  nginx-1.26.3 | 1 
             parsec-tool-0.7.0 | 1 
                 pixman-0.44.2 | 1 
             python-webpy-0.62 | 1 
                  readline-8.2 | 1 
toolchain-external-codesour... | 1 
                     unzip-6.0 | 1 
               valgrind-3.24.0 | 1 
            xlib_libXau-1.0.11 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/320c6a14f2f9c20b5650cbc0e8f3d9b1ca041031 | ORPH
   armeb     |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/ff83302b390511099fb7680867d915f7d98a8999 | ORPH
   x86_64    |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/d8c3caf367b8c6f2fcafbff085c43370f2e5e790 | ORPH
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/7a0fd2731f5516d26e820f4d4590dcb47f6d8ba7 | ORPH
  aarch64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/61f79ad339504f4b00915f5ac298fdee5962bd35 | ORPH
    m68k     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/64947d60a310dad6083400dd1dacfaefcb3c9134 |     
microblazeel |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/76a3fa0ad614dddcd3af2e2025d37326b16291bc |     
   x86_64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/d6e822ba182d2161db0d97a5de50dde7a227838e |     
   sh4aeb    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/d20a1f6de3fdf38f30de4aa55e81a2a07c70dbc3 |     
   s390x     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/a016af1625a4e834947edbb853f7d1e9a70cf167 |     
microblazeel |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/47fdb253d41af94f74e35b7575290b364040574d |     
  aarch64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/dc3acc74bc4630928614df4c7cc3062c6709b24b |     
    arc      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/1061bea5632ef2ae2d2eb3771558948353caf49d |     
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/9715ebd99a64795e2fd2ddcd395e23f890df1e34 |     
    i586     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/136eb79b221550267e4c791bece890ded339f953 |     
    sh4a     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/efc8478bc4b1fdc679d812c222c5f5b4935a5b30 |     
  riscv64    |     balena-engine-20.10.26     | NOK | https://autobuild.buildroot.org/results/62f424816e93ccd2b56f2cbcfe31bc95ded29230 |     
   xtensa    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/4e2917fddf0ab575fe69d817c19264a0c9d3e1fb |     
   x86_64    |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/5c02a46d06021e82af91f120740e278590be2801 | ORPH
   xtensa    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/b3ac2f6f4ef31adc94b38b394727cb22682c45f9 |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/688f9cb2f7c2d20d74e144d18ee4320bae244b28 |     
   xtensa    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/297f3251e53255baa7d535d8696da0f326156ff1 |     
  mips64el   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/63252534c4eebdf29d2b3bb1370e3f69bf6ad08a |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/01bebcd8ebe24b090f8b3e60236a019d6dc228fb |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/45319e2088b837a62557c86210cd50b124cd85a9 |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/4846339188ce4f83e99482aea2605b2ad08d4533 |     
 aarch64_be  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/16c74a4cc06b6536b397c7408af972457b4d6e32 |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/b83e71966ce7a6d99c73ddf40d2a035eb82265f2 |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5aa0f3ba81acdc7ed23e834a7bded4922fc8fc1f |     
    or1k     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/3a78b5282373ee73430ca150d4efce0464f585be |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/6a1b0f55e77197747385539e0383f159056ceb35 |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/716445657e6e19ed9a0b760b4bdc9502ae841ce5 |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/9e4e771be32b360eba3d96f3b74b934d328353db |     
microblazeel |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/2fb24ba88a5c396f98d2c3e0532db87ba1b20671 |     
   sh4eb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/2a1b0bae37a491a4dcb6baaff7da0daddbb97f9f |     
    sh4a     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/615bdfe76decd59a0ed40f776745a88bd997775a |     
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/480d93900d306d713d492b0e53a29c01f2282972 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/53722063fe1260525e28ed94d858b0d56044d98e | ORPH
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e2e6401b0bbfaa50e4296a2a70d518c33dab0cab | ORPH
    mips     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/df0a739d943b170a9c2377275871c48c27b8071e | ORPH
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/71a03aa3a58a896c99d5fa1bec20ccddfec81cee | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/674001bf9f199cad3f1848bfebd3f2f142edaed8 | ORPH
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/3ce2c62390ffa03e57b5f070c32221d60985f2a4 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/12aec09f8208945d8c42fabce786055efd27443e | ORPH
    sh4      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c5fa61c0a1528fd0c0d6ff8119033643b8a54014 | ORPH
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c89047e62ad5ba0be8cba4ff316204390bd315de | ORPH
  riscv64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/f439f204b086b3ab353f15693f9bba80644e1826 | ORPH
  sparc64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/5d09516394373c549ddb844067ea9ecd4c46ea4d | ORPH
   sparc     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/76c648bacedc3d4fdd292b1522f56b028000876a | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/f17128c0b56802d512724373e86067efc0552e51 | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/fff59a4aa73f7f392d37c2c8db3d5a0fca2fc23c | ORPH
   sh4eb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/8b7b25585caf9785a2832adabbcd83a935b0cac4 | ORPH
   x86_64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/f8b517089d5a5229fac60a37a0a0fb835b11be16 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0d159d4f01a640962427dac943f761023ae9aa40 | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b527a86fd73d9b63d8a28cb111d9064a43a8b6ee | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0850811aa0e1b5db0b404cfebd7492560aa09d93 | ORPH
    arm      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e54e8adce5048fcf9dc69a36b468fed865bb672e | ORPH
    arm      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/6cf50c760a74132d8730e47fa7896f7603f6e104 | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/16f652b732f44aa401b20d77497a324c9cfa3bbe | ORPH
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/dd9e815a72bcb458a32571527ebb40aae57d0c1e | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/af00503157c6ecf10c92695b95d3b414bc579e5e | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b6addb940b7d982508ed570d120184c6b9497f67 | ORPH
    arc      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/4a3afef518e7612aca92305349d7ddf693668b90 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/987c2d7d81fe116e7990c3a187b60daac735527d | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/86cf1f016328d601316c6e0a228fee4c37840b73 | ORPH
    arc      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/344733ea786acc4244b0ad3502f54260c792481f | ORPH
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/c4264a76af17dce1a96d559040b6761764b1e8ee | ORPH
    or1k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/ac7c6857f5014b3b4894a6fe349b13d8780d2085 | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7d1cbb626a298bd47bad7471275857224c6390b2 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/8fe61eca552938b776c7fc13225c7490ca2f8e86 | ORPH
  riscv32    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/f943f3439e4a8cf16a61c39b95c4ef894d4cfc14 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/8fe99e62da059264ab06588974278fa31bda442a | ORPH
   xtensa    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/fdffbdd77dae0d80380ca8accee06de3fafd4047 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/cb7bb223cd9a84790d29872e80548e2823c40c73 | ORPH
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/93487d02cad55127991455b78de2e69d9e597701 |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/f52c638622de83f0df9a7dd7a9ee2ab6e58b4ffe |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/4235a265fd694669428dc8d2535ca0453e404404 |     
    i686     |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/3cb58229dfb47e79c50b4b52ca57b3f56a945ed7 |     
   s390x     |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/5c180c9a653e047d1d864487ed2fa5254dad7cde |     
   x86_64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/5edde50d7eccab7609c6b7197d05b094eb455c91 |     
  riscv64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/b1249ac9558c6f32053193253c8311e132a757e0 |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/55b67b0ed841bfd3ec17d5fe72d332111ed4c57e | ORPH
   x86_64    |          dbus-1.14.10          | NOK | https://autobuild.buildroot.org/results/35aa23e3598b2a8a782873553d3d30bf6deea968 | ORPH
    m68k     |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/d1db4a860cdbf73da88290a59e06e008aa9b2a70 |     
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0bf34615d9ff9b9eeca36412b2a46859e32d2234 | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/27bfd2a388d5a2b6ee441273902dceb567abfd08 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/128482bb8637ce32f0a8dde32ccdf674d961a516 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/bd117b445e41d6be1e8ec6da59f018444a73b49e | ORPH
    arm      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/2666647c8b76a093dd6d484d4a4bdee79e3d9580 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/18043cbad74cdb0f4d7f912abf918ab9b92e589b | ORPH
    arm      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/8906ac4f872fbffbb512050636f4fa1fcf660da9 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b2e7ff0854654d7d4d1f933f581b8603602b8c9f | ORPH
    arm      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0abbe7caea86f082a0b8844d462660026dc22896 | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/47459bffabc28026e131dc086e5b4e7801e2a83c | ORPH
  riscv64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e5fce85b4bd87d46c425a54bc46b2ce10f99dd74 | ORPH
    sh4a     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/f9d5c2c88b5e54244ae577894f14bb7e996a4dfb | ORPH
    arm      |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/6c01f61fe43a5dd8510f5f58f840a6fd24aad3e9 | ORPH
   s390x     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/3fcc9a7dbeb6af26674daa83b467c040ed7c3805 | ORPH
    m68k     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/adb7be7e9929df3119cfe290460ba5211265afef | ORPH
 aarch64_be  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/b821e5a8e38b8a0e6b486fbfa711b00537515771 | ORPH
   mips64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/4897226c5a5d0e53501f65252c6b001bec72598c | ORPH
 powerpc64   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/aec29f2f7c25a32578f98f0c7d07a66e75e0f166 | ORPH
  sparc64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/777bf93c315e038a411dbc8781fed2031f69d5b0 | ORPH
   armeb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/9e44b0283fd9fa2dc090d9451baccb593c0274b6 | ORPH
   x86_64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/8dbbef117a7c96315e901e86d31d389dafbd1292 | ORPH
  aarch64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/9e735162407bb5fd52ee148162b9cbee6b8623c4 | ORPH
 microblaze  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/b46c3d8997d927ca7033aee32046fad786c002ae | ORPH
 microblaze  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/7efc3fecb5a44d427e0cf1e22166953312419dcc | ORPH
 microblaze  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/c13c5346ed671ffaf87314a2e5a597d0e7e91f7f | ORPH
    or1k     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/3eb196c7f849baee5d7a1152b2fe0e334cad05dc | ORPH
   sparc     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/83edf3a84d0dd2d4125936f5f31d6815bbfc1de7 | ORPH
    arc      |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/4118942a0ebffd4a59c8d1df41890329f1edb7ae | ORPH
   armeb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/924b1015d4b81385409ef00f1a14be3ca1959c8e | ORPH
   xtensa    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/08ad5091829c7e2002a97498e64157bf6ff01856 | ORPH
    sh4a     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/adc2e3e252e7d6870616deda7e6d32589272622a | ORPH
microblazeel |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/ce4a9d8d21499d17fa1b4d7fd8c64330f16efecf | ORPH
   sh4aeb    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/0aefe7d5114e3cebfb6022b3d3dbbbeb87a11c02 | ORPH
  powerpc    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/8a6253453f4dfd84282ab560678f506928ff99f2 | ORPH
    m68k     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/804b10f72c666ef58e56ccd04e36cdc0847d6ed4 |     
 microblaze  |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/bac949fc85f9252a8ad04b7222a19afb799b2091 |     
   armeb     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/dd02c9a12190fcce0994568b51a9946b1942e2c7 |     
   armeb     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/1d34222bee72b519b5d3cb4bcf219bcc397451c2 |     
 powerpc64   |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/370402bb0bc73438f22d6fbd92525c3586351c06 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/95ca2b1875640524b9af4d294e386492c8275ec7 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/1d0d244fcca6ff55dff234b9863b91b41d15e554 |     
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/bd6ac189a380b40de800ddd40b1df3783bf22949 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/873245361783b84eefe5af4a2a4d2b68cbafcdc4 | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/10ee76e4c515fe6bf0dd6e03f1646bac5dc72e79 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/a27b7fa907292ff457b38e8c3974ebdcd5f279c9 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/3a98633f9020062e317bf51657424671aff441b1 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8e1f708316b743f1b6aaf99226fc3f77cb0ac456 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/93444364efb025b2e5591b7cca6cb1a2377da780 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/618b8394fa3767dfe29d18cca7a68ce49c70a24d | ORPH
 aarch64_be  |        graphite2-1.3.14        | NOK | https://autobuild.buildroot.org/results/621c97e5cd47bb620d0d9eded26b8fc1087b4bad | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/af1a3e43b720f791bc7232f106f6b2524703d405 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/5acb11a436ca3800f2769f0446021441ebb6fe92 |     
   armeb     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/1dfe5271580eb5f45a9beb126dfd2a6405a3c10e | ORPH
powerpc64le  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/efc36aae34ff727d4811323ac021e727effe6095 | ORPH
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/1be76baf76da735aac290ede8e9cd93ec11a16df |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6304be36736d69fe4c3bd4e7e87c5199d7290327 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/0ad973aaa785d334ca63178194d5a1441895a410 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/71ac716544d882b92dbd321c82ce0861e6bdec02 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f0da8bf71558eaba2f73820d66bf4b7d0690708f |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/05b093f35e64a5c0ebbaaa6f9b5cd02063ef5bfd |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/e606287de3d583b76a77a3d276ac81afa4a13329 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b2c5fe6910881c99f87a86ac13af3f2c37025f11 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/78113cda07632760739fbe670777157d8e1aac98 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2a86c851cdab1716756c97c7361ff257e6cce990 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c4080b3f978afa05f16b013f24582f044dcac827 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4c62eeda888c330bc5b91727bf7834b577f6a24d |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5bbe0b5dac7af84081b58a57cd57c148bafecc9a |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0ce66f120dc52f52278f0f6cab2e2c7160e55f5a |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fbcd6e5fc951f166b3bc61d60e1166f2fc7e1bc5 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/02b6840c85322ab677556c9ac9b561e2a09dbee6 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/928ad87e51c2b965c5fa01ddee8d4404a2a7c57c |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5f940874b2ce41093b8b2091dcb253499464a249 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/dfa38b5882c6cba15897458352310a1492304978 |     
    i586     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/419aa9dabf79e8c3f959167c03c858a33f089eb5 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/13a7ab2faf9dae5639dfc0d77ad3f0ce83def0eb |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/43b185314131a81addae1e4eba9d84e2488d8812 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6ed2b9d0a5272edfa9c8aea1c3f8ca39b40db24c |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/33f7d8f08f32ffea333f1833c774c01bc807095c |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5cfd35ddc417c9f613918307a504daf4967088c7 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5fa4516b6b3401211aaeff904c7bb5f200e8e5f0 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/903c7efdf961f0bb089953e8452b108e5cf9306f |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ebeab453e44f45cbe90436aeeb5bc5527a13c2f2 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c94d28057fc3a63d2add08639846f513ed601683 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3ec9970dfc36ffea3d482ddede5913b6ff5141ff |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/46abdb1ac848cf676560ea2e78b2735632eacf82 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3ac1096470f4b7b97f28744b578f7360d5ad4da9 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6e37ad6d7d7dadbea3a422568849c7aaec205568 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2c6087e92b28856dcecfefaf77072840f266e3d7 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3b10a651456ea9977f5a41c8094f1ba7301db67a |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cedeb21d0111c2b2cda2834db18a709b55af6114 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7eb64cb2b9bd1887bd6d13abf7b4438775c3ed26 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9d58e078e00cf0f787cecc53078fb4512060ac1c |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fea7a1041736d736eb9c16de08817496e7c84c6b |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/88d235e100cfc520f867d02a39b482c05ec6367e |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/00b411fe285c331070555598d359efb4319e1dd3 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/45ab0b6bf1d657d2d891285cee0d405f10ac6ee6 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0d7ebd75380b693182a43ee8217998024a46e9e3 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d9f9af6057c207544c8a46bedab00851b56b6639 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/aaed3bb715177aabbcc288e26a5e60bf0ca96d3b |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b8bd6728efe1858cb374373c10465bbb35e6afdd |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/593b471e527ab787b18f22b3d5502ff064517850 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d53f78c7e375f06a34e1021bcbb5a1622e991aa7 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/97e1feba84d86507d5e72bfb28fae0ee6e577461 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/09c1568936d7f13b65be22963536e543c19ecb84 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/70a5dfa7e10dde10222725db09ac4269db4440cb |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9b634fec5af9ec5caaf0685218577f2281e2fa34 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9471f49bb7d7f7c24d9ffa48abf678a77070a8da |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/df7095e1bb463cead030515ef20edf6c1956ffa7 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f99b0c69378e8047f4c35041ecfc29179d016f1c |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0049b510d544e35be1f2e2de416251448daf00f8 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cb4830ab9385ea0a138e1f3b40f6bfa0c25fca3a |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/7d919c266bc375e1e6b7aaa48b7a6dbd321dda0e |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d3649505ab9da99935e8196768682a1fbef20268 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/df41fa7914511af7b48c51b82abfc7f921d3a2d6 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/49f93cbb47a28b0ce8264c99e506231f4b08112a |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/227e8020d9a6e529635374bf2f4a3d43a1d2d4ce |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/8758ef4acf8dc6d3568d22e0d0d36f47dbd654c4 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/8b5d08a08f1681dbac088bc31c7539e41930bf2c |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/7a0b13eb27899737d0af480e3d3196858bd376dd |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d71aeb1e51305c4407aa5ced2e083b7c54fc842f |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/e3863a447f175e0a88cbc9a0591f34c5fa41f49f |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/aabf1037b4bc6abc13d6a41b0dc4a6f740ab07f8 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/3bcf46a51c541a7f929a0dbc21288125617fef35 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/1ad7865c7d60b99045eefd906ddbadb65c02c9ba |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/39f1236f62a0d85b2597ca61caa0d55a97e47d68 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/dd5a5efe60520ae0e1b8c9c13bda1f556085b01f |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d44dc48c45f6daddd4da2ce28a5b201915dd5b2e |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/e923e381634c98e4eaf682bf13ccd5f0cad0f37a |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/057ccdf0222b2cc95aff78c1f8c053c8d9d3be9c |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/a4471a532d3f591246d1912ed0ed68b7d3fc3c99 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/590b2ee9701cdffcd01a39180f4f1b2831dd13bb |     
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8efb0864f2aaf5e175afccab44e9c6da0343b70a | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0e7b29d2e06e728e93c6e70eac25ca524fed80a2 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3fd9b41fdd7ed8e354950d35b56d963fa257773a | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a4152a0c9c4858d6e138266a4809a237e96ebf63 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/04a2d4f8fb8f751bc1934df426b57baa111010ee | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/57ff01a3696bcad18637a1d73cb23595e8c788ff | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/11927d9a9bffc09076c9f34e0040be17c6dd2773 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dd9b7d64bc9c71ab9d68f3050009ae97804d3c03 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ccb80abd5637e40c3dacbad7d3bd5af95dacaca9 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f12a71e7f3cad696bb4b4bf43f96054fa4902ce3 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d88b118d726d03db3ddedc7fe0ded8f887c36f93 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a2c7a6600ddd36eff423a3a7c023593c29147b14 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0cd557fbe2ee316a6ca29d10b143905b2017c98a | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8ef0b2b72f0bf5c63b7e6807b27a90329f02e053 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/107cd29a78538d2cfd015f74e91df4da6d1d5f52 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f49bc4f5b8b50e53d414a3bcfdf4f9700b465ad3 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/867afc2049d504e25a2ddbf08e8423d28e3fdf3c | ORPH
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/9556fc6a3b0a5eb6f4476a8fbbb5cd9b000216fb |     
   armeb     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/d7b1442b9d27b06fdb35f65713f8723f4053a365 |     
 powerpc64   |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/b078fbca28a86ae7012f30576c1e6925ffdad357 | ORPH
    arm      |        host-llvm-15.0.7        | NOK | https://autobuild.buildroot.org/results/714fa6846eb87c611e9628ce8250fd2e4487f558 |     
   x86_64    |        host-llvm-15.0.7        | NOK | https://autobuild.buildroot.org/results/3dbc832c9a9c1671733d1c422db76e05b1191c5c |     
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/19b5ab1e9f8d4a6b21c6663deb835594c9c1e0ad | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4f7fd3f9b8f1d899cd370e08c1a09fd60bd7b1cb | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8a18c7e924740845e785e8b65ae86f9f25557611 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e227140782d661dae16ae5e44a267fdf8c013658 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c4a247480a1fa752aeb666793f00eb615fd764b0 | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2f0939b5c6bb7a01c11b650021e4c564107de984 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e093f9c897d5921af3f8ba8b67119474942f04c1 | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1091eaefd85aa738dabb3386cdbeb365da31bc88 | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2e0f530a4ad10f4e3b5a05639e55706ba932b964 | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0a5edb0252b41bc1eb05d5540d5f7a0bde4aa44f | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8dd7d52fc28785647c0a94cbe8e518121e05575e | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/87d78d647e92958d9934aa2b71d2653de41f963c | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/084ce5bbf63897606b606f7d057de086583af383 | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b8d7bfbc3c01582d6a95daa52b817c7ddd118254 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/68071ba162b68bb32ea09096e3e6782848ed3980 | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1efda42d245b0670dd00b32f9b077acd06c5ca3d | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d2b9e79835ff7d6650e37003ee5cdd4db4b6642e | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/62b147f7f9bf5f1b99214a42da68cdb99318a3ac | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/aa25bbd72d8f809f1589047fac5d8f742e0a5333 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5c765951cb1bbf29f85f15d076ad8dbd14dd4505 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d28df733fbe7f906476129fc17107ef745cdddde | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/24e28bcae101cdeba419a971dee25e56360231b9 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/101e856de2a96a16931c4e905275b51b372cdab2 | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2d8addb31bb2102c5ae877018b9f3542baa3887e | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f8caf76f141264a48e1683bd478fbd730ea975f4 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4bf1ee5e6ea490f731e38183900d12ed3d497caa | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4f32828c50712bae681de2c9d336dc83ca048b0f | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7d304bc6f51ca1544871e75b9b754e53035e7b0c | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/43df7ce062441d3fc444b0154f2975b68a1c78e6 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/15581296731c912b9744cf9908c497f1242a1c62 | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/cfd4ffc261a21991604a4fa5100d54cd923f0551 | ORPH
    sh4      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1d2a9d74f11a53522a1cc5e3082cbeea5d70b40d | ORPH
   sh4eb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1ef29a24c7360aed03a7246aaceb5a0fdb2d20b4 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/657fbec106db72b54a0143198036199f21ce1265 | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6ed5ebcd6cbc074d08c3b0ab90013a0105ff4ffa | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/68fd3b494e9dc65c7f9e1c5e3a8f4766593dcd26 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/780c512b3415ba3b429da27c5957f355a291cfdf | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4d1981a746107e3e2032afeb6b78e4989ff44900 | ORPH
  riscv32    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d0c54245ced1ebcdc35982692e516871c2bf2a21 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/fa3b3f5b3c5c916d0e782afbfc7dd299618d34cc | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7106effdcb2507e3a18d2c5912e66a4dd12c8c25 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/fe857bbf1147080114442e4e3c8bead0106c7a51 | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f4c275a19c8f131baec89857c0a05d7459cfcd42 | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/17e182098d4b3fbfbac7e5f9972ff6f9d0a9ef78 | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7f784605b4d471ed02859df29d91fada7f90d535 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/53667cb53dc92ac7b06c69360dd9a03133afb404 | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7433cfed6818bb5b0e9e92ad31fa85ebe612657c | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/92699f0fb0b0a7e5e7cf70ecae1b641bb91a1aff | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/79cdf97f68dac279303af09eaa11d90e1629f4c8 | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7409703a85608a83f26e96959bb2aeaf0be22b4d | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/cf68edf4b346ea2548fdbc61006b3103ec25f3d8 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/00142fa74bf4d8d34318c55baf934f0e07b17adc | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e460ec4612e769e4c90a0c102aa292cf4244ac07 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1cb9ce5303132050ce6f7c2c9221e9472f628e0d | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2c24b1f44e8fad9443dd124e1b674c5afa7b18f4 | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/aac3b209dce376d2b1608240441f91aae905e006 | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/959d15a808824ca8585915d0452b423c215294b0 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/874f90c85ad2355a4c9598ba9c5ea3749999afd9 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/9ebb885c56fe65f34aae0fa26010891970478ba2 | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/14e1aa0601229a833ab337524358ef394debf425 | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0f6d5d8a7435bd8df808fa8124da9448ef10b257 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b71d3ccb4b4a817d433b8eb16903cc509218f8fa | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c2d1ff347aaaefae59dad4c999dbd1a099f7876b | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d2ba35f6854a8953d45f11d095398ff93299a646 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/55547739c82e05b42414d42a2d8f6326ba63e5d1 | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4b169f08f8251d64bd62f4cd4cff822b5c71d327 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4be29c6a1883a5657567131275c541b65aea038e | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0b3d1a47c005ca5691c1c0eecd7ae0ef7d1870a1 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/865f7532eb3a99d7e851490ebddadcbd77ef225d | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/da500e8695342c9059c152f3a0b4455b98a2199b | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d281f86185489b803831b359d274a7a8dd69825d | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a47bc3c9e24f6a20848e6c1652beac50f0b94847 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8f6a79068bf5fecc613fd39967728820636f05b4 | ORPH
  aarch64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2961667ae9fc48f4c63d7708ce1de6f2f2f08d14 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/9471af9463a9c8a17d939523e028bff748413358 | ORPH
    sh4a     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ae4caadeff20655d298946d65e65f3dc59e0b854 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/444ed5005a32309057f4b40fc7204bda1c876535 | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/03a84bb0bb87338191bf4a72c647ee61d1b2ac33 | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/78e8a9fbc90aa997a1ecac9dc6b4bcb2f8811471 | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/01af03f2ae3fda6921f3ae7f115d80854ad92607 | ORPH
    arc      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/9c096e0d48a54134731ff6b32f9e5e2628f6b6af | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f25d05e165030a272aa31bc2ca085a3d8f6e7bd7 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/307a050ce0d1b20187749c1b4a2d312654e83c0a | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/24aa0308eec04b02883d4a8da013cf40d5eb6149 | ORPH
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/77660628f84fb3cbd45faf896d0baa3f4f0e75d9 | ORPH
    i686     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/b82c8392a4ea2f2cc101622404ae90e3acdfe268 | ORPH
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/5bcb79b89712d6d3b85e3581a52dcd072e5c6aae | ORPH
   s390x     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/4b1f71656e4e020be1ce5c1f95704164b16dd942 | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/b4fbd17e79a61b3ed4ccf01fa7c0e0ba342ebb9f | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/b0bd0eeaae232caacb7f5f3851432db3190b732d | ORPH
  aarch64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/3daee8b5e4dd817dfde0130a2aff9b4d73a86963 |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/8a01fd21c3786de5af65c3d9a43ad2137dfcca52 |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/7890ddd1c081d1a3aa68c694015ddbfa5dbf3220 |     
   mips64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/ca22fafd269ed6a9df20ff23e750687c07d77794 |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/615f8d6d8b267a27768493cc3cdcafc71eb9cb03 |     
   sparc     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/b7ded496b663d08c85d56c53c3a22d7a15004452 |     
 microblaze  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/d8ed83be0baa8afaffe0cbba7199e4a7b69a5121 |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/a793b4b9f3911aba2b436e6036ab66db70c30146 |     
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/390edbaefcc1d6bb6cb2f794a39c13bed8f2b4d2 |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/3af25fbff1e9f6a58b1945459f2f179f61babe6a |     
    arm      |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/cbcd1e986528e53aaca8ce6f04f260b20033e263 |     
   s390x     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/d5ed44ae98821009ec505ae249b7bc50f8631b7a |     
microblazeel |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/48f860003621476da955a127636516811d4c8838 |     
  riscv64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/f2e040ece759362b50104a84e5672d453f2a5c10 |     
  riscv64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/36f06f54ac7e2fe05dd76dec25d304b31a03143d |     
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/0ed31d0e1529000dadbf145a01e355a64535befd |     
 aarch64_be  |      host-tipidee-0.0.5.0      | NOK | https://autobuild.buildroot.org/results/125efa37c581a3df0d65c2913babfa880424b542 |     
   sh4eb     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/365d8c8f4257154935f613a2fc28eeeffba5e46f | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/5f64ec30f5a8c3434f1ead097a62563a63580363 | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/b6f5a0e04a7fe6673f614f762aa0d5d52215b59d | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/dfcbca6632618d55880f603b5dc9f50b8c7eebfd | ORPH
    mips     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/ef83cb90b93433824d37ef5a95c0df9f4ce94830 | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/7bb4ed68bfe4f2ceb794705fe78a9a3e11744c4f | ORPH
  aarch64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/c511963793665952dbe453df6e3a77b1928960f2 | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/e58099194d8cf146180f40169d7e7bd13fc2b455 | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/9da29f4e2d95a7a73c956aace5b9bd0a7953577e | ORPH
    sh4      |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/568b51c195f2d71cd168a47fc48b1648390ae8de | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/3577059e62a384202e971a98487e10cb44b39858 | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/a5acbf701d955f2b0fc41ea709ebd7965a871084 | ORPH
   s390x     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/e2d8e22703a9b6afe435b8f06971a3bb89dcbef4 | ORPH
  aarch64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/eaeb89d41fa80b78f3f1ffe41e10d5bb619cfe27 | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/0bcd0e82133361a46e4c64caad2a6ad2130a5aa1 | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/7f65340ecee991bce661f60eb5c456f0005f8d71 | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/612a0cc0a457fd05ca5575e99c7eac6dca813797 | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/88669ab7df6946a87a9e0a11283c8ba89ab7ce73 | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/7a94ca4ea75d5189ecd527157d2bed847d937f6d | ORPH
  powerpc    |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/cca35009522c4cbf7a3a848413f3cc32cf222c9c |     
   arceb     |        iproute2-6.14.0         | NOK | https://autobuild.buildroot.org/results/56c01094800270bf8f460d60617c04836955a739 |     
    sh4a     |          janet-1.35.2          | NOK | https://autobuild.buildroot.org/results/7df108c212616f225475889235215a66ea7c7e95 |     
 aarch64_be  |        libarchive-3.7.9        | NOK | https://autobuild.buildroot.org/results/1738b58010a897c9c1c6f6cfa46ea5285eb4d648 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/c4971254bae13f98e35937a31480159b253eaf1a |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/dcecef7eaa7a61caa88fe85073c0ed0c7b44c36e |     
    i686     |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/d492874101a23ca4fca35d40dde7e0750f1d8349 |     
powerpc64le  |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/3d9fd2c504b3e9f27fd3dbe471a556437fc6ef23 |     
 powerpc64   |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/8e7c303b84ba538262686a815997bb4cc4a42a0d |     
 powerpc64   |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/268be2bddd80c6511449acfa295a25a7ce14031d |     
 aarch64_be  |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/5aacd29a93c3e4306da24d3f84fe85ade8d5195f |     
  sparc64    |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/3b73c78c58b15a0f42ba9622d8ff4ac32da65c28 |     
 powerpc64   |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/47efcda55dbb1dd7e943790373fa28aedbed5e75 |     
microblazeel |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/d99647c28ce8ab30e29de72a0660a433d6cac636 |     
  aarch64    |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/f1c1cb6623a82f9f570ab17cde38d647ae2827c1 |     
 microblaze  |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/be36dea44991638c98e2e0ca73826c95ad96dc8f |     
 microblaze  |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/d54a304c756fcab0acd57c8e6bb59d01ae50019a |     
 powerpc64   |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/a9c6bf6065c3a2f50a3eed1721c0d9b3404d5103 |     
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/627ec02be18608cebcb29341df541a3fabcda3ff | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/425346a9232842c1679fb6233ba503f480840ab1 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/c26d990bec222211c54e09f826d2862233b367f0 | ORPH
   xtensa    |         libosip2-5.3.1         | NOK | https://autobuild.buildroot.org/results/667c07f56103d362f226c09e2bad0b8e68c14977 |     
   sh4aeb    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/14f04a91be7f2e3b6533c52627d1f7951f972812 |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b339d6769588d841c78a44f7943e0bb79fd88b87 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0dbd914b38ecf56e45bafbbf3c3d7be35f50fc5c |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f084e5fa870afaa881ce0d7e116ee25007b01d41 |     
   sh4aeb    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4208e4ee59381fd1d99ae6b74bb83fccc34c7851 |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/644fc736d0ba21883eb46bea28a933d644689418 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/09403542e32ba694b4195ed6e001ad4ccaa06329 |     
    sh4a     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2c4ee5470db70731b762e74b38835830710362c4 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4baaebed8a39a77b06ee6679387996bc0f195d9a |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/6b66a5e280989a8fa8ae7d75043484cbef328a42 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/18ef90fe56bd5e6629a11841033250679be5b4a5 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/6727f213d2c88ea0a6836ac2462459dd4aee2424 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ac4aaaa383e4a56be29ab57811a0efaab87e38ba |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c6528ad2cb0105e4164e6da1a120a98f5efc99b9 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8dca9cd48a9cec8def76dea8692dd0e72836c094 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d45446f9312687a786084d9ac2d61a666a6abd9d |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/fbb77b17fa07bab4896b9a1873e01fb72139b907 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/798c6945d901dc3fc12cc275740d1216737b8732 |     
    i586     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/cc5ea51bde10259da943b2fdd570c5969065e9df |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ac6b890e20e703fb6e45a7ace71a64ddf16a9197 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5fc6e9355cd74cda90d3c0ffed5b83c62e50a12b |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c739ccbee603d51f4df23718074ace9a4b833def |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3d96013947152caee7256ec28948e0316e506c09 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c08894380476d73691aa0cf9725d842a6ba21886 |     
    mips     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1f39e5cf76355991c17b0bc5c138844d0a1d2e56 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3a504e244a09b31643368bc5b9f4a25b34db6d16 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0f2434a6b1a919f57af9b52717a34d719cdcf1e3 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/fefccd907034e22cca400a9b1732972794d5258e |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/13884c4466a591a3d513d59e69707ca1a9a9419e |     
powerpc64le  |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/bc58e99d914961fa295de99823f8559ab8f02486 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/ec915f8f354d4bd7cb74220267f56154550c3ea9 |     
 microblaze  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/8b4816c386cefa7fd7dd6a34a59be4d9cac6e3d7 |     
 microblaze  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/83af7e4c0d3076cceb147e4759ec4e108dd2112c |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/b67d3a1af80c89e4293434044df167a6cb0fed14 |     
    arm      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/503c886926c075f8641b33e4a18b6f606869d948 | ORPH
   xtensa    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/96d952b93de8749a99ec9c6cd2e412c5092bb7e3 | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a840349258b8a072e49781d08a0a8e02df7cdb22 | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e88e54d94800bba9bcfe7ed343319e8b1f48b57e | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/71e6d6e07197506fb81cd00f7d85e9063d8f629c | ORPH
   sh4aeb    |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/b10855d388c806af97a4c4f3f5d85d18aecb1c70 | ORPH
 powerpc64   |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/5d929d6860c9864107b4b17089f917d72bc6bec4 | ORPH
   armeb     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/23ec386f4add920e7e5d2edfe1d423cc9d14fee9 | ORPH
   sh4aeb    |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/58eb0bf3b9801a25b3ee951a1735f9430286f08d | ORPH
  powerpc    |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/42a060971d410b6cd0e4215dcadd55e532424510 | ORPH
powerpc64le  |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/3e5c0380f48bfe485571a5fc7b53e1e8c6b629b6 | ORPH
   s390x     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/a8aac595f173efc128258e3d9a6c35676777134f | ORPH
  riscv64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/487c914d2fdd2a04028c61389ee32e1ec3cdc35c | ORPH
  mips64el   |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/baba7a2508d83e73863619a61c1e35a16f2f51e6 | ORPH
   s390x     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/350884f56c9738fc6921ea258b310e7b3b755aed | ORPH
   mips64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/5437429007c036dc0aceec76066fd9123392b414 | ORPH
   mipsel    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/b963f2ea3d02db18e616afb803a9fe0f6366c42a | ORPH
 aarch64_be  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/80560f0de3fcd82330a26b5c262436870267826a | ORPH
powerpc64le  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/798be7d9408b4b756251848d875ea6a15afd8b92 | ORPH
microblazeel |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/9a1c78b7dfedd27b8194a344a7bf8c3bb813e794 | ORPH
  riscv64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/b15d7bc15a80522993029265cee87c242a72c491 | ORPH
    i686     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/a9c5df0641137a3f33aeda6ecbeaa0b71c61b3a4 | ORPH
 powerpc64   |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/03016b25f5e67a9060a28831d0b38d11099d693a | ORPH
    or1k     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/adbd6a7d1f8084ac429dfeb7e70b33012bbad69f | ORPH
   s390x     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/bd8cb12428f74fdb191aaf4fccd57650bf738ca5 | ORPH
  sparc64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/8a5e3cc1d58da23a0146cdc30c2f84bd154bdb3f | ORPH
 powerpc64   |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/3b118254016fec41cc8014dba4568d2d433efa5c | ORPH
   sh4eb     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/4e7bfe3a283a4f9a819c3e20cc0dc6b7e60165c6 | ORPH
   s390x     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/1c4dc3b3f43ec86a1df50d6c8c2189f8ade81220 | ORPH
  powerpc    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/4e765aaa995d324d19ab768c4db245a396fc67ff | ORPH
    arm      |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/35a936b7d54a443c515a0a2b02993ce1344ea62b | ORPH
  riscv64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/b09679470f00daf68496b2a8bc307b2329dd2202 | ORPH
  mips64el   |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/45e4665ef93980b26f15fd06cc3d5bfbad663d69 | ORPH
   s390x     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/b8975c6d68278f789d2393b0e93750983e77c5a3 | ORPH
 aarch64_be  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/874d36b81d183aa075dcaa5809ac12a4c204e49e | ORPH
   x86_64    |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/a42551ff506a9d11858496aae65f1c4492866ee5 |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/46e87d5e372b8aed1cc12f2d43d3f0a35221209c | ORPH
   s390x     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/f2d2b62557e0458512c270fd8cd11fd79fd57b50 | ORPH
 aarch64_be  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/6a58c6172ad017375907a347015d357fa4e23d49 | ORPH
  aarch64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/d2282422c70cb2b7e57ae89f1ba6dc0b982f4d8e | ORPH
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/b59cf98424904a245cbb8ee976746ff2a6d9093c | ORPH
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/275140811f9fc08a9bbb88483b77afa8c2e0eca3 |     
   xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/5de2ebf537afcd082b40c44373055ea62ee44361 |     
   xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/fee9f2be6ca50791841b8fbdaef6515d7844cf19 |     
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/2ba36202888b810be08eedde6fb512340a037993 |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/f597fdc5e628f897266d029852a9582578cdcf28 | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/867d6adfd615a35443af0d7b0adb3d872ca55f11 | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e609dfec30f52eaa58f49773cf223294057f43f8 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/720702c02fdae518aff17fba544cac0c09876593 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/13eb290d272ede687546039cf338b3e219b5766d | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/340eee3313929cf6d8d117cc2d84be9a5ee563de | ORPH
    arm      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/0d7c53d219a2755346c7ad6aa764d02d7b27dc3b | ORPH
  sparc64    |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/b3832b80a736e515c5a07ea2d5ccf9aea49ee03f |     
    sh4a     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/13ec76631406ed455ab0ecfe55c3ffd379c35b55 |     
    sh4a     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/da2ea2df042755b77e05c0ed555440c40ef4f0c8 |     
    sh4      |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/1cfb1709bdedd9a7cb89e6bef6a06657d15b7cd7 |     
   sh4eb     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/c05a9c9b86aa4c42eaec52220419980cc84e1bb3 |     
    arm      |          readline-8.2          | NOK | https://autobuild.buildroot.org/results/449331157c02b36e3eda6abba1ca4da005d33a05 | ORPH
   sparc     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/e619e58279b4aed3dcef2643475344fa4df5f749 |     
microblazeel |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/77aa0b662ba5ffa653909af9cb2bec8646e8733e |     
 powerpc64   |          snappy-1.2.1          | NOK | https://autobuild.buildroot.org/results/5506df14f0b969b6ba04487aa08ed8067ca48ed3 | ORPH
    i686     |          snappy-1.2.1          | NOK | https://autobuild.buildroot.org/results/d36517229050b66def86f2468bb59bd8dc3ab814 | ORPH
   x86_64    |          snappy-1.2.1          | NOK | https://autobuild.buildroot.org/results/5243e795442eeb40105bf390cd654686d6bbe26d | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/69f5640a5d94dd573176edbb7534a00087053b32 | ORPH
    arc      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/6ef7042724d824628ad14f6786c69468075508ed | ORPH
    arc      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/77c865f941612e99d8b6a7f66b5bc06f90d6b7db | ORPH
    mips     | toolchain-external-codesour... | NOK | https://autobuild.buildroot.org/results/fd3b90e98edd54524e17fea938b745b5c884820d | ORPH
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/d12cc544a9abdade0ba06597cef8171bf98506d5 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/4d581fa65909df2c15448e627022bdb9d22083db |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/677ea7b05a1de35d0f478971d9054df629216825 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1feaf73c91f69cdede5898d7183eb54d56d4ac39 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/dbfb4aa1f834272c0c14a0d468dc459cdd6a9e36 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/025ab837ef03eadc9daefc180b9ed22a87664a0f |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/bcf6eca18a6d8539bda401131ca297fe5ebd7bcd |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/11466f42fb28ec2e980a7c999d35414b954cf811 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/36dc42b40ba2dd008cd3bc34ee7c6344858f9bd8 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c892e2f20f2ebae872f3ad540390758656c57a5b |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/bc56980218c457c78f7c39eea01d80da2f56f0c9 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/450a2ce61ea12af95d99af4b19397f4a998b9880 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/475bdacee9077d1cea6260681a348cb3f70b4986 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/02c83fe3fe1b89ced33b9b08f2e40f96336b3958 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8a3d79d02cc3da37f515d46f61f51767a5488add |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/de712cfb9ec94bd35f968ff234a15ac6eec7d01a |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/bedc61da0961f3c749e7e47f78976ae14845c4f2 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/d95ba5e54d2c28b9bddab763ec2c977a5eb4278e |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/4a7d7b65b75a7d1ce4fb6c99a1513e2a875234c3 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/4fb283c696be600b5d891d8b271e5c700b068181 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/ff692a2b1689137a5ad354b11319ce8c08f6019b |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/be45fca0de679d0f0af7051152a4451b6c813bf7 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/5fc025dae32a69895bbf9dc0cd9d7874295770d0 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/b2c1d94b846bc6dd93b48116ffde6da2c1d8d3e3 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/453995b013c6df5632ae9c38c926bdd5ca220585 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7930df5c1efef4b4b245ab793210d7783e4038ae |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/4c8d638b0eb84023089e77f94969b1771f75dadd |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2b9951b1e493956dfd3a12acd2451c7f0d943fd8 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/c9a7687fa0f6a59975f7a6cf9ba1e4b12e0f1d50 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/8fc21fb85b7265b6ef622743e3f5c28a2b55422e |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/d3b9d043bf300c2d75c5290bed498f5b134fface |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/9aa30904af2fd719c62aa164656a4be1fe1104a3 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/514987400ba0ba7184070200feee3a6c6f0749c6 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/72fc610f33451bc8927b116bc769b386e70e01ce |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/72c8852bc11528a66419a164588c13bf66bb137c |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/a4a5678e6e4363420d6458807d6d5c3ae203277a |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/bbae553119a814738126ce5e7bc5c486a0112af4 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/071de7c7f154535fd5c7b147bab199438e48da1a |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/29256161e2230f934b6655da452a2070213d4848 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/d054b3b1fb354f4ee3affcac877db32f45bc5526 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/0a6665cd9e83fee2e93376bdfaf2d8d40294f6c9 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/f23714136a99217f172fa5d328f2694c373c4fb7 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/16d64379753416d3a6458efefa6ae21005b7b478 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/06ca7ebbc2aafa1bf4f108ac2c640749e25eafcd |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/4c4e744c8c724f08f9662712f7e034438866b2c2 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/df29c1c0cd6e3013da1c867639687f12f6b3465a |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/dec49f5ec37defd4d2632e31f7349216ccfaf3cd |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/739f1423ba19b80146827f893ee2b3180a3b21c3 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/1aee9063b79b9d1fc1ffc1f362fb4239cb29a6d2 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/94b6897ac1ebf2e23a0d2ccd296fcd768ba1cf36 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/f08687500481a6633a5efc1f3ab72a22b3e77ea6 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6611383bcf6aa11bbee06665c6369505a1043680 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/8ca024c6f6e4058d14ea23a63ecb9c259b81fb7e |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/e0bbcca535eb67d3cf0f2fb9911a8ccb2c2d3a85 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/882e400a8dc47b72a448789f1d277f3511118b1b |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/3484f2e3428e699480e1acbe90ba89f6039960dc |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1e5012942634303769aa21093192fecf7cdb9fe5 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/07df893991405239b50cb413849c16642cf35ce9 |     
   armeb     |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/c0b3c46a89f50bd902dbcbda544b08096bf7cba7 |     
    i686     |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/6c4f16033c64b50055023c799e23b454fab33b05 | ORPH
powerpc64le  |       xlib_libXau-1.0.11       | NOK | https://autobuild.buildroot.org/results/9d94b951eab827a0d930a42c05b7dc79404578dc | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   libcap-2.73 | 2 
             bluez5_utils-5.79 | 1 
             fluent-bit-3.2.10 | 1 
  gobject-introspection-1.82.0 | 1 
                haveged-1.9.19 | 1 
host-android-tools-4.2.2+gi... | 1 
                  ledmon-1.0.0 | 1 
                   perl-5.40.2 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/e90cba78f3a26b7b8327b091acb847f943eed68d |     
    mips     |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/be40d0e4469357063fd6ab08401e18a3fdaf4d1d |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/65ffdbf39483c0b654c5090866364c6e586d08d9 | ORPH
   xtensa    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/ae2796ea83b86cd8b6db4758d6820a1d86448ed5 |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/3d6d34ab271c1740c30aea9f8bf594f06a938f72 |     
    or1k     |          ledmon-1.0.0          | NOK | https://autobuild.buildroot.org/results/e15654af4fc56d16a18e46422d813f7037238ea7 |     
    i686     |          libcap-2.73           | NOK | https://autobuild.buildroot.org/results/cc7f3a2ab9386fa8cdb594769142a130ad2850a1 |     
  aarch64    |          libcap-2.73           | NOK | https://autobuild.buildroot.org/results/2eb16c875059ce6543acbf4b1842bc7e1fe4f061 |     
 aarch64_be  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/7c688f15ceebc59b6d31a20eefdcd1e4d417273f |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e28dbf540059bf9e52fa343726f440fbb8939537 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org         |   version    |   upstream   | orph?
-------------------------------+----------+-----------------------------------------------+--------------+--------------+-------
                  aardvark-dns |  DISTRO  | https://release-monitoring.org/project/242641 | v1.14.0      | 1.15.0       | ORPH
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.3        | ORPH
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/013117 | 3.37.2       | 48.0         |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/021316 | 4.6.1        | 4.7.2        |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2025.1       | ORPH
                      alsa-lib |  DISTRO  | https://release-monitoring.org/project/000038 | 1.2.13       | 1.2.14       |     
                    alsa-utils |  DISTRO  | https://release-monitoring.org/project/000037 | 1.2.13       | 1.2.14       |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/013989 | 4.2.2+git... | 15.0.0_r36   |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/006170 | 10.0         | 12.0         |     
                           apr |  DISTRO  | https://release-monitoring.org/project/000095 | 1.7.5        | 1.7.6        |     
                         argus |  DISTRO  | https://release-monitoring.org/project/000107 | 3.0.8.2      | 5.0.2        | ORPH
                      asterisk |  DISTRO  | https://release-monitoring.org/project/009838 | 22.3.0       | 22.4.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/007841 | 2.50.0       | 2.56.2       |     
                           atf |  DISTRO  | https://release-monitoring.org/project/021394 | 0.21         | 0.23         | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/007962 | 2.36.2       | 2.36.3       |     
                          atop |  DISTRO  | https://release-monitoring.org/project/000135 | 2.11.0       | 2.11.1       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/015225 | 3.1.2        | 4.0.3        |     
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/000142 | 2023.02.20   | 2024.10.16   | ORPH
                      automake |  DISTRO  | https://release-monitoring.org/project/000144 | 1.16.5       | 1.17         | ORPH
                       avocado |  DISTRO  | https://release-monitoring.org/project/013385 | 98.0         | 110.0        | ORPH
                   babeltrace2 |  DISTRO  | https://release-monitoring.org/project/007137 | 2.0.6        | 2.1.1        |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
               bash-completion |  DISTRO  | https://release-monitoring.org/project/005667 | 2.11         | 2.16.0       | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/014740 | 2024.2       | 2025.1       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/019529 | 2024.4       | 2025.1       |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/010587 | 1.11.1       | 1.12.0       |     
                            bc |  DISTRO  | https://release-monitoring.org/project/000170 | 1.07.1       | 1.08.1       | ORPH
                  bcache-tools |  DISTRO  | https://release-monitoring.org/project/021397 | 1.0.8        | 1.1          | ORPH
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/021323 | 1.73         | 1.75         | ORPH
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/014746 | 4.4.8        | 5.4.17       | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/014378 | 4.4.8        | 5.4.17       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/080042 | 4.4.8        | 5.4.17       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.14      | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/014923 | 9.18.33      | 9.20.8       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/007981 | 2.43.1       | 2.44         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/000192 | 2.15.1       | 3.1.1        |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/013618 | 28.0         | 29.0         |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.82         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.82         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/000211 | 7.20.2       | 8.0.2        |     
                         boost |  DISTRO  | https://release-monitoring.org/project/006845 | 1.83.0       | 1.88.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/021578 | 4.3.1        | 5.3.6        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/000214 | 3.5.0        | 3.8.1        | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.1.0       | 7.5.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.19.1       | 0.23.2       |     
                        brltty |  DISTRO  | https://release-monitoring.org/project/000220 | 6.6          | 6.7          |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/000227 | 6.10         | 6.14         | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/021325 | 0.5.10       | 0.6.3        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/021326 | 0.5.5        | 0.5.7        | ORPH
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/009026 | 20241223     | 20250419     |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/007959 | 1.16.2       | 1.18.0       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/021403 | 1.0.0        | 1.2.1        |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/010888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/011515 | 0.10.4       | 1.1.0        |     
                        ccache |  DISTRO  | https://release-monitoring.org/project/000257 | 4.11.2       | 4.11.3       | ORPH
                          ccid |  DISTRO  | https://release-monitoring.org/project/002612 | 1.5.2        | 1.6.2        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/085785 | 3.9.1        | 4.4.9        | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/000276 | 3.8.1        | 20200710     |     
                chocolate-doom |  DISTRO  | https://release-monitoring.org/project/008547 | 3.0.1        | 3.1.0        |     
                        circus |  DISTRO  | https://release-monitoring.org/project/021726 | 0.16.1       | 0.19.0       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/000291 | 1.0.8        | 1.4.2        |     
                         clang |  DISTRO  | https://release-monitoring.org/project/011811 | 15.0.7       | 20.1.5       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/020578 | 2.3.2        | 2.5.0        |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/010503 | 3.0.21.02.21 | 3.0.25.02.14 |     
                   cloudflared |  DISTRO  | https://release-monitoring.org/project/186920 | 2025.1.0     | 2025.100.150 |     
                        clpeak |  DISTRO  | https://release-monitoring.org/project/015180 | 1.1.2        | 1.1.4        |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/000306 | 3.31.5       | 4.0.2        |     
                        cmocka |  DISTRO  | https://release-monitoring.org/project/011779 | 1.1.5        | 1.1.7        |     
                   cni-plugins |  DISTRO  | https://release-monitoring.org/project/096794 | 1.3.0        | 1.6.2        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/000330 | 4.3.2        | 4.3.8        |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/021882 | 0.9.1        | 0.10.0       | ORPH
                   compiler-rt |  DISTRO  | https://release-monitoring.org/project/017705 | 15.0.7       | 20.1.5       |     
                      composer |  DISTRO  | https://release-monitoring.org/project/009710 | 2.5.8        | 2.8.9        |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/096793 | 2.1.8        | 2.1.13       |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/000338 | 1.4.7        | 1.4.8        | ORPH
                    containerd |  DISTRO  | https://release-monitoring.org/project/016460 | 2.0.2        | 2.1.0        |     
                     coreutils |  DISTRO  | https://release-monitoring.org/project/000343 | 9.5          | 9.7          | ORPH
                   cpp-httplib |  DISTRO  | https://release-monitoring.org/project/274636 | 0.19.0       | 0.20.1       |     
                      cracklib |  DISTRO  | https://release-monitoring.org/project/000362 | 2.9.11       | 2.10.3       |     
                          criu |  DISTRO  | https://release-monitoring.org/project/000366 | 3.19         | 4.1          |     
                       crudini |  DISTRO  | https://release-monitoring.org/project/021669 | 0.9.5        | 0.9.6        |     
                          crun |  DISTRO  | https://release-monitoring.org/project/096792 | 1.18.2       | 1.21         |     
               cryptodev-linux |  DISTRO  | https://release-monitoring.org/project/021409 | 1.13         | 1.14         | ORPH
                       cukinia |  DISTRO  | https://release-monitoring.org/project/138119 | 0.6.0        | 0.7.0        | ORPH
                          cups |  DISTRO  | https://release-monitoring.org/project/000380 | 2.4.11       | 2.4.12       |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/005541 | 1.28.17      | 2.0.1        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/021335 | 2.11.0       | 4.9.0        |     
                          dado |  DISTRO  | https://release-monitoring.org/project/058442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/021412 | 3.3.0        | 3.4.0        | ORPH
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/010252 | 3.3.0        | 3.4.0        | ORPH
                         dante |  DISTRO  | https://release-monitoring.org/project/014716 | 1.4.3        | 1.4.4        | ORPH
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.9        | 3.0.19       |     
                     darkhttpd |  DISTRO  | https://release-monitoring.org/project/000391 | 1.15         | 1.16         |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.13.4       | ORPH
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.3.6        | ORPH
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.2.2        | ORPH
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.4.1        | ORPH
                         dav1d |  DISTRO  | https://release-monitoring.org/project/018920 | 1.5.0        | 1.5.1        |     
                        davfs2 |  DISTRO  | https://release-monitoring.org/project/007487 | 1.7.0        | 1.7.1        | ORPH
                          dbus |  DISTRO  | https://release-monitoring.org/project/005356 | 1.14.10      | 1.16.2       | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/000402 | 1.2.18       | 1.4.0        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/015086 | 7.2.641      | 7.3.1        | ORPH
                      ddrescue |  DISTRO  | https://release-monitoring.org/project/000410 | 1.28         | 1.29.1       | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/021341 | 4.11         | 5.22         | ORPH
                    dehydrated |  DISTRO  | https://release-monitoring.org/project/011312 | 0.7.1        | 0.7.2        |     
                         delve |  DISTRO  | https://release-monitoring.org/project/040149 | 1.22.1       | 1.24.2       |     
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/000421 | 0.26         | 0.28         | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/011429 | 10.1.0       | 10.2.3       |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/000431 | 1.3-20220117 | 1.3-20250116 | ORPH
                     diffutils |  DISTRO  | https://release-monitoring.org/project/000436 | 3.10         | 3.12         | ORPH
                         dillo |  DISTRO  | https://release-monitoring.org/project/000438 | 3.0.5        | 3.2.0        | ORPH
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/021076 | 27.5.1       | 28.1.1       |     
             docker-cli-buildx |  DISTRO  | https://release-monitoring.org/project/325723 | 0.16.1       | 0.23.0       | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/006185 | 2.32.4       | 2.36.0       |     
         docker-credential-gcr |  DISTRO  | https://release-monitoring.org/project/377457 | v2.1.26      | 2.1.29       | ORPH
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/000447 | 27.5.1       | 28.1.1       |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/021342 | 2024.4       | 2025.1       |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/000456 | 2.3.21.1     | 2.4.0        |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/021418 | 0.5.21.1     | 2.4.0        |     
                          dpdk |  DISTRO  | https://release-monitoring.org/project/000459 | 24.11.1      | 25.03        |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/010627 | 059          | 107          |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/000462 | 9.21.4       | 9.31.0       |     
                     dropwatch |  DISTRO  | https://release-monitoring.org/project/021344 | 1.5.4        | 1.5.5        |     
                            dt |  DISTRO  | https://release-monitoring.org/project/021844 | 18.32        | 21.27        | ORPH
                       dtbocfg |  DISTRO  | https://release-monitoring.org/project/235269 | 0.1.0        | 0.1.1        |     
                      dump1090 |  DISTRO  | https://release-monitoring.org/project/231403 | 9.0          | 10.0.1       |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 1.1.2        | 1.2.0        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/017392 | 1.7          | 1.8.2        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/017770 | 3.1.7        | 3.2.2        |     
                            ed |  DISTRO  | https://release-monitoring.org/project/000659 | 1.20.2       | 1.21.1       | ORPH
                           efl |  DISTRO  | https://release-monitoring.org/project/006128 | 1.26.3       | 1.28.1       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/000667 | 24.07        | 25.04        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/005679 | 0.192        | 0.193        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/017781 | 0.69         | 0.77         | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/006601 | 2.3.3        | 2.8.4        |     
                          enet |  DISTRO  | https://release-monitoring.org/project/000696 | 1.3.17       | 1.3.18       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/000698 | 0.25.4       | 0.27.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/000707 | 26.0.2       | 27.3.4       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/017060 | 1.0.23       | 1.0.24       |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/045375 | 1.0.23       | 1.0.25       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/009302 | 0.6.14       | 0.8.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/010576 | 1.0.54       | 1.0.57       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/009222 | 1.0.30       | 1.0.31       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/010455 | 1.1.21       | 1.1.22       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/008643 | 1.0.26       | 1.0.27       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/045378 | 1.0.16       | 1.0.18       |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/063188 | 1.8.5        | 1.8.6        |     
                      espflash |  DISTRO  | https://release-monitoring.org/project/373490 | 3.2.0        | 3.3.0        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/005482 | 2.9.6.1      | 2.9.7.0      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/000767 | 2.6.3        | 2.6.6        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/094441 | 1.2.5        | 1.2.9        |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/000769 | 0.27.6       | 0.28.5       |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.20.19      | 0.21.3       |     
                         faad2 |  DISTRO  | https://release-monitoring.org/project/013755 | 2.11.1       | 2.11.2       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/012048 | 1.37.1.1     | 1.37.1.2     | ORPH
                         fastd |  DISTRO  | https://release-monitoring.org/project/017116 | 22           | 23           |     
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.1.8        | 3.3.1        |     
                           fio |  DISTRO  | https://release-monitoring.org/project/000806 | 3.38         | 3.39         |     
                     firewalld |  DISTRO  | https://release-monitoring.org/project/009989 | 2.0.2        | 2.3.0        | ORPH
                       flannel |  DISTRO  | https://release-monitoring.org/project/007421 | 0.26.0       | 0.26.7       |     
                   flatbuffers |  DISTRO  | https://release-monitoring.org/project/016642 | 24.12.23     | 25.2.10      |     
                          flot |  DISTRO  | https://release-monitoring.org/project/007184 | 0.8.3        | 4.2.6        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/000823 | 1.3.7        | 1.4.3        | ORPH
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/010437 | 2.4.5        | 2.4.6        |     
                           fmt |  DISTRO  | https://release-monitoring.org/project/011526 | 11.0.2       | 11.2.0       |     
                       fmtools |  DISTRO  | https://release-monitoring.org/project/021435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/000826 | 4.7.0        | 6.7.2        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/000827 | 2.16.0       | 2.16.2       | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.16.2       | 1.22.3       |     
                         fping |  DISTRO  | https://release-monitoring.org/project/000834 | 5.2          | 5.3          |     
                      freeipmi |  DISTRO  | https://release-monitoring.org/project/000848 | 1.6.14       | 1.6.15       |     
             freeradius-server |  DISTRO  | https://release-monitoring.org/project/000853 | 3.2.6        | 3.2.7        |     
                    fscryptctl |  DISTRO  | https://release-monitoring.org/project/270981 | 1.0.0        | 1.2.0        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.13         | 1.15         |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/021438 | 1.9.1        | 1.12.0       |     
                         fwupd |  DISTRO  | https://release-monitoring.org/project/005833 | 2.0.4        | 2.0.9        |     
                          gawk |  DISTRO  | https://release-monitoring.org/project/000868 | 5.3.1        | 5.3.2        | ORPH
                gcc-bare-metal |  DISTRO  | https://release-monitoring.org/project/006502 | 14.2.0       | 15.1.0       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/011801 | 3.40.0       | 4.4.0.1      | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/000881 | 3.8.2        | 3.11.0       |     
                          gdbm |  DISTRO  | https://release-monitoring.org/project/000882 | 1.24         | 1.25         | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/067634 | 2.5.5        | 2.8.15       |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/018420 | 2.4.1        | 2.5.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/000898 | 0.22.4       | 0.25         | ORPH
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/011337 | 15.5.0       | 18.0.1       |     
                       gkrellm |  DISTRO  | https://release-monitoring.org/project/001170 | 2.3.11       | 2.4.0        |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/021353 | 2.76.0       | 2.80.1       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/007960 | 2.76.0       | 2.84.0       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/001181 | 1.0.0        | 1.0.1        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/008732 | 0.7.0        | 0.7.1        |     
            gmrender-resurrect |  DISTRO  | https://release-monitoring.org/project/021445 | 0.1          | 0.3          |     
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/001202 | 4.0.0        | 4.0.1        |     
                      gnuchess |  DISTRO  | https://release-monitoring.org/project/001206 | 6.2.9        | 6.2.11       | ORPH
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/001215 | 2.4.7        | 2.5.6        |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/001217 | 3.10.11.0    | 3.10.12.0    |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/001223 | 1.82.0       | 1.84.0       | ORPH
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/021085 | 2.3.2        | 2.5.4        |     
                         gperf |  DISTRO  | https://release-monitoring.org/project/001237 | 3.1          | 3.3          | ORPH
                          gpsd |  DISTRO  | https://release-monitoring.org/project/006846 | 3.25         | 3.26.1       |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/009771 | 2.15.9       | 2.17.6       |     
                    gr-osmosdr |  DISTRO  | https://release-monitoring.org/project/021447 | 0.2.4        | 0.2.6        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/005410 | 6.2.0        | 7.6.0        | ORPH
                          grep |  DISTRO  | https://release-monitoring.org/project/001251 | 3.11         | 3.12         |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/019117 | 1.66.1       | 1.72.0       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/013139 | 45.0         | 48.0         |     
                           gsl |  DISTRO  | https://release-monitoring.org/project/001267 | 2.7.1        | 2.8          | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/021856 | 1.24.11      | 1.26.1       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/021846 | 0.13.1       | 2.2.0        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/021848 | 1.24.11      | 1.26.1       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/021849 | 1.24.11      | 1.26.1       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/021850 | 1.24.11      | 1.26.1       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/021852 | 1.24.11      | 1.26.1       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/015187 | 1.24.11      | 1.26.1       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/003881 | 1.24.11      | 1.26.1       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/021853 | 1.24.11      | 1.26.1       | ORPH
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/021855 | 1.24.11      | 1.26.1       | ORPH
                          gstd |  DISTRO  | https://release-monitoring.org/project/235022 | 0.15.0       | 0.15.2       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/001263 | 1.24.11      | 1.26.1       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.24.11      | 1.26.1       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/018290 | 1.16.0       | 1.17.0       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/007724 | 3.24.7       | 5.16.0       |     
                         guile |  DISTRO  | https://release-monitoring.org/project/001277 | 3.0.9        | 3.0.10       |     
                  gumbo-parser |  DISTRO  | https://release-monitoring.org/project/214990 | 0.10.1       | 0.13.1       |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/001281 | 1.6.6        | 1.6.8        |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/001282 | 0.14.1       | 0.14.3       |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/001284 | 0.12.1       | 0.12.2       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/001285 | 5.2.14       | 5.3.5        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/005496 | 1.48.1       | 1.57.2       | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/006136 | 2023.01.1    | 2024.02.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/001298 | 2.6.15       | 3.1.7        |     
                heirloom-mailx |  DISTRO  | https://release-monitoring.org/project/095708 | 12.5         | 14.9.25      |     
                        hidapi |  DISTRO  | https://release-monitoring.org/project/005594 | 0.14.0       | 0.15.0       | ORPH
                         hplip |  DISTRO  | https://release-monitoring.org/project/001327 | 3.17.10      | 3.25.2       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/001332 | 3.3.0        | 3.4.1        | ORPH
                       htpdate |  DISTRO  | https://release-monitoring.org/project/132187 | 1.3.7        | 2.0.0        |     
                         hwloc |  DISTRO  | https://release-monitoring.org/project/013501 | 2.11.2       | 2.12.1       |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/021355 | 2.50.2       | 2.56.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/016134 | 73-2         | 77-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/021670 | 2.9          | 2.14         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/021673 | 0.8.41       | 0.8.44       | ORPH
                  igh-ethercat |  DISTRO  | https://release-monitoring.org/project/021674 | 1.6.3        | 1.6.4        |     
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/001372 | 7.1.1-43     | 7.1.1-47     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/021676 | 1.7.3        | 1.12.5       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/008864 | 3.20.2.2     | 4.23.9.0     | ORPH
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/020341 | 25.2.1       | 25.2.2       |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/021679 | 3.506        | 3.507        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/001391 | 3.1.9        | 3.2.1        | ORPH
                         ipset |  DISTRO  | https://release-monitoring.org/project/001393 | 7.23         | 7.24         |     
                     iptraf-ng |  DISTRO  | https://release-monitoring.org/project/007034 | 1.2.1        | 1.2.2        |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/001402 | 1.9.3        | 1.9.4        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/013286 | 0.26         | 0.27         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/018380 | 3.0          | 3.8          | ORPH
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.35.2       | 1.38.0       |     
                       jansson |  DISTRO  | https://release-monitoring.org/project/001417 | 2.14         | 2.14.1       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/015715 | 1.1.2        | 1.3.1        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/001421 | 2.0.33       | 4.2.5        |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/001459 | 0.81         | 0.83         |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/029701 | 3.6.1        | 3.6.3        | ORPH
                          jose |  DISTRO  | https://release-monitoring.org/project/011761 | 11           | 14           |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/013910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/021681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/059395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/021815 | 1.13.1       | 1.14.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/021816 | 1.10.4       | 1.14.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/021817 | 1.19.5       | 1.21.0       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/001492 | 2.6.4        | 2.7.1        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/001504 | 2.2.8        | 2.3.3        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.14.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.14.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.14.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.14.0       |     
                          kmod |  DISTRO  | https://release-monitoring.org/project/001517 | 33           | 34.2         |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/021462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.2        | 3.5.3        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/012418 | 2.2.0        | 2.3.1        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/016901 | 0.13         | 0.14.1       | ORPH
                         lcms2 |  DISTRO  | https://release-monitoring.org/project/009815 | 2.16         | 2.17         |     
                        ledmon |  DISTRO  | https://release-monitoring.org/project/012346 | 1.0.0        | 1.1.0        |     
                          less |  DISTRO  | https://release-monitoring.org/project/001550 | 661          | 678          | ORPH
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20250127.0   | 20250512.0   |     
                         libao |  DISTRO  | https://release-monitoring.org/project/007629 | 1.2.0        | 1.2.2        | ORPH
                     libassuan |  DISTRO  | https://release-monitoring.org/project/001559 | 2.5.7        | 3.0.2        | ORPH
                       libavif |  DISTRO  | https://release-monitoring.org/project/178015 | 1.1.1        | 1.3.0        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/001567 | 0.11.7       | 0.12.2       | ORPH
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/007869 | 2.10         | 2.11         | ORPH
                libcamera-apps |  DISTRO  | https://release-monitoring.org/project/328456 | 1.5.0        | 1.7.0        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/001575 | 2.0.3        | 3.2.0        |     
                        libclc |  GUESS   | https://release-monitoring.org/project/376264 | 15.0.7       | 20.1.5       |     
                     libconfig |  DISTRO  | https://release-monitoring.org/project/001580 | 1.7.3        | 1.8          |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/015531 | 2.10.18      | 2.10.19      | ORPH
                      libde265 |  DISTRO  | https://release-monitoring.org/project/011239 | 1.0.15       | 1.0.16       |     
                      libdecor |  DISTRO  | https://release-monitoring.org/project/312806 | 0.1.1        | 0.2.3        |     
                    libdeflate |  DISTRO  | https://release-monitoring.org/project/242778 | 1.22         | 1.24         |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/020540 | 1.13.1       | 1.13.4       |     
                       libexif |  DISTRO  | https://release-monitoring.org/project/001607 | 0.6.24       | 0.6.25       | ORPH
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/012043 | 0.99.9.1     | 1.2304.0     |     
                       libfcgi |  DISTRO  | https://release-monitoring.org/project/059392 | 2.4.5        | 2.4.6        | ORPH
                         libfm |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.0        | ORPH
                   libfm-extra |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.0        | ORPH
                   libfreeglut |  DISTRO  | https://release-monitoring.org/project/000846 | 3.4.0        | 3.6.0        |     
                     libgcrypt |  DISTRO  | https://release-monitoring.org/project/001623 | 1.11.0       | 1.11.1       | ORPH
                        libgee |  DISTRO  | https://release-monitoring.org/project/001625 | 0.20.6       | 0.20.8       |     
                    libgeotiff |  DISTRO  | https://release-monitoring.org/project/021361 | 1.7.3        | 1.7.4        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/001174 | 2.6.4        | 3.40.0       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/010024 | 2.84.0       | 2.84.1       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/012098 | 1.4.0        | 1.7.0        | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/001628 | 1.51         | 1.55         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/001239 | 1.23.2       | 1.24.2       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/012558 | 2.5.27       | 2.5.31       | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/020640 | 1.6.5        | 2.2.1        | ORPH
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/001563 | 2.2.1        | 2.2.2        | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/311549 | 3.24.43      | 3.24.49      |     
                       libgtk4 |  DISTRO  | https://release-monitoring.org/project/013942 | 4.14.5       | 4.18.5       |     
                       libheif |  DISTRO  | https://release-monitoring.org/project/064439 | 1.18.2       | 1.19.8       |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/001632 | 0.5.48       | 0.5.50       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/010656 | 1.15         | 1.18         | ORPH
                     libid3tag |  DISTRO  | https://release-monitoring.org/project/021478 | 0.15.1b      | 0.16.3       | ORPH
                        libidn |  DISTRO  | https://release-monitoring.org/project/001639 | 1.42         | 1.43         |     
                       libidn2 |  DISTRO  | https://release-monitoring.org/project/005597 | 2.3.7        | 2.3.8        |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/021479 | 0.10.3       | 2.3.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/005781 | 1.27.0       | 1.28.1       | ORPH
                      libiscsi |  DISTRO  | https://release-monitoring.org/project/010862 | 1.20.0       | 1.20.2       | ORPH
                       libjcat |  DISTRO  | https://release-monitoring.org/project/229583 | 0.2.1        | 0.2.3        |     
                        libjwt |  DISTRO  | https://release-monitoring.org/project/242868 | 3.2.0        | 3.2.1        |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 2.0.5        | 2.0.6        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/021363 | 2.48         | 248          |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/021483 | 0.31         | 0.32         | ORPH
                    libmanette |  DISTRO  | https://release-monitoring.org/project/229630 | 0.2.11       | 0.2.12       |     
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/007470 | 1.10.0       | 1.12.2       |     
                   libmediaart |  DISTRO  | https://release-monitoring.org/project/013148 | 1.9.6        | 1.9.7        |     
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/001986 | 2.2.7        | 2.3.2        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/016827 | 0.10.1alpha  | 1.11         |     
        libnetfilter_conntrack |  DISTRO  | https://release-monitoring.org/project/001675 | 1.0.9        | 1.1.0        |     
                        libnfs |  DISTRO  | https://release-monitoring.org/project/007325 | 5.0.3        | 6.0.2        | ORPH
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/001681 | 1.2.7        | 1.2.9        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/001683 | 0.1.21       | 0.1.22       |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/075209 | 4.2.2        | 6.2.1        |     
                        libodb |  DISTRO  | https://release-monitoring.org/project/001687 | 2.4.0        | 2.5.0        | ORPH
                  libodb-boost |  DISTRO  | https://release-monitoring.org/project/001688 | 2.4.0        | 2.5.0        |     
                  libodb-mysql |  DISTRO  | https://release-monitoring.org/project/001689 | 2.4.0        | 2.5.0        |     
                  libodb-pgsql |  DISTRO  | https://release-monitoring.org/project/001690 | 2.4.0        | 2.5.0        | ORPH
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/021365 | 2.5.1        | 2.6.0        |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/010899 | 2023.8       | 2025.2       |     
                        libp11 |  DISTRO  | https://release-monitoring.org/project/001699 | 0.4.12       | 0.4.14       | ORPH
                       libpeas |  DISTRO  | https://release-monitoring.org/project/006871 | 1.32.0       | 2.0.7        | ORPH
                      libplist |  DISTRO  | https://release-monitoring.org/project/011675 | 2.4.0        | 2.7.0        | ORPH
                        libpng |  DISTRO  | https://release-monitoring.org/project/001705 | 1.6.46       | 1.6.48       |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/021367 | 7.9.2        | 7.10.1       |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/011042 | 1.6.0        | 1.6.1        | ORPH
                      libressl |  DISTRO  | https://release-monitoring.org/project/012102 | 3.9.2        | 4.1.0        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/005420 | 2.50.9       | 2.60.0       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/010717 | 2.0.5        | 2.0.6        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/013823 | 2.5.5        | 2.6.0        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/013150 | 0.20.5       | 0.21.7       | ORPH
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/001718 | 3.8.1        | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/001719 | 3.8.1        | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/007961 | 3.4.0        | 3.6.0        |     
                    libsigsegv |  DISTRO  | https://release-monitoring.org/project/001722 | 2.14         | 2.15         |     
                     libsodium |  DISTRO  | https://release-monitoring.org/project/001728 | 1.0.18       | 1.0.20       |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/007908 | 0.7.30       | 0.7.32       |     
                 libsoundtouch |  DISTRO  | https://release-monitoring.org/project/115722 | 2.3.3        | 2.4.0        |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/004864 | 1.9.3        | 2.1.0        |     
                       libspdm |  DISTRO  | https://release-monitoring.org/project/369161 | 3.5.0        | 3.7.0        |     
                       libssh2 |  DISTRO  | https://release-monitoring.org/project/001730 | 1.11.0       | 1.11.1       | ORPH
                    libstrophe |  DISTRO  | https://release-monitoring.org/project/015633 | 0.13.1       | 0.14.0       |     
                     libtalloc |  DISTRO  | https://release-monitoring.org/project/001733 | 2.4.2        | 2.4.3        |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/011793 | 1.1.1        | 1.2.0        | ORPH
                       libtool |  DISTRO  | https://release-monitoring.org/project/001741 | 2.4.6        | 2.5.4        | ORPH
                    libtorrent |  DISTRO  | https://release-monitoring.org/project/001742 | 0.13.8       | 0.15.3       | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/004166 | 1.2.19       | 2.0.11       |     
                       libtpms |  GUESS   | https://release-monitoring.org/project/116460 | 0.9.6        | 0.10.0       |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/021371 | 0.8.2        | 0.9.2        |     
                   libucontext |  DISTRO  | https://release-monitoring.org/project/017085 | 1.2          | 1.3.2        |     
                     libuhttpd |  DISTRO  | https://release-monitoring.org/project/089386 | 3.14.1       | 3.14.2       |     
                   libunibreak |  DISTRO  | https://release-monitoring.org/project/326564 | 5.1          | 6.1          |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/021315 | 1.14.19      | 1.14.21      |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/015849 | 0.21.0       | 1.0.2        | ORPH
                       liburcu |  DISTRO  | https://release-monitoring.org/project/007134 | 0.14.0       | 0.15.3       |     
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.6          | 2.9          |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/009998 | 1.28.1       | 1.30.1       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/005097 | 8.10.6       | 8.16.1       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/013830 | 7.10.0       | 11.3.0       |     
                  libvncserver |  DISTRO  | https://release-monitoring.org/project/001756 | 0.9.14       | 0.9.15       | ORPH
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.15.0       | 2023.4.0     |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/011083 | 1.15.0       | 1.15.1       |     
                        libxcb |  DISTRO  | https://release-monitoring.org/project/001767 | 1.15         | 1.17.0       | ORPH
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/001780 | 1.7.0        | 1.9.2        |     
                       libxml2 |  DISTRO  | https://release-monitoring.org/project/001783 | 2.13.8       | 2.14.3       |     
                       libxmlb |  GUESS   | https://release-monitoring.org/project/179028 | 0.3.19       | 0.3.22       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/011129 | 5.2.0        | 5.4.0        | ORPH
                       libxslt |  DISTRO  | https://release-monitoring.org/project/013301 | 1.1.42       | 1.1.43       |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 1.2.1        | 1.3.4        |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 1.2.1        | 1.3.4        |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/010649 | 1.10.1       | 1.11.3       | ORPH
                          lilv |  DISTRO  | https://release-monitoring.org/project/001818 | 0.24.12      | 0.24.26      |     
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20250311     | 20250509     |     
                     linux-pam |  DISTRO  | https://release-monitoring.org/project/012244 | 1.6.1        | 1.7.0        | ORPH
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/014535 | 1.6.0        | 1.7.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/012414 | 2021.05.03   | 2025.05.08   | ORPH
                  lksctp-tools |  DISTRO  | https://release-monitoring.org/project/021497 | 1.0.19       | 1.0.21       | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/001830 | 15.0.7       | 20.1.5       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/014019 | 1.0.18       | 1.0.19       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/001830 | 15.0.7       | 20.1.5       |     
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/010135 | 0.1.19       | 0.2.0        | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/001835 | 2.1.0        | 2.1.2        | ORPH
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/015330 | 1.3.1        | 1.4.0        |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/011671 | 1.0.1-1      | 1.2.2        |     
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/011649 | 0.9.5-1      | 0.9.6        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/000155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/007135 | 2.13.1       | 2.13.9       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/007141 | 2.13.10      | 2.13.18      |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/007136 | 2.13.8       | 2.13.15      |     
                           lua |  DISTRO  | https://release-monitoring.org/project/001847 | 5.1.5        | 5.4.7        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/013887 | 0.15-0       | 0.17.2       |     
                      luaposix |  DISTRO  | https://release-monitoring.org/project/011729 | 36.2.1       | 36.3         |     
                         lutok |  DISTRO  | https://release-monitoring.org/project/021509 | 0.4          | 0.6.1        | ORPH
                           luv |  DISTRO  | https://release-monitoring.org/project/021510 | 1.43.0-0     | 1.51.0-1     | ORPH
                          luvi |  DISTRO  | https://release-monitoring.org/project/021512 | 2.14.0       | 2.15.0       | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/005354 | 2.03.27      | 2.03.32      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/001860 | 5.0.3        | 6.0.4        |     
                         lynis |  DISTRO  | https://release-monitoring.org/project/001862 | 3.1.3        | 3.1.4        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2409         | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.5        | 1.7.7        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/001887 | 10.11.11     | 11.8.1       | ORPH
                  matchbox-lib |  DISTRO  | https://release-monitoring.org/project/021187 | 1.12         | 1.14         | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/001893 | 1.5.26       | 1.5.28       |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/015518 | 20220418     | 20250429     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/008093 | 194          | 206          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/016553 | 0.1.6.5      | 0.1.7.0      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/021746 | 4.4.8        | 5.4.17       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/001965 | 1.6.29       | 1.6.38       | ORPH
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/001970 | 25.0.6       | 25.1.0       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/001970 | 25.0.6       | 25.1.0       | ORPH
                         meson |  DISTRO  | https://release-monitoring.org/project/006472 | 1.7.0        | 1.8.0        |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/015392 | 2.25.1       | 3.56.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/021519 | 0.02         | 2.8.0        |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2024.06      | 2025.03      |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/010539 | 1.22.2       | 1.25.0       |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/001978 | 5.6.1        | 5.11.0       |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/021522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.0.10       |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/021100 | 2024.12      | 2025.05      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/010267 | 20221107     | 20240407     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/020836 | 0.11.6       | 0.21.1       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/068638 | 2.9.7        | 3.0.14       |     
                         monit |  DISTRO  | https://release-monitoring.org/project/005483 | 5.34.3       | 5.35.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/006360 | 6.12.0.182   | 6.14.1       |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/011578 | 4.0.0        | 4.0.1        |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/002019 | 4.1.1        | 4.2.2        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/012413 | 1.32.8       | 1.32.10      |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/005348 | 0.35.1       | 0.40.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/012278 | 3.3.0        | 7.0.0        |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/002026 | 2.2.1        | 2.3.0        |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/008868 | 1.1.6        | 1.1.7        |     
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/000424 | 0.9.8        | 0.11.1       |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/002034 | 1.23.9       | 1.26.0       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/002035 | 2.2.13       | 2.2.14       |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/013545 | 3.3.1        | 4.0.4        |     
                       mxt-app |  DISTRO  | https://release-monitoring.org/project/373381 | 1.38         | 1.43         |     
                          nano |  DISTRO  | https://release-monitoring.org/project/002046 | 8.2          | 8.4          | ORPH
                       nanomsg |  DISTRO  | https://release-monitoring.org/project/014540 | 1.2          | 1.2.1        |     
                           nbd |  DISTRO  | https://release-monitoring.org/project/002052 | 3.25         | 3.26.1       | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/006045 | 1.22         | 2.8.2        |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/002055 | 0.49         | 0.52         |     
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/021531 | 1.0.7        | 1.0.8        | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/007604 | 0.33.0       | 0.34.2       | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 2.1.1        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/002063 | 3.1.19       | 4.2.3        | ORPH
                      netavark |  DISTRO  | https://release-monitoring.org/project/242639 | v1.14.0      | 1.15.0       | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/011046 | 1.33.1       | 2.5.1        |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/021917 | 0.7.3        | 0.7.12       |     
                   netsniff-ng |  DISTRO  | https://release-monitoring.org/project/002071 | 0.6.8        | 0.6.9        |     
                       netsurf |  DISTRO  | https://release-monitoring.org/project/005386 | 3.10         | 3.11         |     
                          newt |  DISTRO  | https://release-monitoring.org/project/015129 | 0.52.23      | 0.52.25      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.0        | 1.1.3        |     
               nftables-python |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.0        | 1.1.3        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/008651 | 1.64.0       | 1.65.0       | ORPH
                         nginx |  DISTRO  | https://release-monitoring.org/project/005413 | 1.26.3       | 1.28.0       | ORPH
                        ngircd |  DISTRO  | https://release-monitoring.org/project/002083 | 26.1         | 27           | ORPH
                          nmap |  DISTRO  | https://release-monitoring.org/project/002096 | 7.95         | 7.97         | ORPH
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/008251 | 22.15.1      | 24.0.2       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/008251 | 22.15.1      | 24.0.2       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/021539 | 2.1.9        | 3.0.0        | ORPH
                          norm |  DISTRO  | https://release-monitoring.org/project/021540 | 1.5.8        | 1.5.9        | ORPH
                       nushell |  DISTRO  | https://release-monitoring.org/project/031106 | 0.96.1       | 0.104.0      | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/002511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/021843 | 390.151      | 390.157      | ORPH
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 575.51.02    | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 560.35.03    | 575.51.02    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/009074 | 1.12         | 2.13         | ORPH
                         oatpp |  DISTRO  | https://release-monitoring.org/project/370050 | 1.3.0        | 1.3.1        |     
                           odb |  DISTRO  | https://release-monitoring.org/project/002531 | 2.4.0        | 2.5.0        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/016859 | 2.2          | 2.17         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/033334 | v1.12.12     | 14.3.4       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/021545 | 4.3.1        | 4.3.3        | ORPH
                     oniguruma |  DISTRO  | https://release-monitoring.org/project/011184 | 6.9.9        | 6.9.10       |     
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/010861 | 2.1.9        | 2.1.11       |     
                     open-isns |  DISTRO  | https://release-monitoring.org/project/009393 | 0.102        | 0.103        |     
                     open-lldp |  DISTRO  | https://release-monitoring.org/project/115714 | 1.1          | 1.1.1        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/016896 | v1.3.15      | 1.4.12       | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/008172 | 1.22.0       | 1.24.3       | ORPH
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2024.05.08   | 2024.10.24   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/021548 | 0.1.5        | 0.1.6        | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/006615 | 3.4.19       | 4.11.0       | ORPH
                       opencv4 |  DISTRO  | https://release-monitoring.org/project/006615 | 4.10.0       | 4.11.0       |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.11.0       | 0.13.1       |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/002549 | 2.0.36       | 2.0.37       | ORPH
                    openlayers |  DISTRO  | https://release-monitoring.org/project/006847 | 10.2.1       | 10.5.0       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/002554 | 4.1.5        | 5.0.7        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/011687 | 0.56         | 0.62.2       |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/021551 | 3.13.2       | 3.16.5       | ORPH
                        opensc |  DISTRO  | https://release-monitoring.org/project/002559 | 0.26.0       | 0.26.1       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/010998 | 11.3.5-18... | 12.5.2       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/059397 | 0.7.0        | 0.8.0        | ORPH
                          opus |  DISTRO  | https://release-monitoring.org/project/011081 | 1.4          | 1.5.2        |     
                           orc |  DISTRO  | https://release-monitoring.org/project/002573 | 0.4.34       | 0.4.41       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/021691 | 4.4.8        | 5.4.17       | ORPH
                     osm2pgsql |  DISTRO  | https://release-monitoring.org/project/002575 | 2.0.1        | 2.1.1        |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/002582 | 0.25.3       | 0.25.5       | ORPH
                         p7zip |  DISTRO  | https://release-monitoring.org/project/002583 | 17.05        | 17.06        |     
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/021376 | 1.3.2        | 1.5.3        |     
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.28         | 1.30         |     
                         pango |  DISTRO  | https://release-monitoring.org/project/011783 | 1.54.0       | 1.56.3       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/007958 | 2.50.1       | 2.56.1       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/010309 | 0.7          | 0.65         | ORPH
                         patch |  DISTRO  | https://release-monitoring.org/project/002597 | 2.7.6        | 2.8          | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/002598 | 0.13         | 0.18.0       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/002601 | 1.3.7        | 1.3.8        | ORPH
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/002611 | 2.1.0        | 2.3.3        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/021378 | 3.5          | 3.6          |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/011930 | 2.33         | 3.04         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/002743 | 0.02         | 0.21         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/002748 | 0.33         | 0.35         |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/002785 | 6.95         | 6.97         |     
            perl-datetime-tiny |  DISTRO  | https://release-monitoring.org/project/002802 | 1.07         | 1.08         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/002807 | 4.046        | 5.012        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/002811 | 1.643        | 1.647        |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/012660 | 2.77         | 2.83         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/006175 | 12.50        | 13.29        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/006569 | 2.080        | 2.089        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/003024 | 6.77         | 6.78         |     
        perl-module-build-tiny |  DISTRO  | https://release-monitoring.org/project/011870 | 0.051        | 0.052        |     
           perl-module-runtime |  DISTRO  | https://release-monitoring.org/project/003111 | 0.016        | 0.018        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/005966 | 9.38         | 9.40         |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/003136 | 20240924     | 20250202     |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/003147 | 1.48         | 1.50         |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/003163 | 0.72         | 0.74         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/011962 | 0.146        | 0.148        |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/014338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/014406 | 2.006000     | 2.008002     |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/003485 | 5.31         | 5.32         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/003527 | 2.0134       | 2.0210       |     
                           php |  DISTRO  | https://release-monitoring.org/project/003627 | 8.3.21       | 8.4.7        |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/015603 | 2.0.0        | 2.1.2        |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/011010 | 5.1.22       | 5.1.24       |     
                     php-gnupg |  DISTRO  | https://release-monitoring.org/project/021743 | 1.5.1        | 1.5.2        | ORPH
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/017401 | 3.7.0        | 3.8.0        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/017400 | 3.2.0        | 3.3.0        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/021742 | 1.4          | 1.4.1        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/013302 | 3.3.1        | 3.4.3        |     
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/012515 | 2.2.3        | 2.2.4        | ORPH
                        physfs |  DISTRO  | https://release-monitoring.org/project/003631 | 3.0.2        | 3.2.0        |     
                      pico-sdk |  DISTRO  | https://release-monitoring.org/project/373461 | 1.5.1        | 2.1.1        |     
                      picotool |  DISTRO  | https://release-monitoring.org/project/373463 | 1.1.2        | 2.1.1        |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/057357 | 1.2.7        | 1.4.2        |     
                        pixman |  DISTRO  | https://release-monitoring.org/project/003648 | 0.44.2       | 0.46.0       | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/012753 | 2.3.0        | 2.4.3        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/003674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/005418 | 1.13.2       | 1.14.2       |     
                        podman |  DISTRO  | https://release-monitoring.org/project/093284 | v5.4.1       | 5.5.0        | ORPH
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 4.3          | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/003682 | 125          | 126          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/003686 | 22.12.0      | 25.05.0      |     
                       postgis |  DISTRO  | https://release-monitoring.org/project/003694 | 3.5.2        | 3.5.3        |     
                         pound |  DISTRO  | https://release-monitoring.org/project/005436 | 4.8          | 4.16         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/010715 | 1.3.11       | 1.3.13       | ORPH
                       privoxy |  DISTRO  | https://release-monitoring.org/project/003712 | 3.0.34       | 4.0.0        |     
                         procs |  DISTRO  | https://release-monitoring.org/project/076458 | 0.14.9       | 0.14.10      |     
                       proftpd |  DISTRO  | https://release-monitoring.org/project/007609 | 1.3.8b       | 1.3.9        | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/021570 | 9.5.1        | 9.6.0        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/003709 | 0.11.14      | 13.0.1       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 29.3         | 31.0         |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/006499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/021825 | 6.0.1        | 6.5.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/003721 | 23.5         | 23.7         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/003726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/003728 | 1.14         | 1.15         |     
                         putty |  DISTRO  | https://release-monitoring.org/project/005749 | 0.81         | 0.83         |     
                            pv |  DISTRO  | https://release-monitoring.org/project/003736 | 1.9.0        | 1.9.31       | ORPH
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/034074 | 3.1.15       | 3.1.16       |     
                 python-aerich |  DISTRO  | https://release-monitoring.org/project/099620 | 0.8.2        | 0.9.0        |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/021243 | 0.4.12       | 0.4.14       |     
                 python-aiodns |  DISTRO  | https://release-monitoring.org/project/021245 | 3.2.0        | 3.4.0        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/006713 | 3.11.14      | 3.11.18      |     
           python-aiohttp-cors |  DISTRO  | https://release-monitoring.org/project/012956 | 0.8.0        | 0.8.1        |     
                python-aiojobs |  DISTRO  | https://release-monitoring.org/project/021252 | 1.3.0        | 1.4.0        |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/003766 | 1.14.1       | 1.15.2       |     
                python-apispec |  DISTRO  | https://release-monitoring.org/project/037849 | 6.8.1        | 6.8.2        |     
            python-argcomplete |  DISTRO  | https://release-monitoring.org/project/003773 | 3.5.3        | 3.6.2        |     
              python-async-lru |  DISTRO  | https://release-monitoring.org/project/056566 | 2.0.4        | 2.0.5        |     
               python-asyncssh |  DISTRO  | https://release-monitoring.org/project/017555 | 2.19.0       | 2.21.0       |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/015099 | 25.1.0       | 25.3.0       |     
                python-automat |  DISTRO  | https://release-monitoring.org/project/015101 | 24.8.1       | 25.4.16      |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/011984 | 2.16.0       | 2.17.0       |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/009047 | 4.2.1        | 4.3.0        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/003779 | 4.12.3       | 4.13.4       |     
               python-bitarray |  DISTRO  | https://release-monitoring.org/project/011014 | 3.0.0        | 3.4.1        |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/014665 | 4.3.0        | 4.3.1        |     
               python-bluezero |  DISTRO  | https://release-monitoring.org/project/021929 | 0.9.0        | 0.9.1        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/029737 | 1.37.34      | 1.38.18      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/008748 | 1.37.33      | 1.38.18      |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/011101 | 0.13.2       | 0.13.3       |     
                python-bsdiff4 |  DISTRO  | https://release-monitoring.org/project/044268 | 1.2.5        | 1.2.6        |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/007022 | 5.5.1        | 6.0.0b4      |     
                 python-calver |  DISTRO  | https://release-monitoring.org/project/100823 | 2022.6.26    | 2025.4.17    |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/014813 | 2.1.7        | 2.2.0a2      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/007995 | 2024.12.14   | 2025.4.26    |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/021937 | 4.2.0        | 4.2.2        |     
     python-charset-normalizer |  DISTRO  | https://release-monitoring.org/project/055366 | 3.4.1        | 3.4.2        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/020163 | 10.0.1       | 11.0.0b3     |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/019734 | 1.1.30       | 2.0.2        |     
              python-contourpy |  DISTRO  | https://release-monitoring.org/project/244705 | 1.3.1        | 1.3.2        |     
                   python-cppy |  DISTRO  | https://release-monitoring.org/project/089055 | 1.3.0        | 1.3.1        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/005532 | 44.0.1       | 45.0.2       |     
              python-cssselect |  DISTRO  | https://release-monitoring.org/project/011593 | 1.2.0        | 1.3.0        |     
             python-cssselect2 |  DISTRO  | https://release-monitoring.org/project/086109 | 0.7.0        | 0.8.0        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/036699 | 3.0.11       | 3.1.0        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/021939 | 4.1.2        | 4.2.0        |     
               python-dateutil |  DISTRO  | https://release-monitoring.org/project/005621 | 2.9.0        | 2.9.0.post0  |     
              python-dbus-fast |  DISTRO  | https://release-monitoring.org/project/287975 | 2.34.0       | 2.44.1       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/003819 | 5.1.1        | 5.2.1        |     
               python-dtschema |  DISTRO  | https://release-monitoring.org/project/100908 | 2024.11      | 2025.2       |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/008370 | 0.19.0       | 0.19.1       |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/015064 | 4.11.2       | 4.12.1       |     
                  python-evdev |  DISTRO  | https://release-monitoring.org/project/062869 | 1.9.0        | 1.9.2        |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/011739 | 3.17.0       | 3.18.0       |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/019867 | 5.0.0        | 6.0.0        |     
          python-flask-smorest |  DISTRO  | https://release-monitoring.org/project/025028 | 0.45.0       | 0.46.1       |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/085010 | 2.0.7        | 25.2.10      |     
              python-flit-core |  DISTRO  | https://release-monitoring.org/project/044841 | 3.11.0       | 3.12.0       |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/007388 | 4.55.6       | 4.58.0       |     
             python-frozenlist |  DISTRO  | https://release-monitoring.org/project/041138 | 1.5.0        | 1.6.0        |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 11.13.0      | 15.3.0       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/013158 | 3.50.0       | 3.52.3       |     
        python-google-api-core |  DISTRO  | https://release-monitoring.org/project/025386 | 2.24.1       | 2.24.2       |     
            python-google-auth |  DISTRO  | https://release-monitoring.org/project/038039 | 2.38.0       | 2.40.1       |     
python-googleapis-common-pr... |  DISTRO  | https://release-monitoring.org/project/063943 | 1.66.0       | 1.70.0       |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/006870 | 3.1.1        | 3.2.2        |     
          python-grpc-requests |  DISTRO  | https://release-monitoring.org/project/132701 | 0.1.20       | 0.1.21       |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/018429 | 1.70.0       | 1.72.0       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/030542 | 1.70.0       | 1.72.0       |     
                python-grpclib |  DISTRO  | https://release-monitoring.org/project/039170 | 0.4.7        | 0.4.8        |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/019033 | 4.1.0        | 4.2.0        |     
python-hatch-fancy-pypi-readme |  DISTRO  | https://release-monitoring.org/project/274452 | 24.1.0       | 25.1.0       |     
                    python-hid |  DISTRO  | https://release-monitoring.org/project/049364 | 1.0.6        | 1.0.7        |     
                python-hiredis |  DISTRO  | https://release-monitoring.org/project/012002 | 3.1.0        | 3.1.1        |     
               python-httpcore |  DISTRO  | https://release-monitoring.org/project/079947 | 1.0.7        | 1.0.9        |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/019799 | 4.11.0       | 4.12.3       |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/011771 | 2.4.1        | 2.4.2-1      |     
              python-iniconfig |  DISTRO  | https://release-monitoring.org/project/114778 | 2.0.0        | 2.1.0        |     
               python-iptables |  DISTRO  | https://release-monitoring.org/project/011475 | 1.0.1        | 1.2.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/001399 | 8.31.0       | 9.2.0        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/051611 | 1.5          | 1.7.0        |     
                python-jeepney |  DISTRO  | https://release-monitoring.org/project/019564 | 0.8.0        | 0.9.0        |     
python-jsonschema-specifica... |  DISTRO  | https://release-monitoring.org/project/316377 | 2024.10.1    | 2025.4.1     |     
             python-legacy-cgi |  DISTRO  | https://release-monitoring.org/project/375190 | 2.6.2        | 2.6.3        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/012301 | 3.2.0        | 3.3.1        |     
                python-logbook |  DISTRO  | https://release-monitoring.org/project/020016 | 1.8.0        | 1.8.1        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/003914 | 5.3.0        | 5.4.0        |     
         python-magic-wormhole |  DISTRO  | https://release-monitoring.org/project/017278 | 0.17.0       | 0.18.0       |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/003915 | 1.3.8        | 1.3.10       |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/003916 | 3.7          | 3.8          |     
            python-marshmallow |  DISTRO  | https://release-monitoring.org/project/008079 | 3.26.0       | 4.0.0        |     
 python-marshmallow-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/050566 | 1.4.0        | 1.4.2        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/003919 | 3.10.0       | 3.10.3       |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/042653 | 1.8.3        | 1.8.6        |     
           python-meson-python |  DISTRO  | https://release-monitoring.org/project/248985 | 0.17.1       | 0.18.0       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/006189 | 3.1.0        | 3.1.3        |     
              python-modbus-tk |  DISTRO  | https://release-monitoring.org/project/022813 | 1.1.4        | 1.1.5        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/012201 | 10.6.0       | 10.7.0       |     
              python-multidict |  DISTRO  | https://release-monitoring.org/project/011132 | 6.1.0        | 6.4.3        |     
        python-mypy-extensions |  DISTRO  | https://release-monitoring.org/project/023367 | 1.0.0        | 1.1.0        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/002509 | 1.25.0       | 2.2.6        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.1.5        | 1.05a1       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/031737 | 3.10.15      | 3.10.18      |     
              python-packaging |  DISTRO  | https://release-monitoring.org/project/060461 | 24.2         | 25.0         |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/003954 | 3.5.0        | 3.5.1        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/003960 | 6.1.0        | 6.1.1        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/007974 | 11.1.0       | 11.2.1       |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/006529 | 25.0         | 25.1.1       |     
                 python-pluggy |  DISTRO  | https://release-monitoring.org/project/007500 | 1.5.0        | 1.6.0        |     
              python-posix-ipc |  DISTRO  | https://release-monitoring.org/project/013204 | 1.1.1        | 1.2.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/008742 | 3.0.50       | 3.0.51       |     
              python-propcache |  DISTRO  | https://release-monitoring.org/project/375192 | 0.2.1        | 0.3.1        |     
             python-proto-plus |  DISTRO  | https://release-monitoring.org/project/099887 | 1.26.0       | 1.26.1       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 29.3         | 31.0         |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/003978 | 6.1.1        | 7.0.0        |     
                python-psygnal |  DISTRO  | https://release-monitoring.org/project/218690 | 0.11.1       | 0.13.0       |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/003980 | 2024.1.3     | 2025.1       |     
                 python-pyalsa |  DISTRO  | https://release-monitoring.org/project/003767 | 1.2.12       | 1.2.14       |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/011987 | 0.4.1        | 0.4.2        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/013166 | 1.27.0       | 1.28.0       |     
                python-pycares |  DISTRO  | https://release-monitoring.org/project/019900 | 4.5.0        | 4.8.0        |     
                python-pycrate |  DISTRO  | https://release-monitoring.org/project/185106 | 0.7.8        | 0.7.9        |     
          python-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/036851 | 3.21.0       | 3.23.0       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/021582 | 20241204.1   | 20250501.1   |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/016219 | 0.31         | 0.32         |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/012004 | 2.14         | 2.15.2       |     
               python-pylibfdt |  DISTRO  | https://release-monitoring.org/project/269896 | 1.7.2        | 1.7.2.post1  |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/015600 | 3.8.6        | 3.9.2        |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/017320 | 1.23.22      | 1.25.5       |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/005535 | 25.0.0       | 25.1.0       |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/003756 | 3.2.1        | 3.2.3        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/015558 | 3.12.0       | 3.13.0       |     
     python-pyproject-metadata |  DISTRO  | https://release-monitoring.org/project/255630 | 0.9.0        | 0.9.1        |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/020104 | 5.15.6       | 5.15.11      |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/020081 | 0.8.1        | 0.9.2        |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/021589 | 1.2.10       | 1.2.11       |     
                  python-pysmi |  DISTRO  | https://release-monitoring.org/project/013209 | 1.5.9        | 1.6.1        |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/012027 | 7.1.16       | 7.1.20       |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/007273 | 0.25.3       | 0.26.0       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/006537 | 2024.2       | 2025.2       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/004104 | 25.1.2       | 26.4.0       |     
                 python-qrcode |  DISTRO  | https://release-monitoring.org/project/020011 | 8.1          | 8.2          |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/003992 | 5.2.1        | 6.1.0        |     
               python-reedsolo |  DISTRO  | https://release-monitoring.org/project/081160 | 1.7.0        | 2.0.13       |     
                python-rpds-py |  DISTRO  | https://release-monitoring.org/project/368622 | 0.22.3       | 0.25.0       |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/062048 | 0.10.0       | 0.12.0       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/019641 | 2.1.76       | 2.2.3        |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/010428 | 0.11.4       | 0.12.0       |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/004768 | 1.11.4       | 1.15.3       |     
                  python-segno |  DISTRO  | https://release-monitoring.org/project/059641 | 1.6.1        | 1.6.6        |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/005645 | 4.27.1       | 4.32.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/021603 | 2.21.0       | 3.0.0a1      |     
           python-setproctitle |  DISTRO  | https://release-monitoring.org/project/011699 | 1.3.4        | 1.3.6        |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/004021 | 79.0.1       | 80.7.1       |     
        python-setuptools-rust |  DISTRO  | https://release-monitoring.org/project/122284 | 1.11.0       | 1.11.1       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/007874 | 8.1.0        | 8.3.1        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/010429 | 2.2.1        | 2.2.2        |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/004026 | 3.19.3       | 3.20.1       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/021608 | 1.5.3        | 1.5.4        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/013626 | 4.19.25      | 6.11.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/012729 | 5.0.2        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/007203 | 0.6.1        | 0.7.3        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/021611 | 5.12.1       | 5.13.0       |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/027570 | 2.6          | 2.7          |     
                 python-spidev |  DISTRO  | https://release-monitoring.org/project/021612 | 3.6          | 3.7          |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/004034 | 2.0.39       | 2.0.41       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/029718 | 2.0.0        | 2.0.1        |     
                  python-sympy |  DISTRO  | https://release-monitoring.org/project/004923 | 1.13.3       | 1.14.0       |     
              python-termcolor |  DISTRO  | https://release-monitoring.org/project/010198 | 2.5.0        | 3.1.0        |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/007498 | 6.4.2        | 6.5          |     
           python-tortoise-orm |  DISTRO  | https://release-monitoring.org/project/033168 | 0.24.2       | 0.25.0       |     
                   python-trio |  DISTRO  | https://release-monitoring.org/project/017451 | 0.28.0       | 0.30.0       |     
         python-trio-websocket |  DISTRO  | https://release-monitoring.org/project/136283 | 0.11.1       | 0.12.2       |     
      python-trove-classifiers |  DISTRO  | https://release-monitoring.org/project/088298 | 2025.1.15.22 | 2025.5.9.12  |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/038819 | 4.4.1        | 4.4.2        |     
  python-types-python-dateutil |  DISTRO  | https://release-monitoring.org/project/147859 | 2.9.0.202... | 2.9.0.202... |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/004079 | 2.6.16       | 3.0.2        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/019818 | 0.34.0       | 0.35.0       |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/011057 | 64.0         | 65.1         |     
                python-webargs |  DISTRO  | https://release-monitoring.org/project/024711 | 8.6.0        | 8.7.0        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/008100 | 15.0         | 15.0.1       |     
                  python-wheel |  DISTRO  | https://release-monitoring.org/project/011428 | 0.45.1       | 0.46.1       |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/012031 | 3.2.1        | 3.2.3        |     
               python-yamllint |  DISTRO  | https://release-monitoring.org/project/009761 | 1.35.1       | 1.37.1       |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/012895 | 1.18.3       | 1.20.0       |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/012681 | 0.141.0      | 0.147.0      |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/021737 | 2.4.7        | 2.5.0        | ORPH
               qoriq-mc-binary |  DISTRO  | https://release-monitoring.org/project/377827 | 10.39.0      | 10.300.138   |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/005542 | 10.5.0       | 12.2.0       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/015198 | 0.35.0       | 0.40.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.0        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.0        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.0        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.0        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.14      | 6.9.0        |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.0        |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.0        |     
                       qt6mqtt |  DISTRO  | https://release-monitoring.org/project/242923 | 6.8.1        | 6.9.0        |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.0        |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.0        |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.0        |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/004141 | 1.4          | 1.5          |     
                         quota |  DISTRO  | https://release-monitoring.org/project/004145 | 4.09         | 4.10         |     
                     quotatool |  DISTRO  | https://release-monitoring.org/project/004146 | 1.6.4        | 1.6.5        | ORPH
                           qwt |  DISTRO  | https://release-monitoring.org/project/004147 | 6.1.6        | 6.3.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/013768 | 0.14.0       | 0.15.0       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/012105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/007426 | 1.9.3        | 1.9.4        |     
                     rdma-core |  DISTRO  | https://release-monitoring.org/project/012907 | 56.0         | 57.0         |     
                      readline |  DISTRO  | https://release-monitoring.org/project/004173 | 8.2          | 8.2.13       | ORPH
               redis-plus-plus |  DISTRO  | https://release-monitoring.org/project/368624 | 1.3.12       | 1.3.14       |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.5       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/016520 | 3.8.1        | 20200710     | ORPH
                         rhash |  DISTRO  | https://release-monitoring.org/project/013843 | 1.4.4        | 1.4.6        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/021389 | 1.10.5       | 2.0.1        | ORPH
                        rlwrap |  DISTRO  | https://release-monitoring.org/project/004199 | 0.46.1       | 0.46.2       |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/015560 | 6.20.3       | 10.2.1       |     
                  rpi-firmware |  DISTRO  | https://release-monitoring.org/project/021744 | 1.20250326   | 1.20250430   |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/004218 | 8.2502.0     | 8.2504.0     |     
                       rtl_433 |  DISTRO  | https://release-monitoring.org/project/014997 | 23.11        | 25.02        |     
                      rtorrent |  DISTRO  | https://release-monitoring.org/project/004221 | 0.9.8        | 0.15.3       | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/087994 | 8.1.2        | 8.1.4        |     
                          ruby |  DISTRO  | https://release-monitoring.org/project/004223 | 3.4.3        | 3.4.4        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/007462 | 1.2.4        | 1.3.0        |     
                          rust |  DISTRO  | https://release-monitoring.org/project/007635 | 1.86.0       | 1.87.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/007635 | 1.86.0       | 1.87.0       |     
                  rust-bindgen |  DISTRO  | https://release-monitoring.org/project/017910 | 0.65.1       | 0.71.1       | ORPH
                         rygel |  DISTRO  | https://release-monitoring.org/project/004751 | 0.42.5       | 0.44.2       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/010714 | 2.33.1       | 2.37.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/005485 | 2.13.1.0     | 2.13.2.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/016547 | 2.4.0.0      | 2.4.1.0      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/016552 | 1.1.2.1      | 1.1.3.0      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/016551 | 2.6.2.1      | 2.6.3.0      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/016550 | 2.7.0.4      | 2.7.1.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/016549 | 2.3.0.4      | 2.3.1.0      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/016548 | 0.5.5.0      | 0.5.6.0      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/021385 | 3.7.1        | 08032024     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/004758 | 4.21.4       | 4.22.1       |     
                  sane-airscan |  DISTRO  | https://release-monitoring.org/project/121086 | 0.99.33      | 0.99.35      |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/004760 | 1.1.1        | 1.4.0        |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/016338 | 2.0          | 2.1          |     
                         scons |  DISTRO  | https://release-monitoring.org/project/004770 | 4.8.1        | 4.9.1        |     
                   screenfetch |  DISTRO  | https://release-monitoring.org/project/005733 | 3.9.1        | 3.9.9        | ORPH
                        scrypt |  DISTRO  | https://release-monitoring.org/project/021238 | 1.3.2        | 1.3.3        |     
                    sdl2_image |  DISTRO  | https://release-monitoring.org/project/004781 | 2.8.4        | 3.2.4        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/004782 | 2.6.3        | 2.8.1        | ORPH
                      sdl2_ttf |  DISTRO  | https://release-monitoring.org/project/004784 | 2.24.0       | 3.2.2        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/004778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/010262 | 1.0.3        | 2.0.4        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/004787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/015203 | 1.20.0       | 1.49.13      |     
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 2.20.3       | 2.45.0       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.8.5        |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/021655 | 4.3.8        | 4.6.5        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.32.4       |     
                       sexpect |  DISTRO  | https://release-monitoring.org/project/269648 | 2.3.14       | 2.3.15       |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/021384 | 3.3.9        | 4.3.7        | ORPH
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/005524 | 1.12         | 2.4          | ORPH
                          shim |  DISTRO  | https://release-monitoring.org/project/010719 | 15.8         | 16.0         |     
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.1.0        | ORPH
                       skalibs |  DISTRO  | https://release-monitoring.org/project/005486 | 2.14.3.0     | 2.14.4.0     |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/096796 | 4.8.0        | 4.9.0        | ORPH
                        snappy |  DISTRO  | https://release-monitoring.org/project/004844 | 1.2.1        | 1.2.2        | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/017075 | 1.7.0        | 1.8.2        | ORPH
                  snmpclitools |  DISTRO  | https://release-monitoring.org/project/031640 | 0.6.4        | 0.7.2        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/021318 | 3.5.1        | 3.6.3        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/013263 | 3.1.40.0     | 3.7.4.0      |     
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.18      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/010152 | 0.7          | 0.8          |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/005388 | 1.6.4        | 1.6.6        | ORPH
                       speechd |  DISTRO  | https://release-monitoring.org/project/328138 | 0.11.5       | 0.12.1       |     
                         spice |  DISTRO  | https://release-monitoring.org/project/004871 | 0.15.2       | 0.16.0       | ORPH
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/014892 | 0.14.4       | 0.14.5       | ORPH
                   spirv-tools |  DISTRO  | https://release-monitoring.org/project/334920 | 1.3.261.1    | 1.4.313.0    | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/011213 | 4.5.5        | 4.9.0        |     
                        sqlite |  DISTRO  | https://release-monitoring.org/project/004877 | 3.48.0       | 3.49.2       |     
                         squid |  DISTRO  | https://release-monitoring.org/project/004880 | 6.13         | 7.0.1        | ORPH
                        sratom |  DISTRO  | https://release-monitoring.org/project/014903 | 0.6.14       | 0.6.18       |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/006184 | 2.0.1        | 2.2.3        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/008127 | 1.20.7.1     | 1.22.18      | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/006861 | 6.7.1        | 7.0c         |     
                    stellarium |  DISTRO  | https://release-monitoring.org/project/004891 | 24.3         | 25.1         |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/012538 | 0.18.05      | 0.19.00      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/004899 | 5.9.14       | 6.0.1        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/004901 | 5.71         | 5.74         |     
                   superiotool |  DISTRO  | https://release-monitoring.org/project/010128 | 24.05        | 25.03        |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/010925 | 6.0.19       | 7.0.10       |     
                          sway |  DISTRO  | https://release-monitoring.org/project/011497 | 1.10         | 1.10.1       |     
                          swig |  DISTRO  | https://release-monitoring.org/project/004919 | 4.1.1        | 4.3.1        |     
                         swipl |  DISTRO  | https://release-monitoring.org/project/236197 | 9.2.8        | 9.2.9        |     
                         swtpm |  GUESS   | https://release-monitoring.org/project/116461 | 0.8.2        | 0.10.1       |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/005718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/016898 | 0.29.3       | 0.40.1       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/004930 | 4.8.1        | 4.8.3        |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/004931 | 12.7.5       | 12.7.7       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/005440 | 256.7        | 257.5        |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/011774 | 233          | 235          | ORPH
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/021648 | 3.13         | 3.14         | ORPH
                     tailscale |  DISTRO  | https://release-monitoring.org/project/141585 | 1.78.1       | 1.82.5       |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/009174 | 2.1.58       | 3.0.1        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/008217 | 2021.12.0    | 2022.1.0     |     
                     tcf-agent |  DISTRO  | https://release-monitoring.org/project/021833 | 1.8.0        | 1.9.0        |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/004941 | 8.6.15       | 9.0.1        | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/004942 | 1.2.4        | 1.2.5        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/004943 | 1.21         | 2.0          |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/013716 | 4.4.4        | 4.5.1        | ORPH
                      tealdeer |  DISTRO  | https://release-monitoring.org/project/084521 | 1.6.1        | 1.7.2        |     
               tensorflow-lite |  DISTRO  | https://release-monitoring.org/project/016141 | 2.11.0       | 2.19.0       |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/004951 | 1.12.1       | 1.14.0       |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/014500 | 2.5.6        | 2.5.9        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/005581 | 0.14.1       | 0.21.0       | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/017545 | 2.19.3       | 2.20.0       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 4.1.0        | 5.0.2        |     
                      tinycbor |  DISTRO  | https://release-monitoring.org/project/021379 | 0.6.0        | 0.6.1        |     
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/014678 | 20240101     | 20250501     |     
                           tio |  DISTRO  | https://release-monitoring.org/project/020587 | 3.5          | 3.9          |     
                       tipidee |  DISTRO  | https://release-monitoring.org/project/373437 | 0.0.5.1      | 0.0.6.0      |     
                            tk |  DISTRO  | https://release-monitoring.org/project/011426 | 8.6.15       | 9.0.1        |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.1.0        |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/021640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/016819 | 2.3.3        | 3.0.0        | ORPH
                  tpm2-openssl |  DISTRO  | https://release-monitoring.org/project/242488 | 1.2.0        | 1.3.0        |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/018790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/012683 | 3.2.2        | 4.1.3        | ORPH
                          tree |  DISTRO  | https://release-monitoring.org/project/005006 | 2.1.1        | 2.2.1        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/005022 | 2021.07      | 2025.04      | ORPH
                       udpcast |  DISTRO  | https://release-monitoring.org/project/010206 | 20230924     | 20250223     | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.17         | ORPH
                           uhd |  DISTRO  | https://release-monitoring.org/project/012572 | 4.7.0.0      | 4.8.0.0      |     
                         ulogd |  DISTRO  | https://release-monitoring.org/project/005038 | 2.0.8        | 2.0.9        | ORPH
                       unbound |  DISTRO  | https://release-monitoring.org/project/005042 | 1.21.1       | 1.23.0       |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/017617 | 2.1          | 3.6          | ORPH
                         unrar |  DISTRO  | https://release-monitoring.org/project/013306 | 6.2.12       | 7.1.6        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/015848 | 1.5.12       | 1.9.5        | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/005056 | 0.99.19      | 1.90.9       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/013737 | 4.2.1        | 5.0.1        |     
                usb_modeswitch |  DISTRO  | https://release-monitoring.org/project/005059 | 2.6.1        | 2.6.2        | ORPH
                      usbguard |  DISTRO  | https://release-monitoring.org/project/011151 | 1.1.2        | 1.1.3        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/016012 | 0.14.0       | 0.15.0       | ORPH
                      utf8proc |  DISTRO  | https://release-monitoring.org/project/007455 | 2.9.0        | 2.10.0       | ORPH
                    util-linux |  DISTRO  | https://release-monitoring.org/project/008179 | 2.40.2       | 2.41         | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/008179 | 2.40.2       | 2.41         | ORPH
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/010956 | 0.13.2       | 0.14.0       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/005065 | 0.56.17      | 0.56.18      | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/018452 | 1.0.2        | 1.0.5        | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/005069 | 2.6.5        | 2.7.5        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/005080 | 1.8.0        | 1.8.3        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/005092 | 9.1.0145     | 9.1.1398     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 9.1.10       |     
                           vlc |  DISTRO  | https://release-monitoring.org/project/006504 | 3.0.21       | 3.0.21-1     |     
                        vnstat |  DISTRO  | https://release-monitoring.org/project/007283 | 2.11         | 2.13         |     
                          volk |  DISTRO  | https://release-monitoring.org/project/147733 | 3.1.2        | 3.2.0        |     
                  vorbis-tools |  DISTRO  | https://release-monitoring.org/project/005104 | 1.4.2        | 1.4.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/010895 | 0.66.2       | 0.80.1       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/089353 | 3.5.12       | 3.5.14       |     
                  vuejs-router |  DISTRO  | https://release-monitoring.org/project/234796 | 4.4.5        | 4.5.1        |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/088835 | 1.3.262      | 1.4.315      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.3.262      | 1.4.315      | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.3.262      | 1.4.315      | ORPH
                        waffle |  DISTRO  | https://release-monitoring.org/project/021633 | 1.7.0        | 1.8.1        |     
                       wavemon |  DISTRO  | https://release-monitoring.org/project/005120 | 0.9.5        | 0.9.6        | ORPH
                       wavpack |  DISTRO  | https://release-monitoring.org/project/005121 | 5.7.0        | 5.8.1        | ORPH
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/013997 | 1.42         | 1.44         | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/005355 | 2.48.2       | 2.49.1       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/015929 | 1.3          | 2.1          | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/013745 | 14.0.1       | 14.0.2       |     
                         which |  DISTRO  | https://release-monitoring.org/project/005127 | 2.21         | 2.23         | ORPH
                         whois |  DISTRO  | https://release-monitoring.org/project/005128 | 5.5.23       | 5.6.1        |     
                          wine |  DISTRO  | https://release-monitoring.org/project/005134 | 10.0         | 10.8         |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.5.5        | 0.5.8        | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/005137 | 4.2.11       | 4.4.6        | ORPH
                       wlroots |  DISTRO  | https://release-monitoring.org/project/018357 | 0.18.2       | 0.19.0       |     
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.1.0        | 3.9.0        |     
                    wpan-tools |  DISTRO  | https://release-monitoring.org/project/021835 | 0.9          | 0.10         | ORPH
                wpebackend-fdo |  DISTRO  | https://release-monitoring.org/project/017547 | 1.14.3       | 1.16.0       |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/017557 | 2.44.4       | 2.48.2       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.41.0       | 0.43.0       | ORPH
                        x11vnc |  DISTRO  | https://release-monitoring.org/project/010182 | 0.9.16       | 0.9.17       |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/007275 | 3.5          | 4.1          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/015919 | 1.4.27       | 1.4.29       |     
                   xapp_appres |  DISTRO  | https://release-monitoring.org/project/015053 | 1.0.6        | 1.0.7        | ORPH
                 xapp_bdftopcf |  DISTRO  | https://release-monitoring.org/project/015054 | 1.1.1        | 1.1.2        | ORPH
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/000191 | 1.1.0        | 1.1.1        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/017160 | 1.0.8        | 1.0.9        | ORPH
               xapp_fonttosfnt |  DISTRO  | https://release-monitoring.org/project/021723 | 1.2.2        | 1.2.4        | ORPH
                xapp_fslsfonts |  DISTRO  | https://release-monitoring.org/project/017157 | 1.0.6        | 1.0.7        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/015048 | 1.0.9        | 1.0.10       | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/017161 | 1.0.5        | 1.0.6        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/015047 | 1.1.1        | 20240910     | ORPH
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/015043 | 1.2.2        | 1.2.3        | ORPH
                   xapp_oclock |  DISTRO  | https://release-monitoring.org/project/015042 | 1.0.5        | 1.0.6        | ORPH
                  xapp_sessreg |  DISTRO  | https://release-monitoring.org/project/015040 | 1.1.3        | 1.1.4        | ORPH
                 xapp_showfont |  DISTRO  | https://release-monitoring.org/project/012316 | 1.0.6        | 1.0.7        | ORPH
                  xapp_smproxy |  DISTRO  | https://release-monitoring.org/project/015039 | 1.0.7        | 1.0.8        | ORPH
                      xapp_twm |  DISTRO  | https://release-monitoring.org/project/015038 | 1.0.12       | 1.0.13.1     | ORPH
                  xapp_viewres |  DISTRO  | https://release-monitoring.org/project/017162 | 1.0.7        | 1.0.8        | ORPH
                  xapp_x11perf |  DISTRO  | https://release-monitoring.org/project/015035 | 1.6.2        | 1.7.0        | ORPH
                    xapp_xauth |  DISTRO  | https://release-monitoring.org/project/005253 | 1.1.2        | 1.1.4        | ORPH
               xapp_xbacklight |  DISTRO  | https://release-monitoring.org/project/005161 | 1.2.3        | 1.2.4        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/015034 | 1.0.4        | 1.0.5        | ORPH
               xapp_xclipboard |  DISTRO  | https://release-monitoring.org/project/015033 | 1.1.4        | 1.1.5        | ORPH
                   xapp_xcmsdb |  DISTRO  | https://release-monitoring.org/project/015031 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xcompmgr |  DISTRO  | https://release-monitoring.org/project/005174 | 1.1.9        | 1.1.10       | ORPH
                 xapp_xconsole |  DISTRO  | https://release-monitoring.org/project/015030 | 1.0.8        | 1.1.0        |     
               xapp_xcursorgen |  DISTRO  | https://release-monitoring.org/project/021210 | 1.0.8        | 1.0.9        | ORPH
                 xapp_xditview |  DISTRO  | https://release-monitoring.org/project/021262 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xdm |  DISTRO  | https://release-monitoring.org/project/005255 | 1.1.14       | 1.1.17       | ORPH
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/005180 | 1.2.3        | 1.2.4        | ORPH
                      xapp_xev |  DISTRO  | https://release-monitoring.org/project/015026 | 1.2.5        | 1.2.6        | ORPH
                    xapp_xeyes |  DISTRO  | https://release-monitoring.org/project/015025 | 1.2.0        | 1.3.0        | ORPH
                 xapp_xfontsel |  DISTRO  | https://release-monitoring.org/project/015023 | 1.1.0        | 1.1.1        | ORPH
                      xapp_xfs |  DISTRO  | https://release-monitoring.org/project/005256 | 1.2.1        | 1.2.2        | ORPH
                    xapp_xhost |  DISTRO  | https://release-monitoring.org/project/015021 | 1.0.9        | 1.0.10       | ORPH
                    xapp_xinit |  DISTRO  | https://release-monitoring.org/project/005258 | 1.4.2        | 1.4.4        | ORPH
                  xapp_xkbcomp |  DISTRO  | https://release-monitoring.org/project/015018 | 1.4.6        | 1.4.7        | ORPH
                   xapp_xkbevd |  DISTRO  | https://release-monitoring.org/project/015017 | 1.1.5        | 1.1.6        | ORPH
                 xapp_xkbprint |  DISTRO  | https://release-monitoring.org/project/017159 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xkbutils |  DISTRO  | https://release-monitoring.org/project/015016 | 1.0.5        | 1.0.6        | ORPH
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/014992 | 1.1.4        | 1.2.0        | ORPH
                    xapp_xlogo |  DISTRO  | https://release-monitoring.org/project/014991 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/014964 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xmag |  DISTRO  | https://release-monitoring.org/project/014963 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xman |  DISTRO  | https://release-monitoring.org/project/014962 | 1.1.5        | 1.2.0        | ORPH
                 xapp_xmessage |  DISTRO  | https://release-monitoring.org/project/014961 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xmh |  DISTRO  | https://release-monitoring.org/project/021718 | 1.0.4        | 1.0.5        | ORPH
                    xapp_xmore |  DISTRO  | https://release-monitoring.org/project/018845 | 1.0.3        | 1.0.4        | ORPH
                      xapp_xpr |  DISTRO  | https://release-monitoring.org/project/014959 | 1.1.0        | 1.2.0        | ORPH
                    xapp_xprop |  DISTRO  | https://release-monitoring.org/project/014958 | 1.2.6        | 1.2.8        | ORPH
                   xapp_xrandr |  DISTRO  | https://release-monitoring.org/project/014957 | 1.5.2        | 1.5.3        | ORPH
                 xapp_xrefresh |  DISTRO  | https://release-monitoring.org/project/014955 | 1.0.7        | 1.1.0        | ORPH
                      xapp_xsm |  DISTRO  | https://release-monitoring.org/project/005259 | 1.0.5        | 1.0.6        | ORPH
                     xapp_xwud |  DISTRO  | https://release-monitoring.org/project/014948 | 1.0.6        | 1.0.7        | ORPH
                     xcb-proto |  DISTRO  | https://release-monitoring.org/project/013646 | 1.15.2       | 1.17.0       | ORPH
               xcb-util-cursor |  DISTRO  | https://release-monitoring.org/project/005166 | 0.1.4        | 0.1.5        | ORPH
      xdriver_xf86-input-evdev |  DISTRO  | https://release-monitoring.org/project/005217 | 2.10.6       | 2.11.0       | ORPH
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/005782 | 1.3.0        | 1.5.0        | ORPH
  xdriver_xf86-input-synaptics |  DISTRO  | https://release-monitoring.org/project/005239 | 1.9.2        | 1.10.0       | ORPH
        xdriver_xf86-video-ast |  DISTRO  | https://release-monitoring.org/project/017163 | 1.1.6        | 1.2.0        | ORPH
      xdriver_xf86-video-fbdev |  DISTRO  | https://release-monitoring.org/project/005218 | 0.5.0        | 0.5.1        | ORPH
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/005219 | 2.11.21      | 2.18.1       | ORPH
     xdriver_xf86-video-mach64 |  DISTRO  | https://release-monitoring.org/project/005225 | 6.9.7        | 6.10.0       | ORPH
        xdriver_xf86-video-mga |  DISTRO  | https://release-monitoring.org/project/005226 | 2.0.1        | 2.1.0        | ORPH
    xdriver_xf86-video-nouveau |  DISTRO  | https://release-monitoring.org/project/005229 | 1.0.17       | 1.0.18       | ORPH
         xdriver_xf86-video-nv |  DISTRO  | https://release-monitoring.org/project/021711 | 2.1.22       | 2.1.23       | ORPH
       xdriver_xf86-video-r128 |  DISTRO  | https://release-monitoring.org/project/005232 | 6.12.1       | 6.13.0       | ORPH
     xdriver_xf86-video-savage |  DISTRO  | https://release-monitoring.org/project/005235 | 2.4.0        | 2.4.1        | ORPH
xdriver_xf86-video-siliconm... |  DISTRO  | https://release-monitoring.org/project/005236 | 1.7.9        | 1.7.10       | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/005181 | 4.14.6       | 4.20.0       |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/005182 | 3.2.4        | 3.3.0        | ORPH
               xfont_encodings |  DISTRO  | https://release-monitoring.org/project/015051 | 1.0.7        | 1.1.0        | ORPH
 xfont_font-adobe-utopia-75dpi |  DISTRO  | https://release-monitoring.org/project/017200 | 1.0.4        | 1.0.5        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/015055 | 1.4.0        | 1.4.1        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/005188 | 6.11.0       | 6.14.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/006382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/005191 | 2.38         | 2.44         | ORPH
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/005193 | 1.3.18       | 1.3.19       | ORPH
                    xlib_libFS |  DISTRO  | https://release-monitoring.org/project/001618 | 1.0.9        | 1.0.10       | ORPH
                   xlib_libICE |  DISTRO  | https://release-monitoring.org/project/001638 | 1.1.1        | 1.1.2        | ORPH
                    xlib_libSM |  DISTRO  | https://release-monitoring.org/project/001726 | 1.2.4        | 1.2.6        | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/001764 | 1.8.7        | 1.8.12       | ORPH
                   xlib_libXau |  DISTRO  | https://release-monitoring.org/project/001765 | 1.0.11       | 1.0.12       | ORPH
                   xlib_libXaw |  DISTRO  | https://release-monitoring.org/project/001766 | 1.0.15       | 1.0.16       | ORPH
               xlib_libXcursor |  DISTRO  | https://release-monitoring.org/project/001770 | 1.2.1        | 1.2.3        | ORPH
                 xlib_libXdmcp |  DISTRO  | https://release-monitoring.org/project/001772 | 1.1.4        | 1.1.5        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/001774 | 1.3.5        | 1.3.6        | ORPH
                xlib_libXfont2 |  DISTRO  | https://release-monitoring.org/project/017165 | 2.0.6        | 2.0.7        | ORPH
                   xlib_libXft |  DISTRO  | https://release-monitoring.org/project/001777 | 2.3.8        | 2.3.9        | ORPH
                    xlib_libXi |  DISTRO  | https://release-monitoring.org/project/001778 | 1.8.1        | 1.8.2        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/001785 | 1.1.4        | 1.2.1        | ORPH
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/001788 | 1.5.3        | 1.5.4        | ORPH
               xlib_libXrender |  DISTRO  | https://release-monitoring.org/project/001789 | 0.9.11       | 0.9.12       | ORPH
                    xlib_libXt |  DISTRO  | https://release-monitoring.org/project/001793 | 1.3.0        | 1.3.1        | ORPH
                  xlib_libXtst |  DISTRO  | https://release-monitoring.org/project/001794 | 1.2.4        | 1.2.5        | ORPH
                    xlib_libXv |  DISTRO  | https://release-monitoring.org/project/001795 | 1.0.12       | 1.0.13       | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/001796 | 1.0.13       | 1.0.14       | ORPH
               xlib_libXxf86vm |  DISTRO  | https://release-monitoring.org/project/001799 | 1.1.5        | 1.1.6        | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/001613 | 1.1.7        | 1.1.8        | ORPH
                  xlib_libxcvt |  DISTRO  | https://release-monitoring.org/project/235147 | 0.1.2        | 0.1.3        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/001781 | 1.1.2        | 1.1.3        | ORPH
                   xlib_xtrans |  DISTRO  | https://release-monitoring.org/project/013441 | 1.5.0        | 1.6.0        | ORPH
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/005269 | 6.03         | 6.10.1       |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/007736 | 3.24         | 3.27         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/005272 | 389          | 398          | ORPH
              xutil_makedepend |  DISTRO  | https://release-monitoring.org/project/013528 | 1.0.8        | 1.0.9        | ORPH
             xutil_util-macros |  DISTRO  | https://release-monitoring.org/project/015037 | 1.20.0       | 1.20.2       | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/005280 | 0.40.0       | 14.1         |     
                            z3 |  DISTRO  | https://release-monitoring.org/project/007812 | 4.13.3       | 4.15.0       |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/005492 | 7.2.5        | 7.2.6        |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.5.1        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 7.2.0        |     
                        zoxide |  DISTRO  | https://release-monitoring.org/project/098400 | 0.9.6        | 0.9.7        |     
                       zziplib |  DISTRO  | https://release-monitoring.org/project/013802 | 0.13.74      | 0.13.79      |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2025-3891    | https://security-tracker.debian.org/tracker/CVE-2025-3891   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-3015    | https://security-tracker.debian.org/tracker/CVE-2025-3015   
                        assimp | CVE-2025-3016    | https://security-tracker.debian.org/tracker/CVE-2025-3016   
                        assimp | CVE-2025-2152    | https://security-tracker.debian.org/tracker/CVE-2025-2152   
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                     bootstrap | CVE-2024-6531    | https://security-tracker.debian.org/tracker/CVE-2024-6531   
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          dpdk | CVE-2015-1142857 | https://security-tracker.debian.org/tracker/CVE-2015-1142857
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2024-45778   | https://security-tracker.debian.org/tracker/CVE-2024-45778  
                         grub2 | CVE-2024-45782   | https://security-tracker.debian.org/tracker/CVE-2024-45782  
                         grub2 | CVE-2024-45779   | https://security-tracker.debian.org/tracker/CVE-2024-45779  
                         grub2 | CVE-2024-45780   | https://security-tracker.debian.org/tracker/CVE-2024-45780  
                         grub2 | CVE-2025-0678    | https://security-tracker.debian.org/tracker/CVE-2025-0678   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                        libbpf | CVE-2025-29481   | https://security-tracker.debian.org/tracker/CVE-2025-29481  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                       libheif | CVE-2025-43967   | https://security-tracker.debian.org/tracker/CVE-2025-43967  
                       libheif | CVE-2025-43966   | https://security-tracker.debian.org/tracker/CVE-2025-43966  
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     linux-pam | CVE-2024-10041   | https://security-tracker.debian.org/tracker/CVE-2024-10041  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                   micropython | CVE-2024-8947    | https://security-tracker.debian.org/tracker/CVE-2024-8947   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2024-49393   | https://security-tracker.debian.org/tracker/CVE-2024-49393  
                          mutt | CVE-2024-49395   | https://security-tracker.debian.org/tracker/CVE-2024-49395  
                          mutt | CVE-2024-49394   | https://security-tracker.debian.org/tracker/CVE-2024-49394  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                           orc | CVE-2024-40897   | https://security-tracker.debian.org/tracker/CVE-2024-40897  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2023-0778    | https://security-tracker.debian.org/tracker/CVE-2023-0778   
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sngrep | CVE-2024-3119    | https://security-tracker.debian.org/tracker/CVE-2024-3119   
                        sngrep | CVE-2024-3120    | https://security-tracker.debian.org/tracker/CVE-2024-3120   
                           sox | CVE-2023-34432   | https://security-tracker.debian.org/tracker/CVE-2023-34432  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                     tcpreplay | CVE-2023-43279   | https://security-tracker.debian.org/tracker/CVE-2023-43279  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                       tinyxml | CVE-2023-34194   | https://security-tracker.debian.org/tracker/CVE-2023-34194  
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                      unixodbc | CVE-2024-1013    | https://security-tracker.debian.org/tracker/CVE-2024-1013   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                           vim | CVE-2024-45306   | https://security-tracker.debian.org/tracker/CVE-2024-45306  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                        xerces | CVE-2024-23807   | https://security-tracker.debian.org/tracker/CVE-2024-23807  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2025.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2025-3891    | https://security-tracker.debian.org/tracker/CVE-2025-3891   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-3015    | https://security-tracker.debian.org/tracker/CVE-2025-3015   
                        assimp | CVE-2025-3016    | https://security-tracker.debian.org/tracker/CVE-2025-3016   
                        assimp | CVE-2025-2152    | https://security-tracker.debian.org/tracker/CVE-2025-2152   
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                     bootstrap | CVE-2024-6531    | https://security-tracker.debian.org/tracker/CVE-2024-6531   
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          dpdk | CVE-2015-1142857 | https://security-tracker.debian.org/tracker/CVE-2015-1142857
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2024-45778   | https://security-tracker.debian.org/tracker/CVE-2024-45778  
                         grub2 | CVE-2024-45782   | https://security-tracker.debian.org/tracker/CVE-2024-45782  
                         grub2 | CVE-2024-45779   | https://security-tracker.debian.org/tracker/CVE-2024-45779  
                         grub2 | CVE-2024-45780   | https://security-tracker.debian.org/tracker/CVE-2024-45780  
                         grub2 | CVE-2025-0678    | https://security-tracker.debian.org/tracker/CVE-2025-0678   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                        libbpf | CVE-2025-29481   | https://security-tracker.debian.org/tracker/CVE-2025-29481  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                       libheif | CVE-2025-43967   | https://security-tracker.debian.org/tracker/CVE-2025-43967  
                       libheif | CVE-2025-43966   | https://security-tracker.debian.org/tracker/CVE-2025-43966  
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     linux-pam | CVE-2024-10041   | https://security-tracker.debian.org/tracker/CVE-2024-10041  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                   micropython | CVE-2024-8947    | https://security-tracker.debian.org/tracker/CVE-2024-8947   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2024-49393   | https://security-tracker.debian.org/tracker/CVE-2024-49393  
                          mutt | CVE-2024-49395   | https://security-tracker.debian.org/tracker/CVE-2024-49395  
                          mutt | CVE-2024-49394   | https://security-tracker.debian.org/tracker/CVE-2024-49394  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2025-26465   | https://security-tracker.debian.org/tracker/CVE-2025-26465  
                       openssh | CVE-2025-26466   | https://security-tracker.debian.org/tracker/CVE-2025-26466  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                           orc | CVE-2024-40897   | https://security-tracker.debian.org/tracker/CVE-2024-40897  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                       qt5base | CVE-2011-3193    | https://security-tracker.debian.org/tracker/CVE-2011-3193   
                       qt5base | CVE-2012-6093    | https://security-tracker.debian.org/tracker/CVE-2012-6093   
                       qt5base | CVE-2014-0190    | https://security-tracker.debian.org/tracker/CVE-2014-0190   
                       qt5base | CVE-2015-1290    | https://security-tracker.debian.org/tracker/CVE-2015-1290   
                       qt5base | CVE-2017-10904   | https://security-tracker.debian.org/tracker/CVE-2017-10904  
                       qt5base | CVE-2017-10905   | https://security-tracker.debian.org/tracker/CVE-2017-10905  
                       qt5base | CVE-2018-21035   | https://security-tracker.debian.org/tracker/CVE-2018-21035  
                       qt5base | CVE-2018-19869   | https://security-tracker.debian.org/tracker/CVE-2018-19869  
                       qt5base | CVE-2018-19871   | https://security-tracker.debian.org/tracker/CVE-2018-19871  
                       qt5base | CVE-2018-19870   | https://security-tracker.debian.org/tracker/CVE-2018-19870  
                       qt5base | CVE-2018-19873   | https://security-tracker.debian.org/tracker/CVE-2018-19873  
                       qt5base | CVE-2020-0570    | https://security-tracker.debian.org/tracker/CVE-2020-0570   
                       qt5base | CVE-2020-17507   | https://security-tracker.debian.org/tracker/CVE-2020-17507  
                       qt5base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sngrep | CVE-2024-3119    | https://security-tracker.debian.org/tracker/CVE-2024-3119   
                        sngrep | CVE-2024-3120    | https://security-tracker.debian.org/tracker/CVE-2024-3120   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                     tcpreplay | CVE-2023-43279   | https://security-tracker.debian.org/tracker/CVE-2023-43279  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                      unixodbc | CVE-2024-1013    | https://security-tracker.debian.org/tracker/CVE-2024-1013   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                           vim | CVE-2024-45306   | https://security-tracker.debian.org/tracker/CVE-2024-45306  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                        xerces | CVE-2024-23807   | https://security-tracker.debian.org/tracker/CVE-2024-23807  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
