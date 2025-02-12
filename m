Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4219EC02198
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 04:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D4A540708;
	Wed, 12 Feb 2025 04:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXJzX_kidH7a; Wed, 12 Feb 2025 04:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CB76406D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CB76406D5;
	Wed, 12 Feb 2025 04:14:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E30096C
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 04:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6DAB40701
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 04:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EyzbRZgQn5jP for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 04:14:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3BD27406DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BD27406DD
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BD27406DD
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 04:14:28 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ab7e80c4b55so227998666b.0
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 20:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739333666; x=1739938466;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YVmDCa9x3u2fSaONwM0JPgPt6fO1NzuJzShy54zUOE0=;
 b=NF8uD88VUeM1V2xFWqORAIGVs5ei5tb9LPZWrVG1Y/GP3UDlLdAJn6D3b5Cj0Tvisc
 8Z4o9RBbIjG9JthSXm4Ard/FyCwcnyXxqTcgReT0D+U1pEF56MTkb0Gke1gxDDEZApPF
 mOaRQTq2CH/yRBP8JOYjql9xu4YEQ4v0J0bflhQ6H6VoUq9IsDyQk775aJPK+ivqxbwy
 Yvil9yIyfZvduGYNymw4rCcoP/NpCiyxR+JRdtjpbC5GQslTX1yfkNKikz4iJ2MFVYkO
 QWdaaB6qdOb4sM15hos1D7nYu9fiv1Uog5AtTNmdSmD6TcGoI3Q2aaf0JqOJ4S40uGUg
 d9fQ==
X-Gm-Message-State: AOJu0Yz1Dkx50cAvNiOLpMdAsdp4spYHsryHlSR5tCLdgDtPIH5r92GY
 f3AJQllgA1xRGiZdWxWzEjGTD6TzxWGHl5DvwJAUdFUE9q6F9vXbeKC+Xg==
X-Gm-Gg: ASbGncsD0UFwcYMY1uaSkJDua2n7EIhLvVGK9KU7H8LCNmsfPBvNfmMPlaIo/aOIkLK
 AzQHAt6T1bBTeS/RfFFi9GsTNgvJhc5LO91gkNTiBj7DJhFAy5QDJ6bkqsxWff2pIHBWWQi4NWT
 lNx4rfGdlU1GSqQDLO8IZaKDrdFq4iCZvEjs9hmm7pF/upAgaYyDtOorOhPDSwA/2TolBU3QJcm
 opuyUrPEEpvZPY38lcW4UnXXF1KXe6xjnlZpyZGebao+unB3r2QzU4ZCPTX52Kh/Ib4lrxCIqsk
 3tAps7CL1gCQdrc0suI=
X-Google-Smtp-Source: AGHT+IFzkPEEkYc5ku7ZjC5HKJoHm3bVjwQHmPjlYZzQ+giWBhWdtiz5+Dyy0TPlV5qWaPZNMoTpPw==
X-Received: by 2002:a17:907:3e0e:b0:ab6:d575:3c4c with SMTP id
 a640c23a62f3a-ab7f339c8a4mr101338766b.17.1739333665702; 
 Tue, 11 Feb 2025 20:14:25 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7dc2943c2sm268446366b.168.2025.02.11.20.14.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 20:14:25 -0800 (PST)
Message-ID: <67ac2021.170a0220.353e4.7501@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 12 Feb 2025 04:14:25 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739333666; x=1739938466; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YVmDCa9x3u2fSaONwM0JPgPt6fO1NzuJzShy54zUOE0=;
 b=hcaJWRKgtsAUoXYmpFIWo4xT8T337c7QeSGFs87pcQgYfWBDfUMtVswgHAe8p/NLaK
 Fu19L9rNomuoeNx0jePSeBBmOD/vhgkJLmJPERurBVxLZJtlIEeHcokVchqzTxzakMng
 rlTWc5ObgUg6FMZVCDxTXdVkgzUmbBKBqQ6bKi5s6h7bbI40KPfzcI0PSbYrzDszXzsq
 i073Hd5kCAGF6zrFhm49JW8A71jX2zRzQKp27re3I/VSPW7mf7keZ0RC1TcB5KipAW4V
 Db2zdUGPYN72fNa9jNLGKfzp8GTYU9oqtjZUgkhQ0ppb09YmYQ4R41WNZEAAVl2TuZV9
 Oeow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hcaJWRKg
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-11
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

Autobuild statistics for 2025-02-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  4  |  0  |  7  |
  2024.11.x  |  2  |  3  |  0  |  5  |
    master   | 14  | 141 |  0  | 155 |

Classification of failures by reason for master
-----------------------------------------------

                 sqlite-3.49.0 | 18
                 libcdio-2.2.0 | 9 
                elfutils-0.192 | 8 
  gobject-introspection-1.82.0 | 6 
     linux-5.10.162-cip24-rt10 | 4 
             bluez5_utils-5.79 | 3 
             fontconfig-2.16.0 | 3 
          linux-5.10.162-cip24 | 3 
                 linux-6.12.12 | 3 
               mariadb-10.11.6 | 3 
           oath-toolkit-2.6.12 | 3 
     bandwidthd-2.0.1-auto-r11 | 2 
                   cvs-1.12.13 | 2 
                  ffmpeg-6.1.2 | 2 
                freerdp-2.11.7 | 2 
               harfbuzz-10.2.0 | 2 
    host-python-greenlet-3.1.1 | 2 
httping-0e26c53d5fe504eb720... | 2 
                  libdex-0.8.1 | 2 
                libglvnd-1.4.0 | 2 
        ltp-testsuite-20250130 | 2 
                  ntp-4.2.8p18 | 2 
               openblas-0.3.29 | 2 
               pulseaudio-17.0 | 2 
                       unknown | 2 
                 agentpp-4.6.1 | 1 
                    bat-0.24.0 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.15.1 | 1 
                   botan-3.5.0 | 1 
                  brotli-1.1.0 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                 chicken-5.4.0 | 1 
              containerd-2.0.2 | 1 
                     criu-3.19 | 1 
                   crun-1.18.2 | 1 
                cryptopp-8.9.0 | 1 
          cups-pk-helper-0.2.7 | 1 
                    dust-0.9.0 | 1 
                    flac-1.4.3 | 1 
              fluent-bit-3.2.2 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
            gettext-gnu-0.22.4 | 1 
           ghostscript-10.04.0 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
         host-mosquitto-2.0.20 | 1 
 host-softether-4.30-9700-beta | 1 
               ipmitool-1_8_19 | 1 
                  jack2-1.9.22 | 1 
                  libbpf-1.5.0 | 1 
                 libcddb-1.3.2 | 1 
                libdrm-2.4.124 | 1 
                libgsasl-2.2.1 | 1 
                  libnss-3.107 | 1 
                 libpng-1.6.46 | 1 
                  libsepol-3.7 | 1 
              libtracefs-1.8.1 | 1 
                  libva-2.22.0 | 1 
           libzenoh-pico-1.1.0 | 1 
                   linux-tools | 1 
                   ltris-1.3.2 | 1 
              luabitop-1.0.2-1 | 1 
                  nginx-1.26.2 | 1 
             open62541-v1.3.15 | 1 
                 openssh-9.9p1 | 1 
                   perl-5.40.1 | 1 
pthreadpool-560c60d342a7607... | 1 
       riemann-c-client-1.10.5 | 1 
                   seatd-0.9.1 | 1 
                     shim-15.8 | 1 
                sysklogd-2.7.0 | 1 
             util-linux-2.40.2 | 1 
           v4l2loopback-0.13.2 | 1 
               valgrind-3.23.0 | 1 
wilc-driver-linux4microchip... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/9c8a6fc2b5a74be97dd0591153f83f8e73aebddc |     
   mipsel    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/1273a2ee6031518a774d19e6604b9a0e26f8ba7b |     
    i686     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/a117511f8d95d13af2662d90914ab68e05cc6808 |     
   armeb     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/c650b5a3fb30d741feff8ad8c05677f7a244d02c |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/2d612840c905489a646dbb20e6404f7b6733598d |     
  mips64el   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/589b2cdc2ce58a2b3efbcb7a7800de6c1e1f4e7e |     
 microblaze  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/cd168ab5d12dda8c4610222603286ff4e8828be4 |     
microblazeel |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/2152f184aa7f6c136a8bf4b3b861ac4437f04384 |     
   x86_64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/b99cc6065ad9923dc3a60d960fd87b56d5487ba5 |     
    i586     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/3e66ffcea72f057eaf02802b0099a56842ab62d0 | ORPH
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/8811c22e57103c177ef5a59841d93224c8b51fc9 |     
   s390x     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/b741500cd8cdf6da31fd63abc903e523ca430560 | ORPH
    mips     |         chicken-5.4.0          | NOK | https://autobuild.buildroot.org/results/8b4870b265134234a53b0d48f191a5acddd09c74 |     
powerpc64le  |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/754b43ddb86df3570c379033906a571e45272c4b |     
powerpc64le  |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/f78aa9d28b7096201f9b6cdfa2e159cc23f54a1b |     
    i686     |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/da3933efdde97eae4fb3cd5f2f252f93aef3cc7e |     
  powerpc    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/823976c2f64ce9318440a1546a01c39b4dd5b202 |     
microblazeel |      cups-pk-helper-0.2.7      | NOK | https://autobuild.buildroot.org/results/5e81532e63476624c8162fbf642090ec6544ba65 | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/eda0a9a3b43dd78f218f94a18e21320566a95f8c | ORPH
  powerpc    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1eca0ff3cbe1c95295c6f884dcb6d18ccc164a3b | ORPH
powerpc64le  |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/3dba4446cfa48277bf6c048fee0edfb6408dc8a3 | ORPH
   mipsel    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/56aefbaa9cc4152edec82d08442a51a9567cf664 | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/2d7084ee9d6f6b4945ad612ee7f7c88689269ac4 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/438e83ea5e7ecc696420412ade6548cdfc3c491a | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b9fe0a1b68bcf858e4a1a1fae4fa1ee2664943f5 | ORPH
   mips64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f33970849a38a9e3573e9ee8bdf5f42d007132d7 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/63e5441dd6481d5408899e4b04bc9bde0f128a74 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0378082a878eb402a122b85e0d976ccc73ddf5e3 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/6cde23c2782d3e91bcf0b6ee2da6474ce7881889 | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/208c383ae8be3c53d1a29fbd70beae742e9e4144 |     
powerpc64le  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/a9c6c9f77b8742ffa1530d3e9508f580630f344c |     
   sh4aeb    |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/0258541708df6e22339684699d05c30ba1461823 |     
  aarch64    |        fluent-bit-3.2.2        | NOK | https://autobuild.buildroot.org/results/718b42838f942591bb2048f6f5f0ac6517d61885 |     
 aarch64_be  |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/3a8b8a4875c575da4593645f0de243884a0e56c1 | ORPH
  mips64el   |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/e85d0d4e07fe4ab6300454477c0ba6e9af34f6b3 | ORPH
   armeb     |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/dcb3e60c4a0547d531f8d5481ebcba7730f7d4a0 | ORPH
    i686     |         freerdp-2.11.7         | NOK | https://autobuild.buildroot.org/results/6cb3b71702b3543075e20c43c2d6ddbdb5914388 | ORPH
    i686     |         freerdp-2.11.7         | NOK | https://autobuild.buildroot.org/results/e24c031c8ca4e6edb6a9bd1fa70bc5ca4ccfdaeb | ORPH
 aarch64_be  | fs/axfs/axfs.mk:32: /home/b... | NOK | https://autobuild.buildroot.org/results/14ef63d8f000ba92e60ae7fa12776a84bf4ff67a |     
   armeb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/74ad004fed36ec3e2252bdc74f38a3d1e2bbcb1f | ORPH
   sparc     |      ghostscript-10.04.0       | NOK | https://autobuild.buildroot.org/results/feb33bc5a1958e902d7e22e9a9b84892cab1e86f |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/6e1caa3631cde9e81d8b0a80966d5e12d5f572df |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/924a41cf3a2869341031bb6632fa382467f7a2b9 | ORPH
   mipsel    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/52be3e47c0c3349bd10357fb9bf2b7cf7e2f7094 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/d8f5c14a48d8f3cf49b30de6fc9288f699bb995a | ORPH
    or1k     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/0f4d6010d7935f5dd5392993e28f99cc535b4c8d | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/a12a5e853ca8b82affaf2ab934f044083b86b2f9 | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/78635f1976eef9175d7313b6a1b402a6ca94c870 | ORPH
    or1k     |        harfbuzz-10.2.0         | NOK | https://autobuild.buildroot.org/results/95a7fa4045584759941a52294447bf4f853f0f51 |     
    or1k     |        harfbuzz-10.2.0         | NOK | https://autobuild.buildroot.org/results/21284e6de1733b544c47efb6daae8ffabbba8468 |     
    sh4a     |     host-mosquitto-2.0.20      | NOK | https://autobuild.buildroot.org/results/5dd83e3dcb86c70ee71870eaf13a0eb917582fea |     
  powerpc    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/22cf24b013929c458b392f2dbf705a585fb1f7a7 |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/76f7557ad7d2595c1411152b9f4b47521ea65bd0 |     
    m68k     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/abd87d17c930dd77ae10d32d843a451ae0671aa6 | ORPH
   s390x     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/24929f253c45f3dad90bd8d3ad8ed6e3939f82a1 |     
powerpc64le  | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/3d2623826143b33e3f8e9d73c510b35cbc682bf2 |     
    or1k     |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/d20c22a77f4e79845c022520ec9ab26be2ce2777 |     
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/cdb94093b3e681c226da00ff241b933327803173 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/eec6f0983475dfefefa92a2902917c272c646819 |     
   x86_64    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/9bec7d04bf142886081750bd5b85a8dd8cd92bc1 |     
    arc      |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/1f51ddb79f0c6d87a48f97fd42dd4406fee97df8 |     
    or1k     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/dbba9eca9f1cb77caa168de5cd140ee2778b768c |     
   x86_64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/64be4af1a5f8dfbec4bbd38d6f97b2c888dd323b |     
   mips64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/b7f1a186c8ad6f37fea737cdb562fa5ab2308409 |     
   sh4eb     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/d8897cea93848e5cc1dde364f382334a6da34f2f |     
   s390x     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/42d483d2557a0b7f4f0ba4bc63c129fb31997175 |     
   arceb     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/9dacd023d519ec3e8ae6d1c0552cf874abd239af |     
  mips64el   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/c6735cea14acd259cfb0f6fe697bff90c61e6544 |     
   mipsel    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/4f362723120a51c2636354cf31f6c161783ad6d5 |     
   mipsel    |          libdex-0.8.1          | NOK | https://autobuild.buildroot.org/results/fef9688237b18cf8b39ff950c47318c53c7c5054 |     
   mips64    |          libdex-0.8.1          | NOK | https://autobuild.buildroot.org/results/904a64d55f55aba2e634264edda438822131fa56 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/24e8a0a86085dfad614479caac3075abe52989b7 |     
   mipsel    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/33434c6f1f3b9071ddc0cb19e01c750840cec265 | ORPH
    m68k     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/7d600b7818c80ced919b417d10014e6f57bd374e | ORPH
   x86_64    |         libgsasl-2.2.1         | NOK | https://autobuild.buildroot.org/results/3cb7537012ed0e2a712d294b9aecedf3ecae0892 | ORPH
   armeb     |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/4118505109b105f613f2cf5ffbf4dcc97226014c |     
 microblaze  |         libpng-1.6.46          | NOK | https://autobuild.buildroot.org/results/be90b5f1618f1f5c8ac4f34b74d54f51f57231dd |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/14318520acbe982993cdca7232eac1c47078cbbb |     
microblazeel |        libtracefs-1.8.1        | NOK | https://autobuild.buildroot.org/results/5657b69cf1ad422e8b045f030c3ee835a0b87fdd |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/55e9d9b819d21e259a50f56cdaa9291214a4fdb8 |     
   sh4eb     |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/c962b4ec9a05f8fc76dd0fd72d24d055fa74e990 |     
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f32d4deaee690a93b83800e643b28115d9fa5c3c | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/c773872b5de8229e95149372477fe26ddae1e5f6 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a42ca8c5903a6fcb1b58ac9635481644f7402747 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/20427dfba56c61f0877071ef5f5606835532ed46 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/427e581f5c77a6d77c2f68b48713540d2e6e783b | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/2b69f6d39dd491882c03e303b8c58050ad67a373 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/15e9aea86e52254a5b012695c453e17dcc13923d | ORPH
   sh4aeb    |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/56434e67f8396d3ce31e92ffad118b470ce394b5 | ORPH
   sh4aeb    |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/fb2b58c87673103f588a4660b875a2dad8a45ce7 | ORPH
   sh4aeb    |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/c741d75bc56730b43fdb07f01996f38b7dffe0bb | ORPH
   sparc     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/bdc2a9ae69dfb6436b919142d7d0482e8582265d | ORPH
   arceb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/a04e7c5c1838bd73346634a62e1bb3a6b7e19ecd |     
    or1k     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/82bd762dcf724c288a6d88beeab523fdc17561fe |     
   sparc     |          ltris-1.3.2           | NOK | https://autobuild.buildroot.org/results/f0693809f18091c0609e5230e3facb19e14953de |     
   s390x     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/8f85abaa86e968329e2ea8e994f70910114a742f |     
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/1d26c0c690a3557d4ebe01eade08920660fac10e | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/cbcb6b44a4f92edade11df3189aed907f92644ce | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/d4fda48f7d972ee0c73d3e5d79c41fe921129bee | ORPH
    arc      |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/873a1e34e86a7a4273ef70f495058c1db5342c6b | ORPH
 aarch64_be  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/1c97113b85da3950e52ec4a0af4194b4db5caad8 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/db33770d2a89a0beee19a032b717e2241f1638e6 |     
 powerpc64   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/9791cf6d0bd1594b822a323b3e9bcaeb3afac9bb |     
microblazeel |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/1e62664e1865fca2c4d316dcdf91dfdbd08d4a30 |     
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/460a88ccc3450f19fdc052dfd766e005a3073b5a |     
  riscv32    |       open62541-v1.3.15        | NOK | https://autobuild.buildroot.org/results/14526dfd01f0aa63785363cc51732fbd5626697f | ORPH
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/8756574ea484da0ec4f7b9248f096c3d0c9621a8 |     
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/b216d9927cecdb511bc3b679deadd7cc2b0f8b44 |     
    arm      |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/d068f6c26d334c6281b03fc614a59162f4c20711 | ORPH
    mips     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/b16c6a8c01d5c8ca8f9cece11a8448e03fbfe611 |     
  riscv64    | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/ecf25dc879b9fca6802d6fbb7055c166dd2d9f50 |     
    sh4      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/fa02276e7359120e65017cf04fee5c7dcc4afbe9 | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a5bff072ac5bb3076aab4c1fd7a72f31e1939c0f | ORPH
    m68k     |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/c752e77ff2300cfcb8aa52e9313082623c934174 | ORPH
   s390x     |          seatd-0.9.1           | NOK | https://autobuild.buildroot.org/results/9d21dab54402550197690017e0196611ee5bc981 | ORPH
  aarch64    |           shim-15.8            | NOK | https://autobuild.buildroot.org/results/b413805d8f12bd37295ca76e6feabe677db8e512 |     
   sh4aeb    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/021ec113f880d77372e560d0d3da3c493105bcf4 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/d5974203d77c6440b8fc9d9248f21e643515994e |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ba72efa87f71e09c569258137017a4b015839e67 |     
    sh4a     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/f3dd81ad568cceb2a327809ca7fcbf2e1b2589e4 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/3ccd5e5a898b54b33c2cd9d35a0b967f45f374bb |     
   mips64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/46b6ac2eb7d19e91d975a1294678d169eb016964 |     
    or1k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/ac4db2d5bbba1d407b8afb7622406c8fc89f2149 |     
  powerpc    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/79506c23afd67a5c19bd6e6a1dcb153b4ec06061 |     
 microblaze  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9abe86e8f523a327c21d9e94c70e2e58f7d8d69b |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b64582df1d764c09ca1c52ff7c2de424a289a117 |     
    m68k     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9418186630bb6f6b5af5993682243cc77b2966d7 |     
    arm      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/2ba7f8d84333915eb6d7b47238892a74e5a713d8 |     
powerpc64le  |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9f0210eb9fcb4e3b6aca439e05cdc0cebfe36b0e |     
   s390x     |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/9d237d3d7add7ce196164ee88cc1d4f90ba9fc45 |     
  mips64el   |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/bde4030abff463a0b21735a63c0d6fb105a9a948 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/6c23f896c0a31d056760e8a05bbf4beafcb4fc6e |     
    arc      |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/79b92477ccf1c8db11b421d3dda82a5754fa8916 |     
  sparc64    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/a31b91e70d27636d518e92ad43d6dbe165b1bc37 |     
    or1k     |         sysklogd-2.7.0         | NOK | https://autobuild.buildroot.org/results/6435af0f40f6656894790b37ac76cbedc0f530d5 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/f653e6d8ed20628e705f399c690ffbe57ec594e2 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/759e2bac3e54b8b4b8ae7c413f25fbcd58de49a0 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/86f503ff201a477d19a674d3b9a6ad6bbe3d1d20 | ORPH
  sparc64    |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/aa385438436a82ed8ebc1134f22b39fbbd5a3a0b |     
   mipsel    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/2c4e74d7cc5c70518955ccb496a6dff3bef82b99 | ORPH
    arm      | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/2eb8dd9577ec8c006452a2b2579929325f419c59 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-heimdal-f4faaeaba371ff... | 2 
               host-go-1.22.12 | 1 
      host-riscv-isa-sim-1.1.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-go-1.22.12         | NOK | https://autobuild.buildroot.org/results/c86f2b51e24942ddf5d46a1322dcc6c3fe7ab9cb |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/e72732c5abed3e054b541130c983ad94f037e2be | ORPH
    mips     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/0916149ca0c4509f257bab9f4ed6f7fa943a2fe3 | ORPH
 microblaze  |    host-riscv-isa-sim-1.1.0    | NOK | https://autobuild.buildroot.org/results/061064853a1a6e63b00e55514133bf503089c6d0 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                   host-go-bin | 1 
 host-softether-4.30-9700-beta | 1 
                 weston-14.0.1 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/90686e129e21a6e807aba08969f22e40fb65d047 |     
    arc      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/516d4efa5946148b3b8848e223315407be082dc5 | ORPH
    mips     |         weston-14.0.1          | NOK | https://autobuild.buildroot.org/results/0c0de4484f93991ef317e012657afe0625c26c7d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
