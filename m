Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DCCC83F09
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 03:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4496D607AF;
	Wed,  9 Jul 2025 03:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMGyRf9TYOLS; Wed,  9 Jul 2025 03:26:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 441F9606ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 441F9606ED;
	Wed,  9 Jul 2025 03:26:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B5E915F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 03:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D3ED60670
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 03:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evwz1S6FkX7k for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 03:26:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E67CD606ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E67CD606ED
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E67CD606ED
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 03:26:21 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ae04d3d63e6so855425466b.2
 for <buildroot@buildroot.org>; Tue, 08 Jul 2025 20:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752031580; x=1752636380;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3mM1RrZknTK6L0o1hietB8xJ1iVTnwotqZ3K3lRrSA0=;
 b=B5w+7D//rpQ77G34rQwDZUh+LMToM8JP6/LtR81DT2Ib9avj7vEPt1wG6aYX4buXOM
 IyRK0uHxTlCpyOcOidVwUXn+14ZLWLSnJxzIkJfPb+Kr6gsG5tc8fuWEARFvVjJwWYdZ
 +pnR/pSabhcGav6o1dSCFGqxeaAHFe3QgBvH99tBZEjnnbFkr72HFgrQfWsoMbQrUH/9
 XhnBST50dXZMUtA1Vz+kqnSwiazndvevBPCeuIG0PlD90i3AZanPfitbJ1Flmizt7EKy
 PeALTDhtv+HBWwghnB5o6zKHRIIW22BU+GHpjaOtYgjHrqsEB7kVbqLGBS8nG5Niu28c
 zgSw==
X-Gm-Message-State: AOJu0Yw05bg4XaSCEDUotVe58QXODtsY1A6jVr/Upfx2p3i9u32bPzRL
 tsiNYTZaXPMLi0bU+tjk9Zpq5LsL6Dg3lI8hmtE/YpduHNvhgMok0gJALA1fnQ==
X-Gm-Gg: ASbGncsOXLe4cRHDfvdJSppx9ZlbjoZnOLVdeOLiAmfoWHGQOVZ8vvjY0Z6pVIMA+3X
 d9H/PRg8txAxYNPC4fY5PUROx25ADwZWcQYuXuLjnHiOYH07nwE63clgQ52dcGkp+fWXlGRDAFl
 Zrw8s39C4vVbl87tTR2GigXijA6dKVwKyzxgcmlWju++gWrZ58ddeKCrj8JAICEr1KvSPXa7SLF
 VuctWqHLHh7/07626If1dGvuX5zYsPbWCPiud0d/p3PuraUzScU54uzajv7QAT7R9VTKUspyfGf
 /Pm7CT1HZ5N+Tv500hIUKNPnxkWfqyUATZDoaiiz+8lRtjm+N993P8h6O3ZbOWtltQ==
X-Google-Smtp-Source: AGHT+IHc3ns1gf5i/r5pNszt6fzHBoDRF+KFepAcwjK/3DQj9wtF1I6UPt8r4pheppJ4T/794kCohg==
X-Received: by 2002:a17:907:3f19:b0:ae2:9291:9226 with SMTP id
 a640c23a62f3a-ae6cfbd7b14mr85712466b.59.1752031579586; 
 Tue, 08 Jul 2025 20:26:19 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b5e6fcsm1014035666b.146.2025.07.08.20.26.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 20:26:19 -0700 (PDT)
Message-ID: <686de15b.170a0220.bf232.a7a0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 09 Jul 2025 03:26:19 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752031580; x=1752636380; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=3mM1RrZknTK6L0o1hietB8xJ1iVTnwotqZ3K3lRrSA0=;
 b=G2xN5jBNVDqgIuuNjYm9hMnUFRMVbjxh+Irh4rb4bQUEJ8CWiP13lHtzkcWVQdahd0
 q8IlfeBiiAIuSd+VKZP16YL1PPA6TTcQknKHf5DDhXpW32pJrPOK9ALdf7oiqXC4qTuP
 2pNvvvK3QKB4PE16u0+GAZ+/gvOaJguYIrPWSTAUkpMBj8BbrWT/cS0wL6NgV/vKTKHH
 eodadA4tX3zdKfa4+Ym5kGT5ENxfWXHIIARGl0SOLle/2DjqckPThxubk8hnD5pCCqe0
 nVoCCS0K+0EPkXKUYQqi2s2WZAeUTu7U4ZdsF4Hvn3QoqfzXMmzhIXODL9+GBD/nvt4b
 JFxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=G2xN5jBN
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-08
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

Autobuild statistics for 2025-07-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  3  |  0  |  9  |
  2025.05.x  |  2  |  5  |  0  |  7  |
    master   |  6  | 32  |  0  | 38  |

Classification of failures by reason for master
-----------------------------------------------

                    gcr-3.40.0 | 2 
       host-gcc-initial-14.3.0 | 2 
                libesmtp-1.1.0 | 2 
             libgphoto2-2.5.27 | 2 
            netstat-nat-1.4.10 | 2 
               asterisk-22.3.0 | 1 
                   avrdude-8.0 | 1 
               bctoolbox-4.4.8 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
                   duma-2.5.21 | 1 
                     gdbm-1.24 | 1 
               graphene-1.10.8 | 1 
       host-gcc-initial-13.4.0 | 1 
       host-gcc-initial-15.1.0 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                  libbpf-1.5.0 | 1 
                libdrm-2.4.125 | 1 
              libgcrypt-1.11.1 | 1 
                 libjcat-0.2.1 | 1 
                  libjwt-3.2.0 | 1 
                liboauth-1.0.3 | 1 
          linux-5.10.162-cip24 | 1 
      passt-2025_02_17.a1e48a0 | 1 
             python-webpy-0.62 | 1 
                 siproxd-0.8.3 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/7f109ae04b78fb9558bd5c08ddebcf54bcbce8b1 |     
  sparc64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/9cf73fce59472fe52e4e7637b967d6a38e4a33b9 |     
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/7af784cb60b0ec5e5bd0e0915ce6827f69f4bb97 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/afc648eab582e1c6cb6ee9b7570c0a2bac98b782 | ORPH
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/51a81a8bf217bdac164ae00867bdc727c772aecd | ORPH
   x86_64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/8a0698b34f8287c9d56f78bc2877da830a9246e7 | ORPH
   mipsel    |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/8d24098b9750fdcd9ecfd43b4134a255e5b55fd2 | ORPH
   s390x     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/30c1dfdb3b9b09e8a020e0a7aad313d1f51e4ed4 | ORPH
   armeb     |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/e713756048b310cfa02cb3b43c0b209a5aea2980 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/036f7c3f87a7595eee1eb68f447131b6441834d1 |     
loongarch64  |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/04a904f08d6e0aacbd308692c99e77a334d72b95 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/49750195440a0bde72af164cf72311266b7b88de |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/38fbd73afa8b7f3fd7636c84afcc0490e567a481 |     
    or1k     |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/04a57829e27893d2e8d28b9df6dd46d0b82aba3e |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/7203a376fb31cb359237067362d4ee5264028b4a | ORPH
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/0f84bff8a94d8d1eb07f830f21f86713b6bc1931 |     
   sparc     |         libdrm-2.4.125         | NOK | https://autobuild.buildroot.org/results/bc9bfe9a023f3b0ed9b67dcc53169306c286366f |     
    i686     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/0f15e129fa9e0177edc964c5ac2f01fad645ad39 | ORPH
loongarch64  |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/e670680343e29eeb623abcb2bd054eb2edfb90be | ORPH
  riscv64    |        libgcrypt-1.11.1        | NOK | https://autobuild.buildroot.org/results/c44a2e78494da0ae5e0473fab43706b217fbcd74 | ORPH
  mips64el   |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/dc8e22dd24966c3c3cec07336a74c099dfe6de7a | ORPH
    m68k     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/1c968525af61be842190733fb6ce61e1185cbb31 | ORPH
    i686     |         libjcat-0.2.1          | NOK | https://autobuild.buildroot.org/results/5984ce4fa7625de7b8e6ea4b9a8dd6e7a08f57e5 |     
  sparc64    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/4638a7d46c149ca0f46d3fe5f5f90dc5ee9d1e03 |     
   armeb     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/78934ff4118938c5713e322b8206863deb979f12 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/1ee46357c9b3851edc02a9319302a799a2ca0f5c | ORPH
    i686     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/e7e3207a944ffa43a2b314004f4ac0299d2ae31e | ORPH
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/551c4a372a8bb9b23b390a6febcca9a1b38ae792 | ORPH
 microblaze  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/0ddcbd8ee63d402ad48d7b76590984ccbbe6681b | ORPH
  mips64el   |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/1bf86e50de4800b484c5ebb6865e83d3a381f79c |     
 aarch64_be  |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/1ef1f4103bf58ee267f977beaa118fe7de439653 |     
   x86_64    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/ac650af5cfe3e78171222ccbb379b7cf7c4800b0 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                 logsurfer-1.8 | 1 
ustream-ssl-68d09243b6fd447... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/d6d43ab71367af4a0a06c9cc171d3cffdfa27c60 | ORPH
  aarch64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/a368cd3a2e174a7d40d9fe9b24fbb6180c42b4b7 |     
  sparc64    | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/a7423a70ab4665f1a219cdec1a0a0e64dfd231f9 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
            host-libp11-0.4.12 | 1 
             libmanette-0.2.11 | 1 
                  mupdf-1.23.9 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/2ac163c4b852902c1f42b671c366bbcf26f66aca | ORPH
  sparc64    |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/b5156e230e9e17504593ba25e94510da53e616f8 | ORPH
   armeb     |       libmanette-0.2.11        | NOK | https://autobuild.buildroot.org/results/8e38ef1fdb344197fd9d59b78464978534ed044a |     
   mips64    |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/b5147e5a29eefbc1e8e2f255bfd681e5b1bf9264 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/a9bf5ceafcd8c0e740833fe6393a6b25aa989f2c |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
