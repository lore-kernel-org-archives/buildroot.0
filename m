Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F3ECCD1BF
	for <buildroot@archiver.kernel.org>; Tue, 28 Oct 2025 04:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 629FF6151F;
	Tue, 28 Oct 2025 04:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VdS17HKbZyjZ; Tue, 28 Oct 2025 04:22:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2233E6151B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2233E6151B;
	Tue, 28 Oct 2025 04:22:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FA1143F
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 04:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21A966151B
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 04:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPQDnUBfQ3Uy for <buildroot@buildroot.org>;
 Tue, 28 Oct 2025 04:22:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A09A61519
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A09A61519
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A09A61519
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 04:22:19 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4770e7062b5so15813845e9.2
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761625337; x=1762230137;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=By6c8XLG3O/sPiYayWKtZBxfzQiopz+1gA08XCKDo0E=;
 b=K8lV+hsACuVHhztEPqZ9kdCdkagtblo6XYCxTXV8+Owi2yZz4nD3HXeUpzflG7M+2h
 WB5h7s0gHSBbrnCZriLwYKBXvuJK9h2p8e7Ys88OIsiWpumSCGzwwXBRFfAkv1lkVWeD
 xMHw0PJa7Gxd4ieYfSxgY1gD+i78obf7DPPBeBrQMiV+yn1NoXSHS0OJmOAxDtxn3BA6
 QC/3a81ac69xuxja66CxogEZ7K029jQ6UKaT1YFghqVkzblTlqRRsRWjEJh/W9LdZE3S
 /IeeHSENM7wJmBnDKrbkXJ7kJs8CnPnLG/Qc1uTxBM8Pj2nIhcEUTrUGoRdAubARcWsg
 PrmQ==
X-Gm-Message-State: AOJu0YyKiUQ9qD1aMnUrGvwkgu5ygWtMbF5YDg394qdqo9yd9QU99xDN
 d6pwo4yE955xYLgRd+vEtAY66Cjk1EhHhqMdOyKG1yXtyWMdZFGvgRextFiHfw==
X-Gm-Gg: ASbGncthLifcLd/x+oGoYBRkG8iRl7xozCCN5729KYLXnNknbiVbUkTDB6pJTeV/3H+
 C61BND55L9Be+04SQ1/QwVuvRHbL6Ck4C+OZ/d8cR4jb1SFKSF8cD13svvtzhS5jtqFXuTN7W1b
 BqHmidjpmsNdMv4bdFe2s5uU3iK5g52/nXMlTnErUVfF7IEOcQGt5IoReMwI+cIjJkXdAHGhjCp
 CCi2Sr5x2oArcM/zKc/9lGPyFtd3NmjkRC7W5G1Y66Lj8cYHPQ1OJrbfb9jB+NVR439ixdQNKjt
 GtsqqXXVNkC2NY4tc5wBfTunKblym3UQCqo9zf2GlKjmLiN8YvCj3DdeNbfkcHphlIqhCY5/nIu
 LUpy1JSmNpKO0SLsnlBKKy8MN0bh//HQoW7W2emkkG1tOAdm2/JHEx60cKGcga0R+tb/vNUlZ6I
 qiXsS+VG0=
X-Google-Smtp-Source: AGHT+IG35/MKsVlK37e6QYFRgoedWOD9saqGlM4CZYRHFeUeEuDw6RYaYA8bjufEaxLU1j3gUu+AWA==
X-Received: by 2002:a05:600c:4e93:b0:46e:1d01:11dd with SMTP id
 5b1f17b1804b1-47717df97f3mr17949415e9.2.1761625336798; 
 Mon, 27 Oct 2025 21:22:16 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7b6fsm17945345f8f.1.2025.10.27.21.22.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 21:22:16 -0700 (PDT)
Message-ID: <690044f8.050a0220.3b5d84.c168@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 28 Oct 2025 04:22:16 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761625337; x=1762230137; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=By6c8XLG3O/sPiYayWKtZBxfzQiopz+1gA08XCKDo0E=;
 b=lr/htkMa+CBW2lH8E/yH8tfDYUYY3pDqj3H6cd3eKrHpOx6RnFpOsEqLp8T39mHQls
 W4FFfX+r2mfDlDQD5/GtP9aOkxg5Iy1M5sbV/Ncliw3FaBK/ks3ZkENoHESNNFB+W8go
 z3KWbfQunteE9lGgmvW6L/loelGPuKHQsNkUlWKpkVR3oBLhfCInCBu11ZUhsKi7pBn5
 vV+mQQh9qw+6ggnQkZ8pANharfyPfei4MrRqNJzauWTWq8H06Rul6P/KXPt5mFZreml8
 +cGmqrz95N+UZ2YM18fL/gHUG/Xyrx79kNtIsv4V88fmoiaE16hAZZqtE9nIivc7VEpe
 ToVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lr/htkMa
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-27
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

Autobuild statistics for 2025-10-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  4  |  0  | 10  |
  2025.05.x  |  1  |  2  |  0  |  3  |
  2025.08.x  |  2  |  4  |  0  |  6  |
    master   | 32  | 91  |  0  | 123 |

Classification of failures by reason for master
-----------------------------------------------

                   cvs-1.12.13 | 5 
                openocd-0.12.0 | 5 
           host-openocd-0.12.0 | 4 
  gobject-introspection-1.84.0 | 3 
      passt-2025_06_11.0293c6f | 3 
                   perl-5.40.2 | 3 
                s6-dns-2.4.0.0 | 3 
                    sdl-1.2.15 | 3 
                       unknown | 3 
               bctoolbox-4.4.8 | 2 
                    brltty-6.6 | 2 
                   dante-1.4.4 | 2 
  distribution-registry-v3.0.0 | 2 
           dmraid-1.0.0.rc16-3 | 2 
firmware-utils-86739f2b3ae9... | 2 
                   gvfs-1.57.2 | 2 
                 host-gdb-14.2 | 2 
     libphidget-2.1.9.20190409 | 2 
              udpcast-20230924 | 2 
                apr-util-1.6.3 | 1 
                   atop-2.12.1 | 1 
                 babeld-1.13.1 | 1 
             batman-adv-2024.4 | 1 
             berkeleydb-5.3.28 | 1 
                   ccrypt-1.11 | 1 
                 coreutils-9.5 | 1 
                     criu-3.19 | 1 
                 dc3dd-7.2.641 | 1 
                enscript-1.6.6 | 1 
          esp-hosted-1.0.4.0.0 | 1 
                      fio-3.41 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
              host-guile-3.0.9 | 1 
    host-llvm-libunwind-20.1.8 | 1 
            igd2-for-linux-2.2 | 1 
               iptables-1.8.11 | 1 
      libabseil-cpp-20250127.0 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                  libnids-1.26 | 1 
                  libnss-3.117 | 1 
              libopenssl-3.6.0 | 1 
                libselinux-3.9 | 1 
                  linux-6.17.5 | 1 
                 mdevd-0.1.6.5 | 1 
                    mpir-3.0.0 | 1 
                netdata-1.37.1 | 1 
                  ntpsec-1.2.3 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
           oath-toolkit-2.6.12 | 1 
                openntpd-6.8p1 | 1 
                openssh-10.2p1 | 1 
                  pdmenu-1.3.6 | 1 
               php-apcu-5.1.22 | 1 
procrank_linux-21c30ab4514a... | 1 
          sane-airscan-0.99.33 | 1 
           sane-backends-1.1.1 | 1 
      softether-4.30-9700-beta | 1 
            vorbis-tools-1.4.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/caf3fc0029f7831a11f793ef10049d491b77efba |     
    arm      |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/a865f9839933979aedc5edab4ecdaebd3e73c15b |     
loongarch64  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/345cd4bec63a8a34a2961995d3ec17a352fd97cb |     
  aarch64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/2d39991619f3ca4c522f0b9a62b121181fb18ea3 |     
    mips     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/3a8fbb1e63ba3719a1171375bda35776a215e080 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6a05b4206737b13f55d17849ae1df96164cde50c | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/6d5bacc98f0d60148268bad92867e8d0477014b1 | ORPH
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/08531b39017d248317f0789bf869179b823dc971 |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/2159949ea7a993d5ea1248176318a3bd817a096a |     
   sh4aeb    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/1677c9dc7fe4df3af6c8045329dcf38d7f1a5a79 | ORPH
   arceb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/5d333b4758357293fa5fad683905c0b7c45a5406 | ORPH
   x86_64    |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/d33c18f843a06196aa73d7501920490ca4b94e3e |     
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/14a2d15300d697ea149b831d76995096af760629 | ORPH
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1d6444fae542aa08e102be0d0da426c65ba38904 | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d66d904cf1f4f6c5bf13d21ca1c5fc34945d2503 | ORPH
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f8364218e9a6113726a75d1291c135cae0dc79c4 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/17ba7cd364de0817ff5c723826dfcbb974eeb691 | ORPH
    mips     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f2588f898cac7841582842dc016ca5d8f8e4fa5d | ORPH
 microblaze  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/bac86ebc0086597eaccbad0bf2f9f757927449b6 | ORPH
microblazeel |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/d1ed9752dcee0842217654a063d57ea173ae2e68 | ORPH
    i586     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/9429f02899e5fb4dd6dd5701c2fd9f646176da35 | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/c7d72f8db264f359eb0e9a86f5d93043a1953cea | ORPH
   sparc     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/9f16b319141cb138e0aed43e70e0b15725952e82 | ORPH
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/13c37e893c8099aed421c0e3916fc9d2e7bb432a | ORPH
  powerpc    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/2cc7490680cc3eb6d3bbf68c66c96575c154560a | ORPH
  sparc64    |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/353171864f8be1be4d729851b661e68ef2e1e899 |     
   xtensa    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/012c283814d31877c7a40389b95cf95250c3573d |     
   arceb     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/a4934bf8a9d3c9630b1023c6adca7d5e59bb9015 |     
   arceb     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/8d995a10df3f0d6ae6d87dddc9377fd750c864c1 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/94aee928a07d814ec5d33401d17cbdba15f52dda |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7e2ac6c7812406a94eb0cd0e59a20b2f9c0a7f89 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f62884a2709d54c96864c83d0f82dc1bb0adbf11 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/089c3d01b88ffc12023b5bb77f07fa6594ac0632 | ORPH
microblazeel |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/732cc6236262bfae414203ba26c6b51cca2169df | ORPH
   armeb     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/d16ee0f796ea171ef3f9554ad8b5bfd8d561dff6 | ORPH
    sh4a     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/0467813be2662519bb6c255449a22722a9d2c38d | ORPH
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/ef5aade0d59bc7435237253aec8310e9464b5b64 | ORPH
   mipsel    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/c79b9d88eea02d94f91162ad6cb94cae5d625ede |     
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/c15ba669e9c1a1fd1fa485d931b16b330d3a7d9a |     
   s390x     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/f983777bc2c3216a530521b41cbc20d28b5d9d70 | ORPH
    sh4a     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/4c4ea8e84493d0092c8442d5767acf2a1bd45ccb | ORPH
  sparc64    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/1ef4c6dc4d93abe454b21b402e535989fff69fda | ORPH
 aarch64_be  |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/b90a1dd98e957cfe38473c4bd6846b5b8b77cb15 | ORPH
microblazeel |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/b128828e9e09eab1629753b2a0a4c1d2d2440251 |     
loongarch64  |        iptables-1.8.11         | NOK | https://autobuild.buildroot.org/results/726b5541918b1c4da72627d287b8a44423d3128f | ORPH
   sparc     |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/9018f056404f70ed07aad2eee4d190b3d04fa722 |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/18f5eefbd5b5b05889696f3065716745c051fde3 |     
   sparc     |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/1661e232e78f1024d9d30d9964e7a0ec71141977 |     
    mips     |          libnss-3.117          | NOK | https://autobuild.buildroot.org/results/7b4acd75d9f1b28a30e99b48d5be9e3c58203cbc |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/b33e1904b5cbe9410e6a1b49c6c663b0e7e7380b | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/0d40d1753e2bbcee39a3bc82a1dc6802d9ba12ca |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/139472b7375c4ea2b6992bab0e91dea1abcfe07c |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/58a74194f8e657adba6d83453ac7653a96797ac8 |     
loongarch64  |          linux-6.17.5          | NOK | https://autobuild.buildroot.org/results/3a96617078ef2b15b1a936780e1f22289ffe363d | ORPH
  aarch64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/e54e0546302c64df1388e308df5a41a0fb8d59a0 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8d2d5e38484462d8c06edc6a9e646bca49791316 |     
  mips64el   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/e1ca7c9bb7c58526380e4d3b2479842c04b97fcf |     
    or1k     |          ntpsec-1.2.3          | NOK | https://autobuild.buildroot.org/results/a06b3d3ee260925610a005ed91f5ba4c4791fe0e | ORPH
loongarch64  |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/4ffd70322ef597d946cde386f5a010beaa095bc4 |     
  aarch64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/313eab3ad71e8085b9ee2ecd418aedf9084471e2 |     
   mips64    |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/250755ad6b1f98c267ee4d450087e6ff38a259c2 | ORPH
    or1k     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/74cc68b2c2ccd22f4f5176afad98c3a088acbd4a | ORPH
   armeb     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/b3fa60bab5ec9df86d074ae24a80fa469f20e91f | ORPH
    m68k     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/f7b29443b2eb9dec58892b109a93d50a53f3f090 | ORPH
   xtensa    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/e912bc98775d2a71cccf69382101959482c399ea | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/fa77df81fa255d6f786c919c9e843f055413f766 | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/32a21869538bec0095192851836955fb80c43c7e | ORPH
   armeb     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/e029e94bacdd00a3db6f823a7f4524ee6421e8c1 | ORPH
   mips64    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/14c1146e19b1f89f0304f28a27fb78ca9740a24b | ORPH
   armeb     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/8e17c15e1f390ddffc12b0c12bdb7acccb4c57c1 | ORPH
  mips64el   |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/ff1c641f77d40c325ddfe9b8dd24c1899507e847 |     
powerpc64le  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a9ca80e5b9a1322a330b396d8292331220c2552e |     
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/0489188e02c79cd9873c825e4c49cb2c26f8ea98 |     
   sh4aeb    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/90d51949105ed40f9b92960233d6315038b6712a |     
loongarch64  |        php-apcu-5.1.22         | NOK | https://autobuild.buildroot.org/results/589999da0759da88fe368dfa1836abd7e2d109a7 |     
   sparc     | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/0d6f8ec75e11ba4d2f09945000281ce6a6917c51 | ORPH
    mips     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/04dc4c264399d801d922b9ebe0434a8ec893b339 |     
    arm      |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/0cb26fb5e5135d45bb58b50db625cc6a4e26f092 |     
   sparc     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/70807a48c2016572e39d1735b76de50ae192bc9b |     
    i686     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/804b2029cc21f92e7ace85ea460d85027bb0ab03 |     
 microblaze  |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/3b461de230fe53655e0b78fcf8a1d6cf2855b9bb |     
    mips     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/e3dadb5171be34210bb360b91912e861182a8128 | ORPH
powerpc64le  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/4469fc4fb150ccbe39b3c46e1c5ff01deb7ceea1 | ORPH
 aarch64_be  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/2438b61459c17b6baca3d48dffe8c39557280df7 | ORPH
 microblaze  |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/a5bad6fe11f41a6a56b2b6eec0625f1aaf122b2e | ORPH
loongarch64  |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/5f7339e1123603ef469e933874fd43b761105b4c | ORPH
    arc      |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/854f856a36630b45b4db25c14ac361cc56c9b522 | ORPH
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/9c5553506014df5cf0c6802dbd3363d83b19ebea |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/54007fb24073bf7123a89ebfbf1b5bdd172c67ae |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/fbcd6c74da5a10a818a368adf6bdb3c04bf80284 |     
    arc      |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/d18c41bd084fa7dea80720cb84fe546d466c5704 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                       unknown | 2 
               bctoolbox-4.4.8 | 1 
           dmraid-1.0.0.rc16-3 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/ffd5cb39e780b1a6cc7ec4980ffac31ca199dd2d | ORPH
    i686     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/bba0bf929dd31cdb351219cead72bd080d5b34e6 | ORPH
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/6cb57a3a409f60e965ba6e1e67c48237ea8db943 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/78052e5920b0df8df6feaf2c4e46eafdd1bcc3ea |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
       freeradius-server-3.2.6 | 1 
                    mpir-3.0.0 | 1 
                  zoxide-0.9.6 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/13dd5118415b3b15e560fea49f9daea869418e08 | ORPH
  sparc64    |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/853fbc87b4bcf165cf65715782c0f7254d1faf2f |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b896204f27860e1a078fedda3e5f176bee41abc4 |     
 powerpc64   |          zoxide-0.9.6          | NOK | https://autobuild.buildroot.org/results/4090ff205ac320f80018fd7ebdd085f3fdff4c05 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/263ddfeaff74fbcfae9e1bea4c196c090e986357 | ORPH
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/f99f75f3e0e41f3222cb409079fa4d2fbc9b5132 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
