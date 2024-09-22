Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B20CF9C6B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 03:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 077B9400E4;
	Sun, 22 Sep 2024 03:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFr8FiEk55Ro; Sun, 22 Sep 2024 03:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D37740531
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D37740531;
	Sun, 22 Sep 2024 03:18:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F5A51BF292
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3192F4068F
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDAtxMDEAQdR for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 03:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C803F40656
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C803F40656
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C803F40656
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 03:17:59 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8ce5db8668so125879766b.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 20:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726975078; x=1727579878;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FnaCdI1gEfeyXSh5aME3cH/6sDgFRzyV1ey9od84vTo=;
 b=n4AjDPWqZGr5YA9evVKyx96plNZq3qSi34WugTz4XRnpzs4uIiqCnt3Gr4iNzl2+eM
 4wv25ArBIg8i3Ybv1BOOqFBEQlOQWQUpxAkXmYrDvkVnX5rT+r9HtYBNXaIDmSo9S7w+
 YtPynVLvRLd8I3yfD5AMFkqQtVty5CQWmVzUpxhpHc7yUVg3PDguV235x/goafhluDHu
 O2PmR/phsDfEOKoewp7Fh7lXl7whsBt5Fkr6DhLaLRT6TjLwl1x4ggB8YcZhVyL2e3Xn
 QFZi8jiVJxyqDJnSZUw0Ln+cH7oMjhUWXvnYkb2VzTAb/TS/gMR3n5BbNlMIUQxpF3ar
 QghQ==
X-Gm-Message-State: AOJu0Yz5Z25iY5Kv4btsNinCjB/Wi0eGdk2ZFGdX+et7ifo0WuiDhhVi
 uX/sC9FVwTp/ZpwyifsnCgQAaY6AzvRDhCvcJFPPFkpcWnw6OARaV/MQ1w==
X-Google-Smtp-Source: AGHT+IFwASIYWykqHWy73SGrEERMyigwuGgni+3yePHri8ZZVTMZAD7PcUbCy716U3PzxCN+LognbA==
X-Received: by 2002:a17:907:d2e4:b0:a86:7c5d:1856 with SMTP id
 a640c23a62f3a-a90d58044e8mr719674466b.46.1726975077391; 
 Sat, 21 Sep 2024 20:17:57 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f442dsm1035968866b.59.2024.09.21.20.17.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 20:17:57 -0700 (PDT)
Message-ID: <66ef8c65.170a0220.361c5.4992@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 22 Sep 2024 03:17:56 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726975078; x=1727579878; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FnaCdI1gEfeyXSh5aME3cH/6sDgFRzyV1ey9od84vTo=;
 b=gskdOqUV7JY/j+6A+Kc3RUjyJ3XV7Be05KQHbh81jSp3fb6xXfdSocEihOiiJTAEUo
 g2Z13KA5XPAsJrHeIhwXqM21pW4D7S8EkklHn+SSIcWMLiFwrT70Es08BCVoBncxy7l/
 JcOzTAlCAOTf0Jt6p+3DRMModzzFuatCNjNp8+1DFzHIXF4/sz10WFrTgvT87/b36orz
 xd6D9mc5Hp81ZzyJsR+R3z53DoATnGQi0zPCoOAL3KJZQemPOWwsd4nDRpaNzIra2Eww
 05FuxoQ3FG97ILnecHBvfD2MFmtkp9J1DU/IPL8bJ3IEI/LxU6V/IEBRXpL+dMOXTRiw
 cFIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gskdOqUV
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-21
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

Autobuild statistics for 2024-09-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  3  |  1  |  5  |
  2024.05.x  | 16  | 27  |  1  | 44  |
  2024.08.x  |  4  |  6  |  0  | 10  |
    master   |  8  | 63  |  1  | 72  |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.77 | 9 
           host-librsvg-2.50.9 | 6 
      python-autocommand-2.2.2 | 3 
                 apache-2.4.62 | 2 
                  cairo-1.18.0 | 2 
            gdk-pixbuf-2.42.10 | 2 
                 gnuplot-6.0.1 | 2 
  gobject-introspection-1.76.1 | 2 
                  linux-6.10.9 | 2 
                  ntp-4.2.8p18 | 2 
           at-spi2-core-2.50.0 | 1 
aubio-152d6819b360c2e7b379e... | 1 
                  bcusdk-0.0.5 | 1 
                    bsdiff-4.3 | 1 
                    dust-0.9.0 | 1 
                elfutils-0.189 | 1 
                  ffmpeg-6.1.2 | 1 
              fluent-bit-3.1.3 | 1 
                 fwupd-efi-1.6 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.40-18-g564178076272... | 1 
                 hddtemp-0.4.3 | 1 
 host-binutils-bare-metal-2.42 | 1 
                host-go-1.22.7 | 1 
              host-rust-1.80.1 | 1 
               libdeflate-1.20 | 1 
                  libsepol-3.6 | 1 
                    libsvgtiny | 1 
          linux-5.10.162-cip24 | 1 
            linux-fusion-9.0.3 | 1 
                 logsurfer-1.8 | 1 
                 lrzsz-0.12.20 | 1 
            makedumpfile-1.7.5 | 1 
         perftest-24.04.0-0.41 | 1 
          perl-net-ssleay-1.94 | 1 
                    polkit-123 | 1 
               procps-ng-4.0.4 | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                   swipl-9.2.6 | 1 
                       unknown | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/e70bb0afe59deb6f45ef4f32f95e54169885ec57 |     
   nios2     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/c39d5bd7451323c5fe2f6acdf1833e2fb39afd7e |     
   arceb     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/3ce4ad8deb72ab7c7745c730e7d96a47b7d16107 |     
    m68k     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/59651b33883e3511a46d21e67833c83bfb00ae7e |     
   sparc     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/4fcc59c1abb166bf04285322709c782d685df08e |     
    arm      |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/94a88aaddce588404858562e23efcecd5d7b7bd2 |     
   mips64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/e023bf1c2da44b6fcb9304010a458a49c0490845 |     
 powerpc64   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/a78886b454132e0f013e273809ac39923de3d2f3 |     
  riscv32    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/c35ffef22407d0d6504c056f39bd3213fcf1fc30 |     
   x86_64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/047150c701a04cf9a72a4fb42606dd0b435c27b4 |     
   s390x     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/5981bb0b3055f3243126d3728f21811cb619c7ad |     
   nios2     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/7a5f30fe9c5cd1d3015b7a9e42ddd4b94928c863 |     
 powerpc64   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/40a73b747df6efab42cc04f0f7570fe76a7125a4 |     
   nios2     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/fc28762e1d02b958b7463f3fe2f518967555c895 |     
   xtensa    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/ea2acbb1d92aa76fccc5de2251e8646cf3ebf851 | ORPH
    or1k     |          cairo-1.18.0          | NOK | https://autobuild.buildroot.org/results/fc48ac4a51aed1a3e6783e0417c4f4f7df219bec |     
   nios2     |          cairo-1.18.0          | NOK | https://autobuild.buildroot.org/results/a8e9a39dd591334a07eba3eb6962e56e3d7c2b6b |     
   armeb     |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/c1ce041ded60d5d7c6d6254431a06ab29df98275 | ORPH
powerpc64le  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/372e6180a9702711e764537a4084943cf8746b98 | ORPH
    i586     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/ef7b7d21b5e1d2fc655aa35a25cd26135a96dca9 |     
   xtensa    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/8e09d46e0f72cef525b87f7469c8ea9506aac963 |     
    i686     |         fwupd-efi-1.6          | NOK | https://autobuild.buildroot.org/results/aae6a1a9840f841c03d840bfa01c8b5ca1936190 |     
microblazeel |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/0a49fa907238af035d264b44bb0bb412696c7d23 | ORPH
  mips64el   |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/49530807a95453da9dc77649484534ac9e68b33a | ORPH
   xtensa    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/b891dbab84ec9322c16d7e36a56b87983caf81ff | ORPH
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/a71be7cea259e482b9fe202ef44e529c2ceca8f7 |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/bc0399dc692f504a6b76bd05245ed9e1ebbcbd6c |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/d7cfd639b66b2fe1bd231b70c9992f9497599761 |     
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/df6f49ca69ff1ac21b914227d51cb4dfdfa31a87 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/dcaa581ddc958da3cd284649b2f541969106dd60 | ORPH
    or1k     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/79c47d3931015728755c2497e9fd07499270af8a |     
    arm      | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/68ed304165c4ebc7bee20b5d24d449687b577949 |     
   xtensa    |         host-go-1.22.7         | NOK | https://autobuild.buildroot.org/results/4ef5f73a3406c491896a32e34a6a1ba145de068a |     
  riscv64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/1b5363fa72c544ef4af1587ece8ce77d28677471 |     
powerpc64le  |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/0eb2da4c638d18b38cf290d0ccbddd2b085885ca |     
microblazeel |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/b3369d86c2fce63679409873ab24b2a102b26414 |     
 aarch64_be  |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/c2cb4054643b58bc47fd79f8fe16d307225979e3 |     
    m68k     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/bfaf88fc14ee0c42e1af9225111a8e065ec9d0cb |     
   mips64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/523e35ded0d37b11a7789ce27566d0a0eb777e05 |     
 powerpc64   |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/b1d37c5cb07a50009735e88eb1c47dd0ff8d5559 |     
  riscv64    |        libdeflate-1.20         | NOK | https://autobuild.buildroot.org/results/73161fa82f97be2c83339417d7a09ac5b61f18e3 |     
  riscv64    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/4a79fc2c509953a8f4db98c7c2774697516d0ec1 |     
  riscv64    |           libsvgtiny           | TIM | https://autobuild.buildroot.org/results/547c84e9b875d07eca2b1ab615608e2a7ca8c7bd |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/da304bb43236fabd4cd4e3d973111dd9a84fd058 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/a2627226284300b541880f9fa6d47eff29a37055 | ORPH
    m68k     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/c9b3a8ea8f26d8d519730f9b549363558445c691 | ORPH
powerpc64le  |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/90c3d66d3ce51ec3b2aaa5722b836e8e5c5799ed | ORPH
    mips     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/fd94e47a3e9ad0a8a0d3c09aa7e45dba0f771e38 |     
    arc      |         lrzsz-0.12.20          | NOK | https://autobuild.buildroot.org/results/615d08c3083f6a52ea92d5f8202f0091575cb450 | ORPH
   s390x     |       makedumpfile-1.7.5       | NOK | https://autobuild.buildroot.org/results/50d719d494f6456b0c4b9687c08541d0d77c83c2 |     
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/071847b02d04e56e758390bbe4d856b570a8f40d |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/2a76931a7baa86349433d0a293b1419882b77bb6 |     
  sparc64    |     perftest-24.04.0-0.41      | NOK | https://autobuild.buildroot.org/results/4f2827fe544a46ab0be56cacd1c7c8c8d2df59f8 |     
   xtensa    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/9a5e64de855fe2c43646bbf797b081b1037b24c9 |     
   nios2     |           polkit-123           | NOK | https://autobuild.buildroot.org/results/d88429df3d0af606f20a33d3780e3f65e4408b50 |     
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a24c3804e66db2001a39a4c5fbdc6ae02d10c6c6 | ORPH
  aarch64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/8208fa2d6a46564b3c4cb4108a4e1f527e728dab |     
microblazeel |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/b96168e6af731293e34bbc0ce0fc9bbb8a7f2175 |     
microblazeel |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/e7667d7ee002c84a26cbba26b3f1e6d90ad606fd |     
  riscv64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/7ce509ece720bc0f69ba181172e71508c9c3fbad | ORPH
  aarch64    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/5b7f03d597603b3236c6fccce21ac904dd632dfe |     
   mips64    |          swipl-9.2.6           | NOK | https://autobuild.buildroot.org/results/3d8ae66353323096c262b6d504b076807249c161 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/58f2718250923f90e56fe300997f79e6d19883c4 |     
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/e483d240f2aa9b02031f972fea52919c03036c10 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

         gobject-introspection | 1 
            host-cdrkit-1.1.11 | 1 
               libglib2-2.76.1 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/44d7e6424712079e2b065094132cf5466309b897 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/065ec62f728e4d840cb3b983a12e3786065f68f9 |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/77f4f1200c9963bb0b805f293133174ff5d2e75c |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/b2ddf72d12791a832a701c6ce216da45b325b0dc |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

glibc-2.39-74-g198632a05f6c... | 3 
                host-go-1.22.5 | 3 
                       unknown | 3 
 host-binutils-bare-metal-2.42 | 2 
aubio-152d6819b360c2e7b379e... | 1 
                 coreutils-9.3 | 1 
                 dc3dd-7.2.641 | 1 
                  ffmpeg-6.1.2 | 1 
                   foot-1.16.2 | 1 
                gnu-efi-3.0.18 | 1 
                 gnuplot-6.0.0 | 1 
         gobject-introspection | 1 
host-go-bootstrap-stage3-1.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
host-vboot-utils-bbdd62f9b0... | 1 
          libcamera-apps-1.2.1 | 1 
          linux-5.10.162-cip24 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                    qemu-9.0.0 | 1 
                rocksdb-6.20.3 | 1 
                   trinity-1.9 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/0cc01a1b0065f4ba049775ab7b9880419d1d91ba |     
   mips64    |         coreutils-9.3          | NOK | https://autobuild.buildroot.org/results/788dd9f7c5529abe5e4d644310ccf7ff5cc0d205 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/2095786db9416132d52fc53adb1f10ab0e9f2faf | ORPH
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/eec153efb70aa954c3612ce7f72771cedd15d801 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/7d82acfc49a895b2310adb8139c65fa9e715ce7c |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/18c2afa545b10605c9c03693a132ab78f397bc2b |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/7e267e2303b40461b49e73758977727a99e0021e |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/2e8f3b518fe1a68c17e81f889d9ab40759363505 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/50ccaf0c0e2c36a31f2c115d13668f5cd53ec4d5 |     
   nios2     |         gnuplot-6.0.0          | NOK | https://autobuild.buildroot.org/results/2ff5653d962b3b17e90949a8205bce8886d59982 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/335964e8484f3cdb97301a56664870ae29159f7d |     
powerpc64le  | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/c3f46ef6bf99d72dba40307418e3c0032a37d074 |     
    i686     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/6618f6da1adb3e2c3529a8b7c814b47799503a7d |     
   mips64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/c871776cd8e796fc4fc545cfdd1f03729c3d2192 |     
  riscv64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/39fa8254c1072f4f7523354528642de7a8f8d4aa |     
  riscv64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/d6ee4d2920e78799ad28de1df5a144f6e31dbbc0 |     
    i686     | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/82a776e0d1ba8271fe062fd8616b317c86deb4da |     
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/7f5602e7a23f0772798a8f4347a5648c96fcd048 | ORPH
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | https://autobuild.buildroot.org/results/d22668bee3ef9a704e1dc21e68e1ffac4a575242 |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/4a6b5d43efdea27bd22a118f1deafc10cd40f63d |     
 microblaze  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/b2c135f9e6fbf96bbafbe3a09f9b73bf9a9e12ae | ORPH
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | https://autobuild.buildroot.org/results/e5a56fe0b809d42465817ed9993896f1ba6c6235 | ORPH
    i586     |           qemu-9.0.0           | NOK | https://autobuild.buildroot.org/results/875edc48e27944534226f4c0f3d0bcfac75ae50a |     
 aarch64_be  |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/33d9d52c1d1b2a16e82b727b8e100efafda82b77 |     
powerpc64le  |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/b950e5fcc0815b1adf88cf480223764f43ee234b | ORPH
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/978c012efa44b4c7ee696e7fd8d77d06c57ea5e9 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9d1dd7855fc44a43fda9b8ef35e613f1c8066ccb |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/58da494e5cbb47ba5d2453e9b4d05c4cae531749 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

              fluent-bit-3.1.3 | 2 
                  bind-9.18.28 | 1 
               ipmitool-1_8_19 | 1 
   libtorrent-rasterbar-1.2.19 | 1 
               valgrind-3.23.0 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/bfc9b88fdbf19f0a36aa7e14174d84f030d54b44 | ORPH
   mipsel    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/c3cd519fd246eb210e64db5545b44ec1d937bbc2 |     
   armeb     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/7626eb39e6ba0a54494f5debf1788c01acaee36b |     
  aarch64    |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/cfea04237553fb3200daa6d752928b051086297e |     
   x86_64    |  libtorrent-rasterbar-1.2.19   | NOK | https://autobuild.buildroot.org/results/b4d79ff234419d8366c6f4c7b23e4007e6952ac2 |     
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/69cd164876698a592c05ae58bd4b08139660056b | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
