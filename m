Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D662DD1CDD1
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 04:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56F0260B22;
	Thu,  4 Dec 2025 04:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3SAS9ZmhpprY; Thu,  4 Dec 2025 04:24:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADE9060B3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764822282;
	bh=d/zW8R17sLOU/kqkiD2Bw9EZTJ/E0WckJJW9zwDx1t8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Onr9KguJydDRVF6wF08MFthrlVRWEmS5BiPGegdqKvtxD/CFABSi2NWP5OBU22VHs
	 jZExwFOnVW2DzQXBQph4w+kniXwD8OnqoxmxH+gscFm2cybH1UINzt8AyWLFV8PwuO
	 1hfA5b59i05EDWgcWrkmtnhqVH2rllDDRKCmqHXDH8y3nRPoezZH/SEQ5nI/ZpwkT0
	 flCKtrySUrS0LGph79r1WYyvbx0Mf1qY1xctAJBtj6EKld6E0sSCN9Wu+7bn3fuK8Q
	 UJwPel62wLtkttBfb9QSP0Gx6jmjS0Jg1yliA6GPK9y3U2wO3u3D4vfZAdiV5NWu+b
	 X8ItlFGF575gA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADE9060B3C;
	Thu,  4 Dec 2025 04:24:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E219E4
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 04:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B5B860B3C
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 04:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVnzYyr3OlGg for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 04:24:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A426560B22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A426560B22
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A426560B22
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 04:24:39 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so3452845e9.1
 for <buildroot@buildroot.org>; Wed, 03 Dec 2025 20:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764822277; x=1765427077;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=81pFh06uAp79R02DM0Comg0JotZUevzxY4ix2BDiPII=;
 b=QY25Pzp6+oebnYJb6DrZj2nmmRP0atC4TCDeZhM4Hkog5VFFLW/X6HmqJyrb5//UZk
 1zILCto1hD46q5oQLVK3uR5LvSD1N5z7aOoPE9ZJiNGtICxweu8t2cLmgX9mUnIgciNi
 plyHEaPuVOStda2giYtan7z/bmwNEiPZRXELwYPr9IWQNqdhgAwMQ9yZgFok6fHrjFC4
 NZ5YBebeLUCJ8wXKsFfxe8jFv/5sHKSC5dbwSWp3jT2kGDrLgSRFGR/CiCwXEucM6dEe
 MmMifd4m4Qp93fER5kuy7kaiP0wmPiOTtWEip5HH+y/OxQ3CDgeqOr9uctSg0RlsbRQP
 XW/g==
X-Gm-Message-State: AOJu0YzkO8PbwF8OyySvo5OXlIKs1MA29KmWs27QzboyoGbchEjfteI4
 B95IXMtbcdwjvG2JxfYJmodQrl2xPiK83vl+mLA204uE2Y9UxVCOAIteHIDI9Q==
X-Gm-Gg: ASbGncvziwazuNx5+owSatmnrZNGoFWpHGdomNoJl7x/Ram15uTlETMBbUZMRk2eM4h
 v7+rR6Md9GV2QxHUk+oL9lwsKrtcuySSZYj6lrIDoqv/YsnNDOKRAvfQDJDesHBuWoCUoCjPq3M
 z4ITgFg4rEOUH+XiqQEAwdxREynRshqcN7s9EL30w425X2e64FXh4p7smpzIlm/cIwqq/KpodtS
 rdac8tPNV7Hg2wB7XnLHbrIgc13igtjU8WGvhuokszlTchaQhMZ39o789pPieQ0ZRuOt/aKX166
 xEgxlvn6S+F5qavSI1mIIHM0xhZsHwfUGR9wYEsisT3jzfTfnB6uP7phnXcBtpeYpU6VrvTT+7I
 su1pND1FX4zGKcM8GKWc+fifKxAvBpJ5Y1qpwtWBPQOZx5AQ0IPI4EZjvvkNDhcsSQ21p4R1N7R
 fUk4gEf+FfkIPc4WQL7w==
X-Google-Smtp-Source: AGHT+IH/voJJBH6hjQQDfUMC7efsVeVl0hPeP9LWbVnfRHxd7m+mpdjY7x5yA7WleS+vbJKQRkjbJg==
X-Received: by 2002:a05:600c:b86:b0:471:5c0:94fc with SMTP id
 5b1f17b1804b1-4792eb23e64mr17102555e9.6.1764822277162; 
 Wed, 03 Dec 2025 20:24:37 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792b1522e6sm29536805e9.13.2025.12.03.20.24.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 20:24:36 -0800 (PST)
Message-ID: <69310d04.050a0220.b6146.c0f4@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 04 Dec 2025 04:24:36 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764822277; x=1765427077; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=81pFh06uAp79R02DM0Comg0JotZUevzxY4ix2BDiPII=;
 b=agGjbCZyjfBJwYbpie+8vAsGvRboKoYlmb4/j/3ZuGs8jvX6nWZk9VUI0DbKbCZz6C
 aftlQJN64NMplV78glsSbDFFFDLq4MYJ8PvTgqrZJyTUgI0lbp4khaid8MsxVzPpnSaA
 KvSV8ZvW6glrnipblre8muZm0/zv3l78kcLIege6GMXz8+K8uG7KZqCqMc/1C/ouXKvp
 +BaCRqgDq0xF5ILNJqjomL3zHXNiDYRdZI79qGuFMyFi9Aoe8PAOY74dwGQ8qpL6DU97
 JWXMCMoQSDnZRu1gxnNLZLbHfumTrMiNerl/5Wvg2MA1TNePSyXYbFGL27GueFjYHc0Q
 a3dA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=agGjbCZy
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-03
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

Autobuild statistics for 2025-12-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 10  | 14  |  0  | 24  |
  2025.05.x  |  1  |  7  |  0  |  8  |
  2025.08.x  |  2  |  4  |  0  |  6  |
    master   | 31  | 83  |  0  | 114 |

Classification of failures by reason for master
-----------------------------------------------

                     kbd-2.9.0 | 4 
              libopenssl-3.6.0 | 4 
                       unknown | 4 
           dmraid-1.0.0.rc16-3 | 3 
firmware-utils-86739f2b3ae9... | 3 
                  brotli-1.2.0 | 2 
                  cairo-1.18.4 | 2 
                   cvs-1.12.13 | 2 
                 dc3dd-7.2.641 | 2 
  gobject-introspection-1.84.0 | 2 
host-am335x-pru-package-5f3... | 2 
                   libcap-2.77 | 2 
                  libsvg-0.1.4 | 2 
                    mpir-3.0.0 | 2 
                netdata-1.37.1 | 2 
      passt-2025_06_11.0293c6f | 2 
                   perl-5.40.2 | 2 
          sane-airscan-0.99.33 | 2 
            18xx-ti-utils-R8.8 | 1 
               asterisk-22.5.2 | 1 
                  boinc-7.20.2 | 1 
                   ccrypt-1.11 | 1 
             dahdi-linux-3.3.0 | 1 
                    gcr-3.40.0 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
               graphene-1.10.8 | 1 
     gst1-plugins-base-1.24.13 | 1 
              host-guile-3.0.9 | 1 
                  iozone-3.508 | 1 
                  kexec-2.0.32 | 1 
      libabseil-cpp-20250127.0 | 1 
             libgphoto2-2.5.33 | 1 
       libpagekite-0.91.201110 | 1 
     libphidget-2.1.9.20190409 | 1 
libuci-f3fc0b76040685829191... | 1 
            libxkbcommon-1.9.2 | 1 
              libzenoh-c-1.2.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 linux-6.17.10 | 1 
                   linux-tools | 1 
                 lockdev-1.0.3 | 1 
        ltp-testsuite-20250530 | 1 
odhcp6c-53f07e90b7f1da69771... | 1 
             parsec-tool-0.7.0 | 1 
                 pixman-0.44.2 | 1 
                python3-3.13.9 | 1 
                  snort-2.9.20 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               syslog-ng-4.8.3 | 1 
                systemd-257.10 | 1 
               trousers-0.3.15 | 1 
           uboot-tools-2025.10 | 1 
              udpcast-20230924 | 1 
ulog-0389d243352255f6182326... | 1 
             util-linux-2.41.1 | 1 
                 zlib-ng-2.2.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/8565ee0a7f4a6f5eabf7b98ea86b8282dee5ba15 |     
   mipsel    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/42c0a310ee7e75c96797dd47466b8d7a9a26c707 |     
 microblaze  |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/35298ff9bf8960c030211589e8f02e93f42b9765 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/bf75c6329b94e56533da8846c7b4304d2b3224d7 |     
    arc      |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/9a7c33b9f2fec05dd4e5ed81c897b83f523b1628 |     
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/4af989251deee94bc4d3b097cda7931b8fece047 |     
   x86_64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/a5710f4d166e443477df0d7b915cc581b3142f00 |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/ccbb992b876c9454e5437d2ef2ad6c18cfd93af4 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/5867e478e321c95ea719a25343e72ce48bc0a55d | ORPH
 microblaze  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/fff555b4dea6ffc9615cd4875ac52d41e5b2adb4 | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/67ae0902eaa418aa7e85c2b0d638002f47624e2d | ORPH
loongarch64  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/5366bb17c727eda4f0e69b3e35ff5d623cf26ac0 | ORPH
   xtensa    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/b14df9a100f871bdd4c6219c004ea37c4f13df02 | ORPH
   arceb     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/d227b54dcce9e4a67312e76bf766a18adcfa69c2 | ORPH
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/c79232526ded1d6f1f0f8925f006d7613e22be89 | ORPH
   arceb     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/12bf07840acc0879c5211e9362b7451a6fc7117b | ORPH
   mips64    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/4239c909d01fbcae411ec7a5f49c69f60961bc86 |     
  aarch64    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/039c7e389724e82694f09daa943c199b02019866 |     
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/06595958de57921a161b4e940e781e056043f7e5 |     
    or1k     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/659fd8afee77011a941063d70301bef6c457203a | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/903df242f1bb133ba8027f615bf38b964f1280d4 |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e9dc0daa4e5113e69f91b809d952d85d6f2328ee | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/24940953df8ca70774ed62e761617b5c622d2ad1 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/4c6ca7e4cdcc497ed58a2bd8cd1b49a6fb076c18 |     
   sparc     |   gst1-plugins-base-1.24.13    | NOK | https://autobuild.buildroot.org/results/d89e2e9829f48e7ac9560340f067c3a8723bff26 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/78596dfde06cbdd044ddbb2fa892ab878ded98d1 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/8e06afe096ca2716623a0c40552336c7c1defc95 |     
    arm      |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/0950850e9384840536916f082beec6324bd6d250 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/3d0e1211048b3ab7da1b43e670b9c42a00737247 |     
   s390x     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/e468ca6bb6d586d479e3ebc761e09fbf6ad3c4e4 | ORPH
 powerpc64   |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/c1dff1f0d26d48b1ac4c1e3cd6e6dbdca83a8eb2 | ORPH
  powerpc    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/a54c4c8c59308346efa2eb96180e17893023b98b | ORPH
  sparc64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/12f6f713d59131bd0fad227400a3a6c5f9da74cc | ORPH
  riscv32    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/37fa8168cec3af607b12bcfd5bda1acec61b8ad9 |     
   sparc     |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/db2e20ada3f3c5d20eaf520fd7b344566868626c |     
    arc      |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/6029de04dc8466386e013ddd87bc3c90f5b568f2 |     
   x86_64    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/49daeccf22ab0a53093fb17e16cf7685e77a96d0 |     
   armeb     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/7ce232f31efee033c0706dc2e8b83c232f07647f |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/fdef3b7748868e90da5e6b5f39488ed11369505d | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/3fb5ac80482b6d28c60b43a74aa71e853a2e4c01 | ORPH
    mips     |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/7025bbaaf34ffe54d89e583ee060b7095b7d2b9b | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/ec2615404d2efc1edf16a4451e2b810182c05b10 | ORPH
   arceb     |    libpagekite-0.91.201110     | NOK | https://autobuild.buildroot.org/results/a7ec2e1b0618f4c5c603262dd176525158f358ac |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/48d69c4dd39ff71ffc4e22c54e1e085403d175a3 |     
loongarch64  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/a9a3b6671309443cef95b14646ae30cbbe8e72b9 |     
 powerpc64   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/01a5dd85f2a37fdc5541d6f9defeaf77bb19d2e2 |     
   arceb     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/e445665c75a8439381250b58a8d13f19971146ee |     
    arm      |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/ad1a03da627ed585294adf7e8d444b6dbb3e46f4 |     
  aarch64    |        libzenoh-c-1.2.1        | NOK | https://autobuild.buildroot.org/results/b8a022525693466674a50a1f1efaf0615067bb9e |     
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/400025a07dd4e2b2287fb47bf660533e914546d4 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/2fc43a3a813f8f0fac045adfbfb9eefc7de0b3d9 | ORPH
   armeb     |         linux-6.17.10          | NOK | https://autobuild.buildroot.org/results/6570e455b5514f24bf7689f4ceef715902c61602 | ORPH
   mipsel    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/71acebda9176d2b040044657b4de4e586b56f053 | ORPH
   mipsel    |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/1bc865e6e6d127b340ac4c5a9d5ab10955237971 | ORPH
  aarch64    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/cfc55ab85b8330fb830b29ba558d985c6a6b7c2d |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c460a5735d1f347b202ceeb89329bcf549f035ee |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/56e881eb8b0fbca93733349659ea5904e1b01fd7 |     
 powerpc64   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/8e8cebc092131a1b6a7c430264f944316cdaab48 |     
    mips     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/f0cb9c421fbf83de2385365d66eb5314b9e44554 |     
    m68k     | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/60d8e0fa84ddf38cc4f1efd587d65773e498cd93 |     
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/a542ae8d8b8d47e239e926b0893cc4608a539ed9 |     
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/f5386074908d94ab6bcb4f3270d3af904f0c6674 | ORPH
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/6d1301a27896f08383fdda083c3a59b42a7d0e89 | ORPH
loongarch64  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/16be0507919b291c2c8d793ade0a9f7067106a83 |     
   sh4aeb    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/04d40f5eb3ad3aff28aa5f9a64817a4aae4f073e |     
  riscv32    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/c66a33313573a00f5563b5e4ec9c338277e3804a | ORPH
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/ea4a54673d9322b55fa8bf5393aadd6d55f4cc59 |     
 microblaze  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/fcc32062ac109bda2033ac39086595e4fe940744 |     
    sh4      |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/0f20c267491db8772d8dcb11b35d21f290dcea8c |     
   arceb     |          snort-2.9.20          | NOK | https://autobuild.buildroot.org/results/c3f604b561ffa10335981324b5927b483e55606b |     
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/d20dd67a13b6f3757a836a6d64329ddbb680be3a |     
  aarch64    |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/ce17fceacd602bacb165bac36c0b63c4dd3aefa5 |     
   x86_64    |         systemd-257.10         | NOK | https://autobuild.buildroot.org/results/8988d7bb7ca1b88941b0212681be50e39e150d5a |     
microblazeel |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/e38a75a921f1ec2801fce9124cfb136e41b45c24 |     
  riscv32    |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/729547cd775200345703e0cdffa4e1fc6c27f4a7 | ORPH
   armeb     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/95d5c8c0f90e59df4b27bb7dcf0c3be07047f59a | ORPH
  sparc64    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/ea621d692e7a824bbe5b91a76025ed2e803f7c6c |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/4c9d929c5af28247fb2da74f2b11c315c226684f |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/e57ece319a6660830944a2d8ecb270cf05fc197f |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/0f60d481e3669fa9bc3092680311eab41e09efeb |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/202a4bb7c887926d5bf9eb5f59a4ffa755acfc16 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/f381f8bfa5381b60314118ab9c996c2bdd66a19f | ORPH
  powerpc    |         zlib-ng-2.2.4          | NOK | https://autobuild.buildroot.org/results/0aaeca13da5c90b1b069b58f57cf4367a0e4ab1e | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

              libgeotiff-1.7.3 | 1 
                  libnss-3.114 | 1 
                 linux-6.16.12 | 1 
                     pound-4.8 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        libgeotiff-1.7.3        | NOK | https://autobuild.buildroot.org/results/ed776c9e485b37b13b56fbff7727de4d6c02af32 |     
   sh4aeb    |          libnss-3.114          | NOK | https://autobuild.buildroot.org/results/9a52e5b51698b0905ae1fdc9988dfa292feff7f2 |     
   x86_64    |         linux-6.16.12          | NOK | https://autobuild.buildroot.org/results/a4c5d1e8b5386123803ed4450d1d150813f8cfb5 | ORPH
    m68k     |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/1efd13780846103ab89ae1cbb4eae0a8ad0bad82 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   perl-5.40.2 | 2 
                  cairo-1.18.4 | 1 
                   crun-1.18.2 | 1 
                   cvs-1.12.13 | 1 
             fluent-bit-3.2.10 | 1 
  gobject-introspection-1.82.0 | 1 
           host-go-src-1.23.12 | 1 
              host-rust-1.82.0 | 1 
                  libsepol-3.7 | 1 
                netdata-1.37.1 | 1 
                nushell-0.96.1 | 1 
               openblas-0.3.30 | 1 
                s6-dns-2.3.7.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/f746c211dd616f849f6cff40bc56054687440cca |     
    arm      |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/848ecf4fda290d1d91be6ac4268dfec06c6cf1b1 |     
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ffaefcec8fe9f2a825c1a2cd42337d077466ddd7 | ORPH
   x86_64    |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/23d67603c8c982d977cde49cad8f451d9963c1b2 |     
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/e145c9669144b9f55cff3c3c4f9d62ed3dc81aee | ORPH
   mips64    |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/a944aed78e13663d6ef379a2dcd8c22f1f0cbfc8 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/24c9283db62f38c5691283116de3af670241d250 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/2853f48c818131412356d5aa34fd0e8ef4ee84bd |     
   mipsel    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/c6c517deabe382a5ae2ff951eccb6a5ef1baa63f |     
 powerpc64   |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/dc675c0b79a85ca1c4ee8bedba16d3dff4b4098c | ORPH
   mips64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/c0a456660e4c706490409209971807cbcf1f04ae |     
 aarch64_be  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/2f4a99cd9c5c9a10780e378ebe41f3e2847952cc |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/c6ca0a3ff23d3bbf36a702fea418333abd18863a |     
   x86_64    |         s6-dns-2.3.7.2         | NOK | https://autobuild.buildroot.org/results/b4439cd232bdb519fa72f1521e276673472a4f8b |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

    host-mender-artifact-4.1.0 | 1 
              host-rust-1.86.0 | 1 
                  libbpf-1.5.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                 libiqrf-0.1.2 | 1 
                 linux-6.14.11 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/50bfe5e2dd43c1a8037f1d47e9a741127075596b |     
    i686     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/c698c93bf1beaf272008cc53f474846225d744c2 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/885749bd7f92e83beb2afd7ba643750c3df45d3b |     
   x86_64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/5e4855185f399b3885b75ee59dd3cdf85b85c405 |     
  sparc64    |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/fac6a5a1ffe18c78bc4437cf5c8e9e33f8e5f95b | ORPH
powerpc64le  |         linux-6.14.11          | NOK | https://autobuild.buildroot.org/results/6d00afcd312ab36985202532577638a016a72d79 | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/8dd8f935816b9d1b3a10fb81b3f02c227f546ed4 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
