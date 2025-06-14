Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D128C71135
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 03:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D83960A8E;
	Sat, 14 Jun 2025 03:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xzC-PgPrZ-k; Sat, 14 Jun 2025 03:15:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32DAF60768
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32DAF60768;
	Sat, 14 Jun 2025 03:15:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB3E51A4
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 03:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9198940A37
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 03:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICixksmda9Ub for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 03:15:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF64740592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF64740592
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF64740592
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 03:15:27 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ade326e366dso483850066b.3
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 20:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749870926; x=1750475726;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ffJhpE2LFWpy1BO9BZinDYGgEojUikUSs9DBMn8iVdA=;
 b=pUNUf/NrFCKdnYAKG2IgK3AdofD/DteS79OdsRfubYfgdqjShfu02PbybM5lALshAG
 AV5iHPd6l2gna5JQBdPrlg91IUkBOS3jCc9IogxOAgPpC8EnpqZzYg33ZCiy4n34dMAX
 qs1iY5pmEfxUIX9lVRyVjGPN2kG4OfrK+1lfe4kfv+ohjeLTqJNZ1NQYn1WQQyShNyH2
 VxpS/83DNIGpmoMuCWeSwodB1AdzXRb93estdmq5hCMre5dPvGFAE1TS8NYS+IFOs/aq
 kWh+o7JnVq9atejnrNCG0lTRmEudPcddVY61KFCeyd8ylJGz4sY5IqLYYgA6o+bVR6Tt
 fCmg==
X-Gm-Message-State: AOJu0YyQjoEI3U3mfnc1jK1/496f0mCyRd2+evX92cBYwK2C6S0nLxwh
 btut0KVV2kvWEAnGJqwNI5uLii2g+4UQDVkvE0ijht4VpxFeg4VZeqmb2MwKJw==
X-Gm-Gg: ASbGncsmq9ZHu3ZaTUdhHlQ/NwfHde6Xq4h0GDBhzOYjrWGQfo8nvXJwl0sVbUgtY4P
 oe4BO5AOJIfeLs9WkjvIW6K1729UkWRpLxPIZD1C/zwAAyyAeRr2RGG4h5dYxmo1K2QaoIQlhtr
 TUzqy3aFEmTY9VJ9MWiJMg9w7ahF8U2YAvjUFEEtlavjJmEb6JUboJ1dd1BrdN1J53if9RFmr7J
 5PqubzJEpxPdsPLaTA/mmXn789EF1c4theXalPJ7o+SfdBa+wyQ6JLtjOMwcnJjSw4xVWkLPE7V
 MM2XyT701r5geTSI5SYG5NSnaYbXx+e59S3F92Kk6PpkcigGxAcG788IAy95UnvL5Q==
X-Google-Smtp-Source: AGHT+IGp/fuC/FID+pQcK6r6x95yWgM+7+HuFxzvBavxoPM8rWMfgyEudRdcGw7XuiL8oHK6uZUb0Q==
X-Received: by 2002:a17:906:f597:b0:ad1:e7f0:d8e5 with SMTP id
 a640c23a62f3a-adfad31a6b6mr137171466b.16.1749870925090; 
 Fri, 13 Jun 2025 20:15:25 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec88fe57dsm225595366b.73.2025.06.13.20.15.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 20:15:24 -0700 (PDT)
Message-ID: <684ce94c.170a0220.1b4601.565d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 14 Jun 2025 03:15:24 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749870926; x=1750475726; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ffJhpE2LFWpy1BO9BZinDYGgEojUikUSs9DBMn8iVdA=;
 b=J1E1Ge3NTWxMckgJPCg0R8TjfznwXI5+ybsj3R/AqqiX4KltTpKsFSrEBNxbZufFFt
 1IZiY7A4MfUf16Jt/A/MNQ0xY8qO5+ghlr/2j8Q0QoRSei9POwlUvk5EvrgpZQ2qvzGm
 z3oG5ejwNED9r5w6f/AYRh6m/mVIkEuUdvSjn5HLXi6i7SzwSGR1JOuZHOCUT8iv/R9U
 5ciNVnfIHmQARKlaVDFt7JdTmhO7WvJqaBBJQPY24upLYjv4qtZdDuadMD458PubQZOB
 gdg8uqBn+NsICIBuzV7ZelZVmS0Kj4c8s5ta9xagnkMO9T5DsGDDuu0YRYNgIVP4shcM
 zOeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J1E1Ge3N
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-13
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

Autobuild statistics for 2025-06-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  7  |  0  | 10  |
  2025.05.x  |  2  | 13  |  0  | 15  |
    master   |  4  | 491 |  0  | 495 |

Classification of failures by reason for master
-----------------------------------------------

          host-binutils-2.43.1 | 57
host-gobject-introspection-... | 56
                       unknown | 24
host-binutils-arc-2023.09-r... | 23
              libselinux-3.8.1 | 23
                  bcg729-1.1.1 | 21
                    bmx7-7.1.1 | 18
            host-binutils-2.42 | 16
   host-bootgen-xilinx_v2025.1 | 16
                   avrdude-8.0 | 15
                elfutils-0.192 | 14
         host-mariadb-10.11.11 | 14
             batman-adv-2024.4 | 11
                  cjson-1.7.18 | 11
               bctoolbox-4.4.8 | 9 
               host-vde2-2.3.3 | 8 
                    gpm-1.20.7 | 7 
                  linux-6.15.2 | 7 
                 apitrace-10.0 | 6 
                       cfm-0.3 | 5 
host-am335x-pru-package-5f3... | 5 
                 openal-1.22.0 | 5 
                   bash-5.2.37 | 4 
                   cvs-1.12.13 | 4 
                     daq-2.0.7 | 4 
                      dht-0.27 | 4 
  gobject-introspection-1.84.0 | 4 
          linux-5.10.162-cip24 | 4 
                    yajl-2.1.0 | 4 
               ebtables-2.0.11 | 3 
              host-rust-1.86.0 | 3 
                libsepol-3.8.1 | 3 
                   perl-5.40.2 | 3 
                python3-3.13.3 | 3 
amazon-ecr-credential-helpe... | 2 
               asterisk-22.3.0 | 2 
                   atop-2.11.0 | 2 
                    azmq-1.0.3 | 2 
                 coreutils-9.5 | 2 
                      gd-2.3.3 | 2 
            gettext-gnu-0.22.4 | 2 
        host-berkeleydb-5.3.28 | 2 
                 host-gdb-14.2 | 2 
            host-libp11-0.4.12 | 2 
libdbi-drivers-0bfae6c43134... | 2 
              libebur128-1.2.6 | 2 
                libesmtp-1.1.0 | 2 
                 libiconv-1.15 | 2 
                libkrb5-1.21.3 | 2 
              libopenssl-3.5.0 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  ntp-4.2.8p18 | 2 
               pulseaudio-17.0 | 2 
toolchain-external-bootlin-... | 2 
             util-linux-2.40.2 | 2 
                    bat-0.25.0 | 1 
                    brltty-6.6 | 1 
          cryptodev-linux-1.13 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                     dtach-0.9 | 1 
                   duma-2.5.21 | 1 
             fontconfig-2.16.0 | 1 
                     gdbm-1.24 | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
                 hddtemp-0.4.3 | 1 
           host-doxygen-1.8.18 | 1 
         host-gcc-final-13.4.0 | 1 
                   host-go-src | 1 
              host-json-c-0.18 | 1 
   host-python-glslang-11.13.0 | 1 
           host-squashfs-4.6.1 | 1 
             libargtable2-2.13 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
libmodplug-d1b97ed0020bc620... | 1 
                  libnl-3.11.0 | 1 
                 libsoxr-0.1.3 | 1 
               linux-pam-1.6.1 | 1 
              mariadb-10.11.11 | 1 
            netstat-nat-1.4.10 | 1 
               openblas-0.3.29 | 1 
                opencv3-3.4.19 | 1 
            python-tornado-6.5 | 1 
             python-webpy-0.62 | 1 
                  snappy-1.2.1 | 1 
    start-stop-daemon-1.20.7.1 | 1 
                 systemd-257.5 | 1 
toolchain-external-codesour... | 1 
          xlib_libXrandr-1.5.3 | 1 
               zxing-cpp-2.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/b208642e9d1c41fec4dd4fc25a6a8a6f91ddf2da | ORPH
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/9adaf821d0cc33b031b0bcc50196f4b7949b0d3d | ORPH
   s390x     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/31571625618edf8dbfbcaafa3c47a882872ac11e |     
 microblaze  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/f890ae61a291522891a35ffd2ccec9136e6e4956 |     
powerpc64le  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/21bd2af233cef7dcaa934a1bed609ffe1f0c5b89 |     
   s390x     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/83c1a7fa6cf37b14f1727592a81fc2176c638d30 |     
    sh4a     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/950e0086248a6323fee95d8de354fb16065aeabf |     
 aarch64_be  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/b4efe814ff679d1955df770f705b422e40ad32d1 |     
 microblaze  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/c68d1f60761719383fff6a85fc6f86ef41e4a7af |     
microblazeel |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/71ebcb4331b22ea0b1a8ec527fd03b9a962607fe |     
  aarch64    |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/295a581beb9e4e2548899231af9ad63641af903c |     
    sh4a     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/619abe2018e8b99830b7ed32eeee051377a03b95 |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/cf260f98fd82ccb79f65239511ac4e151c5a7333 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/c1f2746cd4db9e83f03b79ef629cdb3e0e91ebcc |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/426e1412bab872c07869d273421fb7d1f486d7c0 |     
   x86_64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/ab612630fa3e64e07f3caf1be383b85af917c8b7 |     
  sparc64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/6e8b6eb3a9847cea64617a517199cf6f90ba6dbb |     
    arc      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/595507f08624f5e26e7b60da11bcdf3b70f63a0f |     
    arc      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/60ebcfe95408bdc0fcff6046f483f8e2a60a6bb4 |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/e82b14fb18c0ae9380f216e8fe25577331142661 |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/f76729ea1ccfad0101ae05a84c6d248f526f242d |     
 powerpc64   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/63d5fbe1cb5ee235a636d876efc202e765800ff0 |     
   armeb     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/7196912d9c08d546a8ac7c30b24081f073525ddc |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/c3ce5dcb000ce03562fc10d9799017c085f79bd0 |     
    i586     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/8b3a8f82029ba43475b29cc8947f69770a81c8ef |     
   armeb     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/e675b4b5bcf89fa914dd4c0f9160ff979dc11f17 |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/0cc96fde5625c4b93562fa236dabd0a49b503955 |     
    i686     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/96692b6830d99cc561eb428b79a0e6195fe256fd |     
  sparc64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/3c631f38294b73c52346075e565885f9f13c7629 |     
   x86_64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/b0d902d531499a4b4991b6463ae17eda4a3bff7a | ORPH
  powerpc    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/9babf55074c6bb3edfe6009b1ae162f776104cf0 | ORPH
   armeb     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/9be5ad39f3854407697ccf3ad4f4bb8e32e3bcdf | ORPH
 aarch64_be  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/e583b3e0ea8817e5b6c8bcf8b823dc870404c401 | ORPH
powerpc64le  |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/226f2cde4508a9d474cc11a61bb377d704a05015 |     
   armeb     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/106929ec0a3249fd685b49becbb28055b24438a1 |     
 microblaze  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/ec2891ac8009cbccfc88e1305a9d211fc454e19e |     
    or1k     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/747b0ea9ad0d841f5ca96cb5c1adc33e352ef56b |     
   x86_64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/de46245d839a92719b3bae804b837d6e38c14a99 |     
 aarch64_be  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/1bd19ed94c11fae33a0a5a33af84b1aa0c867df3 |     
   xtensa    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/7c10bd22d913a3c84f9af5015436c876c47dcf4d |     
    or1k     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/6e36dddbe0609d50e5c2173be7efbebe41590b97 |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/066b95302c5b8a5f6c0e110b51e3675cf602b538 |     
   sparc     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/d13211bc9453231c226982680362ff39ad932c4b |     
  sparc64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/54263421cdf5571a6de4cf881763972b2d21f5e4 |     
 powerpc64   |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/0528f96baef7cfe167d571195bff5a43cc7c9b0b |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/d45d8cab38969805c7a951d064e3dc0cf932d1f4 |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/b534095c15268959aa65053a8987eda3c7af954c |     
    sh4a     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/11484200ea3606c272f56497ed039b90991e4b98 |     
    or1k     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/fcb6d64a76550cfc16fbdf6128ca5427d7a0af79 |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/f99df080aba3eb4acf39691b830e46a92eedb95b |     
  powerpc    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/2933bc7bdfbfe7a573f2fb555ed051aca4040875 |     
powerpc64le  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/ba94c8828fe6ea263b69fa1eb47c988c278ed16a |     
    m68k     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/28e65a3071943bfd2d2e309cc2787d1c38e1b0c0 |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/02dfde7f570cb4fcf1323b7f5cde324ecbfc86ef |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/b7c61eb1621697905761f08d5bb245dae164e5b7 |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/0ba70e59cdd366bbbb83ed21823787cbdab95691 |     
 aarch64_be  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/ffae12bc0d5d00104e34c859aaa7c7fb6436f576 |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/68e141772015eedac6d4d6ee8eb0f7a032393499 |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/59b8196362b60b60f4ef8dcc56e4b9620d43c556 |     
   sh4eb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/588a64ff1318f6f1b5349275eed1a92ca79103fe |     
 aarch64_be  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/d04c813211ad1556308f17e77012a194fee96337 |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/bfa8ce11e4b0506fe66fa32ae621724c3d77adb8 |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/672238e1719d180b5c168725b1763862c85ac230 |     
microblazeel |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/90a11506f2d23cd95cf0ea2cf775f33efea460db |     
   x86_64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/f3f5dbee07fa3191b09de1a241761630d0999312 |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/8cb5b8e2e50e12d71cf5a73023b4b2ee482a9218 |     
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/73b2254b4f2314c162702ddc123d0e9f6200decd | ORPH
 powerpc64   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0a38fd77974426ec8a2b95af34a3419adb0eaac2 | ORPH
  powerpc    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/dde715f519ce66f5a84cc926e5ec966aa6c00355 | ORPH
   sh4eb     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f0624967f073ebc69796dabb46020e6fb2395dfe | ORPH
    arc      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/1a5c190eaf129ba48351f6e1130bd70d489c8aa1 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/99f152cde1581a0db733657259e24afa47a7364c | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b4374f5838f4559226c9b6ca40babb9012fd8e08 | ORPH
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/26348c799c5e448d73696f4ca5b3aa17f9b680e0 | ORPH
   armeb     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/358f20b360ae9010c94b0991271c249bda1994d8 | ORPH
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e231073431e4e7222921f7cd77915cf3f7c73182 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/1b50d51fd54b6388e76066c15758278033a04758 | ORPH
  sparc64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/a3081ae41b1ec0a654f6836c5ea169c8ed6d36ca | ORPH
   sparc     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/a6f22736cbca1d2029ad43f04b259b282fc09d03 | ORPH
  sparc64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b83ed5d1acfc59bdc542e422cee24b541ab66551 | ORPH
    i686     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7f53f168d29cf4cb44973776561d22ee7ba75641 | ORPH
    i586     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e4c229a7670052e5cd98d39785f82ca795dd9d60 | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/fb3691cbca57224468f4087ee4a7f3bb4157aa36 | ORPH
   arceb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b6e2cb9311c3337285f062457f90406ee91731c2 | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/cabde857025fa94b0acfc8d45d462db698606acc | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/77f188eabb6bad75cef185e54db3addf344dc156 | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/5c08bdb1de920d70fa0578d9df6b92f96a363f16 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/ee86eace81deec394c7ea675ffb7c3d6808692bc | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/a18d16e934aa1585f6e3e9581b0e85846172cebd | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/fd5c9db844e826d80c4fa56506a7339ed0d7cb4a | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/29bfeb59f47f44802ccb3e527072ee7fcdcc7a3d | ORPH
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/54eed43b757af1206662abffb6d8a80173d45160 | ORPH
   mips64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2dfb5f6b677054a8da3375a1790d59c53d034953 | ORPH
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/298fa168ab8eaa23f7145a53f05f113857e10d4e |     
microblazeel |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/3dbe695bc1b5463f4006bd5af5efd5cf0cafb5d6 |     
   sh4aeb    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/ecbfaea5a652f6f956d35818ef7eaa475045ffae |     
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/ee94fc0c765503adbbb78c0fe426b081ae866cb0 |     
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/810cc9658012529bffc28f7ea28e7d76aac1c8b1 |     
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/b82f4b2932684324a040ca5551f0aec8b6b10b9f |     
microblazeel |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/d14af233c41c51fcc2c898f8ef297c7024bcf190 |     
 microblaze  |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/05fd3629060c3cd1562edc5efdb146c6c9300195 |     
 powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/30dda46fc6f338361ec6fd555adc786273b7e5d1 |     
 powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/a2ac1d282b201a4ed011153ffe46833d197ac0b9 |     
 powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/7b7774f0df5f86da486a056cf66466bbaf9432ed |     
   armeb     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/a026c5a77cecc07794d118b149411c4f6027f228 |     
 powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/2b7efc159b14d64d952c896954d83ac52379b664 |     
 aarch64_be  |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/f034a504907173ccc83b74f994e054eb4d71d5a3 |     
microblazeel |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/488f532aa72794f52a734464efa48746ffc336a8 |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/d110da6e4bf076063fad035b934fd7e6d279d183 |     
    sh4a     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/35331d8a7b214db7f3168b96bdaf5f2f47dc67a2 |     
 aarch64_be  |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/db5c79039e791023fbfd99a1dcce0b477ed76bca | ORPH
    or1k     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/f00328242567dafa14173da1157482225ced3853 | ORPH
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/872410b8497b0e7fba9a190e5933018f821a772c | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1a3df751971211ef4846ee33786ebfbfe4249604 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/97463bc0b17001150c9ae05f21cc4327672a889b | ORPH
    i586     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/392b218cd8611b50a376a9f1fc80aaafddb0bdae | ORPH
  powerpc    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d8a10fe1931ff3a031c1ffdae7668547ecd688bf | ORPH
   armeb     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/acac635fe438f4ca9061c14f8fa58c6b3ac60b03 |     
   mips64    |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/2818e007177df9a3f0f905f9db5b18a81e8ae8ac |     
    sh4a     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/baadea4813b9c053f7e67eaed51e14f2feaf3d51 |     
   sparc     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/75875dafff93701b7b93b935950a5b8cc451b7dc |     
   armeb     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/49aa2c137dd00bed99ecba388e68fa4b5a16fa6b | ORPH
   sparc     |            dht-0.27            | NOK | https://autobuild.buildroot.org/results/30339a4fdb9c0b608ca3c5ae0692596b21b2fc3f |     
   sparc     |            dht-0.27            | NOK | https://autobuild.buildroot.org/results/f414f21fc41d0219fcb8f10432d3a0385554c578 |     
 powerpc64   |            dht-0.27            | NOK | https://autobuild.buildroot.org/results/6fa8543e3fdd5383356e5ca43f957d2e028f2329 |     
 aarch64_be  |            dht-0.27            | NOK | https://autobuild.buildroot.org/results/8241adf8296ab148885dad23b388ea045554366a |     
   mips64    |           dtach-0.9            | NOK | https://autobuild.buildroot.org/results/ea90810d09fd446ab7846074796ebf179cc3c082 |     
  sparc64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/9a8f551af83c6065646bbf21da600058e487ff52 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/296c692323bae696c42cda71b742f020230c26af |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/702f7421c8a90ac4223bac459e02ef2bc32f5589 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/68315238c5e26feff52400007a1ac1db7d81e89a |     
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/09caeed55ad2031ef0b3e784e481de637555b6c5 | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/cabd9b64419237a6412126b4b9d51bd753f4030c | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7745d6e1304447cbcd7ca6149c18dc9ade594a71 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/cd18926ee7cf6db5adae55129534ee62be6f8e52 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0325943d72016f45c2376ffa255d4eab76d0e1cc | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/66477fac549e1e3401a1b2ac3523256bb3942323 | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/508426affcbca00f7b6c7f6487527f7055e8fb22 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/de54c288f05f977a56e90561bfdf097454a5e427 | ORPH
   sh4aeb    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/bb3d0855b04916eae6e69886efde1f857565bb35 | ORPH
    sh4      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ca36845d72f7afeae39909c7569588ceaf948b83 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7d202de5c4e77119079279006a20ea62d30c8937 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/6fd52bc9e465ecd4f2b48b56d804845e3a6b52f2 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/375ea17652a9e139dc94f7c4c0c1e4cdb8b953dd | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/6214a33875b52251bbc4a8a69bc978347be2aca2 | ORPH
  powerpc    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/c0a1d8762c076353af1d2f73b82d51c07bc2c212 | ORPH
   xtensa    |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/c902d50dd844e36cf10f891962dcf8a230699a78 | ORPH
   xtensa    |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/0f3ff435714cc147415841ef2ccc8cb889fbb5dc | ORPH
   sparc     |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/affd51ab41c382298d4ef391c0813d43cff47aa3 | ORPH
 aarch64_be  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/bcec903c6b0d4540de438eab53553f8a308c8f79 | ORPH
    or1k     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/e73b6606d14dd78ad97b3fd2548e966c31c4112e | ORPH
    arm      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/d603217b7367f115c68c972da4932c0fd32056c4 | ORPH
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/e27196d25ce2ba73aeb5c9972359e179b8e398c4 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/70fbfc18d0b5c5231f2ecce6ed890a7c6d315e24 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/60ad418af43f75c5da81eede91aa5b57bf7406d5 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c1eb2835eb7091d702cbe61e4870b9655150f603 | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e6d4271df56bbd7254644afa837375a581ac47dd | ORPH
   s390x     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/42c99f2fea6c10b084de53d3dff3960e2424a1d6 |     
   sparc     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/f4579f7d26f8cbe509ad597b3b9a1c7c00dbdb51 |     
    sh4a     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/29758818f39989f0e467c6279da5f85cc1af352f |     
   s390x     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/f94308fd64e76221e16412f47e4853816b602d75 |     
   sparc     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/33a83a375e6802843d9ebb074c2d3a0fd6950604 |     
    arc      |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/0bfe92f008dfbc70463d9fe4d3fba857f77aa72a |     
  powerpc    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/8735629b3f8fddcd1131a1cd05a7c54c5564b875 |     
   armeb     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/a2cff630ed0bd2119e5787086d6a1cd1d7bb88a2 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/f7ac6f115931d90c0a3eeea4cb1d34bb1e11b68b |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/99b10ba3c857c4c6d7ce5696e3e731031971f9c7 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/32bf3d16f74afae3cdbdc393fc7648a5f9aabd3c |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/c299d96c40f9f9ae7207aa041f3b578b0715ce8a |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/f69dad99915835931cc613d37dee8d70178ce1c3 |     
    arc      |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/01efb386a2590166c3383663ecaf23adff1c6349 | ORPH
microblazeel |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/4e182d4ce2ad685c9b080b9ada2ea173cfec8886 | ORPH
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c9e680bb5ea1e77974e94b6ce0b22cafd5cc33c6 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6421c32bfcfc6e57e8bec8a71f781d6a669f2f57 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/be500568c68e48256465c9f7ab2da1cf32183d69 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/bf1f5f6cb5a6048eb8c5fd8a7678b0a0d894d0f0 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/26875ffd842408608ae98b026ecea3082df2d1d8 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/215b0d582dd5f40e11e4d613fd73f21c0f595187 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/bfe3f4238c6d8a27962df46b3a828a5214b84be3 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a095483a56e2c289f90c8c295a42f433ca293700 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/0798c4d6d7f7b148791d2683157220d26b890ad4 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/591a722fe5343522ce67f7738931e0f607440e32 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/e19bcd3df065c087797189195c5d198de9d4661d |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5419ace25b37da80f4de3ec63021d6d7acc31738 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/44f27df16a4cc1d251d60641c46742b20c73ce6a |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/56bd22a4683fdd68dfc81dd8eb9a6baef07fb16f |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/57b6b94d6b9a52d75baca51957c81c96afe4dea2 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/82995c7453b4de5e361fd5e393fa030a037f0bc7 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1d855d9c41c949307d90627d36a2457b6e335986 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/57a0331d2c58d6b202d1cc140afbdcc5c2bfd55b |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a334c17d637fec885de09f4f7b15520d1eccf7d8 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8cfa475f39fe4a378a227ddf7285b427757fccb3 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/98eeda2be9b3ebff11a8f563b8a0cc91fedb7140 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6baef694b1f5020bfe7ed140021978e672631a2d |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c6be6afb0780ba7d11708e60d05e86d225016855 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1afdeef7fd89a0511932ac4d2a35088230930526 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e4b084ea7430da90038ebe8a932baad9f5d454f0 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/09669f3648092fb2a52cb9b73039925486752230 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/881be08032de25cf86543b1e55fd717f8f430e70 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/61726fe3010b4b3b7fc2e17c491b26f6894c518e |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d7025e0be36047750d70571280db42e309b9d371 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e9a28bb32ca4ac56437db39a785e488f43d2a5ae |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f1a02b72796e1188a903508f28553181f29494e9 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1af0cbc308ce4cb51ea1e217ea90862b8508e195 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/22c92a52701b7105d98e5c06c89a20d37172a6bd |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/865b38e36eb1de9852d4cf98bc8171e0a05858b8 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3d3a4c63d2dfae5abee123e1e7bb4548fdbe68dd |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0e8f86e4625daf88e3171b2f50cea5b5915e8785 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e1953b1cea5e43b31b374adfe167e8a1544f38d1 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e37864bd9ae0ce57d2a9a99b64da96613a0c7d75 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/44af413ac58269995a88739365453fd1521a80f3 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/54bfb90b26bab5f8eb91f9389b7d909fd972ac96 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f4ae8f41b5cf0c352119cfc46c2b34c4a8e42dea |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9e6cce5e8331018705c696d310755318dc0cf4cd |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9b3d9154e701e09c8778ff0a58498800ee393bc5 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/21e953ec5ea2977af988464ae5b72a439af28142 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cb72ff22b5dd4458ff6254a8fb09bf19a681caed |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c219bbbcb401a5d361503b8e0b4138d1cc0561dc |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4a3391b8fbd1990b89f99e89342628c1619a6060 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/650d26d3a75d1da9d0cadf3743bedcdb2bc6cb12 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3e7b22527f7ccecde5eef887c93030a30d933429 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1a73b90f7ef5ec7b46b77d1397966b9c967fd998 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/627b9d2de6ac896164eaf466c752a7c16f47d37f |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a7cac0921324c520153aef1a28cd335bc2a4c2ff |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8aca946a3ae0fc7c4eb36a292b747beb1607755f |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3f21714a1711a455a83c195d20068dce8b20e3e9 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cb63b025aa90228fda0bfbe09c4c00874d526867 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9dd7bb7bdbc8315676a37e91e28a0d22d37bad25 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/493daaf655c4b80bb5b3b3c2e317cd8e8d8c7bfa |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c7b1819bf9d7b0754861e4b51211b5742d70ff04 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5109b5b13f3f2ff52b006bbab35fe50fa251b2dd |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d44ce096cdf1db536c37952585a95a76e81f1360 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3d75dfe82abd405b0310401aad38259ec31e9e25 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fb7802f4ec1bf5b54a94e9dce250ef69a5b3f481 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bd20a1e3543f55b26848ea17571d6467ad9c3be9 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c28f202cde0bd119b844953a1591f0bd66acc38f |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3f43b89951cf2638ca798b60288b458948d3403c |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a13dd8bd385377570162750f1e298d116e59d404 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/191c7b80295c219498c6b153d130000f054d8d0c |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ed05d4b52d3b2eb99efa1357126fab1a06c1284d |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5329a2724ec825ee0598f950c000924a8b25a1ed |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7e9f6ecbf0c0ba2210e47f53458051ae27756601 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/23f5949d4248352f3d43dc24ee69233c34e1d2d7 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/98b7316823bbfdb52f4b26879162369f5fe136cc |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/49343e5dd84d13bda5834eff8d0446a39a025d13 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c5f8bb8cc14129aff04f3602410085979942269b |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/928082bc8f0a61d9932ddaa15251e4bd01fd7ccc |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/0d4e598347ac9de9ad67b951f2d301f882cdf8ab |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/19443d6188fc00e22073f171ee13c088df02f06f |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/6959e67f67683626b59531c9db87abfdd39038dd |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/61b86b00e4fe43f8bd41c29783d15115742eda2c |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b8c7e4491db911808f2f6c038e99fbdb6e5ca99b |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/48a000b91aff91f7d168c8043f4c315442392bf4 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d06bb782597d63b4089a9953b2496e5b04eed977 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/9d9c3d3f87eaf4331189a870aeb16f6d9962e404 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/739df2a42ac54ab7f16d2f9b65f5d5c40d03de6d |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/894ad5ec52ef4cb56280e70c8114aea1241ce2bd |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/784d7fc75b1e43d1190101082f6c32c5c34f5eac |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d70612ac8646af12d807b69a821daec8016926d7 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c820f98e634e71c2f1c48c1c4628256a783dbc4a |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/492c5aabcbf72b9c21e91004ea547791acb88581 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/89be204fe7d23e53acc3a3dca01ec16fcfd29d24 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/617e3d3a7129cae067d00c87f62c51f216ef710e |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/2fadb6adfc42cdc540cb17ad9457d956df893767 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/3a1a46e7b30bced2a4618a45375bc0bf84ba46df |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/0f8b7e70be0255af1185cedce045f35d09d4c453 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/e3f652234d2e37e401d0a8a42882827114f5f5f3 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/df582d60a7727df6bc5f2d22771c8c9af7997ddb |     
 microblaze  |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/55eb8e047ff71de058b7ffce080cd0c144e0885e |     
   armeb     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/7ec2453516e6af98ed164b2f09a61deb52896872 |     
 powerpc64   |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/e6a41a8efd517c75d915bd3a50f70c5f840d61c3 |     
    arm      |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/17019a4715891f42c63e4b4688a0ffa086160675 |     
   arceb     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/6485e205e9b1ea88bf45b42d8b5735081ec4f290 |     
  riscv64    |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/a029bac5e75c92f6d7b09d05155cb4bcb43b6a98 |     
  riscv64    |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/c2acd8e0ea0c9a557194c5ec6ef080a240b8e26f |     
    arm      |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/60eece08cb3331c64e61cf099ae8818c8df88522 |     
   sparc     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/b072086dde28aac62575adbca655a1a09529e2bd |     
  powerpc    |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/d17912633a32d473b3343471f94b9cfbecfc2611 |     
microblazeel |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/40f29e4b50b2961b1c4fb04fd2a747fad50024bd |     
    or1k     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/db8b4e7dc7531643abe8fb825a1f40283d12b558 |     
   s390x     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/2907daa69a73cedf7796504155c23aeba8ddd286 |     
  powerpc    |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/9019b3a4a34d05d6e7f9731fddaa03f622c7437c |     
    arm      |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/0c4129def0cf4806969d058bfe3e4fd45075f89a |     
  aarch64    |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/876a2bdf56552e853f642fac4de1d66afb6631f0 |     
powerpc64le  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/6d562604e9ecae2884e8a4b7377289b2a72fcb00 | ORPH
  powerpc    |     host-gcc-final-13.4.0      | NOK | https://autobuild.buildroot.org/results/5dc7b05303c167307125023b67bfd672d62a342d |     
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/baab2654566e64651c74d8f098e9ddb0a9d595d9 | ORPH
  riscv64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/f8c1c9f5c0108749f54fdc22f3f19bb9b3340f5a | ORPH
    i686     |          host-go-src           | NOK | https://autobuild.buildroot.org/results/08763f05dce400f91d51abad7598fcda55594ebe |     
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b9904209e13c1e4ce496aaff2f194064d2a6c691 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/829140f0197395bc8dafff0b606e4bb2af70420b | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4d578235773827e30373e51407846980766a6bb6 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3e4a84498fc19eb3145aac7581ac58c5154eef04 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7320de61115fc1b13a2bfcfd89d0b49eb22d9362 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/420e6363fa3513a42bb4166457155e60cb94cd38 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6598b856defc66519d4880e7f1fc3f91f5baf37a | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/92ed1f983e2b0b0a3951d85ffe182a19f6f93560 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/72510d8120cf08d0b1a98066156b72ebc91f82b9 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/33f63dde41620fb816ec8f7af6b7e02f17c6bc0f | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a1e5e81cd063aaa8aee6c8c179335a406afa3975 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/610fa8256397d49c2242fd444c9b7a9d856ecf5b | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/de941194c753cdeb30badeb037698679acb075cb | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/808ca4e3c3e9a8a876dacb4c47dc7fb34144c114 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b1be0caa329f59707b92c42611f07a5b5c444620 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/287333389abcbab22bbce59d6e1a517591510f69 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e389ba511053d54e10eb430e7987154847ee9c43 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c4616af74de5e49745a391163ecd173394091307 | ORPH
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a75c4789ae9843a8c83a77c992315d614c951c62 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/86aa1de1277fb93267fa286a262a9878e5e327b3 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/112cb6fb6f09cf9012a73ff42691d75dbe1cb94c | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d344ffed83e9745d5386a5dba46ec6ed78edef1b | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fb262d6350b268f2f2c4471d8c521850f8fda256 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1af1dcf45bb6c5f11d50127994fe14825436374a | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fbae0731015bf70a5a666dac27ba01de22b7a5ac | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4461bc5027af2019b9396eb35f8d07863d67cccc | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/35ffb86e79e7086d6d644bfefc95f95a327e1e7c | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3456ac97f0e1265ce11db8232828c012ea376159 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2ac6bcad405958a1fc188b2536654b2afd138261 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/54d329c141fdb5835b3d1a7b983b7ecf3c4720ce | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6e8d04c95689b5619a2806222b585b6ad9035d36 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5b7d8e75924c2ad6bc312fc4543bce37b50f7a3d | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/be3292274a0f01670b3b9f497f41902c4db6e70d | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/aed0716b05882d85e44c897978257df340ba9a57 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d3bf3ecc6ace0a84fe35c52527a3082f465dc343 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b75ae06cbcecf3a146d021001ba2f2919951ccac | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c61f8843c0b17d7442abfa20ac890ff51185f9fd | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8d1c79c62f3224fd5caea91a09d60f0196885ad8 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/08e7cd879005328d27b9b2367481e4f875f8fe7d | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f5171d4d202924fa7a05a1f004e3a873b97890d6 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7d3b19a5607fc9a5db8929cac925c5e4ef5c84fb | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/792aa4b79cc11bcd0a98cc1e4aa497164d3583d5 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/db04e76270d0485846673b7187b2add63f60ee9d | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/63deb39e524213b4f8ad657896307bff3b56bb30 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c7b9e0117878eb447e870216486fbdb3a6c03f96 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a7cd6ccc3c86eda5192b01ffd262bda3cd5baced | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2759c60112b85fa1d0a3e4a36dca96ba6753e245 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/161b76450bbecf1798924952676acb040e0121dc | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ce76d3d753c1049cf06d87789c6a674e925b6495 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0caa0b8e82e7ebb0edb9f41dba74dd506e2764bf | ORPH
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/57d2e981f80b67fc93e5d6b060de5613309a22d8 | ORPH
   sh4eb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c4caf94596772ad5bc14392d6205f09aa043b9ca | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/724f7fefb024298d3d369f2827005b5fae7af1c3 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1259adff6714fb6e5d495c77bf024429b49f6c7d | ORPH
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f11b9cccd7d68735e1ed0bdc0f4db22fe7a7ece7 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/da0ccd8271303bc9d6519b4c50c06f4819010068 | ORPH
  powerpc    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/0a268a5f3db5df333fa27b788d14109f0c41f7a8 |     
microblazeel |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/b3779a27eee04ed289bd48b17ec02d3ce358eca6 | ORPH
 microblaze  |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/d839ee249d4f98f1c49b960305ee2ffff2ab0cd0 | ORPH
   sparc     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/2accfe664461e4a67ef0185cf9049412a10934be | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/359a9c98eda6d613302301a4e9ac3d53676c13e1 | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/5ede92a3c0530d5384b6b0015636a4ba273bb709 | ORPH
   sh4aeb    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/2b9aa7c039b6801cac490674eef39905efd5a42e | ORPH
 aarch64_be  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/dccaa433614ecafdcf035ddf4b6031b1ed3ba74b | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/7518ca31b0dad907e7c386ac176a98833014fa50 | ORPH
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/c54e02bd77a252579f390e4705b8c5355b39ea7b | ORPH
   mips64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/e1e08ca27fdf09f9ac9b62610c469dfc222c9402 | ORPH
   mipsel    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/7001902b11265e4c5adbd09445dc83260a703c83 | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/aa91bceb6548a0311f99f2f78f69e76e8c2bf488 | ORPH
   x86_64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/283d5c22920ed5799b088a06f872bc3695b41dd5 | ORPH
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/111ebe9f01a0ff3f1935baad839ea359bf84adcc | ORPH
 aarch64_be  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/eaa46f9442eea52dc0ad9e37809ffe31038a877a | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/1d894b99ba9b50889577b7ce09f3e525711909aa | ORPH
    i686     |  host-python-glslang-11.13.0   | NOK | https://autobuild.buildroot.org/results/50bcc06f3208590aa44afe766de6f4cf85784c0a |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/a0583c0892e2e22a73387bb5089f72486e5456da |     
    i686     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/c93ba5c937d97c646128292452ce84f4c3848a4c |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/6f27ab92a5027447c171c4a8b5cf77e2f1af406d |     
 microblaze  |      host-squashfs-4.6.1       | NOK | https://autobuild.buildroot.org/results/42d5919876ae034520b755b0b5be8d2a6cf30710 |     
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/5c5726f95bb8e588374311167d6ef43b572cae71 | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/82138abdac75e8b41bddaa89538b676237021e33 | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/87ab4e8534d48b31db39fb13b789d8b7ef4a8753 | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/db8335ce9decaed12fb6b1a69068c2815ce7583e | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/477c843917aa0781d29f15b374db3a690f963a2a | ORPH
    m68k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/a8d86458e249821f431bec7ef943b99df442b3a5 | ORPH
  aarch64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/bbd2e9a1b92b54a6485412ea958c2a9b3cd3f51f | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/147c847ff611bffbf7daf8c948d7332345dc6c2f | ORPH
   s390x     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/8fdee807ffa8ba0d6c9c6c97fa5ee3ad840f94b4 | ORPH
    i686     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/506627bf0a1b94073d2c3563ecf1be05c2bad1bc |     
    sh4      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/e1eee91dddd9113bef897def1343d6bfaa134620 |     
microblazeel |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/e629bd151cc539f01b909e44d07e17451a29ba27 |     
    i686     |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/3124bf8c393cff1d2178cd42c9085f32e088eee1 |     
 aarch64_be  |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/7c2aa959bf6a4adfbdc29f5bf9f53c168732c678 | ORPH
   s390x     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/1e1e57b9a12da5969770dd3f72978016bf939101 | ORPH
  mips64el   | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/e2ff31533927ff200ba945a12cfc6eee7bd54948 |     
 aarch64_be  |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/e863529c5c3b1a556003e3640a26059e50d0f06d | ORPH
   sparc     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/0e77b71ce1d1437bdb959edce2d092d744447e8a | ORPH
    or1k     |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/3dfc688cfc6cb33e015e1e87e4d3f76a05111c04 |     
 aarch64_be  |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/60d0bb23dc678969752894eda59fdb3cb76d1065 |     
   mipsel    | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/19051bb50f332731b17c9ef29c1189609d15915c | ORPH
powerpc64le  |          libnl-3.11.0          | NOK | https://autobuild.buildroot.org/results/3d3c8b0740d4a5c22fd65eb8bd7eb7251d18a819 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/3b0450717a8bd3ed044824da8fe0bc78260504b8 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/a254de38dc24aa76cb2b457ee6194561913c4944 | ORPH
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0fbb2ba985e8cd1b4494531a696f39620394396e |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d5799c5993a5c150cf13291acfde3915cf4bcb03 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a133aa56e163750e6a9488af13b81f623d970be4 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/20e9ae150c596476dd2c4efbcf2d3e9f68a7e1d0 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0a0b34a4d7b065e5c58f8551584db6ab138aadb3 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5395166ae92be56bb3d45580611f3752e1eaf994 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b2f0cc2a4be51e1014db5c403454f8687660eb8f |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c9718be33b223223461ed7f5cef13870a64d70ec |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/56a0dcf04ad3a7e5aee50229c3a02f5607b6ac67 |     
   sh4eb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/652db27740e8c8906aa4fb84f1e7e024ce8aec4f |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5cec526387388cba8642c62e432488a21449b877 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4445ffa0bc1ce9db7902ec22adc85d947769af82 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/075c1299205e4e6b304517d91e8b7ba461e1c73f |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/59d51ec0e46221fae6048ebcf4ff944c93f1753e |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/424c04dd5603912ef107569cb79018efb70fb5b1 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1f88c7401cd52d95db5af7ffb5c6f48162e04f6e |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/efcf04e8c9e314644b24c71dbb1640e259ce3726 |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/527264ebe3d8b15f6ef257cdd59a537254b8e4ca |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f6764c25733298ffdacbb69e0166eac695cf695c |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/31e9a46ccbe158957cc1bd48f8c515d15e7d6961 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e9b541a0a34daefd72f9743563f999fd47316ba8 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/63c768f246b2e853673235922d52f3acb4233299 |     
    i586     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/811a3dad079f8501403efa015962ad0ce79e6fd7 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/b3baa45508a926a06112f71000804915c72d5f99 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/21b2a328fb8705883f2f41ab58127d4523258813 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/ce07dfbcd9a93fd718b449b3771f62c51efb1511 |     
    m68k     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/ffc0eed0868b279a4bee917eef1a620a98bebabe |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/944bc617d1f4d1f344d6fa936ff6babc4ae3f059 | ORPH
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/df24ac1339072ac16dddcf0b936b97b6ff4a4aef | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/040b952a62d626e2de1d6815e6d49061d13c55ac | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/53b27c5cf08554152676512b2cd518478621c9ea | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5f74545299f8e82fa41c88575a93bf54e7b96ec6 | ORPH
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5722571210d78abbdc97a0ab152fe1a8ed4a4874 | ORPH
    sh4a     |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/5fb26166babd9a18f7a508714930e8c000a0b38d | ORPH
    m68k     |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/5767e55687719afc843c6fa008d706baf8c888f2 | ORPH
powerpc64le  |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/2e43e7917565f1e82f5257c2cc59073d67dcb3a2 | ORPH
  powerpc    |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/49cba35a088e59f7ae1bf6c11b942362e7b42077 | ORPH
 powerpc64   |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/17784fe470551e6610a9bbe6c07d74d89268095a | ORPH
  powerpc    |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/51fe91fe70619d0d9a4c48f2076ef078aa264943 | ORPH
   x86_64    |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/9d8afa5aa176e5399022d977d237989f3eb1b0db | ORPH
    i686     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/41d316c6ac02cb09fe436a9c6a063e3920a98369 | ORPH
   sparc     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/9e00876db394bdcc9ae9ac6366ae371796e587a6 | ORPH
   mips64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/18bc0f6307ccdd716ea902f340b4aad562515b1a | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/977892623e583df547a52306730bd4c73642156e |     
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f572a61c7a3c4c752eb5a60ea1eddf5b3f353f97 |     
  powerpc    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/5c2bc2af7be7c88ce9be1a0180891560f13ecfd7 | ORPH
    or1k     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/86952eab23fa8c278de2d87f3ff59eb6686a1031 | ORPH
powerpc64le  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/ed045d04f9017c3fdcf595f0b4bc04c025d0f8d6 | ORPH
powerpc64le  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/1c2246b5a9aeb6e8420d371841f5092eb4cfe0d9 | ORPH
  powerpc    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/ee1610f8610a6edd5e0ac70d32d55db86f777cf6 | ORPH
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/5b180fb55a4bed1719bf97d70c24d0692437b49a |     
   s390x     |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/39432e7746e6bc5224592a7d2f744ca992bd529a | ORPH
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f641021fe8c1ac95ebecfbf4633dc89b134f084b |     
    m68k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/ad1aceb2b285c1dbcd40989919d56beb2dc182e2 |     
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/0da6ff4c7b04a0cc7d0ef47d048bfa9785751a5d |     
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/36364511ee629f61acc0f86046c19c8746906787 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/12c2183a3a5e1707881a8b2e1105312c59a03954 | ORPH
   s390x     |       python-tornado-6.5       | NOK | https://autobuild.buildroot.org/results/9447dff29ae224c0df806a9d2d4906b88082d53b |     
microblazeel |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/99122496de4943e04547c497916a70c72e4e4b36 |     
    sh4a     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/1adee8108d2bd84a02352704c5954c8b273f3e92 |     
   sh4aeb    |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/1298cb9dc065f965bee8810d4c319a824639b7a8 |     
   sh4eb     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/a8ecf1de97a115a1ec2100ee634dfcf4d8938e15 |     
   sh4eb     |          snappy-1.2.1          | NOK | https://autobuild.buildroot.org/results/cbd9967f43082d8a00ffbd9c68255a6a3faf32e5 | ORPH
   s390x     |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/32f906559a2ebc22a257a1ebe03988438c87ed99 | ORPH
    i686     |         systemd-257.5          | NOK | https://autobuild.buildroot.org/results/20cb76a247ed3b73d6257c3601e181248dd5e5e7 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/43e9c21785c2e9bbc3354a2342b687616a49210d | ORPH
    arc      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/ccf75cc4bc19e55e20c0ce93a120afabbe4f230d | ORPH
    mips     | toolchain-external-codesour... | NOK | https://autobuild.buildroot.org/results/4e82ae459c61ee044f7c1610596d848388e0b310 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/c389f091429e4c5b8b5281180f3a1d99b5191171 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/30d4bec97ed02f7fd81aa158a9b89f7f410ef2c1 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/e73201a777b2ac79b57b36fb2293eb3e288254c5 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/de9684dfb6b682f0cf30125916484b88f08fe057 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0161b5af3b56f74324a6a4d50262870aa9dbd54e |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/7353877ac571b3b20936837b8a65e894e23577e4 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/aad2034b3c15611ffb8b70b7eaa7c712d6b25903 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/3f0b332f75fafbb93348e937817d11e25e2d756b |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/66a6806dcbdb9853c4c034d476790c7f2b239e7d |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/7665ee1e611f7810e2ec50c0f676f112071c9abe |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/fea4e44e2ba2072e2b532488b11f206e41b0e0b4 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6a4e138184fe7a2d97356973245c74310a434f3d |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/b07630fec8922c7a6e55187f7c315d94c43f3256 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c90da3147aecae96689c532560ec702bcb20320d |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/c3c1705919e2e6d2bf8db002224729a1aaf2ada0 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/026e03c47e699d4a93161b0db6a6b8a910e1c477 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/f9d8e85e90a63a51099089945108d8c7c69d3c48 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/30a0c63c41bcc78bd9b95c146db0bd3fe9ca0209 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/e6cb47d4a3903bf5e4a7bcd9f04d778b9f7df309 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/c7b6d8815ed289db26be973d9a33a459152ed77f |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/138df181969830159dc91b4ebe447ecb06d9500a |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/8dadf6bb03743cd63520fbe210689c5363f4c5de |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a564dd3aa366780184f681a7c66de15f4713c360 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/eff222cd359f6a62b3649fb46167217a250351e1 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8fac559cfb3aedeb763415a297c4c92dd3b92845 | ORPH
  aarch64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b8cfb559a66af94fd238703f9bf11bc6be0806a2 | ORPH
  mips64el   |      xlib_libXrandr-1.5.3      | NOK | https://autobuild.buildroot.org/results/f1e36c097cdcdf61f2ee9a281df639942745ead7 | ORPH
   xtensa    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/d7fa8ee022e3c6c219850a98c9814cfd8052bffe | ORPH
  powerpc    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/3b9af4f6e14e21a5192c482801e3d45afc0ee721 | ORPH
   armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/97cb0e7a8fe76ac794153e631d923e423e01f105 | ORPH
 powerpc64   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/c103094c9ecd134f3bf822f8dbd5c4cf608e3b4e | ORPH
 microblaze  |        zxing-cpp-2.3.0         | NOK | https://autobuild.buildroot.org/results/8b470e63230548a6003210aef0c17e984edd7834 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  boinc-7.20.2 | 1 
          host-binutils-2.43.1 | 1 
          host-oniguruma-6.9.9 | 1 
              host-rust-1.82.0 | 1 
                s6-dns-2.3.7.2 | 1 
              tinyssh-20240101 | 1 
                   trinity-1.9 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/7f5bd7647a34ac8099194bf7c1fae9a7b9991f1e |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f7510245273ba333b012e77a28f4b5ccbebd4f83 |     
   s390x     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/e4be8944b9a3608c1e8cae5019ab50e9abc3d83d |     
    arm      |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/a94097d1f23e8b7599b4ce65d1656e22db694c64 |     
   armeb     |         s6-dns-2.3.7.2         | NOK | https://autobuild.buildroot.org/results/755d34a771f96e6060fbc0d9f108aaa636b4243f |     
    mips     |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/f33b0963a9a56d1da0ecb3fa9bfbad2cc0892627 |     
    i686     |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/9e2aa06a7e5acf2990773ee10798878b814943a0 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                    bmx7-7.1.1 | 3 
libftdi1-v1.5-48-g22b4667a8... | 2 
amazon-ecr-credential-helpe... | 1 
                   avrdude-8.0 | 1 
               bctoolbox-4.4.8 | 1 
             dahdi-linux-3.3.0 | 1 
 docker-credential-gcr-v2.1.26 | 1 
     libphidget-2.1.9.20190409 | 1 
                   perl-5.40.2 | 1 
          sane-airscan-0.99.33 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/bd3f3eedd14fd9968626573fed3a50348a0c3088 | ORPH
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/db8e05d59ce2b8403a2d910ae54d0e4ed2af57b3 |     
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a93c405549454e3eef5e67d66318e2ef4608be97 | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/67bed0badf6bfbfb3ea58596c705a5be5b615969 | ORPH
    m68k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/bad1797ac03b6a003beeb3e2073d7f26e03db3a0 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/1a20eb7b06b6cc03025665eed2ff6dd856cfa1bd | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/aab306b4f5767801ae5af9ff774b256372ff5966 | ORPH
    arm      | docker-credential-gcr-v2.1.26  | NOK | https://autobuild.buildroot.org/results/1edeef0d231a1a5a2a4a939d7e0a3ce13b6dca35 | ORPH
    arc      | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/2e879160c0736c696c7dab9235a3c920b444329d |     
microblazeel | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/dd06541c0b140c0fe822a23c6a155d1b879b5ccd |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/32f9818a57538e1abf89f76348781f4505dea9e7 |     
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/dc7ba6370508d0a085617a97103fc9cbe153bfe6 |     
    m68k     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/38d76671290f5dd186e8646a4777a0dcb8d62d24 |     


Gitlab CI results for 2025-06-13
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324254744 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324254757 |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324254856 |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324254876 |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324254884 |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324254891 |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324254978 |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255015 | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255042 |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255049 |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255053 |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255057 |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255063 |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255064 |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255067 |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255068 |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255071 |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255244 |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10333437188 |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255395 |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255404 |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255453 |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255468 |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255561 |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255565 |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255568 |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255593 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255693 |      
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255726 |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255728 |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255744 |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255747 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255779 |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255781 |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255785 |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255788 |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255792 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255796 |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255799 |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255804 |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255809 |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10324255832 |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10337765278 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10337765505 | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10337765776 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
