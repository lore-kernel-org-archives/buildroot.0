Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D003C021B2
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 04:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B814608CD;
	Tue, 25 Feb 2025 04:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvhQyWhsp4Fq; Tue, 25 Feb 2025 04:15:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 237C96087A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 237C96087A;
	Tue, 25 Feb 2025 04:15:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 419AF2292
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 04:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EE2A40821
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 04:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5w0XB0xF0qq for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 04:15:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D1FA24077C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1FA24077C
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1FA24077C
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 04:15:20 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5dee1626093so11113343a12.1
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 20:15:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740456919; x=1741061719;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FN5R5iUXXDhLa+Ru3/HjKZfIxvd8dgY3ap+Yf65dWBE=;
 b=Iw9gb60x7kWZjsfGGahg8kLuZJzZBvuAUXz6jZh5VhHWHZ4cVEJcFr8iWWGYW/3xx1
 Ycnqe5MRgQpvoxle21vEO+rJGvaFIf1xCD5c+uNqNXsyTmki9aBpBKUjZ1YM36ofrU9H
 WXoUBNXt/gqv7A5r1o/dGmixpiaQz6OOj3XNKnTfO6I/Uq1WoJRJ/szdnCcioNqlFk74
 /yeC79JGXqiFYCC7FC1FycJISK2ZCxttbW0jCGQrJCebF42OsrTO62yDTWCXnQwvKxU8
 rVyo5tFKGXGQw+El5cJSdTaLp3ZIh8V9FMZuU6qW8Mk1cXTtE5Dh4FTSuHcsrES+JC9L
 iLpA==
X-Gm-Message-State: AOJu0YxWc0jDIg3kYrSKQfIc9sZOlhqDirCYqvHh6eXWhC77zJiWiLv0
 lZTDzS5THDNLeCfg2wNa3FelWHr9C/ND5FrV9Qn2l9Gfnextx0wLjBE88A==
X-Gm-Gg: ASbGncuZGo5J2GTUyUViUjeqEVipJY44pibjO7JWZS5uj76xSDFkiVnoJK7IHnoJ/ec
 O+JrlKT58KHx4R3YN1JDYYabLt2tjEuwwZG0aYcuioLkw9CCcvHeriTOnzc5SXpQ72N8wkF3jEl
 D4FDjKZGPjSh/UUenHDUD9VA/mcraaW/TdNFji8eqfa45MssWfxlC7meK950H3A9Eg2Ff2kG4Ot
 WcuLoB5uwka5OElF1PGTQHtdd8enNEA73YKLyYqfHuKgpBRjS2Yu4eFTzgAvfLMrsOU+JBQnLp1
 eia91feWKiLEn77u7m7x7EC0fRPWCw==
X-Google-Smtp-Source: AGHT+IE0BnEFU5hlVIR4YbvgmzfC7EZORHaRss2UVJMNEeFVU6Dd6mxH8o3/L4xfLBwPBK/QDzbDaA==
X-Received: by 2002:a17:907:8e91:b0:abe:d2f6:5a06 with SMTP id
 a640c23a62f3a-abed2f65ba9mr105728666b.27.1740456918364; 
 Mon, 24 Feb 2025 20:15:18 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed1d537c3sm70631066b.38.2025.02.24.20.15.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 20:15:18 -0800 (PST)
Message-ID: <67bd43d6.170a0220.105af.2bab@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 25 Feb 2025 04:15:17 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740456919; x=1741061719; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FN5R5iUXXDhLa+Ru3/HjKZfIxvd8dgY3ap+Yf65dWBE=;
 b=RcrNXYH001p4GfhdMxkPf6uBNNe3kWax3SaIblFob/VZy/pQHMDZKO3W4go+rqee3m
 uXOH8AJaEBhsswsL2FLfIXYj38df3h48IuR0RPTFAuDyb6HZPndoPg+P7H1XywavxhXO
 bkTPLSdA0ApH/mggOBOiMecTlsbSYLQHnh1gjoVfo6bOrRBP4mPGEh42FDHxybkEIYv6
 l0ACAbUjWQHBgQ0LZfEDzxT1BLv5kKkE6ycHs5h38jAsSXDN6o4DRmvhAlq6+5iE6h4E
 NSsLual+9x7wpb//peVhGH/Iu3Bq2sMznaguTMfvTro3mAecjTGcsOrnyFPOOEzKhzzs
 47rA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RcrNXYH0
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-24
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

Autobuild statistics for 2025-02-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  5  |  0  |  9  |
  2024.11.x  |  4  |  2  |  0  |  6  |
    master   | 16  | 56  |  0  | 72  |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.192 | 3 
  gobject-introspection-1.82.0 | 2 
                 hddtemp-0.4.3 | 2 
host-heimdal-f4faaeaba371ff... | 2 
           janus-gateway-1.1.2 | 2 
                 libcdio-2.2.0 | 2 
              libopenssl-3.4.1 | 2 
                memtest86-7.20 | 2 
                    mpir-3.0.0 | 2 
                  rt-tests-2.8 | 2 
           at-spi2-core-2.50.0 | 1 
                    azmq-1.0.3 | 1 
                  bcusdk-0.0.5 | 1 
                  cairo-1.18.2 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
fs/erofs/erofs.mk:69: /home... | 1 
fs/erofs/erofs.mk:69: /home... | 1 
                   fwupd-2.0.4 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
       host-gcc-initial-14.2.0 | 1 
                 host-gdb-16.1 | 1 
                   host-go-src | 1 
    host-mender-artifact-4.0.0 | 1 
              host-rust-1.82.0 | 1 
              libcamera-v0.4.0 | 1 
                libdrm-2.4.124 | 1 
                  liburing-2.6 | 1 
                 libv4l-1.28.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                lmbench-3.0-a9 | 1 
        ltp-testsuite-20250130 | 1 
           oath-toolkit-2.6.12 | 1 
               openblas-0.3.29 | 1 
               owl-linux-1.0.7 | 1 
                   perl-5.40.1 | 1 
               postgresql-17.3 | 1 
                 rtptools-1.22 | 1 
                   strace-6.13 | 1 
           uboot-tools-2021.07 | 1 
                       unknown | 1 
             util-linux-2.40.2 | 1 
        util-linux-libs-2.40.2 | 1 
           v4l2loopback-0.13.2 | 1 
               valgrind-3.24.0 | 1 
                 watchdog-5.16 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/b0079338623c8580e46df457ef0388e3ddf42607 |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/bcd53838b08aedd1fb124fbf3d0d4dc39226e35c |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/d71e7c07fd762f494fcd343e7b3892143ce0ecd4 |     
   armeb     |          cairo-1.18.2          | NOK | https://autobuild.buildroot.org/results/305c25679ef2c0479cd51b43e47d16a8d3f4e1b6 |     
powerpc64le  | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/9a25d02347a41a49631da4feec1ba8dad9666619 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f916d1285800516ec4e13951175142347d60f4bc | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/9b6362e7d47b6089416ecaf90cb25de3a8be648e | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/545d284121c4b6e92118764ebd9ee8d84a243400 | ORPH
  sparc64    | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/15d695ba0d254cbcdaabcde61d1fadba3bf7c470 |     
    arm      | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/005edcd9f903da9cf6646e2edca41b7b20c75516 |     
    i686     |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/4f1755b470672766978d2906152dfefc777b35e7 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/6e2abeafe8c603d817e0fcfcb8d1ee15150c496a |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/7949c4e5ef19164456fdf8c6d8ee2a54bda6c50d | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/603ed1bb74082ff889a61457b9a1dcc5d86b18bb | ORPH
  aarch64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/4d9413d983b451b4ad863d96a07bdaa7a5296076 |     
   x86_64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/1679f9620f2206904a59ca5533e579f53fb5934e |     
powerpc64le  |    host-gcc-initial-14.2.0     | NOK | https://autobuild.buildroot.org/results/a5cbb99f033e3db86e2be504bec7ba98ee57ac0e |     
  mips64el   |         host-gdb-16.1          | NOK | https://autobuild.buildroot.org/results/946e6de8a094ebdaf673b3a43f44d3615bf0a09b | ORPH
    i586     |          host-go-src           | NOK | https://autobuild.buildroot.org/results/96231edc2e1ca729ddcd5cdfe33d116f979204f4 |     
    arm      | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/9df5744829d91a3cdf10eb6c83c3f68037c2df3c | ORPH
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/4978c6a93a753cda615778f97517b6ff326d74bf | ORPH
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/a8a6b54004eefb7375214739d63712644c3f2be2 |     
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/4de1df45df0cc82d1464760ad938afd6f012fe2e |     
    mips     |      janus-gateway-1.1.2       | NOK | https://autobuild.buildroot.org/results/2c64f928128b09270eb39595a6023376e3d72cca |     
    mips     |      janus-gateway-1.1.2       | NOK | https://autobuild.buildroot.org/results/425c0ba95916d5c9696390cefa0507886a3d1300 |     
   s390x     |        libcamera-v0.4.0        | NOK | https://autobuild.buildroot.org/results/61e4bce00a2aff3f531de6c1896d4dc1f92ba5e3 |     
microblazeel |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/8d6fa016dbaf11164a7dd0ee54809770e5e74afe |     
   mips64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/af057b236386b7f4f7780afcdf903b971907832d |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/adfbd507127472ce93fc0fbb58de692871a5ac70 |     
    arc      |        libopenssl-3.4.1        | NOK | https://autobuild.buildroot.org/results/d38d1eb12afc5916016cd3a5f8c79ceffecc6ce4 | ORPH
    arc      |        libopenssl-3.4.1        | NOK | https://autobuild.buildroot.org/results/5a9abad39438387afeff55a6c2992f957f6d5ab9 | ORPH
   sparc     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/d946689277c2a8e41e2e0f523a19cfc95a7e4b47 |     
    mips     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/50978375ba185851dbae46297dbd3bdfe312432b |     
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0775a8928c84dc740c9c54a5d84d4796b72b831e | ORPH
   s390x     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/96ce4dcf15cb9416969e443c328a1fe23cbbeb3c | ORPH
  powerpc    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/6abeab53efd634bfa2660fa1861e3001184f9cf3 |     
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/2d20e04f1e59d09895f616c52368a68ea38f4490 |     
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/1610aa599e8853ce97e06a70e94f86c18862e18e |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ed6616c32881dbbcce140caac49bf989cb879ec8 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/3c01388a2fb8a98e51be4072b406102cbfc26467 |     
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/a50781306b64ec00a5747004de7d3959616e3239 |     
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/4b7a76c2d912c708d424ec84ae7c721f775a0ca6 |     
   armeb     |        owl-linux-1.0.7         | NOK | https://autobuild.buildroot.org/results/7e1c6d33fbd260f7573cccd81782db6cbdfc2527 |     
  powerpc    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/70106b69e7fe3fa119cbe3785eb195774ce90c18 |     
   mips64    |        postgresql-17.3         | NOK | https://autobuild.buildroot.org/results/60b040d5a3a4f1d35a7c4f0a58d0f34abc620c81 |     
 microblaze  |          rt-tests-2.8          | NOK | https://autobuild.buildroot.org/results/2330cd7a87d81b1e1dfe873dc8b72e6ad67b9429 |     
   mips64    |          rt-tests-2.8          | NOK | https://autobuild.buildroot.org/results/8aa47c7822b96645213dac5a4b41ef9811cf85b5 |     
  mips64el   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/a6d8291542eaa1f637210fd5a1b2fb4d6b26edcd | ORPH
    m68k     |          strace-6.13           | NOK | https://autobuild.buildroot.org/results/ec3de790a66373f270f731519e2ef51c293ba683 |     
microblazeel |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/49e1bec995fe6ce815ad02556c86e5080a220525 | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/462642022490cc6957e245c15295e46509e54be7 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/40828020d55defe3c8c6dfc555e6d6da4ec6cb35 | ORPH
   mips64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/b463dce10ca5d5f8a718b591e2330f0a24efb1bf | ORPH
 microblaze  |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/76ad23c7d1c09be57565730855c1286045887307 |     
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/d44e9c060324d434d1b7c30766e67c45be212b3c | ORPH
   s390x     |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/adeec20a21566cfd880470aa0ff93b9fe789e809 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    bsdiff-4.3 | 1 
       freeradius-server-3.2.3 | 1 
                   iperf3-3.18 | 1 
                 mdevd-0.1.6.0 | 1 
                 openssh-9.9p2 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/24bb6d01e97f6409236b4be65071c1d94b467ff9 |     
 microblaze  |    freeradius-server-3.2.3     | NOK | https://autobuild.buildroot.org/results/54db6fed89642228bfe60a3a4857e74e29d6aa75 |     
   xtensa    |          iperf3-3.18           | NOK | https://autobuild.buildroot.org/results/678b60e5ea0a8670300ad0c4604d915b589fd32f | ORPH
  aarch64    |         mdevd-0.1.6.0          | NOK | https://autobuild.buildroot.org/results/65e2f981b58b7ab50830b67a310e9a1571b0eb03 |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/6d04d81f73f3500d93091c8f3e5e77799379770e | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 1 
                lmbench-3.0-a9 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/ef8bb7a4316317727a424dab9bb1929fd26513fa | ORPH
    m68k     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/1a0aebb712d604782eb119a3624b4631eacb841f | ORPH


Gitlab CI results for 2025-02-24
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220348671  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220348668  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220348634  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220348562  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220348520  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220348414  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220348406  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220348311  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220348279  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220348248  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220348242  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220348218  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220348215  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220348197  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220348195  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220348055  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220347896  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220347872  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220347745  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220347468  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220347459  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220347307  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220347204  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220347176  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9220347161  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
