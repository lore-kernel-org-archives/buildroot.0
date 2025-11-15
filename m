Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CF5CEB2C0
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 04:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DC14843D0;
	Sat, 15 Nov 2025 04:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eu0NfuoxXDzA; Sat, 15 Nov 2025 04:21:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F002A843D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F002A843D1;
	Sat, 15 Nov 2025 04:21:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54483232
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 04:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46A45843D0
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 04:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShAUsk7lEcfl for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 04:21:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F692843D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F692843D1
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F692843D1
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 04:21:45 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so28674925e9.1
 for <buildroot@buildroot.org>; Fri, 14 Nov 2025 20:21:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763180503; x=1763785303;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FF2xH8o0e8OYhhrLNR7ZFxHkhTyDXvsjC0l7T1FqmHo=;
 b=Ylpb55vZWpVwmTnZnAeVVsnJdshSO2lq3HSIopQlag82D9oRns6HR+4cIQXgEzz5p1
 HpewpPlyx+pFjW+b1rfJgsNK5A8NRE4pesdhR5qg8x//Eox9MO8sL2LJtYUREXLMpnws
 MnQYhxQ8jY/IfKleSNM1hyNfyXDUZhzY2g2i0Q8onvpJu2cFYyIvQhIpLIlM63yY/RxF
 IVb231hBR9xoK0ZPSZufnyJzLPAuxzSbWp/maaeBU5iRhUs2Xe7Nl7OjUsYxVGnmXi4C
 aBkifV1Mp9KEdFlgLxlx1x4w7tiZQhP3zTrxvOEWLiymrMrbrWlbvhf4tmIk+pymhAiG
 S4RQ==
X-Gm-Message-State: AOJu0YxUhJDh/T4C6OdHWwwQeSBeFPscgxUxcak1JIjjeubI9LbLvir6
 bl7bhCOWDW4QK1XYO8J7Vnm9BCbni6PEef5dxmECu96w2Cc3scywl+iajVKmOg==
X-Gm-Gg: ASbGnculJBFEaaUMqchpbYVdeSZxrOAV7ngJqStBijm6GdO+dhrkO52sIJGxlogN2LG
 aFFlIXhiWV6WyKcNl0X8Q+7p9uTXbgpOFSzu4o/GzyTcfwxjKH+UPrqwSIMCLql0XJANDmTOuh2
 rTC42kZog0tPv97mY9m5U5IP+BRX1CEyvfLMd1KU2TiCBds9NGzpyrhaZoGvIAzFcsgUNgM0hJF
 TtB3NEgHSmbBsfSaBwrcDQ/L3IJwHKMaZt8P1B0GzT+IX/5aKwRH8Lkva+WofebdtfUXyJLLyei
 aDT47QsHV3PPG83wQGvKlcnr5t4yWXPcwwcXbc4Au2Xl5fvIrmkkQ2pxX9Gol5eT+G9qk9/vbR5
 U15RVqHjUIU0kixLWYAQrW9EZqMnQzWvwZKGdoxyOdUtpKYWWk6INl6TRrekSIsI+h8PT1Pt5vM
 K0LPhmaI4BXsk1UK9SrbehMPU4vKB6mTJoG106jg8=
X-Google-Smtp-Source: AGHT+IGGzXP1oeSRcUTK/wXThLPJzNPzz1WFHlEYOVCAxEQveSdWOJkET4iHT4xoeDb6fYVaSdCPbA==
X-Received: by 2002:a05:600c:c4a2:b0:477:c37:2ea7 with SMTP id
 5b1f17b1804b1-4778fe9ac28mr47915295e9.21.1763180502926; 
 Fri, 14 Nov 2025 20:21:42 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e7ae16sm13694780f8f.3.2025.11.14.20.21.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 20:21:42 -0800 (PST)
Message-ID: <6917ffd6.5d0a0220.2915ec.a2c7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 15 Nov 2025 04:21:42 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763180503; x=1763785303; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FF2xH8o0e8OYhhrLNR7ZFxHkhTyDXvsjC0l7T1FqmHo=;
 b=moQEs53qnIhwmkGm8enH3pey6DDwlUIj+nGSZQcEtbvp+1iVggSGqc4t4ceJHoy/V5
 pFGRkW4hLBW4V5V+byoDbq1pSY0jU3j2/MLWUvf4SP0B/I/8DDj1N84gWHbALZ10Dyck
 CPHQvmnHt4Mjsz3cvUH1I8VAPcts0m2TNjfTqPL6TH/HJFfCJvoCmTCF9hlRmM8ztjbS
 JQwF0VJENSN53LQEM234yG1OSVKHhThj0X7U+g1lwmhO1dRGMpIsXAUKxMkLwtggwfmN
 LMGhdsibpYje9Aoo2xVfRWCBCM6vF/Ogbps7iAiU8KBf+5IsyMGttBgKWKp8ADEUVoqA
 jLLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=moQEs53q
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-14
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

Autobuild statistics for 2025-11-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  8  |  0  | 14  |
  2025.05.x  |  7  |  6  |  0  | 13  |
  2025.08.x  |  2  |  2  |  0  |  4  |
    master   | 35  | 67  |  1  | 103 |

Classification of failures by reason for master
-----------------------------------------------

                openocd-0.12.0 | 7 
                     kbd-2.9.0 | 3 
                 host-gdb-14.2 | 2 
              host-guile-3.0.9 | 2 
           host-openocd-0.12.0 | 2 
                   libcap-2.77 | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
     libphidget-2.1.9.20190409 | 2 
                  linux-6.17.7 | 2 
                netdata-1.37.1 | 2 
                   perl-5.40.2 | 2 
                python3-3.13.9 | 2 
                  brotli-1.2.0 | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.4 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 dhcp-4.4.3-P1 | 1 
           dmraid-1.0.0.rc16-3 | 1 
             drbd-utils-9.21.4 | 1 
                     fd-10.3.0 | 1 
firmware-utils-86739f2b3ae9... | 1 
                    flac-1.5.0 | 1 
           ghostscript-10.06.0 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
  gobject-introspection-1.84.0 | 1 
           googlefontdirectory | 1 
                   gvfs-1.57.2 | 1 
                 host-gdb-15.2 | 1 
            igd2-for-linux-2.2 | 1 
            igh-ethercat-1.6.3 | 1 
libcamera-apps-v1.7.0-10-ge... | 1 
                libdrm-2.4.128 | 1 
                libroxml-3.0.2 | 1 
                  libsepol-3.9 | 1 
                  libsvg-0.1.4 | 1 
          linux-5.10.162-cip24 | 1 
                 lockdev-1.0.3 | 1 
                openswan-3.0.0 | 1 
      passt-2025_06_11.0293c6f | 1 
          perl-net-ssleay-1.94 | 1 
                safeclib-3.7.1 | 1 
               trousers-0.3.15 | 1 
                 uclibc-1.0.55 | 1 
uclibc-ng-test-132c6134d691... | 1 
                       unknown | 1 
                     unzip-6.0 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/519077c42b01a90c9920482052001a37779045e2 |     
    mips     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/88e69ceaf47d8d6bfffcba626423f2f959a283e1 | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/1f5d0d1a0c34fe0382beffcb1b2533bd9d3bfcfb |     
  powerpc    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/295f1aa42478a9fa39e84fac534d8e88d3ae53cd | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5e728b24ac9e174570941488d3af3141659c1be6 | ORPH
    sh4a     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/8c85881b87705a9945cea5276f159c1e110b19f5 | ORPH
   mipsel    | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/fd4889dcc492a0dee4c6513fd545f163cc57c8fe | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | https://autobuild.buildroot.org/results/eecd9ffa9e21f71e2c7c0761722aabfce749318a | ORPH
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/229987563b7c365a4a2f156e1a67120387f5704a | ORPH
powerpc64le  |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/d0423f182356b73ff9281e001d0108b4525a6961 |     
powerpc64le  |           fd-10.3.0            | NOK | https://autobuild.buildroot.org/results/ccc5819f4f82c0d0bc1704e0e43651b452b30b1b |     
   arceb     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/87c9c82e15e4fd61e81961757012cb8b814a8a79 |     
   sh4aeb    |           flac-1.5.0           | NOK | https://autobuild.buildroot.org/results/13771e432e04ede50929eadc1b13886294ad3e59 |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/de141873587e47e38cd634fa3c0523c6b0f0a027 |     
   arceb     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/3886072d694a910d3ec33d0591d251d6ebbb335c |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0d3759a4ea9162e58285f258d1235367ba0e0896 | ORPH
   armeb     |      googlefontdirectory       | TIM | https://autobuild.buildroot.org/results/2e5d54bdc4771e059e6974fea3b27ad26d93fb8c |     
    mips     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/6231545dff27a4883787ceef664219f17f9bd07a | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a2e955b9cbc1e4525ec0664a31d34e1eb659678d | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/4466cb23f3f49b9f3ba64e52ac3888d51f1077d5 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/8c70f80ce1e55179cae2141734eb9b04000c16b2 | ORPH
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/a9657b1e70a9d4cd6062c39cbf5a36cd6db4326d |     
    arm      |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/7d0f93c9bf53b54cb3e4dcc3f70b9612e0bf7b4d |     
 microblaze  |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/cefd82033f435718cc50f28e974632b1b8661faa | ORPH
    sh4a     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/24a7707aefeee73d6712c115a70948a668d20603 | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/ae39e1ccb10de29f7fc0d6ae5c26386a6f31a2d1 |     
  mips64el   |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/0492c5eb98d5722b3d0c791c68ddcb9265b2d7a8 |     
   mipsel    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/86f84f39c6186ffd3e8b26863d48c8a5a1fc4f4e | ORPH
   mipsel    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/1b76cdca60d0437472023a427ff8bb247734d05d | ORPH
powerpc64le  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/19c81936c21380d1db1e6c1896f441ea28163e71 | ORPH
   s390x     | libcamera-apps-v1.7.0-10-ge... | NOK | https://autobuild.buildroot.org/results/b0acc20a6d05a8580d9cef19f0889f047502194c |     
   s390x     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/b3eca36ddf587e46e6b4daa8f8b8801bedc82d23 |     
   x86_64    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/bd4048400868b7ea718c4106751942bdbcd05138 |     
   sparc     |         libdrm-2.4.128         | NOK | https://autobuild.buildroot.org/results/81ee721a48791f40076253e826064cc8a25edffc |     
   x86_64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/37474623fc91d3b5445d24e24c91660c5d166b7e |     
   armeb     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/03058c20383e30e3c3f9a0d3dd72b2a891f13d39 |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/c7a0b1df19b188279dae6de2aa914a98140a35b0 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e2c71b4da627387ba8ef75371b5ff4a14a0c01ce |     
   mipsel    |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/0ff4394319d2014884328c347ef495da327a562e |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/f65f6c882259453c37ce7587082f0a736db7b7ba |     
    sh4a     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/8a94521672c6efe6cd4308454764ee0fce157acc |     
  sparc64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a2938a7e7f9d07c8f7a9fd0664a6ae3ebdb2ac74 | ORPH
   sh4aeb    |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/d7cc4a6317f16d1b0e7cc50542b9beb8b74b591d | ORPH
   sh4aeb    |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/d15263d4100dbc447132f85f12eaba56d270d592 | ORPH
  aarch64    |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/07ff517bb4f5f44d9fec4859c4d2d51f6e5a04f9 | ORPH
  powerpc    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/a7b28fbd2d5ead9b04d972de7ceb5003dc0da937 |     
 aarch64_be  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/5d3ff9bf9f25a418afde1c5bde0d5f4707777c92 |     
microblazeel |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/40c0894b79218487dec470518956a8478538ddd7 | ORPH
    or1k     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/69227876dc6a8675b52251c57b59314de9a4be9c | ORPH
microblazeel |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/d8baedc71ef0924b4e6c3c6d1dfc00a3cc40a5ae | ORPH
   mipsel    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/68cb33bfff5433e5bbfec1d987390be3fb56b094 | ORPH
   xtensa    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/ffaf6eeb3f64aeabda24d115e9150c13a9fb4ea4 | ORPH
 powerpc64   |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/22080fc54a653edb6f684682aa4bf9f5240be253 | ORPH
  mips64el   |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/e2c7076658c21364cd5f88785b5659e7f7346d61 | ORPH
   arceb     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/40c1da828df8fd506a304074eb9de3f17badafae | ORPH
   xtensa    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/25bbd4c9693468fc0f74f5182b85cf8d9dd687d5 | ORPH
loongarch64  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/2bfd18e24e86332120ce735d0f87b6b3d5217bbb |     
    arm      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/6c5c42a8bdf47552d189a4c234cd65d73f30dc77 |     
   mipsel    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/c2d799a4306d9b8e18bf06136059765f7534db28 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/25ad62d29f105e1ce4bb2576753db579cd13e5b7 |     
   mipsel    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/f2678bdfff1435e8ee6542cc0d814242e7bbaa79 |     
   x86_64    |         safeclib-3.7.1         | NOK | https://autobuild.buildroot.org/results/fe9383171a36ec7d13d6bde49fa81da12b226416 |     
   mipsel    |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/b1a84fe6098cf6e2ff750a3a5e59e26418be6a77 |     
  riscv32    |         uclibc-1.0.55          | NOK | https://autobuild.buildroot.org/results/f542f6f2c3b32350a0111bfee8e2a9f94f547068 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/adcf2282c8da99c821369ce20524eefdad4f8fc3 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/e9404cd7f352e5fb3ebfeb16e1269ae9ca9b7a7c |     
   s390x     |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/c8d88bf4db22b25fb75a1fe11e88cc964188bce1 |     
   sparc     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/c557c5b30b4a56e5ec321f22f831f8e027993eae |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                 host-gdb-15.2 | 1 
              libselinux-3.8.1 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/d114f984448779fa7c762e8f2523c79848495165 | ORPH
   mips64    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a7a108d15631e8895028d883b3eedacdcedd4bed |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                netdata-1.37.1 | 2 
                  ffmpeg-6.1.3 | 1 
  gobject-introspection-1.82.0 | 1 
              host-rust-1.82.0 | 1 
                  libbpf-1.5.0 | 1 
                 logsurfer-1.8 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/4aaa7a6a865584ae2cdda52d37717222af948302 |     
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/214941e40f4bc3c682b3468e4c699bce86d0e672 | ORPH
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/8b04dda070e71accfdb4e6ff8f6d5fe4e59c3de7 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/93c13f221202d432ed57a787d2fe50f8da43d93b |     
  aarch64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/50e298a8e01388ded01368a1b25877835b90112e |     
    arm      |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/ecb7548df1062174440e18de56bfc806d7af0067 |     
   armeb     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/3e5f41e9aa4ed432d33950d1810582d9bdc33b09 |     
 microblaze  |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/7a08a1c0c9ff4049df8fa5bd54007898329100c6 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               bctoolbox-4.4.8 | 2 
                   linux-tools | 2 
                    gcr-3.40.0 | 1 
          sane-airscan-0.99.33 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/eb1efddd199dde54cd9cf3dd1b44e0a4ecfb7265 |     
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/d3856571b0630caab38d6d3000ff4e2a6f38dee5 |     
   x86_64    |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/276e53a648ed7f2b8bfb21f64cd608488e423eef | ORPH
    mips     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/05761c988dca27f0e18f7503fb4527ccf13aebc2 | ORPH
 microblaze  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/e31c129b50eebd99aca36ec3cf378ec37886f49d | ORPH
 microblaze  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/88470c27ba8502a038c72e7a395eba2b9f61c98b |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
