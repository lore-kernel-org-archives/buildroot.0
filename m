Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F497E77188
	for <buildroot@archiver.kernel.org>; Fri,  3 Jan 2025 04:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77F4780E06;
	Fri,  3 Jan 2025 04:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7sUAJ_Cm_Ro; Fri,  3 Jan 2025 04:15:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA19180DBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA19180DBF;
	Fri,  3 Jan 2025 04:15:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AA75AF0
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 04:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58A0380D75
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 04:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WaJm3qci4oe for <buildroot@buildroot.org>;
 Fri,  3 Jan 2025 04:15:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 954D980D15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 954D980D15
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 954D980D15
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 04:15:18 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5d88c355e0dso1083826a12.0
 for <buildroot@buildroot.org>; Thu, 02 Jan 2025 20:15:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735877716; x=1736482516;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F5TFObdV1qkcuVT0G2BwImjTrN90wADhulYKDKbY6aY=;
 b=rpKeE1Fg1uwIKcgwE6NqeLcLRB/SlYcMwY7i0GDxoP3LYxMOZc/+kclqRJJ9s06b/d
 2XuSkLcwTm55mJWezf/H6FQYaImsgClv6Av9G43XA08v5kCfzxe7yOwp4Qij9mJyU+Q0
 xqqqpt6LlNWLy1OGTFQEz5h1DJB+woQhRMCsZ9mlc4+D4ztbuBprqnNfXE1WFGazFvn1
 XLAxklv8kMePJN7qiEzrplU2EBKieNYB9kGFcVpxJsqT5zeqERKly1/0LiBxcxRnodK6
 SsUskuXxlZmRI1zC789/rbVttNaAZbInzM41i92sBnEGUao2ZVJUgKVMaVyxDPIurWHO
 1vNA==
X-Gm-Message-State: AOJu0YxRozFX2Jyb8bu1ImX8mZ9xeyY/ubAoQDOxQn7zdZYy9RZSFgzX
 I7UOdYXXeUlWa6AOS46eEPtmJYWNoAi0aB0hXNGxc4Vh5ghvT5x9SA+sJQ==
X-Gm-Gg: ASbGncseNZXiFFsclr4QxWI9LptuSO7e21VIDbrp61HqCKwMNB6FRmVom3Q8BEOHket
 gkn3H1OBdOoKijFtdzx1OferIZNSm13h3HKdgIeNz3e49PENCSH0ExNsywwn4yIUTZngcZly+4J
 a+nQv6tDdDI4sktMr7aYoimaAfuT3enROtU96mnrhLC8YH6r9cMXV80gf+M0lhupld8v0x1vAMq
 KY7kbDVIYwsT0nwytrF7zuTL1ePgYgjtpx3oWOzKootNVVguBQmsbB1IqE+
X-Google-Smtp-Source: AGHT+IGj2qhOnxBPAi1DnsjYW7mkE7GhLF2J8ATuyzB8azHnR8ESuPF+cRcB3Q25RmKoz4n5I+cNBw==
X-Received: by 2002:a05:6402:3589:b0:5d0:eb2d:db97 with SMTP id
 4fb4d7f45d1cf-5d81ddf7fccmr38080381a12.25.1735877716385; 
 Thu, 02 Jan 2025 20:15:16 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80676f3f9sm18989145a12.23.2025.01.02.20.15.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 20:15:16 -0800 (PST)
Message-ID: <67776454.050a0220.292e6c.89a5@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 03 Jan 2025 04:15:15 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735877716; x=1736482516; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=F5TFObdV1qkcuVT0G2BwImjTrN90wADhulYKDKbY6aY=;
 b=Fdm9XuKmnGmSu19jUdgjSK1ymOWxffL/kEW7qu/YZdFHRqWBwoZNUAQcG9xaViYmz/
 NdfRoP6C1oAWZrdO1WHtw392AtYz7PYxNqCh6y/9xbdAg/QoFVlOxW0EJ/XEHwk8QWRB
 vut3t6iC04vco8GBdZdVYwLOpVfMogc2ftSxsxG3vR85j84+grkTKR6b9H319xr6bhE4
 sEJnjVsPkx2495Y2rRCogoqxyilxzt75Yjj/svIddgZnlWpXqmSHHpGCvskMgOATdgPk
 PuqATXddFU+dZ7LFtOWbGuBLw7nWFRZ6Ret8uvgGlKlcqPXXpN1/HR9/DxD3T09xZX/7
 RqrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Fdm9XuKm
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-02
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

Autobuild statistics for 2025-01-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  6  |  0  | 10  |
  2024.11.x  |  3  |  3  |  0  |  6  |
    master   | 14  | 40  |  0  | 54  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 3 
               host-php-8.3.15 | 3 
                  linux-6.12.7 | 3 
                  ntp-4.2.8p18 | 2 
  binutils-arc-2023.09-release | 1 
             containerd-1.7.23 | 1 
               ebtables-2.0.11 | 1 
                     exim-4.98 | 1 
                  ffmpeg-6.1.2 | 1 
glibc-2.40-18-g564178076272... | 1 
host-binutils-bare-metal-2.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-python-greenlet-3.1.1 | 1 
                jemalloc-5.3.0 | 1 
                    kmon-1.6.5 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libglvnd-1.4.0 | 1 
            libnetconf2-2.1.28 | 1 
                  libnss-3.107 | 1 
                  libsepol-3.7 | 1 
                  liburing-2.6 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
                memtest86-6.20 | 1 
                   perl-5.40.0 | 1 
                pipewire-1.2.2 | 1 
               pulseaudio-17.0 | 1 
                   uhd-4.7.0.0 | 1 
                       unknown | 1 
             util-linux-2.40.2 | 1 
                 wolfssl-5.7.2 | 1 
               w_scan-20170107 | 1 
                 zlib-ng-2.1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/af45a6d5ca539a179b2553771bc130b407df3b2a |     
  aarch64    |       containerd-1.7.23        | NOK | https://autobuild.buildroot.org/results/d8acd6cbf64cb8e4b89b88be83fdece0bc470682 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/12d0445de6f5c06c1585dcb2e09457408ddc441a |     
   armeb     |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/f80e577981956cbb5f4e621655e4f24be2ec3b90 |     
 powerpc64   |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/972056b1b50e965d9024bf09511e604d4d427b7b |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/1fa916b0a839b6e7529b00f7c9b5301f6faf6bfe |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/3255a2d10b4a85193effa278cd0d6ce9d085b832 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6e46924bfd0f7c2c0f283362ad829946ecee2c5e | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/91f99932bcb859f01877860c8253ec3590bfe19f | ORPH
 aarch64_be  | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/a4674122a683e4842c1fd913da80a3e6e484d5a5 |     
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/257a528a702f4727ec53d1ea19bbbaec0de47c4c | ORPH
powerpc64le  |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/3779cd3267f588b4e3e54801e03d7fb7028e834e |     
 powerpc64   |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/b9912ae378eb854e3d6cd60f33f65d8f12b118d3 |     
   armeb     |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/ec337f7eaebe0162c98e66fb7abdaf49388638c6 |     
    or1k     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/38ded98b078982599787abdeb5e1f530da7372af |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/bd4bccd625eaf8c590d936dfc469c472fb53ebbe |     
   s390x     |           kmon-1.6.5           | NOK | https://autobuild.buildroot.org/results/c2da15e90c31d5007cf411b45fdff7c53f80ff38 |     
powerpc64le  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/dd4e154b395583eabab6f5f4acb5690a67f3ce9b |     
   armeb     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/5afc4134d6ea57e13211292061a6b015f55bd94e | ORPH
   mips64    |       libnetconf2-2.1.28       | NOK | https://autobuild.buildroot.org/results/51a85d19b5c71e10acfeffe48f3b6edfcecc59f1 |     
    or1k     |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/21b73895d9fef298414f7c275113e74da782fd35 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/cdd7e48f75f863ad8869dea8938f431ce1fec2be |     
 aarch64_be  |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/142c42baa660730aaad49471f51bb0407eb8c8cf |     
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/b5816d3c9706b49ce67545e66f023c78d0e32a8f | ORPH
    m68k     |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/3bc10f25da1293c8ec1cf292068ad0b993ff135c | ORPH
  powerpc    |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/e7dda23edffda4d6256162f57ea74a66e904490d | ORPH
   armeb     |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/10b081e6b2a4540231f854763f62d4dea6209b45 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1eee944c48a186e28e8dcca429e679f5818829ed | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/3e3eebaecbbbfff69c76588bc35abaa63a895991 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/2de7101095ecae0ac0a711aea5f548547acf666d |     
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/78d155904561b28ac662979d6ef1de70afb4f569 |     
powerpc64le  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/f8509d3dbcf6c4c07dcae86427538a6830e66cca |     
   sparc     |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/4cf0dd57f7d817811addba6fa11551aa6b087282 |     
    arc      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/92736e28eb5f7e2025166f42f296e21ced7009f8 | ORPH
  aarch64    |          uhd-4.7.0.0           | NOK | https://autobuild.buildroot.org/results/73bec0a1690acbf8d5662ac8411a33c8f661d228 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/1d841e559da3e1ca9c213250d8efe8a04ae57232 |     
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/9d1e1b78b66dd1a8945681ddfea1b0d4fc84ea71 | ORPH
    mips     |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/c0928358ea9cf41c1a9d642028121e82347a43a7 |     
   sparc     |        w_scan-20170107         | NOK | https://autobuild.buildroot.org/results/b55887f346f7815b0f20dc566e0c45b6d6d42ead | ORPH
  powerpc    |         zlib-ng-2.1.6          | NOK | https://autobuild.buildroot.org/results/0077d6134f46d30beb47d7f737727bf5ae8fe9a9 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  curlpp-0.8.1 | 2 
                    chrony-4.4 | 1 
                    flac-1.4.3 | 1 
host-prelink-cross-a853a5d7... | 1 
                latencytop-0.5 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           chrony-4.4           | NOK | https://autobuild.buildroot.org/results/fbd6f454c738a1f10e1a84dc480fd369b3f8f7e9 | ORPH
 microblaze  |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/cf0ad67798e1e42002e0e0362517c4256247f007 |     
  aarch64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/64d489d323d2031051ecba56fda39f88ab699e2f |     
    arc      |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/5425101c9bfeebadcc02a737eca4961cbe6042ad |     
   mipsel    | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/c4baef54917c8fb64e0dcebeee14e5c26429c078 | ORPH
  aarch64    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/05e75fb0902119d9a8c5be6ef2cf2a97bb65bce6 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  gnutls-3.8.8 | 1 
               graphene-1.10.8 | 1 
                    mpir-3.0.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          gnutls-3.8.8          | NOK | https://autobuild.buildroot.org/results/9c247e078cf93b3d7b64fe09e2d352492237e10b | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/cccfc6d4285c2d0ef46e7d1e66390caf671ad0b6 |     
    i686     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/eb59f7dfb04c5dcb839c466146399d7a6e88cd8b |     


Gitlab CI results for 2025-01-02
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751982535  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751982639  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751982665  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751982672  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751982682  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751982783  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751982980  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983031  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983057  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983072  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983079  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983113  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983115  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983119  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983122  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983125  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983180  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983204  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983238  |      
               imx6ulz_bsh_smm_m2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983243  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983263  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983324  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983326  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983329  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983371  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983379  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983422  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983498  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983510  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983512  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983513  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983515  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983523  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983526  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983527  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983529  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983530  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983531  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983533  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983534  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983536  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983537  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983539  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983540  | ORPH 
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983543  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983544  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983545  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983547  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983559  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983570  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983571  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983574  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
