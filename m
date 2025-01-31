Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59EFC02190
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 04:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACB88416E8;
	Fri, 31 Jan 2025 04:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtaYaRx4iVkU; Fri, 31 Jan 2025 04:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA050416F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA050416F4;
	Fri, 31 Jan 2025 04:14:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 74B5D16C
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 04:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64C72416E8
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 04:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lzr83iPBuzY8 for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 04:14:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 24936416F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24936416F4
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24936416F4
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 04:14:44 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso309133066b.2
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 20:14:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738296883; x=1738901683;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Chwrf9ybhTkpSWXB41FKry03aQSAIf1MeuApMBKXjyM=;
 b=M6FVsI6impjsA3K08JS9h9sBhqtIJ7OxCuhPBp81mc+p1lE3jzp4xaswYQDBfX0nL9
 RXIz6PY3kwev918vUM/j1C5DQ9p1PNDkUYukMn2TQQ9KIEkw7Wg3WdjL5GfZLQWugyy2
 oefVotDFWlehFWz/oUOalGNee/5dAu33LGYrcpIwQ5PZQvvvfYgCRZv9IDHiY4zxeAsE
 s5YoZST4rS6fCY63rsu0JAqjalVO6fMk6NRHbzmr0yeOZD1cvZEL3BqmV9qOv8YQnXPp
 siu2JK3DKJctiM2N7knfRlXkRLEvZU9c5oMv/FE7XOyHIxvk3eIqqiBg18QKrcXkh0Yz
 XWYA==
X-Gm-Message-State: AOJu0YxPNCQVwVJNsw/Kn3RzstFwLOt5Mk814ucv5/Zi+ZkFQN+qyAwa
 8OdbW9Gax6DvUo9r/g6ndsgK5YRa8IIBn67Hg/0IKdOoEQJfp7kaxPmLdA==
X-Gm-Gg: ASbGncsm5BxEhD17bTCe7g7CBA34HYdPkyPXyRuNJN+KAYDSIEQOTuL2lKUwwL+3N8g
 UXG1YHB9LpE56M4C9GvFiRxCW52vEW5GBNp+eJ5QtOx3jMlei+eZRFHkMKKkeOFjXlPpC8WyBf/
 DUr9GM9MeCyTbMNhSgdUFsU3DxLMcflQK3IyzheqR0rdYuFQ1xGNZXvJep15VonOcBB30E9Ev4V
 223v0qEr6sabxuOwc2WCYb3G82Bxpbhon0Sy5fzsai+cqw4SZ8W6SbseEbR55eodnIIehY1rRbW
 7auWJ7ZgnT/g9JpN1fk=
X-Google-Smtp-Source: AGHT+IFfZQlKZMyKgAzrf8+oSuJaCahmK90nONSrSgsYzFW+bVCM9jDm0hGP01ip+XTyQW1vkDY9cQ==
X-Received: by 2002:a17:906:3697:b0:ab6:de35:730a with SMTP id
 a640c23a62f3a-ab6de35741bmr589642666b.8.1738296882623; 
 Thu, 30 Jan 2025 20:14:42 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a320d5sm225961066b.149.2025.01.30.20.14.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 20:14:42 -0800 (PST)
Message-ID: <679c4e32.170a0220.93bef.7dc6@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 31 Jan 2025 04:14:42 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738296883; x=1738901683; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Chwrf9ybhTkpSWXB41FKry03aQSAIf1MeuApMBKXjyM=;
 b=nmUaHb3yMESFOYbM3HYXwh9Qjd//ltt5sgmb/oVRvWvvjjtibq95j3QVe8tAvKCvRp
 zMZJWa0aJBd0GuNMWT+RxIMIyaZTVJcJBHQOg838f9bUvbprT/IDnlMvof0LAiaOjkFx
 pxV/r6M+/RgfYsjIB0kdN67E4BJvJtHiEvSow0/UAfPvt0U1cAT8t3XM/PQZCbfo5ZZG
 4vlylf3h5iuWf5cO+pWVS8x9+QeSygh9TdsLvaxP49VNon82W9NGpEOfNH1t1sNCKe8d
 eAteDZtvwcGg/jyiMgD7O//fbM1DAzdsL8bJl4Cvm1x3W0IOx6OzQy3F8O7Pjn4DyA4H
 JNDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nmUaHb3y
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-30
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

Autobuild statistics for 2025-01-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  1  |  0  |  6  |
  2024.11.x  |  3  |  5  |  0  |  8  |
    master   | 18  | 50  |  0  | 68  |

Classification of failures by reason for master
-----------------------------------------------

              fftw-quad-3.3.10 | 4 
             util-linux-2.40.2 | 3 
    host-python-greenlet-3.1.1 | 2 
 host-softether-4.30-9700-beta | 2 
                  libsepol-3.7 | 2 
           oath-toolkit-2.6.12 | 2 
                 agentpp-4.6.1 | 1 
           at-spi2-core-2.50.0 | 1 
  binutils-arc-2023.09-release | 1 
                   bullet-3.25 | 1 
                 c-ares-1.34.2 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                    dust-0.9.0 | 1 
                elfutils-0.189 | 1 
            freeswitch-1.10.12 | 1 
fs/ext2/ext2.mk:66: /home/a... | 1 
                   fwupd-2.0.4 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
        gmrender-resurrect-0.1 | 1 
  gobject-introspection-1.76.1 | 1 
                   grpc-1.51.1 | 1 
httping-0e26c53d5fe504eb720... | 1 
              libopenssl-3.4.0 | 1 
                libsoup3-3.6.1 | 1 
                 libv4l-1.28.1 | 1 
          linux-5.10.162-cip24 | 1 
                 linux-6.12.11 | 1 
                   linux-tools | 1 
            live555-2021.05.03 | 1 
                  nginx-1.26.2 | 1 
                  ntp-4.2.8p18 | 1 
                   pcre2-10.43 | 1 
                   perl-5.40.0 | 1 
                 pkgconf-2.3.0 | 1 
               postgresql-17.2 | 1 
                 rtptools-1.22 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 
               valgrind-3.23.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/8f063493393ab98590a259bd045723afa99e2950 |     
  powerpc    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/b0ee53b6e4d2c5efee235c8eb0cd3c8192c79bdb |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/76e9b667a909a4d6f62121f657af0af9c499ca74 |     
    sh4      |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/83e9938bfebe73164daee5aee454b75fcf5d45d2 |     
    arc      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/7fe91ec453735e0f97c8cd52c651c41db80c2859 | ORPH
 microblaze  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/aa6f6a759457b104bb83698c3f4681bc739087bb | ORPH
   armeb     |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/5f8b50a1e34b35604be14e9d0854883907500257 | ORPH
    arm      |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/dfcfdbfa47d27c988615bbdd23d805ec0849fbcc | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/5cdfff50b3d4dec56774c0dde1b8667d54b5a3b3 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/6dbc6a185e4052920d1c9751fbc3e1c1b036704d | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/1ae867ef6fbba29784e0ed56861739ca6e5ae0aa | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/709b9bc2e8d11c72e2263a90b1c041818dbab402 | ORPH
powerpc64le  |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/269234579bfb30e3419839385e374b6f0dd359c6 |     
 microblaze  | fs/ext2/ext2.mk:66: /home/a... | NOK | https://autobuild.buildroot.org/results/e639c68825978457aa36b535f513dd0981ddc4ec |     
   s390x     |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/882bdac6526e1628e5cca5dce7bc2055adbaf637 |     
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/70de9642d6368209be52ffc089cbc842a7dcf6b0 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/d8758add030cb8578037acbd38460e4369caf5ff | ORPH
 aarch64_be  |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/4b3c38f64bc6946f6edb64ce381417aff5b64be1 |     
    sh4      |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/3edd1c097d561e500fda0e4ca63d95c415cc4ffb | ORPH
 powerpc64   |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/a875399b7d11b30bafef81f343b91ed9906912f9 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/8c4487304c83b3a214d9be240bc9b9e5a4f79830 |     
 aarch64_be  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/3f4e8269f435e46e9258d8fd95c75db033ac1f3b |     
    or1k     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/8f28387a3ffb2d01292d3705b8deef5aec7015ef | ORPH
   mips64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/d0e1824bdd38c3b2b308a13aefe5033f06eb5572 | ORPH
   s390x     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/0522f051ba6285e595b2f74ddbad86782e1b0777 |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/4c88a4f0192a31f0cf2b87c0bef75d1039b4bef7 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/385c2ab85fe6b5580b40e53d4185901ee1c7231c |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/62d6440a6a70273f456ecf5d8251c45560f92afe |     
   armeb     |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/8cad5d3219dc4c9d1849dd112f6524ee8c6619df |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/6b31bbfe4c5b686ef3b778c7cf7069ebd04b5e1a |     
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/d2e2285c5b8522d73b8551112790c3026b03ab13 | ORPH
  powerpc    |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/1215c35a5cb828a55e36dd2f5e22df32d0abf2dd | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8b5f86a3018878790e57151633efa0371d292781 | ORPH
 powerpc64   |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/ad214e675c0c99ed37bf71074aad7d0a3ec696ea | ORPH
   sparc     |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/7e02edb9b21431d89d38748f76146ff7d167ded4 | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/862bb8c8f23cac03efbf449fa3851b95afedd51e |     
   armeb     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/291cb83a132823bd46628ffc8d81776d44e91e73 |     
 microblaze  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/a79c172e8630c221d336756eb523688978270652 |     
   mipsel    |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/b4883768fce2f53db26f4c23324463281bc428d9 | ORPH
   x86_64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/407ed1a9718a609c2fab546486b3b0ff0d917e72 |     
  riscv32    |         pkgconf-2.3.0          | NOK | https://autobuild.buildroot.org/results/d8302fad877754ac58e7c9cf3128d60e3bcf0037 | ORPH
  aarch64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/32965131584c0bf5c36752eb51c0c5a0d059e501 |     
  mips64el   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/d8b6f21daa66db9cbd58fa5f14caac9b9f1002a3 | ORPH
microblazeel |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/f0ba07be82ff6d1baca4fc718e3d27d13e0250cb |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/f5bcf68c52dc7a6193a05c3b5717ff4415ddc9b5 |     
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3de783cd65908f05f73cb6be6afe300d80d29aaf | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/f7408b9e1d6952a2c15f2e877a83fe119ef466e2 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ec8cd4e58fa9854b8ba45c69951c0bde99d051fb | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/038f85186cb92c821a820dd8fc6e9beaf295b7ff | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/2a14271a19155ba0c897234b87bb6a35aab894d4 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

        host-python-lxml-5.1.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/28f02ca70fe7d4bbdc0d0b73452ffb7f597ddca0 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                 linux-6.11.11 | 2 
                   bird-2.15.1 | 1 
              fluent-bit-3.1.3 | 1 
                 rtptools-1.22 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/9f18dd008de6df024630398de4f83f55dc74cf42 |     
 aarch64_be  |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/2bc5d83fc425fbef775daa0dc2dfc3bd043bbd51 |     
powerpc64le  |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/8d13e865d0e11e348b18bbdbc4704a0534df5962 | ORPH
    m68k     |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/40c3063b5df20b7f14087ab69e78cfb4f2030d55 | ORPH
   sparc     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/4e76ae92a17055fc3389c4b2049d390e17815bbe | ORPH


Gitlab CI results for 2025-01-30
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262284  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262289  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262293  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262295  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262336  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262376  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262406  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262419  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262427  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262433  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262441  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262446  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262448  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262452  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262468  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262544  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262599  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262665  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262677  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262679  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262682  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262698  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262712  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262717  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262735  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262749  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262770  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262868  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262895  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262903  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262904  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262930  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262935  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262938  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262942  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262944  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262947  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262949  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262951  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262955  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262970  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990263019  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990263020  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990263027  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
