Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC9DC83F26
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 03:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A6D160F7A;
	Tue, 29 Jul 2025 03:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZ3TMDldhJsh; Tue, 29 Jul 2025 03:15:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D79060F71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D79060F71;
	Tue, 29 Jul 2025 03:15:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC057D96
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 03:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADA1240352
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 03:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B7gqXDql_KxA for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 03:15:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79D1F40012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79D1F40012
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79D1F40012
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 03:15:06 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ae0e0271d82so962484266b.3
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753758904; x=1754363704;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bWWSxG2wdP1fVIE5fJ7KrT9dZTWoMnkvyAT7qM2HUIE=;
 b=C+nc26v0Ic2k3Sh65ePcp+m3hFTW6RMzAI8kYpZOnLMSqW34LRg/qlE6cTreF5k28K
 LUQyuNHhBDzo4eO00FSiZ8eNACKzwzo2FIatx9XKYcmmyF6SbB7MTlM24vunG7fI6VAF
 xJPVQzpTQ+K5OUyKHHjeUUgrr3Lk6l3iWlOdkuxiyUlV8v0UImh5GDsD+nLnMSX4qhn5
 ewTJcxdj2Iv9oz6QPIwLRYTKiMCIbcJTJ7zBiHBFLZN880DzphLMGNEc6VzAvZFxpMcb
 5T1UDe7QQeEYECk6jF/handj2JcO6cLP9PGPWA3YHR+4yZ/vXpR9mYuzPzRyoBDrstSg
 6Pew==
X-Gm-Message-State: AOJu0YzJcbF/n3P9QNrz3rLvG2UKZ29mMrCQis+zL1l++2TGCUJBPHDi
 fDIY6XE8u9CXqUSA8gHvNKaVP8pmWVDFPC0+th+jFxb7moSza5QsKXALQ9kd0Q==
X-Gm-Gg: ASbGnct5nNqorsqG0YxeE9sJirl7pDsIacv5II9sUfS9SFpxxV43dpfZf2eeNIKLDmX
 LvUnGj0kB8X7xG1UrZ3yGZ4CyG9AyFBvaiCfI+smsU/l2XCDCnL59SYxiqJhCIBXhcEulPIUuSg
 ZEr6mB0G1Rwon/qZSvYKxcbM1Lcl8LBNAQqOfm6xDLHohWcebi+pUeCU02TpmjSOuSsa32JIRUe
 JW2yLxOuFUWhOT50M8MJA2Z9IUCkN+ux30Jn5glsuYIuWizHeqGcjCs477Xp+yJLHei1jZW19g4
 LgeMZetH7BAOYG5UxNijHvbWIu0jjwFYLy9L/ygxyU9/YQpbNjBM+OqEDZ9231+oA+1U8Kwsluk
 LSK/TGtokWi1IWP5BKFNbiKK9Dw==
X-Google-Smtp-Source: AGHT+IETzMv9Yov+nLnQA1qWty54slQmkogbI7LDi6Ie+NAZmxAT27t1fB16ICrsIM5TfrmqJ4iEWw==
X-Received: by 2002:a17:907:869f:b0:ae0:d201:a333 with SMTP id
 a640c23a62f3a-af618f039dbmr1538428566b.30.1753758904140; 
 Mon, 28 Jul 2025 20:15:04 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af63589d146sm507580866b.35.2025.07.28.20.15.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 20:15:03 -0700 (PDT)
Message-ID: <68883cb7.170a0220.178253.2a3a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 29 Jul 2025 03:15:03 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753758904; x=1754363704; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bWWSxG2wdP1fVIE5fJ7KrT9dZTWoMnkvyAT7qM2HUIE=;
 b=QutAL1zLFmbKNKpBEbYNYZjvYRCek3cmt9TsEhKlcvQip4WuvBSCLlQumndASEfxlI
 V6VX1BVepw1rCkEmQkfZyE0iqmk5fMv3X0AuaX3NkoY9boYxv29q7e9Ch5ct9PltwyMq
 vjRo6opYO4Ewenh93xLkQKol8VDav99YziLkaHPLseOBLogKNyBtBUHAj7JYje4YThIU
 gydPtzMHl5EeZ0f74iWa+KPh1yXwaXuDHCz00JaphT7z57vwkXl6Dsu1tbj95lL1gW61
 BO+XZSIOuOtdK7L7+rTS58QqsMI3WYfmaB8P5Sr3+CsErqG5JMw4CeTWsVPnrOMGywsR
 mepg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QutAL1zL
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-28
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

Autobuild statistics for 2025-07-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  3  |  0  |  8  |
  2025.05.x  |  7  |  5  |  0  | 12  |
    master   | 27  | 131 |  1  | 159 |

Classification of failures by reason for master
-----------------------------------------------

        host-berkeleydb-5.3.28 | 5 
                 libmbus-0.8.0 | 4 
              libselinux-3.8.1 | 4 
                python3-3.13.5 | 4 
                   bash-5.2.37 | 3 
                  cairo-1.18.4 | 3 
  gobject-introspection-1.84.0 | 3 
       host-gcc-initial-14.3.0 | 3 
        liblog4c-localtime-1.0 | 3 
                   perl-5.40.2 | 3 
                s6-dns-2.4.0.0 | 3 
             batman-adv-2024.4 | 2 
                   cvs-1.12.13 | 2 
firmware-utils-86739f2b3ae9... | 2 
               freeipmi-1.6.14 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
host-am335x-pru-package-5f3... | 2 
host-binutils-arc-2023.09-r... | 2 
       host-gcc-initial-15.1.0 | 2 
                 host-gdb-14.2 | 2 
                 libgee-0.20.6 | 2 
                  libjwt-3.2.0 | 2 
                liboauth-1.0.3 | 2 
                  libsvg-0.1.4 | 2 
libsvgtiny-ea9d99fc8b231c22... | 2 
     linux-5.10.162-cip24-rt10 | 2 
        linux-headers-5.15.189 | 2 
                 logsurfer-1.8 | 2 
                    mpir-3.0.0 | 2 
                   nanocom-1.0 | 2 
                 netsnmp-5.9.4 | 2 
                setserial-2.17 | 2 
          aardvark-dns-v1.15.0 | 1 
aer-inject-9bd5e2c7886fca72... | 1 
amazon-ecr-credential-helpe... | 1 
                   atop-2.11.0 | 1 
                   avrdude-8.0 | 1 
               bctoolbox-4.4.8 | 1 
brcm-patchram-plus-15bd6638... | 1 
                    brltty-6.6 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
              dropbear-2025.88 | 1 
                    dust-1.1.2 | 1 
               dvbsnoop-1.4.50 | 1 
               ebtables-2.0.11 | 1 
            ecryptfs-utils-111 | 1 
            gdk-pixbuf-2.42.12 | 1 
                   gvfs-1.57.2 | 1 
            host-binutils-2.42 | 1 
          host-binutils-2.43.1 | 1 
         host-gcc-final-15.1.0 | 1 
                 host-gdb-15.2 | 1 
              host-guile-3.0.9 | 1 
               host-runc-1.3.0 | 1 
        host-sentry-cli-2.20.3 | 1 
 host-softether-4.30-9700-beta | 1 
              hyperfine-1.19.0 | 1 
                  iozone-3.506 | 1 
                       jose-14 | 1 
json-javascript-3d7767b6b1f... | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libdnet-1.18.0 | 1 
                  libffi-3.4.8 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
             libgphoto2-2.5.27 | 1 
                  libnss-3.114 | 1 
              libopenssl-3.5.1 | 1 
                       libsrtp | 1 
libuci-f3fc0b76040685829191... | 1 
                  linux-6.15.8 | 1 
        linux-headers-5.10.240 | 1 
               mongrel2-1.13.0 | 1 
            netstat-nat-1.4.10 | 1 
                openntpd-6.8p1 | 1 
                  prboom-2.5.0 | 1 
             python-webpy-0.62 | 1 
            python-yarl-1.18.3 | 1 
                   rubix-1.0.6 | 1 
              sdl2_mixer-2.6.3 | 1 
                    snooze-0.5 | 1 
                    sslh-2.0.1 | 1 
                   thttpd-2.29 | 1 
              tinyssh-20240101 | 1 
               valgrind-3.25.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/7f34e97a8400b3f99e0e24209f2f9c5c8c84829e | ORPH
 aarch64_be  | aer-inject-9bd5e2c7886fca72... | NOK | https://autobuild.buildroot.org/results/59df7e6027a5203d76ac4853361dc84f123b6c31 | ORPH
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/f581288908bc3c431cda31f810c5c603bd118b21 | ORPH
  mips64el   |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/f7372c1c00fc6e270855218a1296f1016c0caaff |     
   mipsel    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/4b29987a071aaee0371b3b76e3cea334e7622e83 |     
   sh4eb     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/7bfe9acfbcd289fea7913cb43a410d89590d7b53 | ORPH
loongarch64  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/5fd77a0c22a50de1a68ee650a26a6a32ae414bfe | ORPH
    i686     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/7d8a1b8fafd76e8055219ff2ac8b2281f6dae9d9 | ORPH
   mipsel    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/37db797b8dcde9f87ec29d4dd2a4313e6240f9bd |     
    or1k     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/dac4081345bdef0e1ff321d504a47f986039ad4a |     
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/7d5222668f1d57177e7e15d874c9c2f01638880d | ORPH
  mips64el   | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/aac84231c003def9ac985f11461e93e11c2ff851 |     
  powerpc    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/964d9119fb885402c20c29611d83640fa818ef40 |     
   x86_64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/57f771e6e070d06e409370d6f3454e9dbb16b5af |     
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/8fb7373bda366a680c4ff7e6172dfb76ccc95b89 |     
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/262e5189117f6eec0ef2e6db690e2c9cfd3836db |     
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/fef25b91ad52f39326d2e2e807b9049af6847c3e | ORPH
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c7141d52cc6dc1d584a8e714e5c98ec29ee3c0e2 | ORPH
    or1k     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/f685c746a9434f940b22b691853431039d6ca24c | ORPH
  sparc64    |        dropbear-2025.88        | NOK | https://autobuild.buildroot.org/results/47666e792cdc6e9f09efd8d1964553daadd9b53b |     
  sparc64    |           dust-1.1.2           | NOK | https://autobuild.buildroot.org/results/4bef82f360902bbe2070f853792dee8f16af4e29 | ORPH
 powerpc64   |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/99fc789822eb5b5052983cd795ebc36168c1862e |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/21fe0fb3ff5b410ed44ebd28d93f4e44f8c5cb4f |     
    i686     |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/4515630067934b1cd9d23450ad5699f3a4f8d3d7 |     
   mips64    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/b59e758205858deaf560d44949d6e0ddc4a4aa75 |     
   mips64    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/c006ff2978e11d6bf247e5bc5ba3d0ae66aa6d19 |     
    mips     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/b3b0b655648d476b460bf7095cf587ea5c3e2016 |     
  powerpc    |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/a8f11a18b47894818b2f9d428e0327175b09cc8a |     
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/9343dab2d949de79f170178dc389c188dd1b45d4 | ORPH
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/f4b951432cae8e9585d89dbff584b4ec9d7b49de |     
   mipsel    | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/79a2dd38ddc230e427b445221d5ffa0e1bae60d4 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/bfc2a267b07d651d1a96b7f9b90d07befbcc4453 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6950d49c62333e1eccfef632cabb99d8e155561b | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/518d449f6570f175a2797b9dc2859ffb3f714c05 | ORPH
  sparc64    |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/dac99499ef6f795526df1ab9689cc8f1470c36b8 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/c60dbfa4282c4b8e8367505d4dd84e87116d281f |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/5478134f4f85baf6b81add3628736f6dfb4b8854 |     
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/6c8e23a5b0fcdf273d8fea446700179d97d968f1 | ORPH
 powerpc64   |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/bf2255bd247345820cad182d287b371bc1cb386c | ORPH
   s390x     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/8dcb5ad11b1e69ef29561de80605d1968b6a4a9c | ORPH
   s390x     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/78de5d7262ade6d0715904e31e95e0fca2c4d057 | ORPH
    m68k     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/f4fdac471cf93644d3b67ff5879365955eb34660 | ORPH
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/deaac2cba2b69adfede60e12888a893b1c7854ca |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9882d12e14abdab3b720ee17246cfc6053a5f239 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/3e833fd91ea1eaaca560fe1c48607a45cdbd302e |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/ab1ecb49bfc5a19ffb78e9c7d295c62ba9a947ed |     
loongarch64  |     host-gcc-final-15.1.0      | NOK | https://autobuild.buildroot.org/results/c516e17f54db314f4c78e48cd05b8f724b7a18bf |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/844425385f973e5d6339719636c6ed7f2490c199 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/923e25478299914131aa6e9a04cf71aa7432a141 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/3b5d6d67aa03a023a8009d34731a1e9dcf10c120 |     
loongarch64  |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/63ce12e3e5b797c8fc1fdbc9b8ef121a980a26d3 |     
loongarch64  |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/0cefee4887bfdfb25a29476d3b24991ab6243154 |     
    arm      |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/8f41bf059db616319fd3f8b7d06ec3f18a1d5943 | ORPH
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/669a17a5530edf62895c33e1ae0cb91cc8ee40be | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/e60879a2b3aee30a36168edb16c543e303f60a8c | ORPH
  mips64el   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/b1c2883d29918142ef21c3ddd8f6fb85e58da4e3 |     
microblazeel |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/6060220b456122a00b5eb6c762c3918c2637e148 |     
    sh4a     |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/20b7fdad19fc5396332aaeb5ee8b3f17515d5ff6 |     
 microblaze  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/dcb22fc412b36c77f930a949991210bdc9fdefa3 | ORPH
powerpc64le  |        hyperfine-1.19.0        | NOK | https://autobuild.buildroot.org/results/664a1f35c7ea8da5044c4cd81d43cd5c57f8d710 | ORPH
    mips     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/3f5bcf4b7a79b5c529717aa83913bdcb349a9c80 |     
    mips     |            jose-14             | NOK | https://autobuild.buildroot.org/results/6db0aa77c744ea4acc6cd4c39f0cba757603fe79 |     
   mips64    | json-javascript-3d7767b6b1f... | NOK | https://autobuild.buildroot.org/results/185c9896439d415a166b64c92d337a1c1d6b62a7 |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/19a5d47262108016c79e0c10b37c52b0b1a7a10f |     
 powerpc64   |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/4b673394d292abc194a806f418257e412e824e94 | ORPH
loongarch64  |          libffi-3.4.8          | NOK | https://autobuild.buildroot.org/results/590c71593bef8009b2f7d193ff6efcb0fbe3f61a |     
  mips64el   | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/960cb9f1f7f3e61d1219f5c0a5e2417980da3d5d |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/7525b4624d6ca5c84a93351528834902c37e156d |     
  mips64el   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/e62da9859cb19c8f25fccad128af7268e07f446a |     
   sparc     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/df1ceb41f7f1c8092150c9bc24917d8f60ea5783 | ORPH
    mips     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/72a2607d56ab77b98b15d5869a76d1dcd51eaabf |     
 microblaze  |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/3303ef1c5fa51f99a10edc73d96ef0dba49ed8b7 |     
   sh4eb     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/6eb095e0df9357a32207e81466c631882fc323c9 |     
   s390x     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/cc6f5d1a10ca31f2c42cd08bf8d0aeb045014667 |     
    m68k     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/2d27ca41cbd5c76b79b6948494b143891e9a8e67 |     
    arc      |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/0798fa5b1807d522fdbe5966f7e7110cb63efb95 | ORPH
microblazeel |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/ca00e7046abd49236608fb1547d9f3283dfb25e9 | ORPH
    or1k     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/97ddaf0dc2169474f7bd559f28ef38f2d9eae64d | ORPH
 aarch64_be  |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/150439cd0de16343606110db8ce485199439310b | ORPH
   mipsel    |          libnss-3.114          | NOK | https://autobuild.buildroot.org/results/512bfa612a3f9aeabdd885544cb891a05eac0329 |     
   s390x     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/63438ce1217ad275f9ad99b96d8bc32317382fdd | ORPH
   sh4eb     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/a59d5b785efbb662e27a630d33f11d2b845a753a | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/c7396b291458d0bec48a4011db1b171a96208a8c | ORPH
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0dd7dccc97f2c10d9b592a368edbe74941aacb0d |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/44a35a7e8c83fd8e251d67af0a4f9161b09ccf8f |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/40c89e4d0c95927483841d46fad55e8051c8bfd8 |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/85ba3dcfbe6da7c047308407bac17679ab37546b |     
   x86_64    |            libsrtp             | TIM | https://autobuild.buildroot.org/results/5e43da7ddc01525baa86e9559122ed25e7390607 |     
  riscv32    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/3213784b20923f8aba51a2505dc31bebbe60a355 |     
powerpc64le  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/c21c6e3ff1fcea12a58a163176b9da4e8d924b2b |     
   sh4eb     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/cc1240f3023c57e3f1247c98d2452f20b344ff3a | ORPH
   mipsel    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/7617fd158f531ee6800011afe79f6a2fbbd2688b | ORPH
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/8a6b19634609f3cafea7d4316a8f006d861aa259 |     
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/75add4bd1842ee65be09997a2fd6a149bc3faf4e | ORPH
   sh4eb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/fb15171b420cfd4575bb470d258b19aa02994f3c | ORPH
    sh4a     |          linux-6.15.8          | NOK | https://autobuild.buildroot.org/results/366c682852b6ff456525792a4967278e50933b11 | ORPH
loongarch64  |     linux-headers-5.10.240     | NOK | https://autobuild.buildroot.org/results/9186b7e66f56d19a791e589cb95228453884c4fc | ORPH
loongarch64  |     linux-headers-5.15.189     | NOK | https://autobuild.buildroot.org/results/d578a7ff840c0479ae59a9d5d480e6b0ff6a79dd | ORPH
loongarch64  |     linux-headers-5.15.189     | NOK | https://autobuild.buildroot.org/results/4081a1a93b7be8d9bb68aa858e858b69aa1e0f32 | ORPH
   x86_64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/8bdfeb6331a15f263d243c19fd6e1453c13ad33b |     
 powerpc64   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/078ea9193b37896a4cb2009ee57149840c9493ea |     
    or1k     |        mongrel2-1.13.0         | NOK | https://autobuild.buildroot.org/results/f1e5d995419428d9f44bee1e5f0460af95bd1fd7 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d8f7f9c17979cba2db5a27e076f3014bccddcf01 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d8c6e2c2e429e200bdbc5c4c2da3c9fa4a3420fc |     
loongarch64  |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/e4d4e7f74746002ba2125da5843feb865cc0e410 |     
   sparc     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/b848f61a5b0a367a31a777171e66cd73ce15dcba |     
    mips     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/bd63254b6b600870251da099e1db531984639d87 | ORPH
 aarch64_be  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/9045aa4f8a5f936fc27b97be629ea500324a4200 | ORPH
   armeb     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/a636dcbd43beb6455ea9d5958fcc919c54c52c9a | ORPH
   sparc     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/3617ff420b11067d992f79174999e76415b5a1c0 | ORPH
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/b4840085129f50c18b812195591a02431a6d2e07 |     
  aarch64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/8375ae7ddaba2792eb3cd307b2e4065731809e1f |     
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/17c3f02dd8efba6eede5bb50b048157a5cdad613 |     
    sh4      |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/ce9103e7da923b25bc599d86e11272486127e732 | ORPH
 microblaze  |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/b5ea7d17bf77680322d3b514b631da74e6f639a0 |     
microblazeel |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/b5373a6646ad20a9acabb78c11e720a0d63aa3e5 |     
   sh4aeb    |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/345214a4998d8a97ee6bf258cbe9f453d4973cad |     
    sh4      |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/2f99f44eca5806a9b7e66f8cbe4ccf52ecc89186 |     
   sh4aeb    |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/9da0865dba2a0976889b7543c617e47e37ab50c9 |     
   sh4aeb    |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/82c94c846114a57584ae94aa939532f1af9110a2 |     
   mips64    |          rubix-1.0.6           | NOK | https://autobuild.buildroot.org/results/0be19c87e260605d07536182b85302309903f31f | ORPH
microblazeel |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/a03c3c5c11abc92230429a2aac4b1060bab8d863 |     
   s390x     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/937cd0cde23ab65cf2666c4366e60c6073404ee4 |     
   sh4aeb    |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/2dc6ec25d1043cf45638bf1984bef043d1e2fe22 |     
   mipsel    |        sdl2_mixer-2.6.3        | NOK | https://autobuild.buildroot.org/results/c103e4f4b9b5a7033aa9c35157a864dec17db015 | ORPH
  mips64el   |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/1bc2231c820a3f7fcfcfb8bf813f410f528cf44d | ORPH
    sh4a     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/ba6cb4b59ae83dda9dd46f3ee0885cb5e975e62c | ORPH
   x86_64    |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/0aa28dac5b0a98d9ddf427343a75e4e40570b62b |     
   s390x     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/9376c583b1a2775d88c3263df7f998f89b33435f | ORPH
 powerpc64   |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/71722fee59e6ff1f29975762bbeee0fd709decb6 | ORPH
   mips64    |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/791d787b66da90792c34688002052da11c145d4a |     
    mips     |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/34705cbf392d8934f7e9571549446baa5fe2d5f4 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  janet-1.35.2 | 1 
                       jose-14 | 1 
                   openrc-0.56 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |          janet-1.35.2          | NOK | https://autobuild.buildroot.org/results/ff1d6063c1a79d17cfa9910cca824e704a4a0c67 |     
   armeb     |            jose-14             | NOK | https://autobuild.buildroot.org/results/5ecbc6301c043ba45d973016abe5a5402f337352 |     
   armeb     |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/f06cff62b46b260454c238cc2386490475def634 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                   perl-5.40.2 | 2 
               bctoolbox-4.4.8 | 1 
            gdk-pixbuf-2.42.12 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/fef9b2d45cb4b5232fd89b8c7f04436cf8903205 | ORPH
   xtensa    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b20316a531502f8857fa7088e475a429314600bb | ORPH
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/3e9dabe8a48df63a47aee3965299bc1350a2fa4c | ORPH
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/0a7d7c5b09bb4c55d622372b2e1d5b8885cd01fa |     
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/bdf775bf181fe90f66dacde4677afe883cde1f96 |     


Gitlab CI results for 2025-07-28
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740894 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740893 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740808 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740768 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740752 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740735 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740677 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740670 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740661 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740624 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740608 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740606 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740603 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740577 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740567 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740559 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740554 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740539 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740533 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740526 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740523 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740510 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740440 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740439 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740432 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740429 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740420 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740415 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740413 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740412 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740411 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740404 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740403 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740399 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740397 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740394 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740391 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740385 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740371 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740370 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740369 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740368 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740367 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740366 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740365 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740364 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740363 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740362 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740361 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740360 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740359 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740358 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740356 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740355 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740354 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740353 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740351 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740350 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740349 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740348 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740347 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740346 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740345 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740344 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740343 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740342 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740341 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740340 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740339 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740338 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740337 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740336 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740335 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740334 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740333 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740326 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740322 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740317 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740303 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740288 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740286 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740284 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740279 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740269 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740265 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740244 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740238 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740232 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740230 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740227 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740221 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10823740220 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
