Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47280C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 04:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A07080D52;
	Fri, 14 Feb 2025 04:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3L3JD0hT7At; Fri, 14 Feb 2025 04:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC3D780A7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC3D780A7B;
	Fri, 14 Feb 2025 04:14:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A74A1E3
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 04:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AB7780C74
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 04:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHV04dsyKO9h for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 04:14:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BBA4883F9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBA4883F9E
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBA4883F9E
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 04:14:24 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5dc89df7eccso2788932a12.3
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 20:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739506463; x=1740111263;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2W7usRs9sqr594daJI11Ji2hcLjy4Y2WXV1MhjHajjA=;
 b=uk1uiheNyhRLDO+kEKU086ea1RnbDlHjoUuhxLQVQsCPvftmGxEye+HKI/o6/1hUgv
 TEAb/AmCH3hyhc1qsNb9BYK5EvdtzP+ZHpOQyOIQ2hXeEmf+5Q8usaQfUWxJvJH0DGWy
 chBlVePaMU7Oc8qOHhmtPpSxO+dO55hg7CWdeLbSVvf9ATOJ0//sT2B5sZuXoMnYrMDw
 iyfq4Z49i9y+u1psFh0csS1yfG7C/RUWBi5FsTj+DfXw1NUFXaJ1TbUthpw/vSnQtxzn
 yxjmNQLFT+LKYiL6QlymMmTbmhWOffEC/muFTk2PkJXwTDs58YWNuwPUBXgYYtQNOQoR
 ejmA==
X-Gm-Message-State: AOJu0YxVAwOln9DlohuJnH9Xd+u1MXdH7ku2EWiQdE753vrJPOQpSabZ
 3m8Hepv0ofW30m+RX2wFYyd006Xyf+GUK+4S8O//RwYylYBz5VxoCSlWPA==
X-Gm-Gg: ASbGncvZExP/w0qgFOnFU4nqMNmnXjCaIvacRiImoeMfqqjfZHAFxCNoqYDEFN3u6AV
 cQ7WSqzDQFDln5biXR2SVWMF9Rg54rKbNIS6XpnBx5MjHcIOwlJCTkLQzKZeuDAXJJGTX1zL9qn
 H54H2vOyCMfprZhZh51u9uv6oBKFZGIMgxOLTPtQxI/HHwAKx4ILERI8kxR0BhXfqJw5Cl2yYgV
 DWzLHRXYIX7seqjoPRnNDsmjDlQWO4KtcOyyVA0CSrJ8efJyfL20xrQxdookgigTMAPGjue0Pg3
 +VmQaY2RFNK4NOaUOJA=
X-Google-Smtp-Source: AGHT+IGJ1PCrCOBVbdwNvTrnXwHVB0PuWa//fQnpePl6hepHqekWBTWlVwSC9kWRPFXgF1o7YpOsUA==
X-Received: by 2002:a05:6402:a001:b0:5de:ecbe:5b9e with SMTP id
 4fb4d7f45d1cf-5deecbe60bbmr434046a12.11.1739506462160; 
 Thu, 13 Feb 2025 20:14:22 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1c43b6sm2239054a12.26.2025.02.13.20.14.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 20:14:21 -0800 (PST)
Message-ID: <67aec31d.a70a0220.3abfc0.5055@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 14 Feb 2025 04:14:21 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739506463; x=1740111263; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2W7usRs9sqr594daJI11Ji2hcLjy4Y2WXV1MhjHajjA=;
 b=HPK3F+eYFdoA4jXzmB0W835kKUnNiDsGHycvZ+OmxOI8OjzNQ+yjf5i3xtEBXsSz14
 4lR2xr5IS4UzxWlpmHQ33vSnTzMVDJNKdvf1L0Bma0iHXpoazw5vgqCjbNmFnXe1nIrE
 WSzi7Df5kCJXhEHbp7f2NCGUJ2Iyj/RNM399b42V+mw4lMNRYVGj+/vuexhDYaKdVtR6
 JgSVpPhOG/crs/WrbvkLGaauQ/GsjaEp4bygijj6O7336xRM0cmv3G0giqcEFiuq0tvB
 yXA9dlPC8n6dmu8gg3DJaPhwTn7cI8VeoiPPljs7LgMSmLHOequL4agVBMsq5TJBKexv
 dt2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HPK3F+eY
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-13
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

Autobuild statistics for 2025-02-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  5  |  0  | 12  |
  2024.11.x  |  1  |  2  |  0  |  3  |
    master   | 19  | 470 |  0  | 489 |

Classification of failures by reason for master
-----------------------------------------------

                 sqlite-3.49.0 | 349
                  ntp-4.2.8p18 | 11
             util-linux-2.40.2 | 9 
                       unknown | 8 
glibc-2.41-5-gcb7f206537240... | 7 
            host-sqlite-3.49.0 | 7 
                 c-ares-1.34.2 | 6 
                 linux-6.12.12 | 6 
           at-spi2-core-2.50.0 | 5 
                   perl-5.40.1 | 5 
             fontconfig-2.16.0 | 3 
            gdk-pixbuf-2.42.12 | 3 
                 libcdio-2.2.0 | 3 
                  libsepol-3.7 | 3 
          linux-5.10.162-cip24 | 3 
               procps-ng-4.0.5 | 3 
                    azmq-1.0.3 | 2 
                elfutils-0.192 | 2 
            gettext-gnu-0.22.4 | 2 
              libopenssl-3.4.1 | 2 
              libunistring-1.3 | 2 
                   pcre2-10.44 | 2 
                    snooze-0.5 | 2 
                acpitool-0.5.1 | 1 
             batman-adv-2024.4 | 1 
                  bcusdk-0.0.5 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.15.1 | 1 
             bluez5_utils-5.79 | 1 
             bmap-writer-1.0.2 | 1 
                  brotli-1.1.0 | 1 
                     daq-2.0.7 | 1 
                   duma-2.5.21 | 1 
                  ffmpeg-6.1.2 | 1 
               freeipmi-1.6.14 | 1 
                 glibmm-2.76.0 | 1 
    host-mender-artifact-4.0.0 | 1 
httping-0e26c53d5fe504eb720... | 1 
                libdrm-2.4.124 | 1 
                 libv4l-1.28.1 | 1 
        ltp-testsuite-20250130 | 1 
           oath-toolkit-2.6.12 | 1 
                opencv3-3.4.19 | 1 
                 openssh-9.9p1 | 1 
                 pkgconf-2.3.0 | 1 
               pulseaudio-17.0 | 1 
               valgrind-3.23.0 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/578d1b022475a117e7c71cb1301b89da77ce00f7 | ORPH
  riscv32    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/728e37afb4aa707939fbdf74c706d5548ea78f7e |     
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/98f38c1f291b32390453e59cb9f72bf583a7814e |     
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/688ff38de4a10e24874e6681602bfea515a830df |     
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/9dc14d3dc0d5a4106abfa227330d0350d4b04a9d |     
   armeb     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/7c45365f196ad2418d023760926f5f71d39b70da |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/608b31721f9aed0e00326444eb062b40b60579a0 |     
    mips     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/01ae1a290d3a2dc084e1af1911ce3927c57eda33 |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/96859808033692de0199c499ad3c755958554ff8 |     
  powerpc    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/6b8c6826446eed60741e003c0521bb71c3906796 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/dee19199652685f13143ffbaee05f38540fea9ba |     
    mips     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/ebe6edde171868711bca8cb00b65f926c539fec7 |     
  sparc64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/e28e70b46ff3dcc04906d2c53236fc07df7bbff2 |     
  riscv64    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/78b5e4a389eb0e37fac72f3c0b248534cef3d8ba |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/aa0b20da1e51072584e190db9c95c98b621b8d7f |     
  aarch64    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/abe768c416c3e7f7e1f30631b7bb96ee34b95193 | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/9735b86f2d351f4e61b4bc8235dc522ede56f2f1 | ORPH
    arc      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/1461b423ea44c12fe91c97030bd4ded4da0e0ce7 | ORPH
   arceb     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/86b0fd8ecaad8b95d3acd918a73c291d5217ccda | ORPH
   xtensa    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/625de4f5840f44f37eac10423b20de95651f011d | ORPH
    m68k     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/1e281f12ce3009945bce3c34a17924e15ecba64d | ORPH
 powerpc64   |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/f167b6b1d6843d42f7f286d7ca27938676952111 |     
   mipsel    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/beb4406bfea626b71b9e7022ae18752a8ab6b5d6 | ORPH
  powerpc    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7fe1fd50e238b470b9f8eff120d662bd2298860a | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/72599610e473dbb4c5654bd4eac750ec8cb7e5a5 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e34ebb024a84c4554e4e7ba0358f57d49d752dff |     
   armeb     |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/250b209122969c009fd306da9e611c2da147555c | ORPH
   x86_64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/1d5be186470ef265c7f3b62af58a1a579d6e3c30 | ORPH
   x86_64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/1bd1a8d713190b132b8bbbb6f6b76c0b1ea75f25 | ORPH
   sh4eb     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/2d4e4b45fb62f27aac05f0658d7641ba5fdca796 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/1be44adc21fc6609dd8ca2851fd62a57ee9fad6c | ORPH
   sparc     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/182af5e3c8578e67496789b7827eb5307e1c877e | ORPH
  riscv32    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6a4e2424273870f0d42562fcf4d91cb556994113 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/fa5221f8a1e27b3213e55ba69f284dfb58aace33 | ORPH
   xtensa    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/c0415f13a7724d2acf3beb13e8b3c482f57aea9e | ORPH
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/15a4c452b505b7bef9fa5f0804d056070a4cac37 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/1977143fc873037d9b9ed3d91f3477a11d7b5dc0 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/ea23523aa639984f3f886a70b2e58d5cd88baa36 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/9e43e7ce5e4641c074a79f21be9d5b1af945df5a |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/eece098a76f20b37ee21384763c1c708a89557c4 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/7ec176e03f535febb3c678a9816e698db55910e5 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/24db0e2f2974192c2f7d350d06bf3e223e0e41f6 |     
    or1k     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/adeefa82caa53cbfa8ca96de7cda5bbe8d4956fc |     
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/ceb65a53757dc97b5b44ee6cd20076dbdca2a534 |     
    sh4      |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/b522b0ba06c2b6d595c7a2e7eeecd9cae03f3e76 |     
   mipsel    |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/44970687ca53f8f9905d8c179779ec20084841ad |     
   sparc     |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/17a63481d0be70778a1da5a2517db2e25bb5eed9 |     
    i586     |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/4219705d1397e98d7468726d5bfbb469508788ad |     
   sh4eb     |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/7b26a8ac570ee004cbae8741ea5b318c1db8dd4d |     
  riscv32    |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/730489b797dbd1685a416777aa01751882259892 |     
 aarch64_be  |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/68db146c7d93b9ea7b332dd52cfbae6662221f15 |     
    i686     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/fe33a0d9cfa242cbcda0c5fb759b84efc6662097 |     
    i686     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/94feefc19f58f3c2430cb8d48ddc725cf50c9159 |     
  powerpc    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/e3f2c318cdaead11dcc6b619b5df71bb61db011b |     
   armeb     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/992674f992cc29db71f2fad0bc2f91d0047dfa58 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/142d235d3cb72fcd2ba7802072a7eaaaa0c24507 |     
    arc      |        libopenssl-3.4.1        | NOK | https://autobuild.buildroot.org/results/5aba838d7dd6f88c8638db215905c394ceed89d0 | ORPH
powerpc64le  |        libopenssl-3.4.1        | NOK | https://autobuild.buildroot.org/results/1f8a775dc0e7a3b9d21043ade78fec9390262c02 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/5e197dac79abe7de531c9b050063e9e5096e774d |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/7f7662bf141e83019c7ae3de0001c6cffaf81c18 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/943ef92016649a30924e61e704ad76e4851eccda |     
   armeb     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/a155a54b30f6cb02d74687992088f543fa63cb74 |     
   armeb     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/dfe061ddaa9ef0b6e39b2da20858baa36ae1fca2 |     
   sparc     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/fc2261943d42092e904ddffda9c43d8f2f54ce82 |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/3100ac578f2427d5c868afa3dd96c327b3b32c77 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/c2ac2f56bf8eb5b1b45cf194d60ac27952da8a06 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/2a07e8d54bc27d5dedfc7713f162fb3b9a9aafb5 | ORPH
   armeb     |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/480ee0f7805d6ad90d716026fdf863279c5a5f89 | ORPH
    i686     |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/cae0968a92ef4b53316f12f621904f61bf81ba29 | ORPH
    i686     |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/7d1b8a84eacab73a2c312bfd51e7c606d5c85dbe | ORPH
   armeb     |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/912199d6c09b46cd243ff4e177162e60d87ca859 | ORPH
   x86_64    |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/b3325d8c5fb5d95a11d1de65d8d3914c83bb2d01 | ORPH
    mips     |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/6a562c52f14d1f5ef16e8586c702dce6dc0bbdb0 | ORPH
    arc      |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/d4049dbed85c5b41b065752e3af681d904f922fb |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5ecf2f444e417237090eea1b3dbddbb2c4d2e904 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/493321bff21c42afd90fb52f001abbc20b91a650 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b7aef7a35d56f85ee4ea0282f3b7b18f23c3d14d |     
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0d5cecd749ac72e20e3addca8aac0d1ff6c55c0c |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/84fe40853569da012428a088f0f0c94dd5cab2fe |     
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3ffc9fbb30d08bacafaf830216fd117676d19cd5 |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/cfd913431950b7338bad961ecc1f78aff113ce62 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/03001dfc1c410b2bfbfdd75c1fde37c7c8e2f970 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/da5ee9ff38e5cd1140b26bdeeff9313a8b4fe342 |     
   mipsel    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9342230f5d265538b5d80210c6a46937154f09a4 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/332bb852fdcab27dcc9e0add01b8e79f79addf1f |     
  mips64el   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/87a660d72a0877b63235bd4252c8667230d8140b |     
  sparc64    |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/31fb7c1b06f772e779516f62af229c2ff23e3cce | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/471a97665f1ff9ecea42c735b270702b2a46e720 | ORPH
   mipsel    |          pcre2-10.44           | NOK | https://autobuild.buildroot.org/results/464382494898d4a4568a1df5a3a401899584b338 | ORPH
   mipsel    |          pcre2-10.44           | NOK | https://autobuild.buildroot.org/results/511649ca9800ea4479db4b810efed3da8f46914a | ORPH
  powerpc    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/7700e426e92637955f972228fa23926db84b7276 |     
   armeb     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/dab4951567e917bc1e0c59b3f785f2c063367f99 |     
    or1k     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/6203dbff363daa05299642c66c29262fa6e39250 |     
    i586     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/baf3e46bfb4a1ae9c6084e33aba9d31838e916f8 |     
  aarch64    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/55220d21676e24b3cce1f1c524dc363a56954d39 |     
  riscv64    |         pkgconf-2.3.0          | NOK | https://autobuild.buildroot.org/results/c4fe8ee7fe9975d858619ce379040eada7a7d647 | ORPH
   armeb     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/15bb13f5e9c38f15f1ed04d7c355842727c4e47d | ORPH
   sparc     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/8067edcdb1fad9fe5996cfcb9823022b7147317c | ORPH
microblazeel |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/3c9acc12882b801f5054f97598dd3841f708df4e | ORPH
   armeb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c5531f9104cdf1f64493fd14f92142a2bccaae39 | ORPH
  riscv64    |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/6d88427d81ad1e86d72ea38642015183597b9598 |     
   x86_64    |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/4779a44580d16cee01d3970f1099e75f22a760a9 |     
   sh4aeb    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d3e1411289ed1effac0171716c2b32d2eaeafba3 |     
   sh4eb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9e3fbf825e03a4252c8107734db011c9562881a5 |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/acc3de7519936fb53d3fe87052205dbcf3e13f05 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/99d60a040e8fa83eb5cecffe832260d51c5b6b24 |     
  aarch64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e64c3922db0628bbc5d1e7269a449817b96c17cc |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b7752465bb2fdb84a337f7285df5b8d95fccd60b |     
   sh4aeb    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6f8e1216da5476d3e84e01365497491b14f3741e |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3d1570cb8a089770927044a860701f2bf11be64c |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d8da351ada143ff5d29c3476d79c0cb79c1376ff |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/44748aaedcc8db17a56c009fb19c5b7a083213de |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d5db67f9a1c774f55da391ffb0483dce0a348940 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/af3826b12bcd767f3d4f35ef5cead4796dc14607 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/634958c4c7ece77ccfb0bb03e06bec874819fe47 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c219f429b01d68ddb74e7d780ca7217e712af262 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/504cf4b7a03f67591bf0ef00f1bac01a81ac306a |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f065caf250cf2cef461195f1da40727e0d249687 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/981b80626bcdd15c4d8d49db2da0db76775a7ced |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3f645a6014b6245c123a4ed223a18ebfd8eb7c1e |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bffb4ff029487cfafadfa9458823dddc8766352b |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/aae95dc83e324734708ed9a13062329c5b108262 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/879882cb3335b29a8d6c7fdaba5995d544941557 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1e5f904ae09ba4a33d817d9f57d792444d79a296 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7b0f1d550a6e6ca6bc8f71566e246e32a5b94428 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/09d4323390be99c9cb2bc5217ebfe1852a7d2efe |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/951a46316bc9c4555c97f57e550f074efdd405c0 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2dde0756f79210e7b189be7e9d59dee913fd1ada |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f3f11894c2026855112e7ffef553ed4788e5b228 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e60b3880646aca77dcc9d3ef3b4475f36a587f74 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6f8f9df84397be5a356ce679d58c45a3868e8228 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bc4540de2700e3059d1988ddb9e39c337a72a453 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/32ad0410e7f2f42195117c3476dd27bffeacbffc |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4f3c13c40276091a45635a1cff5d98008fe2cce5 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0db240c46f5bd63a5e8b67302c2979151e459014 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6b77ed0850b7a8ff0256e44635fbc798515f3460 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b53b09b9fbedf7f7cebd15c8b26a114698dcf07b |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/25d1e824c184649d79f75f1085c22265d8c02277 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/28535ee44bb1bf7f09b5af3f11b86457da9abc91 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1cb94373fb95de6423929420f97980d6f4e2e934 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/dbe2a800ac42eeac49b69156e013db9c6f378530 |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ff0be9bf8c6fd0e18c635d493423a38edcf34b18 |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d330184bce638e3b095a6a194f237b5f6903de68 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/fc568e9a2c128f4d3a27ed174dc1cc48de719fb8 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/fdc633adfd31c994d65e826f366b7df9d3209a5c |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ac58a8bf2ffcf2824775164ce356ef202e2ff355 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5f580b871c59b9a77ec0ff6ff71da6b8565eb03f |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d5ebb949d460f27cfcf79a1b48b71e678e203a98 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/64933ab214c0d85470c2901afa8aeb91fe558fde |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/73b0f59608399eb487145a617bd0ffeea5f91e89 |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d18b7411dc901bcda11306a2f86cb54050b9f6b5 |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/681bbb64c378e48a6a4e49287fd7c4cf2d988751 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f4b5b55d3e09656c630cd31c268edf70c16a8ad4 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/08cc3db467042a8b4a1612a8f8e043a9349340c4 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6460e802df8943a16b62e56ac3e6d0edaa1fa1e1 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e3a190ce856f4384982556952e29dffcb715c4b9 |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e7a99357c36fa3932b2d764f38ad00d129fcfafc |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b63845b24d25763b5d9cb99e843d20ed9cb68a88 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cf796978ed75e4e776696d45a7afb7bd56f69090 |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9df31631744912dc1f81240300cdd38c4bf42ec4 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1ed7143fcc397ec638d151d79d94e49d2612523c |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/dab00dd31a86d571e6fb11e84c1c91d40464ddae |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6e828df2f79b34f583b788edbfecaa3d2225d05c |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/22d536449bf4300a84cec5ce0302fab1f4c5834c |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/14e3038ae6d5bd6db578ba098a09ceaf799173da |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e691aa6ec9cef8eda9077639c6002a3951d21bd7 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5d96f8d31e96d31d21ff5fb4e7d7e896de843ce3 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cbb4f66f6a346d12a0994ae703343447d3100276 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/103218348c2d4e941d6ebf0d07c52005a552ac6c |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/239e76ebf06450cc15d8311a05fa3e4966d3d62a |     
  riscv32    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d4f3157d019f90816cccfa9c89e98eacc227df36 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5e39f5d1905fcb71b5fdc7d20365cd1ae57216a7 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/aa83677377fa7ea515bb87fa1f8e160d2e9abcb6 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f22fea2202a196d193719c004e05a43594ae38e2 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4cc2ab0f4c6345f15b429196c4edb2dbaf9aa875 |     
   sh4aeb    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e0b3a42aa76e39bb1849f4a0ca91eb0346079123 |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6b2e275fffcd173f784c8668f4e7071d5c4710ed |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d2b2c78e205dd02a77d491a213234d5676ab4099 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a03570acb38990889ba817c42ef4080ce3ccb1b1 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d7c6ef4a02dc24eb3a5e7e25be58968eb0c26916 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b93c18a87493baba87d54b65b5eb3356f6413035 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f12cfe93d0295924ca6fb0533553f0127eeda165 |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c585719363c0bbd32bde968cc5e10f2afacebb14 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e7df3e1adc9c6215deb82bce37555b623b4573d3 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1917ef99a5a91a843d1cd0700e40a2cbd97a4811 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/72d6e681d35a6b937c8b397c0442b6d7ad902117 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/36af21c11d97f37299b50dbe4639d781008e93c6 |     
   sh4eb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e818d3da0ea4dbec3fc41650b2396333e003c8e0 |     
  aarch64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3eb3f361f73e6b5ae39e36671a7026ba2dae222a |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2865a7ebd939c98f8742bd7c44673ec86e2cbf4d |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ccef398598312b827e35d6bb3fdd72ea94f54800 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/55b04e5a55137ca9782f3c43f83f8caf77a60015 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/58890187dbe977370290043a276ecc24fb356d3d |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d00774c98d16fcfeb44882abd42a90bd91a5c2ba |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/93eefb913d47c0f4c59d72cfef77c6c640e09602 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/47d6a5ce1067fb04bb806fdbc33ba460674cdd2c |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f793163dc063d78917bcd71f2c68a9561f169aa4 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/79611e45f608bb35ceb397a9589859f19369e007 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/afc5597d32a333003b0c7e1e162d3ea92ab777fa |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6ec38975b5cd2670dff96eac0ffc902624c77125 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/dcdfdd14cccb1cfbfa1b41fffeb967f5056e7a2e |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/564343990bc4a6ff6f38aefc07b470ceec2efa08 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/eb6ae08b35a6b7317df753498dce9cb10bd0ddea |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f21613288c2244e0ca340754792856cfea3d3b6a |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0ca31bbe9cbeda4ed7ceebf62a979cbdd5bc4097 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7857a3115198c9d4e48ca9191084af3d469dd3d1 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9b1af12cebbcd7da75a00acba757d631bd396181 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3248db6df67cf8ffa8237fc82bf2696268d54d0f |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/af038744fce64333cf93b9d1bcf0634c01142937 |     
   sh4eb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/778932f5f4010917d34b4ec1a9d7e5c5ef3bc96d |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/40c51a3751476e3b481e96fb74a75a6718a67ebc |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bae2b17a2d33ff302e67c28623036c229375c1b8 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b9e8cc1a171c0e68a7cc07f4f5813794b53cf188 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c552bb4ad1b64ea300c6bb3137cad84f561d15df |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/eddd1d1370dac98ada8bf0a9f33d464c7438319f |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bb0197c12e402b5a767be1ab51f618c3e161d35c |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6aecdeb6e64b9cc7ff22e67a317529b07764058a |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/32b94dac68d27ed690f4377bd8e8818b54bd2ae5 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4212c1b32de5d9a9761d0b6fadbbca7ad46ab953 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2fb6c5261d2533eae4264ffcf1fa449d30285d37 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/23b8673e56de57164191547866d17e181f162b53 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/007f5c6de91b9be7c52927c3f150a4d73e56fd3d |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/de7452caa47d843d727066c498fc256b66321aa9 |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b12390e2638cfb64389777580418727c896b385c |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/eb426f122e776a9845ca9b27dc73fe55ab1a58a1 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8e090151c005536c971083c624969bb3388ec43c |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4da265b947e19a7b274b8dc4ee2defdb44c95589 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/fadf62ac8581d6b4e5fef79a4d7b1f5a71269c87 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b04d2a5c62ae6f1f4b2f22f735e85d6198a0cfef |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c6f590124aeb2950bffa269444b0a53005e9146d |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9c4a7b8810ff9b8e81c78ec5e341ff22cd21f6a9 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/35b5082af8728c678c14872df9ae8415ec808954 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/00c4ee74e286212a52a2a6043cd6da30d1ce6e64 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2d8dfe0abfef7389435f35a11eb592190b1afba7 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3e63d3967e10906dfc6e6b168077e519137e95bc |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9f32b49b70cdb7187b074699f2b66e84c56bcb79 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d25cb0d2127462db0e18f479f2d240abad54218e |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/19f54b3ce37562ad78d9ef27f2d7e101c6770492 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6e4c9f7edde5261377e0a298c138cd61c22ac54b |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9262b64deeb19d54dabb143cbb662f2b0c17ca21 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a157a77400a76c5dfbf84ffa0676131e5f116b28 |     
   sh4aeb    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/da5278fb713785cadf5f71a8f56bfd4d63ee1ce1 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1221bf45ca4ca1316f999ca9af861d930a3812fa |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/74019ab76d6098233c04999d3c5d7b0727e68da1 |     
   sh4aeb    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8f528243917f06624f870383b879d3431ec4ed42 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cff4a60f48e09c5cb9b33417fd8b10171b0ea81a |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/aeaceea618cbe9949de71690dd518e1c4763f389 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0a63a11c4920ae6421371a1138f805eed7365390 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/be07b295bca82d8e9180c5626ea1dc7434970c96 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d6623da845618a44b019cbd523f8d74ffd20fdc3 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/25697565bccbb01bc9e627bd8e13bbad4235445e |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4ee1415ab68ffc67c2c3abea5df263d06a9c9687 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7ceb871bc52469fa71de30fcd73d62e90675e4eb |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d3a9d207b8ffd821cf382b3f4d71bb784fab6804 |     
  aarch64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1f888a012181f7dcebb277f88f96be46a5424ca7 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0afdd8c96d0b230cfbe9f9e0c67870610893c29f |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bfa917dc8eceb5367a67fcd54f397ae8ca70de46 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/97f97ad1b07eead5b232c36a409d94a04506376f |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8a139754fd1536cbdab5cafc600e4198609ea8d4 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/168bff9f90aaa447687616fe99f8c1ba137508d1 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ecac041185d1c8ff5ddb1d3f60026c4b14af9a0f |     
    i586     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d9a6cf5dbdb786cd5de119311c16f0d1f89b01cb |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/be2e5a078c81063881f506dd01d813756dd79e74 |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c609a3ed5bf2620b87ed20641e009186656991bc |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/dc1ea33ed1c7199918ef44c9357a9c6ba55dc521 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6b25e409070859c545dba1d702799a3fd6fab81c |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1f5d12a7ee36bacaf4c1987664b3ac0b9329c056 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/15afdcb67eaf3afea75b220c9346c37c13efedb5 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2036914bf9dafba4215033a41125d3ddfa2d6052 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e58115a35ba650ca4eab00ba23f2f725abecb4ee |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ebe2043279cddc13cb01b7720841cfa7b3d08c12 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/263d055f4cfa3744f319aef331467ff97c6ccb0c |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/06d146a9577831eb3dc7fa4ffa505d1e5377974b |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b79f058bd03abd4300f68551289865b1416d6f3b |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e3d1c4e170052dfa1e74f1999a2f581a1a8e96e5 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b4d32e82c5175d130d32036e3a0fc995dc12d607 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b173e8294175f950cfe30eb7e2608f352ba0aa9c |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/344dcfcee92d6fc67fe5f23754048b2b6c67187b |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a634566ff9edc4e075cb08238055b78155e1c245 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d7c02e8c549c54c70b212424df7c7212fde5ba7f |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/30cd7648355a16b17ec84c5a99f12ec4584e9701 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/76a56127ebe3086f509768424947f84558784cb7 |     
    i586     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d8e90ec6f56887f42fd2177dffa6d43b49184fe3 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6681e6bb83a27f9074e56604f73cd6bda3e0e62a |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f3100766aef35a4eb33d5876ca3e8383ea0e94dd |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2c1f75b5bf7546543ea7b74bae002cefcad00d51 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/84be3011e01c8c14715add61f0a687fbc0054578 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cf90dc9c29970e0d27437833f1153dfa05fe8017 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4f01a46f679e6066a40f6b6694515216bfe5f34c |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/53fdd7deb3b7dacf54bfe25b9bd3fbdebf92b279 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7ba6e49ac12389cfb7778416285b5d1bb38f7b5b |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/dd14f684e201d12ba23eecbc39bb7ebeee5274d7 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6de89fa5b8ad4f22d82fa6ea530c0f211a22da4b |     
  riscv64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0fcbf721fad2b36fafca24672a6f1111a99223cc |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/15aaa10dc06e02ea6ae1871cb9587c4d7634d8e7 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/23e3b003e77c29f7aeb7853280c0bb136c49e66c |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5eecfbbcc772beb35d5a484fcd41a6f19ac5275c |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4f81ca78d206853e915bdfac3087036b30533e6b |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8e54cf45651bd57fa66971fb4669141c1811af2d |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0178c6b5cdc083d8a01834c9a5e94c3ad8b14b56 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/48fa990c00b0ca5d30f697d224a0b4d0be72c6cd |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/55c0b94349559feca18f2a4513bdfeb58c60ac69 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1ad49adb149948fb0b77838c5982a75c3985d3f9 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e7b0de7d80b61075a5b8ccba79fa32ea2bd3a502 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b3accf206cbb54b5daffc5a43410a852ff3a44c1 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/dde0b3de49f7740047875aa4f2b1d12698cb9812 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1fb48468db824b1a9caa5f749e7a744990307271 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c8c03b0d1a7bf7cd1befa8203c6980de9bb86179 |     
  riscv32    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/68f3d33282afe5828efcf7355da69e0153b8d7a1 |     
  riscv64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2be6a2097fee96a590b65f8c11403986c77ae9fd |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a0596498ba54b963badea98d61133f079aca41c9 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c571a4574f3ee8abf927d5bd6b0d8e054e903990 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b8625b5d455af43ea2a48d52015bb9a3f95b84e4 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8a554f5cdcd7988c2f8a96ca1749bce209dbb69b |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a3e44f7305880186ed609e11134a5aecb4bf1722 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/71efa0723267c3214502833765ab86cc9b38e242 |     
    sh4      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f649b471a95e8e8aa17c6ddbe87ec7a80f6a4967 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/544b0a07b7cd2fb500d52b12ce42b83e17b76f03 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/51984b76e47bdfca7fcdc79eac971caad14c230e |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f64ccde0689aa5518012e32f1d38e83fed768ca1 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/dd17bc8d44cc662fc164e03861eee5fa3253021c |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4ee83dc6729999567bc8f888ee19c1af7d57ccdd |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a873ba13ede4e2fd71ef811bc5aea228fa69d301 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0c789f164502f0b3e5b53de14dad2623f0ea18d7 |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ee97843c2356c380c77866162c6f60893b78c0a0 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ff52118a0637b64a1051384104a1e499c916545d |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5912989f0bcc02890a37f9db7317c10770f7d7f4 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e3e288b700568157af8adb28947eff7f50d0f7a3 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c9a84f683831dca29aeed81c74453e767383ccbb |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e235607440bca56f0c6e425fb67f44161298c976 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9c3672d368d53e498b4330710b4be6e762c49d27 |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ba96ad85e6f9911c6895b2a2322b4c983ee11943 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/adc56d45f8e263e3027c082644b8683c45f1f36f |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bc1790133422b6d2b74d20da003d229ded46e09a |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0e38dba5784b0f1b0f5d63ab6bdabc3f1426e555 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0a7ea13b2d83d8225e236b69c741941c3a85f03b |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7bb7293498d944520b62a61251aa44d9597e0d37 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/117eebfb0f80a6d941bd155a8cc94acb306425b3 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f5a5b67df21318b57ec223328e722ce615a99a5b |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/91a844892e58903dd8ed026134a58dce17cfb24a |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0532229538d33fc446ff7f8773618a6b85af4a4a |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2e06e79c59caaead4246db2b17090bc8d0a86ed8 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5d6aab072d44da9fb6defb4857665068dadfaea0 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9d3508ba85f8e2377e5198a64883ef24ffde181b |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/faf73fc5fc93869acd6a52428035d3a6cb1c68f0 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/46304090f6761fd3ca2f06ecb61803ecc833ee6e |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bf68fa4482322b455230e6e9bfdd5786c313599c |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5ab3f8a92fc4127afc56227cee3fa1bfffd87598 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/39f25f53278dd333cf9a4906a4230c72bca6c3ab |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c1d895d482b9cd387cea5597c9ffe3f9e324a18b |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/662c507614a12040bf8da5f212ffc0b04ead4e04 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2139222821b3dde2b17d306b1f23bfdd346964cf |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f46c5f8ddd77a9b43ccbb163b12542167b6278b8 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f12156236905cee3ad8126c404729e9254d3c286 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ead80ab1952b4ef546e58ea856619aa18223cb6b |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/803b8b77e5b52a1366ab8a2807ce022046c00954 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/47e05f9b1055f4a2d25fd32c7351201c2a15d7af |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9f4227de85c221f657ccb58c30a073f55a05cf7d |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/495371fea4f9906a91798125692058b4f4f578ef |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/fdcd864d5df429199d0e7796b0d7dfc783750adb |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f9f6eb2553abe41df3b5a375b4d3c92d65ef8c51 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/652894d6f22b95cf5542885bb8cb6aa6b699ae5b |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/48527035bde640d16813bc5f6007d32941d0a185 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/cc855f1116c4c07ea69fa1e95e0510e2ad345167 |     
    sh4      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c9f79dae1174984b9b5d0d78ceb9b9f8c98299db |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/69efe2b43cb957fbdb1f28aa9b449940c5fca263 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/fe8ee8b3fd9db96742f08db86f37a55d08dd1375 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9da98b507f8efbf68a243c6df4d95520b99733c9 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5204ef58c047853545dc76ed094ce8f4bd08e10a |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/99364499f17ef4fd3d5121c11e4c67d39c380246 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5a7254d2ebae95a94fa89561f36ecd6c5db9bcb6 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/081db260f2750cdd1b466e62ac62650a5e1084ec |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a302bb460520be46dcf8c9a8a35b2f62451b88a8 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/52f5fe2885229caf86c37ca317e761429d185a4a |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/15e6c61a896f2cc6fd3e017427ac53c421af3612 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e8456ae74cbfb7e9227357792a9e26dbea6748d2 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8e119ef1bc45156fd80b7f70b939f8b9f8eb041c |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5ddd8d729a9962bdfeccf241a27cdbe5290a5553 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/850af6563e0cf2f0334da39525beb790ffad1ee5 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ad6967d72df73b609544efe11c866e53eed81af4 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9de2ff8df6e0871f3fe2e9ffddfd16b719ea6014 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/70983b5b25cb50b22b24f2bb69715a7779f904fc |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8fd1a88438a6467a7d253f9f720823892af65f96 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d9fdfd4990eb07717e8f63b5d238d63b78b9a798 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/22925ba75b07ec15626eb243f2c8e0a00d7826ea |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/313c0186d8493a65d08fc8fef2594414d1def5f0 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/448ffe1e11c9979565991163d680947ab3f14379 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3746eec623f0ad64aa385c484b717c1fb5043879 |     
  riscv32    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f309d6b17959d09d6b59bbf324abe3ba0b2e8f49 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3ea7e5c504dc029b53effd8d36d93895f934b810 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c84960c7946313512ca3e7bb70993fb36ec554d7 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5cdc88d72481e102cf8c9dbbad876aaffbaee163 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7b94452e7541a0f92a6ae9a146908c781533c4f5 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/593dc92504851c0be0adc6c078f949f0545368cb |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6c142c3bc57b9d050036f733995173229e6b015f |     
    i486     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/11a979ca29df09dcd851f574539b89402d714fb3 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ea99b098392e0fc92256430359eb6966f38ee482 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/535cf9895cefcfa38368691e9967af7b1eee2d56 |     
   sh4eb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/458f52d0b2c61de0dc87144efb6af3463583e494 |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/5a3603c4629834afe2d2b8018eb5f66dad94ab52 |     
   sh4eb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4d721dbac1866d0285631fcd440e3ec60bfdf001 |     
    sh4      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b2ea5d99bccafa97423b6593af7e852facfadca3 |     
    sh4      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/e991a4ddf85007a41d0501419df5f440d78e190c |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/927fc706a704aab25996589aa424daeb58ad3e87 |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8d0e24241e8c043b017236b73a7757ed6010f2ac |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c2a66193bce42d4b7f876c94b6c5ab3f98a9c72e |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f106eaada99c74a3c4065445a9b76996d5869136 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c9608470c37e1993e9475a1327a0fd0f0ad1ad68 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ee85facef0216cdc09ccbbef1544990cd1655468 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/29407197a501c9e28ec5af400c52febc9284ac54 |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0c1ea8926a4101fb333501ce8067388f96332d9f |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/44c79df0981a194c8d9f8f33982b332b54388c05 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b5d44772640c13c17a1daf7879ee494cc67aeece |     
   arceb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7e3899ea84df1ed2858ce175679cdce4c9b1b7ed |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a1a66e13e9ccd5fa536238ba5421c14cb83158c5 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/7de8c49f227ae938eefbfb6c4c1f436100c0cd71 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/4786e1656f450ef3a993c90009a74394b65fdeee |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bdfa2e2737ef538869f034295e39ce430cec6aed |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0002a6f2743fe581e554591700c220e6457a5198 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/8b35ec01f7ed3e47cb53aac239598d4052acb623 |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c142cdea180dfad8bdc6e016b2ed506808e71724 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ab017324c3844e0aabfbde8813a3d6d8f4aba67e |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/12852d4e8e56594918fc91dca616a38a67b97a3e |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/658db3761323fe1c27917676523adfb27b0e48ea |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0672d7a3be8b02d45bc0e7c0cf0d5e8f1bd2032b |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/aff2a7803de359f06c34b1c55ee9438367c1bedf |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1fb7d54d8e2e501d3a00a6b53ef543050128b5ab |     
 powerpc64   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/983f79e21f5965a84c637ea4f814b9bd758fe643 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/998fb9328dd15a888d263edb7301f87fc8c2a8c1 |     
    mips     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/396ee9e014c4c7d4bdb5d5727e22f5762cfe1c68 |     
   x86_64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c24a0d6530fc3f6b9dc510065707188da9bf65a0 |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/1e4c82329d440269d6d5539dab0a56bbe6f42981 |     
    i686     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d332223f148a8e6cf67ef6ecc50afd1eaa72ef13 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b5bf0f0e8f95cf53224987fa8bf90361d360702e |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/0329121eeb489ea5c7a5ee36967294145a66be84 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/be9b938b8cddb84ccce7ba2f0451c8b775c8caf6 |     
    sh4      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/13e0deb320cfae1730d75a7337d71a749f1e1952 |     
   mipsel    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/750e84e91067a071c8b285aca90d5d7c4ffbcb6f |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f604c88b46995891df77753a4c1e5f92ad947f21 |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ce7f6ac909e53aac1c678ac9be79a24fcc8762b6 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/54934e3c1006d9f2091c01d92ab87f66b945f92f |     
   sparc     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6951a75d6cf73214be5ef60303f49d0c0f622c24 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/c06d0ff978129c524581a4fc2a50081fcd4ac166 |     
 aarch64_be  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/da96b3c5b86d00959bb876a1970f1b86d9db0ce4 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/56015b01478e07672ee6531e03ec12fe4db97a54 |     
   armeb     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9799402d395a6a684c10651d1ccbd75adc7bd944 |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/12acfc25007289103e39a532d437ea15eee532f4 |     
microblazeel |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a74949ae08840c107d1df3d11bd3258fa7193c5e |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b348dbc9f45432cadfa5fa19c11400bb21d5524b |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/22290c8f096950218b3496c889c587f798e673e3 |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d604474a97f032949e7cbc40b6fb62ebcaf8c9cf |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/4675122598dd3937146d0fb1d76cdbbf93737327 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/cb3dc898c3b52200e1bc3a5d59449dc29e0caf5e |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/f2fec2083a11e84e5da16cc6abb1ae7792920482 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/69a1d7e36b76e0c15af3d47d6dcffda8569cb823 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c76526a4304743609e3009c20d2c4ed4e265095f |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b9ea21cd8ffb113eae504ae39cc5cd1625c3d970 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/1fa69b5391f3dda72d332eed20b0918daf7ea2f6 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/bdb3a82ea3a4743a6fc5ad6f221a83fa0c7c012a |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/917771d21b6d96e1366e0b15a1eeeda9ac2c32ac | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0d1bce05348b5e49bbf2d083dc77dc1d897f0fd9 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/edf188cbe72a20a3cf87d0651459c5688bba5758 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2c5fb18f53f93c089c915c3a1ef2158b7aefffb1 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8526f6fd60d2795caff1256453b598567ab56e7c | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/c520fee8387276d479b303b434b4cd6e69225576 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/33945a1d59ae10e2682c3b4ae5bef218eb136587 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/226754c3b4875d7b51688682edff3e2069a1c6d9 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/e8ca6ff285ebc613d546514862cae29f8d17bae7 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/4ba458b855f163fa4d7588e0f29f3169d7231eb4 | ORPH
    mips     |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/828a0353df7652bda83b75ceae4075ea96d00020 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   foot-1.16.2 | 1 
  gobject-introspection-1.76.1 | 1 
host-prelink-cross-a853a5d7... | 1 
                 openssh-9.7p1 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/2da1a1cc0067889b9b32684088ddc66867aff508 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a8478584d07a32c07056e40bbb5c65f6331e952f | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/1aec487bc1bdf0e35e512f206c434a178d769680 |     
powerpc64le  |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/bacfbc17a99295d21daef0c033529ec747139ab4 | ORPH
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/35e77946acde7ec2e8872b4b0fae88d12583930d |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
            host-binutils-2.42 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0bc3c64754d93022ec0d0f7f596834660a78cc92 | ORPH
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4915301234b1af300a03bfaf51f02dc205567331 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
