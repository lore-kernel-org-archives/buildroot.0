Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351A8E9410C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 05:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A613C403B7;
	Thu,  1 Jan 2026 05:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EaUqvX-2jTgc; Thu,  1 Jan 2026 05:55:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0110C4079D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767246933;
	bh=vPszo4DlC/SlbEhAPGmN5wO+OHccGqbYMT/sVNex+Y4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cLIuX/5tp8tgI6ySDIkl/qjQwt03nLccgD7koz/TEOaSBSegPscr600DbqRqJTQS2
	 90kAct0o6yq+CldooQdkfDPcANiCvTZmyTSfrW5KzF4sWCNeRdiXdRfHbGpt0IVWjj
	 CmSQyyEOTrzQIdaHk40DvcRebVQtkrf7nH2HStW3JmKeeWu0Yp1yDx+MAIyd8OpEcG
	 2fQJ11eCu9vHbnaFmHWJtnPqWsAtC2pMP/XqfjN0Vqki9ZLjmubqaHmNzq2oKXUh+1
	 PxUYXW490OnW9zn5MZq5zoKt6TDsamPVhOIk9QJTyBYiB3BrMsbxmRGd/uC7JhU9+7
	 5pJBcQQ/73E/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0110C4079D;
	Thu,  1 Jan 2026 05:55:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CB2B351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 05:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72D546071E
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 05:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nk9YA_YMKdhP for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 05:55:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64DC06067D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64DC06067D
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64DC06067D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 05:55:29 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b79ea617f55so2138520566b.3
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:55:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767246927; x=1767851727;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7tkd/7jgNz5WWLyY6/HyJStXf46oWFXRq4Y/lbD5zD0=;
 b=LbxUYjHv8EV/LQGo346H876Bhu8Hj0LIRxuw9JIbNbU+7a551veBDHOoS0bRsm8klr
 gQaWjG2/xQk2tJH5wVaTr7U0CBmlYm7wMn3U1esryG5liNBBmwSOMKJ7+frAiC8zH27W
 e/RTRDP9lCYDgPDfqaNu9BZGRh65IAroy++JOk6SwWn71dsAawYf6RjjlK01godtyo6D
 C6ToxrZjjaZU01odO1rCxGRKGYb+mEBkyohNHkkqP33f9D75tCIrwuDJy74AbAJm8j2j
 EEO6N0otIOBA3TDzbsS+ds+tAqTn/h5v21OIa5eeG4AOaoJy1SNxr7XkDnSljWrvPEnb
 WgAA==
X-Gm-Message-State: AOJu0YxlYkGs41/437z2IbLmoPNzWvKVvsFK3TcUkaUHHQHGftdg+VZt
 a7+j6MdV7jc1dIPp9lLMdk9bDgHNxOUZ3z4eG24Dzom7YgZs0vd8kwdoDqkwAQ==
X-Gm-Gg: AY/fxX56hoHlVUy0CsqbBXbZWalvJtZ5FnR5uzbMEBj2lZujpbqdJufai2MqotF9dkv
 VRf9rTv8909mJaAAIgF3utLgZ/3sBLh3mLYLgLro3MdgQs2en8ja7XB3Hx7c8XinuK0PMx7aZNy
 RAwIDiOcc7x8lcbX1OudHhks5LK0Q8VT+qC5o8XyAG0Lj9d4MDEj/IVWTyTIH6rWTCHUsPFmjHy
 +ztXIxqSXhaDbB+bTvis4Vg3etV2bf3y2S3VwDkbFGwTVs8JLcNslU2GJGnmWlPBQYN/GhTdPTX
 slCjhVOuuCUuNBH9ALDWNZXozfebfte22j1Pwp+NmUdFvJLZuLlWXsy50aM8/jyqX6JKS+slS2c
 hpH0IfgMFmIZigtQVtE6rBtI7rxugqOOPaDf4Rpo8mrNv2Cg3hwcOgJRTriUYDg9iu6ZKeP8pWQ
 EWg9K+GSz4Jl30AUWhXA==
X-Google-Smtp-Source: AGHT+IFgHfdk329FLq7cMGAR81SjDiTUP8jljn655F7axP/KOfsgwtVbbJeTJnvW444AYRjEZwaBxA==
X-Received: by 2002:a05:600c:4706:b0:477:9b35:3e49 with SMTP id
 5b1f17b1804b1-47d195495e1mr451315715e9.3.1767241052671; 
 Wed, 31 Dec 2025 20:17:32 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193621c8sm674875015e9.7.2025.12.31.20.17.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 20:17:32 -0800 (PST)
Message-ID: <6955f55c.050a0220.1e409c.1d7f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 01 Jan 2026 04:17:32 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767246927; x=1767851727; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7tkd/7jgNz5WWLyY6/HyJStXf46oWFXRq4Y/lbD5zD0=;
 b=UV2XmkH5INt4Zk4D9e6qZ+V0CqKo+clxeh0zSU2a7PsZKkakz9GosMSabSmfDNZCIz
 jDGAwcKRuED5L/aqwQIcI9l8ADhxD3Mm1F30UoZ5Oqh3dfp9XNalhCmY2MRIrOE8+MMh
 tySodXsiFkkAxwSZyK8KIGHReuR7L3TcWYnjRZi3Yp8lK3ShO+K/8wqsmITt5TJClnju
 Yrn7oFSwP3y+v7YT7xpkPPGdaOyPmM0f0xcYjmy04L+aPMNUVbxyk4n3R9YANara+24X
 dx2q1I+d4puph/f7S6HCBFntGj03lvpW51tt4ZqgmJmHGgmoGOlCObvfIp1RXVSulo20
 hITQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UV2XmkH5
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-31
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

Autobuild statistics for 2025-12-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 20  | 39  |  0  | 59  |
  2025.11.x  |  7  | 17  |  0  | 24  |
    master   | 60  | 122 |  0  | 182 |

Classification of failures by reason for master
-----------------------------------------------

                       cfm-0.3 | 10
                   dash-0.5.13 | 10
                 jasper-2.0.33 | 6 
                       unknown | 5 
                   cvs-1.12.13 | 4 
     linux-5.10.162-cip24-rt10 | 4 
                openobex-1.7.2 | 4 
  gobject-introspection-1.84.0 | 3 
                   lsof-4.99.4 | 3 
             util-linux-2.41.2 | 3 
azmq-v1.0.3-54-g819b24035cf... | 2 
cegui-00b4e1fe174da53b7ed72... | 2 
             dahdi-linux-3.3.0 | 2 
firmware-utils-c42a3bc53da8... | 2 
                 host-gdb-14.2 | 2 
libcorrect-f5a28c74fba7a997... | 2 
     libphidget-2.1.9.20190409 | 2 
                    mpir-3.0.0 | 2 
                 rtptools-1.22 | 2 
          sphinxbase-5prealpha | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
                 aichat-0.30.0 | 1 
           alsa-utils-1.2.15.1 | 1 
amazon-ecr-credential-helpe... | 1 
               asterisk-22.5.2 | 1 
           at-spi2-core-2.58.2 | 1 
                    brltty-6.8 | 1 
                  brotli-1.2.0 | 1 
                 c-icap-0.5.10 | 1 
                 dc3dd-7.2.641 | 1 
  distribution-registry-v3.0.0 | 1 
              e2fsprogs-1.47.3 | 1 
               host-gawk-5.3.2 | 1 
              host-guile-3.0.9 | 1 
 host-softether-4.30-9700-beta | 1 
               host-zeek-4.1.1 | 1 
            igd2-for-linux-2.2 | 1 
             igt-gpu-tools-2.3 | 1 
           janus-gateway-1.1.2 | 1 
                  kexec-2.0.32 | 1 
                  libenca-1.19 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
           libfreeimage-3.18.0 | 1 
libfutils-c326ce0cc2a735438... | 1 
              libopenssl-3.6.0 | 1 
              libsodium-1.0.20 | 1 
                  linux-6.18.2 | 1 
                   linux-tools | 1 
                 lockdev-1.0.3 | 1 
        ltp-testsuite-20250930 | 1 
                netdata-1.37.1 | 1 
               nfs-utils-2.8.4 | 1 
                     nut-2.8.4 | 1 
                openocd-0.12.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.42.0 | 1 
                pipewire-1.2.8 | 1 
                 pixman-0.46.4 | 1 
          powerpc-utils-1.3.11 | 1 
          python-pybind-2.13.6 | 1 
   python-pydantic-core-2.41.5 | 1 
          sane-airscan-0.99.33 | 1 
                  snort-2.9.20 | 1 
      softether-4.30-9700-beta | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                   swipl-9.2.9 | 1 
                systemd-257.10 | 1 
          usb_modeswitch-2.6.2 | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/6f3708a582773a87a66aa1fa667fb06f6555f4b6 |     
    sh4a     |      alsa-utils-1.2.15.1       | NOK | https://autobuild.buildroot.org/results/31a409308924fd7f60dd94db3c10e2a25c73020a |     
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/d43b42a6c69f64d63eb06f702cb1b1d8d8484302 | ORPH
powerpc64le  |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/52c6dd83f28328d88b055cd5b5d8195ed973ac38 |     
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/3866237bc4614470c1ac6f63e2434f7a647d08c2 |     
microblazeel | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/d6d1ad019853fc2673bb25523a4db2b331136a98 |     
    mips     | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/887229cc044fc184f4e056b92bfc57e6a41e40aa |     
powerpc64le  |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/e415f34a8616afbd71e80e695f259dd46bb9bc9a |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/a73df9ad46f7dc8347a76e4553d4e53831f31137 |     
  aarch64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/1cf293aa9c5f64b2e185c136b35ed828d041b3d3 | ORPH
   x86_64    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/b5201142cdfffff66ba094a2e045128135a66272 | ORPH
 microblaze  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/de62bf581f9e645eb71c8dbb10fdaffa3b720067 | ORPH
   s390x     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/c321e4a86ed2378a0310e0e1caf6624e4d675047 |     
loongarch64  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/8d99fa3d600b2743714bfffe664465035c285ec7 |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/e1143bcf8f95b3231ac0bc814d722f39493a66e2 |     
   x86_64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/04b6a558bf7397bcbe6735b705e9841ff454ecb7 |     
microblazeel |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/15be14061d7257c1e778f4c4cae1bddbf5a553cc |     
    or1k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/c0935162c70b79e025980140e25bef1cdfe1ee8e |     
powerpc64le  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/daba2c95d78af2b2c2ae28449f0a0655bf860953 |     
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/07bdaa95cb04f14e67ea0cf22e1476f6e610e11a |     
    sh4a     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/c12f9da5a0326321db14b622fe65eb996e808d30 |     
    arc      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/05392d320c0b46768a7b92cffdedbdb6ae551adb |     
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2cba5dadef08f4e05bda6b0e20d0adddbac149bc | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d1f83037b127366d0ca0b0ba7b6d2fe1562d8df2 | ORPH
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/89aa5999a899b8faed36e34b1e9eba4e0d081548 | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/61d6613883f63e6ab45cff1242a838ad3753f98c | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3f8b9da40932694de51e1c3388c6c33f4fa25a97 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5e095aae682c14370f784cf2bb9b739e2a3ce489 | ORPH
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/9da582a9c7f70f84a95d16eb254bfa28b1d98c7e |     
 aarch64_be  |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/858590f5c1f3a4c5f7dc94830a9a31889e1e4c84 |     
microblazeel |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/772e1591cfbac4e0391ee961f73843d4f4e89095 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/d17a902120004b4874c6100f849c95346443e5d4 |     
    or1k     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/3e53c8dc27c698602985fa0427f0d364cb09c4fb |     
   x86_64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/eeb75238eb77fc99b37fa9fff72616928097af67 |     
 aarch64_be  |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/70ec8edb9ccfcbf903bf1d82943657ba7570825b |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/5f40cf98f7e132cb1f99a3f99da3ab8d587cc1e0 |     
   mipsel    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/315aa74d1858ead0147d6685f20a3b2e1f22777c |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/689a4ff1082d851cebb90c2c99bc587bc17af3e0 |     
  riscv64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/40a90638f90260ca2cb51bac03b0f8fb23a6ccc4 | ORPH
   x86_64    |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/33e91b53564f7e2882ec33dfdd15e36cc7476e8c | ORPH
   mips64    |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/4e2e2e93d82d37b2956b21e396c861b00b5804d6 | ORPH
   mips64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/5218101dcc7f1ea02eaf70deca7a84ad85fe1d50 |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/2daf0199a038cd2b096a309ee3e42b256c1f61f3 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0733d9470f8114f34538ecd837b34a75e562646e | ORPH
    or1k     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/240f9b7f10531a94c578febc79729fd1fea01ca5 | ORPH
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3a1004c388a06cb7c042ea0e88dea33fcdce7957 | ORPH
 aarch64_be  |        host-gawk-5.3.2         | NOK | https://autobuild.buildroot.org/results/09091a907577a8fa7f3bd67190914b5f8f3d02f8 | ORPH
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/b05688d7008566f41d82f3ba277c5b6e5ab54124 | ORPH
   xtensa    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/9b44c69fdd5d79b0fc2f0e80589247fd3f1c1e0b | ORPH
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/500226a515be7ced3aad5365b131fa162d4966c1 |     
    i686     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/9130c19c84177ced5056fc3a2d1c92f041d70974 | ORPH
 microblaze  |        host-zeek-4.1.1         | NOK | https://autobuild.buildroot.org/results/bf2c5ed190b54bdab944e9225d6ffb2c1e5736aa |     
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/4f56bfbf14962c30d2ca4c31fd6a55a3295090bf |     
 aarch64_be  |       igt-gpu-tools-2.3        | NOK | https://autobuild.buildroot.org/results/e3faeba1bff3d0e781032ddc9a760f34a9bf5714 |     
    mips     |      janus-gateway-1.1.2       | NOK | https://autobuild.buildroot.org/results/41a2fa1c0806a41b6192b225777ab718f0e98cbe |     
    arm      |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/2293e03fbc7c0db4f928ece0c60e85d55d9cf15e |     
 microblaze  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/803c7071dc79e25a4fd5f80e8e46f5cfa6702c96 |     
 powerpc64   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/399516220e3fe1809c7f8b6a4a6c197e765a71f3 |     
loongarch64  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/77dba7231b185c8d54994b2fb8d3e7ab215b1926 |     
 aarch64_be  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/3f59d2fda965263c79066085ab4a403b533fb485 |     
    mips     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/89d3efa3c8d00dc08114259f01a7fe4024747fe5 |     
  powerpc    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/2e18fc7b1356660e7fa069e71f16ce2fa2d331a4 |     
   mipsel    | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/6ad5bd5ac4e339e92e7d6c1656ad7539b420d200 |     
    m68k     | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/23fe5f08338110c1545a95703262e701ab437b27 |     
microblazeel |          libenca-1.19          | NOK | https://autobuild.buildroot.org/results/fa66e83a9f7f9fa5c9e6cf44b9bcc75527d4c253 | ORPH
   x86_64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/e636a6f746c17087eff1ca5b8349ea1c82523b0f | ORPH
   s390x     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/996494248f43a1e9960948df5356cea2a0b8970a |     
   s390x     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/12693ad3d7e53b7e0edc26d8d2ea49338538eba1 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/618d8dfd95d5f590f538cc0774f8e5cec2f65fe6 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/1da4aa79b04124cebfe2a0207c5791b8ac9c8f4c |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/2c8fc6a5d5df46479370d9388511965f80c40cf6 |     
  mips64el   |        libsodium-1.0.20        | NOK | https://autobuild.buildroot.org/results/5f4415a55cd26b1f0eaa9b67c8623236fbc8adb5 |     
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4fcbec122b32f5fa94aeb7e9209a076adb647fad | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/2d710cc3da3665bf0f3f1a55838b01ddaa260132 | ORPH
 aarch64_be  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0dbd197b84cf1281221f7d50bd01bb2a286e3531 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0109f3757136ccffe7e951818b6be04129252b07 | ORPH
   x86_64    |          linux-6.18.2          | NOK | https://autobuild.buildroot.org/results/ff152f4b0e5c91ed6b04f4b9260f8cb1e63f80c5 | ORPH
 powerpc64   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/87fcf167c8dfe1b81968e17b68810bd72d6806fc | ORPH
    i686     |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/ddd224aaf3877cb745e5e0cea53a142ec5bab148 | ORPH
   mips64    |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/290c4204290b5801b9ff2b9c5def42e59e7f3b17 | ORPH
    arc      |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/ec7727eb48b68deec8279b3680e5147022c316a4 | ORPH
   mipsel    |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/5a5a92816445fe722755b13f0a9f740531149365 | ORPH
 aarch64_be  |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/9a072b1e58e6c9ddfc6d32c044cce549038ef730 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/12bf43a03cfd7126d9d71ba0c2ea82361b6f5475 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f37f04230d202bbec79cb78697bf986ce8affb39 |     
   mips64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/60c16b10ea4d04572d989a0a2898b570156354bd |     
microblazeel |        nfs-utils-2.8.4         | NOK | https://autobuild.buildroot.org/results/aec76462bb26c18c40c8921210ded87449c324ae |     
  sparc64    |           nut-2.8.4            | NOK | https://autobuild.buildroot.org/results/f3c2f30ec59e840c3241cccd1840f01ee5453c70 |     
    m68k     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/fd617d060690d7b9f3d26a2c895174558f53911a | ORPH
 aarch64_be  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/ba05b774ce1d93524cf53357048eaf00478ae69f | ORPH
   mips64    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/e2b786dafddf1e9e19c830c9f1f81c22efffd813 | ORPH
   armeb     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/b7354d6b82660c3a32482f99b2d7b0c4f76cc36c | ORPH
 microblaze  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/68cbff206deb149fb242f5ae1cc9f49d7d9633fc | ORPH
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/9af7476308e51d5e378f49b6de8c8b1cc553390a | ORPH
  mips64el   |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/f8eb5d01ebc5db2b48737438e02a48df7f1f06cc |     
   sparc     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/10bebc6da98f1792ec85bbb34ad6450ec2b867d8 |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/70017b88c1b909e65c4d0096f1c8a1b996d53bfe | ORPH
 powerpc64   |      powerpc-utils-1.3.11      | NOK | https://autobuild.buildroot.org/results/fec2ecf07c063f600867b1c40d21721366099fb2 | ORPH
    m68k     |      python-pybind-2.13.6      | NOK | https://autobuild.buildroot.org/results/bc9cfab6862dcb7cfc8d9c7c6e785701cc5f1a59 |     
    i586     |  python-pydantic-core-2.41.5   | NOK | https://autobuild.buildroot.org/results/41108a4a6d3e9bf16d983c9bf1fab2ded2e192ae |     
loongarch64  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/8ca2925b2df022d6bef60738e051240d730a2df3 | ORPH
powerpc64le  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/0a21f05dd9b3ffded339947904fb975ed3a55b5c | ORPH
    or1k     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/7b20e62d364ea859fc9607e1359c95db20274533 |     
 microblaze  |          snort-2.9.20          | NOK | https://autobuild.buildroot.org/results/8286c6302f59c7465b5c85c67bb106dda2e728de |     
microblazeel |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/d1bd6a6a8983520d756b298ecb316d59e1080d5c | ORPH
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/f99e2224685665ea862c59db57cbd76fb8810ae2 |     
  sparc64    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/358aac923eb31e96d6f65b7a604d2c674c83400a |     
 microblaze  |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/55b66f4d3f220c6ec3c86d708fe68bc34135baa9 |     
   x86_64    |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/aaf7dcc94493b47b25ce1b5a6e43b510c968c766 |     
  aarch64    |         systemd-257.10         | NOK | https://autobuild.buildroot.org/results/c94a7748018114e88cfc72e1d1afa7c0ffd0251f |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/07db9857b528303b1a20deb75d283d8a953a7297 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/aeca699f532b5ff0f25bdaa518814cd789bf6ef1 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/aefb68e1ab91acd91e9d4527d1aa1726041c310e |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/d2e129a4d00318f6338f747e99e86742d120ecde |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/e33721d37e66e83eb3c209154f1e3cfffe75ae87 |     
  powerpc    | uqmi-0a19b5b77140465c29e2af... | NOK | https://autobuild.buildroot.org/results/439bf99afbe082cae77b84a28493d1184dddec08 | ORPH
   armeb     | uqmi-0a19b5b77140465c29e2af... | NOK | https://autobuild.buildroot.org/results/0baaa75bfae499931546d9c4c61d3cf52296b459 | ORPH
  mips64el   |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/b6ad4aa2931295b73c0a938b6411d5face1d1020 | ORPH
   s390x     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/1234e53502713ca15c449f25a86cc931ce2d1b81 | ORPH
  riscv64    |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/1c2dbd5daadc249373ac6c1107aea8bcfa4534f6 |     
  riscv64    |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/c548a152e97c1e8ba1d285ce347e81f846b099d4 |     
    i686     |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/69980067411a7e4466d31a7d959397e06cf1380f |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

             berkeleydb-5.3.28 | 1 
                 c-icap-0.5.10 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                    fcft-3.3.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
               harfbuzz-12.2.0 | 1 
             libgphoto2-2.5.33 | 1 
                  libite-2.6.1 | 1 
                 libmbus-0.8.0 | 1 
                    linux-6.18 | 1 
        ltp-testsuite-20250530 | 1 
                openocd-0.12.0 | 1 
                openssh-10.2p1 | 1 
               python3-3.13.11 | 1 
                 rtptools-1.22 | 1 
              smstools3-3.1.21 | 1 
              udpcast-20230924 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/d2f1e1a05b123c8aa9da732d3cab7a95d5f6289f | ORPH
   mipsel    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/15e55e1819eba18d26d75cdb21c92c9c04a17f40 | ORPH
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/05d3264897b240e9d6679626b1207057c9f675b8 |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/3f542cb7b0fd90619f96f4f4f6836dcdfd8dcae3 | ORPH
  powerpc    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/0720dcc7638868a5de2ee9a471e16e013355b7e6 | ORPH
 aarch64_be  |        harfbuzz-12.2.0         | NOK | https://autobuild.buildroot.org/results/1bbdd866b1227d99b177fddc11fc5dac016db05e |     
   mips64    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/4b3cff76721522ea0a735795a202ad9e2c821f10 |     
  riscv64    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/f2289c02b86279ca1937bf49964edc67da3115d7 |     
    mips     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/c474895f3c96c394afdaaf31a603d5ce62c9e793 | ORPH
   x86_64    |           linux-6.18           | NOK | https://autobuild.buildroot.org/results/f0810b9ca13257bf68d5caa1d0ee48e378f0bbdc | ORPH
   mipsel    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/2ff41de80e816732c150cd50520bcfb1ad56fee3 |     
  riscv64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/108276645ae7fed0252e89e9fa10592936b59f74 | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/ada1dc8e97a9d720b62c731ef49cf218386cd7aa | ORPH
   sh4aeb    |        python3-3.13.11         | NOK | https://autobuild.buildroot.org/results/ae29e5c84e86ab5581473c3432515b4accc524da |     
   arceb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/8f6b9782059bba3b324fd4fdc04b21b56eef6e77 | ORPH
microblazeel |        smstools3-3.1.21        | NOK | https://autobuild.buildroot.org/results/509593dce409cf21ac05f4cc53c3282f7f4ead83 | ORPH
   s390x     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/3a33c174c782ac50fd0ef9d8017bdf9a4cb23cd2 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libxslt-1.1.45 | 9 
                libxslt-1.1.45 | 6 
                 libmbus-0.8.0 | 3 
                   perl-5.40.3 | 3 
                   cvs-1.12.13 | 2 
    host-mender-artifact-4.0.0 | 2 
                       unknown | 2 
           at-spi2-core-2.50.0 | 1 
          cloudflared-2025.1.0 | 1 
                   dante-1.4.4 | 1 
                  ffmpeg-6.1.3 | 1 
host-go-bootstrap-stage3-1.... | 1 
host-netsurf-buildsystem-75... | 1 
              host-rust-1.82.0 | 1 
                  iozone-3.508 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                netdata-1.37.1 | 1 
                 openssh-9.9p2 | 1 
              tailscale-1.78.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/dcf9fe8977a7ebb3037d2bd77465c7b2db518781 |     
    arm      |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/be042faa03163ab8d602814204b5e0f4f576f462 |     
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/db9d93ea8e20e228771e89a3180a000603579b1e | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/78f38ee50cf73f00d6af31e2ed0b9e0b463939bc | ORPH
   sh4eb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/c3e93d71386a5e8bcb04f71095b7da50793deb1a | ORPH
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/71ed79f4a871772092bf5c85b5bab7603b2f6234 |     
   armeb     | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/ce4666ba12a9bb3ed6be0612c048825efa7c641a |     
    sh4      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/afb7843614a7be303c6c1a7aece850c7ba45e5a1 |     
    arm      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/59098dcc0c629e7b16fb5eb08e3975b78a943af1 |     
   sh4eb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/8cc2317bf46fb2d04be1b8f857f9eaccb4b5a1f9 |     
  riscv64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/472241d46305eb2718acd9d4cd4e0afa8c0b49b4 |     
   arceb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/1099cab15cc5dcf8d607c1129fd085060656acd5 |     
microblazeel |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/860d2b0375483e9f023195f39b8ce47b12150d75 |     
  sparc64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/f936bc2e5b366cc534d5a4df14181f73c0d509a0 |     
microblazeel |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/b15a5e4e8578d468e86c4bb198349e74888c8cdf |     
   armeb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/f2999d11e4d047343fb66d279b734c1c21ea54d6 |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/431b53db4709ac7be25a355c6d953e6059fdae8e |     
  riscv64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/86ae4ca8dfc793aee3027d040be7372161719989 |     
  powerpc    | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/f4db2b760b1f190eb1c05940d4a7db44a7f60d91 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e5ff7e4fb69d336dcec51f104cbe504953239602 |     
   armeb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/de42ec7a2f2f9809d4c798ec7261eb942776e6ba |     
  powerpc    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/0c68236a909ae00a9fc2d4fa7b76a8f914557064 | ORPH
 microblaze  |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/edf23e512f2733f4be02e6f8ebc3248d6095d5de | ORPH
   x86_64    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/2de608f1a6900028986bb4042d4cf4ff670bbd31 | ORPH
   mips64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/bf7c99d0f9a432fe4c268f2d0d4ea2547121e107 |     
  powerpc    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/354bb688dea3ca87a6107e9008d2c40231b2da95 |     
   sparc     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/cafc874104b1ddc7aed173380c41953edd01c4a7 |     
    mips     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/85d7ab7310c453034e545a93eacb7b31babde932 |     
  mips64el   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/a4033e376bb036e7de904cbcf9fbe94d4c2c56c7 |     
    mips     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/aa3deced26132bae373f759cb8430f80fa787a65 |     
  aarch64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/da9bb906bda254f76726e67c77ab3fc2ea322880 |     
    i686     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/a3ad7f5cd5ec511117eeaf8d7658e6a7b9a3b1eb |     
    m68k     |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/3ccaf319ebbe07543b8d7e6ca331f762a818ce99 | ORPH
 aarch64_be  |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/4b5edbcfd83c139d0c87139881589cc47f4f2568 |     
    or1k     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/57fe1589835608afd3c2313b69a9f4dca2874c06 |     
   xtensa    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/6f701d91badef6efb7c34dbd630cd411776ddfd8 |     
   s390x     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/7832606dd3463471a6aab8b846c19af74db723a4 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/257597da87e813114da77b062e64e33cff32dcba |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/bbbac459f7d24e0372b3e3784b7c7aed28a7d410 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
