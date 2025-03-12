Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A953C28B28
	for <buildroot@archiver.kernel.org>; Wed, 12 Mar 2025 04:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7B048138E;
	Wed, 12 Mar 2025 04:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hne_TrIw-AnF; Wed, 12 Mar 2025 04:15:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A1A1820CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A1A1820CD;
	Wed, 12 Mar 2025 04:15:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F34F1DB
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 04:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3315060BCC
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 04:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dd1ULmw-lyFl for <buildroot@buildroot.org>;
 Wed, 12 Mar 2025 04:15:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 98D1D60093
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98D1D60093
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98D1D60093
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 04:15:33 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e5c7d6b96fso10349455a12.3
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 21:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741752931; x=1742357731;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p+AbdEw6NAPCoFuL0KXfBhux8fifmjTlR8Qs/0oVVCA=;
 b=iCJr85EU4OiRSsgN8ktZRvX9D+l5n8305VceftoMPJY1fsALlsdf2Jpr0GHbKRpAi/
 xHneJa2z1DuqDGOZLVw7TS6mZMdxN/kH00YBlDO9A/HaHuJs8sUzYQ0otkOJuO26/OT0
 0i7hdORBU7NzambsEuaDdpUa6irXvEsCZttpArr/hGVD2zkoa2EqfWCNgwfXD6ROeKiW
 elqYz6OTq6ShJnLj6oVw9BJgf0Blj5yYRr3kc0acGwFNyg7MAS+7/PiuTdo4ORWgYfnE
 QO6Fw2IfjcQLVAc7pXaaAc10450WRKNXGsCiDtmBdT7lYNjQ1vFZ87qH0Cm2W5KwUYHF
 azLg==
X-Gm-Message-State: AOJu0YySBz2/qOMFVuw/3QZnUbmOPQO9N1ugjpDaFdQ/wRXi2TiXcDCS
 zVEm6tjEMqJsz5007sxHJKJJme0AjI1xP3el7dHHXFO2zJ3C2XZpH0O1TQ==
X-Gm-Gg: ASbGncs0BN447uVuWvMWwRBZ5ILL9YiYixPQneuvLDcUPDQeV5HOmwuRXZfktCcS3Of
 Wedamaap20Q06A1QXJPSHxo2nE0AqbIbylvsqS+th+lu0fw8msRcZUiWTOxtwVkGgoQ3dsXgQPw
 JltxUpKfK50OvDZ/c0U6Fgu5WiNqH8PfbZfmn5Sid7t4P29Kqza4WEbQ8zoPRO2S6osUIvfxHZz
 GClsBI3B/0A6XasvU84Oec2P+JFnW78vD+Z2KXAzT6tLGZG054KmPjvevwm4W8js/J2kLLcHv6c
 wEwoAcTNd0gxME2zTlRnJ7Bno92kSdUoaQsjz6aiSlc4UUaS
X-Google-Smtp-Source: AGHT+IFAmZxsRm4yh5lh07422HONn/ySKaTUu6MikQ8vC+5vtuH0zV75QdPn1gmKiVVIENhrMqHuxA==
X-Received: by 2002:a05:6402:518a:b0:5e5:ca1b:c425 with SMTP id
 4fb4d7f45d1cf-5e5e24153e1mr28723268a12.17.1741752931328; 
 Tue, 11 Mar 2025 21:15:31 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c766a5f7sm9163537a12.58.2025.03.11.21.15.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 21:15:31 -0700 (PDT)
Message-ID: <67d10a63.050a0220.1232a5.2830@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 12 Mar 2025 04:15:31 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741752931; x=1742357731; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=p+AbdEw6NAPCoFuL0KXfBhux8fifmjTlR8Qs/0oVVCA=;
 b=WZts7hyIvjGlOqJnVUpxIrp+CSMj3sL+jAH/zLGhiZnVJRkVP/cAWdJhVFstezZBUL
 H4KzXuBuZkpFcQ1ATUPZ41UeOQ4msEm0RfV9evOuDUIHU4PEGiwnKhU0DM3ldDjWzmGb
 XAAvS/bVpb01OTGWa8+h6qyZlIJfHmDPhTeNMYb2TFa/KL5+3TUAOByBmGmWYfg4Bjcq
 YHIES5jnf+vC/6xd3Sg0zR7CiMYD8Olcwm72S7Nt7CSeuejkJzU3bIzRX1IYXIhx+dh3
 efAl6S1o6iDuzaF97Vr7mraZNMSapA9yXdDduqXNfYn35fl7kyzvzg1AOjbXECPKasft
 Bg8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WZts7hyI
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-11
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

Autobuild statistics for 2025-03-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  6  |  0  |  9  |
  2024.11.x  |  4  |  2  |  0  |  6  |
    master   | 18  | 57  |  0  | 75  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.82.0 | 4 
                elfutils-0.192 | 3 
                 linux-6.12.17 | 3 
            gdk-pixbuf-2.42.12 | 2 
    host-python-greenlet-3.1.1 | 2 
                   linux-tools | 2 
               mariadb-10.11.6 | 2 
                memtest86-7.20 | 2 
                  ntp-4.2.8p18 | 2 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                   bird-2.15.1 | 1 
                  boost-1.83.0 | 1 
          cups-pk-helper-0.2.7 | 1 
                   exim-4.98.1 | 1 
                  ffmpeg-6.1.2 | 1 
                   foot-1.16.2 | 1 
                   fwupd-2.0.4 | 1 
               host-ola-0.10.9 | 1 
                 libcdio-2.2.0 | 1 
                 libgee-0.20.6 | 1 
                  libnss-3.108 | 1 
               libunwind-1.8.1 | 1 
                  libva-2.22.0 | 1 
           libzenoh-pico-1.2.1 | 1 
               linknx-0.0.1.38 | 1 
     linux-5.10.162-cip24-rt10 | 1 
              luabitop-1.0.2-1 | 1 
             matchbox-lib-1.12 | 1 
               openblas-0.3.29 | 1 
                 openssh-9.9p2 | 1 
                   pcre2-10.44 | 1 
          perl-net-ssleay-1.94 | 1 
               procps-ng-4.0.5 | 1 
               pulseaudio-17.0 | 1 
         python-remi-2022.7.27 | 1 
          python-tinyrpc-1.1.7 | 1 
rtl8189fs-94cc959d56c1425fb... | 1 
          sphinxbase-5prealpha | 1 
           uboot-tools-2021.07 | 1 
                       unknown | 1 
        util-linux-libs-2.40.2 | 1 
               valgrind-3.24.0 | 1 
wilc-driver-linux4microchip... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/8fde63f672a0ec2ad9f216de0ead6379f19f2cbe |     
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/1dd9470ea7d9ad585b15619beb6ff2c0816cf9e2 | ORPH
   mips64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/8004222ddeb66a1809599c856d005fda7129fa5c |     
   x86_64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/752f556df2f6d436ad1d54b7378193bd67138972 |     
    arc      |      cups-pk-helper-0.2.7      | NOK | https://autobuild.buildroot.org/results/76ffaa2635f54d32a5e93f427c1f9ba80a884d6f | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/751717683bc6d1611665f95159950340d172b10f | ORPH
  powerpc    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/cc0d2154797c650cfc94c8f4bc68f0bf69da8ff4 | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c37b8ae30d421684bffeb82821e192b2c73e8176 | ORPH
    arm      |          exim-4.98.1           | NOK | https://autobuild.buildroot.org/results/c13ca9d5a6819410e27c411c66661cc44cf87600 |     
  powerpc    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/41d0552f1cad35624e911d8537b39eca630345ea |     
 powerpc64   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/47619136fbab0340c87a4350383934999b266ab2 |     
    arm      |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/420fa506c2e4883d858d27680bc9f39a2ed84ed8 |     
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6478d97d0ef70b51a0a8385972a3c74609092094 | ORPH
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6f3f47a90ba450bd46ae1ca131a0a42df17a9eab | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/524d9e3c8ac8119772173eab20d26aaaa9c13f4e | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/e33cddb44184a40abcb5b863a244258c4abca2e6 | ORPH
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/cece68c26d306fddb98c128d2eeacc08597335ea | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/6dfd3c8752c7edeb7912a879bc5f2ffb4db17973 | ORPH
    m68k     |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/6e0a49b926107556200aaa3a9c93139dc6ebc958 |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9f4fa93d1f42e7c31c91404d55b75359a6213d53 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/195a7fd2ddf20e3a6a09c8f08c92dd8f00738c45 |     
 powerpc64   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/7988098313769efc47b1f12f151ab85f38b7dad2 |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/eb92bec5e20b17eab04521083ec3350d00386f6b |     
   s390x     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/e6727a32df68bf2fa5e466b2efbadefd8db83697 |     
   mips64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/69f3cf398fcbd685f61e39dbeea8fabb072d036c | ORPH
   mips64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/0a6ddf469c0cb942924979b4b06d30bef2785e9f |     
   armeb     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/d25f598bc87227dd1d8076af89d413658e09047e |     
 powerpc64   |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/6fd1eae278c17792053872de9e0bab46e1892be4 | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/7ed6057b76916b823617d1f2a9790e0d92dcd19f | ORPH
   x86_64    |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/f78f7b4de44e29076fe04d1624f5a86c7d50762c | ORPH
    i586     |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/ef48f6188ac4bc838e04504b605f69769825d206 | ORPH
    m68k     |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/a86f695d06f5d5675917cd30504a5cb4c3404ff0 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/c24950380e145e1518f32229791074ccd852a0d9 | ORPH
   armeb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b103af3bf655c386c94f8b8af89f7af5bcd6e0b8 | ORPH
   s390x     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/6f72c181ce0813fe31feaa9cb0302cc74e42ae31 |     
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/9db01b3d1ccc0e412aeb3a74832b53750f88be01 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/e623d2e4c28fb7c7ac0881bd32cb8217bd249925 | ORPH
    m68k     |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/19925ed18822aaf6f462da018106499c797b7653 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/1b166e3e24daef588d880e052115abea38cbae3a |     
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/7ee4fd1ac88b9d39f16ce623ea23d6b2de0baa26 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b2f51594b63f892996cbabf2efab74dbeb54bfaa |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/aa434b6e07f56b07901f1bf07cb785a7561eee3c |     
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/a5bed6be7649b7cce039e3636c785a265f45238b |     
 powerpc64   |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/61420e1d1b3034eef4fc16b07a28e4660492cf6f | ORPH
   mipsel    |          pcre2-10.44           | NOK | https://autobuild.buildroot.org/results/f424fa97da703b79e4af3a857be8c381e5de7e0a | ORPH
   mips64    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/b4768d97dcd56a11a3fa839de6f11fec475bae22 |     
   xtensa    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/c41b8e601ebb96eca6a6d08e96c0de9a7d91d303 | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/633f2696edadb5d7dbf302c2307109ac7dc213cc | ORPH
 powerpc64   |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/242358fc0eb24affec79a04f0ec117dd9336d85b |     
  mips64el   |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/a646cf38e1f1fc9d20ae0707985f96ace231ae78 |     
 powerpc64   | rtl8189fs-94cc959d56c1425fb... | NOK | https://autobuild.buildroot.org/results/9bf60a53162e74cc080f9d80b8746a4b46928bd9 |     
   armeb     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/a3777a90081a8dd6c1f5f3608f85600feaff9738 |     
powerpc64le  |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/f301bc7cf6bb025e8018f3e874181dee1cc3698c | ORPH
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/519a50bd987414e6b4fa294438674632171c80b9 |     
 aarch64_be  |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/01bc00af3e47c4bbf0e5e90ca8ea10f82de7d69e | ORPH
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/8bf39a37f0bbfe80ee649cedab0e33ccff996f5b | ORPH
   mipsel    | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/65151af426deb1160177c1577b2efa28ef364085 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 coreutils-9.3 | 1 
             docker-cli-26.0.2 | 1 
          libcamera-apps-1.2.1 | 1 
libg7221-dbfc29d4806ecdace5... | 1 
               libvorbis-1.3.7 | 1 
            linux-fusion-9.0.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         coreutils-9.3          | NOK | https://autobuild.buildroot.org/results/c1dca81015ea8ef41237cb753e4cf2d4da0e07d6 | ORPH
   x86_64    |       docker-cli-26.0.2        | NOK | https://autobuild.buildroot.org/results/8a219876a3be46db83e6029e83e2946f98348230 |     
microblazeel |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/4c09663d473e0fa877a1299a6f2577819949a678 |     
   mips64    | libg7221-dbfc29d4806ecdace5... | NOK | https://autobuild.buildroot.org/results/d009af9a56774690f2af63d8b20d959ad765d07c |     
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/21aba190e70e0ed0ec645e4fd1e866efb8e9dbe5 |     
 microblaze  |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/51db7153d71c2418d3f57600945f13345a0b9f49 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

              libcamera-v0.3.2 | 1 
                 openssh-9.9p2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        libcamera-v0.3.2        | NOK | https://autobuild.buildroot.org/results/5b0dc8acd491f1d7b20f5b5f065b28212b9d4912 |     
  powerpc    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/591279a1a10e41a7640303e961f64effb6ef56f8 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
