Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467CEC3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 03:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C1F940703;
	Mon, 12 May 2025 03:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbSle5p_M7o7; Mon, 12 May 2025 03:11:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6977C40B63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6977C40B63;
	Mon, 12 May 2025 03:11:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0B4517D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 03:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B796440B98
 for <buildroot@buildroot.org>; Mon, 12 May 2025 03:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hd0lZZbSosgo for <buildroot@buildroot.org>;
 Mon, 12 May 2025 03:11:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 728BE4023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 728BE4023C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 728BE4023C
 for <buildroot@buildroot.org>; Mon, 12 May 2025 03:11:07 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso25684845e9.0
 for <buildroot@buildroot.org>; Sun, 11 May 2025 20:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747019465; x=1747624265;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5LZ+iDDmD9hBhTaRPLNLOH585/50BClbfxWl8d/wuvM=;
 b=LpvF5UbVReMHCtAEHAyrL9lCfJXSqjFP7NmcRCH49Wjs8PzoyS4PV6aKjzA5rT9XQB
 bvy6gKxz86JWF3FVAe2DlQNondwCK58/sNtMncmmuKWFtIb5njeNOJsKeKOVLNBAI/RD
 tpWUfLnLHce92F1jLQxYN3RvEUWBk3f++eZlwMWw+Fh/WWZDZ5YMm+W9fErARybX2Mlu
 X8v962Rb95B5HVVdccwCpbp+VnZ3IP5GI3lw8G31+/n0qz+b9kMYjRlI2VIhS2kNtnv6
 zXNChTDojeXivV5bGlVXf3aEFGwhBHHhVUoZc1IbjXKWSsGE/osI/8TF0KImAkbArYXE
 hzgg==
X-Gm-Message-State: AOJu0YyirTPO6CX0q6y+qfjmwFx+Bu4e99w85QSLyWaANYXD1VYF+MhT
 SDF5holT3v3pA+10QMMSJt4kEZo/vQGDQCO7g734plPLoEGY+1U4o2bC2g==
X-Gm-Gg: ASbGnctihXEoxUPZ5evlkj2vqgYJcN0ziq3hWib55bxXBMMV8ao6c7XKzw9IxTPOs7B
 dQawtAos8iOMDzx9kjzV2En69M6orSWQesbHzZioUQJ9obq5hKhu0DjzrMpCf5AvosMDQa7A3rw
 15PMfvZnQm4YyFn1Nkl123s7ox03PY4b5QoVoBCFsuE0PLISacIyE/1wesaBe3VRFnJQ454yL3c
 bxu5N+9S3R4yDqCU8y88Pt5+P8Zne7xxuCMPLV/j4pUVjcC5X9KsDEv0GPeDbZ8jqwXMx4adFm0
 Fc5dpIQ3TA2DNCGIn4sG7PyU9zVWAXf6+iIuzQy/BmU55IW0OcFE+nc=
X-Google-Smtp-Source: AGHT+IEqMbxSdR6FlicJ+ZghWE0WsU+8l2Clt0vJqwoZWnK6ka8yIknYUHlfjQ3ISf8JrYmKIjstrA==
X-Received: by 2002:a05:600c:3d99:b0:43b:bfa7:c7d with SMTP id
 5b1f17b1804b1-442d02b91b8mr128873755e9.2.1747019464075; 
 Sun, 11 May 2025 20:11:04 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f238sm150090715e9.11.2025.05.11.20.11.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 May 2025 20:11:03 -0700 (PDT)
Message-ID: <682166c7.050a0220.30e56a.709f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Mon, 12 May 2025 03:11:03 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747019465; x=1747624265; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=5LZ+iDDmD9hBhTaRPLNLOH585/50BClbfxWl8d/wuvM=;
 b=Kt1AeJlNFETe9mJGA9NEJ3qHJanv2zZGTmbBZATqq54UyG9N3JwoU6iLBoRj4wyGhL
 a43yQsm5lrTK/PNxlw4kV3ULWWlVuo3VPUw2MCG5bnFxYa+qEfePEWTMtrFH1zyREtBc
 B5kAH+LKVkudQ6WGVPvQEX8bnLpJsTmr3p1duvWyp5nUAydyHiBFEWzY+y17GZm+a7IC
 cwHVjl17JiknyEy1AGw/WJp0TzSQZR3VwHdPbgisEj6i187vO4RW94JbnYKVlLzpq+T6
 es4g/5Yve/AkBRk868ljWvyV6gGUATOtaSiudte1MK5M3i7C97QeLrXD9EQ/adYX0Tmh
 9q1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Kt1AeJlN
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-11
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

Autobuild statistics for 2025-05-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  8  |  0  | 11  |
    master   | 15  | 88  |  0  | 103 |

Classification of failures by reason for master
-----------------------------------------------

        host-f2fs-tools-1.16.0 | 4 
          sane-airscan-0.99.33 | 4 
                elfutils-0.192 | 3 
          host-binutils-2.43.1 | 3 
                   linux-tools | 3 
          cloudflared-2025.1.0 | 2 
                    flex-2.6.4 | 2 
                 host-gdb-14.2 | 2 
          host-oniguruma-6.9.9 | 2 
                   libcap-2.76 | 2 
             libopenmpt-0.7.13 | 2 
                  linux-6.14.6 | 2 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 2 
                       unknown | 2 
              asterisk-20.11.1 | 1 
           at-spi2-core-2.50.0 | 1 
                     avahi-0.8 | 1 
                    bat-0.25.0 | 1 
                  bcusdk-0.0.5 | 1 
                    brltty-6.6 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                  cmake-3.31.5 | 1 
             dahdi-linux-3.3.0 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
                      gd-2.3.3 | 1 
           ghostscript-10.05.1 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
        gmrender-resurrect-0.1 | 1 
  gobject-introspection-1.82.0 | 1 
        host-berkeleydb-5.3.28 | 1 
            host-binutils-2.42 | 1 
host-binutils-arc-2023.09-r... | 1 
  host-gdb-arc-2023.09-release | 1 
host-go-bootstrap-stage1-1.... | 1 
              host-guile-3.0.9 | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-mender-artifact-4.1.0 | 1 
              host-rust-1.82.0 | 1 
               host-vde2-2.3.3 | 1 
                    kmon-1.7.1 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
               libcap-ng-0.8.5 | 1 
                libglvnd-1.4.0 | 1 
              libopenssl-3.4.1 | 1 
               linknx-0.0.1.38 | 1 
               linux-pam-1.6.1 | 1 
               mariadb-10.11.6 | 1 
                 mdevd-0.1.6.4 | 1 
              mosquitto-2.0.21 | 1 
                   mtdev-1.1.6 | 1 
                  mupdf-1.23.9 | 1 
                 netsnmp-5.9.4 | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.12 | 1 
                openvpn-2.6.14 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                 pixman-0.44.2 | 1 
                    proj-9.5.1 | 1 
          python-tinyrpc-1.1.7 | 1 
            qpid-proton-0.35.0 | 1 
       riemann-c-client-1.10.5 | 1 
                 rtptools-1.22 | 1 
                 samba4-4.21.4 | 1 
               syslog-ng-4.8.1 | 1 
                  zeromq-4.3.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        asterisk-20.11.1        | NOK | https://autobuild.buildroot.org/results/e029a0386b48b37d26470c8178438b8b4f69c7f8 |     
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/d5db2c4a9da83ef28c651b9e653db938d584ab48 |     
    or1k     |           avahi-0.8            | NOK | https://autobuild.buildroot.org/results/d340a10c5f3694013adc59fdf7427faaed15ca0e | ORPH
    i686     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/8dece1359261549a6606ae54c73a12f730eb7ed0 |     
  aarch64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/aaf40bda4e78dd69e4ecf24697d536f1ceb5b3ac |     
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/fadfb94b937bf6f125cc21ee88d74c408ed80813 |     
   mips64    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/b8a40c48eebda10e630a53755f7a6b60c863d7b0 | ORPH
    i686     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/70d13f6ff78a4af9932e31f3715930fc814965f5 |     
powerpc64le  |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/75c46e01d3c0b02a7708e56be2e76ec7ac356f45 |     
    i686     |          cmake-3.31.5          | NOK | https://autobuild.buildroot.org/results/0da6981ff8b7c17b2b5b3bc6e9c8b1ce680995e8 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/921032671a555b4102efaf675d2be523937d8530 | ORPH
    arc      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/891d4edf2775933017e2042d80b53db18cb3d3bb | ORPH
  powerpc    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/5892096110b5c3c550b4c4c2dc8fa8a9e1dd8530 | ORPH
   mips64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a1521b690e9f398150017cf9993dd77618457896 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/46271d723a92b7a0f1161bb2b13a7b54add36141 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/9a12bf67df74bf8ce23c18f4f7361d70b9669e65 | ORPH
   xtensa    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/b253ff7caf8666c551c53c891a861bc6030cf57d | ORPH
  sparc64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/8f1646eedb57529559a3123e819defce5b7e98a6 | ORPH
   mips64    |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/bfaafd80767a282bae5be6527cb6ce83d9119275 | ORPH
 aarch64_be  |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/2491c72253568e4018fadc518cff800bff6621b4 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/92c26c5f037e30e690da6d68395a4ad357fc177e |     
    or1k     |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/8539983e7b303e5e1fab36a66662ff742e989042 |     
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/5efb905e481896b48d3ad06d25c2a2ebda7c9bf7 | ORPH
    or1k     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/0d59de0d57f253a4a74f2d3225b9b6da7b58a5e6 | ORPH
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4275bfc2c98e15c47edb8599024c2964ff1fbe6f |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4acadb3e94a4bc29b4985cac1ed880633cebcbdb |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/807e431d7d3cf0a0ddb6c056b7439fe9df2f4e9a |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b5be9041ae3b67c4084ba6ebda5a4a751958249a |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/2fc93a735443f7869f840cc288e63de30caf908c |     
microblazeel |     host-f2fs-tools-1.16.0     | NOK | https://autobuild.buildroot.org/results/39bd9cea28dfb28ec2da0fa782ecbaab9abc621f |     
powerpc64le  |     host-f2fs-tools-1.16.0     | NOK | https://autobuild.buildroot.org/results/d17641582d1beaec9dcca4dc48a68d713cecfdc8 |     
    m68k     |     host-f2fs-tools-1.16.0     | NOK | https://autobuild.buildroot.org/results/dc03f7095eff8643cb6b663a6bb3ab8bbcb61089 |     
microblazeel |     host-f2fs-tools-1.16.0     | NOK | https://autobuild.buildroot.org/results/e6789811107f77f82c0090167db9e9e5d758ed28 |     
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/47be9225ceb3cbc2af333075f55cda939b9f7780 | ORPH
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/0db619cb3685ffe337c8cebe1d1453c67d1f29e0 | ORPH
   arceb     |  host-gdb-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/b332309c89b0333c581411f938a3275d9fde39df | ORPH
   sparc     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/469b68c8e0d0210eca8779f437267fe74ced0ce3 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/606b7db40436a3d4b13e8c422fa3e5986f4d3921 |     
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/e9917aa6b4881800d514a1db8ecf92ffbf4ff29f | ORPH
  aarch64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/a9c253f6c179223ffa11905f54ef296db64aaa89 |     
  riscv64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/7bb9e9692888c97dbcfa393c975eb3590e328ea8 |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/be2d61078108efcf3452e194231610d81c7195ee |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e4af1f24a5be0c1892b15c24cda7e6b1b0535ac8 |     
    arm      |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/3dd8c35a7e138b6a6b2ee38ee30d549cd0e19d60 | ORPH
   s390x     |           kmon-1.7.1           | NOK | https://autobuild.buildroot.org/results/493700901a17b2cd2fc6ee8fc8d91a9280ef4ef3 |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/2a7b9a622d6c31b2ed85016b439b4dd48266d25e | ORPH
   xtensa    |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/8a33063864a106d9d550e8ff6313385de542715c |     
   xtensa    |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/fa1ebbedae979d1af06923b0f607337795940dc8 |     
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/1698e05a267ef98c0c191cfa5654880c7c34858c |     
  powerpc    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/f0a88bbf11df83cfaa84592d03075e9b232e5c58 | ORPH
powerpc64le  |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/9564c9e62840c1b23f8acd7a2e4646382759cc27 |     
   s390x     |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/9b519288bd2cb5977228feace1c7ad275ff8d279 |     
powerpc64le  |        libopenssl-3.4.1        | NOK | https://autobuild.buildroot.org/results/2e031e1ab9a8f8d0b36e764ea49d7a2c59e51fbd | ORPH
  sparc64    |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/7e72b4ec8f204abf0a752ffe8ebfb8ad5707289c | ORPH
    m68k     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/ca3cb7b8b214f18adb0af1b18d0e11e77f7a3e36 | ORPH
powerpc64le  |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/be2a582b4a2089f1daa8acaf4bc6870b08d6e184 | ORPH
  powerpc    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/eb8413212c12b6505d1d389fe7cd79e9a2e8f696 | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/0ca054a9f0707fea451200796bb50986ac8dc2cf | ORPH
   armeb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/16ee45a1ad69faafb4ae6c6e6fc34fc2b7fcba00 | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/6c42e5fa8d383e7fca89de1dd74f76f005734ccb | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/0ab0d687f016709730b6ad79abe49d3687c6bd0e | ORPH
  sparc64    |         mdevd-0.1.6.4          | NOK | https://autobuild.buildroot.org/results/c21db09fecec2a0bdfed1ef9882bde3a3c3d4e6e |     
    or1k     |        mosquitto-2.0.21        | NOK | https://autobuild.buildroot.org/results/b960593c032270777fce2b9fbeadabed3be29998 |     
   armeb     |          mtdev-1.1.6           | NOK | https://autobuild.buildroot.org/results/f3668970885eeda1706892582edbf17a9ac664ca |     
   mips64    |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/7e8e6bb29e7b3ee7742529ef1cda7a1af9703aae |     
powerpc64le  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/88a1186b00c7d2399dc25f1b9c61e52d4625dd70 | ORPH
    or1k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/704d2ed5c40248e85d844c878dccd84f08fc979a |     
powerpc64le  |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/905b15bcdcaa12e6104aa57c939d6cd3f452a9e2 |     
   armeb     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/5f2662e906ae35736215c8c61cd8b5b54bf2d9b8 |     
    m68k     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/4b0e83ece44b2503c64feaa08dd5ac1704289fa6 |     
   sh4eb     |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/fdaec89e16303db71138956ccbfc1406b0f83481 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/5a3a2186393dba7f70a24312a74a419c51199444 |     
   mipsel    |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/6e44e8157adc649e540ab8581441c36c3812f973 | ORPH
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/6df69e5f4326499b83153b9aba6be029ef06e28c | ORPH
   armeb     |           proj-9.5.1           | NOK | https://autobuild.buildroot.org/results/e8d37f141245b3fa3f22b6968fa4ac5393204a52 |     
powerpc64le  |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/a5c513ef9a2ae15ab88df6602802fe040c2314da |     
 microblaze  |       qpid-proton-0.35.0       | NOK | https://autobuild.buildroot.org/results/22a53c2c2c479af8c90a71074224f3c9d5f3b68f |     
    arc      |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/dcd02451aaf8331f9bbfbc0ccae8fc69d2d5731e | ORPH
 powerpc64   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/19fdf70d28423e01672d5d02f69bfeb395c2e45c | ORPH
microblazeel |         samba4-4.21.4          | NOK | https://autobuild.buildroot.org/results/8a834a98468da405de1f37c7512c7aa3ad8e45e9 |     
   s390x     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/39c3430ed781b930bafd6df1d88a2dfb4a4ef8a4 |     
    arm      |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/3e8048cc3529d36a5aa68f791a14bf84310435a0 |     
    arm      |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/72870650bc7147d999ed2cecabbecac354939be4 |     
 powerpc64   |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/c717a4be2a9a6309372ea30d0538ca4adff0a94a |     
    sh4      |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/3377e36168e7b8a16a99e12f01b1a366760b6e95 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/e8af8b3037d63c198d25b388e66c7d6b63e45130 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/49e14c8664d0de34d31d183e0c66e2784696667b |     
   mipsel    |          zeromq-4.3.5          | NOK | https://autobuild.buildroot.org/results/a7afbee4dad9a7ee56c2f5c83ad994360ab99c26 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                host-m4-1.4.19 | 3 
              containerd-2.0.2 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
                 logsurfer-1.8 | 1 
                    polkit-125 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/14deb5e6e4c3549324a92f2a7c83e453907b5139 |     
   s390x     | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/423201bed45b846c9ec8a3c551e7caed24f40755 |     
  riscv32    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7283dcf4bbd4b4d81f4f89f4a73d5c1dbfa099d7 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d948c055dcd32275770a316272bb71e5b93d9175 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/44f71c31595c438d72e98b7195a492ad1aa21356 | ORPH
    m68k     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/8ea413495e18e21c6583a803e4f72a68a8420a0c |     
    or1k     |           polkit-125           | NOK | https://autobuild.buildroot.org/results/6528c3b0eb873bd4a39d51c26221999191f68e64 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/00e93a037e3a4c09b75a898880f7fb87cf407321 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org         |   version    |   upstream   | orph?
-------------------------------+----------+-----------------------------------------------+--------------+--------------+-------
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.3        | ORPH
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/013117 | 3.37.2       | 48.0         |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/021316 | 4.6.1        | 4.7.2        |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2025.1       | ORPH
                      alsa-lib |  DISTRO  | https://release-monitoring.org/project/000038 | 1.2.13       | 1.2.14       |     
                    alsa-utils |  DISTRO  | https://release-monitoring.org/project/000037 | 1.2.13       | 1.2.14       |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/013989 | 4.2.2+git... | 15.0.0_r36   |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/006170 | 10.0         | 12.0         |     
                         argus |  DISTRO  | https://release-monitoring.org/project/000107 | 3.0.8.2      | 5.0.2        | ORPH
                      asterisk |  DISTRO  | https://release-monitoring.org/project/009838 | 20.11.1      | 22.4.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/007841 | 2.50.0       | 2.56.2       |     
                           atf |  DISTRO  | https://release-monitoring.org/project/021394 | 0.21         | 0.23         | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/007962 | 2.36.2       | 2.36.3       |     
                          atop |  DISTRO  | https://release-monitoring.org/project/000135 | 2.11.0       | 2.11.1       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/015225 | 3.1.2        | 4.0.3        |     
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/000142 | 2023.02.20   | 2024.10.16   | ORPH
                      automake |  DISTRO  | https://release-monitoring.org/project/000144 | 1.16.5       | 1.17         | ORPH
                       avocado |  DISTRO  | https://release-monitoring.org/project/013385 | 98.0         | 110.0        | ORPH
                       avrdude |  DISTRO  | https://release-monitoring.org/project/010751 | 7.2          | 8.0          |     
                   babeltrace2 |  DISTRO  | https://release-monitoring.org/project/007137 | 2.0.6        | 2.1.1        |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
               bash-completion |  DISTRO  | https://release-monitoring.org/project/005667 | 2.11         | 2.16.0       | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/014740 | 2024.2       | 2025.1       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/019529 | 2024.4       | 2025.1       |     
                            bc |  DISTRO  | https://release-monitoring.org/project/000170 | 1.07.1       | 1.08.1       | ORPH
                  bcache-tools |  DISTRO  | https://release-monitoring.org/project/021397 | 1.0.8        | 1.1          | ORPH
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/021323 | 1.73         | 1.75         | ORPH
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/014746 | 4.4.8        | 5.4.15       | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/014378 | 4.4.8        | 5.4.15       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/080042 | 4.4.8        | 5.4.15       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.14      | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/014923 | 9.18.33      | 9.20.8       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/007981 | 2.43.1       | 2.44         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/000192 | 2.15.1       | 3.1.0        |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/013618 | 28.0         | 29.0         |     
                        blake3 |  DISTRO  | https://release-monitoring.org/project/369414 | 1.5.4        | 1.8.2        |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.82         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.82         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/000211 | 7.20.2       | 8.0.2        |     
                         boost |  DISTRO  | https://release-monitoring.org/project/006845 | 1.83.0       | 1.88.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/021578 | 4.3.1        | 5.3.6        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/000214 | 3.5.0        | 3.8.1        | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.1.0       | 7.5.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.19.1       | 0.23.2       |     
                        brltty |  DISTRO  | https://release-monitoring.org/project/000220 | 6.6          | 6.7          |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/000227 | 6.10         | 6.14         | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/021325 | 0.5.10       | 0.6.3        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/021326 | 0.5.5        | 0.5.7        | ORPH
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/009026 | 20241223     | 20250419     |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/007959 | 1.16.2       | 1.18.0       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/021403 | 1.0.0        | 1.2.1        |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/010888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/011515 | 0.10.4       | 1.1.0        |     
                        catch2 |  DISTRO  | https://release-monitoring.org/project/007680 | 3.8.0        | 3.8.1        |     
                        ccache |  DISTRO  | https://release-monitoring.org/project/000257 | 4.11.2       | 4.11.3       | ORPH
                          ccid |  DISTRO  | https://release-monitoring.org/project/002612 | 1.5.2        | 1.6.2        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/085785 | 3.9.1        | 4.4.9        | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/000276 | 3.7          | 20200710     |     
                chocolate-doom |  DISTRO  | https://release-monitoring.org/project/008547 | 3.0.1        | 3.1.0        |     
                        circus |  DISTRO  | https://release-monitoring.org/project/021726 | 0.16.1       | 0.19.0       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/000291 | 1.0.8        | 1.4.2        |     
                         clang |  DISTRO  | https://release-monitoring.org/project/011811 | 15.0.3       | 20.1.4       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/020578 | 2.3.2        | 2.5.0        |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/010503 | 3.0.21.02.21 | 3.0.25.02.14 |     
                   cloudflared |  DISTRO  | https://release-monitoring.org/project/186920 | 2025.1.0     | 2025.100.150 |     
                        clpeak |  DISTRO  | https://release-monitoring.org/project/015180 | 1.1.2        | 1.1.4        |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/000306 | 3.31.5       | 4.0.2        |     
                        cmocka |  DISTRO  | https://release-monitoring.org/project/011779 | 1.1.5        | 1.1.7        |     
                   cni-plugins |  DISTRO  | https://release-monitoring.org/project/096794 | 1.3.0        | 1.6.2        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/000330 | 4.3.2        | 4.3.8        |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/021882 | 0.9.1        | 0.10.0       | ORPH
                   compiler-rt |  DISTRO  | https://release-monitoring.org/project/017705 | 15.0.3       | 20.1.4       |     
                      composer |  DISTRO  | https://release-monitoring.org/project/009710 | 2.5.8        | 2.8.8        |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/096793 | 2.1.8        | 2.1.13       |     
                       connman |  DISTRO  | https://release-monitoring.org/project/000337 | 1.42         | 1.44         |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/000338 | 1.4.7        | 1.4.8        | ORPH
                    containerd |  DISTRO  | https://release-monitoring.org/project/016460 | 2.0.2        | 2.1.0        |     
                     coreutils |  DISTRO  | https://release-monitoring.org/project/000343 | 9.5          | 9.7          | ORPH
                   cpp-httplib |  DISTRO  | https://release-monitoring.org/project/274636 | 0.19.0       | 0.20.1       |     
                      cracklib |  DISTRO  | https://release-monitoring.org/project/000362 | 2.9.11       | 2.10.3       |     
                          criu |  DISTRO  | https://release-monitoring.org/project/000366 | 3.19         | 4.1          |     
                       crudini |  DISTRO  | https://release-monitoring.org/project/021669 | 0.9.5        | 0.9.6        |     
                          crun |  DISTRO  | https://release-monitoring.org/project/096792 | 1.18.2       | 1.21         |     
               cryptodev-linux |  DISTRO  | https://release-monitoring.org/project/021409 | 1.13         | 1.14         | ORPH
                       cukinia |  DISTRO  | https://release-monitoring.org/project/138119 | 0.6.0        | 0.7.0        | ORPH
                          cups |  DISTRO  | https://release-monitoring.org/project/000380 | 2.4.11       | 2.4.12       |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/005541 | 1.28.17      | 2.0.1        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/021335 | 2.11.0       | 4.9.0        |     
                          dado |  DISTRO  | https://release-monitoring.org/project/058442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/021412 | 3.3.0        | 3.4.0        | ORPH
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/010252 | 3.3.0        | 3.4.0        | ORPH
                         dante |  DISTRO  | https://release-monitoring.org/project/014716 | 1.4.3        | 1.4.4        | ORPH
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.9        | 3.0.19       |     
                     darkhttpd |  DISTRO  | https://release-monitoring.org/project/000391 | 1.15         | 1.16         |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.13.4       | ORPH
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.3.6        | ORPH
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.2.2        | ORPH
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.4.1        | ORPH
                         dav1d |  DISTRO  | https://release-monitoring.org/project/018920 | 1.5.0        | 1.5.1        |     
                        davfs2 |  DISTRO  | https://release-monitoring.org/project/007487 | 1.7.0        | 1.7.1        | ORPH
                          dbus |  DISTRO  | https://release-monitoring.org/project/005356 | 1.14.10      | 1.16.2       | ORPH
                     dbus-glib |  DISTRO  | https://release-monitoring.org/project/001979 | 0.112        | 0.114        | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/000402 | 1.2.18       | 1.4.0        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/015086 | 7.2.641      | 7.3.1        | ORPH
                      ddrescue |  DISTRO  | https://release-monitoring.org/project/000410 | 1.28         | 1.29.1       | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/021341 | 4.11         | 5.22         | ORPH
                         delve |  DISTRO  | https://release-monitoring.org/project/040149 | 1.22.1       | 1.24.2       |     
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/000421 | 0.26         | 0.28         | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/011429 | 10.1.0       | 10.2.2       |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/000431 | 1.3-20220117 | 1.3-20250116 | ORPH
                     diffutils |  DISTRO  | https://release-monitoring.org/project/000436 | 3.10         | 3.12         | ORPH
                         dillo |  DISTRO  | https://release-monitoring.org/project/000438 | 3.0.5        | 3.2.0        | ORPH
                          dlib |  DISTRO  | https://release-monitoring.org/project/018600 | 19.24.6      | 19.24.8      |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/021076 | 27.5.1       | 28.1.1       |     
             docker-cli-buildx |  DISTRO  | https://release-monitoring.org/project/325723 | 0.16.1       | 0.23.0       | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/006185 | 2.32.4       | 2.36.0       |     
         docker-credential-gcr |  DISTRO  | https://release-monitoring.org/project/377457 | v2.1.26      | 2.1.29       | ORPH
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/000447 | 27.5.1       | 28.1.1       |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/021342 | 2024.4       | 2025.1       |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/000456 | 2.3.21.1     | 2.4.0        |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/021418 | 0.5.21.1     | 2.4.0        |     
                          dpdk |  DISTRO  | https://release-monitoring.org/project/000459 | 24.11.1      | 25.03        |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/010627 | 059          | 107          |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/000462 | 9.21.4       | 9.31.0       |     
                      dropbear |  DISTRO  | https://release-monitoring.org/project/000466 | 2024.86      | 2025.88      |     
                     dropwatch |  DISTRO  | https://release-monitoring.org/project/021344 | 1.5.4        | 1.5.5        |     
                            dt |  DISTRO  | https://release-monitoring.org/project/021844 | 18.32        | 21.27        | ORPH
                       dtbocfg |  DISTRO  | https://release-monitoring.org/project/235269 | 0.1.0        | 0.1.1        |     
                      dump1090 |  DISTRO  | https://release-monitoring.org/project/231403 | 9.0          | 10.0.1       |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 1.1.2        | 1.2.0        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/017392 | 1.7          | 1.8.2        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/017770 | 3.1.7        | 3.2.2        |     
                            ed |  DISTRO  | https://release-monitoring.org/project/000659 | 1.20.2       | 1.21.1       | ORPH
                           efl |  DISTRO  | https://release-monitoring.org/project/006128 | 1.26.3       | 1.28.1       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/000667 | 24.07        | 25.04        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/005679 | 0.192        | 0.193        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/017781 | 0.69         | 0.77         | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/006601 | 2.3.3        | 2.8.4        |     
                          enet |  DISTRO  | https://release-monitoring.org/project/000696 | 1.3.17       | 1.3.18       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/000698 | 0.25.4       | 0.27.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/000707 | 26.0.2       | 27.3.4       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/017060 | 1.0.23       | 1.0.24       |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/045375 | 1.0.23       | 1.0.25       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/009302 | 0.6.14       | 0.8.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/010576 | 1.0.54       | 1.0.57       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/009222 | 1.0.30       | 1.0.31       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/010455 | 1.1.21       | 1.1.22       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/008643 | 1.0.26       | 1.0.27       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/045378 | 1.0.16       | 1.0.18       |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/063188 | 1.8.5        | 1.8.6        |     
                      espflash |  DISTRO  | https://release-monitoring.org/project/373490 | 3.2.0        | 3.3.0        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/005482 | 2.9.6.0      | 2.9.7.0      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/000767 | 2.6.3        | 2.6.6        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/094441 | 1.2.5        | 1.2.8        |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/000769 | 0.27.6       | 0.28.5       |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.20.19      | 0.21.3       |     
                         faad2 |  DISTRO  | https://release-monitoring.org/project/013755 | 2.11.1       | 2.11.2       |     
                         fastd |  DISTRO  | https://release-monitoring.org/project/017116 | 22           | 23           |     
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.1.8        | 3.3.1        |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/005405 | 6.1.2        | 7.1.1        |     
                           fio |  DISTRO  | https://release-monitoring.org/project/000806 | 3.38         | 3.39         |     
                     firewalld |  DISTRO  | https://release-monitoring.org/project/009989 | 2.0.2        | 2.3.0        | ORPH
                          flac |  DISTRO  | https://release-monitoring.org/project/000817 | 1.4.3        | 1.5.0        |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/007421 | 0.26.0       | 0.26.7       |     
                   flatbuffers |  DISTRO  | https://release-monitoring.org/project/016642 | 24.12.23     | 25.2.10      |     
                          flot |  DISTRO  | https://release-monitoring.org/project/007184 | 0.8.3        | 4.2.6        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/000823 | 1.3.7        | 1.4.3        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 4.0.0        | 4.0.1        |     
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/010437 | 2.4.3        | 2.4.6        |     
                           fmt |  DISTRO  | https://release-monitoring.org/project/011526 | 11.0.2       | 11.2.0       |     
                       fmtools |  DISTRO  | https://release-monitoring.org/project/021435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/000826 | 4.7.0        | 6.7.2        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/000827 | 2.16.0       | 2.16.2       | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.16.2       | 1.22.3       |     
                         fping |  DISTRO  | https://release-monitoring.org/project/000834 | 5.2          | 5.3          |     
                      freeipmi |  DISTRO  | https://release-monitoring.org/project/000848 | 1.6.14       | 1.6.15       |     
             freeradius-server |  DISTRO  | https://release-monitoring.org/project/000853 | 3.2.6        | 3.2.7        |     
                    fscryptctl |  DISTRO  | https://release-monitoring.org/project/270981 | 1.0.0        | 1.2.0        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.13         | 1.15         |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/021438 | 1.9.1        | 1.12.0       |     
                         fwupd |  DISTRO  | https://release-monitoring.org/project/005833 | 2.0.4        | 2.0.9        |     
                          gawk |  DISTRO  | https://release-monitoring.org/project/000868 | 5.3.1        | 5.3.2        | ORPH
                gcc-bare-metal |  DISTRO  | https://release-monitoring.org/project/006502 | 14.2.0       | 15.1.0       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/011801 | 3.40.0       | 4.4.0.1      | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/000881 | 3.8.2        | 3.11.0       |     
                          gdbm |  DISTRO  | https://release-monitoring.org/project/000882 | 1.24         | 1.25         | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/067634 | 2.5.5        | 2.8.14       |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/018420 | 2.4.1        | 2.5.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/000898 | 0.22.4       | 0.25         | ORPH
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/011337 | 15.5.0       | 17.11.1      |     
                       gkrellm |  DISTRO  | https://release-monitoring.org/project/001170 | 2.3.11       | 2.4.0        |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/021353 | 2.76.0       | 2.80.1       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/007960 | 2.76.0       | 2.84.0       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/001181 | 1.0.0        | 1.0.1        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/008732 | 0.7.0        | 0.7.1        |     
            gmrender-resurrect |  DISTRO  | https://release-monitoring.org/project/021445 | 0.1          | 0.3          |     
                      gnuchess |  DISTRO  | https://release-monitoring.org/project/001206 | 6.2.9        | 6.2.11       | ORPH
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/001215 | 2.4.7        | 2.5.6        |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/001217 | 3.10.11.0    | 3.10.12.0    |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/001223 | 1.82.0       | 1.84.0       | ORPH
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/021085 | 2.3.2        | 2.5.4        |     
                         gperf |  DISTRO  | https://release-monitoring.org/project/001237 | 3.1          | 3.3          | ORPH
                          gqrx |  DISTRO  | https://release-monitoring.org/project/009771 | 2.15.9       | 2.17.6       |     
                    gr-osmosdr |  DISTRO  | https://release-monitoring.org/project/021447 | 0.2.4        | 0.2.6        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/005410 | 6.2.0        | 7.6.0        | ORPH
                          grep |  DISTRO  | https://release-monitoring.org/project/001251 | 3.11         | 3.12         |     
                         grout |  DISTRO  | https://release-monitoring.org/project/375897 | 0.9.1        | 0.10.0       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/019117 | 1.66.1       | 1.72.0       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/013139 | 45.0         | 48.0         |     
                           gsl |  DISTRO  | https://release-monitoring.org/project/001267 | 2.7.1        | 2.8          | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/021856 | 1.24.11      | 1.26.1       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/021846 | 0.13.1       | 2.2.0        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/021848 | 1.24.11      | 1.26.1       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/021849 | 1.24.11      | 1.26.1       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/021850 | 1.24.11      | 1.26.1       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/021852 | 1.24.11      | 1.26.1       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/015187 | 1.24.11      | 1.26.1       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/003881 | 1.24.11      | 1.26.1       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/021853 | 1.24.11      | 1.26.1       | ORPH
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/021855 | 1.24.11      | 1.26.1       | ORPH
                          gstd |  DISTRO  | https://release-monitoring.org/project/235022 | 0.15.0       | 0.15.2       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/001263 | 1.24.11      | 1.26.1       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.24.11      | 1.26.1       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/018290 | 1.16.0       | 1.17.0       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/007724 | 3.24.7       | 5.16.0       |     
                         guile |  DISTRO  | https://release-monitoring.org/project/001277 | 3.0.9        | 3.0.10       |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/001281 | 1.6.6        | 1.6.8        |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/001282 | 0.14.1       | 0.14.3       |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/001284 | 0.12.1       | 0.12.2       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/001285 | 5.2.14       | 5.3.5        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/005496 | 1.48.1       | 1.57.2       | ORPH
                          gzip |  DISTRO  | https://release-monitoring.org/project/001290 | 1.13         | 1.14         | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/006136 | 2023.01.1    | 2024.02.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/001298 | 2.6.15       | 3.1.7        |     
                heirloom-mailx |  DISTRO  | https://release-monitoring.org/project/095708 | 12.5         | 14.9.25      |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/001327 | 3.17.10      | 3.25.2       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/001332 | 3.3.0        | 3.4.1        | ORPH
                       htpdate |  DISTRO  | https://release-monitoring.org/project/132187 | 1.3.7        | 2.0.0        |     
                         hwloc |  DISTRO  | https://release-monitoring.org/project/013501 | 2.11.2       | 2.12.0       |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/021355 | 2.50.2       | 2.56.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/016134 | 73-2         | 77-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/021670 | 2.9          | 2.14         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/021673 | 0.8.41       | 0.8.44       | ORPH
                  igh-ethercat |  DISTRO  | https://release-monitoring.org/project/021674 | 1.6.3        | 1.6.4        |     
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/001372 | 7.1.1-43     | 7.1.1-47     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/021676 | 1.7.3        | 1.12.5       |     
                          inih |  DISTRO  | https://release-monitoring.org/project/011600 | 58           | 60           | ORPH
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/008864 | 3.20.2.2     | 4.23.9.0     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/020342 | 22.7.1       | 22.7.2       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/020341 | 25.1.4       | 25.2.1       |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/021679 | 3.506        | 3.507        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/001391 | 3.1.9        | 3.2.1        | ORPH
                     iptraf-ng |  DISTRO  | https://release-monitoring.org/project/007034 | 1.2.1        | 1.2.2        |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/001402 | 1.9.3        | 1.9.4        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/013286 | 0.26         | 0.27         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/018380 | 3.0          | 3.8          | ORPH
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.35.2       | 1.38.0       |     
                       jansson |  DISTRO  | https://release-monitoring.org/project/001417 | 2.14         | 2.14.1       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/015715 | 1.1.2        | 1.3.1        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/001421 | 2.0.33       | 4.2.5        |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/001459 | 0.81         | 0.83         |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/029701 | 3.6.1        | 3.6.3        | ORPH
                          jose |  DISTRO  | https://release-monitoring.org/project/011761 | 11           | 14           |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/001648 | 2.1.5        | 3.1.0        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/013910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/021681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/059395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/021815 | 1.13.1       | 1.14.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/021816 | 1.10.4       | 1.14.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/021817 | 1.19.5       | 1.21.0       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/001492 | 2.6.4        | 2.7.1        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/001504 | 2.2.8        | 2.3.3        |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/012689 | 2.0.30       | 2.0.31       |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.14.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.14.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.14.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.14.0       |     
                          kmod |  DISTRO  | https://release-monitoring.org/project/001517 | 33           | 34.2         |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/021462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.2        | 3.5.3        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/012418 | 2.2.0        | 2.3.1        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/016901 | 0.13         | 0.14.1       | ORPH
                         lcms2 |  DISTRO  | https://release-monitoring.org/project/009815 | 2.16         | 2.17         |     
                        ledmon |  DISTRO  | https://release-monitoring.org/project/012346 | 1.0.0        | 1.1.0        |     
                          less |  DISTRO  | https://release-monitoring.org/project/001550 | 661          | 668          | ORPH
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20250127.0   | 20250127.1   |     
                         libao |  DISTRO  | https://release-monitoring.org/project/007629 | 1.2.0        | 1.2.2        | ORPH
                     libassuan |  DISTRO  | https://release-monitoring.org/project/001559 | 2.5.7        | 3.0.2        | ORPH
                       libavif |  DISTRO  | https://release-monitoring.org/project/178015 | 1.1.1        | 1.3.0        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/001567 | 0.11.7       | 0.12.2       | ORPH
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/007869 | 2.10         | 2.11         | ORPH
                libcamera-apps |  DISTRO  | https://release-monitoring.org/project/328456 | 1.5.0        | 1.7.0        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/001575 | 2.0.3        | 3.2.0        |     
                        libclc |  GUESS   | https://release-monitoring.org/project/376264 | 15.0.3       | 20.1.4       |     
                     libconfig |  DISTRO  | https://release-monitoring.org/project/001580 | 1.7.3        | 1.8          |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/015531 | 2.10.18      | 2.10.19      | ORPH
                      libde265 |  DISTRO  | https://release-monitoring.org/project/011239 | 1.0.15       | 1.0.16       |     
                      libdecor |  DISTRO  | https://release-monitoring.org/project/312806 | 0.1.1        | 0.2.2        |     
                    libdeflate |  DISTRO  | https://release-monitoring.org/project/242778 | 1.22         | 1.24         |     
                        libdex |  DISTRO  | https://release-monitoring.org/project/328356 | 0.8.1        | 0.10.0       |     
                       libdmtx |  DISTRO  | https://release-monitoring.org/project/012833 | 0.7.7        | 0.7.8        |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/020540 | 1.13.1       | 1.13.4       |     
                       libexif |  DISTRO  | https://release-monitoring.org/project/001607 | 0.6.24       | 0.6.25       | ORPH
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/012043 | 0.99.9.1     | 1.2304.0     |     
                       libfcgi |  DISTRO  | https://release-monitoring.org/project/059392 | 2.4.5        | 2.4.6        | ORPH
                         libfm |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.0        | ORPH
                   libfm-extra |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.0        | ORPH
                   libfreeglut |  DISTRO  | https://release-monitoring.org/project/000846 | 3.4.0        | 3.6.0        |     
                     libgcrypt |  DISTRO  | https://release-monitoring.org/project/001623 | 1.11.0       | 1.11.1       | ORPH
                        libgee |  DISTRO  | https://release-monitoring.org/project/001625 | 0.20.6       | 0.20.8       |     
                    libgeotiff |  DISTRO  | https://release-monitoring.org/project/021361 | 1.7.3        | 1.7.4        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/001174 | 2.6.4        | 3.40.0       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/010024 | 2.84.0       | 2.84.1       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/012098 | 1.4.0        | 1.7.0        | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/001628 | 1.51         | 1.55         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/001239 | 1.23.2       | 1.24.2       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/012558 | 2.5.27       | 2.5.31       | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/020640 | 1.6.5        | 2.2.1        | ORPH
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/001563 | 2.2.1        | 2.2.2        | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/311549 | 3.24.43      | 3.24.49      |     
                       libgtk4 |  DISTRO  | https://release-monitoring.org/project/013942 | 4.14.5       | 4.18.5       |     
                       libheif |  DISTRO  | https://release-monitoring.org/project/064439 | 1.18.2       | 1.19.8       |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/001632 | 0.5.48       | 0.5.50       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/010656 | 1.15         | 1.18         | ORPH
                     libid3tag |  DISTRO  | https://release-monitoring.org/project/021478 | 0.15.1b      | 0.16.3       | ORPH
                        libidn |  DISTRO  | https://release-monitoring.org/project/001639 | 1.42         | 1.43         |     
                       libidn2 |  DISTRO  | https://release-monitoring.org/project/005597 | 2.3.7        | 2.3.8        |     
                        libiio |  DISTRO  | https://release-monitoring.org/project/015689 | 0.25         | 0.26         |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/021479 | 0.10.3       | 2.3.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/005781 | 1.27.0       | 1.28.1       | ORPH
                      libiscsi |  DISTRO  | https://release-monitoring.org/project/010862 | 1.20.0       | 1.20.2       | ORPH
                       libjcat |  DISTRO  | https://release-monitoring.org/project/229583 | 0.2.1        | 0.2.3        |     
                        libjwt |  DISTRO  | https://release-monitoring.org/project/242868 | 3.2.0        | 3.2.1        |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 2.0.5        | 2.0.6        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/021363 | 2.48         | 248          |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/021483 | 0.31         | 0.32         | ORPH
                    libmanette |  DISTRO  | https://release-monitoring.org/project/229630 | 0.2.11       | 0.2.12       |     
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/007470 | 1.10.0       | 1.12.2       |     
                   libmediaart |  DISTRO  | https://release-monitoring.org/project/013148 | 1.9.6        | 1.9.7        |     
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/001986 | 2.2.7        | 2.3.2        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/016827 | 0.10.1alpha  | 1.11         |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/031639 | 2.1.28       | 3.7.1        |     
        libnetfilter_conntrack |  DISTRO  | https://release-monitoring.org/project/001675 | 1.0.9        | 1.1.0        |     
                        libnfs |  DISTRO  | https://release-monitoring.org/project/007325 | 5.0.3        | 6.0.2        | ORPH
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/001681 | 1.2.7        | 1.2.9        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/001683 | 0.1.21       | 0.1.22       |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/075209 | 4.2.2        | 6.2.1        |     
                        libodb |  DISTRO  | https://release-monitoring.org/project/001687 | 2.4.0        | 2.5.0        | ORPH
                  libodb-boost |  DISTRO  | https://release-monitoring.org/project/001688 | 2.4.0        | 2.5.0        |     
                  libodb-mysql |  DISTRO  | https://release-monitoring.org/project/001689 | 2.4.0        | 2.5.0        |     
                  libodb-pgsql |  DISTRO  | https://release-monitoring.org/project/001690 | 2.4.0        | 2.5.0        | ORPH
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/021365 | 2.5.1        | 2.6.0        |     
                    libopenssl |  DISTRO  | https://release-monitoring.org/project/002566 | 3.4.1        | 3.5.0        | ORPH
                     libostree |  DISTRO  | https://release-monitoring.org/project/010899 | 2023.8       | 2025.2       |     
                        libp11 |  DISTRO  | https://release-monitoring.org/project/001699 | 0.4.12       | 0.4.13       | ORPH
                       libpeas |  DISTRO  | https://release-monitoring.org/project/006871 | 1.32.0       | 2.0.7        | ORPH
                      libplist |  DISTRO  | https://release-monitoring.org/project/011675 | 2.4.0        | 2.6.0        | ORPH
                        libpng |  DISTRO  | https://release-monitoring.org/project/001705 | 1.6.46       | 1.6.48       |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/021367 | 7.9.2        | 7.10.1       |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/011042 | 1.6.0        | 1.6.1        | ORPH
                        libraw |  DISTRO  | https://release-monitoring.org/project/001709 | 0.21.2       | 0.21.4       |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/012102 | 3.9.2        | 4.1.0        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/005420 | 2.50.9       | 2.60.0       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/010717 | 2.0.5        | 2.0.6        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/013823 | 2.5.5        | 2.6.0        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/013150 | 0.20.5       | 0.21.7       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/001717 | 3.7          | 3.8.1        |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/001718 | 3.7          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/001719 | 3.7          | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/007961 | 3.4.0        | 3.6.0        |     
                    libsigsegv |  DISTRO  | https://release-monitoring.org/project/001722 | 2.14         | 2.15         |     
                     libsodium |  DISTRO  | https://release-monitoring.org/project/001728 | 1.0.18       | 1.0.20       |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/007908 | 0.7.30       | 0.7.32       |     
                 libsoundtouch |  DISTRO  | https://release-monitoring.org/project/115722 | 2.3.3        | 2.4.0        |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/004864 | 1.9.3        | 2.1.0        |     
                       libspdm |  DISTRO  | https://release-monitoring.org/project/369161 | 3.5.0        | 3.7.0        |     
                       libssh2 |  DISTRO  | https://release-monitoring.org/project/001730 | 1.11.0       | 1.11.1       | ORPH
                    libstrophe |  DISTRO  | https://release-monitoring.org/project/015633 | 0.13.1       | 0.14.0       |     
                     libtalloc |  DISTRO  | https://release-monitoring.org/project/001733 | 2.4.2        | 2.4.3        |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/011793 | 1.1.1        | 1.2.0        | ORPH
                       libtool |  DISTRO  | https://release-monitoring.org/project/001741 | 2.4.6        | 2.5.4        | ORPH
                    libtorrent |  DISTRO  | https://release-monitoring.org/project/001742 | 0.13.8       | 0.15.3       | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/004166 | 1.2.19       | 2.0.11       |     
                       libtpms |  GUESS   | https://release-monitoring.org/project/116460 | 0.9.6        | 0.10.0       |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/021371 | 0.8.2        | 0.9.2        |     
                   libucontext |  DISTRO  | https://release-monitoring.org/project/017085 | 1.2          | 1.3.2        |     
                     libuhttpd |  DISTRO  | https://release-monitoring.org/project/089386 | 3.14.1       | 3.14.2       |     
                   libunibreak |  DISTRO  | https://release-monitoring.org/project/326564 | 5.1          | 6.1          |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/021315 | 1.14.19      | 1.14.21      |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/015849 | 0.21.0       | 1.0.2        | ORPH
                       liburcu |  DISTRO  | https://release-monitoring.org/project/007134 | 0.14.0       | 0.15.2       |     
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.6          | 2.9          |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/010784 | 1.50.0       | 1.51.0       |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/009998 | 1.28.1       | 1.30.1       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/005097 | 8.10.6       | 8.16.1       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/013830 | 7.10.0       | 11.3.0       |     
                  libvncserver |  DISTRO  | https://release-monitoring.org/project/001756 | 0.9.14       | 0.9.15       | ORPH
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.14.0       | 2023.4.0     |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/011083 | 1.15.0       | 1.15.1       |     
                        libxcb |  DISTRO  | https://release-monitoring.org/project/001767 | 1.15         | 1.17.0       | ORPH
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/001780 | 1.7.0        | 1.9.2        |     
                       libxml2 |  DISTRO  | https://release-monitoring.org/project/001783 | 2.13.8       | 2.14.2       |     
                       libxmlb |  GUESS   | https://release-monitoring.org/project/179028 | 0.3.19       | 0.3.22       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/011129 | 5.2.0        | 5.4.0        | ORPH
                       libxslt |  DISTRO  | https://release-monitoring.org/project/013301 | 1.1.42       | 1.1.43       |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/018554 | 2.1.148      | 3.12.2       |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 1.2.1        | 1.3.4        |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 1.2.1        | 1.3.4        |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/010649 | 1.10.1       | 1.11.3       | ORPH
                          lilv |  DISTRO  | https://release-monitoring.org/project/001818 | 0.24.12      | 0.24.26      |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/001823 | 4.4.8        | 5.2.6        | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20250311     | 20250509     |     
                     linux-pam |  DISTRO  | https://release-monitoring.org/project/012244 | 1.6.1        | 1.7.0        | ORPH
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/014535 | 1.6.0        | 1.7.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/012414 | 2021.05.03   | 2025.05.08   | ORPH
                  lksctp-tools |  DISTRO  | https://release-monitoring.org/project/021497 | 1.0.19       | 1.0.21       | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/001830 | 15.0.3       | 20.1.4       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/014019 | 1.0.18       | 1.0.19       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/001830 | 15.0.3       | 20.1.4       |     
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/010135 | 0.1.19       | 0.2.0        | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/001835 | 2.1.0        | 2.1.2        | ORPH
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/015330 | 1.3.1        | 1.4.0        |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/011671 | 1.0.1-1      | 1.2.2        |     
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/011649 | 0.9.5-1      | 0.9.6        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/000155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/007135 | 2.13.1       | 2.13.9       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/007141 | 2.13.10      | 2.13.18      |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/007136 | 2.13.8       | 2.13.15      |     
                           lua |  DISTRO  | https://release-monitoring.org/project/001847 | 5.1.5        | 5.4.7        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/013887 | 0.15-0       | 0.17.2       |     
                      luaposix |  DISTRO  | https://release-monitoring.org/project/011729 | 36.2.1       | 36.3         |     
                         lutok |  DISTRO  | https://release-monitoring.org/project/021509 | 0.4          | 0.6.1        | ORPH
                           luv |  DISTRO  | https://release-monitoring.org/project/021510 | 1.43.0-0     | 1.51.0-0     | ORPH
                          luvi |  DISTRO  | https://release-monitoring.org/project/021512 | 2.14.0       | 2.15.0       | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/005354 | 2.03.27      | 2.03.32      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/001860 | 5.0.3        | 6.0.4        |     
                         lynis |  DISTRO  | https://release-monitoring.org/project/001862 | 3.1.3        | 3.1.4        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2409         | ORPH
                            m4 |  DISTRO  | https://release-monitoring.org/project/001871 | 1.4.19       | 1.4.20       | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.5        | 1.7.7        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/001887 | 10.11.6      | 11.8.1       | ORPH
                  matchbox-lib |  DISTRO  | https://release-monitoring.org/project/021187 | 1.12         | 1.14         | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/001893 | 1.5.26       | 1.5.28       |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/013824 | 2.28.10      | 3.6.3        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/015518 | 20220418     | 20250429     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/008093 | 194          | 206          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/016553 | 0.1.6.4      | 0.1.7.0      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/021746 | 4.4.8        | 5.4.15       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/001965 | 1.6.29       | 1.6.38       | ORPH
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/001970 | 24.0.9       | 25.1.0       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/001970 | 24.0.9       | 25.1.0       | ORPH
                         meson |  DISTRO  | https://release-monitoring.org/project/006472 | 1.7.0        | 1.8.0        |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/015392 | 2.25.1       | 3.56.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/021519 | 0.02         | 2.8.0        |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2024.06      | 2025.03      |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/010539 | 1.22.2       | 1.25.0       |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/001978 | 5.6.1        | 5.11.0       |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/021522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.0.10       |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/021100 | 2024.12      | 2025.04      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/010267 | 20221107     | 20240407     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/020836 | 0.11.6       | 0.21.1       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/068638 | 2.9.7        | 3.0.14       |     
                         monit |  DISTRO  | https://release-monitoring.org/project/005483 | 5.34.3       | 5.35.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/006360 | 6.12.0.182   | 6.14.1       |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/011578 | 4.0.0        | 4.0.1        |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/002019 | 4.1.1        | 4.2.2        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/012413 | 1.32.8       | 1.32.10      |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/005348 | 0.35.1       | 0.40.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/012278 | 3.3.0        | 7.0.0        |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/002026 | 2.2.1        | 2.3.0        |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/008868 | 1.1.6        | 1.1.7        |     
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/000424 | 0.9.8        | 0.11.1       |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/002034 | 1.23.9       | 1.25.6       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/002035 | 2.2.13       | 2.2.14       |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/013545 | 3.3.1        | 4.0.4        |     
                       mxt-app |  DISTRO  | https://release-monitoring.org/project/373381 | 1.38         | 1.42         |     
                          nano |  DISTRO  | https://release-monitoring.org/project/002046 | 8.2          | 8.4          | ORPH
                       nanomsg |  DISTRO  | https://release-monitoring.org/project/014540 | 1.2          | 1.2.1        |     
                           nbd |  DISTRO  | https://release-monitoring.org/project/002052 | 3.25         | 3.26.1       | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/006045 | 1.22         | 2.8.2        |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/002055 | 0.49         | 0.52         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/002057 | 6.4-20230603 | 6.5-20250510 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/021531 | 1.0.7        | 1.0.8        | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/007604 | 0.33.0       | 0.34.2       | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 2.0.5        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/002063 | 3.1.19       | 4.2.3        | ORPH
                      netavark |  DISTRO  | https://release-monitoring.org/project/242639 | v1.14.0      | 1.14.1       | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/021534 | 1.218        | 1.229        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/011046 | 1.33.1       | 2.5.1        |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/021917 | 0.7.3        | 0.7.12       |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.1.49       | 2.4.1        |     
                   netsniff-ng |  DISTRO  | https://release-monitoring.org/project/002071 | 0.6.8        | 0.6.9        |     
                       netsurf |  DISTRO  | https://release-monitoring.org/project/005386 | 3.10         | 3.11         |     
                          newt |  DISTRO  | https://release-monitoring.org/project/015129 | 0.52.23      | 0.52.25      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.0        | 1.1.3        |     
               nftables-python |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.0        | 1.1.3        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/008651 | 1.64.0       | 1.65.0       | ORPH
                         nginx |  DISTRO  | https://release-monitoring.org/project/005413 | 1.26.3       | 1.28.0       | ORPH
                        ngircd |  DISTRO  | https://release-monitoring.org/project/002083 | 26.1         | 27           | ORPH
                          nmap |  DISTRO  | https://release-monitoring.org/project/002096 | 7.95         | 7.96         | ORPH
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/008251 | 22.13.1      | 24.0.1       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/008251 | 22.13.1      | 24.0.1       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/021539 | 2.1.9        | 3.0.0        | ORPH
                          norm |  DISTRO  | https://release-monitoring.org/project/021540 | 1.5.8        | 1.5.9        | ORPH
                       nushell |  DISTRO  | https://release-monitoring.org/project/031106 | 0.96.1       | 0.104.0      | ORPH
                           nut |  DISTRO  | https://release-monitoring.org/project/002510 | 2.8.2        | 2.8.3        |     
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/002511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/021843 | 390.151      | 390.157      | ORPH
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 575.51.02    | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 560.35.03    | 575.51.02    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/009074 | 1.12         | 2.13         | ORPH
                         oatpp |  DISTRO  | https://release-monitoring.org/project/370050 | 1.3.0        | 1.3.1        |     
                        octave |  DISTRO  | https://release-monitoring.org/project/002528 | 9.4.0        | 10.1.0       |     
                           odb |  DISTRO  | https://release-monitoring.org/project/002531 | 2.4.0        | 2.5.0        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/016859 | 2.2          | 2.17         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/033334 | v1.12.12     | 14.3.4       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/021545 | 4.3.1        | 4.3.3        | ORPH
                     oniguruma |  DISTRO  | https://release-monitoring.org/project/011184 | 6.9.9        | 6.9.10       |     
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/010861 | 2.1.9        | 2.1.11       |     
                     open-isns |  DISTRO  | https://release-monitoring.org/project/009393 | 0.102        | 0.103        |     
                     open-lldp |  DISTRO  | https://release-monitoring.org/project/115714 | 1.1          | 1.1.1        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/016896 | v1.3.15      | 1.4.11.1     | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/008172 | 1.22.0       | 1.24.3       | ORPH
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2024.05.08   | 2024.10.24   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/021548 | 0.1.5        | 0.1.6        | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/006615 | 3.4.19       | 4.11.0       | ORPH
                       opencv4 |  DISTRO  | https://release-monitoring.org/project/006615 | 4.10.0       | 4.11.0       |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.11.0       | 0.13.1       |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/002549 | 2.0.36       | 2.0.37       | ORPH
                    openlayers |  DISTRO  | https://release-monitoring.org/project/006847 | 10.2.1       | 10.5.0       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/002554 | 4.1.5        | 5.0.7        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/011687 | 0.56         | 0.62.2       |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/021551 | 3.13.2       | 3.16.3       | ORPH
                        opensc |  DISTRO  | https://release-monitoring.org/project/002559 | 0.26.0       | 0.26.1       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/010998 | 11.3.5-18... | 12.5.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/059397 | 0.7.0        | 0.8.0        | ORPH
                          opus |  DISTRO  | https://release-monitoring.org/project/011081 | 1.4          | 1.5.2        |     
                           orc |  DISTRO  | https://release-monitoring.org/project/002573 | 0.4.34       | 0.4.41       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/021691 | 4.4.8        | 5.4.15       | ORPH
                     osm2pgsql |  DISTRO  | https://release-monitoring.org/project/002575 | 2.0.1        | 2.1.1        |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/002582 | 0.25.3       | 0.25.5       | ORPH
                         p7zip |  DISTRO  | https://release-monitoring.org/project/002583 | 17.05        | 17.06        |     
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/021376 | 1.3.2        | 1.5.2        |     
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.28         | 1.30         |     
                         pango |  DISTRO  | https://release-monitoring.org/project/011783 | 1.54.0       | 1.56.3       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/007958 | 2.50.1       | 2.56.1       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/010309 | 0.7          | 0.65         | ORPH
                         patch |  DISTRO  | https://release-monitoring.org/project/002597 | 2.7.6        | 2.8          | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/002598 | 0.13         | 0.18.0       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/002601 | 1.3.7        | 1.3.8        | ORPH
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/002611 | 2.1.0        | 2.3.3        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/021378 | 3.5          | 3.6          |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/011930 | 2.33         | 3.04         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/002743 | 0.02         | 0.21         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/002748 | 0.33         | 0.35         |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/002785 | 6.95         | 6.97         |     
            perl-datetime-tiny |  DISTRO  | https://release-monitoring.org/project/002802 | 1.07         | 1.08         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/002807 | 4.046        | 5.012        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/002811 | 1.643        | 1.647        |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/012660 | 2.77         | 2.83         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/006175 | 12.50        | 13.29        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/006569 | 2.080        | 2.089        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/003024 | 6.77         | 6.78         |     
           perl-module-runtime |  DISTRO  | https://release-monitoring.org/project/003111 | 0.016        | 0.018        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/005966 | 9.38         | 9.39         |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/003136 | 20240924     | 20250202     |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/003147 | 1.48         | 1.50         |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/003163 | 0.72         | 0.74         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/011962 | 0.146        | 0.148        |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/014338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/014406 | 2.006000     | 2.008002     |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/003485 | 5.31         | 5.32         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/003527 | 2.0134       | 2.0210       |     
                           php |  DISTRO  | https://release-monitoring.org/project/003627 | 8.3.19       | 8.4.7        |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/015603 | 2.0.0        | 2.1.2        |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/011010 | 5.1.22       | 5.1.24       |     
                     php-gnupg |  DISTRO  | https://release-monitoring.org/project/021743 | 1.5.1        | 1.5.2        | ORPH
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/017401 | 3.7.0        | 3.8.0        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/017400 | 3.2.0        | 3.3.0        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/021742 | 1.4          | 1.4.1        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/013302 | 3.3.1        | 3.4.2        |     
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/012515 | 2.2.3        | 2.2.4        | ORPH
                        physfs |  DISTRO  | https://release-monitoring.org/project/003631 | 3.0.2        | 3.2.0        |     
                      pico-sdk |  DISTRO  | https://release-monitoring.org/project/373461 | 1.5.1        | 2.1.1        |     
                      picotool |  DISTRO  | https://release-monitoring.org/project/373463 | 1.1.2        | 2.1.1        |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/057357 | 1.2.7        | 1.4.2        |     
                        pixman |  DISTRO  | https://release-monitoring.org/project/003648 | 0.44.2       | 0.46.0       | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/012753 | 2.3.0        | 2.4.3        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/003674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/005418 | 1.13.2       | 1.14.1       |     
                        podman |  DISTRO  | https://release-monitoring.org/project/093284 | v5.4.1       | 5.4.2        | ORPH
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 4.3          | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/003682 | 125          | 126          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/003686 | 22.12.0      | 25.05.0      |     
                    postgresql |  DISTRO  | https://release-monitoring.org/project/005601 | 17.4         | 17.5         |     
                         pound |  DISTRO  | https://release-monitoring.org/project/005436 | 4.8          | 4.16         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/010715 | 1.3.11       | 1.3.13       | ORPH
                       privoxy |  DISTRO  | https://release-monitoring.org/project/003712 | 3.0.34       | 4.0.0        |     
                         procs |  DISTRO  | https://release-monitoring.org/project/076458 | 0.14.9       | 0.14.10      |     
                       proftpd |  DISTRO  | https://release-monitoring.org/project/007609 | 1.3.8b       | 1.3.9        | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/021570 | 9.5.1        | 9.6.0        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/003709 | 0.11.14      | 13.0.1       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 29.3         | 30.2         |     
                    protobuf-c |  DISTRO  | https://release-monitoring.org/project/003716 | 1.5.1        | 1.5.2        | ORPH
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/006499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/021825 | 6.0.1        | 6.5.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/003721 | 23.5         | 23.7         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/003726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/003728 | 1.14         | 1.15         |     
                         putty |  DISTRO  | https://release-monitoring.org/project/005749 | 0.81         | 0.83         |     
                            pv |  DISTRO  | https://release-monitoring.org/project/003736 | 1.9.0        | 1.9.31       | ORPH
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/034074 | 3.1.15       | 3.1.16       |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/021243 | 0.4.12       | 0.4.14       |     
                 python-aiodns |  DISTRO  | https://release-monitoring.org/project/021245 | 3.2.0        | 3.4.0        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/006713 | 3.11.14      | 3.11.18      |     
           python-aiohttp-cors |  DISTRO  | https://release-monitoring.org/project/012956 | 0.8.0        | 0.8.1        |     
                python-aiojobs |  DISTRO  | https://release-monitoring.org/project/021252 | 1.3.0        | 1.4.0        |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/003766 | 1.14.1       | 1.15.2       |     
              python-aniso8601 |  DISTRO  | https://release-monitoring.org/project/163255 | 10.0.0       | 10.0.1       |     
                  python-anyio |  DISTRO  | https://release-monitoring.org/project/049275 | 4.8.0        | 4.9.0        |     
            python-argcomplete |  DISTRO  | https://release-monitoring.org/project/003773 | 3.5.3        | 3.6.2        |     
              python-async-lru |  DISTRO  | https://release-monitoring.org/project/056566 | 2.0.4        | 2.0.5        |     
               python-asyncssh |  DISTRO  | https://release-monitoring.org/project/017555 | 2.19.0       | 2.21.0       |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/015099 | 25.1.0       | 25.3.0       |     
                python-automat |  DISTRO  | https://release-monitoring.org/project/015101 | 24.8.1       | 25.4.16      |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/011984 | 2.16.0       | 2.17.0       |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/009047 | 4.2.1        | 4.3.0        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/003779 | 4.12.3       | 4.13.4       |     
               python-bitarray |  DISTRO  | https://release-monitoring.org/project/011014 | 3.0.0        | 3.4.0        |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/014665 | 4.3.0        | 4.3.1        |     
               python-bluezero |  DISTRO  | https://release-monitoring.org/project/021929 | 0.9.0        | 0.9.1        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/029737 | 1.37.34      | 1.38.13      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/008748 | 1.37.33      | 1.38.13      |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/011101 | 0.13.2       | 0.13.3       |     
                python-bsdiff4 |  DISTRO  | https://release-monitoring.org/project/044268 | 1.2.5        | 1.2.6        |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/007022 | 5.5.1        | 6.0.0b4      |     
                 python-calver |  DISTRO  | https://release-monitoring.org/project/100823 | 2022.6.26    | 2025.4.17    |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/014813 | 2.1.7        | 2.2.0a2      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/007995 | 2024.12.14   | 2025.4.26    |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/021937 | 4.2.0        | 4.2.2        |     
     python-charset-normalizer |  DISTRO  | https://release-monitoring.org/project/055366 | 3.4.0        | 3.4.2        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/020163 | 10.0.1       | 11.0.0b3     |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/003802 | 8.1.8        | 8.2.0        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/019734 | 1.1.30       | 2.0.2        |     
              python-contourpy |  DISTRO  | https://release-monitoring.org/project/244705 | 1.3.1        | 1.3.2        |     
                   python-cppy |  DISTRO  | https://release-monitoring.org/project/089055 | 1.3.0        | 1.3.1        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/005532 | 44.0.1       | 44.0.3       |     
              python-cssselect |  DISTRO  | https://release-monitoring.org/project/011593 | 1.2.0        | 1.3.0        |     
             python-cssselect2 |  DISTRO  | https://release-monitoring.org/project/086109 | 0.7.0        | 0.8.0        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/036699 | 3.0.11       | 3.1.0        |     
               python-dateutil |  DISTRO  | https://release-monitoring.org/project/005621 | 2.9.0        | 2.9.0.post0  |     
              python-dbus-fast |  DISTRO  | https://release-monitoring.org/project/287975 | 2.34.0       | 2.44.1       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/003819 | 5.1.1        | 5.2.1        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/003828 | 5.1.8        | 5.2.1        |     
                 python-dotenv |  DISTRO  | https://release-monitoring.org/project/019788 | 1.0.1        | 1.1.0        |     
               python-dtschema |  DISTRO  | https://release-monitoring.org/project/100908 | 2024.11      | 2025.2       |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/008370 | 0.19.0       | 0.19.1       |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/015064 | 4.11.2       | 4.12.1       |     
                  python-evdev |  DISTRO  | https://release-monitoring.org/project/062869 | 1.9.0        | 1.9.2        |     
                python-fastapi |  DISTRO  | https://release-monitoring.org/project/047977 | 0.115.8      | 0.115.12     |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/011739 | 3.17.0       | 3.18.0       |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/019867 | 5.0.0        | 5.0.1        |     
          python-flask-smorest |  DISTRO  | https://release-monitoring.org/project/025028 | 0.45.0       | 0.46.1       |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/085010 | 2.0.7        | 25.2.10      |     
              python-flit-core |  DISTRO  | https://release-monitoring.org/project/044841 | 3.11.0       | 3.12.0       |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/007388 | 4.55.6       | 4.58.0       |     
             python-frozenlist |  DISTRO  | https://release-monitoring.org/project/041138 | 1.5.0        | 1.6.0        |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 11.13.0      | 15.3.0       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/013158 | 3.50.0       | 3.52.3       |     
        python-google-api-core |  DISTRO  | https://release-monitoring.org/project/025386 | 2.24.1       | 2.24.2       |     
            python-google-auth |  DISTRO  | https://release-monitoring.org/project/038039 | 2.38.0       | 2.40.1       |     
python-googleapis-common-pr... |  DISTRO  | https://release-monitoring.org/project/063943 | 1.66.0       | 1.70.0       |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/006870 | 3.1.1        | 3.2.2        |     
          python-grpc-requests |  DISTRO  | https://release-monitoring.org/project/132701 | 0.1.20       | 0.1.21       |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/018429 | 1.70.0       | 1.72.0       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/030542 | 1.70.0       | 1.72.0       |     
                python-grpclib |  DISTRO  | https://release-monitoring.org/project/039170 | 0.4.7        | 0.4.8        |     
                    python-h11 |  DISTRO  | https://release-monitoring.org/project/017549 | 0.14.0       | 0.16.0       |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/019033 | 4.1.0        | 4.2.0        |     
python-hatch-fancy-pypi-readme |  DISTRO  | https://release-monitoring.org/project/274452 | 24.1.0       | 25.1.0       |     
                    python-hid |  DISTRO  | https://release-monitoring.org/project/049364 | 1.0.6        | 1.0.7        |     
                python-hiredis |  DISTRO  | https://release-monitoring.org/project/012002 | 3.1.0        | 3.1.1        |     
               python-httpcore |  DISTRO  | https://release-monitoring.org/project/079947 | 1.0.7        | 1.0.9        |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/019799 | 4.11.0       | 4.12.3       |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/011771 | 2.4.1        | 2.4.2-1      |     
              python-iniconfig |  DISTRO  | https://release-monitoring.org/project/114778 | 2.0.0        | 2.1.0        |     
               python-iptables |  DISTRO  | https://release-monitoring.org/project/011475 | 1.0.1        | 1.2.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/001399 | 8.31.0       | 9.2.0        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/051611 | 1.5          | 1.7.0        |     
                     python-jc |  DISTRO  | https://release-monitoring.org/project/028963 | 1.25.4       | 1.25.5       |     
                python-jeepney |  DISTRO  | https://release-monitoring.org/project/019564 | 0.8.0        | 0.9.0        |     
python-jsonschema-specifica... |  DISTRO  | https://release-monitoring.org/project/316377 | 2024.10.1    | 2025.4.1     |     
             python-legacy-cgi |  DISTRO  | https://release-monitoring.org/project/375190 | 2.6.2        | 2.6.3        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/012301 | 3.2.0        | 3.3.1        |     
                python-logbook |  DISTRO  | https://release-monitoring.org/project/020016 | 1.8.0        | 1.8.1        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/003914 | 5.3.0        | 5.4.0        |     
         python-magic-wormhole |  DISTRO  | https://release-monitoring.org/project/017278 | 0.17.0       | 0.18.0       |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/003915 | 1.3.8        | 1.3.10       |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/003916 | 3.7          | 3.8          |     
            python-marshmallow |  DISTRO  | https://release-monitoring.org/project/008079 | 3.26.0       | 4.0.0        |     
 python-marshmallow-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/050566 | 1.4.0        | 1.4.2        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/003919 | 3.10.0       | 3.10.3       |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/042653 | 1.8.3        | 1.8.5        |     
           python-meson-python |  DISTRO  | https://release-monitoring.org/project/248985 | 0.17.1       | 0.18.0       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/006189 | 3.1.0        | 3.1.3        |     
              python-modbus-tk |  DISTRO  | https://release-monitoring.org/project/022813 | 1.1.4        | 1.1.5        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/012201 | 10.6.0       | 10.7.0       |     
              python-multidict |  DISTRO  | https://release-monitoring.org/project/011132 | 6.1.0        | 6.4.3        |     
        python-mypy-extensions |  DISTRO  | https://release-monitoring.org/project/023367 | 1.0.0        | 1.1.0        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/002509 | 1.25.0       | 2.2.5        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.1.5        | 1.05a1       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/031737 | 3.10.15      | 3.10.18      |     
              python-packaging |  DISTRO  | https://release-monitoring.org/project/060461 | 24.2         | 25.0         |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/003954 | 3.5.0        | 3.5.1        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/003960 | 6.1.0        | 6.1.1        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/007974 | 11.1.0       | 11.2.1       |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/006529 | 25.0         | 25.1.1       |     
              python-posix-ipc |  DISTRO  | https://release-monitoring.org/project/013204 | 1.1.1        | 1.2.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/008742 | 3.0.50       | 3.0.51       |     
              python-propcache |  DISTRO  | https://release-monitoring.org/project/375192 | 0.2.1        | 0.3.1        |     
             python-proto-plus |  DISTRO  | https://release-monitoring.org/project/099887 | 1.26.0       | 1.26.1       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 29.3         | 30.2         |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/003978 | 6.1.1        | 7.0.0        |     
                python-psygnal |  DISTRO  | https://release-monitoring.org/project/218690 | 0.11.1       | 0.13.0       |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/003980 | 2024.1.3     | 2025.1       |     
                 python-pyalsa |  DISTRO  | https://release-monitoring.org/project/003767 | 1.2.12       | 1.2.14       |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/011987 | 0.4.1        | 0.4.2        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/013166 | 1.27.0       | 1.28.0       |     
                python-pycares |  DISTRO  | https://release-monitoring.org/project/019900 | 4.5.0        | 4.8.0        |     
                python-pycrate |  DISTRO  | https://release-monitoring.org/project/185106 | 0.7.8        | 0.7.9        |     
          python-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/036851 | 3.21.0       | 3.22.0       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/021582 | 20241204.1   | 20250501.1   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/029768 | 2.10.6       | 2.11.4       |     
          python-pydantic-core |  DISTRO  | https://release-monitoring.org/project/273695 | 2.29.0       | 2.34.1       |     
      python-pydantic-settings |  DISTRO  | https://release-monitoring.org/project/342182 | 2.7.1        | 2.9.1        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/016219 | 0.31         | 0.32         |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/012004 | 2.14         | 2.15.2       |     
               python-pylibfdt |  DISTRO  | https://release-monitoring.org/project/269896 | 1.7.2        | 1.7.2.post1  |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/015600 | 3.8.6        | 3.9.2        |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/017320 | 1.23.22      | 1.25.5       |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/003756 | 3.2.1        | 3.2.3        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/015558 | 3.12.0       | 3.13.0       |     
     python-pyproject-metadata |  DISTRO  | https://release-monitoring.org/project/255630 | 0.9.0        | 0.9.1        |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/020104 | 5.15.6       | 5.15.11      |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/020081 | 0.8.1        | 0.9.2        |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/021589 | 1.2.10       | 1.2.11       |     
                  python-pysmi |  DISTRO  | https://release-monitoring.org/project/013209 | 1.5.9        | 1.6.1        |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/012027 | 7.1.16       | 7.1.20       |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/007273 | 0.25.3       | 0.26.0       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/006537 | 2024.2       | 2025.2       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/004104 | 25.1.2       | 26.4.0       |     
                 python-qrcode |  DISTRO  | https://release-monitoring.org/project/020011 | 8.1          | 8.2          |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/003992 | 5.2.1        | 6.0.0        |     
               python-reedsolo |  DISTRO  | https://release-monitoring.org/project/081160 | 1.7.0        | 2.0.13       |     
                python-rpds-py |  DISTRO  | https://release-monitoring.org/project/368622 | 0.22.3       | 0.24.0       |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/062048 | 0.10.0       | 0.12.0       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/019641 | 2.1.76       | 2.2.3        |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/010428 | 0.11.4       | 0.12.0       |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/004768 | 1.11.4       | 1.15.3       |     
                  python-segno |  DISTRO  | https://release-monitoring.org/project/059641 | 1.6.1        | 1.6.6        |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/005645 | 4.27.1       | 4.32.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/021603 | 2.21.0       | 3.0.0a1      |     
           python-setproctitle |  DISTRO  | https://release-monitoring.org/project/011699 | 1.3.4        | 1.3.6        |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/004021 | 79.0.1       | 80.4.0       |     
        python-setuptools-rust |  DISTRO  | https://release-monitoring.org/project/122284 | 1.11.0       | 1.11.1       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/007874 | 8.1.0        | 8.3.1        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/010429 | 2.2.1        | 2.2.2        |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/004026 | 3.19.3       | 3.20.1       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/021608 | 1.5.3        | 1.5.4        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/013626 | 4.19.25      | 6.10.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/012729 | 5.0.2        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/007203 | 0.6.1        | 0.7.3        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/021611 | 5.12.1       | 5.13.0       |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/027570 | 2.6          | 2.7          |     
                 python-spidev |  DISTRO  | https://release-monitoring.org/project/021612 | 3.6          | 3.7          |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/004034 | 2.0.39       | 2.0.40       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/029718 | 2.0.0        | 2.0.1        |     
              python-starlette |  DISTRO  | https://release-monitoring.org/project/036570 | 0.45.3       | 0.46.2       |     
                  python-sympy |  DISTRO  | https://release-monitoring.org/project/004923 | 1.13.3       | 1.14.0       |     
              python-termcolor |  DISTRO  | https://release-monitoring.org/project/010198 | 2.5.0        | 3.1.0        |     
           python-tortoise-orm |  DISTRO  | https://release-monitoring.org/project/033168 | 0.24.2       | 0.25.0       |     
                   python-trio |  DISTRO  | https://release-monitoring.org/project/017451 | 0.28.0       | 0.30.0       |     
         python-trio-websocket |  DISTRO  | https://release-monitoring.org/project/136283 | 0.11.1       | 0.12.2       |     
      python-trove-classifiers |  DISTRO  | https://release-monitoring.org/project/088298 | 2025.1.15.22 | 2025.5.9.12  |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/038819 | 4.4.1        | 4.4.2        |     
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/019755 | 4.12.2       | 4.13.2       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/004079 | 2.6.16       | 3.0.2        |     
                python-uvicorn |  DISTRO  | https://release-monitoring.org/project/028526 | 0.34.0       | 0.34.2       |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/019818 | 0.34.0       | 0.35.0       |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/011057 | 64.0         | 65.1         |     
                python-webargs |  DISTRO  | https://release-monitoring.org/project/024711 | 8.6.0        | 8.7.0        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/008100 | 15.0         | 15.0.1       |     
                  python-wheel |  DISTRO  | https://release-monitoring.org/project/011428 | 0.45.1       | 0.46.1       |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/012031 | 3.2.1        | 3.2.3        |     
               python-yamllint |  DISTRO  | https://release-monitoring.org/project/009761 | 1.35.1       | 1.37.1       |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/012895 | 1.18.3       | 1.20.0       |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/012681 | 0.141.0      | 0.147.0      |     
                    qbee-agent |  DISTRO  | https://release-monitoring.org/project/372328 | 2024.36      | 2024.50      |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/021737 | 2.4.7        | 2.5.0        | ORPH
               qoriq-mc-binary |  DISTRO  | https://release-monitoring.org/project/377827 | 10.39.0      | 10.300.138   |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/005542 | 10.5.0       | 12.2.0       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/015198 | 0.35.0       | 0.40.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.0        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.0        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.0        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.0        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.14      | 6.9.0        |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.0        |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.0        |     
                       qt6mqtt |  DISTRO  | https://release-monitoring.org/project/242923 | 6.8.1        | 6.9.0        |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.0        |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.0        |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.0        |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/004141 | 1.4          | 1.5          |     
                         quota |  DISTRO  | https://release-monitoring.org/project/004145 | 4.09         | 4.10         |     
                     quotatool |  DISTRO  | https://release-monitoring.org/project/004146 | 1.6.4        | 1.6.5        | ORPH
                           qwt |  DISTRO  | https://release-monitoring.org/project/004147 | 6.1.6        | 6.3.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/013768 | 0.14.0       | 0.15.0       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/012105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/007426 | 1.9.3        | 1.9.4        |     
                     rdma-core |  DISTRO  | https://release-monitoring.org/project/012907 | 56.0         | 57.0         |     
                      readline |  DISTRO  | https://release-monitoring.org/project/004173 | 8.2          | 8.2.13       | ORPH
               redis-plus-plus |  DISTRO  | https://release-monitoring.org/project/368624 | 1.3.12       | 1.3.14       |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/021663 | 2.20240226   | 2.20250213   |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.5       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/016520 | 3.7          | 20200710     | ORPH
                         rhash |  DISTRO  | https://release-monitoring.org/project/013843 | 1.4.4        | 1.4.5        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/021389 | 1.10.5       | 2.0.1        | ORPH
                        rlwrap |  DISTRO  | https://release-monitoring.org/project/004199 | 0.46.1       | 0.46.2       |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/015560 | 6.20.3       | 10.2.1       |     
                  rpi-firmware |  DISTRO  | https://release-monitoring.org/project/021744 | 1.20250326   | 1.20250430   |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/004218 | 8.2502.0     | 8.2504.0     |     
                       rtl_433 |  DISTRO  | https://release-monitoring.org/project/014997 | 23.11        | 25.02        |     
                      rtorrent |  DISTRO  | https://release-monitoring.org/project/004221 | 0.9.8        | 0.15.3       | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/087994 | 8.1.2        | 8.1.3        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/007462 | 1.2.4        | 1.3.0        |     
                          rust |  DISTRO  | https://release-monitoring.org/project/007635 | 1.82.0       | 1.86.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/007635 | 1.82.0       | 1.86.0       |     
                  rust-bindgen |  DISTRO  | https://release-monitoring.org/project/017910 | 0.65.1       | 0.71.1       | ORPH
                         rygel |  DISTRO  | https://release-monitoring.org/project/004751 | 0.42.5       | 0.44.2       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/010714 | 2.33.1       | 2.37.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/005485 | 2.13.0.0     | 2.13.2.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/016547 | 2.3.7.2      | 2.4.1.0      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/016552 | 1.1.2.0      | 1.1.3.0      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/016551 | 2.6.2.0      | 2.6.3.0      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/016550 | 2.7.0.3      | 2.7.1.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/016549 | 2.3.0.3      | 2.3.1.0      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/016548 | 0.5.4.3      | 0.5.6.0      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/021385 | 3.7.1        | 08032024     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/004758 | 4.21.4       | 4.22.1       |     
                  sane-airscan |  DISTRO  | https://release-monitoring.org/project/121086 | 0.99.33      | 0.99.35      |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/004760 | 1.1.1        | 1.4.0        |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/016338 | 2.0          | 2.1          |     
                         scons |  DISTRO  | https://release-monitoring.org/project/004770 | 4.8.1        | 4.9.1        |     
                   screenfetch |  DISTRO  | https://release-monitoring.org/project/005733 | 3.9.1        | 3.9.9        | ORPH
                        scrypt |  DISTRO  | https://release-monitoring.org/project/021238 | 1.3.2        | 1.3.3        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/004779 | 2.32.2       | 2.32.6       |     
                    sdl2_image |  DISTRO  | https://release-monitoring.org/project/004781 | 2.8.4        | 3.2.4        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/004782 | 2.6.3        | 2.8.1        | ORPH
                      sdl2_ttf |  DISTRO  | https://release-monitoring.org/project/004784 | 2.24.0       | 3.2.2        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/004778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/010262 | 1.0.3        | 2.0.4        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/004787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/015203 | 1.20.0       | 1.49.13      |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/001717 | 3.7          | 3.8.1        |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.7          | 3.8.1        | ORPH
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 2.20.3       | 2.45.0       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.8.4        |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/021655 | 4.3.8        | 4.6.4        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.32.4       |     
                       sexpect |  DISTRO  | https://release-monitoring.org/project/269648 | 2.3.14       | 2.3.15       |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/021384 | 3.3.9        | 4.3.7        | ORPH
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/005524 | 1.12         | 2.4          | ORPH
                          shim |  DISTRO  | https://release-monitoring.org/project/010719 | 15.8         | 16.0         |     
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.1.0        | ORPH
                       skalibs |  DISTRO  | https://release-monitoring.org/project/005486 | 2.14.2.0     | 2.14.4.0     |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/096796 | 4.8.0        | 4.9.0        | ORPH
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/004835 | 7.4          | 7.5          | ORPH
                        snappy |  DISTRO  | https://release-monitoring.org/project/004844 | 1.2.1        | 1.2.2        | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/017075 | 1.7.0        | 1.8.2        | ORPH
                  snmpclitools |  DISTRO  | https://release-monitoring.org/project/031640 | 0.6.4        | 0.7.2        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/021318 | 3.5.1        | 3.6.3        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/013263 | 3.1.40.0     | 3.7.4.0      |     
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.18      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/010152 | 0.7          | 0.8          |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/005388 | 1.6.4        | 1.6.6        | ORPH
                        spdlog |  DISTRO  | https://release-monitoring.org/project/015599 | 1.15.2       | 1.15.3       |     
                       speechd |  DISTRO  | https://release-monitoring.org/project/328138 | 0.11.5       | 0.12.1       |     
                         spice |  DISTRO  | https://release-monitoring.org/project/004871 | 0.15.2       | 0.16.0       | ORPH
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/014892 | 0.14.4       | 0.14.5       | ORPH
                   spirv-tools |  DISTRO  | https://release-monitoring.org/project/334920 | 1.3.261.1    | 1.4.313.0    | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/011213 | 4.5.5        | 4.8.0        |     
                        sqlite |  DISTRO  | https://release-monitoring.org/project/004877 | 3.48.0       | 3.49.2       |     
                         squid |  DISTRO  | https://release-monitoring.org/project/004880 | 6.13         | 7.0.1        | ORPH
                        sratom |  DISTRO  | https://release-monitoring.org/project/014903 | 0.6.14       | 0.6.18       |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/006184 | 2.0.1        | 2.2.3        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/008127 | 1.20.7.1     | 1.22.18      | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/006861 | 6.7.1        | 7.0c         |     
                    stellarium |  DISTRO  | https://release-monitoring.org/project/004891 | 24.3         | 25.1         |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/012538 | 0.18.05      | 0.19.00      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/004899 | 5.9.14       | 6.0.1        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/004901 | 5.71         | 5.74         |     
                   superiotool |  DISTRO  | https://release-monitoring.org/project/010128 | 24.05        | 25.03        |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/010925 | 6.0.19       | 7.0.10       |     
                          sway |  DISTRO  | https://release-monitoring.org/project/011497 | 1.10         | 1.10.1       |     
                          swig |  DISTRO  | https://release-monitoring.org/project/004919 | 4.1.1        | 4.3.1        |     
                         swipl |  DISTRO  | https://release-monitoring.org/project/236197 | 9.2.8        | 9.2.9        |     
                         swtpm |  GUESS   | https://release-monitoring.org/project/116461 | 0.8.2        | 0.10.1       |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/005718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/016898 | 0.29.3       | 0.40.1       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/004930 | 4.8.1        | 4.8.2        |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/021649 | 47.2         | 48.0         |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/034820 | 2.2.150      | 3.6.11       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/004931 | 12.7.5       | 12.7.7       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/005440 | 256.7        | 257.5        |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/011774 | 233          | 235          | ORPH
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/021648 | 3.13         | 3.14         | ORPH
                     tailscale |  DISTRO  | https://release-monitoring.org/project/141585 | 1.78.1       | 1.82.5       |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/009174 | 2.1.58       | 3.0.1        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/008217 | 2021.12.0    | 2022.1.0     |     
                     tcf-agent |  DISTRO  | https://release-monitoring.org/project/021833 | 1.8.0        | 1.9.0        |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/004941 | 8.6.15       | 9.0.1        | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/004942 | 1.2.4        | 1.2.5        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/004943 | 1.21         | 2.0          |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/013716 | 4.4.4        | 4.5.1        | ORPH
                      tealdeer |  DISTRO  | https://release-monitoring.org/project/084521 | 1.6.1        | 1.7.2        |     
               tensorflow-lite |  DISTRO  | https://release-monitoring.org/project/016141 | 2.11.0       | 2.19.0       |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/004951 | 1.12.1       | 1.14.0       |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/014500 | 2.5.6        | 2.5.9        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/005581 | 0.14.1       | 0.21.0       | ORPH
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 4.1.0        | 5.0.2        |     
                      tinycbor |  DISTRO  | https://release-monitoring.org/project/021379 | 0.6.0        | 0.6.1        |     
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/014678 | 20240101     | 20250501     |     
                           tio |  DISTRO  | https://release-monitoring.org/project/020587 | 3.5          | 3.9          |     
                       tipidee |  DISTRO  | https://release-monitoring.org/project/373437 | 0.0.5.0      | 0.0.6.0      |     
                            tk |  DISTRO  | https://release-monitoring.org/project/011426 | 8.6.15       | 9.0.1        |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.1.0        |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/021640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/016819 | 2.3.3        | 3.0.0        | ORPH
                  tpm2-openssl |  DISTRO  | https://release-monitoring.org/project/242488 | 1.2.0        | 1.3.0        |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/018790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/012683 | 3.2.2        | 4.1.3        | ORPH
                          tree |  DISTRO  | https://release-monitoring.org/project/005006 | 2.1.1        | 2.2.1        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/005022 | 2021.07      | 2025.04      | ORPH
                       udpcast |  DISTRO  | https://release-monitoring.org/project/010206 | 20230924     | 20250223     | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.17         | ORPH
                           uhd |  DISTRO  | https://release-monitoring.org/project/012572 | 4.7.0.0      | 4.8.0.0      |     
                       unbound |  DISTRO  | https://release-monitoring.org/project/005042 | 1.21.1       | 1.23.0       |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/017617 | 2.1          | 3.6          | ORPH
                         unrar |  DISTRO  | https://release-monitoring.org/project/013306 | 6.2.12       | 7.1.6        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/015848 | 1.5.12       | 1.9.5        | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/005056 | 0.99.19      | 1.90.9       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/013737 | 4.2.1        | 5.0.1        |     
                usb_modeswitch |  DISTRO  | https://release-monitoring.org/project/005059 | 2.6.1        | 2.6.2        | ORPH
                      usbguard |  DISTRO  | https://release-monitoring.org/project/011151 | 1.1.2        | 1.1.3        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/016012 | 0.14.0       | 0.15.0       | ORPH
                      utf8proc |  DISTRO  | https://release-monitoring.org/project/007455 | 2.9.0        | 2.10.0       | ORPH
                    util-linux |  DISTRO  | https://release-monitoring.org/project/008179 | 2.40.2       | 2.41         | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/008179 | 2.40.2       | 2.41         | ORPH
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/010956 | 0.13.2       | 0.14.0       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/005065 | 0.56.17      | 0.56.18      | ORPH
                      valgrind |  DISTRO  | https://release-monitoring.org/project/013639 | 3.24.0       | 3.25.0       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/018452 | 1.0.2        | 1.0.5        | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/005069 | 2.6.5        | 2.7.5        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/005080 | 1.8.0        | 1.8.3        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/005092 | 9.1.0145     | 9.1.1382     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 9.1.10       |     
                           vlc |  DISTRO  | https://release-monitoring.org/project/006504 | 3.0.21       | 3.0.21-1     |     
                        vnstat |  DISTRO  | https://release-monitoring.org/project/007283 | 2.11         | 2.13         |     
                          volk |  DISTRO  | https://release-monitoring.org/project/147733 | 3.1.2        | 3.2.0        |     
                  vorbis-tools |  DISTRO  | https://release-monitoring.org/project/005104 | 1.4.2        | 1.4.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/010895 | 0.66.2       | 0.80.1       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/089353 | 3.5.12       | 3.5.13       |     
                  vuejs-router |  DISTRO  | https://release-monitoring.org/project/234796 | 4.4.5        | 4.5.1        |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/088835 | 1.3.262      | 1.4.315      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.3.262      | 1.4.315      | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.3.262      | 1.4.315      | ORPH
                        waffle |  DISTRO  | https://release-monitoring.org/project/021633 | 1.7.0        | 1.8.1        |     
                       wavemon |  DISTRO  | https://release-monitoring.org/project/005120 | 0.9.5        | 0.9.6        | ORPH
                       wavpack |  DISTRO  | https://release-monitoring.org/project/005121 | 5.7.0        | 5.8.1        | ORPH
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/013997 | 1.42         | 1.44         | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/005355 | 2.48.1       | 2.49.1       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/015929 | 1.3          | 2.1          | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/013745 | 14.0.1       | 14.0.2       |     
                         which |  DISTRO  | https://release-monitoring.org/project/005127 | 2.21         | 2.23         | ORPH
                         whois |  DISTRO  | https://release-monitoring.org/project/005128 | 5.5.23       | 5.6.0        |     
                          wine |  DISTRO  | https://release-monitoring.org/project/005134 | 10.0         | 10.7         |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.5.5        | 0.5.8        | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/005137 | 4.2.11       | 4.4.6        | ORPH
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.1.0        | 3.8.0        |     
                    wpan-tools |  DISTRO  | https://release-monitoring.org/project/021835 | 0.9          | 0.10         | ORPH
                wpebackend-fdo |  DISTRO  | https://release-monitoring.org/project/017547 | 1.14.3       | 1.16.0       |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/017557 | 2.44.4       | 2.48.1       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.41.0       | 0.43.0       | ORPH
                        x11vnc |  DISTRO  | https://release-monitoring.org/project/010182 | 0.9.16       | 0.9.17       |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/007275 | 3.5          | 4.1          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/015919 | 1.4.27       | 1.4.29       |     
                   xapp_appres |  DISTRO  | https://release-monitoring.org/project/015053 | 1.0.6        | 1.0.7        | ORPH
                 xapp_bdftopcf |  DISTRO  | https://release-monitoring.org/project/015054 | 1.1.1        | 1.1.2        | ORPH
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/000191 | 1.1.0        | 1.1.1        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/017160 | 1.0.8        | 1.0.9        | ORPH
               xapp_fonttosfnt |  DISTRO  | https://release-monitoring.org/project/021723 | 1.2.2        | 1.2.4        | ORPH
                xapp_fslsfonts |  DISTRO  | https://release-monitoring.org/project/017157 | 1.0.6        | 1.0.7        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/015048 | 1.0.9        | 1.0.10       | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/017161 | 1.0.5        | 1.0.6        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/015047 | 1.1.1        | 20240910     | ORPH
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/015043 | 1.2.2        | 1.2.3        | ORPH
                   xapp_oclock |  DISTRO  | https://release-monitoring.org/project/015042 | 1.0.5        | 1.0.6        | ORPH
                      xapp_twm |  DISTRO  | https://release-monitoring.org/project/015038 | 1.0.12       | 1.0.13.1     | ORPH
                  xapp_x11perf |  DISTRO  | https://release-monitoring.org/project/015035 | 1.6.2        | 1.7.0        | ORPH
                    xapp_xauth |  DISTRO  | https://release-monitoring.org/project/005253 | 1.1.2        | 1.1.4        | ORPH
               xapp_xbacklight |  DISTRO  | https://release-monitoring.org/project/005161 | 1.2.3        | 1.2.4        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/015034 | 1.0.4        | 1.0.5        | ORPH
               xapp_xclipboard |  DISTRO  | https://release-monitoring.org/project/015033 | 1.1.4        | 1.1.5        | ORPH
                   xapp_xcmsdb |  DISTRO  | https://release-monitoring.org/project/015031 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xcompmgr |  DISTRO  | https://release-monitoring.org/project/005174 | 1.1.9        | 1.1.10       | ORPH
                 xapp_xconsole |  DISTRO  | https://release-monitoring.org/project/015030 | 1.0.8        | 1.1.0        |     
                 xapp_xditview |  DISTRO  | https://release-monitoring.org/project/021262 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xdm |  DISTRO  | https://release-monitoring.org/project/005255 | 1.1.14       | 1.1.17       | ORPH
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/005180 | 1.2.3        | 1.2.4        | ORPH
                      xapp_xev |  DISTRO  | https://release-monitoring.org/project/015026 | 1.2.5        | 1.2.6        | ORPH
                    xapp_xeyes |  DISTRO  | https://release-monitoring.org/project/015025 | 1.2.0        | 1.3.0        | ORPH
                 xapp_xfontsel |  DISTRO  | https://release-monitoring.org/project/015023 | 1.1.0        | 1.1.1        | ORPH
                      xapp_xfs |  DISTRO  | https://release-monitoring.org/project/005256 | 1.2.1        | 1.2.2        | ORPH
                    xapp_xhost |  DISTRO  | https://release-monitoring.org/project/015021 | 1.0.9        | 1.0.10       | ORPH
                    xapp_xinit |  DISTRO  | https://release-monitoring.org/project/005258 | 1.4.2        | 1.4.4        | ORPH
                  xapp_xkbcomp |  DISTRO  | https://release-monitoring.org/project/015018 | 1.4.6        | 1.4.7        | ORPH
                   xapp_xkbevd |  DISTRO  | https://release-monitoring.org/project/015017 | 1.1.5        | 1.1.6        | ORPH
                 xapp_xkbprint |  DISTRO  | https://release-monitoring.org/project/017159 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xkbutils |  DISTRO  | https://release-monitoring.org/project/015016 | 1.0.5        | 1.0.6        | ORPH
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/014992 | 1.1.4        | 1.2.0        | ORPH
                    xapp_xlogo |  DISTRO  | https://release-monitoring.org/project/014991 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/014964 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xmag |  DISTRO  | https://release-monitoring.org/project/014963 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xman |  DISTRO  | https://release-monitoring.org/project/014962 | 1.1.5        | 1.2.0        | ORPH
                 xapp_xmessage |  DISTRO  | https://release-monitoring.org/project/014961 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xmh |  DISTRO  | https://release-monitoring.org/project/021718 | 1.0.4        | 1.0.5        | ORPH
                    xapp_xmore |  DISTRO  | https://release-monitoring.org/project/018845 | 1.0.3        | 1.0.4        | ORPH
                      xapp_xpr |  DISTRO  | https://release-monitoring.org/project/014959 | 1.1.0        | 1.2.0        | ORPH
                    xapp_xprop |  DISTRO  | https://release-monitoring.org/project/014958 | 1.2.6        | 1.2.8        | ORPH
                   xapp_xrandr |  DISTRO  | https://release-monitoring.org/project/014957 | 1.5.2        | 1.5.3        | ORPH
                 xapp_xrefresh |  DISTRO  | https://release-monitoring.org/project/014955 | 1.0.7        | 1.1.0        | ORPH
                      xapp_xsm |  DISTRO  | https://release-monitoring.org/project/005259 | 1.0.5        | 1.0.6        | ORPH
                     xapp_xwud |  DISTRO  | https://release-monitoring.org/project/014948 | 1.0.6        | 1.0.7        | ORPH
                     xcb-proto |  DISTRO  | https://release-monitoring.org/project/013646 | 1.15.2       | 1.17.0       | ORPH
               xcb-util-cursor |  DISTRO  | https://release-monitoring.org/project/005166 | 0.1.4        | 0.1.5        | ORPH
      xdriver_xf86-input-evdev |  DISTRO  | https://release-monitoring.org/project/005217 | 2.10.6       | 2.11.0       | ORPH
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/005782 | 1.3.0        | 1.5.0        | ORPH
  xdriver_xf86-input-synaptics |  DISTRO  | https://release-monitoring.org/project/005239 | 1.9.2        | 1.10.0       | ORPH
        xdriver_xf86-video-ast |  DISTRO  | https://release-monitoring.org/project/017163 | 1.1.6        | 1.2.0        | ORPH
      xdriver_xf86-video-fbdev |  DISTRO  | https://release-monitoring.org/project/005218 | 0.5.0        | 0.5.1        | ORPH
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/005219 | 2.11.21      | 2.18.1       | ORPH
     xdriver_xf86-video-mach64 |  DISTRO  | https://release-monitoring.org/project/005225 | 6.9.7        | 6.10.0       | ORPH
        xdriver_xf86-video-mga |  DISTRO  | https://release-monitoring.org/project/005226 | 2.0.1        | 2.1.0        | ORPH
    xdriver_xf86-video-nouveau |  DISTRO  | https://release-monitoring.org/project/005229 | 1.0.17       | 1.0.18       | ORPH
         xdriver_xf86-video-nv |  DISTRO  | https://release-monitoring.org/project/021711 | 2.1.22       | 2.1.23       | ORPH
       xdriver_xf86-video-r128 |  DISTRO  | https://release-monitoring.org/project/005232 | 6.12.1       | 6.13.0       | ORPH
     xdriver_xf86-video-savage |  DISTRO  | https://release-monitoring.org/project/005235 | 2.4.0        | 2.4.1        | ORPH
xdriver_xf86-video-siliconm... |  DISTRO  | https://release-monitoring.org/project/005236 | 1.7.9        | 1.7.10       | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/005181 | 4.14.6       | 4.20.0       |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/005182 | 3.2.4        | 3.3.0        | ORPH
               xfont_encodings |  DISTRO  | https://release-monitoring.org/project/015051 | 1.0.7        | 1.1.0        | ORPH
 xfont_font-adobe-utopia-75dpi |  DISTRO  | https://release-monitoring.org/project/017200 | 1.0.4        | 1.0.5        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/015055 | 1.4.0        | 1.4.1        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/005188 | 6.11.0       | 6.14.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/006382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/005191 | 2.38         | 2.44         | ORPH
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/005193 | 1.3.18       | 1.3.19       | ORPH
                    xlib_libFS |  DISTRO  | https://release-monitoring.org/project/001618 | 1.0.9        | 1.0.10       | ORPH
                   xlib_libICE |  DISTRO  | https://release-monitoring.org/project/001638 | 1.1.1        | 1.1.2        | ORPH
                    xlib_libSM |  DISTRO  | https://release-monitoring.org/project/001726 | 1.2.4        | 1.2.6        | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/001764 | 1.8.7        | 1.8.12       | ORPH
                   xlib_libXau |  DISTRO  | https://release-monitoring.org/project/001765 | 1.0.11       | 1.0.12       | ORPH
                   xlib_libXaw |  DISTRO  | https://release-monitoring.org/project/001766 | 1.0.15       | 1.0.16       | ORPH
               xlib_libXcursor |  DISTRO  | https://release-monitoring.org/project/001770 | 1.2.1        | 1.2.3        | ORPH
                 xlib_libXdmcp |  DISTRO  | https://release-monitoring.org/project/001772 | 1.1.4        | 1.1.5        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/001774 | 1.3.5        | 1.3.6        | ORPH
                xlib_libXfont2 |  DISTRO  | https://release-monitoring.org/project/017165 | 2.0.6        | 2.0.7        | ORPH
                   xlib_libXft |  DISTRO  | https://release-monitoring.org/project/001777 | 2.3.8        | 2.3.9        | ORPH
                    xlib_libXi |  DISTRO  | https://release-monitoring.org/project/001778 | 1.8.1        | 1.8.2        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/001785 | 1.1.4        | 1.2.1        | ORPH
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/001788 | 1.5.3        | 1.5.4        | ORPH
               xlib_libXrender |  DISTRO  | https://release-monitoring.org/project/001789 | 0.9.11       | 0.9.12       | ORPH
                    xlib_libXt |  DISTRO  | https://release-monitoring.org/project/001793 | 1.3.0        | 1.3.1        | ORPH
                  xlib_libXtst |  DISTRO  | https://release-monitoring.org/project/001794 | 1.2.4        | 1.2.5        | ORPH
                    xlib_libXv |  DISTRO  | https://release-monitoring.org/project/001795 | 1.0.12       | 1.0.13       | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/001796 | 1.0.13       | 1.0.14       | ORPH
               xlib_libXxf86vm |  DISTRO  | https://release-monitoring.org/project/001799 | 1.1.5        | 1.1.6        | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/001613 | 1.1.7        | 1.1.8        | ORPH
                  xlib_libxcvt |  DISTRO  | https://release-monitoring.org/project/235147 | 0.1.2        | 0.1.3        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/001781 | 1.1.2        | 1.1.3        | ORPH
                   xlib_xtrans |  DISTRO  | https://release-monitoring.org/project/013441 | 1.5.0        | 1.6.0        | ORPH
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/005269 | 6.03         | 6.10.1       |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/007736 | 3.24         | 3.27         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/005272 | 389          | 398          | ORPH
              xutil_makedepend |  DISTRO  | https://release-monitoring.org/project/013528 | 1.0.8        | 1.0.9        | ORPH
             xutil_util-macros |  DISTRO  | https://release-monitoring.org/project/015037 | 1.20.0       | 1.20.2       | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/005277 | 5.6.4        | 5.8.1        | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/005280 | 0.40.0       | 14.1         |     
                            z3 |  DISTRO  | https://release-monitoring.org/project/007812 | 4.13.3       | 4.15.0       |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/005492 | 7.2.5        | 7.2.6        |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.5.1        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 7.2.0        |     
                        zoxide |  DISTRO  | https://release-monitoring.org/project/098400 | 0.9.6        | 0.9.7        |     
                       zziplib |  DISTRO  | https://release-monitoring.org/project/013802 | 0.13.74      | 0.13.79      |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-3015    | https://security-tracker.debian.org/tracker/CVE-2025-3015   
                        assimp | CVE-2025-3016    | https://security-tracker.debian.org/tracker/CVE-2025-3016   
                        assimp | CVE-2025-2152    | https://security-tracker.debian.org/tracker/CVE-2025-2152   
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          dpdk | CVE-2015-1142857 | https://security-tracker.debian.org/tracker/CVE-2015-1142857
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2024-45778   | https://security-tracker.debian.org/tracker/CVE-2024-45778  
                         grub2 | CVE-2024-45782   | https://security-tracker.debian.org/tracker/CVE-2024-45782  
                         grub2 | CVE-2024-45779   | https://security-tracker.debian.org/tracker/CVE-2024-45779  
                         grub2 | CVE-2024-45780   | https://security-tracker.debian.org/tracker/CVE-2024-45780  
                         grub2 | CVE-2025-0678    | https://security-tracker.debian.org/tracker/CVE-2025-0678   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                        libbpf | CVE-2025-29481   | https://security-tracker.debian.org/tracker/CVE-2025-29481  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                       libheif | CVE-2025-43967   | https://security-tracker.debian.org/tracker/CVE-2025-43967  
                       libheif | CVE-2025-43966   | https://security-tracker.debian.org/tracker/CVE-2025-43966  
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2025-43962   | https://security-tracker.debian.org/tracker/CVE-2025-43962  
                        libraw | CVE-2025-43964   | https://security-tracker.debian.org/tracker/CVE-2025-43964  
                        libraw | CVE-2025-43963   | https://security-tracker.debian.org/tracker/CVE-2025-43963  
                        libraw | CVE-2025-43961   | https://security-tracker.debian.org/tracker/CVE-2025-43961  
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     linux-pam | CVE-2024-10041   | https://security-tracker.debian.org/tracker/CVE-2024-10041  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                   micropython | CVE-2024-8947    | https://security-tracker.debian.org/tracker/CVE-2024-8947   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2024-49393   | https://security-tracker.debian.org/tracker/CVE-2024-49393  
                          mutt | CVE-2024-49395   | https://security-tracker.debian.org/tracker/CVE-2024-49395  
                          mutt | CVE-2024-49394   | https://security-tracker.debian.org/tracker/CVE-2024-49394  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2025-26465   | https://security-tracker.debian.org/tracker/CVE-2025-26465  
                       openssh | CVE-2025-26466   | https://security-tracker.debian.org/tracker/CVE-2025-26466  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                           orc | CVE-2024-40897   | https://security-tracker.debian.org/tracker/CVE-2024-40897  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2023-0778    | https://security-tracker.debian.org/tracker/CVE-2023-0778   
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                       qt5base | CVE-2011-3193    | https://security-tracker.debian.org/tracker/CVE-2011-3193   
                       qt5base | CVE-2012-6093    | https://security-tracker.debian.org/tracker/CVE-2012-6093   
                       qt5base | CVE-2014-0190    | https://security-tracker.debian.org/tracker/CVE-2014-0190   
                       qt5base | CVE-2015-1290    | https://security-tracker.debian.org/tracker/CVE-2015-1290   
                       qt5base | CVE-2017-10904   | https://security-tracker.debian.org/tracker/CVE-2017-10904  
                       qt5base | CVE-2017-10905   | https://security-tracker.debian.org/tracker/CVE-2017-10905  
                       qt5base | CVE-2018-21035   | https://security-tracker.debian.org/tracker/CVE-2018-21035  
                       qt5base | CVE-2018-19869   | https://security-tracker.debian.org/tracker/CVE-2018-19869  
                       qt5base | CVE-2018-19871   | https://security-tracker.debian.org/tracker/CVE-2018-19871  
                       qt5base | CVE-2018-19870   | https://security-tracker.debian.org/tracker/CVE-2018-19870  
                       qt5base | CVE-2018-19873   | https://security-tracker.debian.org/tracker/CVE-2018-19873  
                       qt5base | CVE-2020-0570    | https://security-tracker.debian.org/tracker/CVE-2020-0570   
                       qt5base | CVE-2020-17507   | https://security-tracker.debian.org/tracker/CVE-2020-17507  
                       qt5base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sngrep | CVE-2024-3119    | https://security-tracker.debian.org/tracker/CVE-2024-3119   
                        sngrep | CVE-2024-3120    | https://security-tracker.debian.org/tracker/CVE-2024-3120   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                     tcpreplay | CVE-2023-43279   | https://security-tracker.debian.org/tracker/CVE-2023-43279  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                      unixodbc | CVE-2024-1013    | https://security-tracker.debian.org/tracker/CVE-2024-1013   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                           vim | CVE-2024-45306   | https://security-tracker.debian.org/tracker/CVE-2024-45306  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                        xerces | CVE-2024-23807   | https://security-tracker.debian.org/tracker/CVE-2024-23807  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2025.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-3015    | https://security-tracker.debian.org/tracker/CVE-2025-3015   
                        assimp | CVE-2025-3016    | https://security-tracker.debian.org/tracker/CVE-2025-3016   
                        assimp | CVE-2025-2152    | https://security-tracker.debian.org/tracker/CVE-2025-2152   
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          dpdk | CVE-2015-1142857 | https://security-tracker.debian.org/tracker/CVE-2015-1142857
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2024-45778   | https://security-tracker.debian.org/tracker/CVE-2024-45778  
                         grub2 | CVE-2024-45782   | https://security-tracker.debian.org/tracker/CVE-2024-45782  
                         grub2 | CVE-2024-45779   | https://security-tracker.debian.org/tracker/CVE-2024-45779  
                         grub2 | CVE-2024-45780   | https://security-tracker.debian.org/tracker/CVE-2024-45780  
                         grub2 | CVE-2025-0678    | https://security-tracker.debian.org/tracker/CVE-2025-0678   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                        libbpf | CVE-2025-29481   | https://security-tracker.debian.org/tracker/CVE-2025-29481  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                       libheif | CVE-2025-43967   | https://security-tracker.debian.org/tracker/CVE-2025-43967  
                       libheif | CVE-2025-43966   | https://security-tracker.debian.org/tracker/CVE-2025-43966  
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2025-43962   | https://security-tracker.debian.org/tracker/CVE-2025-43962  
                        libraw | CVE-2025-43964   | https://security-tracker.debian.org/tracker/CVE-2025-43964  
                        libraw | CVE-2025-43963   | https://security-tracker.debian.org/tracker/CVE-2025-43963  
                        libraw | CVE-2025-43961   | https://security-tracker.debian.org/tracker/CVE-2025-43961  
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                       libxml2 | CVE-2025-32414   | https://security-tracker.debian.org/tracker/CVE-2025-32414  
                       libxml2 | CVE-2025-32415   | https://security-tracker.debian.org/tracker/CVE-2025-32415  
                     linux-pam | CVE-2024-10041   | https://security-tracker.debian.org/tracker/CVE-2024-10041  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                   micropython | CVE-2024-8947    | https://security-tracker.debian.org/tracker/CVE-2024-8947   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2024-49393   | https://security-tracker.debian.org/tracker/CVE-2024-49393  
                          mutt | CVE-2024-49395   | https://security-tracker.debian.org/tracker/CVE-2024-49395  
                          mutt | CVE-2024-49394   | https://security-tracker.debian.org/tracker/CVE-2024-49394  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2025-26465   | https://security-tracker.debian.org/tracker/CVE-2025-26465  
                       openssh | CVE-2025-26466   | https://security-tracker.debian.org/tracker/CVE-2025-26466  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                           orc | CVE-2024-40897   | https://security-tracker.debian.org/tracker/CVE-2024-40897  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                       qt5base | CVE-2011-3193    | https://security-tracker.debian.org/tracker/CVE-2011-3193   
                       qt5base | CVE-2012-6093    | https://security-tracker.debian.org/tracker/CVE-2012-6093   
                       qt5base | CVE-2014-0190    | https://security-tracker.debian.org/tracker/CVE-2014-0190   
                       qt5base | CVE-2015-1290    | https://security-tracker.debian.org/tracker/CVE-2015-1290   
                       qt5base | CVE-2017-10904   | https://security-tracker.debian.org/tracker/CVE-2017-10904  
                       qt5base | CVE-2017-10905   | https://security-tracker.debian.org/tracker/CVE-2017-10905  
                       qt5base | CVE-2018-21035   | https://security-tracker.debian.org/tracker/CVE-2018-21035  
                       qt5base | CVE-2018-19869   | https://security-tracker.debian.org/tracker/CVE-2018-19869  
                       qt5base | CVE-2018-19871   | https://security-tracker.debian.org/tracker/CVE-2018-19871  
                       qt5base | CVE-2018-19870   | https://security-tracker.debian.org/tracker/CVE-2018-19870  
                       qt5base | CVE-2018-19873   | https://security-tracker.debian.org/tracker/CVE-2018-19873  
                       qt5base | CVE-2020-0570    | https://security-tracker.debian.org/tracker/CVE-2020-0570   
                       qt5base | CVE-2020-17507   | https://security-tracker.debian.org/tracker/CVE-2020-17507  
                       qt5base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sngrep | CVE-2024-3119    | https://security-tracker.debian.org/tracker/CVE-2024-3119   
                        sngrep | CVE-2024-3120    | https://security-tracker.debian.org/tracker/CVE-2024-3120   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        sqlite | CVE-2025-29087   | https://security-tracker.debian.org/tracker/CVE-2025-29087  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                     tcpreplay | CVE-2023-43279   | https://security-tracker.debian.org/tracker/CVE-2023-43279  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                      unixodbc | CVE-2024-1013    | https://security-tracker.debian.org/tracker/CVE-2024-1013   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                           vim | CVE-2024-45306   | https://security-tracker.debian.org/tracker/CVE-2024-45306  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                     wireshark | CVE-2025-1492    | https://security-tracker.debian.org/tracker/CVE-2025-1492   
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                        xerces | CVE-2024-23807   | https://security-tracker.debian.org/tracker/CVE-2024-23807  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
