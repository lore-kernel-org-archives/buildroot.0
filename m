Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033F1C87FCF
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 03:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8567540857;
	Thu, 14 Aug 2025 03:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gu-_eIN7K_n2; Thu, 14 Aug 2025 03:15:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D987E40C6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D987E40C6B;
	Thu, 14 Aug 2025 03:15:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D210271
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 03:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E429607E0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 03:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCdAbImzYOTh for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 03:15:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D6C9607F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D6C9607F5
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D6C9607F5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 03:15:03 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6188b654241so938800a12.1
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 20:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755141302; x=1755746102;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2B9NyIboBsZCg2ZR3KdOQ4Vu0gbCYX91qtW33EtlRpM=;
 b=qLlkBXivOyd+N1bkoefx7UpD8Ye0ufDrPn7Gf8vTq4E5QTaMOFXm7oXqHqbf524Zo1
 GQOCOb3YR/rSC357A2cBqWKJlfc5dVnaMXR/DNOYhnMo9+6iuTDP4nTQftxNVNC/fmdl
 soKQB8EFV5rCTjLXUKTW/xxhtSmEdLhF7sfLNHZwIU5T21TbC6Jv1FSZ/QlaU56JbrAU
 cZKcXm+qpGqHZIa45ZIIKN14O3jgtgsJjpLhsPbRuUaTLbH/1TcKNPGB4NbbKnY5fnGF
 bLTGpgaHPlbTcVBBBYhVtwcj2VBDPRFO86ujNGVZwUtFIxv+lhG1Lh9ASOOfclnpfMgF
 xNEQ==
X-Gm-Message-State: AOJu0Yy8lQ86FNYT/CjmzgG7tkJow2Zx31s2rPGPHLwTs/MB7aGIDEiP
 D50Yi9pf1c/JEcFxgFzP4eKe1+ZWUlEJQ0LzL5oiaaKWrdY0UuzEL0m31Xw0Xw==
X-Gm-Gg: ASbGncs1PsC46sk48Pnm+JlHRQYy4L/zsz4xs0runQ0PBVvM2G44+29QoSHq1VnuCIC
 tBAsTuchZs5ZDH0OksWrMEIpWarJM9E9CND1T0WmJP0/tEI5NKpb/DashxoTRo4MqwrK8DqrLa5
 zbWLe9K5YWf5Vk4YWvHOQNylzBRz3qsyStKXPIL1IH/mlBdnMsjc2iHkAFLLKRhXicgX1zcJnGU
 xVVHIWWi262z0T8+DOvwx72sqd26FLjGUdFVMxY4wYFVzRe3bg+1SCbjBX+WTSScAA1oEK3BWSN
 QbRFIl6nIQQ9HBImXSiC4V7oDzDAhBF7aAc9iby87G6+H64LEZpPM7GcEp/gUbWa6SU6cRMcQCh
 HupUeUEer4fI2TnJalbgJLlmE5A==
X-Google-Smtp-Source: AGHT+IGAsM8Ttu3Q8ALB6teInnIT12JuXjN9fb7q61PfnwmV+uRkpntFbs9YjEZgXgnvgDtpqoxk2w==
X-Received: by 2002:a05:6402:5250:b0:617:e4ba:30aa with SMTP id
 4fb4d7f45d1cf-6188c21d516mr1108146a12.32.1755141301768; 
 Wed, 13 Aug 2025 20:15:01 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f2c265sm22769562a12.26.2025.08.13.20.15.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 20:15:01 -0700 (PDT)
Message-ID: <689d54b5.050a0220.2c3756.8962@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 14 Aug 2025 03:15:01 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755141302; x=1755746102; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2B9NyIboBsZCg2ZR3KdOQ4Vu0gbCYX91qtW33EtlRpM=;
 b=Kcd0OEz+Zui5C6KtJYuXdoAhwgubqINZNTipeInmKbmvTdJWdooVROHet8nFhC+Tpj
 gFrABP7jwmLKdeumfWypMAGVQkS0NZwGLV1UuythPrztcoon/94q9KvHSqZNIBAbrX4V
 LlFaFHw8myiW75/Mr1wTbiQ+VIVnYj3Av+Kmll3s1izYLHUJ9AcdGNAncujkSl0ESQYa
 RfAl0JD+Ti/3c1eXuE1UjaA4z1UgdVoexiNmpcazUfdsTnRiBBWI2tkTgNjclT7+mwRu
 6WDMzU+MyVKOFxL9HDnQUmXis+hLtKfapxNLtEuCTWkE7XhrlnD6WuHOwUNTo1sNNZo9
 nt1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Kcd0OEz+
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-13
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

Autobuild statistics for 2025-08-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  5  |  0  | 10  |
  2025.05.x  |  1  |  8  |  0  |  9  |
    master   | 25  | 139 |  1  | 165 |

Classification of failures by reason for master
-----------------------------------------------

libsvgtiny-ea9d99fc8b231c22... | 7 
host-binutils-arc-2024.12-r... | 6 
              libselinux-3.8.1 | 6 
                liboauth-1.0.3 | 5 
                   cvs-1.12.13 | 4 
  gobject-introspection-1.84.0 | 4 
host-am335x-pru-package-5f3... | 4 
    host-gcc-bare-metal-15.1.0 | 4 
        liblog4c-localtime-1.0 | 4 
                    gpm-1.20.7 | 3 
libdbi-drivers-0bfae6c43134... | 3 
                    linux-6.16 | 3 
                 logsurfer-1.8 | 3 
            python-yarl-1.18.3 | 3 
                       unknown | 3 
                   avrdude-8.0 | 2 
                   bash-5.2.37 | 2 
                 host-gdb-14.2 | 2 
                 host-gdb-15.2 | 2 
               host-vde2-2.3.3 | 2 
                  libjwt-3.2.0 | 2 
                libshout-2.4.6 | 2 
          linux-5.10.162-cip24 | 2 
            netstat-nat-1.4.10 | 2 
                 openal-1.22.0 | 2 
                   perl-5.40.2 | 2 
                python3-3.13.5 | 2 
        vulkan-headers-1.4.317 | 2 
                 apitrace-10.0 | 1 
               arp-scan-1.10.0 | 1 
               bctoolbox-4.4.8 | 1 
                  bcusdk-0.0.5 | 1 
             bmap-writer-1.0.2 | 1 
brcm-patchram-plus-15bd6638... | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
               dvdrw-tools-7.1 | 1 
                espflash-4.0.1 | 1 
                 expect-5.45.4 | 1 
       freeradius-server-3.2.6 | 1 
glibc-2.41-70-g1502c248d58c... | 1 
          host-binutils-2.43.1 | 1 
              host-guile-3.0.9 | 1 
    host-llvm-libunwind-20.1.8 | 1 
 host-softether-4.30-9700-beta | 1 
              hyperfine-1.19.0 | 1 
            igd2-for-linux-2.2 | 1 
                 inadyn-2.12.0 | 1 
                 lcdproc-0.5.9 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                 libgee-0.20.6 | 1 
             libgphoto2-2.5.27 | 1 
                 libgsm-1.0.22 | 1 
                  libite-2.6.1 | 1 
              libopenssl-3.5.2 | 1 
              libtracefs-1.8.2 | 1 
               libunwind-1.8.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 linux-headers | 1 
linux-headers-5.10.162-cip2... | 1 
        linux-headers-5.15.189 | 1 
        ltp-testsuite-20250530 | 1 
make: *** Waiting for unfin... | 1 
                  mbpfan-2.4.0 | 1 
                memtest86-7.20 | 1 
           oath-toolkit-2.6.12 | 1 
                openssh-10.0p1 | 1 
                openvpn-2.6.14 | 1 
                p11-kit-0.25.5 | 1 
                 pixman-0.44.2 | 1 
                  prboom-2.5.0 | 1 
                  procs-0.14.9 | 1 
                ramspeed-2.6.0 | 1 
          sane-airscan-0.99.33 | 1 
              skalibs-2.14.3.0 | 1 
                    sslh-2.0.1 | 1 
    start-stop-daemon-1.20.7.1 | 1 
                 systemd-257.7 | 1 
              tinyssh-20240101 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/0e77da50b38c55d0fff133dcf27de4bca00d3afe |     
    arc      |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/e450ac1c159a220dbe389756ddd0ebc29fda81fa |     
    or1k     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/867dec4172d161bb044b08a7522825d32b30a702 |     
    or1k     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/a6a3716f0b19621218d9e64963f18dae90dbf658 |     
 microblaze  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/0fca54aeb6166637c984d68e409d0b7ce823a401 | ORPH
powerpc64le  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/b482fe8704ca3bddcd31b2b1b48007a7d8898855 | ORPH
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/64f426da730f71650d2c6b3e845dd517e802791a | ORPH
    arm      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/1619695cac162ed05a992d96f2927510cc5b77d5 |     
    arc      |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/247c6a0c0e52eaa476b795a51727b2efefc165dd |     
  sparc64    | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/fc3613373e0a9e32a692bc32dfbf23eb9b43a3b9 |     
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6da72e692097a5338babfda1abfd53018fd6cdc0 | ORPH
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/bdb50f1d5a9f652e5447bab13070e43c0b1c9a88 | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a562b0cb79393f1c236d3a653d09123f24942ce3 | ORPH
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3c0414b9ec730f0243ea97df1320a79db1537a7e | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d67140163e081aa4788395912110ffd3f9e3c566 | ORPH
  riscv64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/7335c9c02db1c3d1c7f505f6135399386f465189 | ORPH
  aarch64    |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/a74ad3b12fa04b3053bd837b4563e5375ca857fb |     
powerpc64le  |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/a91bd2a3dd475818e15f8cb20b2f1da1f84f0173 |     
 powerpc64   |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/a3af7c8aa53fbcb9a97beead6983b9f96dedeb4b | ORPH
    m68k     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/e30707035c5a2001ee2b17f775b73652fe3cbe53 |     
   arceb     | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/c1d4559aeacd6c26e9f7f11a40832b2423957f07 |     
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/9e090c017d076540931d55fc98f03296b913a641 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6f71fe9ca4287e8538250783a54951d0f3578e70 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5fadb5eaefb733201081040e525e53b8fa15dad6 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/cbf4950321f4b65077c96769692904d5b5c3834c | ORPH
powerpc64le  |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/ee392eb6afd6c2cb1340788f855681d62c81b3f0 |     
 powerpc64   |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/579876c48ad8a3a6a7ecabd4d7b020191a9d50fb |     
  powerpc    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/4f019a3fcc4faf3e70062a475a29e38b52cf9f88 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/d35146b55a149d9a4c95246a0912bf495232cdbd |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/0a82d03129feb465caa17e9735b1bbce7be6bdc2 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/0dad89674703d61cfc46f5f13108e0aebcb2a964 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/f174c9a3aec4a5ee3337a71c4d9ed48cbabec744 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ac9a54c8acd1de7ee298d5b346b8ab7e540c97d5 |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/8dfb46b06fb9a2ed4e4253f1ad803f0a50835f6b |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/ea2ae72d47d4e2a494f2c6b74dd7af8bd73c86b5 |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/24c3476296ff36f73ef5be930da02c74731c9b06 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/14fb3b7a6de920a4babe95404c7219da8b9b33bc |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/cfa1f208b11cd14d13fdc84ba688e7b093cc6363 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/a7c33168fc7f079220b3e14f134ec8bccdbde087 |     
   xtensa    |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/4950ab9b17ef0df567644ccd8c2616836427b177 |     
  aarch64    |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/eda879fb8e1ccd696f01927087713b88a4b1a2c5 |     
 microblaze  |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/74799a00c1f7c507b4126782612e1271bf2811fa |     
microblazeel |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/e81669ee34aaeba5786ac73f848b7f59b62a10e2 |     
   x86_64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/6173d9854685304ace91b7fcc09ca3ee0a342c28 | ORPH
  riscv64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/50df2e57a78a309c71e2aec658df38f0557922c5 | ORPH
    arc      |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/53bc9f9fcc95563f7a1402fee824ed9b59ab44b8 | ORPH
   sparc     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/59d30a4aa5d7a7441b4adfd915e703c6a829a337 | ORPH
    mips     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/cb1b8c643e3d459ac2af47bce2a8afc34ff2e680 |     
    i686     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/8f6101f9e23aa5e65f4d13cfa9c1e98803441e25 |     
   mipsel    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/d003ed9cfbb8b0ae9f532a8e54d9d815d9c3b609 | ORPH
  powerpc    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/5f73b988b210b3024387f0287fa5d0add5e173ed | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/914b00ca80885065532d9b70f2a1d6ecc168f69d | ORPH
 powerpc64   |        hyperfine-1.19.0        | NOK | https://autobuild.buildroot.org/results/19e3185ed9414887908146f22c494b2e01f50419 | ORPH
    m68k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/afab61eb699aec4666081ddb28c04971f1c0c3de |     
  riscv64    |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/51535cdff2f36878397f6aee881bb2b2971d8022 |     
 microblaze  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/ad647e9ed06eee58aded68d2b94c19c16a46fd0b | ORPH
loongarch64  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/2fa0c69c72e4f83d5018abff6b64cd04df3e1c45 |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/ba3f684d2370148edcd567cabaa19f62d0c5fba2 |     
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/1cf9efb2a37e42dc309c5f865c4c9f29ee6d6cdb |     
   x86_64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/8a194a18eb6a60e0e4a0699e1406176ffa437d3f | ORPH
  mips64el   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/43541fd9adc22edbd5bb00654398599bf00eef16 |     
    mips     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/d8a88dd2d95866ead566022f9730eb0b11fa32bb | ORPH
 aarch64_be  |         libgsm-1.0.22          | NOK | https://autobuild.buildroot.org/results/580d3ddcdcb35c6b3a605c465874782cbe8b40a2 | ORPH
  riscv64    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/4ba1fb44e5913a161f37df6e5da56e0bb53ebfec |     
  riscv64    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/71c20ba40b11f9e6a68b941108fb2107dd8e254d |     
    mips     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/9dff8a2c31c7af8ffa20a4c36a5de83b6af7789d |     
   armeb     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/d5bee9dc70ca0c2d24ec2fad54693c91facea4af |     
  powerpc    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/3125468f3c68667c8e5cc772567e9019d0a86b04 |     
   mipsel    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/2aa5a2c218c6dbbd7efc42c66dd620acb14ffc1b |     
    arc      |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/cf053974eeefee4acc7dbf617b6b682c3176518e |     
 powerpc64   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/8c13a5d071cfca17fab0c289e2183cc643b1129d | ORPH
  sparc64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/624c0d0d91ad838d7b1444c825317816c92b1698 | ORPH
powerpc64le  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/8a6ff64f03fe5fa6736b7fec39590e9f92125a97 | ORPH
  sparc64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/333f94ca2f286c99de327b58305583633e4dd2aa | ORPH
   mips64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/5c0da89413172cf3458e39bf99e1a02af85005c7 | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/8deb0e6a6c5dec31cf34652cd068f2984c1ed755 | ORPH
    i586     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0454ee0ff7ee905e9a6d94ee181524506000937a |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7220d18c58f850cde6108aae1f2df0ad49397066 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b7381eb9b7c4ed7411070cbdd9fd826e868106e8 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/15fe724152f8bc6cd9085285cff5cd2c69a1cf36 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/778dd7c186d669cbb7d5bf2e8330e523418721d4 |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/65f1233c743559fca3441714c4a7589263c48594 |     
    arm      |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/7c3db830e9f511b6c80404e175c6a60539dca024 | ORPH
 aarch64_be  |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/e9c32780e0874b74f8dbd4afed09bf39a753d6e0 | ORPH
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/8decde79f963e6ac7e2e54e208f89d4c6c5a7b22 | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/bea6c8aea936bf29c39439707ef5c595549b707c | ORPH
  sparc64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/9bf5fb804e7ffaaffb76257b25941b1d9a4299d1 | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/adf9f7b8a00b4c3463ddd3d2e633c9c398450ebb | ORPH
  powerpc    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/32f1f11b4a3fc667446a3a5ef082ec5734611793 | ORPH
    mips     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/f8849cef43aac2f960be56550596a755b7bc2164 | ORPH
  riscv32    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/4b93e24c453a4ae1876cab0c7450ad523636a053 | ORPH
    m68k     |        libtracefs-1.8.2        | NOK | https://autobuild.buildroot.org/results/69b75908bebdf9382a4cd9b138fcaf1e34daba09 |     
    or1k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/5bff8a295dd2c6dd86ed200110dc9d4f27739c3a | ORPH
 aarch64_be  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/37c7d3d9ec46855a489d90ff7fd5334316dc9bc0 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/b80dfa93336fcc6986528c689a4e79cfcae57657 | ORPH
   s390x     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0ce3981968fe8f47eb4e47ee9f08a1ffb47fc640 | ORPH
 powerpc64   |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/db2b86fc311d0c7f481158097c22e3a1ce845df4 | ORPH
   sh4eb     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/b51680d442171a89eef7a9b40bae133f143f7f12 | ORPH
    arm      |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/d6184154eb8023a0a9eb02f9fecfd28ddbf6cb2c | ORPH
microblazeel |         linux-headers          | TIM | https://autobuild.buildroot.org/results/bddbbca6906491dd8063a41c81a58a7b73623f88 |     
loongarch64  | linux-headers-5.10.162-cip2... | NOK | https://autobuild.buildroot.org/results/7642485030f4d3ade6ec0668ad80adee567141b9 | ORPH
loongarch64  |     linux-headers-5.15.189     | NOK | https://autobuild.buildroot.org/results/4c82a6ec5f4e30fbaf0dc35d5227590e46a44ade | ORPH
    arc      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/a95edfee14d607354749a06e339351e3a005c880 |     
   x86_64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/70983b0a8cfc4f5da12bcccedff1c7f0330d01f1 |     
    sh4      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/70cfa51b0b0c769559b5a4e0226a48ab60fcbb48 |     
   arceb     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/8b28353a816a0e62899a560b5853163bfd86cd21 |     
  sparc64    | make: *** Waiting for unfin... | NOK | https://autobuild.buildroot.org/results/8d0eb1ae39cfd16f2b244f71ab6ef9816cd65329 |     
    i586     |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/23f3518d68205661bdf3a7ea84f4663ce642fd36 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/5f1a466ddc25c574aa0a72205c62d3a799f857ff |     
   sparc     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/82c6b4e9ad5a2da83eb2e065527a487661422e42 | ORPH
powerpc64le  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/c1ca009af73416cbcd30ca0d2f2499e57fb30be0 | ORPH
  mips64el   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/04fb14791d0e3dc910c8bc3553dca8f456835a05 |     
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/61209e80d8c48c3a9a406b6963de32b5910b567e | ORPH
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/49b02e1e838625038adc148af91f66a3a9ea4cfa | ORPH
   x86_64    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/fe7a8345ebd2107262a25af5ea6b671963f996fa | ORPH
   mips64    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/4f0ce3d457224247db004ef13470329304047585 |     
    arm      |         p11-kit-0.25.5         | NOK | https://autobuild.buildroot.org/results/e0d5efbfc975eaf5019b29623b1de47e699971bf | ORPH
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/b7f0a61a14d05b1fd8319dadf6c9984bb78304ff |     
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f1504c971457e6fe835e1071e07676addbda0a92 |     
  riscv32    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/5909eec8048048b2315ec4a8fe1e68fe24c8495d | ORPH
 aarch64_be  |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/2e36e73d8161328888cc2cd108546c65c1065306 | ORPH
  sparc64    |          procs-0.14.9          | NOK | https://autobuild.buildroot.org/results/c5f7dd5f398b173eaedd825efb82c063a44fc5a0 |     
 powerpc64   |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/6cd4fb23086a294ae9c71b598e0886fb55022e5d |     
  sparc64    |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/4f00f43f5689711036b036efa77ed578b3a5a1c9 |     
 powerpc64   |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/8f79e4d91799f5f060a0d269997576b55178adff |     
    sh4      |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/ea69beb2e2e47a2959c18a4b5890daacded35174 |     
    sh4      |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/5643109a330862b12149a4b27eafb71bad38729b |     
  sparc64    |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/074c50ea54a1e73d752996612b6eeb34b08dfb22 | ORPH
    m68k     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/5b42b72ccce73a8b4aba5ed1d825257cbfe7747a |     
 microblaze  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/b553e270bb0ad32dde2cef65283e7b453da2f197 |     
   armeb     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/52b466d38363069d4a60fa10054d5c7691705e29 | ORPH
  riscv64    |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/00b42a35a80c2deb61f2cd40aedd231597bbb290 | ORPH
   x86_64    |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/f56d80da9798afb565ab70a23b03839c8389163b |     
   s390x     |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/da1c150832816ac131d8668e46fc60b3bcdb9333 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/39b431f06dfeab94d074bbd6e83a7a0fdfdeefba |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3d6928dc59c1a3a5ff244cccbbe7d1d377786abb |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/e9f38ceebaa1e1f70e650a666339395728e6205c |     
   mipsel    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/0e82ef13787dfc2dc593d6ff44ad092c759f9807 | ORPH
    or1k     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/2518199823a19b7335f5254b4f787b475520bc1d | ORPH
   sparc     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/4e4259d6292a266baba27cb52718bf6e82779292 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

dbus-triggerd-ba3dbec805cb7... | 1 
host-am335x-pru-package-5f3... | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
           oath-toolkit-2.6.12 | 1 
                 protobuf-29.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/2e8024e142366952b4ba3fd1c0162c7795993938 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/07f8066bcc85ce9de99a57eb764258cd04a370e6 |     
 aarch64_be  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/66d4c36ff02cfec9ccf15bf3014812fc4cc2f53a | ORPH
microblazeel |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/1f1cc5cca6bb213ee15689085cb72152201524a8 |     
    m68k     |         protobuf-29.3          | NOK | https://autobuild.buildroot.org/results/20c66cbe74ed65502b4e7ee558abae936ad6e42e |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                 linux-6.14.11 | 3 
               bctoolbox-4.4.8 | 1 
host-binutils-arc-2023.09-r... | 1 
                 netsnmp-5.9.4 | 1 
               openblas-0.3.30 | 1 
      passt-2025_02_17.a1e48a0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/d29a505a7d6e66f63eb9696874e88e88b5d5a80c | ORPH
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c47ab8040ba23562f9880e9b680f2d1176d28409 |     
 powerpc64   |         linux-6.14.11          | NOK | https://autobuild.buildroot.org/results/e0ead28129f0b6b450fcc768886004d2a70e032a | ORPH
   mipsel    |         linux-6.14.11          | NOK | https://autobuild.buildroot.org/results/3a1fbfb907244f00488f4a9b5db3bf5bb8094806 | ORPH
microblazeel |         linux-6.14.11          | NOK | https://autobuild.buildroot.org/results/714e0a90481b043b7efc69163820928b65b29820 | ORPH
   sh4eb     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/48d85b2b5a806f2f9d3e1404c69c8718f9a7d31c | ORPH
  mips64el   |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/38e3a9acb78f4133d0f356f5c79053935c639de5 |     
 microblaze  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/bf3534b7559eb8c2411e28f280796b5bb957c0cf | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
