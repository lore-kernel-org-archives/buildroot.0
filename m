Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF943C5AE59
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 03:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64DE640D14;
	Sun,  1 Jun 2025 03:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kf1TMCo6SPeq; Sun,  1 Jun 2025 03:15:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC165419BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC165419BC;
	Sun,  1 Jun 2025 03:15:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45463127
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 03:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42EA040361
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 03:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BgBs6x82utST for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 03:15:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7468140024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7468140024
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7468140024
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 03:15:16 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a4fea34e07so443666f8f.1
 for <buildroot@buildroot.org>; Sat, 31 May 2025 20:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748747714; x=1749352514;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ye3HxCo1FSYENPfiSMMQJ8gcC9Z+9nvkuisT9D+zexU=;
 b=RTWviu39Nx8vgfI63GyguTmGb6iA9ZXq//fCie49b5PZ2wYEvvds+53XC8RQWAxlPA
 Hc7ReZCld40+XWjWITMKonnmAVyom5g56H1hT2/C5TAUi8wpa9Dysx3t006ESwrIKVQL
 wA8XHuyi3pyuKfssbrhRtWrBYpvBZi4Caom3QlFdefMX2LZPYoMkFqXLNvm0l5mPKlIq
 OzTxG99W/YUgenu0muHxNzrW78WKt8ZBqnjHllV/wCZtDBXq+l38lbv/9B981Oyem6ca
 IkSseZTInoKyma5dr+cuby31MO/14TgvsyGE7kkPJLR769LNs699pLj4G5nn4Nspr2Q+
 5Vjw==
X-Gm-Message-State: AOJu0YxUejzYSbqj4B4zLl2EJpFXzX8knDY1oHa1Wpjt8wF5FlZKPt7g
 qY3p7rEPnRHlm5Kx+7v3JBP3ZxeTz8wlvPZGgZUyQrORvgRzTxhxmf5+/7jr7g==
X-Gm-Gg: ASbGncvdibyK2q8daWJWnTbl1G16qudmidMlasSYYgo1whz0cEDDJmUOFb8MjYS3rQV
 NTLxmA8f+VKpxBrqrFVuD//PC5a7x5CivVHXiOLvPsfwHjdz13c4KEVslfEAYTnGPKBjt4poEj3
 KHOViFLjXVw6mOm5mb2QDKGY/bSBokOuXxReHw25jEKPV4uIuAStmE0jriGo2SYv6Canx5AcOKj
 jx48SbbDYUwsNq0dnEWG5NelQSDyuh4/X1a3WYPFgd9r3dmCJrU8yfaojhwaAuR6RShWrDC8Ofg
 Bi66R43RhnV+UEuOEmQ7hqdy/i46EjksNWPEEl2L8fF7brNwyVzquhA=
X-Google-Smtp-Source: AGHT+IGkN0QZpVSsx/ybVUCNExhDLV1sDbsscpMeqRB2OiJOPRpZNYsq23T1w/oFueqEnVvSZPtc8w==
X-Received: by 2002:a5d:4808:0:b0:3a4:f7dc:8a62 with SMTP id
 ffacd0b85a97d-3a4f7dc8a70mr5004960f8f.0.1748747714071; 
 Sat, 31 May 2025 20:15:14 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f009745esm10133607f8f.71.2025.05.31.20.15.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 May 2025 20:15:13 -0700 (PDT)
Message-ID: <683bc5c1.5d0a0220.1cb9ea.d0ec@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 01 Jun 2025 03:15:13 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748747714; x=1749352514; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ye3HxCo1FSYENPfiSMMQJ8gcC9Z+9nvkuisT9D+zexU=;
 b=Z9RMPgbH4YyRfTIrdhs9uy4iKeU/wKlhcuShZ7ZQs3RzLDwwuul7LKLKsR6Ttgjy37
 CStZOWuoJ8Q91VBgckVRvHrz2w4/TW84QLEV2yLqI4yN7N543OfM4fwlwQphXICoa0xB
 V/1x6gAC+Y8GLFbG/HXnNcJdH6jldbd0dsZGX88QHC6CMgkiqDJXYkxr3THXQMVTAPft
 oTv2ZyGvv0gPnVyPh2UNej8Mzj1TkEdQIfWHx/188yfTrQe4ENn8Vuw8FS1fQdPGnqs9
 51fa8xrz8zaEvKplR+HxXNPPOSaJayBexQcHPyu5qQubKVSz54BzSzoQITvBQvOWtX9l
 So/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Z9RMPgbH
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-31
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

Autobuild statistics for 2025-05-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  9  |  0  | 12  |
    master   | 14  | 116 |  0  | 130 |
     next    |  1  |  8  |  0  |  9  |

Classification of failures by reason for master
-----------------------------------------------

          host-binutils-2.43.1 | 13
host-binutils-arc-2023.09-r... | 8 
                       unknown | 8 
                 uclibc-1.0.52 | 6 
              libselinux-3.8.1 | 5 
                  cjson-1.7.18 | 4 
            host-binutils-2.42 | 4 
                host-gperf-3.1 | 4 
                    bmx7-7.1.1 | 3 
host-gobject-introspection-... | 3 
                  bcg729-1.1.1 | 2 
                elfutils-0.192 | 2 
  gobject-introspection-1.82.0 | 2 
host-am335x-pru-package-5f3... | 2 
              host-rust-1.86.0 | 2 
                 host-tar-1.35 | 2 
               host-vde2-2.3.3 | 2 
                  linux-6.14.8 | 2 
          perl-net-ssleay-1.94 | 2 
                    yajl-2.1.0 | 2 
                   avrdude-8.0 | 1 
                    azmq-1.0.3 | 1 
                   bash-5.2.37 | 1 
               bctoolbox-4.4.8 | 1 
                  bcusdk-0.0.5 | 1 
                   cvs-1.12.13 | 1 
                      dht-0.27 | 1 
               freetype-2.13.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
                host-acl-2.3.2 | 1 
host-autoconf-archive-2023.... | 1 
          host-automake-1.16.5 | 1 
        host-berkeleydb-5.3.28 | 1 
 host-binutils-bare-metal-2.44 | 1 
               host-gawk-5.3.1 | 1 
            host-libtool-2.4.6 | 1 
         host-mariadb-10.11.11 | 1 
    host-mender-artifact-4.1.0 | 1 
          host-oniguruma-6.9.9 | 1 
               host-yasm-1.3.0 | 1 
               libde265-1.0.15 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                 libiconv-1.15 | 1 
                  libnl-3.11.0 | 1 
                libssh2-1.11.0 | 1 
                 mdevd-0.1.6.5 | 1 
                 netsnmp-5.9.4 | 1 
                 openal-1.22.0 | 1 
                openocd-0.12.0 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                   pcre2-10.45 | 1 
                    polkit-125 | 1 
               pulseaudio-17.0 | 1 
                python3-3.13.3 | 1 
          sane-airscan-0.99.33 | 1 
                setserial-2.17 | 1 
toolchain-external-bootlin-... | 1 
                     unzip-6.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/ea5df138cc33679019aa541f40c275103d89c67e |     
    or1k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/ccf592eaa38c48b98e6f45542eb00da6cf7f631d |     
 powerpc64   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/24159366d239af2620ab08f1ba0e81956e3986d9 | ORPH
    i686     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/2bf2e11154d2add8576f0e6ec44373ace91b20c0 |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/944427d023357333916f0e900a1ac7965536d1bc |     
 powerpc64   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c9898486165a4671845a3733661982f4192316fb | ORPH
   sh4aeb    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/0bd76b28606a9c76666408eac063ec3527db5b5b |     
  sparc64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7625a6608a20bb405efa28c103b7a075626c8dfa | ORPH
   sparc     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/ee5e10ded43538904f915b9a4b2386529c200554 | ORPH
   xtensa    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/06c6231cfc6b47aa59b718f2949e9162b8a6dbaf | ORPH
 powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/f14a4fc289b75fab2c7111b23a16d1498b66d24a |     
   x86_64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/9d9b424b0a2eee21d38f11e3686bdd708c31f09a |     
   armeb     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/1f70350660ceb1990273e92278ff95919dc1d6de |     
 powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/efb919bb22abc4eaf47f1972ddd70cfc11ec02da |     
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7f8407991c2b7ca23237c7e2674783559728b241 | ORPH
 microblaze  |            dht-0.27            | NOK | https://autobuild.buildroot.org/results/0639b4d8545032ee15d5b240e6c078afac2e71f8 |     
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/30d5054a78eb692b528134ab587d948e15a30be9 | ORPH
   sh4aeb    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/8ce04cdd4eb7904d4c34c5515046ca3c11ae22e9 | ORPH
powerpc64le  |        freetype-2.13.3         | NOK | https://autobuild.buildroot.org/results/c3685867b2e2de0fad71488f45f92efc6f4dfe82 |     
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/178312202d97c370eecac4037b838e2a1ff3d0d4 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/65faad43144cd62b8f6ff12020e4afb1dc5b78f1 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/3c9e6b3dd8e5f20d76457477f29f1fed0c46a455 | ORPH
 microblaze  |         host-acl-2.3.2         | NOK | https://autobuild.buildroot.org/results/db4723d17b734a57b27a854b6e907f0dfcc5a03b |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/94367117d130693e2148f168a7ed405f2a51f957 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/a67716b38a8cd382cb5025e8ac0ac4539752c98c |     
 powerpc64   | host-autoconf-archive-2023.... | NOK | https://autobuild.buildroot.org/results/0a00ccc187bbad6da0398909187a9a7aa7d1d0b3 | ORPH
  mips64el   |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/b467f79885080971872bdd052e6dc650246a18cd | ORPH
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/1a0f1aadc7a33d976a93fa65d395a6261cf3bf09 | ORPH
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/499da8fcd604ef6e465fba62f3f4d6f5f911d723 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/10bbdab727c2ce7c3a1e55289b07b6c1a42c9143 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/614da5249cc1642e5caa064fcbfb622551a6b84b |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/00c183ba15b7c07e73aefbef798b1010216f2568 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c07273f4edc098056a4333a4fa284a0b15c9afa0 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1f0a03ad68dd5286cd238def5414482c28872aaf |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/51dbc7b4344922cdaa4bd6f8f7ed99887d2f7231 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d07ad235821111533248dbc4c48643d208496b34 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/12478a6e05434d74ee78160bbe9817c4087426fc |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/440528cec1c14ac55297946e541c34e646030d7f |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/22683453c4fe16f52ed81b80e0932199c9ac6c37 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/feaa5bd64709b2c440ea1e56f1d01facc88108bd |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4c7524f11239588efd196cff1d6447383519fa04 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3ad8f2f5d1adb2d63471927e07e81cda93ffa949 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e2be5922263f30361b94b4ad420631163629dc6e |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2f3ef304f469d6e0726ad54606e9dfe0aa1da0d7 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e30d5a72525776b08b467ed4e735d9c2b8bf9e5d |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d413869e999de87a462bf97a23ca4e3e5da69238 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/753d8a42752ec4f0cb447e25b218cbfa0bf62915 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/6a804010e86872541420ac694b128d2fecebc2f3 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/12dfaa618916c473799f2b9ac83948cf06bd3892 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4c4f562fa4cc33f0ca98b416f4663e3d0d7e16a7 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/8927e484e7bb3d60150f75e451011df50ee170cd |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c2459171544e70243faa9482e0e5d875fd0ad3cd |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c5c454cd8600c43d52234a6394f1ab0e30f9ef73 |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/61c9f544ca9d7af0d943988f4b9054f35f398583 |     
   sh4eb     |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/f87f042a4e0a694389c0917296da2c7abb80b672 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5140ec046f58b2fa1eb157a0101a5e2ab8b2d969 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e7b86ce379542432ae5a63842d833a893c581f76 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/014a1750c7fff949eb584612ca08cfea3b0798fc | ORPH
   xtensa    |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/5a5cb1fc158d78d0517527b800a518868598737c | ORPH
 aarch64_be  |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/cfaa84edba846202943698ff2a244d06fd9e8178 | ORPH
    or1k     |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/5196690d02813ceb55eddf23f1f31fae17a7c4ed | ORPH
 powerpc64   |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/d9c1efb8ad7ad84546a63a814084fcd1ddfcb108 | ORPH
  riscv64    |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/9fb74b3b7d58cb42d0f9f7c60052423bd5f1d0b7 | ORPH
 aarch64_be  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/c0b0462b86e356f67e9420e8172008ecce285d38 | ORPH
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/5399da584babe602f15145a0356061f254baf72e |     
   arceb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/203932b161b4ead4e3fd724a7a3e93f27ef5ea56 |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/d2e7a07589b3dbabf71456f0b85273a862ba478d |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/2d95162faa01eefc337eee4e0529c937413166f2 |     
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6cd678a750bb44c5e28d204fd4be083d4ccbfada | ORPH
   arceb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7489c3720b80226ef4fff1aac87a2aef72d6f017 | ORPH
   armeb     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/2edf1c7beeef9497ca395404bd6c19c98d4338ad | ORPH
    arm      |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/3b58b0c6ca2165822c80fe40575905f5aecc6ea5 | ORPH
   x86_64    |        host-yasm-1.3.0         | NOK | https://autobuild.buildroot.org/results/584550767c0ab93bcb990c7b4433ac0dd7e9552a | ORPH
  riscv32    |        libde265-1.0.15         | NOK | https://autobuild.buildroot.org/results/4e1e26a8d4394f6d183b9007e195de9566b085ba |     
   sparc     | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/07744b67b53d2b25e78e0f61b511a342677e2abb |     
   xtensa    |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/23221793cfbd59faf92194f8737d44867b1af7fb | ORPH
powerpc64le  |          libnl-3.11.0          | NOK | https://autobuild.buildroot.org/results/ce01701d24cb972d23ec944cb073ef6b9c667291 | ORPH
   sh4aeb    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/45307d28d483e8d533008879b4fce4b3b11ef3f8 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ca239896e600a4c3ae9ebc97d92c9384141aa366 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/12c5f026b43cc9eadad6175549c980181b035c84 |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/75cf3191b17e14da63361e3a56fca17eabcc6879 |     
   sh4aeb    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/29ec94b8244da89bec606471db5af45362a11b3a |     
 aarch64_be  |         libssh2-1.11.0         | NOK | https://autobuild.buildroot.org/results/3578a6472487ec6442774b6752f96402f84c8547 | ORPH
 powerpc64   |          linux-6.14.8          | NOK | https://autobuild.buildroot.org/results/276533a72621cd11731120dea59088bb736166d6 | ORPH
  powerpc    |          linux-6.14.8          | NOK | https://autobuild.buildroot.org/results/515797a5218b8f8fc396107cb3a9dace1e785150 | ORPH
  sparc64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/00fcc725d12ebcf1dd81045e8ee2de70a7e91144 |     
powerpc64le  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/db2bc2c3505f769b85f5bb87a5a6055ca48f40b3 | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/161b7bfef6d4f6eaa6b40a621667bdddf34b9d04 | ORPH
  aarch64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/c19aec5b3962f814b2e98b63ea6407865e558110 | ORPH
    sh4a     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/8a7d474d15b63bab52c57f803c3745dd1cd40a44 | ORPH
    mips     |          pcre2-10.45           | NOK | https://autobuild.buildroot.org/results/b126ce58bec1ae0c45350b5c43b291b073d18a8b | ORPH
   s390x     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/2c68ea05a66e9feebf217f4ee170dd727ee5b6eb |     
  powerpc    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/709f181ccb54e8c134a2d3e2700c3738db629db5 |     
  mips64el   |           polkit-125           | NOK | https://autobuild.buildroot.org/results/1aa9be0fce52b5640fc5069950a39d0d6d83470b |     
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/091d23f0e7047d248d47b04948c3f1a4141bf9c2 | ORPH
   sh4aeb    |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/dd4eca74008340d9c112046750351a7ec5363644 |     
    i686     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/30e7bf0f09f57a56ca45c47e04f25b1fdca5ff6d |     
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/831ae687520d5244ba0865485e8325d1cdf40aa9 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/9c9642dac5a7fe382875b18b285b5e92bd3e1394 | ORPH
   xtensa    |         uclibc-1.0.52          | NOK | https://autobuild.buildroot.org/results/4e41db587892dfbe96cec43844ab9f7338271d84 |     
   mips64    |         uclibc-1.0.52          | NOK | https://autobuild.buildroot.org/results/63cb9cacd5079d9b09ad1c86b6da8be43f52ee19 |     
  powerpc    |         uclibc-1.0.52          | NOK | https://autobuild.buildroot.org/results/e76a3c400965cd008edfbda81b874910c06ebd86 |     
   xtensa    |         uclibc-1.0.52          | NOK | https://autobuild.buildroot.org/results/5a84aba7f402a52d68357e6fa42b13f5ef02fb0e |     
   xtensa    |         uclibc-1.0.52          | NOK | https://autobuild.buildroot.org/results/a458da9efa891bc9abb38b113f15c48f82c0ee4a |     
   xtensa    |         uclibc-1.0.52          | NOK | https://autobuild.buildroot.org/results/b704336617dd134c99a96eeb3cd2257e561e1b8f |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/da409863fe46de71ba441a5563b059ca366353a8 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a7076744fccfa7346fe6fbc483c521b7f2657379 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/bf9cf9694dcddf0dca9c74163ec7138bab180350 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/54de0e779f894d69d994271aba437de973a2b4c8 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/205130ca04dd6f0c6cf34fe1e55f37679e7ff4d7 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/d9d8912af6ff9cdffb3f4f00ecdcf4286662d8a0 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/f86f2901d50c8c49b98d96976439c3cada87cb35 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/028380a2b19f1361158f5af89b6b29530f3d6cb1 |     
 powerpc64   |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/e0d119d62270be613505db7a6c8746ab77d2de44 |     
  powerpc    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/af646567b68bffae29d446c6e9dd01bebeb97b27 | ORPH
   sparc     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/2da5357b21269f1d5b708ea0c7e178d8e80975de | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             bluez5_utils-5.79 | 1 
                     fd-10.2.0 | 1 
                    flex-2.6.4 | 1 
  gobject-introspection-1.82.0 | 1 
host-binutils-arc-2023.09-r... | 1 
                 linux-6.12.28 | 1 
                    snooze-0.5 | 1 
                       unknown | 1 
        util-linux-libs-2.40.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/778f21ec9822d8d784653822adc63f921dafc72f |     
   x86_64    |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/d03d3aff2bd7a4ec555e4d76efd9e6016dcb1390 |     
    sh4a     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/2b319e0a821f9bdf8c9afc351fa1c1e1f65f3cf4 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/20fd39e0d8eb73aaeb1eb77cf68c927236db1625 | ORPH
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b52f0469a42d60fe0a4331ac845781467e43f6d0 |     
powerpc64le  |         linux-6.12.28          | NOK | https://autobuild.buildroot.org/results/098915af20fcd1bd3fd261299676cb1a0af6b8db | ORPH
  aarch64    |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/3530b231fa28e09afb331e8f9d594308725c984c |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/01ac6e3c588518dadd2a48bc2e167fd75614af2c |     
   xtensa    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/419fa1e03f6604eb4f3746fdb392703f9bce3171 | ORPH


Classification of failures by reason for next
---------------------------------------------

               asterisk-22.3.0 | 1 
             casync-nano-1.1.1 | 1 
           ghostscript-10.05.1 | 1 
        host-berkeleydb-5.3.28 | 1 
host-binutils-arc-2023.09-r... | 1 
                 host-gdb-14.2 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
            netstat-nat-1.4.10 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/bdf930e93616c8f6dde549b65549d6ef61fc48a4 |     
   xtensa    |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/de86ecd093141af5957894b48e2bd845975a8cb8 |     
   sh4eb     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/8542dd4c33ff9d5ede144d98780a941b61357479 |     
microblazeel |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/d4b32812140b79f2433d9b05898c04dd21ea0626 | ORPH
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/2f3a75eb1327234a12d59aa1fe78d14f34ae3a63 |     
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/95c72ebce5ea668ff162a199ae2d9ca9e04804e2 | ORPH
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/3189c77682a9b80445a45e6184ac632c680ef2cf | ORPH
   mips64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/a40c1ae2a102cd3f527e71d24c84d23d37a25105 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
