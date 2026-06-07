Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8130ACD8C89
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 03:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE1D242865;
	Sun,  7 Jun 2026 03:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2oZiDrpET8Q; Sun,  7 Jun 2026 03:17:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88C46428DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780802240;
	bh=s5ZxqePjzFTXQHlwsngLzkgp9Ei8RASxMOk/dHR0eNM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jz5vlklMDprIUWbOHUKmuaEI47LwrMufRe17y5yqw9PQAXV285OhESY0NxSd42pFf
	 s52AbQbevj6xSr2+pjRyk/06oeufh3xlsVKVMCiEB6FN6QMZsJLhoslF34KFoG/roR
	 VU0eRbFPBtV1CeRSornb/5SZVoCC7D9BbYJNfPW9AzzWs8yNyuPNXOPCRD3byuhMTh
	 dROrUjfA/W/E3x6wjj7C21G4g93UiqT5GA4u6BF5B02g+JIgqmdDKCztbH8ff6dMgB
	 UlH8oTPQvxYFmhF39yppI/6kLyZW+NbvCPm4sk6kuGvSLIhElIdWq0QzSgYjafUeKd
	 j/Hu6rZjqITKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88C46428DC;
	Sun,  7 Jun 2026 03:17:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD26E2EF
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 03:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A843C40056
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 03:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61ajD601sVbJ for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 03:17:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CFBFB42158
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFBFB42158
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFBFB42158
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 03:17:16 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-490be03d47bso25849815e9.0
 for <buildroot@buildroot.org>; Sat, 06 Jun 2026 20:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780802234; x=1781407034;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G76p6M6/mzeV1C2Z7M0hbXwrWt5pncbcERF+pghOZDA=;
 b=Z6L8kmxJkYxdo6o5OOqfKDy8fkrllSZhcvr9X0iREAZDbsOyRjkFfbWdbudrnKFEjz
 65qxg5ayIS4bVAokhjIpNKMhox+Ty9gheCWlCaEVsAexbCWerCGXLzMWbVcqOyIdhJZx
 /XYjfdToZw4DMRlYdNiQmqJdXzgpVCWS82JtuEbi65xjUcB3yBw2Co3ijGIWFm7bCo/Q
 rAthlKJZP3g1bj6CBMchaicTj19F4BG6CLwLX+h/QZ95vAJ7XVep4AriQ7XTSnUN1Kil
 G97GkXqTCD9RyRF1slJNjDO5lU445239TSgNhLDuqWXrgoz6xGopTxoTJDiwaeBNNk9+
 p9Ew==
X-Gm-Message-State: AOJu0YxxiS+1OMhC7mzckNx8Dhgq2j9w1EHIv0SVTzmc8A7w8vTyy7GA
 BuOnUuepSEGAqF2MQes5t9gYcsClcMn+ckoMIkQg/05ym+mfEpSU0Mlmtp4km+Z0
X-Gm-Gg: Acq92OFiPokhNa6pUTEE4Kwk2HpI+HpsOsgYofoUCZECiXhqC8e8nQZiJ4PssWdcznp
 yYGtGYja0uRQe8bPaGW89lzOGrmR4g7LIHZUavJsTW6jooUr9KybPSEm3u112aohB1dki2FEeei
 j/PzNEImQzBgnhkB9go3Qeb4HSAA2RoWVoaaZf0UseP9rQdHjP9lxjoUp8BT57k2LRLtwB2H9Ha
 kHxoZTLiNKAT+8RSCSkRNKxeY1PIlraU5xsMgWsh0aGbKGz45K55bTedbK9unKQgK+l9ln30YcU
 lv3LqQTD37MAROenF9gAMQsGmHdT2c63MFKu8zPBKl6H5l8LnDzSg1bvbKBgY2bIACrFDjVNWAW
 E/9Ek6oNbE9qcIvP+PDk9Z47wIdpyBSQqDEhhsckpoQ7eDxNJvNKmQXD1FwyOqoV2NnubE1ZVyC
 b+0+IHgExPGFqVCDQkvEL5R9vdZEw98qmEhgHJroR8e96Eu6A=
X-Received: by 2002:a05:600c:c16f:b0:490:bb59:63b7 with SMTP id
 5b1f17b1804b1-490c25ff02emr159302495e9.28.1780802234151; 
 Sat, 06 Jun 2026 20:17:14 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3fd502sm276439475e9.11.2026.06.06.20.17.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jun 2026 20:17:13 -0700 (PDT)
Message-ID: <6a24e2b9.87c5160c.27547a.c513@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 07 Jun 2026 03:17:13 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780802234; x=1781407034; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=G76p6M6/mzeV1C2Z7M0hbXwrWt5pncbcERF+pghOZDA=;
 b=SCgh8QQcwjh73vssFjiyNo5B9tnSYOE2AjhFVze3asVysGVxdveQhZnX0jmfjEnSag
 IVbpJ/eEsooZLbeg1ctIk2QtnuP2SD4VWkccEd5bSeaHf9ZT5PMFg21SII7T3px+vt7j
 ZhOvsyrmopo2LiSZmkFTkUoqpbOcLT4qSRFdpZC1hgofz2Gt3DyZ2f0lxGeOMtL/jPPi
 naa7oMpFPnLGT6zbT2yMaziXec7e4yMitiRMTrpsylyUZXr/qXv56bkGQ9/AREK2hoVX
 /ywIPU/HDsT2xDlrP2vumUaHR4SfGy83dGP5JcAzFrAlavY8BC/gY80nAFMfugxtoNCg
 sjKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=SCgh8QQc
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-06
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

Autobuild statistics for 2026-06-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 17  | 24  |  0  | 41  |
  2026.02.x  |  1  | 15  |  0  | 16  |
    master   | 68  | 90  |  2  | 160 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 12
  gobject-introspection-1.84.0 | 5 
                   perl-5.42.2 | 5 
      libabseil-cpp-20260107.1 | 3 
           oath-toolkit-2.6.14 | 3 
                openssh-10.3p1 | 3 
uhttpd-15346de8d3ba42200249... | 3 
                   dante-1.4.4 | 2 
  distribution-registry-v3.0.0 | 2 
        edk2-edk2-stable202602 | 2 
            gdk-pixbuf-2.42.12 | 2 
                   gvfs-1.57.2 | 2 
                 linux-headers | 2 
              luabitop-1.0.2-1 | 2 
            python-iwlib-1.7.0 | 2 
                  stunnel-5.78 | 2 
               tcf-agent-1.8.0 | 2 
             batman-adv-2025.4 | 1 
                   bcc-v0.36.1 | 1 
                   botan-3.5.0 | 1 
                   ccrypt-1.11 | 1 
          cloudflared-2025.8.1 | 1 
docker-credential-acr-env-0... | 1 
 docker-credential-gcr-v2.1.30 | 1 
              erlang-26.2.5.15 | 1 
                  ffmpeg-6.1.5 | 1 
                      gdb-15.2 | 1 
                 gnupg2-2.5.20 | 1 
host-am335x-pru-package-5f3... | 1 
               host-dracut-110 | 1 
            host-go-src-1.26.3 | 1 
            igd2-for-linux-2.2 | 1 
      ipmitool-IPMITOOL_1_8_19 | 1 
                     kbd-2.9.0 | 1 
              libopenssl-3.6.2 | 1 
                libsoup3-3.6.6 | 1 
                libvips-8.18.0 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                  linux-7.0.11 | 1 
             matchbox-lib-1.14 | 1 
                 mdevd-0.1.6.5 | 1 
            nodejs-src-22.22.0 | 1 
                 octave-11.1.0 | 1 
                 opensc-0.27.1 | 1 
                pipewire-1.2.8 | 1 
                 pixman-0.46.4 | 1 
           python-zlmdb-23.1.1 | 1 
                   s6-2.13.1.0 | 1 
                 sqlite-3.53.2 | 1 
                 sudo-1.9.17p2 | 1 
uclibc-ng-test-132c6134d691... | 1 
          usb_modeswitch-2.6.2 | 1 
             util-linux-2.41.4 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/bc90657fabe53f35ea7b5b378a75a586c776cd3f |     
  aarch64    |          bcc-v0.36.1           | NOK | https://autobuild.buildroot.org/results/4eb38b37d8f0ad0b736ba0f68dedec98ec7c19a5 |     
   x86_64    |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/16d63fe48c1a31e58e62a84659d7bd7efc4d3737 | ORPH
powerpc64le  |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/ded641c63e56e893768c92823c06ea899cb87a4c | ORPH
   s390x     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/029b46ed71e5273d67eb3a4d109997bda45c827a |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0ebcdffb6eb362688d998cff61eb0388278348b5 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/e3ed679df45670e03aefd24bfdde790dbf0bbe4e | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/d4f3b1b5f1c645492907867932e61ab2fd8cf7f7 | ORPH
    arm      |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/b6b988107e14e7ecc9c69ed9cc75734dcf537037 | ORPH
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/a6a8945b7a08ae2ab8f2a7260a0eade65c830ea2 | ORPH
    i686     | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/55e12e412936e56afc222359b236aa424f49b33a | ORPH
  aarch64    |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/aca3a9d26ede799a6567bef47ad756239283709e |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/b04ac6ff3c07afb0b6412baaae8a3845fc73ab33 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/8300818aa148d265c4a93fd0ec915edd6f847309 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/6379c0778453537af9dba54ed70da0061373e845 |     
    i686     |            gdb-15.2            | NOK | https://autobuild.buildroot.org/results/48a588a7e0378344d03daaa68f666ba0a5909b52 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/73932b7b17dca1a19d5e25e9299e1d4f3ead8eb1 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/0f9519f08ead0cca1cecd5890ae573a8cc89f943 | ORPH
    arm      |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/227d00e5b6d070227980ee56bdd66de099f6e457 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d332d0757672fade14e639a2ee171ca3df25b730 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e23d14ed5af48e5eb5e45fd28549a9f939dd7baf | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/eddcd0bebbca3ac08abf164d9ae6d407ad18f48c | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ebbad11073aed8c42b9558e047d7884e2ff975c8 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/2f28569dc0afb2129b9d04dd8ca65089cb01068f | ORPH
    sh4a     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/c02fc828d3822f314ec69770f0c323c781066fa6 | ORPH
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/2585399c2b613abe1f98ac610577980c8afc2a58 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/f72e6f0226d3c338248ce2d9b257335c877f7d66 |     
powerpc64le  |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/b9a18d70f7bbfbbe482d6af108ccd3f537351f9d |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/bb380a3c1d3040633a9e0196e8813ea087b59977 |     
microblazeel |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/f927064f167503873a0c543b9575328c75a2b41f |     
    or1k     |    ipmitool-IPMITOOL_1_8_19    | NOK | https://autobuild.buildroot.org/results/674186ec78111dc5a391c679b741efba4622933a |     
   sparc     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/841c463dc7d87d91e414a1f1b447807814abe766 | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/647eab4a671a12e811c58d2af39217162febe477 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/6258e445a7c8b7e19e04a6d3db61b8724c5db1de |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/39f556bf72db1b33c8a358786b079b10b3dcc065 |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/646a587a0ea873d353e21d0211d078812e2051ec | ORPH
    i686     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/135618ac6fec06f5c812ff504672494be6436e13 |     
    i686     |         libvips-8.18.0         | NOK | https://autobuild.buildroot.org/results/939136765164eec32cf8588912c94cfb4b930400 |     
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/c961c0db27882159e972a8a657378300986fda48 | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/2dab75ff6b321d003276c34409a332f5ce5f1a35 | ORPH
 aarch64_be  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/223e86fed0d6ceed16ed8e01bebbefb08e1c9b8e |     
  aarch64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/93e77f86c59c01e7aa9adaa3467f796723fd6411 |     
    arc      |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/b3dab7cbe855e03a14d0ff2dde7a61f44ed3542e |     
  mips64el   |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/c4989bc577b28d1e97c8e02b67df99c4e7d3bbc9 |     
loongarch64  |       matchbox-lib-1.14        | NOK | https://autobuild.buildroot.org/results/a630e9b6b54adca840040b2a64fb8403437a9538 | ORPH
 microblaze  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/c8a9835fcfb2a418ec0b98cbcd890eca583469f5 |     
    i686     |       nodejs-src-22.22.0       | NOK | https://autobuild.buildroot.org/results/beb07915d6e006ab286560fa626a42fd988f23db |     
    arm      |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/e2012f03939c7e743b4df2c5b26b4bba8424e07c |     
powerpc64le  |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/e4c3b3c2ea72a5ffc40e8ab71989fe5df269d032 |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/b09daf102a0dbefb270b899f423b08538e8aa247 |     
    i686     |         octave-11.1.0          | NOK | https://autobuild.buildroot.org/results/326f08efa4adb06b0c3e461e1dd508d7f8799363 |     
    i686     |         opensc-0.27.1          | NOK | https://autobuild.buildroot.org/results/d46e7d48990fe20f20b23ced8c86081a7047ace7 | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/c5fdc7a9a14fb3e0114249e52732225709252ff3 | ORPH
   mips64    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/db3bf410947821fe6659d15762e2545f690fc172 | ORPH
   mips64    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/688a73fb70890ee04656b65cf3a43c2026dc61df | ORPH
 microblaze  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/b31f4ae2f8de0e80a615cd3449f5581dc990873e |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/b7f31e02641dc5b11bbcfde15a26129187ffecc9 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/8da81cfce10d23025b2f8385f3b6334034f272fe |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/86e0e7ae5454cfe5b1e5b9ed63a9acebcc158e94 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/b377326566b8a603c301ed0012ef831a84216cd6 |     
  aarch64    |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/bd26434578cf85d09523ebda5dc27550531fd07c |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/2c13f9a2276c435899095696a1d2ec88d4f97eea | ORPH
    i686     |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/dc918cb5eeac397f981885cdef28e0b78819999b |     
 aarch64_be  |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/e23ea1e06b05a7f9c7b394403e2c876259207617 |     
    i686     |      python-zlmdb-23.1.1       | NOK | https://autobuild.buildroot.org/results/f85dd2c250fecbc17028f5c4ca7b8c0465109c12 |     
    arm      |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/63e77cad4f5d32eb2ec8f41738a21bb63c7b82d8 |     
    m68k     |         sqlite-3.53.2          | NOK | https://autobuild.buildroot.org/results/bc5e02dd87e745d510fee6700baab834b0b94568 |     
   x86_64    |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/b2a164d530b7ad74c38bb62c75ff82416cf90cf8 |     
 microblaze  |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/e968f6464a54ed11461fda808a18151f90a46066 |     
   xtensa    |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/79341b9200ff251005b9e7fa066719c6ade60459 | ORPH
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/3a397528015121381533b6735d004978150873f4 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/a5facabf2dada8c6cdcbaee548b4b184a27e4394 |     
    i686     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/9d0a0041b1139077a9bac14bb7659413ddbe9ef6 |     
  sparc64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/b5e962231382cbba9fa9b58fd2a4e89963130377 | ORPH
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/5f5fe21d66116bfd41f2e8c69eea47be80418222 | ORPH
  sparc64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/7eec4dcf9ab7489a0d951750ea22741a196c1ad8 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/d768cd698a2e384ce894725447d2ca16dbae04c3 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9f8ab125b2a625ecd33a9d5670c1bf083ece41eb |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/48bc6aa14d2ee33fbfd7247e8ab19ca6d013484d |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4ef66efc121182cad210913d4df1aa4000c51100 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/0683d9aa551d3b027d219a910e75c927e41154f5 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/c1e60efffe419b48cb6639395222211abd2133b9 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/485ec2a63edfa5ccc553b863817650f4dc1fb131 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d6efb2be9b4520aa0c24717d2eddf8e80cf20b13 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/e7110f59255173f691dae3e75fac79c8a887a648 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d3f1cde48e218b14498baf31cb1194cdcc988fb3 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/dc1271fdb68a22453c61df08dd164f10c0463a4c |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/180c14b056ae078bebdc4bfbfb247b479ed7a258 |     
    arm      |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/ad078726f75907f244907d974324d739736e7c57 | ORPH
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/21079dacd2c5d541000e2563bfc0873391c17736 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/2d95f378322f3bc2c6801462843bf38431dc8af6 |     
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/ea82ba4583adbb00d546fe001c66c5890b1d9c90 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                 gnupg2-2.5.20 | 2 
                 rtptools-1.22 | 2 
               tcf-agent-1.8.0 | 2 
                 fwupd-efi-1.7 | 1 
  gobject-introspection-1.84.0 | 1 
       host-gcc-initial-15.2.0 | 1 
    host-mender-artifact-4.2.0 | 1 
           oath-toolkit-2.6.13 | 1 
          openfpgaloader-1.0.0 | 1 
                  pdmenu-1.3.6 | 1 
             superiotool-24.05 | 1 
                       unknown | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/c25a78b8183268c43bda1bd638d3a9d519f3faa8 |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/a335ba43ad16d3f395501a1f4c30147a7480aa20 |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/368ed911bf8935bc0d53593fe626ba79815e1f6e |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e3fd35013b21cb5e43cf42b0e9eb1ef2bfbfd7a9 | ORPH
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/02d97bdad590fe7a3a3d852b81cf7ce229f7afe7 |     
    i686     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/53c3251dcb87fca6a064e5707fc2212801216188 |     
    i686     |      oath-toolkit-2.6.13       | NOK | https://autobuild.buildroot.org/results/7aff3b1ba45c2a40f7ae9f04bb51dc8c7ec90597 |     
    i686     |      openfpgaloader-1.0.0      | NOK | https://autobuild.buildroot.org/results/fb2fe88f585af58c3b08f2481d952dec8d61b0da |     
    mips     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/850355477cb33cf261942c02760b11b621e6ec3e |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/9b4c409e762f6abe36b4e23c45df110ed2af9c14 | ORPH
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/a02fe3b91f35286bc18dafbfc9317cf9be5fe791 | ORPH
    i686     |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/31eb5f650a4420fe12c895d0caf1f60ae4ab0865 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/8298ea59341eff047cd7eea3a9307e186ca04e4b |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/ef09dfe67e8e5361a1b1bf55f0c42691858d8a08 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/6fa424da6b7c675415435b31578e473621b2aae9 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 2 
           crucible-2023.11.02 | 1 
                    fcft-3.1.8 | 1 
                  ffmpeg-6.1.5 | 1 
                flannel-0.26.0 | 1 
  gobject-introspection-1.82.0 | 1 
    host-mender-artifact-4.0.0 | 1 
host-netsurf-buildsystem-75... | 1 
                   i2pd-2.50.2 | 1 
      libabseil-cpp-20250127.0 | 1 
                  libva-2.22.0 | 1 
                libvips-8.17.2 | 1 
          linux-5.10.246-cip66 | 1 
        ltp-testsuite-20250130 | 1 
            lttng-tools-2.13.8 | 1 
                 openmpi-4.1.5 | 1 
                   perl-5.40.4 | 1 
                 pixman-0.44.2 | 1 
             python-lxml-5.3.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
              udpcast-20230924 | 1 
  wireguard-tools-1.0.20210914 | 1 
                      x265-3.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/44f436579b9f0c3b9b5a97cd43810c01d3ab0c5a |     
    i686     |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/875d1d5da04e5023c0f0f7f3e069e1f845be06f8 | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/2b367a3a5bc23b42ee949a98c9dd7ba8a89105f2 |     
    i686     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/38008fcf50c9175385debc6e54598cf65deeb428 |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/5339bad1e1b92d6a089a0948f21256e045872942 | ORPH
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/fc4976baf49c72232f52cb8362b520994fcaefc6 |     
    i686     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/e5526b3e31a526e2a9694f3b83ba64f1ccef2425 | ORPH
    i586     |          i2pd-2.50.2           | NOK | https://autobuild.buildroot.org/results/9c78e978b4ade87f8a93cb94b757968a71cddbe2 |     
    i686     |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/5136b6cdaf9f963a11e1fcb45dfcb7d57b148bb0 |     
  mips64el   |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/b852c7996f2aa241b7796ef182deb61bd81e138d |     
    i686     |         libvips-8.17.2         | NOK | https://autobuild.buildroot.org/results/8fad33500a243ac2ccc220c5c41c425ad6da0910 |     
    arm      |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/9eb0805bd3eca6dfcee0ef2acf742bf3a845c9ff | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/461a4b70d46ab5be59693643024d1a6aebafc441 |     
    i686     |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/8574858069af65af2eb7290d28921edfd9d6acd5 |     
    i686     |         openmpi-4.1.5          | NOK | https://autobuild.buildroot.org/results/e5844884eebd2d42e5ee3dcccfdd2dfbb39c3f01 |     
   arceb     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/7d1e6f7e08ca40979ca093b0d8990569fd1b63a3 |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/df0b4729ca558a44bc1cb021fee39d63c4b8effc | ORPH
    i686     |       python-lxml-5.3.0        | NOK | https://autobuild.buildroot.org/results/e44a92b177ec22df4fb865402d0a079e3270213f |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/3ee4cfedfb9326d7094b03fe10456a199adebcaf |     
    i686     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/fda2a356a915810c2c97a15aeeee39a8a83d742d | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/6e4089fc4f31e8a116f260f78e841d7aa4eed8cf |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b9c8a0704a3a5e7a8b698f9f4e2240f52671ec8f |     
    i686     |  wireguard-tools-1.0.20210914  | NOK | https://autobuild.buildroot.org/results/dcb9f170ef3b1b59a85524a1405b5e12b1884b3b |     
    i686     |            x265-3.5            | NOK | https://autobuild.buildroot.org/results/0cea9cb1b09b4cd49f910edfd62574d6a6f61a28 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
