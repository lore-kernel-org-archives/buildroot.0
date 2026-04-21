Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B22F5A8DA
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 03:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12C03838F0;
	Tue, 21 Apr 2026 03:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEahX7Ep7-H5; Tue, 21 Apr 2026 03:17:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F03B838F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776741474;
	bh=NYxZRMcKAX3ecTGyQKO3Z47QjLeISGvPMkSn5fpLb+8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iCRYos1kICt4w7aWxYJj/adzWVrAT+R9JvjLEXFjWfHLaKWQ6rHSDk+oiqU7VB9N8
	 S/00W3pkmAgmbcsvsS8qs7OAACUJ6aAPr9XLjn2W8499xFZUmH8oxJK0pu4FjqId86
	 oVRD/hsTjJOxkqv8o1eYWbrB1Vo2E3FNWxHWS94yAUdDuBe7LYTiOnBbaNFDClt1kD
	 GGXi/74vVSwlssypfyu/3lJxZ1+nv5oSNTkTCZ5w+rmnIdOo0dKD5tqotabdEJQZD8
	 MJ8Us4ADnrmml6kDy44gVFBRI5JUyZpSjJ6L2/0HPPrjKNcaKZ+F+t+SXJK7zAvWwj
	 /1vYZph5QQJtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F03B838F2;
	Tue, 21 Apr 2026 03:17:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C9BF259
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 03:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32A1C40134
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 03:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxxpOBVIYYU0 for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 03:17:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 85C1740061
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85C1740061
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85C1740061
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 03:17:50 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488ad135063so30026495e9.0
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776741468; x=1777346268;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Xn9QWS40fnqCY88yDoJwm2rxIatPrrNfPYhjEjhk4w=;
 b=i55H0VQscr6fmP8SUVeiKPpf03ieUQ8J7F6V6p/DJgvRZTZXud/TCd/gY8U3WW74nP
 uEOsbZZlEBij9OArWojcQzHkHqsBqfY2uEhUWjMI45v9zBwuGKmbRvBUQhj04RMk8kZR
 ChoNhYZiOU/nSOQoyhEZ/m7puo6YiB0rMw+dix6O09nq/+89CgZq0pvhzzPvgUsBZs9k
 LhVLNzzV9b7ZvoZnIEFdowwB4NO+vH9eODGKrxCXHwPGYP3dg+pWy1xEq9rKqoBswmuG
 ifeJ4sTYp1zcujc74uvYnpMW8eW2IChUG7ugRfGcSMg/TUySEctzdSu/7Dqur8tcMTxI
 BFDA==
X-Gm-Message-State: AOJu0Yzl6glU4xfA3e5rWByyvJ6RvgULL1zT0Loa/5IZya3ewgWVdroC
 6gaMv4T3rbQSTAocWuLKLE1xnT3CO3b4eAHMWB1aXKE9rHNt7BAPTvog/ghRNacv
X-Gm-Gg: AeBDieseFyIk9u7X7h6nX1OkFATt+qbhKb/V34Bcelb/9A0d+vJ0Gf7JoZm5LlwfQMo
 rkKrQ2X4GyNYOwohXwgwSYkPnNAauPMopA2LjXW53Kg6fwNzuoVlAo5Lq7sNp4ThY337z8zCidr
 2uy7oTZSTs9ecnjoC70PJQ7CjoXl4F7iIbJIUfKWe5UtZxN3N69PsXdvhbzBymGO1LY/izo+XNM
 BpPgiSvb4l+UooRCNMUgsZ8aF4cEbkt/Ye/BE4OVJqLIQBOgZ5F+nQy52HVtwN8xLvSNersnS3W
 8TeAR/Akow8dJhF9ri4dKraxNqJTVVoB2WG40QBbBBFvqEkZZyC1Je6vJks9OufEZUAqK3JNAYY
 sg4KrEUuleIxx+2FhpfsS0n23dv2MAnZC35MQzPwGeb/LNfZD4YQttQu0yqRbST8uxzeRAmGQls
 R8dEFcFHDogL4AU/K0v87ZfORx31HOC3bkIl1QSlP/
X-Received: by 2002:a05:600c:a40a:b0:489:1ba8:5bf0 with SMTP id
 5b1f17b1804b1-4891ba85dc1mr87291435e9.21.1776741468126; 
 Mon, 20 Apr 2026 20:17:48 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc140c82sm306228275e9.12.2026.04.20.20.17.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 20:17:47 -0700 (PDT)
Message-ID: <69e6ec5b.050a0220.3687b0.1c2b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 21 Apr 2026 03:17:47 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776741468; x=1777346268; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1Xn9QWS40fnqCY88yDoJwm2rxIatPrrNfPYhjEjhk4w=;
 b=dROVJ6dblpCvQu949zqsx05qXrMrkM99BW8FWahjifji7Lr1k9T+4tEEJp+WdZQ3m0
 IcLoSsR2Qhv4i5B1iYuvd+9RvHVz/c29f4/Vo0p2xUkt9Xs1RaVZg/lEbvf7fATrgZxU
 b9Px60rux6hvgzZgbCpX/ka4jIFoJIXBL4KrXBStKxVMWLsJSwMKUfsrrT7IamkQzAcG
 C5vQy2EVrnWpXIxgDZcxaoYQMzP73uDLkHbPLwTg6zKWDOelQLBMBZ+bmwjDI1PsGjRo
 EwY8pMkQKC28F5zyo4aQHNkiN3PZD3W4FNRAU/yy9ni3ibrdSMaxB+6P/0KmQRCHVJWG
 BqZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dROVJ6db
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-20
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

Autobuild statistics for 2026-04-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 18  | 14  |  0  | 32  |
  2026.02.x  |  1  |  5  |  0  |  6  |
    master   | 44  | 98  |  2  | 144 |

Classification of failures by reason for master
-----------------------------------------------

phidgetwebservice-2.1.9.201... | 5 
                       unknown | 5 
glibc-2.43-17-gdd9945c0ba40... | 4 
                   dante-1.4.4 | 3 
                flashrom-1.7.0 | 3 
  gobject-introspection-1.84.0 | 3 
                  iozone-3.508 | 3 
                       mrp-1.2 | 3 
               tcf-agent-1.8.0 | 3 
             util-linux-2.41.3 | 3 
              e2fsprogs-1.47.4 | 2 
               graphene-1.10.8 | 2 
    host-mender-artifact-4.2.0 | 2 
              host-rust-1.94.1 | 2 
                  libnfs-6.0.2 | 2 
                 linux-headers | 2 
      passt-2025_06_11.0293c6f | 2 
uhttpd-15346de8d3ba42200249... | 2 
                 weston-15.0.0 | 2 
          aardvark-dns-v1.17.0 | 1 
amazon-ecr-credential-helpe... | 1 
  binutils-arc-2024.12-release | 1 
               bpftrace-0.24.2 | 1 
                  cairo-1.18.4 | 1 
             dahdi-linux-3.3.0 | 1 
                  ffmpeg-6.1.4 | 1 
                      gdb-15.2 | 1 
                  gnupg-1.4.23 | 1 
                 gnupg2-2.5.18 | 1 
              host-guile-3.0.9 | 1 
            host-protobuf-34.1 | 1 
                   iotools-1.8 | 1 
                jemalloc-5.3.0 | 1 
                 libavif-1.4.1 | 1 
                  libbpf-1.6.2 | 1 
libdill-32d0e8b733416208e04... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                 libjcat-0.2.3 | 1 
                  libnss-3.123 | 1 
             libucontext-1.3.3 | 1 
                libxml2-2.15.2 | 1 
                 libzlib-1.3.2 | 1 
                     linux-7.0 | 1 
                   linux-tools | 1 
             lirc-tools-0.10.2 | 1 
        ltp-testsuite-20260130 | 1 
                 mdevd-0.1.6.5 | 1 
            minizip-zlib-1.3.1 | 1 
           oath-toolkit-2.6.14 | 1 
odhcp6c-f19dd37fb467c9cf10c... | 1 
                    olsr-0.9.8 | 1 
                openssh-10.3p1 | 1 
                    opus-1.6.1 | 1 
               pcsc-lite-2.1.0 | 1 
                   perl-5.42.2 | 1 
               rasdaemon-0.8.4 | 1 
     s6-portable-utils-2.3.0.4 | 1 
           sane-backends-1.1.1 | 1 
      shadowsocks-libev-v3.3.6 | 1 
                 sqlite-3.53.0 | 1 
                 systemd-258.7 | 1 
        util-linux-libs-2.41.3 | 1 
               valgrind-3.26.0 | 1 
            vorbis-tools-1.4.3 | 1 
                 wolfssl-5.9.1 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/7c0794c0cb7a8f688e14c69531e79e03e4878051 | ORPH
powerpc64le  | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/fa63c5248f49c613ffc20d98247dd503bb49338d | ORPH
    arc      |  binutils-arc-2024.12-release  | NOK | https://autobuild.buildroot.org/results/459255da411efc38951a7474544044221f05f10c |     
   x86_64    |        bpftrace-0.24.2         | NOK | https://autobuild.buildroot.org/results/59920f909d808911ea2710938271ecfab48c367f |     
  riscv32    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/0e89deb43808d15f4d83c3c716aeac443d4bc045 |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5e7ee40bf588147e7043460e724e6ca88dfcde43 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/7fb4de9f7594fb49c57dbe63f14a310a419e5283 | ORPH
    mips     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f913bd22a7598e70e276013ed45f82f37c51bb09 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/7ecc112342ce5bcbd18b58e50b652f42a557f803 | ORPH
    arc      |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/beaaec139602f61db2b466b4c2e3b898a5385487 | ORPH
    m68k     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/774e5c74e0b981353f7dba3b639b38096804497b | ORPH
    m68k     |          ffmpeg-6.1.4          | NOK | https://autobuild.buildroot.org/results/3d626bce23c6e82937426dd44ed5a5ff33c633ec |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/0dc6589878dfe9f546685c5ecd3fbfdef0eb9191 |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/35673f2f424fd3b1bc67581483b9b16765bc2f6d |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/5bca015f330b1f94927111b89a0203564af689a2 |     
   mipsel    |            gdb-15.2            | NOK | https://autobuild.buildroot.org/results/ba106c921c18b90abc8d00403b5b21291a1fac16 | ORPH
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/f9b5ca44173b3f38d4093be49d0710f89d33f385 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/29eb49ec1521a79ade8b6705d4adece07f16fbd1 |     
  riscv32    | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/d22617c3983aa634fa495d3ef6f38906aa9be7b4 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/2f023d3327cf58e346f107a2a4e7c342be1665dd |     
    hppa     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/99aa062571c0ab31b075512f06819327eb58762e | ORPH
    sh4      |         gnupg2-2.5.18          | NOK | https://autobuild.buildroot.org/results/53d4a9700e16443755ecbb0be36d106aa13f910e |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/099ed8e48e7a26f207ab9ca27337ffeca7a13ef6 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7d8612853df715e3d7d1d1ea8a7fc9b0353ca4e2 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7aed311f9cfe634dc587bc2fb729f5a0ecd1e191 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/ce0aaad32a4648ee859a05f9892aa61b7f9eb5f7 | ORPH
   mips64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/c75f63c4358302d311f6d808248410e0062a03e9 | ORPH
  mips64el   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/22c552231aa221dba4bc3cb33f36cc88b567ba8d |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/bb4be88d5cba19d341061b1a02f720f687845dd1 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/cf190e184cb19421101b511c3072cedd98e352ce |     
  sparc64    |       host-protobuf-34.1       | NOK | https://autobuild.buildroot.org/results/7105d416205dbf30de7459ebb7f56563bbe721d1 |     
   x86_64    |        host-rust-1.94.1        | NOK | https://autobuild.buildroot.org/results/96b5664a4cb5f6e7e43f1a10bdb8eafa8fb8faee |     
   x86_64    |        host-rust-1.94.1        | NOK | https://autobuild.buildroot.org/results/93cff1d4134abb5235ee20564cd7cbd754a83e51 |     
  powerpc    |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/8ef2867756868dbf6e5f43d76635b3691276f86c |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/e9cf8bd937c3178ccc7052d1ce059e5eecf2ec65 |     
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/703babef43651e4815cada35dffe1fdaaf30cc06 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/108c2c46d3214ab3e4d317f12080d3bbf55f0e02 |     
  riscv32    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/2931a84eca98e9298066be262e54084ffefffd76 |     
   x86_64    |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/6713fb6659bf511a95bb1c1409093deaec5b324c |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/f70ffe7e2b13323992493ddba55637446bc92911 |     
  mips64el   | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/5ca4576b7a2a9dfc7715d317669a70fa61114e59 |     
powerpc64le  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/a6490a73f5591427147403abdcc426fe754deaf7 | ORPH
    or1k     |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/74a747794db301440fe2f323c3c43c6d6353e006 |     
microblazeel |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/8e944091f495ab8484110a03861e5a6f95084643 | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/63e9dba79f8533f583f2399fa252801d18423673 | ORPH
  powerpc    |          libnss-3.123          | NOK | https://autobuild.buildroot.org/results/fb44110ffb3b69395895586afbf99bcaeee54014 |     
   sh4eb     |       libucontext-1.3.3        | NOK | https://autobuild.buildroot.org/results/4d8b90b6cf0f5834657a5e6ee764c3e155125000 |     
    arm      |         libxml2-2.15.2         | NOK | https://autobuild.buildroot.org/results/d6edd843516092039fcd265507904b6b54c7f04d |     
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/9d198e620f528b821ac471e8fd16712055f0b04f | ORPH
   sh4aeb    |           linux-7.0            | NOK | https://autobuild.buildroot.org/results/dda610e3a8c57028b59b443d0fbf195aed0a8d42 | ORPH
  aarch64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/113ecdcc2c06d53567f804c085328fb5ef834760 |     
   armeb     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/5f31f79eeb04b913c60a9fe9531ab179ed1dfea5 |     
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/97de6ad4d3bdd167bd49ee9b29dd5ddf35a7f011 | ORPH
   sh4aeb    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/b9639e8383ec9997e2e138784de17acdaf704776 | ORPH
    i486     |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/3fa65fe8ab5083df86d386d4611900c4eabc79c5 |     
microblazeel |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/ba4a0266f6c8171400c358ac0a64e6bd6463c1ac |     
   mipsel    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/0c3ff4996851925000ef95224f1e8fdffc1cee00 |     
  aarch64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/b26b26b08378ba2fe6dfc53d95d53308e4d2ef93 |     
microblazeel |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/96c5c91db6fb7efeb36a32f460e5202ef9b7158d |     
   s390x     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/abdb6cce6f5ab95a4109960958d2b953fd51c8fc |     
microblazeel |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/115bf3c83aee656596c2f842f12252d737dcffa1 |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/dbd6af4223f265fc6732b263afcb766d12ad1e86 |     
    hppa     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/3d2c5ff2aa83cef2d682f37b1ab1782cf19545df | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/a365d0e206035e5a0ae50f45ce6508c47f2876d8 | ORPH
   armeb     |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/93b09e0464652d6ec85f45c5991abbe2f3372c18 |     
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/3eb89aca52f7c10c672070be4d4cf3376719073c | ORPH
   sh4eb     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/1ffe8cd468a930a8aa817b8a636cb2d93b098b0c | ORPH
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/6dc979a831792ca0ee6dcc3af1fc7c2aafa7922b | ORPH
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/2d6f4c6c09ad2f3d84cd3a38a4704cd6188427b2 |     
   sh4aeb    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/59ecfbdae3535ecf4a4a7bdb0a5ed935229d5d96 |     
   mipsel    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/799bf95a81ed98295895eff42cd02eab0282b4ed |     
   sparc     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/68d1cf8e661a1ec9cdb181645ef7aa67504c1ddb |     
  mips64el   | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/8750286f5a6b8316ea9114743622020893e367df |     
  mips64el   | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/887324543a2402e0c222b4b5a4680eedc6a966b4 |     
    mips     |        rasdaemon-0.8.4         | NOK | https://autobuild.buildroot.org/results/5085e769ee2a73099d992aa82053dbbcea5bcd9a |     
 powerpc64   |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/97228f3f917e2a569276f0950d4bd6b3eb8febad |     
  aarch64    |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/2f238645b2efa7694114e6d4de1691f2b39bdefd |     
 microblaze  |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/c66b98d624722ca01541a21b1cf52ee655f99bce | ORPH
    m68k     |         sqlite-3.53.0          | NOK | https://autobuild.buildroot.org/results/d702f923e0fbf0450324c9fde317ea65432adc7c |     
   x86_64    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/c3777e62fab16d5ab9fffa95af3211e0423d3980 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/69f27600e50607dd327d094e70764e8250bcc052 |     
 aarch64_be  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/19044f4797bfd7281a1741f518e80f2e58da2643 |     
 aarch64_be  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/186ec2e8a573055a237871e86e7d588ccbbef836 |     
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/0496ebe4014141987c9b3eec74aa2c5bc4b1f453 | ORPH
loongarch64  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/9334a205d097ebc350345c391ae415bf12b6d86b | ORPH
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/f9f3fe935ce51018bf2395b1837c4d3a4f71fc9b |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d5ca2e8388762357a6262190c54186f02006a379 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/4fdf3b49e7856dfcdaa9543120756a33ba079fb4 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5daa9aa0fe2ecc6058048c91ed49601dca5c62fd |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/5b1685135f4f79003995cfac17d2cec312869c83 |     
  riscv32    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/4642e967f1fb0477a6fd358ea08756a4fbfd3497 |     
    m68k     |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/9718681946b474971088382ae7e75ae1c831147e |     
  aarch64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/cf92806fc95873d322165c95f07bc238505ac411 |     
microblazeel |     util-linux-libs-2.41.3     | NOK | https://autobuild.buildroot.org/results/8a46f2cc20bac0c439a4643c6e025b9a20b4ebde |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/7c137cd54d1d2032087b483d0524e43d6ea37cbe | ORPH
   s390x     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/8da41a5fcd30a8c99f5b58a1356ab97de7a4471c | ORPH
    arm      |         weston-15.0.0          | NOK | https://autobuild.buildroot.org/results/a27bcbfe88b67341c01542ab19c743b3475775cf |     
   armeb     |         weston-15.0.0          | NOK | https://autobuild.buildroot.org/results/8f45cae5b8acde4ad0eb173678170d6140149be2 |     
  mips64el   |         wolfssl-5.9.1          | NOK | https://autobuild.buildroot.org/results/3b36878b5c26f806e087764d8321c29ef510ef15 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/a5fdfa4e5e9ab4393321410c8f0b056af657681c |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                 host-gdb-14.2 | 1 
                openntpd-6.8p1 | 1 
               pulseaudio-17.0 | 1 
        util-linux-libs-2.41.3 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/57fabc2c158d8f41c6c9a05d89ac8af552f7d904 | ORPH
   mipsel    |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/f0d5ec1c9bbbf8b4e9a4e0280bb8b164e0299b19 | ORPH
   armeb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/5f5456a1cc7fcd44079e2622d1a796b9da57343b | ORPH
    m68k     |     util-linux-libs-2.41.3     | NOK | https://autobuild.buildroot.org/results/67087b62f5d3ae2ad28f3f2343bb80840157cfe4 |     
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/44a2f6ea99c88ea96e67b1b80ccfe7b3c5f57e96 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                enscript-1.6.6 | 1 
                  ffmpeg-6.1.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 gerbera-2.4.1 | 1 
        host-python-lxml-5.3.0 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
                 libgee-0.20.6 | 1 
                libsoup3-3.6.6 | 1 
        ltp-testsuite-20250130 | 1 
                 mbedtls-3.6.5 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                 openssh-9.9p2 | 1 
                     pound-4.8 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/170c36af2baca8ff4eccdbac8f4ead8f8104ebb6 | ORPH
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/833995f87618544e2fa7359e0f7e6bc53b4262ba |     
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f0fae14eea1f738e93fe4721ea9f6a3dc0d300d4 | ORPH
    i686     |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/b50c40c2bd95e8b4e41606eae2d34904c67589d7 |     
   arceb     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/d291c9234eb9067b98690644440c7e362bb62bb2 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/883a96c906f9481a9dfeb675785f383006fbc4e9 |     
    mips     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/796e11ac200edf4c605fb494457d2a9ae52b5da2 |     
   s390x     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/bc66d23fb392f92ca96bcae5fe7292b0888b1023 |     
  mips64el   |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/089d9fc5eaf4c817f33664aa56a7b067299c1380 |     
  aarch64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/7eac0c425e3ebca6f664805ab3419c99ddda7417 |     
  aarch64    |         mbedtls-3.6.5          | NOK | https://autobuild.buildroot.org/results/52c7ae52ad592374b0c7915cec426528141c5c3e |     
   arceb     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/fa36b126ab01defe4c4fb07b1f75f50a45bbcb8c |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/f30da4c56581f5430b0c75be9013f55efa1a4dfa | ORPH
   arceb     |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/be9df56fb52d8f70659ce323776aaf96c2fb5110 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
