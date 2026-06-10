Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D844CD8CA8
	for <buildroot@archiver.kernel.org>; Wed, 10 Jun 2026 03:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94E4160831;
	Wed, 10 Jun 2026 03:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6yOQFlsvK5s; Wed, 10 Jun 2026 03:19:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0834B60836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781061549;
	bh=DEC9FUPNYzGLoEbHyvNr63bLZQezKh4ZtbcM1/UUqNs=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dwWO8AVA3VfrEJUXUSWQMgd28ThpoBmOMvTqA3LYgxMGuQyL8hneSdgjrcfUBNzFU
	 h4EONU2jZ+tEXXSOOvmGCkGdwJXphwG9WU9NlLmoCgm2lUEQxgPuuBhbdNzY/XW+IY
	 zT5801IHc4OvpVZOHjneQwvdiN5o2hKoF6u0tOERu0QTdvaC2I3R82elWSZovFU7J9
	 Xvubb0pjoZgM2k5OsnJF+z4I5LifzxlJml8ShwKvo3c7M/vg68iEvWtozrgtUzPrnr
	 4e5vNbs91U+O05BviAHPhyHAoWvDWaf7FSOzR0/s1nJ1JLxZ5K1Y4+wRp5j9stavAy
	 zHl0Wjf3xAyoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0834B60836;
	Wed, 10 Jun 2026 03:19:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 126DE25E
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 03:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 038844020F
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 03:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iR9jEt5ceFnQ for <buildroot@buildroot.org>;
 Wed, 10 Jun 2026 03:19:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 25284400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25284400F1
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25284400F1
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 03:19:05 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-45f3cf907ceso3142795f8f.2
 for <buildroot@buildroot.org>; Tue, 09 Jun 2026 20:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781061544; x=1781666344;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pwJyCD3gKhyLEbfMPSp5Njk09ONu5HigtGhtFblH+l8=;
 b=axcuQPcZJtYu5FK1X2NWDbWP9NGzV+dJcyD78Bi1Hxye1uicvrJAIZJ4H9Nacj/9ni
 ucLhK+DjHhwP2ggIla0DuLEN12P7/MPXChZxPYFk3AQFR/kpn/5i8Dia/G4J6pNgPLCv
 blHw50MbKhTzCCSADLLl5Jwytjn5z7Gwx0hMZnG2db0O2S1bnoEZWST10tCrWHpq/HQA
 YB6W6kiqa4Oj242VPKONfpkPG/i820GH8RkzrTaLpkUxyHbUycQefcjj31Gmv75BGVCs
 gvoYXrk3vZdTEGZm15SHk2OtAymqfePeW0k4FAiMeUYbvWhULC8/zGjaiXKB4UsXyTWO
 PxHw==
X-Gm-Message-State: AOJu0YzqpvvAALu4yEu23L0xBdbtffbEunVHRhVzpilCvA6S+bT+UEGk
 5Si/ZIw0IekjLuBONA8LceiTPp32hK8pyu9qE4AphX2GdjydjOBK7AoxMkzY5nlD
X-Gm-Gg: Acq92OF5zS6qluMCrY2/0pcvPTCkMeJQqHVccnHOer1XsP5mxx8rI1jIPum9tOMs/Hk
 md3CIUUiIqhhwX+Tlj+a5NIFzT0wxOidtVVIBfPu6qRWjwMo78y+SyyDdEtxwxMsJ2RFrbpcvLR
 RjKGbzelhvYFxoB5mCR8SMynyXesERpYRL9qh8jgS7uonBiEBdm9MR6TFMwJ5n1/wNadIpBhQ4G
 u+NNxliYDbnUh1dGp0wKVR8pK6oeeatzrN+xkh1wHt3j2T9RIjp/D2dR8QvcA5+dbgA8LDPxuik
 JgoXq6LLqYF3CXQGjSo74wSvgcQZK8BfT/Tj8KC6huDVEgQF4E/Edjm8cHh/V7NApVMJfY2ZZAx
 i7TNj0XkiAsnZyQQuA7R7G/GX8EaeA6OYwnvaYhhXHwtURDMz6mEQKo/fF9TfX+qNtFlgnZxZ3r
 NEUab0eo5qVsLRE9EmrgisthvJh+QIfw4/oLuKhG5MrgArTvs=
X-Received: by 2002:a05:6000:41e5:b0:460:3234:77d2 with SMTP id
 ffacd0b85a97d-460323478a9mr32681183f8f.40.1781061543720; 
 Tue, 09 Jun 2026 20:19:03 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35eae5sm68449799f8f.33.2026.06.09.20.19.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 20:19:03 -0700 (PDT)
Message-ID: <6a28d7a7.56f33bf0.c2fa.d382@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 10 Jun 2026 03:19:03 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781061544; x=1781666344; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pwJyCD3gKhyLEbfMPSp5Njk09ONu5HigtGhtFblH+l8=;
 b=H4bFIloEjd3vIBkApWfgnvBgz6CUdXvmoaN21yxgoBGcH4VwCuOIN7YLXon2bJyJ01
 kihy63GNep8PUJoXFosNF5a9gdVV3BT+pw4cWQqPx0h4RpH8BIDtbZFvmxPBQOPM/P3e
 6KJHxJj18gjth8NtPKoP1nb0ESrX0crBvuFblNit2hlXfTMOJBjZXFAiBGsJ6nrIkrQ+
 4v0bECWMP/R4uiaXHOdCw53C17kv9kt3ilM5X5rNJ/F5yy2dgyPsAltTQKKv3ipuMzIP
 e0zF51SfghHv3SE2Qyt8zzynl0fPdTaAxQaql6XIVrl8yjbq1+GkrLIwHg2qkeE3rrIZ
 Yy6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=H4bFIloE
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-09
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

Autobuild statistics for 2026-06-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 12  | 28  |  0  | 40  |
  2026.02.x  |  2  | 11  |  0  | 13  |
    master   | 57  | 90  |  3  | 150 |

Classification of failures by reason for master
-----------------------------------------------

             dahdi-linux-3.3.0 | 5 
  gobject-introspection-1.84.0 | 5 
    host-mender-artifact-4.2.0 | 3 
     linux-5.10.254-cip72-rt32 | 3 
                   perl-5.42.2 | 3 
                       unknown | 3 
                 gnupg2-2.5.20 | 2 
              host-guile-3.0.9 | 2 
            igd2-for-linux-2.2 | 2 
              libopenssl-3.6.2 | 2 
          linux-5.10.254-cip72 | 2 
                 linux-headers | 2 
                    olsr-0.9.8 | 2 
                openocd-0.12.0 | 2 
               tcf-agent-1.8.0 | 2 
am33x-cm3-fb484c5e54f2e31cf... | 1 
amazon-ecr-credential-helpe... | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
               collectd-5.12.0 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
  distribution-registry-v3.0.0 | 1 
                    dpdk-25.11 | 1 
              e2fsprogs-1.47.4 | 1 
              erlang-26.2.5.15 | 1 
                   exim-4.99.4 | 1 
firmware-utils-c42a3bc53da8... | 1 
               freeipmi-1.6.18 | 1 
glibc-2.43-27-g4070d808bea1... | 1 
                   guile-3.0.9 | 1 
                   gvfs-1.57.2 | 1 
               host-dracut-110 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
            host-libtool-2.5.4 | 1 
       host-nodejs-src-22.22.0 | 1 
                      host-php | 1 
              host-rust-1.96.0 | 1 
                   iotools-1.8 | 1 
                 lcdproc-0.5.9 | 1 
      libabseil-cpp-20260107.1 | 1 
                  libbpf-1.6.2 | 1 
libfutils-c326ce0cc2a735438... | 1 
                libmpeg2-0.5.1 | 1 
   libtorrent-rasterbar-1.2.20 | 1 
            libxkbcommon-1.9.2 | 1 
                libxml2-2.15.3 | 1 
                 libzlib-1.3.2 | 1 
                  linux-7.0.11 | 1 
               linux-pam-1.7.2 | 1 
        ltp-testsuite-20260529 | 1 
          lua-lunix-20220331-1 | 1 
                     mtd-2.3.1 | 1 
            nodejs-src-22.22.0 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
       python-autobahn-25.12.2 | 1 
                 rtl_433-25.02 | 1 
           sane-backends-1.1.1 | 1 
           sane-backends-1.4.0 | 1 
                   seatd-0.9.1 | 1 
                     shim-16.1 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                  sysprof-49.0 | 1 
uhttpd-15346de8d3ba42200249... | 1 
ulog-0389d243352255f6182326... | 1 
                     wine-11.0 | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/b49a777cbeda99ec033d1e3afdd8334470a77ca8 | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/06fe555a8ecb8e462d5e91c23688aa57be87eef4 | ORPH
  aarch64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/6d07c38b9fb6d6f0a520050e804e956708d9cd5c |     
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/6c822ea96be749e3e95bdd1659927aff305b3f71 |     
    i686     |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/63d6a033ad8bb718e8a9f017da024a2060473f44 | ORPH
  aarch64    | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/94a18169822ee51f86ca679ac6b7ea90158b52d1 |     
    sh4      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4d2fd87f16c064a5e220ef317619e9808bc34198 | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/41a48bcd04167e8eb8d52b6f2d7cfa8e3e8f4764 | ORPH
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7259dbede9cc23ab24d3032cc9184cf0011d283f | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/05fc5d901b8d5b8d716c1639ce1b03d090c495bc | ORPH
  riscv64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0b6809b87916e0d3ef47199ac6833c1e103785e5 | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/e84e8f5b3c4f51d6962f3068819d55eb5a215f4e | ORPH
  aarch64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/53bbd09afac4b08b9c36dde4cc66873dc87eb0d8 |     
 microblaze  |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/d2106a13fcbcc5c0947d2a129c19ad2408b88e61 | ORPH
    i486     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/e63f0bfba9b5581780533837a3fcb8b2ced33135 |     
   armeb     |          exim-4.99.4           | NOK | https://autobuild.buildroot.org/results/9fdfd61b56585867e8006c6ebc5e609a08d30fd7 |     
   mips64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/4f808a43f68e1b2e865fd263d4a403162d43ae47 |     
  powerpc    |        freeipmi-1.6.18         | NOK | https://autobuild.buildroot.org/results/e6e0318877f856e29bcbe6c14a4e76f7df4ccc0e |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/aea36e9fc18a990bb9d61600fcb0752598e9e8e0 |     
  mips64el   |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/7df211eb3df314244c81e52f119da231deb05bfc |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/0d703beb67f67ddc6b5068eff85e2dd07e532c4c |     
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b269be26c6d162d2761854fb3b6d0cc305079df8 | ORPH
   sh4eb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c18776190a2adec4bc6eb456d2298089ac1e5e43 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4ece252866c3b5375842d355a041042acac1dcf9 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e9193aeaed50072adcbf491ca20b54275e05b2e4 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/9f1fce7b5b1cf9ac6189b58370ff4fcb3264cbaa | ORPH
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/5c3c102486540820cf9ab1ab5bbd83b7b5e769a9 |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/aa3c52e628a7f4993688e91223d7c6e32dccff62 | ORPH
  riscv32    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/671d78008ef8a738ed48f1e9c0c856e95f29e0d4 |     
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/ba3e4d98a419c75f30f27ef72968ea253c16fd45 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/51e10abb465eaf0d3379268409e1e4a411f27513 | ORPH
   mips64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/98fea190c2c059053a81a9049c833a32a3e3aa12 |     
    arm      |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/ba8d9bfbf7fe5c760f247146a6c1eb9c4f4d4910 |     
    or1k     |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/ba721748bcb618a278f2273fd9acc92feda35b75 | ORPH
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/45a7a0e536f65996c46265f4bc01029d8d699c62 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/344f3eb4fc2a8ac60d55a9ff37afb3124945bb64 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/c836c2e5cadd8568b440cfef92d02bd8a22d5c9f |     
    i686     |    host-nodejs-src-22.22.0     | NOK | https://autobuild.buildroot.org/results/41f6cc3f3aa5d3542d38734d1b7ac9668f538853 |     
    arm      |            host-php            | TIM | https://autobuild.buildroot.org/results/feef5a05bb615664c6353a2ab4eb192b59e7e3f4 |     
  aarch64    |        host-rust-1.96.0        | NOK | https://autobuild.buildroot.org/results/e7f7d33e8f7fecf1f45b6a35ab8ca6bf61b1e02c |     
    arm      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/67a4d8ecd16d2c9c8f443143fa95f4a47eb9c2af |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/83e37cb961a8796b32a2a25ed35cd56522d85a0a |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/15956bfff06f10f92482548409b7a31562f5931d |     
    mips     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/05d3aa5b4e1cf115a4ca785ef1c8e630aa303d2d | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/9032a24b416b32acefe0a5d348a3769e963f09b0 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/721c9455c98cad4d952b21ca47851596717b9844 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/89aee619b7f6e48b3ba96767eec6eba50236372b |     
 microblaze  |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/b0128af9222c888d39bfd1cffeb179cb2029c5e1 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/0b56fd8b446b26f5f884dda9f6857f0fd5e900d9 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/8e3771fd50477cf0d6111a13cffcae3f7de2e339 | ORPH
  aarch64    |  libtorrent-rasterbar-1.2.20   | NOK | https://autobuild.buildroot.org/results/413c24f428b06e05b964f61ba82b88bd307ec73a |     
  riscv32    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/aaca4cf7dea3ebbdf23188e0dfbb9ba18072c962 |     
  aarch64    |         libxml2-2.15.3         | NOK | https://autobuild.buildroot.org/results/e5b0ab6448517957706d7ce170c149abe262abda |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/08e934c9febc5027cfa9d2222d6a3f7784685ff2 | ORPH
    or1k     |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/0147184e02c7f1a70462083b6fb60f33995b5824 | ORPH
   x86_64    |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/30f8ef0c74af09c607601e39a9fbfe36ffbcc431 | ORPH
  aarch64    |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/861b20520be06142baaa2233f2dfb044f2a643c2 | ORPH
  mips64el   |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/b866dbcac807341891b92c92c7bbd0f9efcdc4c4 | ORPH
   s390x     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/67f68ab9e59dadae565d570ca12b4016415e0fa4 | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/e6c273447f115f73f9392275cbe2af06a0a7a453 | ORPH
   x86_64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/1caa477421e8059701de464d72c2a10127177b37 |     
   armeb     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/cc18432513220d62bb75b26f6a47076c1b7228e3 |     
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/105bee37b895b6e082d1de8efc022d701138ccd1 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/40deb0d0aff0ce33c57b0aecf09ce83b8698b6f5 |     
   x86_64    |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/4c8a781cfe7e177ae33a6da3033aae85f0785b22 |     
   sparc     |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/2d87c3c9e6033d320c626429a7615f2abe402f38 |     
  aarch64    |       nodejs-src-22.22.0       | NOK | https://autobuild.buildroot.org/results/a506f45ae1ed459eb704d454000b3369df069b3e |     
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/956e71401220d8a96203970a17f9e09f97d6ae46 | ORPH
  mips64el   |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/44357184e6b0268141cdb89d55c69ca636bcdd70 | ORPH
  mips64el   |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/7345500d2d97643da9fcc7c0e42ddfb5f81386b9 | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/2a338354dce77f52a01af40842073f992906391a | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/d991336415075c63e031af7da60e98222c713f0a |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/1079f06574a9df5fc89f31a355512416cfe7c6b9 | ORPH
    or1k     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7a4a5423d06c953a26d52b0c585f7b6edb380223 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/44581bbcfbc9ebdbf950a7770d253a9ed0987c7c |     
  mips64el   |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/32607790114157f122c7b17ae33b12dd169663fe |     
    i686     |    python-autobahn-25.12.2     | NOK | https://autobuild.buildroot.org/results/1d5c3cc7b4999a9fbc4e7cb973f559b11446acf3 |     
  sparc64    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/7c266eab02bb7c0cc800a7297329777960a63313 |     
    i686     |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/931c4dc2769c426af66557c4775a1004b1fe2371 |     
  riscv64    |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/c43b1f692dbeeab789943bb203f5542bc16b478b |     
  riscv32    |          seatd-0.9.1           | NOK | https://autobuild.buildroot.org/results/de622dbba9dfe46d39d7e304644ce97875fbe471 | ORPH
    i686     |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/00971160e44dfca0da9f55f69b2d7ab2858a9304 |     
microblazeel |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/e075f8edb57ed51f3e8636320e583ab4d06f5817 |     
    i686     |          sysprof-49.0          | NOK | https://autobuild.buildroot.org/results/f33ef249b9790de48abc7157128f011111f9a170 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/fc9a6dc2a8b9ea672cb4fea0ab281c62800611eb |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/a9ea89e75e6fae50d1c58d486a859cf23a61ea72 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/22b980ffffa7c548a3ff5ff2958e31f0cc9952e9 | ORPH
   x86_64    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/29b1043f33b8b310e9a110d95fba6625b6219bb9 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9fe02c9f5e3fb4dd5fdfb07de2c88d1425ed13c8 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/e7b2706ec0851beb6757a1a91b2ecfd7cccd1976 |     
    hppa     |            unknown             | NOK | https://autobuild.buildroot.org/results/682b06bbd9c9eb794d6750507e198724b64e28ef |     
    i686     |           wine-11.0            | NOK | https://autobuild.buildroot.org/results/14c2b6e1852f94774a42aea0cdea402153d948d9 |     
    mips     |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/401ea3283995b67c7f284b2e4855d2834605b12d |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 2 
                 linux-6.19.14 | 2 
  gobject-introspection-1.84.0 | 1 
                   guile-3.0.9 | 1 
       host-gcc-initial-15.2.0 | 1 
libfutils-c326ce0cc2a735438... | 1 
                    olsr-0.9.8 | 1 
uhttpd-15346de8d3ba42200249... | 1 
                     wine-11.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bf3259cfbcd4263c881d0d9fc47feb8b488bbe1e | ORPH
  riscv64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/dea3ed92e6566743601654165acca1861a18bddf | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/bc4b1d67e87b677c8ed59ab902d67b8fa1dee901 | ORPH
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/da3600e71f16d2d2a84afd773900103faf898a8f |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/8281851ed6da7595cf668ae313c397a81ef3c1e9 |     
    or1k     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/339c5e9184a0a6ed4faca4116abc418933cdd57a |     
   x86_64    |         linux-6.19.14          | NOK | https://autobuild.buildroot.org/results/6fa2faf51e36af1a2a335c362f64ee7b75341e1f | ORPH
    i586     |         linux-6.19.14          | NOK | https://autobuild.buildroot.org/results/b3d5d5c728d7d0144d129a477f6d1bc8da02e270 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/8c51f4c385c74f442f4314fc8f19e46e5d9ad419 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/5c7899ee88a2a1633219ebc60d80294063145811 | ORPH
    i686     |           wine-11.0            | NOK | https://autobuild.buildroot.org/results/364ed83f95152d6c0a0977284c33299e6c79e30a |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 logsurfer-1.8 | 2 
package/linux-headers/linux... | 2 
                   perl-5.40.4 | 2 
                       unknown | 2 
          cloudflared-2025.1.0 | 1 
              containerd-2.0.7 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                  delve-1.22.1 | 1 
  gobject-introspection-1.82.0 | 1 
               gocryptfs-2.3.2 | 1 
               host-ola-0.10.9 | 1 
        host-python-lxml-5.3.0 | 1 
                 inadyn-2.12.0 | 1 
libdill-32d0e8b733416208e04... | 1 
        ltp-testsuite-20250130 | 1 
             matchbox-lib-1.12 | 1 
           oath-toolkit-2.6.12 | 1 
                pipewire-1.2.8 | 1 
           python-numpy-1.25.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
          sphinxbase-5prealpha | 1 
             strongswan-5.9.14 | 1 
               valgrind-3.24.0 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/573d877e5591d0a45c2a9b2866d942f4927cd41f |     
    i686     |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/384f9fce3aef198b5c7060dd3de5152514cafbb9 |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/f7667f0d57e9f5e307be20ebc24c2a5554b4643c |     
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/0a8c9bf81af5bc6eb7becb17841ad701c086d9b8 |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/d6ae12320200af70093a0ed3e7a6c2ebc3d33005 | ORPH
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/f84da46a1e71b77aa243d6b14ccd1ab9665f1ca5 |     
    i686     |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/034c642696e6b179f6f7e50afd9b91e435747949 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/53306de391d874af9ba33aea61ba041f4c8f32a9 |     
    i686     |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/887bfd56f0b0bf2aac174f8ea7cfccb4d0b75954 |     
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/191d58a8ae3856a55c5ffdd6f60cc1569253d465 |     
    i686     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/9fca5beb975048f9c4b958871434bd8356ab8ea2 |     
    arm      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/142e9bcfa310598b5c693ecc2818b976c5214721 |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/128593d069c576c1cb620f8d28f8db9befefdf00 |     
    i686     |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/31b7b7ff866ea03f7f28de0b1a337234c1798028 | ORPH
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/edf07b69cfbedbc0ee2514e555ecc7461a787eed |     
  aarch64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/cc7103dda9374dca60566a4e523164c612cfb3bf |     
    i586     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/85cd674f54c03206ac8af142e1192dcf6fea4dfa |     
    i586     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/2df648e84fba855690b5cc705cf3f33570a5302c |     
  mips64el   |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/a844835910e6c328ec1066f388c78fba8a4ab101 |     
    i686     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/e71f0904226d7b4da7fe32a31f9ebf0e19ba98d7 |     
    i686     |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/4936ac1952623ab6ff31186eaf1790e8e889473a |     
    i586     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/e6a2d63e9b033365445994a1ba325ded40e7ece9 |     
    i686     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/dedbfa20903f2d633bb2a8fc314c2bb825ba68a6 |     
    i686     |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/b18c2f2f716ad7a770fbbf36441f0b30e6a652d7 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/78b20bb44cda0987a96d2fe1f7356ec45fdb83ce |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/587185b464cef8573ed9dd3fd2ac645c9d096ebb |     
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/76434258e05d0102d2563dbb6676d5a08cfa54ce | ORPH
    i586     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/544b04a0f30b5be82a43352296bcd5f79551d9dd | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
