Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E30AC83F1B
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 03:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8E67611CA;
	Thu, 17 Jul 2025 03:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQ_Qor5V4Eth; Thu, 17 Jul 2025 03:14:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D1576156F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D1576156F;
	Thu, 17 Jul 2025 03:14:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98FB411AA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 03:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA1DE40545
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 03:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RxalfJvcDx-6 for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 03:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 151D240AEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 151D240AEE
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 151D240AEE
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 03:14:04 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-611f74c1837so818420a12.3
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 20:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752722043; x=1753326843;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2ta7AJunU2vU0ydL4siWyJOz/qKUUPqi3jde8PTHspc=;
 b=E+Y5skB0nYslfprHUqzbgP+9LbjDQ2oNUE4XfKACGogsocKhNwWVr4yYIYo53+Abaq
 rGHt5y4vnSOR6wE9888sfgTtQlrBOc5XJGkSdLkGpCiYx8cq9pmcefU3koRHSg2PBaVn
 eqRgNtv+ElFeoQmPev/OWczzSRLkD8Qdc3qR5DKl2ynbJZE9SUnkf2RSzYUX92++jzcx
 DuvVvHp8BFbVfKwvTCBVeNobkZ0htXdkWRnDrn/+7H8F0/LryWvre5fX5kmZ1cNtSczV
 o52nXuSTOpF75H3e532X4myI+aRMuvDx8F8oxbWcQNrHaMRFJDScDWeC4pAfZDAcABhQ
 lNXw==
X-Gm-Message-State: AOJu0YxbzX7Vh6XIYHZZgXh3H4ZTAKkRllC1vLUJFQDZOMAQzvbGI0co
 ocR1k43IeAiGWJKgCyKQpJvTZM/ZYGgNyUh3OwwH1R5dGoXtw+FIS9Qcgp22SQ==
X-Gm-Gg: ASbGncvSKCZt/rD0nq10+uGR00KWhS0fbh1Kjkm227odwoXXym1iqXdvhgEwLIbu69L
 jyKZ6P6qwxLMvxP465AZdlACB0BlUl3GIWvw3QqsY0gET4LwrQ0uC7mJv8ePWGGzHVOxtjsSsBB
 HVcbIlKsH5VCxlairsKFcBRJTJiXU90veyV2UE8U45jV1Kl+LNI+8NbRTkiughz1J1v5qGzjX5w
 de/LA47/UCHzWLhz83zmt37Atyp4/+n+7kDPzfYzXQLhDb8hJYHB/FjaSHMiPvRXT+UTIh3g3Ho
 647biSYr2IJym684CnG4POJibSWzyW3YE1dchjwwH1jvgc0WG6fV8zuoEP0bgG8EmAmq+uhtok6
 8n4c4p8qnv4d5Elo4yW35Ry1hFw==
X-Google-Smtp-Source: AGHT+IFlFBOkrDO5OaLHkjqzgXRMnQ3vKAt6dok8admNPSB+IkvAkCcI0egzI1iMDu64Y4J5eRLi3Q==
X-Received: by 2002:a05:6402:440f:b0:611:fbcb:9361 with SMTP id
 4fb4d7f45d1cf-61282609aeamr4214778a12.32.1752722042406; 
 Wed, 16 Jul 2025 20:14:02 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82921bdsm1283072066b.110.2025.07.16.20.14.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 20:14:02 -0700 (PDT)
Message-ID: <68786a7a.170a0220.237fd8.489f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 17 Jul 2025 03:14:02 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752722043; x=1753326843; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2ta7AJunU2vU0ydL4siWyJOz/qKUUPqi3jde8PTHspc=;
 b=jTd7K5zjcujHrRSWTvOsO/WVAB8z8HVTD2IAn8V410NAIjK5ZEbn1NPgO12PahPRai
 oXCxNsPse/Agcw/69YBZNY71/AXh9jZ6gv+EeH+fnG5Aqb40Kp2NvqPmqiCX5WDRnh9L
 IX0a6DkRwvjrTnQEv5NiwS5ClzKMCJLhOrmd+Xmju6GbhMaHv0lkIkSLO5htREw/4KH3
 DAJUfbujjaycUVJYxuf312xgsuwAZw139lAGwx8E2FsQFDV1HNIxo9oNQVmg4MHzH1oz
 rxap8y+JcHSW2kNFEn95rxT6kkjRIyuDe2ohJGDOldrJYbskAM317UccevWiW5cXJ9D0
 q0Qw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jTd7K5zj
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-16
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

Autobuild statistics for 2025-07-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  5  |  0  |  9  |
  2025.05.x  |  4  |  5  |  0  |  9  |
    master   | 16  | 125 |  0  | 141 |

Classification of failures by reason for master
-----------------------------------------------

        liblog4c-localtime-1.0 | 7 
                   cvs-1.12.13 | 4 
  gobject-introspection-1.84.0 | 4 
host-binutils-arc-2023.09-r... | 4 
        host-berkeleydb-5.3.28 | 3 
       host-gcc-initial-14.3.0 | 3 
libdbi-drivers-0bfae6c43134... | 3 
                 libmbus-0.8.0 | 3 
libsvgtiny-ea9d99fc8b231c22... | 3 
              skalibs-2.14.3.0 | 3 
        b43-firmware-5.100.138 | 2 
                   bash-5.2.37 | 2 
              fluent-bit-4.0.3 | 2 
         host-gcc-final-14.3.0 | 2 
                 host-gdb-14.2 | 2 
              host-guile-3.0.9 | 2 
               libcap-ng-0.8.5 | 2 
                 libcddb-1.3.2 | 2 
                liboauth-1.0.3 | 2 
              libselinux-3.8.1 | 2 
                 libspdm-3.5.0 | 2 
                   linux-tools | 2 
                    mpir-3.0.0 | 2 
                    musl-1.2.5 | 2 
                   nanocom-1.0 | 2 
                  ntp-4.2.8p18 | 2 
                openssh-10.0p1 | 2 
                   perl-5.40.2 | 2 
                       unknown | 2 
          aardvark-dns-v1.15.0 | 1 
               asterisk-22.3.0 | 1 
           at-spi2-core-2.50.0 | 1 
             batman-adv-2024.4 | 1 
               bctoolbox-4.4.8 | 1 
brcm-patchram-plus-15bd6638... | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.4 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
             dahdi-linux-3.3.0 | 1 
             drbd-utils-9.21.4 | 1 
            ecryptfs-utils-111 | 1 
                    gcr-3.40.0 | 1 
                    gpm-1.20.7 | 1 
host-autoconf-archive-2023.... | 1 
          host-binutils-2.43.1 | 1 
            host-binutils-2.44 | 1 
         host-gcc-final-15.1.0 | 1 
       host-gcc-initial-15.1.0 | 1 
        host-sentry-cli-2.20.3 | 1 
                   iotools-1.8 | 1 
                  iozone-3.506 | 1 
                       jose-14 | 1 
                libdnet-1.18.0 | 1 
               libglib2-2.84.3 | 1 
                libheif-1.20.1 | 1 
                  libjwt-3.2.0 | 1 
             libmediaart-1.9.6 | 1 
              libopenssl-3.5.1 | 1 
              libsodium-1.0.18 | 1 
                libsoup3-3.6.5 | 1 
                  libsvg-0.1.4 | 1 
libuci-f3fc0b76040685829191... | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.15.6 | 1 
               lrzsz-0.12.21rc | 1 
         openfpgaloader-0.11.0 | 1 
      passt-2025_02_17.a1e48a0 | 1 
python-remi-2022.7.27-37-g1... | 1 
             python-webpy-0.62 | 1 
                python3-3.13.5 | 1 
                 rtptools-1.22 | 1 
                s6-dns-2.4.0.0 | 1 
          sane-airscan-0.99.33 | 1 
                setserial-2.17 | 1 
                    sslh-2.0.1 | 1 
                 systemd-257.7 | 1 
                   thttpd-2.29 | 1 
                   tini-0.19.0 | 1 
                   trinity-1.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/e126f932f8bc9d40a185ab939a6a9af3060d0e62 | ORPH
 aarch64_be  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/aa9799eb347048aa74523fdd083fe35d7a8857b7 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/81fa465507a857c75492f35f97f1d6e69eb1224e |     
    or1k     |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/724f856a4cfb2e41162c0562845b2eac96c92bd6 |     
   x86_64    |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/a742aeca7b1d840f1d138c12d46550b96a988083 |     
  sparc64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/ce04412cfc9f8ed721f791a4f8837a753540af93 | ORPH
  mips64el   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/b6d09c56d4373ac2f7c11fbfc60844274f9b5abb | ORPH
   mipsel    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/24db632b4a18703cf1b24b522ecf5d10bb84ce6b |     
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e2cedefec4cf2768d63d83e966751f0a3ab94eea | ORPH
 powerpc64   | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/430e1a66f222c327a4d0b89110f45d450fab8713 |     
    m68k     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/8707c8d3e7149807593d7b1683072ad6ddf28422 | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/c2c5b125f95fcde999a9c97d1496e90bfa03308f |     
  aarch64    | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/02e3d536ff9d059e91f679111d41ea2dfe72463d |     
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/42e84ac8861575bae9a9ecf868877c0dc7274ee3 | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/490aafc876bbf9c904371adedd41893308b78bdd | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f7561045f08becf99bd71485bd2fb0451ab90c60 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9e77b6573db40ebb5613d32c26d8146afb6cec99 | ORPH
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5133f348d06d4cb2d2d1761221fc3cbfed86e125 | ORPH
   s390x     |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/808e17e13940111877856fb8fa0c2229ca937f16 |     
    m68k     |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/16507d025328085bc749c3cdd21aee35218cbf61 |     
    m68k     |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/ac7f8033edd31bdef371f56688d1dfb86e1abcca |     
   mipsel    |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/94b2743d814f1f1dab90710ca78a9eb67032fc5c |     
powerpc64le  |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/845a394d1c9da0c10327a58f17e1b7ae07c3b8de | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0e4d6d381b7f50caaa7a7529b73fc30dc3306281 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6c2762f38a5be1c0fc1e11fa9082ff7babd91afe | ORPH
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3d4e27262f089d6f05cb5d83e292018522c347c2 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/107c43111ac4411d9bd9f6efa8ab87450ec15aec | ORPH
  powerpc    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/5fcb57c6e1bb06028627c726512bd53ed712c727 |     
   armeb     | host-autoconf-archive-2023.... | NOK | https://autobuild.buildroot.org/results/f9c3c59b9269e5147a1fc079117df04ee13157ed | ORPH
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/b0e5915e0779bd20c36928090ae99aa935ee69bf | ORPH
    sh4a     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/9549dc857a750b3eb5d37e31e56bb09fd0e2d384 | ORPH
 aarch64_be  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/9bd1356a1a55e7a71fb441f81a8de0c2f53ea0f2 | ORPH
 aarch64_be  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0837b7163fde2f12ecc60b92977dde33dd7e4d07 |     
   mips64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/d43a493cf1367a1bdd37e230aea19b89d46b8a1b |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/68be25271a6fd6e0cd113d729a71fe519129580b |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/7d30a458cb832523dff63e7b28f42b61a5f14783 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/54b2553ff00b142b471f6ecc7a84075652af55dd |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/fe8eca1c3c1c3188a281f4164f15ebb8ff51b6ff |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/5a3189ce3b1e0f2ce9ad82e61c674a702b44c5c5 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/d499bfdfeb69314c420014ba55c722e963852e88 |     
loongarch64  |     host-gcc-final-15.1.0      | NOK | https://autobuild.buildroot.org/results/32c6469068bbba8af19513a8b5c70691f29aef4d |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/7cae73e71f3daccf5ddd6b3c165d383f02377198 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/e7a86b9e7880a013fe368264cc650784a30010af |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/386df560fc3d3979e5688a2e9d3c3db37c2df16f |     
loongarch64  |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/8d516cb585224830577a7d302ed481aa467a610b |     
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/402dd7e56f11fc959ce2bddcfa717db62af98e87 | ORPH
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/6aaadd9665f7e64bdac76d687ffee475ad08622a | ORPH
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/b8cd60b34cc8bfb9be1da9757e3be8dbd57236ef |     
   mips64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/7863794cc9fe88ab53ace7fe299f38f3acc60a4b |     
  mips64el   |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/db4fd0c95f85364e91a4bb6ff5000f139e72cd7f |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/e9a386d920ca58b520e27165960ffec4333f0ff0 |     
 aarch64_be  |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/3137de6f161d4089e7410e33367b7494fd6d0cd2 |     
microblazeel |            jose-14             | NOK | https://autobuild.buildroot.org/results/a0db1076ba49591e7aff5983a411176eb52a86a3 |     
   sh4eb     |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/8a9884d384cd90a8f35f804204c5f51fed436228 |     
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/74deec54e5f245bbade1312dd1d1cb34b4a602df |     
   s390x     |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/16df2f9190745c3cae567ea123096d9e8d012c63 |     
  aarch64    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/bc6e9e92e355460539cbece68c4abe2b5d2c2111 |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/52800df95f3fe66031ba949c864f05ee7520a718 |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/846f55126fb1123a7d7d5df05131c71e3fae2afe |     
powerpc64le  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/a7660471386bf0b66e3e3749cc542543ed10ac83 |     
powerpc64le  |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/9a3e157363671458bf57a035809c537ebe972139 | ORPH
    m68k     |        libglib2-2.84.3         | NOK | https://autobuild.buildroot.org/results/7fe5d03ae46365cef0644ae02c67b52564c3cd8b |     
  aarch64    |         libheif-1.20.1         | NOK | https://autobuild.buildroot.org/results/cdd6a2e4510176b6b1c79dd4c2882b80a42e4870 |     
   arceb     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/30cec5667411275a3bc8fadf5e774b78983ab120 |     
    or1k     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/ff4c02ef5092183eaec96cc7e3d44cc48653179c |     
 aarch64_be  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/9736902e21bb979b98cda22244b8e114783caf5b |     
    arm      |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/550fd0e79f30ca59c4d80213114a10a3cdb9a819 |     
    mips     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/7bee55347555992f8b2fb22d752aec6d019db1d9 |     
   x86_64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/bac91ba83a73bd13c0a4de81670807962ddc55bf |     
powerpc64le  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/e924ce34847e54048d6c739fe2c4f1bcf5b09326 |     
   mipsel    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/1f27c851c4504d86ced717a5a6df2d9f6d0e2481 |     
   s390x     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/beab9bbc8bf387af115014b28a4a4fbee1caa017 | ORPH
    i686     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/33d0846a2abea845508e472df5e454543e48f0ad | ORPH
   xtensa    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/226d5d57e187433c592698da187a2c8168fe7f7c | ORPH
 powerpc64   |       libmediaart-1.9.6        | NOK | https://autobuild.buildroot.org/results/77b8b87d98860cf2b3111bd1b69f52f0437c1675 |     
    arm      |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/d37ec72e2abe531ae8ef41200d4cd84d520afc1b | ORPH
   x86_64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/9d22e0d1e1d66767224cdfb659e5457e71d6bbc7 | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/0443ceb9854e06af205e8c531380bd0ada469b52 | ORPH
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/94a84a3397bf3a57627b678265b3b1578e8e46ff |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/356e8eb9e8ab3e9fda502d09283427526a85336d |     
  mips64el   |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/3627c050692824247abad1217a05560c9001211d |     
    m68k     |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/b45992ad1b2b0275df5f697d173db1f3c22ab6d0 |     
 aarch64_be  |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/b3a6d79e2bfbedec247717b74a1eb2d75d0fb06d |     
    i686     |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/8f3f6572255a07fa440d4299c53b378945b38edd |     
   sparc     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/889ddb8a1a031fbad1eea5f6e135e282716c80bf |     
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/5f0d8017a818db5ef0abf2d4ebb4695983ef78e1 | ORPH
   armeb     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/e42332b40ba06f6e08c894d9c1742b22661c523e | ORPH
    mips     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/d432c13b99b1289d06ec1e444916f806b3b96ea7 | ORPH
    arc      | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/8da0d40b8f5fbea990eda3d9ffc8d9fe0a111281 |     
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a386cdeeeb5527c24c0e649f712e1ef145ae2ec7 | ORPH
  mips64el   |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/c332c2f529249bc7ea63df9ee7de153f89d7a129 | ORPH
    m68k     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/10532f8296020aacfd83633137e397fa7449662f | ORPH
 microblaze  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/857682e067e87c1d333eba7c7e4d9d064aee1ff4 | ORPH
    mips     |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/e345c20497fa8cdda033eecbfcf381b54f2395c6 | ORPH
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e6ace363431de8426c31d2bfb9547663adb395cc |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/160f87800524500786c9792c0036a6a7a93a255f |     
loongarch64  |           musl-1.2.5           | NOK | https://autobuild.buildroot.org/results/928613debd74855fb99c190aa2efebe63b5f0587 |     
loongarch64  |           musl-1.2.5           | NOK | https://autobuild.buildroot.org/results/b3e765d69e334392feefeb9a33bfb17a7259d906 |     
   sparc     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/5afdced444ed59f6c606ecc8d5833c2e20cdcd61 |     
    m68k     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/db1311bf42dc115f4dd61a979563270ecf500e58 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/adfd4ac391a3dc4f213182df71da8442f2d3aca6 |     
   sh4aeb    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/50b6b6982255c03dee815aa005c019a8cc2d0ce3 |     
 microblaze  |     openfpgaloader-0.11.0      | NOK | https://autobuild.buildroot.org/results/43905f7536b12c7ff3d54b7cc88f0ed8182203cc |     
   mips64    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/60167157fa55e707c117abd06968ca3ba6065c8a | ORPH
   mipsel    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/58c7d3a043e7923e678f0b0e59d07a5b1186b3c6 | ORPH
   xtensa    |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/fd8b2d80c440a1f8fabe1d83f1b0248297db8879 | ORPH
   mipsel    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/fe460f31790bdd4dc8bcb28ffbbfdcb7a946a2ce |     
microblazeel |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/90199aeb497a14e2be2fe185a7c24ef540b20f80 |     
microblazeel | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/f998bae4be110ea95e7d28c322a33716fe042b6a |     
 microblaze  |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/b641abd56df66518124a9581d73b763dd24569b1 |     
   sh4aeb    |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/a78ba4c447dfdc1e828ddb7b4759f4a066716bf9 |     
    or1k     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/03d9297868d2c4ce2c984e7ccc29163350a05c22 | ORPH
    or1k     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/e274543a22f51b17f41ffb8d31783c4440adf848 |     
microblazeel |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/cc96b10da6e0a019e20546eb8162688077bb57db |     
    i686     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/862ae210fdfd6383c2911e876ac6323dd67440a7 | ORPH
    mips     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/3717806479dd8452d414de649ce41792a5bc4b18 |     
   mipsel    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/7af32c317d5a497f6bf5aefe195ac207c8273e8a |     
  powerpc    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/ead226e3b0bcbcf98c5181662685acb5907922cb |     
   s390x     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/c3bd35e9231b2195da5aba86402954061cb320ed | ORPH
powerpc64le  |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/76c4b589e0e49b0a7919b028c11c014424d49a50 |     
   sparc     |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/37fe4c03bbbc3bde590a1b2e9ff20e9680d3c753 | ORPH
    or1k     |          tini-0.19.0           | NOK | https://autobuild.buildroot.org/results/9c0ceff9cbc57bfff16d7e5d6b6254ca5371cd7f |     
  aarch64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/3236e647b5a0358ee6cc3fbab12dbe2fff8d8e78 | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3cae666f2e8e2f2e3b6f322b03a041a941f1fb86 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c315e49a8bfb63b7a27a3fcbc766fe402bc11045 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    bat-0.25.0 | 1 
               bctoolbox-4.4.8 | 1 
               host-vde2-2.3.3 | 1 
uclibc-ng-test-132c6134d691... | 1 
ustream-ssl-68d09243b6fd447... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/875c81ffec0baf378706225acc60e52dc57d04cc |     
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/174ce01207b902353baab206d2c3aefcc31fd3ec | ORPH
    mips     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/5412508fbe020de59f1bb53ed42cc13d3a1f227e | ORPH
    arm      | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/8a83afb82f06bdf8f87ed79aa6815ad3b8cb38ed |     
    m68k     | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/6a34fae03a5cbc00b24b6d7852392b00600518ed | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              fftw-quad-3.3.10 | 1 
       freeradius-server-3.2.6 | 1 
           ghostscript-10.05.1 | 1 
libdbi-drivers-0bfae6c43134... | 1 
               pulseaudio-17.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/a80e1108387b8aec127d3c83a1b6815d9135d995 | ORPH
    or1k     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/240ef93ed6eda1f505863065b958b5431e70aa6f |     
    mips     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/5e694874975c5890065fa729f71cc9680aab7f8d |     
    m68k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/1dee67debadaa6573654db91c53239e90e51d522 |     
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/180fe82bdd497eaf1e65f09dd30161595b0504cb | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
