Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7024CF8869
	for <buildroot@archiver.kernel.org>; Sat,  5 Oct 2024 03:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A08781442;
	Sat,  5 Oct 2024 03:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxyFpN0ogMEE; Sat,  5 Oct 2024 03:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 116BE841BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 116BE841BB;
	Sat,  5 Oct 2024 03:18:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8AB1BF282
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 03:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 203CE6117B
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 03:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQoJsp3YkKXC for <buildroot@lists.busybox.net>;
 Sat,  5 Oct 2024 03:18:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9952B610C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9952B610C9
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9952B610C9
 for <buildroot@buildroot.org>; Sat,  5 Oct 2024 03:18:01 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8d3cde1103so346895466b.2
 for <buildroot@buildroot.org>; Fri, 04 Oct 2024 20:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728098279; x=1728703079;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fyC+ilUeyBC1okeX4uCsDuAMcirWtbo3bMfLvTrcxTk=;
 b=svMPzN+2KbNES2o7ltlW3dQlf26VDHlm1j4uYR8wKoixW/tbngIa4GvzYPy2ZMNC43
 qTX7tMxPqaJ4rvKN/H0xN1aWToBLzFLW0ZOznNC8GZW8EHi+KNmTKOoO+N2OAPB9kk/i
 EL0eeBIC6jHyfhan449EKOzXoU3ASjBWq4iZtlregp0kAGIIUrexURHIYCO5L8NbEYbQ
 JWa7JKtsri6ErvpCepiTMYJUd0y8kbjP0+lVRXZMBVCN4UpkpxXoZ801FdGT4CJHhTF9
 6MySKR4IvJ2N3CQe+SmcEoY6H7DBi2uTtOdxNetkG0cfBdAuAbY9ecP4V4FimKhpHe+x
 zDKQ==
X-Gm-Message-State: AOJu0YxA7lh7s/8qFcx3kWYUI/Fz51JpC6H7irkDqlNsTc7G0oHpKDPk
 9CAr5ng7W05BL1q6KUG4or2oelqbfFUfR/8ZaMjCYpma9G8eELwoBFPigQ==
X-Google-Smtp-Source: AGHT+IEiWDaPQj9MEBLl2U6ggin8EgLnPhNI4SvZfg6LUoCaFmM+sYc4UiWfrkvmirc1pD78moRpnw==
X-Received: by 2002:a17:907:9288:b0:a8a:78bb:1e2 with SMTP id
 a640c23a62f3a-a991bd0572amr538134566b.6.1728098278993; 
 Fri, 04 Oct 2024 20:17:58 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e7b4f95sm75320566b.176.2024.10.04.20.17.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 20:17:58 -0700 (PDT)
Message-ID: <6700afe6.170a0220.481ee.2853@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 05 Oct 2024 03:17:58 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728098279; x=1728703079; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=fyC+ilUeyBC1okeX4uCsDuAMcirWtbo3bMfLvTrcxTk=;
 b=YqvSCVvHgaR83wG+GKA2ZwCSv8FjPKYzNWWsbQ87zyFv1UWfYVDoAWpmZ/GfdkQFYi
 acgPfoTZKQOorx9V9mU/mThQzVcFD5tmkS2gjse6/vr21iGFpYfarHNSZ8Y94E8Cajmw
 lY94EerCbCDtSAzAP5L/FWNOOP9rq9BtVVNvNneHei5U2WQ8lJV8/BLKqUA+vnACyw7E
 LzzRvaMJ+8Sc3R+lgFqaJWm5ObBOzxkuyeEoz+WLHG4S4xmx+cCt0WfUb7QbRIEmtcA9
 DYTvk5IsE2g4kDiWvjaXrD/3nmtngeSSIruptJk6IyPlyaag7yMhKqJgIBaBzXlaEhUl
 Zd1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YqvSCVvH
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-04
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Autobuild statistics for 2024-10-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  4  |  0  |  9  |
  2024.05.x  | 26  | 21  |  0  | 47  |
  2024.08.x  |  3  |  4  |  0  |  7  |
    master   | 25  | 389 |  0  | 414 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 74
             bluez5_utils-5.78 | 42
                libcurl-8.10.1 | 21
                 linux-6.10.10 | 19
               procps-ng-4.0.4 | 16
                  bind-9.18.28 | 11
                       unknown | 10
                    bsdiff-4.3 | 8 
                 coreutils-9.5 | 8 
               linux-pam-1.6.1 | 7 
            gdk-pixbuf-2.42.12 | 6 
                 gnuplot-6.0.1 | 6 
            host-binutils-2.42 | 6 
           host-checksec-2.7.1 | 6 
android-tools-4.2.2+git2013... | 5 
              libopenssl-3.3.2 | 5 
                    mpir-3.0.0 | 5 
                 pixman-0.42.2 | 5 
           at-spi2-core-2.50.0 | 4 
                  ffmpeg-6.1.2 | 4 
           host-doxygen-1.8.18 | 4 
         host-libxcrypt-4.4.36 | 4 
                  ntp-4.2.8p18 | 4 
                  bcusdk-0.0.5 | 3 
                elfutils-0.189 | 3 
    host-python-greenlet-3.1.1 | 3 
                  libsepol-3.6 | 3 
                libxml2-2.13.3 | 3 
          linux-5.10.162-cip24 | 3 
                     ace-7.1.1 | 2 
                    azmq-1.0.3 | 2 
             batman-adv-2024.2 | 2 
  binutils-arc-2023.09-release | 2 
           crucible-2023.11.02 | 2 
                  curlpp-0.8.1 | 2 
            gettext-gnu-0.22.4 | 2 
                  giblib-1.2.4 | 2 
           host-librsvg-2.50.9 | 2 
   host-mender-artifact-3.11.2 | 2 
              host-rust-1.80.1 | 2 
                libdrm-2.4.123 | 2 
               libglib2-2.76.1 | 2 
     linux-5.10.162-cip24-rt10 | 2 
            linux-fusion-9.0.3 | 2 
              luabitop-1.0.2-1 | 2 
               pulseaudio-17.0 | 2 
                 agentpp-4.6.1 | 1 
                 apache-2.4.62 | 1 
                  assimp-5.3.1 | 1 
                    bat-0.24.0 | 1 
             berkeleydb-5.3.28 | 1 
                   bird-2.15.1 | 1 
                    brltty-6.6 | 1 
                 dhcp-4.4.3-P1 | 1 
                  dlib-19.24.6 | 1 
             docker-cli-27.0.3 | 1 
                 dtbocfg-0.1.0 | 1 
                   duma-2.5.21 | 1 
                    emlog-0.70 | 1 
              fftw-quad-3.3.10 | 1 
                     file-5.45 | 1 
              fluent-bit-3.1.3 | 1 
glibc-2.40-18-g564178076272... | 1 
             glibmm2_66-2.66.6 | 1 
               graphene-1.10.8 | 1 
             gtkiostream-1.8.0 | 1 
                 hddtemp-0.4.3 | 1 
                 hiawatha-11.2 | 1 
          host-binutils-2.43.1 | 1 
 host-binutils-bare-metal-2.42 | 1 
            host-dfu-util-0.11 | 1 
httping-0e26c53d5fe504eb720... | 1 
                  jack2-1.9.22 | 1 
                  kexec-2.0.29 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                   libcap-2.70 | 1 
               libdeflate-1.20 | 1 
        liblog4c-localtime-1.0 | 1 
                  libnss-3.104 | 1 
                liboauth-1.0.3 | 1 
                  libsvg-0.1.4 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
               mariadb-10.11.6 | 1 
             matchbox-lib-1.12 | 1 
                   mimic-1.1.0 | 1 
                     mtd-2.2.0 | 1 
          obsidian-cursors-1.0 | 1 
               openblas-0.3.28 | 1 
                   pcre2-10.43 | 1 
                pipewire-1.2.2 | 1 
               popperjs-1.16.0 | 1 
                python3-3.12.6 | 1 
                  quagga-1.2.4 | 1 
            resiprocate-1.12.0 | 1 
         s6-linux-init-1.1.2.0 | 1 
                  snmppp-3.5.1 | 1 
squeezelite-71c012ad9ba102f... | 1 
                   trinity-1.9 | 1 
           v4l2loopback-0.12.7 | 1 
               valgrind-3.23.0 | 1 
                  whois-5.5.14 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/abb6149458d83523cde2133614284a2097ad53a1 | ORPH
microblazeel |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/66f51e07c8b73fc8755ba571b20cf6d38b1117d5 | ORPH
powerpc64le  |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/f8f657910b89644b4e8d9066bbf812375259b8a7 |     
 microblaze  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/e8f8e2c420baa806e20250c326fbc1e7305160bf |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/0503590b43be1ce1d6c68a614ce556d893f87d7c |     
microblazeel | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/ed38e8646b0ab9f9babd1ef409c01f0ccb6863d9 |     
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/c222bd34b96be2f8d7b9ec146052681d774994f0 |     
    arm      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/98dbc556da71889345f9ad7877a76e6060630d7f |     
    or1k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/80622564f4110edfe3e214ffc20b3ed3648999fd |     
   mipsel    |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/a5901a8998ac93f553deb10333b41a6ab7b6d000 | ORPH
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/17bb9b71e8f213f735978ef42b8713bcec322651 |     
  riscv64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/4bd479d7a37f0559417d57bd44a9ae5260edefcb |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/e3fdc576e5ed045e2164c458ae4bbdcd48077bc2 |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/0affd02031b172f1f4b8315e19327b6cad70c024 |     
  riscv64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/67f3ed16981a349edbe6dde3e6f30000e53b8d52 |     
  riscv64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/0d9d5183a92f147c1cac59c230a7b93ac865b9c1 |     
   armeb     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/a396520aa6cbb10c68bfc8c0e376376c56f57df3 |     
  mips64el   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/a57d059785e3b1338cd6918ce703e2d9844320d3 |     
   xtensa    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/c10a5b17786a9df8e5ba73f8cf7a75882db3d710 |     
 powerpc64   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/788434da645be3e6bc518b6373596f10820b0920 |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/c91bb3fec1c99fe97334aa6e914bf696aef1999d |     
   mipsel    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/1ff78ed00f19e2cfcecbd1f8a29480c675b9d44d |     
    sh4      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/526c8ba6c4421219dcbe32f88b938df9e15b145e | ORPH
  riscv32    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/ca49596169de215f13486e29c0be81c2fe16ad24 | ORPH
   mips64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/4375f38e5196ce8a55f5f07cd56e1aaa7f738473 | ORPH
   mips64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/bd0a595fc6d978a6dca5322909f9182002935f53 | ORPH
   x86_64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/6daed616cb2f0650bfc4b23d237fc7e41e22b7c1 | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/4b6897447e62010b3ac78a9a09e79889fb29643b | ORPH
   mips64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/5c184f1b54b1542290e1c311781d7e402c415a58 | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/245b473c9e5dfa4ed66d51ebe78f1dcf2eddfb29 | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/665f91f632e25cc597fff8828c7d2fc1bd2ddf6c | ORPH
   mipsel    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/dca28fe3b37e2d3d60845ba83c8a25a6f313e24a | ORPH
   sh4eb     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/5ca9c35fbaae6c25986ede0df95fff17040d3fee | ORPH
   armeb     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/e37ce0984011d8b32471b75542103f07e69e241b | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/87cdc7109c9f5672318ed8a96a361adbdb101c83 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/2b86f50d1070293f91e0572cf1843b87c9026e9a |     
    arc      |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/ffca55f21ae151289e0d67f83042a930229e7993 |     
microblazeel |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/7161bc23cc2629bc80de1dcfe4f6734c48eb6f2b |     
   xtensa    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/0dfbcd7c340e8d1323fea380cedbe5358e22dcb1 |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/6a8187c23a4e257b9f5c5132f43644bc33a95ecd |     
   nios2     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/f35c4e5f4d76f3cbe18ebeb9ad8c23428ae5e5f3 |     
   arceb     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/f9dbfa2ac6a9e271b3dba43527cdd7d0ab4a4116 |     
    m68k     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/db6bd0fe717f287522c8ec2e640ab53ab816a8b3 |     
    m68k     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/7434676251a7ff9e7dbd7d834d0a01c7c2b2e840 |     
    arc      |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/fe3a06e2cc95ccb44ac888ff4ed9727d46a7f2c5 |     
    sh4a     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/1bec9d96e4992380a4cb5f4f5b664a9ffc021468 |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/744ad4a444b4da402913d48f601c6e277629148d |     
    mips     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/ae63b312af430466caa55e5afffd98b99abd1dac |     
    sh4      |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/2612e63e82ca6e16b0a4efac1e7c72a6a0cfbef9 |     
   mipsel    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/045221fe1ed25761b2c0d5d76332fd8b453de7f2 |     
   sh4aeb    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/97ab31279a0001134f4afb5a493a2441a1b18701 |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/bd32a50fb04c454aac60bcaae370134a751a1d46 |     
    or1k     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/e8dddc8ba8dca4137f9e4063e8233d5826253b9f |     
  sparc64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/8888dc72999c69abcaf5898f06175dfc0c5c4f3c |     
    m68k     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/d97b6caabb3d429aaf7c1d55ce08c5f3c6c44f30 |     
microblazeel |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/1ac638fcf6df3f594b0637908150f1e7533a929e |     
microblazeel |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/4dbc5cec21b256c07f88d56c45f63b20f3f55dc9 |     
powerpc64le  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/349cef2a5c683532f74a745a00f9a3d56402b1c6 |     
    m68k     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/63a93048c17507b17367a3ec2e703d99fd4dc3b9 |     
    arm      |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/819d1d2eef5654fe1555ff8cb5d0c0ce54136457 |     
  sparc64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/74f212dc8d782f1bff6a8e44ef457df8cedb8584 |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/ef69aef2dabc687427b7b82e5462ae9ae85d5a73 |     
   arceb     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/33a52230e6287df98faae9b745f091b7afae60a0 |     
    mips     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/ed9b35698fd144bb36e1e4b542e7cae098b4b4be |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/92a65fa7ded78473674e0d2762b50cc348e698fd |     
   armeb     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/585e3e2c8fd48fdc7efa0c32a86ab0a0b8f1cb83 |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/c88e7924872ed496cb0099507bb1cb68dcb20936 |     
  riscv32    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/6cb5bd00e3d5060ed575de31210a68cd0a851e88 |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/33cd6d2a1c946d837f68cc81d1c931b5f53e25e1 |     
    sh4      |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/0595f2cb6040a10add638def8e6cc6504de01310 |     
   mips64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/e73fc91f9eb2b28208e7fbbe21e42b71d1246915 |     
   mips64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/c01d0007729b2085ab3116407c13610aaee75df1 |     
 microblaze  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/8383107dd17750f2ca1ae5c495359eb080d36716 |     
powerpc64le  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/25d936bc820c5852c1ff082830d47eb391b589f1 |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/3cd42200a52a5f706deebd847c7c28a13beed14c |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/42eb19e98f9e965ee1366bdacc2d1aa8aa7984b5 |     
powerpc64le  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/3ccab220267fc1286a4143476cb01b6014ae0b27 |     
   x86_64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/f73663cf8a32f3e9b57f46b9d548540a63710da3 |     
   armeb     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/7b891d51c6bdfc5275c898b4246b7f0a9685a67f |     
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/f2f131a4aaae52ab460fc98e0c2ea75597631142 |     
    arc      |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/150a218ebbcc6c91b782b2fda1ca02d80b42b090 | ORPH
 powerpc64   |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/9d2ef59666e62e90601f5a2f5a429fee1871a732 | ORPH
    m68k     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/9d097eed57d3285451f6ed18f4b330ef61a901db | ORPH
   xtensa    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/42a4c6a91c95b73047e146b7133875e3bd5d1258 | ORPH
   mips64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/c0dc86d86b2b69de79f2999963cb8d035d68b9a3 | ORPH
   xtensa    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/6d2448b91c2675f79317a812512d6740ed7401d8 | ORPH
  sparc64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/d24402fb6badf3615a9946fb334436c49c6bf461 | ORPH
  riscv64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/d920513dae87308fd7463cb87d4ad71876b55819 | ORPH
 microblaze  |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/bd5d366ccd081d3c9ab102045314d2d9c82ea6fc | ORPH
 microblaze  |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/37809599049fef3b96c12132b06e7ce339959166 | ORPH
   xtensa    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/464b8377c302f64dd6a68defcf0863c61d8b1359 | ORPH
   mips64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/e0004840b93bf4b7bcf753d8fb986e47913a5326 | ORPH
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/8c0d999ef9ada66261c31b8f7338bb460390cd18 | ORPH
 aarch64_be  |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/4e08bf7dc437730f581ad67774e5def012770b89 | ORPH
   arceb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/469e47a34ff808e7870201b31cfac303d990df04 | ORPH
   mips64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/cd7937c4fb5ac0a4c8adeeab4b9146c5dd81ab8b | ORPH
   s390x     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/0dbb1d69be618c5c934ce910b28e6ff302c7c8c7 |     
   s390x     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/0b9ce6fb857f69ac2b23212c30e5c60598b96979 |     
    mips     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/752c0a9cd4479dcc4898a21850e9de2016f42125 |     
   xtensa    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/9bc7376b718e25bae9a1412a6e222046a3b5abdd |     
   xtensa    |         dhcp-4.4.3-P1          | NOK | https://autobuild.buildroot.org/results/acdfd775b50967e2801e7d4556f7127cbeafcb3b | ORPH
   sparc     |          dlib-19.24.6          | NOK | https://autobuild.buildroot.org/results/71a54b35e357dd51c4ce3de66b4b23e02245fb2e |     
   s390x     |       docker-cli-27.0.3        | NOK | https://autobuild.buildroot.org/results/f9867f6fc3367caf3975f427ec4a8f596a07a719 |     
  mips64el   |         dtbocfg-0.1.0          | NOK | https://autobuild.buildroot.org/results/1320c96064d6a0f83de8b36747963a5f86b97eb1 |     
 aarch64_be  |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/078a2b1262e3f1f392630d22abc3a7ac869733fb | ORPH
 aarch64_be  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/0cb4c8519f2b3d26d0984e28d29dd5f95e44c552 | ORPH
  aarch64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/d25d2ca51f476e81cb4f3de1804aff229d8ec23d | ORPH
   s390x     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/e2b640d89b6e5834ee9e22118bb2eb1bc0dbbd29 | ORPH
   mips64    |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/211691675186e39f91ccf19774c7670726a71deb |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e429862cb0ad7417c2db813b659865f69b73b373 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d15c80517b0b8867e1f082c35162da09fcb6df32 |     
    arm      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/1c9c2606fd536b9181340c15928c9bcf79c5bac9 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/9e6e14ded5e6bb84bc0917ff47d405ade55b6c7b |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/ed970c030c2835a477b0c4b1cf11c041a43dec62 | ORPH
   mipsel    |           file-5.45            | NOK | https://autobuild.buildroot.org/results/3a2bd74ba365f1ad0afd4f8760adf5d992fee4e5 | ORPH
    sh4a     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/9dff1fdc1b06fe7888aa4439e8deeedd2266e4c0 |     
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d5d47488f8e615fea2367f8e5f88dc459a9fb3e9 | ORPH
   sh4eb     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/af5ef9c05d3ff04a790ffedd19a4e7ab53286385 | ORPH
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/8054ad4119058ec7ca317f9534358526cf7432e4 | ORPH
   armeb     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/61e523ef4a98e4d2895487b3a98f34980c5dfe51 | ORPH
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/88397b4e2afaea2996eb1365ecc238217d3ee390 | ORPH
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a0cdfd0ece5b590523ac5a69032133df6b8a7378 | ORPH
   mipsel    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/039f24d0547678ad9f6477b5a8c62ad22c94cc0c | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/5f2f70a23f5b029b35739b22b9f8c437bddfe26d | ORPH
    or1k     |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/defb110934a6ac13c644bc48e670e765937c220c |     
  aarch64    |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/5f7f9f58308da8ba33630b0f87a357ec123f4099 |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/d05239d2f90969d09abea9aace3468d500638af2 |     
    arc      |       glibmm2_66-2.66.6        | NOK | https://autobuild.buildroot.org/results/400d13fd61d3bf3dbef3d28f96654c8febbd114f |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/e26c66ebbe886ee12f0d6cd1e4df34db7ee0dbdd |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/f21f47acfe751e97bb2b3c4674745d7342255637 |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/a11899a14dd2f860dc72bd35e52f363a82825ce6 |     
   mips64    |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/21bb297d6dfb5924e59f6f03dc8d0f3c1c3c834c |     
  mips64el   |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/f73c92bd6fc700ca000ef9e97864fa2b4c7522a8 |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/56bb1468a506009c98c272d8b0ae37f5133ea568 |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/e562c9d521a8ec0b5bb82338ac1fe4e9973e9f9e |     
  riscv64    |       gtkiostream-1.8.0        | NOK | https://autobuild.buildroot.org/results/4c85c02576a8bb8569c4400af472e88c5258d027 |     
 powerpc64   |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/44fb7abe7647cccf8767b18747a569dc6eec20c9 |     
    or1k     |         hiawatha-11.2          | NOK | https://autobuild.buildroot.org/results/f86b6c809e1dab61307f6a214715cdd94685beb4 |     
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ff0767a51d405c7626946e3a1c3f5580844e7baf |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/eaa813cb83e0e98f1f9480e41f2e84c76bc2639e |     
  sparc64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b873dc120560d021d550762648af274bf60c8311 |     
    sh4      |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/88ad885028d7885c80dacb051f777d88fdcf3add |     
  riscv32    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/40383f6dac31f77bb4371f872b94c2328de2364e |     
   sh4aeb    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d3e5ef5058d3e5a9285f9238870515e9a75fd81c |     
    sh4a     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f94da7baa4b9f4cc1421c3c56936e46940fa7d0a |     
    sh4a     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/ba739571b04d2c770c8aecde5b9b580ea5028efc |     
  powerpc    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/c5a8aed8beeeb24a77416f4fcb344887c851b006 | ORPH
    or1k     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/894d75ec731c62d860e331b9ccccaaf5c681cc47 | ORPH
  sparc64    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/dc30d93dd5d1e80619d3a74898a99b8ce5edc234 | ORPH
   armeb     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/cf08fe71e2fd22ba1c47357b5a6c41806da96329 | ORPH
   armeb     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/1a4443b68741dc0683070d272f43e4b4ceb98c36 | ORPH
   mips64    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/33c52d6777fd1dd25cf1eae596f3a2e645b02e7a | ORPH
   armeb     |       host-dfu-util-0.11       | NOK | https://autobuild.buildroot.org/results/65edac5c4827f960db896c687065ff9a4fc60a04 | ORPH
   armeb     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/64a8068279c92922f94c26e970fdb9eb1f0ef9e4 | ORPH
   s390x     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/e4f0f87ab8639cd8a0a35e22744a76ebca1dd6b0 | ORPH
  mips64el   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/62fbdea1f95c7271fed44ab9d5fdd8e64e1a106a | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/70c68d3f8a51e3748f8891a801ac95b8d8568648 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7d2a720782f826f50586c4225080fbc11a6f688c | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4b3650cace0d8252a07b66b95bc19bd22a78a986 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e0eadef60df5e7c3c28598db5892ef0e7709a14d | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/730891d5cc1844e2e7e73e30189149f60fe4e8dc | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ef03c234d02a9f42c2041a1205368894a0675f20 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4e55d5d457ececdcf66f4ca0773ecc0e1eae66c1 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a0ef7fd87fe801ed8dbac02309bc5ca5abfd01d5 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/79fe4f2fd67ac23a5a2b1fe98100fa9b10074038 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8c381b90e9bc9250c7fbcc466951019ae22f02cd | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0182839d4bcdbea0eb60f12643e227750a30d6e9 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/138087cbafd28c11c76c1f648a82fdce3314338e | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2dcd35bab1d28ebc25a6ef7eb3a43ed221f447ee | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e9115bd113e248fc12794c48084c8a799debee0a | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/75275de9a0cad2f413f6b65b310055025a059c68 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8885e7dd84a1e6d6c7998cfe8eefa6a66d8f7833 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f765f9fc5e9d74da0678cde944bb7cf3db5e97f2 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2532c9ed2659d64949cdb994f707c7a3824851a0 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7a462963d12412237f7407158158b94bbeb5633b | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0fed97d2a085d2980d666fb67287eecbf23ec208 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f98e84dea84f5df24904dd31e53e862fca6182eb | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/288e360a01b1b84aa3e81362535f260fd609cfdf | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6bfdeee095e0b159df37e483a102cd355afcd5a5 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4a25e0a87df07b58be4814277f19a432eb2cf87c | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7d854caf69d26b27b756a915bedc390dbb284864 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3db0635c0ee7ea02f192fec194a1680946b93e22 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d72418100dbf93c4f2fa38137bc3aa5d3694656f | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a73f2aa5693a9be89c411b1380969897a53783eb | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fd1ef7aeda3a596a8388e390db4cbe64cce19954 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/afdd9390e3b8cf741ffcfbe47a2369b9646c913b | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c18a01d3bfef438173afc07f4bf7ef786ecc8d90 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/202ccb5572ff62cd34e390ca23a2195d47a6f651 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9286d73ef02ca75844e07a284650668629674240 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4d18f5f456aca5d3fab7c7384ac0a9a376b2caa0 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0492d0a1059ab196b0f71eb71777042e2a2b7f3c | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f6d59eeb2913a26074f8316fc7cf57c0530b185a | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/93ec4894ce9fa75fb520e172f663b7711968f760 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1d742d4b47768b141bc67f431194eea5c6c62f14 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3b77cfc2e3b913e205565f3cd5bb9b90d65281bf | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b9d949ee17fce47556ed92b4afed80a517d42572 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/906562bb8b033c88829d317a569689445d7a2015 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/529e439b65bcd5fa363be4eaacfd3f0abbaf2101 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ac1b77969927f797bdb21af1a70aaf3bcc978da6 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f2e974898481758a3f23c382fc04b19193144729 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1c044c4f60e1ca7bb03b2104d1dd354c1233f29c | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/69529fbcd4396294303555bf08018bc353406c83 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a5182fff7977fe3bea99f6b5913c52f987c53b2c | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e3924a8f1400b0d295e3f2a137ca1226f12a8f59 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fb03a649d7b85982134ca6004ad70c833ff930f6 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4f5a30f1638696afaebe3189b8ede57f34b9505f | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e2188a4691a006266cfaf9100e4b56c06a4dbd9d | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/16772ed2f15b2e52c0fdaa50eb4e6f146926a2c8 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b7bf2bb4fc13e29262c061a723c84c8698e90b2b | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/82240e04a48ae091d9830b0676e533a0b182f325 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/efc6641e028eb5a0657a1d465cd128630112891f | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e7459f81c234d3718526c1a5d1a87dd207d5ed37 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1a961308c1b9bbeb817619842e1ff8faa4d816d2 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/01619c28dcbb196d83500f6b2c289df1590c9ea8 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/de90bb5dddf913f97f97a5d72f32285e74a9ebaf | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fa71a9c054f5ace3e5d5393928ff586af4361143 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/60ee0c9366c4fed8956cb6469ef5ea530fd2d2ef | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0bea524da7cce5f486b37a4bb5cae44ecbf31f2f | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0a10f592f183256307ddbc7e3e6e99d299613714 | ORPH
  riscv32    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e26e73a1dac6028afe94176a3cdac200a56d3be1 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9d8c26d134b8072d2a2c381ca03f988cbe1a0180 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9725ac91d6af2c24753387fb6666def0e710e566 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0c2455b8e5e65349797ab9b911591698f5694f26 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3d5aea6f2f46133824f0dbe00d73bb0c35e4f0ee | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2513108a8dc22a001b7332069aec6fa6735e1794 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/14a2f02f8caff5a052ad99d14493ff1330eb0409 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5f47f4c635b3f2d268c483bcbc9bac9f3a514e0b | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c03bccb6ae01b4f13b7a7a50862098d3fdf85735 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/99533b637a3c444111bdb599818a44525ee645f9 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dc1d6273e2444b0b4bfa81ed41f9970f63b62b9b | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/57cffdf3e112c58c641dccdf44bb6fec6477b043 | ORPH
  aarch64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/a58a931a6e95ef6a6bb330aafe11909e6fa61288 |     
    or1k     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/69a302cc8fc8748dd97bf62a891b8035e0e7f5e9 |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/066ac549899128bb755a74ee3ad782f51968403a |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/5824fdc62df5882728cf20d95c5d4b426e4963fa |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/486187e7824967045313a3ed5e6e67e9793213c0 |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/ef5b7e31d55d85961186fefb692773cffe3f54d7 |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/11e47e64d90c571d7116935b210f8a7d10ccf9dd |     
  riscv64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/4be5396e52de74c214459629aa7427f31535ae4e |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/2e6318083c51d2daff19adc9017d308d5cb2b653 |     
    sh4a     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/c0eca1ad84009425fedc7dee0f4a243adfec9c7a |     
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/7a6262c578b51c439c91be397bddb5a905114a3e |     
    i686     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/c075406742ff3df66a3a44cd1d06a9728cb15eb9 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/b8a0b70f4fa43ad5bbfaed45b65abfef28e700e4 |     
   x86_64    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/1b447241f50306320a22c72237262e82b03fb667 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/caa6d64571aaa62e8dd70aaaa23a7991a2d996f3 |     
  powerpc    |          kexec-2.0.29          | NOK | https://autobuild.buildroot.org/results/b7e384248db95fdf58a9c299320997021940352f |     
   x86_64    | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/e18bd148e6154c60bd847ddad8da1b7194ff69fa | ORPH
   arceb     |          libcap-2.70           | NOK | https://autobuild.buildroot.org/results/095398d4877fddd7ffe97d893ec0f545a24f8368 |     
  riscv64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1d781194e274f637ea6ed895f9b332955c6c6ed9 |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/3245e3b268c7e8359a3bacf01be85dd65b1745bf |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/475d3d16a350cb5f1e30ed41e713e086de732497 |     
    or1k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/e3a2bce4a69ca5020bc500ce84d1909e665c52c7 |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/56a9b44b8d15effd5a16d70ec34042e0c6689184 |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/55d804ada4d73e11a610ebfbfe42905b63e5cd11 |     
  aarch64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/4db7e5329c0de7ce459d12f37d24995822d61e22 |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/2453afc4138a7192badf5a93fd75d4b6d5fd9a58 |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/235a578c05cbafa0e231b2c44d5a869132821c06 |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/61c3a30d4ad6fcab3a02e6e2a7a1de8e72d3f5e6 |     
 microblaze  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/27f75f03afad312220308ca0778317a0561e3957 |     
    mips     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/e7a51f5ebb4938a479ad64d43b147d247fe137b1 |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/d835c3bb8665ed7054e16de08418f3e5076cac9f |     
  powerpc    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/30700540af28d0ae4cce56c3f77b0b6df8a16829 |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/f0545171fca3564f29e5d43b62abef34feae4a44 |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/3de57a9de8c7700a48969d73bdd280a701b0f9b4 |     
   sparc     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/bffbc34d97b101d1ed8d1eee6da8fad401010efc |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/00ba2d04e7f7eb7bc5eb294d26d7ef509676723f |     
powerpc64le  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/6a657f896545935b1e8bca6aaa8693fffdcac3d3 |     
 aarch64_be  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/cae5d5e6748e01b1cf626cebf9460d02f725eef7 |     
    i586     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/d52ff35a967086c66f2a97aa95e0bc90ef83f1e5 |     
  aarch64    |        libdeflate-1.20         | NOK | https://autobuild.buildroot.org/results/be4139e4760a268c0305792da6e5af6dcb834940 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/c6f5d67d3736af2b727350df994dc107ce10070a |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/6f948bdec31f4a079cece9c808c20f9a86f9b722 |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/0a46ad79b99169eadb6aebf4483e4a7065cb1cd6 |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/0fd4a7ea6caf48096f240474073ef4630a75577a |     
   arceb     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/f088489e06e2a251176334baee9786c97f0db833 |     
   s390x     |          libnss-3.104          | NOK | https://autobuild.buildroot.org/results/6ca0261c1775ed24da18a0990e68befd36d565a9 |     
   sparc     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/0fde14ce86ee4bec7bbbf88be0b65a361e2fdd1e | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/7c77f8fe31047afcc8cd9b6fa83a1db1b8173e31 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/5be797052096cf98252092ab9f50fad6605d70ac | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/5fa2624dcfbecece4033ab974939a2a9c3230dca | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/d57d9318eeb81607dd88a6593a2afaa9f9596c34 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/d76f9a9543a7d29efbcbbf4e48f627ed9ef41330 | ORPH
powerpc64le  |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/e08f273b98739689f0c6501c65a2943e95637675 |     
  riscv64    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/68921dac786d2ad24070edb8d10c3e32f0154568 |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/284cf204fa6ff2b4499b8d02b84946d230de317a |     
    mips     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/2641e5326e2197b25fba75fd4b4dbc9df469fbde |     
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/e385b2787bbaadb29dbd5978143ee37ad7f6f738 |     
  mips64el   |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/91281a57a71fbb3890908b0182f53ea8e3ae85d8 |     
    arc      |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/f6705ce5605738ec0293ab9b3a9cad6983f79126 |     
   sparc     |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/14cfc512fb6d7d006f5ba60488b05ce04d4ae416 |     
   sparc     |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/001373ef3c7bcb215fced0c93fafdc44f4e05802 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/08cc4cc2e906133fa49c32cb865392facbc957de | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/ba50a1b5bffd684553273795029fe5021bb731b7 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/5ceb96610c3eb15e78f073b75fe4e8f781cbc74e | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/10854dd18c0609fff5d721f34f98c7fb704d629b | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/ced7fb44578470679b57a7b88aed16944259feef | ORPH
microblazeel |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/1387bfb8687f0c1ee66d39f89fc486f4ebdb01cd | ORPH
    sh4a     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/eda186c22178b45a9735e06ecfd4ffe986ef066b | ORPH
   arceb     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/1b94cddb8f3955dd44e03274b5c764850e0d7cfc | ORPH
   arceb     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/55b6292b1cf0e1c181f06655b17b44b565adb69f | ORPH
   x86_64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/4fbc836d64e6b91ceb4e7747f9ca604a7e05f3f1 | ORPH
    arm      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/7e0dc6b5d66398335e10dfaead9d05b878e7fb2c | ORPH
    i686     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/07cc2e0fd9b11ce6b81834f56d0564b8eaf7bc65 | ORPH
  mips64el   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/c9e0c01a39c6fe443f5c486d62f6598eaeccc90a | ORPH
   x86_64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/d6c8714047cbd9d34333251a8377748a3ca63c61 | ORPH
   mipsel    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/2ce5ac1e8a4988a8f1cd99d115e5ee3f7e9cbe6a | ORPH
   sh4aeb    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/592d29c4ce9078fa488d6aaf166d2d0ef2f2c773 | ORPH
  powerpc    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/89760d08c4ca1eafb87b035d5e265a2553edb8d3 | ORPH
    or1k     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/66cbca67073607780af2aaba53b78bc0a2f2ffdb | ORPH
    arc      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/cebe1417a101c754f568618bcd9291c239868141 | ORPH
 aarch64_be  |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/54147e081935cc9bf32c7ebd9a255144f8cc847a | ORPH
  mips64el   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/ac9fd59ea7c7fb41981ee039b28980082a74ecc4 | ORPH
  powerpc    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/a315c027acc1bc8f9fc1b1d55f289095fc826741 | ORPH
    mips     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/6fa32b971158e31e9c4de9829827113db2477fab | ORPH
powerpc64le  |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/b1c67f4fa1bdecb9d90687e3cee7cfe5776ff013 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/41bec13121eef1bf800ff7c72cefdda45bde854c | ORPH
  riscv64    |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/957c3a95b3eb72e40f40ea9a3a4a0763b09c34f6 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/20ab74adb1c08d46a9527cf1da0f9ea09d88feb7 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/594c0c5572a736deba6513bfc304ef188b05d666 | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/0ffced912da16843815b20750667140227a6aebd | ORPH
 aarch64_be  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/10e491c863384b83e3e9add49e09a7eaffe7a8f1 | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/45e32600f811be7abed08cc58c0bb5400fa4628b | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/8d9551d160148f6767570f2ae5348e06f73940c2 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/47859d3b2fda492683e514fe3861ff1df5a7b9c9 | ORPH
   armeb     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/8885e2b1ca6dc990fc18f0c8da8a7d715b150217 |     
 powerpc64   |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/731003e839ce44f2c40706b58555e4e36fbd511c |     
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/970b0a7c5da5f5ab1ef95e28a89c763b43d00930 | ORPH
 aarch64_be  |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/fcb1b8129f7cb878d0fba4fb0e79a74ad44b3944 |     
   mips64    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/f139d170c30808ab24552c73ef5d74eaf7f29f0c |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/16d967c6d2c66d199a0947e37e2817029a73c214 |     
   arceb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1f0dc830e3fb380900fddb608423b6952cb893cb |     
   nios2     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/12fd2229820a146d6743ceba245a76eb0d91fda6 |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/468c82a79983ab16d0610bd69994d2f658cf0bc2 |     
  riscv64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0e59d04bda95fcdc528e8ec166ebab165a98121f |     
    or1k     |           mtd-2.2.0            | NOK | https://autobuild.buildroot.org/results/c54acced8e623c370c5b036bd961830d271b3c63 |     
    arm      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e72f1affae5dc95077b3838089c7006f6a0e9720 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/6d0f47e3869d5a39814eb2184beb3e0d1a985656 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d1c8d8426251514d5c18020a139b4fbac4bb4a2d |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/df474196955a91e2d4b1406a3ed4d7f21171264d |     
 aarch64_be  |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/8688d3344b44fb0c5b711b3fb98cfbd595636874 | ORPH
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/974bc064d0580e9b225f0e573b41b0aaa3ced60c |     
    mips     |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/e806d75d04d7eb40303fb6bb5eb3a111d921f9e3 | ORPH
   mipsel    |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/f34cd3756098141587cf5769c3c1519243f7fe5b |     
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/ca42c7c0df5efab499d8314d145d00eb00e30b35 | ORPH
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/aa09974f7e32196dd797d9bd76753f26e3cdaaa3 | ORPH
   s390x     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/5595ba961d76490dcd9e9f60c39a3aa8e1a45494 | ORPH
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/654fb05d243af2d1aee4a555bac48c9fd9577f63 | ORPH
 microblaze  |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/fbdb9146aa8e279909c3c7cc2194698f331479e3 | ORPH
  powerpc    |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/807d5971a5648738a2d126abe9b049ce322685f4 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/38a9e310f555c55f89cbb566ac271c14a30386a8 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b014334ca63646d696f1e2f84f4e006510d13147 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/46e6ce4a997c87c4e48074095a1703ca52d62efb | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/770c6844d1bb19b4f0fb6b4d1376b7636556ec63 | ORPH
  aarch64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/721f5245f1836d647bbc9e9ca8efeb2746c92603 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/60d404af453baab17186ac0ec62ee77023453749 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b5b3ba8947bfddd7e9a64ae86e1f1f5d49c78100 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0359de0aa2cc2d5c8498aa59bc74a20a84ce7c69 | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ae8ec99f948c740d5002715a2ca8c07bd1a2b280 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/515be1574231d84db71000d69382d427dbc4b928 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/195ad016d3e72d2a9bd4bbe36a14490aa8bfb3b8 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/05596f0b94ab1948344249310d75432f4a5cbcbc | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/401884d0d58593fe0818c8e230ff536bfb30fef7 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/4239d6537a5d07dec40a08efd6859caddc4759d8 | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/37d49b434598bbcb1950ac7d87dada2bacb1aa32 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/24d4db0784aa6c83b9a7ad6dbd626445dd40a79b | ORPH
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/3798f3d84e7dbc8e10fee3b2a5ce2b43816a2e9e | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7f68d786be502dbb13de8f8188096d21acb49ce2 | ORPH
   arceb     |         python3-3.12.6         | NOK | https://autobuild.buildroot.org/results/4422ebf942467c044cb9ecf7429f8e97a88eb1d4 |     
   s390x     |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/623388a50505a9b246d6c1e39e277327987b653c | ORPH
    m68k     |       resiprocate-1.12.0       | NOK | https://autobuild.buildroot.org/results/c4f7ef6a33d056a1d48010ae26ddb662d65d1146 | ORPH
    m68k     |     s6-linux-init-1.1.2.0      | NOK | https://autobuild.buildroot.org/results/467a40425f0da4ac040bbcbf61f50bf8393a95c3 |     
microblazeel |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/7c3c0a26246fbb0b297876b4669efef5288e4786 |     
    or1k     | squeezelite-71c012ad9ba102f... | NOK | https://autobuild.buildroot.org/results/e97d18bac842f857b37421f01fe0875181c5fbf2 |     
    arm      |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/6725e6f9066b952c10dc9db50eca97eccc02ce65 | ORPH
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/ddaac96b71c6e78ede6f02bee8f95f739e960a20 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/c3edc658800dcf9134c2b5b3e9d7e10e1adf39db |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9501e80638ae5a802462356d4e3ac56bfbb569b7 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1936752e032a525b3a76d550c432d556359ff34d |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/31e7244ee314c79e2812d81e45d49861c553241f |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/9128e2a9cc948a45dbb61167bed150a1e89a16bb |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/7268f60a1029e355cefe99e693d00a2af57f250b |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/f17649083607a89b2f84b19770e12fdcdc4a4be4 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/1c5bb5a5c7001f6e479339204fc6ff2c8a17d0ba |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/fc7af8e801351c545f10d662e0c963e31d7ff52f |     
  sparc64    |      v4l2loopback-0.12.7       | NOK | https://autobuild.buildroot.org/results/a1c7014e6c8d299bacf92307b2a6f98610dcdf0f |     
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/dc7a3464e501909e76d2f9870a884fb102628cc1 | ORPH
  riscv64    |          whois-5.5.14          | NOK | https://autobuild.buildroot.org/results/5b8f9dfa50dd766ab88f7a4f50dce3371ca104ae |     
   x86_64    |         xenomai-3.0.10         | NOK | https://autobuild.buildroot.org/results/5fef13d5bce3c3bcdb23235a96c25e1949856c8b |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                host-go-1.22.7 | 2 
                    bsdiff-4.3 | 1 
          linux-5.10.162-cip24 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/21bb827d3dbf553c79f49d7c184099c75df3d45d | ORPH
  mips64el   |         host-go-1.22.7         | NOK | https://autobuild.buildroot.org/results/9305e3736be759704a1c1d0c4426adede7792013 |     
  aarch64    |         host-go-1.22.7         | NOK | https://autobuild.buildroot.org/results/d96ebd23837a2310dd19f4dc36d74268860ed538 |     
  riscv32    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/38acab838546c25dfe0176c06a05b3eb792319f2 | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                       unknown | 3 
                  fbdump-0.4.2 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
         host-gcc-final-14.2.0 | 1 
                host-go-1.22.5 | 1 
host-heimdal-f4faaeaba371ff... | 1 
              host-rust-1.74.1 | 1 
           host-systemd-254.13 | 1 
                latencytop-0.5 | 1 
              libxcrypt-4.4.36 | 1 
               mariadb-10.11.6 | 1 
                  ntp-4.2.8p18 | 1 
                 openssh-9.7p1 | 1 
         python-remi-2022.7.27 | 1 
                 shadow-4.14.5 | 1 
              skalibs-2.12.0.1 | 1 
               tcf-agent-1.8.0 | 1 
                 uclibc-1.0.48 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |          fbdump-0.4.2          | NOK | https://autobuild.buildroot.org/results/3cbdab65e0b6a2e9612f0123bd9bf8343218ed4b | ORPH
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/c00a5b17f3f350cb113ec63dccca891ab9bcadf5 |     
powerpc64le  |     host-gcc-final-14.2.0      | NOK | https://autobuild.buildroot.org/results/fa08587b5dad4f5c06201d2fcf58d4f78af8ef6f |     
  aarch64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/c103a0493eda14d6d6afc128ebdf159d1c2d5e9b |     
   armeb     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/a65d7c4ea376f5570b4d2dff9e01832ae1d5cb0d | ORPH
   x86_64    |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/da791a719bff68f6a790c356880c4fe874ef9a18 |     
    arm      |      host-systemd-254.13       | NOK | https://autobuild.buildroot.org/results/5e9a6103b3516309aeafde83ad5429d612146961 |     
  sparc64    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/e84ac4eaeb7c48aa466c90ae7f7701aa748713b1 | ORPH
 aarch64_be  |        libxcrypt-4.4.36        | NOK | https://autobuild.buildroot.org/results/ccc6d0e68e814dd95e2bc941c8de8b40a58b6877 |     
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/3bd722282187424ece78fc80d1cae31eac6d167f | ORPH
   armeb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9cb7416a53c2321b8a650f7409161033d2378320 |     
 powerpc64   |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/a0a223842f51ad2efc9d9eeb9f337230ce34e077 | ORPH
    or1k     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/2a91cfcd1b59f3c8a74892d0474e3dd7d5158447 |     
  mips64el   |         shadow-4.14.5          | NOK | https://autobuild.buildroot.org/results/5ea0c62345aef7697b1ff571790dfc67d8dbb02d |     
 powerpc64   |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/19cb70eabbc8ae59a0cd1f06101dc16e9ba7d101 |     
 microblaze  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/e17d3c368ab53eb5e66071b05ed5de23196516f8 |     
    or1k     |         uclibc-1.0.48          | NOK | https://autobuild.buildroot.org/results/3803749df476bad33a394a07da0dcd36870ee976 |     
 powerpc64   | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/699307a7b561e1a8da59593757090396fe7ba6ef |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/675dad88aeaca39407e8afdcc01749e07ec6de28 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/a8b9dd3be754f95890c0b7a6305e0c882fddeafa |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/43fd5010cdfd5cd5a09e81f8aaa6afce3d29832a |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                   foot-1.16.2 | 1 
             host-delve-1.22.1 | 1 
             parsec-tool-0.7.0 | 1 
                   rauc-1.11.3 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/23788efa0b16be2438ac9aa10b8b11077b63e3da |     
   mips64    |       host-delve-1.22.1        | NOK | https://autobuild.buildroot.org/results/a0af16e65ae35885cac7fcf8f8f8135c6d1b50cf |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/83cd6d41ae8128cfc5391c312702047137f41e40 |     
   mipsel    |          rauc-1.11.3           | NOK | https://autobuild.buildroot.org/results/3f59e88a1f44fd5c3f5140c02e5cabf081323dc7 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
