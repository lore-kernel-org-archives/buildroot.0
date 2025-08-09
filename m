Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B1EC87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 03:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B44116088C;
	Sat,  9 Aug 2025 03:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMlzyS85S30o; Sat,  9 Aug 2025 03:14:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6610760B3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6610760B3C;
	Sat,  9 Aug 2025 03:14:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BBA2F21B
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 03:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A24D360B3C
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 03:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mh3bEvgcnGs8 for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 03:14:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 436CA6088C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 436CA6088C
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 436CA6088C
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 03:14:19 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-af66d49daffso485024766b.1
 for <buildroot@buildroot.org>; Fri, 08 Aug 2025 20:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754709257; x=1755314057;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ms8R40QixethohQIX1dmaEPvB8TFjrLeLoWuCbr1dp4=;
 b=pV+3K3r8k/4RGj0vGD0d7VqL+VIVeL3/Bd3RYn09DQk/mMZIDVDYvvawQJV+jvZJiI
 PtQXKk0/S4RZNdejemBO24RBwZN+F3qjjfHKN5ELB8H87Jh0+b7HD8hW19KiKmotN0/v
 1B9bXeFoP7xi0ZKRLmxmcF4lKBLP2Lj5+EmNB5AG+1eP3ZcGrF8twpcoEWu6bBufogWi
 lSAnk090KoGcoUfwVcdm2EEYwW2qg2p0c3NT3RB9xKn4uOVIaln+SCQm5gnLTa0Au+df
 pKGEObsNFqoCFj1okxtO9zVc+hOW5v3ef/x0sGWRpWL6EhhppfEb+ilMmD1ATzLQ2g51
 pgLw==
X-Gm-Message-State: AOJu0Yw7+PiePI7+ivcY4LeUPm7sUyyRy/94vtIGwVaVD2k6xiskgzho
 YOZDa5gQEF+I0oxT9pM16eAdgm2/L2AGZVCPWZOhm1yrspE73cKzpB1awrqyFg==
X-Gm-Gg: ASbGnct9WdJ/TImV04DZPXM2HCz8+9lkflr026AYbZ40DBLGtWSLHkudXMl9veEiHF5
 F7gTI/bqaq+5guo7gMidunwz6nNReun5+cVbE41MrTAZ2X1AzR10yYP+qKPmanFGk7wd26FT/m6
 ViL7Lv7Zjd7zyPqhfx5gEu+8rAUNra7aWCq3rmq8bRu7LG2vOiu6u0sQ7UhEQvLpUSr2htsTKWt
 J5LZz6n/WLjUftoV7f6qY7P9OeiI67IVh7QT50MceoIV/4/RUNpN6Y7pOCalqU033CkssNESdWh
 EVJE7FWQ8twCXqJJ/gHWZONxYdJ2vEoCS3pNyrr/fZW/c1QvctCAJKh/SIjdBo09bpJe5wKynv/
 XSs4jovkmFHNAuBgm/2Rlzxj78g==
X-Google-Smtp-Source: AGHT+IERQxNhIOLCinuUFr7fH5Utj+jFah3Em4FaTsPe1YXUfHs+fG8Ktf6SHQz48KMNoKJJ0Go9Tw==
X-Received: by 2002:a17:907:1c27:b0:ae1:f1e3:ccea with SMTP id
 a640c23a62f3a-af9c6375336mr458815066b.7.1754709256793; 
 Fri, 08 Aug 2025 20:14:16 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0763e4sm1601692966b.1.2025.08.08.20.14.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 20:14:16 -0700 (PDT)
Message-ID: <6896bd08.170a0220.28cc41.a477@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 09 Aug 2025 03:14:16 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754709257; x=1755314057; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ms8R40QixethohQIX1dmaEPvB8TFjrLeLoWuCbr1dp4=;
 b=hS6d3SYsqTP4T4ULoR/uRURBs0Zzmxsj8s9titnQmF4oNpTr8ByDSSieTV8yCzfGXt
 NXGlVOajWLpCaJs7R3fq5o2w0OwO6YRQmMPBDt0eTqrsE5cxvcQFUgcb+3G8+2wgH5t2
 vpL1K9JJ5I1xlZvUH4ho2E8BixxN19VIcMmMC60SHKRmrnjglmvtx2T7waF0FrL/K4oK
 nONmbhNzzmBqIq4D3FI3cvWbO0xgW7va6wku0hVxArXsmzNSRQTz06PtP6AU9m/28AB8
 +PLGlYDLFKyqCTc0Wg5U13C85tkeJKHX1Vo2NKfSlvtd9jyFD/B7DK1TGmDcyFo1Yx/h
 5waw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hS6d3SYs
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-08
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

Autobuild statistics for 2025-08-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  5  |  0  |  7  |
  2025.05.x  |  3  |  7  |  0  | 10  |
    master   | 29  | 120 |  2  | 151 |

Classification of failures by reason for master
-----------------------------------------------

         linux-headers-6.1.147 | 13
        liblog4c-localtime-1.0 | 7 
                    linux-6.16 | 6 
                liboauth-1.0.3 | 5 
                   cvs-1.12.13 | 4 
host-binutils-arc-2024.12-r... | 4 
                 logsurfer-1.8 | 4 
                       unknown | 4 
                   avrdude-8.0 | 3 
               bctoolbox-4.4.8 | 3 
  gobject-introspection-1.84.0 | 3 
libdbi-drivers-0bfae6c43134... | 3 
            netstat-nat-1.4.10 | 3 
             dahdi-linux-3.3.0 | 2 
       freeradius-server-3.2.6 | 2 
                 host-gdb-15.2 | 2 
                 linux-headers | 2 
                  mbpfan-2.4.0 | 2 
                   nanocom-1.0 | 2 
                  prboom-2.5.0 | 2 
                setserial-2.17 | 2 
                    sslh-2.0.1 | 2 
                   bash-5.2.37 | 1 
                     bc-1.07.1 | 1 
                    brltty-6.6 | 1 
                     dtach-0.9 | 1 
                    dust-1.1.2 | 1 
               ebtables-2.0.11 | 1 
                enscript-1.6.6 | 1 
                espflash-4.0.1 | 1 
                    fcft-3.1.8 | 1 
                flashrom-1.5.1 | 1 
glibc-2.41-70-g1502c248d58c... | 1 
                    gpm-1.20.7 | 1 
                   gvfs-1.57.2 | 1 
          host-binutils-2.43.1 | 1 
       host-gcc-initial-13.4.0 | 1 
       host-gcc-initial-14.3.0 | 1 
              host-guile-3.0.9 | 1 
        host-sentry-cli-2.20.3 | 1 
               host-vde2-2.3.3 | 1 
            igh-ethercat-1.6.3 | 1 
                  iozone-3.506 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
             libgphoto2-2.5.27 | 1 
       libpagekite-0.91.201110 | 1 
     libphidget-2.1.9.20190409 | 1 
                libshout-2.4.6 | 1 
                  liburing-2.6 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        linux-headers-5.10.240 | 1 
                   linux-tools | 1 
                memtest86-7.20 | 1 
              mosquitto-2.0.22 | 1 
                openssh-10.0p1 | 1 
               pulseaudio-17.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
            python-yarl-1.18.3 | 1 
                   s6-2.13.1.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
             util-linux-2.41.1 | 1 
        vulkan-headers-1.4.317 | 1 
                    wipe-2.3.1 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/40a67938dc1dcbb60dc3d38fcd2f849027a5d8dd |     
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/2dd9a47b91eeb484a92efc3e7394cc93c209e91f |     
  sparc64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/bac83eb748c89e766d814867fbdf676dbaa2cb9e |     
    arm      |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/3299774c7d94c0f7bf0e20efbfce45170cb30276 | ORPH
powerpc64le  |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/348ee85a02257d7cede24b5b9a22a6436b4fc5c0 | ORPH
    arc      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c574212c65a4f5870d0294ef3de9acadf97a5f09 | ORPH
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a361f6f3c335d5b49faeaef6adfba6f9a3f809d4 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/06754c78803f1430ba09ad54bc0c17551864d5eb | ORPH
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/527e9d639796c72eb105bccf0604410744fcca08 |     
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6296ec04ce03b2879fe06506b863d11018e5b031 | ORPH
    i586     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0d012e4dde62e9a3e47fa8effc1348e090035600 | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4f0a37d41f0987423d3a53eb8d42a4ebc29ee029 | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3062ff18640119d31cfb4ab5de92392575490151 | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8695eb8b0e1f547c0139e579ae392a23dce83c99 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e61456496539b0725b4af6e0f464406b6060c30a | ORPH
   sparc     |           dtach-0.9            | NOK | https://autobuild.buildroot.org/results/631475c3c24e11c3b5128a922a7298c3f5bd82ed |     
   x86_64    |           dust-1.1.2           | NOK | https://autobuild.buildroot.org/results/025214c5a97f5baea4bda3022b7e465054a9c5ae | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/d6e8bb028fdd7054f077e020a0e8cb06a464c4ea |     
  sparc64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/fea1bb57ee728edf87d3b44d03c90bd1cc5e6ff5 | ORPH
powerpc64le  |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/f2014c12d81156c9dad5bb614830d19faf4f9fe5 |     
  aarch64    |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/29c4d4517c6d132c3bb2d10cdde94dc350659866 |     
 aarch64_be  |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/acc3857203b14193daa2db1bca29497ffbe13683 |     
 aarch64_be  |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/16f870f848b703e0569a64fe5ed20eec2fc8034d |     
 powerpc64   |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/0f2749c882201392ba5f760a7c0a4c0fd835fe46 |     
loongarch64  | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/bdcc50f46736feee3ff3324227ee030510134e63 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/350ae8f18ea5e5b3ee2e853f3c06f141a4bc4a7c | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/84208e4140ef4a5242fbd3466c4e817212b050da | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/cbe012d23269721f7c06de288825c6a7c2d09e97 | ORPH
    m68k     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/556ec5f40a95e0d45db662bf25304cf46b4b7367 |     
  powerpc    |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/83a344c5515c5637061863c115260e7461dd3632 | ORPH
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/35d2180cefbd0f5eb97d37c600d4ca2bc4ada458 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/8de9fe6070acff53f0188f59e7fdf39634d926ab |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/66a5aa0ee15389253650ef9379c9bb4713ebd9ac |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/4a46500950dbc86cbb5e0ef1eab12181bd4487ad |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/940840f1748f5e641532a63d086b2d5192737347 |     
loongarch64  |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/ede81d171b6b270980ded38064b5cdac01690dc2 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/a55878133dd62c5027f49e7f0a757fcd18398ef4 |     
    mips     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/459d019d74f60d3667cf61c8ef419cd4f963bbe9 | ORPH
    m68k     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/5c1cf76ca625dd5de65ea1e1bb7506ab3cbdc1f9 | ORPH
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/2943b98cac25cf6a955e5f3c96e17157681faa4e |     
    arm      |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/6ab0753102696f84f9b71850137fb9596acf019d |     
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/72b78076d14261ec8e837dc8acfef9845cd312f8 | ORPH
 powerpc64   |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/f5cc6cfcaf3fec9c817ad445e9abb02ac1d3cdc4 |     
    arm      |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/05c9b8f27478decf783eb518ac75f59f766c3924 |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/e83b21f4004a57e4ff0f7558343d3aa357d856cf |     
    arm      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/f017606258319f78d24d262869b1c1c06f1a71bf |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/50c641b275515500d5f46ac91e03f985f894c2cb |     
  powerpc    | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/f5eabf10e847af70be4584de110d9399cc9ac1bb |     
   arceb     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/0d22484d06204fd97e20cfdb2acee7ce17be82af | ORPH
    arm      |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/dfc2a63da702d22e8a26edb49924c60b200ed1d1 |     
  sparc64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/cbd3d1e43860700dffc5267f51b711b1f451bab9 |     
   mipsel    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/3b863ab6278a7fb81830df888777ec4c6e1a755e |     
   x86_64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/95e325379d87ac3d9d19d2c2f0c66871f7c3251c |     
    mips     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/d0fe54678b2a66524c7f8b0f140c1638a87cab2a |     
  mips64el   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/f19e20cbd24fba8ba06eedf0020e69bf03a388da |     
   sparc     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/27484b72cd460271425ed822ab1de449738d0952 |     
   s390x     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/aa5a060eb05fc2209ccedd1d16173bdcf56ae49f | ORPH
   s390x     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/b38ea5a4b2cd0a9594d7cef059b3c3809edfa652 | ORPH
    or1k     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/9f3b8265c4023c87413b2be499360ae5a145f212 | ORPH
   s390x     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/f5deac7fddf76b5ac4e07a29cdd72dc51f83e16f | ORPH
 aarch64_be  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/f4d50e056e91710f675c9309b3724dd327b8f283 | ORPH
    arc      |    libpagekite-0.91.201110     | NOK | https://autobuild.buildroot.org/results/5dfba3ad0eea9734cdf17ac854ba9c509cad5d63 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/7d403f28f3d39d7f78dee32c05b468eab2def55e |     
   arceb     |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/76997e17f72612755329ebf8d2e39fca92846338 | ORPH
    arm      |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/4fadf24e4daff858e5e98515485513ed625e697e |     
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/9d637869d5b0f6ac767dbac3fb9ad6d41ec6e280 | ORPH
    arm      |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/af503fc66c702eb0bd7718a910b505d2e98aca1a | ORPH
   armeb     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/95822e85f04efba5d0ce96109db13768123a85ab | ORPH
  riscv32    |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/5aa95ba3d872d2423cdc1b762a7d8ce43af4b9b1 | ORPH
  mips64el   |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/dc3fdc88bfdf77ead797d85b95e0587635aab793 | ORPH
    arm      |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/a2406b77bd0099296ef751c6cda37712259f16a2 | ORPH
  mips64el   |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/4fc061790b86a982e8100f6a63de500f0e151921 | ORPH
   x86_64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/191256c1af70e3efe164dcac647d076402d4993a |     
    or1k     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/dffdb76edba849c9093bca6f5167176e165ab0a6 |     
loongarch64  |     linux-headers-5.10.240     | NOK | https://autobuild.buildroot.org/results/7ac6478a8e6c5df11dc0793f3a74174e3595d9a9 | ORPH
 aarch64_be  |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/4b2dc0f52f252a9e9e6a416813f77a7aae8835cb | ORPH
   x86_64    |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/338dd5a1982ce47c63ab671171d545fa7afca9b2 | ORPH
  mips64el   |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/1c9efd6225b9ad32f377471df7a2ee17fa1d2f5b | ORPH
   mipsel    |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/88dc3f5e7ebb19bdec25ef383ae2fddecbb0eb30 | ORPH
   armeb     |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/079390ae22123b5694675d1f1ec782e05b447fad | ORPH
    or1k     |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/f2028757c9e286f51bc51f3f7cd4940916113815 | ORPH
   mipsel    |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/3983d62bac4856048eea01612fed3306e4dc2baf | ORPH
microblazeel |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/24585758006b1edcc56512856b1dcf6688d6e422 | ORPH
  mips64el   |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/d8a73c82d95889ab9959ec7b6294dc109bf30440 | ORPH
powerpc64le  |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/1f93048c714a685459a9ac74700929dadaa91a67 | ORPH
   s390x     |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/06c6f9a9cc452f9a663af0ef488589145af313aa | ORPH
   x86_64    |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/5a57f1c197b21ed9df83d123806d0ea3b1267392 | ORPH
    mips     |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/9cbcd05069750487248b8908e7eee8bdc5c912a3 | ORPH
   armeb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9aa975ac9e2428a84d0380381b40fb05cb8f46d9 | ORPH
   x86_64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/a199f9f7352875d8b3e88be698af949a6f059032 |     
   s390x     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/06349a9e3b34832cb3f77462b43f4d4ca718467e |     
    arm      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/a32fd9c03519633de7fad30cd0dd26be85057846 |     
    i586     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/a11e05e932e35517defce258626a713f98baca9f |     
   mips64    |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/6fb9c1ffb71db8e8399e43f7b1071c8518c8eb9a |     
   xtensa    |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/0bb2caf58adea0f0376565e54b6e54c680e3cb66 |     
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/338a8d14f92c295adf9d72693eede482404bd3ae |     
    or1k     |        mosquitto-2.0.22        | NOK | https://autobuild.buildroot.org/results/16223cd838876abc9b6f941f7dc20d23afa32c3b |     
   armeb     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/96d7ed74fae81e8ed539f6e55854adf2c4106645 |     
  aarch64    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/3c47f35e50790f81664d07a1b5f4d97be3c23c45 |     
    mips     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/26a5005edcedf4c310f6ee9075f05151c618ca6e | ORPH
   mipsel    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/0a54d27cc00c0a00659298caa966ed2906e57655 | ORPH
  powerpc    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/88789e3f172670bf73393255e6806d918557c21e | ORPH
powerpc64le  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/a40d63eb4cd1fa47f701633d0f07dc574d3e2703 | ORPH
 powerpc64   |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/571bafb349a9b487862bbd2215212640fd0d4342 | ORPH
 aarch64_be  |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/5b426aae1871032286a29a5b4aa33a4701b3af55 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e151bf1871aa3703109fedaa5a1a96ed62c92ee7 | ORPH
   s390x     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/b79976ade493a442441a107cd988ecc9f08682a3 |     
   sparc     |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/4988936cf5f0df47339650a17d90c4f14eb26d6b |     
 aarch64_be  |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/32b004d47a21547326bdc5c10487e0898f257c39 |     
 microblaze  |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/0d833ac1cd74fa7c3e70e9101d666c692080ba5d |     
   armeb     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/4f1db39fa93103ba6e5d0dd446f3336a615fb96a | ORPH
   mips64    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/13ef17915c3fbda4a70bfed4b295396106110a61 | ORPH
   sparc     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/3d84bdc35ecbbee33792d65b6a538341e7e37cee | ORPH
  sparc64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/2e2c4764ca850d9574feb58ac390bfe4d124c5e3 | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/5ea15b9e6c5d501241e1505863500fe1929820ef |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/9daca8d6e6e486e5be78b990d746675c450ed130 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/1273d3d04984756c0af71fe683424b73e115846d |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6d3a3508759d13b4b68b85dfc238195687f003d7 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/2cbfcacd1480c133d438d9743dc04cc3763ca835 | ORPH
    mips     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/4f90aa14ef23302493cfc81c8765552147dc55f9 | ORPH
    m68k     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/d3e95da3dd75e09b108c9e433d8ea88f437c5683 | ORPH
microblazeel |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/9e05b21cac7476089f4969f3ba314955bb44d8b7 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
    host-gcc-bare-metal-14.2.0 | 1 
               libcodec2-1.2.0 | 1 
                s6-dns-2.3.7.2 | 1 
                   thttpd-2.29 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/5e282e2140b5d1bebeb2fbd07eebe1bcf7df44ec | ORPH
 powerpc64   |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/42a7a3acc92a54eef62fb967fb9f9986b7804340 |     
  powerpc    |        libcodec2-1.2.0         | NOK | https://autobuild.buildroot.org/results/978b664193644831a80f3f52b86f7bba3d6532f3 |     
   mipsel    |         s6-dns-2.3.7.2         | NOK | https://autobuild.buildroot.org/results/cdb800848005b94bb65aaa755c6c7103793e4c67 |     
 aarch64_be  |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/935f31e3a7a7a57a49f16ca19d7e06d8cbd4f33c | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

    host-gcc-bare-metal-14.2.0 | 2 
              host-rust-1.86.0 | 2 
 docker-credential-gcr-v2.1.26 | 1 
               dvdrw-tools-7.1 | 1 
                 linux-6.14.11 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | docker-credential-gcr-v2.1.26  | NOK | https://autobuild.buildroot.org/results/26bd91ae20e6cd7f56338bbaef85a2be2ef395a8 | ORPH
    i686     |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/5a07d31b9d8d575c0363b4e00253a954e5b42635 |     
    or1k     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/bf7bf5acdd7d09eaca930967c3f016132b817ee2 |     
  aarch64    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/ae78448949edf743e77383cd69ec5760dbdbaf75 |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/91b4c59c1b5b999cf1e9913c72a029bba264bd12 |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/a68421017c24cce3c9b24676a78d0d6a2d86592e |     
    or1k     |         linux-6.14.11          | NOK | https://autobuild.buildroot.org/results/7f6260ced64766a4bbfe9ec54c3f12e0697d7dba | ORPH


Gitlab CI results for 2025-08-08
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175723 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175727 |      
             asus_tinker-s_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175752 |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175758 |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175759 |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175760 |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175762 |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175763 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175775 |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175783 |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175787 |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175795 |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175801 |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175809 |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175815 |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175824 |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175831 |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175863 | ORPH 
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175884 |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175904 |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175916 |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175924 |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175928 |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175938 |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175942 |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175943 |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175947 |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940175951 |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940176044 |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940176101 |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940176119 |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940176149 |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940176154 |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940176160 |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940176165 |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940176204 |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940176233 |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940176240 |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940176265 |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940176270 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940176272 |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940176338 |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/10940176360 |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955003983 |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955004272 |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955004390 |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955004733 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955005275 |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955005316 |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955005353 |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955005384 |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955005445 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955005533 |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955005550 |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955005592 |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955005623 |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955006234 |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955007113 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955007152 | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955007181 |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955007813 |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955007836 |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10955007870 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
