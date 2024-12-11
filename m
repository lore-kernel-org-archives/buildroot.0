Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CFAE7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 04:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E77881CA3;
	Wed, 11 Dec 2024 04:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S26O2eQe-tBe; Wed, 11 Dec 2024 04:14:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2A9581C58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2A9581C58;
	Wed, 11 Dec 2024 04:14:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 345BFED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 04:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A11A60A70
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 04:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yQ0epQXFnME for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 04:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E515608A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E515608A0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E515608A0
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 04:14:37 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d3f249f3b2so4271159a12.3
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 20:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733890476; x=1734495276;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2RgG5sWqTOiZyUsJSrq7SDY/fQIOpZG+RS5IajK/ImA=;
 b=Nec4z6HwBOlGMbauJMMdUyJkC4MMIu7bkh6s6qPAuL02Wiht74AjNBrQRoNSXtHO/J
 jbWIJSnWCbYnlnhcN6Sd4g9gNRcP/4MQjd03O7ZeuN1I83aYHklS7mt2AmZyR3cKUwZl
 kCPcVW/wXerOcHCCTvAW1QyaccrPHbNis9Z4qm7uNmKAfYS0z14if3KLlM8GwGBdC4sp
 cFwdveLaumfuHRjFt+os0wGGaFOqQYt+FV11LJcSwn/NlOD941yQxttmn34ztMxXj/PH
 BVJgnjZOHScvNfWCYPM4R67K3MXbhzrBKQGbuO/Xnm5MEm46uIfu1uaKqYKYLlVAm+6u
 /5QA==
X-Gm-Message-State: AOJu0YyFhDu3x0MXcZpN8mpoutyHh83KBpCy67BqMltKy28wykBgyLFS
 AWzhz6KkgGIAyOi4NF2pJa8MGQwldMJAcz9yD31sKRprcWQ0dShZVoDEZQ==
X-Gm-Gg: ASbGncsJsZCngI1g5hyGN0GCSpznE7MbpHEhl1NUxe/tVys0XrU7vBxkm3LGB5ES7w5
 ZFH6nD86tEa9nXoqSCtVd1fs+NkCRO/7rNw8fFKz496AtG7iHC6MGKzrZAkE6WlkVlOjkz2hQVQ
 S7fZh8Hn6kH1s/8PkHiKk7Pvn3lYsmniv+5gcVu0Uwg1OE9e7+2k9p1psqXU1KlNXdoaQG7+j8T
 g2SFVAfVs7k3ldM4h8pqY1BpF7vcEmNPzUeU4C9la+SMo/hKy8VxQYuiQ==
X-Google-Smtp-Source: AGHT+IErFe1nbs4BbtAX+2hJ0AaNZk9Zgf8Ct+P+/KXfARVjB3CSPKlARHz7RfgXIuWtwpZTjOkU0g==
X-Received: by 2002:a05:6402:2712:b0:5d0:9054:b119 with SMTP id
 4fb4d7f45d1cf-5d43314cfd3mr2385103a12.21.1733890475301; 
 Tue, 10 Dec 2024 20:14:35 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6260e2c3csm926245966b.182.2024.12.10.20.14.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 20:14:34 -0800 (PST)
Message-ID: <675911aa.170a0220.1b3f64.6e9a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 11 Dec 2024 04:14:34 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733890476; x=1734495276; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2RgG5sWqTOiZyUsJSrq7SDY/fQIOpZG+RS5IajK/ImA=;
 b=jEKZ1QM6/ConK3kD+JIReqSrlvCzxMn7gQPmbq41T+ooPK9g1N9BHVEUILjR9zMS2H
 zK81byZAuHduDhXyLqwPlgqMe7YecdCr4krs48y7nXNCPBFo69DyNeVQgTePwV+GcJhT
 We6AoPTa2Nn1NnlIDPpMSVYWaD4zNQxF0XDygYKZQT1SxdnnwlTQU9t0nqwfNzHx00gc
 R7ats+H3RIdXyuBco0j9UsIPPzPZyUwLIGHjbaJjPloYfxfMklJdlB13iYBsZjBNLjSO
 cxuU3aNVaWfbxgkY2uL/XbtptJnSjF5V3yJbcIL/nexlkFkNtMaNH3newycvEyB+Xinm
 sTQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jEKZ1QM6
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-10
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

Autobuild statistics for 2024-12-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  0  |  0  |  1  |  1  |
  2024.11.x  |  0  |  1  |  0  |  1  |
    master   | 10  | 236 | 11  | 257 |

Classification of failures by reason for master
-----------------------------------------------

                 linux-6.11.11 | 12
         gobject-introspection | 11
             util-linux-2.40.2 | 11
             dahdi-linux-3.3.0 | 10
               postgresql-17.2 | 10
               procps-ng-4.0.4 | 9 
            host-binutils-2.42 | 8 
      python-autocommand-2.2.2 | 8 
  gobject-introspection-1.76.1 | 7 
                    mpir-3.0.0 | 7 
                 c-ares-1.34.2 | 5 
                elfutils-0.189 | 5 
    host-python-greenlet-3.1.1 | 5 
           libzenoh-pico-1.0.4 | 5 
                       unknown | 5 
                  bcusdk-0.0.5 | 4 
            gdk-pixbuf-2.42.12 | 4 
         host-libxcrypt-4.4.36 | 4 
                cryptopp-8.9.0 | 3 
                latencytop-0.5 | 3 
              libopenssl-3.4.0 | 3 
                  liburing-2.6 | 3 
              luabitop-1.0.2-1 | 3 
            netstat-nat-1.4.10 | 3 
                  assimp-5.3.1 | 2 
           at-spi2-core-2.50.0 | 2 
                    azmq-1.0.3 | 2 
                   bird-2.15.1 | 2 
                    brltty-6.6 | 2 
                 coreutils-9.5 | 2 
          cryptodev-linux-1.13 | 2 
                  curlpp-0.8.1 | 2 
                     daq-2.0.7 | 2 
                   duma-2.5.21 | 2 
                  ffmpeg-6.1.2 | 2 
              fluent-bit-3.1.3 | 2 
                   foot-1.16.2 | 2 
             gstreamer1-1.22.9 | 2 
host-heimdal-f4faaeaba371ff... | 2 
                libesmtp-1.1.0 | 2 
                  libsepol-3.7 | 2 
               libunwind-1.8.1 | 2 
                  libva-2.22.0 | 2 
          linux-5.10.162-cip24 | 2 
            linux-fusion-9.0.3 | 2 
                 openssh-9.9p1 | 2 
               pcsc-lite-2.1.0 | 2 
                   perl-5.40.0 | 2 
                pipewire-1.2.2 | 2 
               pulseaudio-17.0 | 2 
                tpm2-tss-3.2.2 | 2 
                     ace-7.1.1 | 1 
                acpitool-0.5.1 | 1 
                 agentpp-4.6.1 | 1 
              armadillo-14.0.3 | 1 
             berkeleydb-5.3.28 | 1 
                  brotli-1.1.0 | 1 
                 c-icap-0.5.10 | 1 
                  clang-15.0.3 | 1 
          cloudflared-2024.9.1 | 1 
             connman-gtk-1.1.1 | 1 
                   crun-1.18.2 | 1 
                   cvs-1.12.13 | 1 
      docker-cli-buildx-0.16.1 | 1 
              fftw-quad-3.3.10 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
                  fwupd-1.9.20 | 1 
                  giblib-1.2.4 | 1 
glibc-2.40-18-g564178076272... | 1 
               gocryptfs-2.3.2 | 1 
   host-mender-artifact-3.11.2 | 1 
            igh-ethercat-1.6.2 | 1 
               iproute2-6.11.0 | 1 
                  jack2-1.9.22 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                  libdex-0.8.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
             lirc-tools-0.10.2 | 1 
               mariadb-10.11.6 | 1 
             matchbox-lib-1.12 | 1 
                  ntp-4.2.8p18 | 1 
          obsidian-cursors-1.0 | 1 
             open62541-v1.3.12 | 1 
               openblas-0.3.28 | 1 
                 pixman-0.42.2 | 1 
           python-daemon-3.0.1 | 1 
  python-pypika-tortoise-0.2.1 | 1 
                ramspeed-2.6.0 | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                  snmppp-3.5.1 | 1 
                  usbutils-018 | 1 
                  whois-5.5.14 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/0deff1a6d9b08f64d132eefd01377caa5695741e | ORPH
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/aee84c60f7bdafcaf67e158e33b5005e3ec9ee65 | ORPH
    or1k     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/796ce18d63e94a30a6e73857490fda778f7fe7bb |     
   xtensa    |        armadillo-14.0.3        | NOK | https://autobuild.buildroot.org/results/fdaf2028b97f60bc01d22d3caeb9a6432d92b598 |     
    i686     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/b6d0edfb7a4634ac874809deee7ef236b5d5841c | ORPH
    or1k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/4e27a31e7cf5292d8f9db771d0faf751b193db62 | ORPH
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/cf14ab83ff80023bc003c827ebeb60af39189a8a |     
  riscv32    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/61b275471ee6df639730138421aade2a7fe1b0a6 |     
powerpc64le  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/2ae915ece9dd757935d6268399e6b37167e4a248 |     
    i686     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/89557dee156f075ce12c2a43a8ff8eec88bef5c2 |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/b8b3a4ed10e89a9ed3b67b5dab030ee47fb13bd9 |     
    or1k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/f6a20e2c76ccae9c654990371d6c6dbd5d0e3819 |     
   mips64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/92194aae8980c633c068d2e3e0f395680cbf22de |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/b1a06e2b5587aa6118d28b5b85789d194aac5133 |     
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/9926995ccfdac9359e0b5cd8bbc8a9772065f26e | ORPH
 aarch64_be  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/088709df12f3d8ae4adb81d23c871dc812aad7db |     
 powerpc64   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/04bee78123ed403fdd9e270bf28b4a7da9c9945d |     
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/9db4d5a6dbc04615a9924a2fb8dcde617027519e |     
    mips     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/f4fcab15bc83de84bab8d2ecc0133dcf406ec0c1 |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/f1691139981f28f2bfeeb9af3d1b81d814538335 |     
 aarch64_be  |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/2bc10a5b593c96bd36c970330d3cd78298142743 | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/216b244ed662ae418f87cd2090bf72b97ae17a0a | ORPH
   mipsel    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/3f0d5b25c3e526cf41a8cd4e1b5a9b4af2768d2e | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/807ca87bd62861eede4f3501fe7ce18b57b55a01 | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/86982a6f387a9bd8d6d387a6ab77fefa110a68d6 | ORPH
powerpc64le  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/ee2025554f55612af4daea6b6e506afa7d1602c7 | ORPH
   armeb     |          clang-15.0.3          | NOK | https://autobuild.buildroot.org/results/43b1f8a85d150f041d64c59803d755092ed23fe3 |     
powerpc64le  |      cloudflared-2024.9.1      | NOK | https://autobuild.buildroot.org/results/561eb2565620fc1a06b75c3772a176b0f07b349e |     
  sparc64    |       connman-gtk-1.1.1        | NOK | https://autobuild.buildroot.org/results/3c821fb60072e8eeed6a559dbd4862a542f7d651 | ORPH
    sh4a     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/93def484dc1160e373c4b010d2de2448cb2358c9 | ORPH
   sh4aeb    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/3ec47dd5a093b0a9ce97e239cc96d685e8fdbcd5 | ORPH
  aarch64    |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/ea44f403923b0c35f657b49c1fa4381fbca41ca9 |     
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/94b1dd0b2cef712b98b0a0d49baa97ae7aa46dd5 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/b1ae37c8a221edd3dad11914ea85cbfeeafd9fae | ORPH
   s390x     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/0a6d7937d9947a8755856c5abf7318472d7a4053 |     
 powerpc64   |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/efcb915c31aab6e8715d711fbbd38d2ac23cb724 |     
   nios2     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/4b0465977aa5bb4cfac496417b8a6fd7fc110fbe |     
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/eaa751acade30922ce362148339ce1899c324574 |     
 microblaze  |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/995722d2e87b2a6f7f7266492b98ba1d209fc52b |     
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8470d0b1bcdb9c1e68840b644d3eabfae84fdff3 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/eb669196bbb46beb58b43a05602af953b2a60d9f | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ed747c2270a92a5c84d52c065108acbdaef07ece | ORPH
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7362446fe2edc9cf6d2786c7ced49cbba0ff8cc4 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3262a3b88440ce446aa534cdb0fce5e773e5c609 | ORPH
   xtensa    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7b5d75bc87388047cbbdeb9aa2eb8a9965cfd2ce | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/46f298f2648aeedf6db3d5f64a8b7ba18ffb28bf | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/00d1ae01dc8fb02baca5d91cf046db0c2a921c58 | ORPH
   nios2     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8377b74b00ca96fee4040e5b0cf4fb604419e0d6 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/61f40358628cc1bd442e68603fe73bedb90c91ce | ORPH
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/aafa0e6e47916048d7af5fb993fd6d1b585aba1f | ORPH
 aarch64_be  |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/f1690e26041762025e969b1b8450d9adadb50894 |     
    m68k     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/41919ea469ec90ee97657ffcb9022f183430cf54 |     
   s390x     |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/fe24b421e435ddddd6d7408450f6a54fcb64a9bd | ORPH
    m68k     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/b489b8e0214572e43630121c8fe460f970114a23 | ORPH
   nios2     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/fb1ed2c729b318576688cf68e910443c2f84232b | ORPH
   armeb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/dbdd09e87f5b028cc75c45acbdf8d522f6087fd0 | ORPH
   x86_64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/e52af3e3f1d3c8b797e0b14a9c9452eaa72329e3 | ORPH
 microblaze  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/f313fe1a96b5621cca7cc6d7b6ce14e28342f2a1 | ORPH
   armeb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/659f53410f1801afaab064b5ed6bff9c15fac85d | ORPH
    mips     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/fa8cbb7318611c42eeac7209f8f42b72f5b91ae6 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/fcdd957e6f1caa691f9ccd770fd50cd679ff1ee7 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e8cdf83a8cb8878b014b9b300851876cb7ffd19e |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/ec6e8b6ab167460a799334303a1d085c246927d6 | ORPH
   mipsel    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/8b2ae76aa79f993a90c3151bbf1a51e8ec21e900 |     
   mips64    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/bcecc869ddb4b5ad9d61cd3a1937d9e63cc78a98 |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/1a1d9dbcd304541eb773af79d219d28703fe5c36 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/0867c980d3d63192ffdf013084f30ac9cac91a07 |     
  sparc64    | fs/romfs/romfs.mk:32: /home... | NOK | https://autobuild.buildroot.org/results/68a1e48d62d20483ba18bb4ee78cb210f52d9e1c |     
    m68k     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/0e0bc18b9f5465758c049944780f45a8daaed45e |     
   xtensa    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d472b626fb4c574f1881e6e62cf02817f5e5f093 | ORPH
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/0f18ee4a8bfbacda7ebc3383393c871b0dc20911 | ORPH
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/c5f04f459f00653c58f4b3c2266a9816b6383b42 | ORPH
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/976419bad59476d4933518ff12327c6756b6d00f | ORPH
   s390x     |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/da4d5d66d512e0c8cef810b5e4be0c622548efe1 |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/8e6398db2303cdedec5e78e09988187afd9999e4 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/864e1dce167f8aead4f4ff164847fba8b8227a13 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/bfe1b0c3b94413e49e33933745ca7e16a4f99112 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/87f05d4be099d9bf76881a9a41a8dc4afe777e62 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/bdcbf7964dff3e3d2fc57ab0288ea213724fe085 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/41708305ef82d9b57ac0d5ebfdd99cac1564aa40 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/635c417fd91ce503457c61021d32ebf6cc377591 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/59face53dfa30125c37c63df4c5581f9898675f8 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/e65bd0b982880b584ed8774f4a44432b0bea20b7 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/26993c5e3d35d05a0a1c91dd6393b54f92f9d4a9 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/6fbc17d61ce0ac853f27adad176c7cc021788d78 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/bd258a20172e55860c6b77db9911c456674de715 |     
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/883cd31dd14ac2fc5d124277cb063c22d31983f3 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/5d6f1560f0e0a3cac884122b45a5b99edc27c7e2 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/be1b9106c3f064dbbed767ad9e3d42e7e9038e1f | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/c819d948852ae14de316edaa38626c92d3dba1f8 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/8954145fd9eafa6fe037ad80134ceda6d5b673e4 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/d7887a3e5711615352caced2ed1799e87057369c | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/857225124180d2e4dd76d519942ffdfbce1f41df | ORPH
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/f33b7b495b92f3eb0ea781e5227d67947016e8c9 |     
powerpc64le  |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/71dd715c9ea7dd96ef3a6f24b960b38b45bbeedb | ORPH
powerpc64le  |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/54ea8ca353c0b9052fcb93e75e722d98f00f871f | ORPH
  sparc64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4cb43ca207a2dc43f9bd51cb857b2fd0178b5bb1 |     
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/193d39a1db008114a760a740843f610de1fb3774 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/39e520279ac82976ed0de1227b7de26bac03fcc4 |     
   nios2     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/0bdc2f7bb5db4a5b0afc68a038e61e10127b0e3b |     
 aarch64_be  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/234648a0e3275c394a77d82f4f6507a0e51788e8 |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c14820a12ee4505d338975fe659b9c7c92c68aed |     
powerpc64le  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/1dbad8af6da321966177cbee21d4c294defb1569 |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/e8626856b612e972709568da6a9555456797e313 |     
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/4eef330ac124a7313f3b74d7f0731333cfacbd21 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/d7da7a1de0653101dfaf22333ec29f99f981f331 | ORPH
  powerpc    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/d7eb46638d6a488e4b416ea76307ffcf18fa34f3 |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/08529fbff22d710f8e7d527f999d3a6ada3ed518 |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/a099c72fcdcf77658e8870588009a430c4d9d864 |     
   sh4eb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/ce9fcff8f6f82259bca98bcbbf337e31d217dafc |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/7d5be717b3b0932ae116c590ca912152b160c063 |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/54572eaa121aea6c5cab213e7ff69d727ad5d2a2 |     
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9e3a45d76403856103a9a07a028bb1d7c1d0058f |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/494d8717473d8e7d1071df0148414c0105bef309 |     
  powerpc    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/10633a4d6ed8eb8c41328548685a04cd26615020 |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/bac3e17730ae47d8b07e09914a126ef9b27f6441 |     
powerpc64le  |       igh-ethercat-1.6.2       | NOK | https://autobuild.buildroot.org/results/e85c811e699cbe0b602d69266a15a9733157ad53 |     
 microblaze  |        iproute2-6.11.0         | NOK | https://autobuild.buildroot.org/results/172dced7970a06157da798386434134e02086051 |     
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/96df20c813c0a94089595b5aabb7effa0e43c50d |     
 powerpc64   |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/246fccb52de4d2e64441cc49e6278fa9438a5e5c | ORPH
    or1k     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/b1cb03ce357688a562c65f49264910bf64e0921b | ORPH
  mips64el   |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/da46e11656583114dc591ca8baaa457567fc4e1c | ORPH
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/54b067568bf455154ab4d15aa0dfd267b7ebcbd8 |     
    mips     |          libdex-0.8.1          | NOK | https://autobuild.buildroot.org/results/a715b3385816408fcf04db89d134481d607921ad |     
   armeb     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/11c2ab8e0bd87217a7f6ebe80126aa419c03095b | ORPH
    m68k     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/02f026250b67b461f81cfb16650e1e38d9df4f29 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/a64bc7877170b8c57203b7705ff47fc0e22a8cba | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/5f986dacb02acfb939002ff7af3e94ffb71e07f9 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/0913b07f1e255ea48dcaa5093263c56fe0f7a0a1 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/60d2f2c29b5f19f1f9d1f7a4c21cd3d2d9238e34 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/7c6f248bfc719e0725e3e8563453f6eaba758712 |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/9b4cf30bc5ffac2f99026e586bbcbfb91d4c4239 | ORPH
   mipsel    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/f758bd24c09a8ab5538a344085eb2f3c027c1404 | ORPH
   arceb     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/b369995145c10c31edfa180d2bb4336a9a73ba8f |     
   x86_64    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/294535558c3ab2fc80eef7c18a83e0eb3e5f01c5 |     
   mips64    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/b431f727b042482a9d90834a8fafe324068ba2e4 |     
    arc      |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/7e26fad82f3c0010d4e4376b606d5cb3757bebeb |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/2ff818c65290844b3cf18db6d4994ef06794dca0 |     
  mips64el   |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/293c7030a57a97285ec395d93acedfb4990fc1ee |     
 aarch64_be  |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/0aa6e491ef2546b9b02aa04183775dfc080eb5eb |     
    sh4a     |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/0944caabb9184f4f90d6c79510f1787b011cb54c |     
 powerpc64   |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/a45ff459981c88e18f19292633877e56d20fdaa7 |     
   mipsel    |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/0a1f6587000ec7e733e843b38468236b3c266cee |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/054efc4c5ab301d47eab91f2ef91a6d73c46475f | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f462e705f55f7fa1c266fd169b2ca600b06b97c5 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/32d6c47e393a5646adcd528eac9b78f587ffc85e | ORPH
   mipsel    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/d3e526fe151513e7896bc4b96c45f8e0b368a882 | ORPH
    i586     |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/30c9980570f1524d7e3f05b7e9453e3c01eff52b | ORPH
    mips     |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/98b926d456fe52625f99b700f678feb77474ab66 | ORPH
   sh4aeb    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/9fa8e39478fad7d5d4dac5e34df5332db4335c83 | ORPH
 powerpc64   |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/374666bc3697e2682dbc34a45d27858f1ee139c1 | ORPH
   mipsel    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/42fc835733a7a3916ea1b61bffb5a50ba4c609f7 | ORPH
  powerpc    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/37fcea6e7be9408bb29587afcefeb3b0f64fac1a | ORPH
  powerpc    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/2edb02f81b6569d8d83e4615ea0a74cb5922153a | ORPH
   mipsel    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/d32aff7aee2052820accb9395c83d4cbcec658cc | ORPH
  powerpc    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/2b7281726df01a8005f4ce39112318c860b57f58 | ORPH
    arc      |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/9b19aed12dd21e25c303a213b4da1b64fa38bd5e | ORPH
    sh4      |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/c3941fcfd24ae66799de76f664d50a430fd51c02 | ORPH
  riscv64    |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/8876f426db0fb436a6c51484b77b1b488003ade9 | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/a2bfb879f7ac01779f3e92ba1223de258dda399c | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/7f3dbfe3927acea5d357de6fefc1b7480f43b3d1 | ORPH
    or1k     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/14d3105dd29e5ba6d81d0ce4a34eb9b273f21a2d | ORPH
    m68k     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/8b38b075a4669daf9b666ad4e1c133211537aea9 | ORPH
    mips     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/25132d93494b58c078e6d800c54495514d3b4559 |     
    mips     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/f6343223a8552adfa23fd8869cd37c8a56ca44fb |     
 microblaze  |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/1e8c73c86f507b1ab1b66ed7fcdb177290d27ca2 |     
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/20df7761272d3558a176af847dbeb59520bfe7b1 | ORPH
  mips64el   |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/bb9c761b6f39251621a0f58c82a199c33d1bf0a5 | ORPH
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/cdbfd547f175ab61458d84a133e5a315206d456d |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/55192a54d4b287810c2f5e1c542f1f5ec48b2b84 |     
    sh4a     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/91b458b700ff51ff2bd23308d71e35506a4c7428 |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8aad0af59ef26cc5435b45e836608a3609635769 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9d7602d465d68d21438bee7824e2129ab345b5fd |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a9fcde39cbfd878b0bf7bfd1d1c06c0431d4a3b1 |     
  riscv32    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/72d3a012a66241bb29e099b77cc08735db62b06a |     
 microblaze  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/81ca4fe0825f3c19c08849ebbc12bb07d107508b | ORPH
   armeb     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/4054a8f2bfbfcc90c23f68c0d627093481767f59 | ORPH
powerpc64le  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/3948bf31ace63d11983e0f05c1bc8d6628b81f4a | ORPH
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/669b2ef1fbf3e6d433e19c435b65dbdcd1132fdd |     
 powerpc64   |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/078e328f984df7459ebf5412bb1a3c16ca9a3532 | ORPH
   nios2     |       open62541-v1.3.12        | NOK | https://autobuild.buildroot.org/results/dd0c3a0e751e655f7d0c5655343413103b1b44a2 | ORPH
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/14ec3ac7bd6544de6a5e8af6f5f9eb11d9a3a006 |     
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/3c4ae62bf5c7472b68bacc8408bfe063d280cd5e | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/28767977b5728029f01d483d52b29fb9f3a61654 | ORPH
microblazeel |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/e438b927041f22aa08dd05b3e9551dcaf7370d58 | ORPH
microblazeel |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/9164b5ee52749b143319a18a4424a444929ee87b | ORPH
   mips64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/2d7fabc9c9fe93cc01742b0790ed444cb7ae40b2 |     
   x86_64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/4aeea69e0cd8665353bc15cfd8de6e0d1b5eb3fb |     
    m68k     |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/f15dcd67d6bf0bb7cde869d74c470d4d4dec6746 |     
    or1k     |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/c6b996de1ce4973cc4f3625160ee6315284a4ca0 |     
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/5572859318d6c9b4d82b5e3e63ae89617175de01 | ORPH
 microblaze  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/e732c08769e9695caa0d868da4625a21edacc0a7 |     
    i686     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/73bb840dad6d60929aee99f21274a69d381b3b08 |     
   s390x     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/ea4a6d7bb37ce3fa50447fdb7a00137ae7420f8e |     
  aarch64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/061062a827e049ae901dc03d310c8b2a97d8d66a |     
  powerpc    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/963a2063f373f9af35fdc8fed60fd5ee2f4eac43 |     
    m68k     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/a5417f474955db01dcfb8af816c65e9aabfd6a52 |     
   s390x     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/32bd61356a8d041e2aaa3aba68954f6726b3d068 |     
   armeb     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/a1193ecd7b664086347374f9a5897c5ed48e10a4 |     
    m68k     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/d44fbce25543e7fa45cc59f850d87b8aa11d93b7 |     
   sh4aeb    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/2505eaf34da19152d5e0a87eec919a0e398767cb |     
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/36bdca0e0477c2b09eeb6dd7cf38c4ffa665979e | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/366e57ed98995cbee357e5ede4552c0f96e20ed6 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1eea6125bab3c0737266ca0a12a76e61f478a0cf | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/60d1288cc351e9b6a115b7fcb68f7ab9f8da6a1f | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/76442fcfaa439acaa9835dce489b227182299bcd | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5f5f1dde3a724b1bbf62f7cada8c6face33c0b4d | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b9056f46e5bf9194c466aa709da9b6afa82559c9 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a41587ea8b9c7bd9610615ce139fb3bb0d095db3 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/039f1d5ef73399564312f66bd39573b4581746fa | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/77bb800d421c499c9db6bbc62f4d933808c80510 | ORPH
    i586     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/2002eb4c9ba93392ec463e74a4379c4dfc30affe | ORPH
   armeb     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/82d98c385b1743b6bcc9c66f518b13019bcc44e8 |     
   nios2     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/2d2eaa3814b28dd04c08178596bf3f12d92ce274 |     
    i686     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/f8b5a8f04258fdd91db9ca2e2fda5ce967252a40 |     
    m68k     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/2ecc87a4da341d997518a565caa76952e48fbd56 |     
 aarch64_be  |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/54303c9a3107398d99bc542bde5c938012bab16d |     
   x86_64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/5c8d18f4990985ba3b2f0125ade452adf1e8600c |     
    i686     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/7f71dca146f9ec115ea27ff03aee538409f06d56 |     
   sh4eb     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/4ee37efdf73b4d14559f4078db4ed5ae5e0e7fe0 |     
 aarch64_be  |      python-daemon-3.0.1       | NOK | https://autobuild.buildroot.org/results/daaccdb7e7316fdc7336ae08fc005459de75535f |     
  sparc64    |  python-pypika-tortoise-0.2.1  | NOK | https://autobuild.buildroot.org/results/ee82349898284de389af9478c333d79f02e8cde3 |     
   nios2     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/f0b932111008d9c5b06e658017426b93f0b4cc28 | ORPH
    arm      |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/16029b39f692574a40dcc22faaada47cdf8d870c | ORPH
   arceb     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/91f13f448b1d0208792788afb9584e3a3646146a |     
 microblaze  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/ba7726083c641b230f048d9ae9598238567d57a0 |     
    m68k     |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/03f0e7506cfd1598220751bc0e05472aff29388e | ORPH
   armeb     |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/823ab0e38265d358761b08fd3a1ca2ae43d44960 | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4ff4da3608b608717100fa8c22775dc070c4da8d |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/b419f17c517d842862246c15b1ebab5e53d561d4 |     
   nios2     |            unknown             | NOK | https://autobuild.buildroot.org/results/a1813fdb9e6b4bcc8124c56a5f4f8ad2095ada9e |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/b0e355ccadf5665ee51709bed52fb9a6b39bdad3 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/f9426e8d3f8e174fa3e983408c4c7df6021b99ff |     
   mipsel    |          usbutils-018          | NOK | https://autobuild.buildroot.org/results/6ea6cde91c2c6c49f56a08f37fef0c134eda40a0 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/7eb3b9a1906365192cccb5605397ccd618f7d4a8 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/7797e95773c1dd0767362ee37ac647d72a71fdc7 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/12210bf243292c3bfb5b1605784a191378cc081d | ORPH
  aarch64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/cbe3215b2592de45c67cf42a984b372812710c19 | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/89839d4c2f85ba8b2c2109cb427f337e8fc405de | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5d70ad14b4b707d281ca27b232eafe0a6ffcda48 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ff791650d86021949875f56118d1d8a8095e6bec | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/22401be7329d572c523c11ce1a7158026f9d2f20 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d16b2697b0733b2975c4c8462123302ed20bf55a | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/c935791362ed03706961db9ae4a7b6c6a83bedda | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d5ecd94ae584008b3f90b03bf30d21db8779b432 | ORPH
  riscv64    |          whois-5.5.14          | NOK | https://autobuild.buildroot.org/results/9b97aaaedf6a050563dd9f373b02e54820fbed63 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/3a8a9e7cc457c3be8980753e316efbf58535f532 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

         gobject-introspection | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/b85e46a4d6dce4998a721181ad1e782c8fe92ee6 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  snmppp-3.5.1 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/c0dadd96e73a5508a37afbbfa0c31ce22afb74d4 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
