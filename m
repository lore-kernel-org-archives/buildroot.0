Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4096CAC582
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 03:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47911810D5;
	Wed, 10 Sep 2025 03:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9V5m9NTLi_Cs; Wed, 10 Sep 2025 03:24:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAF8081124
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAF8081124;
	Wed, 10 Sep 2025 03:24:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D132D234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 03:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C36D4407CC
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 03:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qa7qN_rzJZB5 for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 03:24:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE7E840029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE7E840029
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE7E840029
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 03:24:47 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ad681so8462055a12.0
 for <buildroot@buildroot.org>; Tue, 09 Sep 2025 20:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757474685; x=1758079485;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KIXrspsC/4Td+VgcEECZQW/IUs/br5+eqPxisg3Lo/Y=;
 b=FYfHz0NZ+K1+s8CgiaBpVoCII7qdKUwjN6TCNXfL5XcQYSn1E1u8KHJaZPUrokKnGS
 LmRimcX+j2tP1ytm/SstBgV25rbJ+XlvshwUyTI6d8NUnsSU8OSHULRtugCUt3B0jK8r
 wzjtDt/huVk8UPyii06y+QX9bv0FDlRwbtdc8yhLC5nUqMOEsC+96L/gg6S4NP2+VE9M
 0ismZrn51xjZ0t7FZrCd5tB0XiJP0rJjY2BAkvsyg2SgWqmGcbRxMJRuZ0O5GuTcZCkX
 Eiik0xwN7wc+wDqTREZrpLExEXoOabqR0l7PGFIlMawcSuYh/AlK8C8oQNmv+aeVI8TQ
 R+hw==
X-Gm-Message-State: AOJu0YyKVvpXo1W17F3unnzEf/LxREngsD+q+ucEUgLYZ5vEXJ3bSMz6
 R8wGjsNbLvNDVRR+l5qIt+wFlPq8sniqyv5dwVopKCpksDLFXyQNPfCaSO5gwg==
X-Gm-Gg: ASbGncvsWFVZnH0YZ8ulcZ5D5ZaKGyYAGrbfHiX6klIGIv48Nr/2aJwwuk7D07fvK6N
 TpkT6edQbKYfWZTvnpQz6ygDWwO7WeUIbLxFTVzZvMtFNaUy23KkJUUrEHBFh+YcDDOUe2eydYu
 V4UctYIrvipJCP+33TRiffQ2QSn/iExB3oJ9Lrs6OOreg2qgZaPwmPLxgxLVFbBAMdbuU/PapDp
 sFQG6Tip2CDGRV1aeuEii8V1WqroEm7tqFddlx6dafTW0IFeKH7pM+9Pt96kAbpl0DQNFzbtscv
 LDY10jQgwfXk7u/zGdp98x4LVFu2+kdoSfzMC5WcuXn26q6Fp3dFGVHi0V6rrISOr5DC77vdI5Q
 Df7aJ1Kk1IMvLgG/nxjMVkcTs5HN1laLxkRuue1AY
X-Google-Smtp-Source: AGHT+IEinvutQxZgDu3ezxeU1PcQvwoXDN0Y50RSOXzcVDE3/td3xWdS5EQI5PD7TJd/o8vrC4/jgA==
X-Received: by 2002:a05:6402:3587:b0:627:16b5:b71e with SMTP id
 4fb4d7f45d1cf-62716b5b836mr10460007a12.17.1757474685328; 
 Tue, 09 Sep 2025 20:24:45 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62c01bdb7e9sm2502735a12.48.2025.09.09.20.24.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 20:24:45 -0700 (PDT)
Message-ID: <68c0ef7d.050a0220.27b894.79d4@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 10 Sep 2025 03:24:45 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757474685; x=1758079485; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=KIXrspsC/4Td+VgcEECZQW/IUs/br5+eqPxisg3Lo/Y=;
 b=F95nZ6Vlp3FmiQra6/+zG21rRrBj23CCz2h1zfU+OL/obw6ZW+uU9tuA5ikiVmcjh1
 Ho7gfs22vNl6RZWv1QbWqJ+PezpqEtho75ikKmei7b6MbW1zNBmfQjOPfsbTYaP9/Ssr
 A9Gzg7+GLmhb+yIFYY0DY7jinc6kGlAg4ILZ9x3wlARPYohLUhGXBQws44wjKXmroIGn
 tGmOnRPhfhx6MYYO0jYeC908TN/gV/K9KppgI4ADaT2+MIHSO0ee4LffsmqetiIQjd2i
 rZYPB8iVHFhiBXUK0MoQjVLCVxOMDvzxwEW+n+6aAAtjW2Wmd/oAYTyme31HutU13/6E
 kukA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F95nZ6Vl
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-09
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

Autobuild statistics for 2025-09-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  | 12  |  0  | 16  |
  2025.05.x  |  0  |  2  |  0  |  2  |
  2025.08.x  |  2  |  3  |  0  |  5  |
    master   | 29  | 90  |  0  | 119 |

Classification of failures by reason for master
-----------------------------------------------

                     gdbm-1.26 | 6 
  gobject-introspection-1.84.0 | 4 
             util-linux-2.41.1 | 4 
libdbi-drivers-0bfae6c43134... | 3 
              libselinux-3.8.1 | 3 
                 logsurfer-1.8 | 3 
                 c-icap-0.5.10 | 2 
                  cairo-1.18.4 | 2 
          chocolate-doom-3.0.1 | 2 
                   cvs-1.12.13 | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
                 libgee-0.20.6 | 2 
            micropython-1.22.2 | 2 
                    mpir-3.0.0 | 2 
                openswan-3.0.0 | 2 
                   perl-5.40.2 | 2 
                python3-3.13.7 | 2 
                       unknown | 2 
amazon-ecr-credential-helpe... | 1 
                   atop-2.11.0 | 1 
                     bc-1.07.1 | 1 
             berkeleydb-5.3.28 | 1 
             cni-plugins-1.7.1 | 1 
      docker-cli-buildx-0.25.0 | 1 
               dvbsnoop-1.4.50 | 1 
              execline-2.9.6.1 | 1 
                 expect-5.45.4 | 1 
                   eza-0.20.19 | 1 
                flannel-0.26.0 | 1 
       freeradius-server-3.2.6 | 1 
          gitlab-runner-15.5.0 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
         host-gcc-final-13.4.0 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
    host-llvm-libunwind-20.1.8 | 1 
               host-runc-1.3.0 | 1 
 host-softether-4.30-9700-beta | 1 
            igh-ethercat-1.6.3 | 1 
                  iozone-3.508 | 1 
                  kexec-2.0.31 | 1 
                   libcap-2.76 | 1 
               libcgroup-2.0.3 | 1 
                  libite-2.6.1 | 1 
                libshout-2.4.6 | 1 
               libucontext-1.2 | 1 
                  libva-2.22.0 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
            live555-2021.05.03 | 1 
                 netsnmp-5.9.4 | 1 
                     nvme-1.12 | 1 
          perl-net-ssleay-1.94 | 1 
                pipewire-1.2.8 | 1 
               procps-ng-4.0.5 | 1 
procrank_linux-21c30ab4514a... | 1 
           sane-backends-1.1.1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               syslog-ng-4.8.1 | 1 
        vulkan-headers-1.4.317 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/65b65fbb515a02e9abfcfb70ad054bd639b53e79 | ORPH
    i686     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/1933b759c663ba0bf5d7eb1d07f419168f7f2471 |     
  mips64el   |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/0a4b536f46a51ca162cd27b35f91cfba6e48e9e1 | ORPH
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/f77355ed13ccdcde9c7852a936b0bfa07142e1ba | ORPH
    arm      |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/775f6fcb793e136ac7bad85fa4c109504fb4d2ea | ORPH
    or1k     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/aa3f728e7513dd03a7751ffe3b3670e095d29d8e | ORPH
    arc      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/a2f56d507d50332b09d30433d8dc37e55677a9cd |     
   x86_64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/5c9a3609bb708c09f320e9e4fe2209e7cfabafca |     
microblazeel |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/df1940fffd716060021602ee8c468cb735b07159 |     
 powerpc64   |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/c33d78c006fa8dcab68961a8c250238c1729a7bc |     
    i686     |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/25661efca38d2690e915c33c6a3b44f49526961e |     
  powerpc    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e367ca891d08c5a03121d03478b7dd2ad8335ae4 | ORPH
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c05145239b168450ba2a347dfd39c78d767b7a0f | ORPH
   x86_64    |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/fb24fd7bb4c987a9a4c026a07f81a5fc04c98c0e | ORPH
powerpc64le  |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/562faa8176d4437d3cebbc5ecbfb539cc7f51b6f |     
    or1k     |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/a00308c397067b3681d5a847da5b51295f293699 |     
   sparc     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/debc13afffbf92b900a5242998d5d1d2f489e229 | ORPH
  aarch64    |          eza-0.20.19           | NOK | https://autobuild.buildroot.org/results/260600d6c9f4f3378f2f60ce8e65ddc6bd90f045 |     
    i686     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/c2aa8e00f5783e0a4a0e0e7a80c38297307dbc5f |     
   s390x     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/92cc7c1d8d355a7c4509f9bc6000835d3bfee06e |     
  sparc64    |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/25a6a1c76323d97efd842f67875899698e09ba04 | ORPH
  powerpc    |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/6f2d581c12273a9e91249d42a66fb1a588fb731f | ORPH
   s390x     |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/5da7b5aa1ee51b52b29ecbd4f2535f3dffae548d | ORPH
 aarch64_be  |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/71e868fae38956c8be0b465875b1e8248f3d0cb9 | ORPH
   mipsel    |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/3aef9f0bc15247ee29a285198c9323cc273224e6 | ORPH
loongarch64  |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/0dd19df0c17d8864895858a66a34c25e90dd4b67 | ORPH
   s390x     |      gitlab-runner-15.5.0      | NOK | https://autobuild.buildroot.org/results/f8c389caa3f436f54d97b035480dd83b16e4726a |     
   arceb     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/5da95749e5e52c6f260c5c03381da3574e1e6247 |     
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ec9f0c7fb22062d19eb10dbded17e2d82934211a | ORPH
   sh4eb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7ddc2fcd2b74dac766f0938a7761bf831287232f | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/723f78c6657e4e74227f51a75859aec444f830e8 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5dc95b1df466b1ea84a3ee9b06b8400dd91603c6 | ORPH
   arceb     |     host-gcc-final-13.4.0      | NOK | https://autobuild.buildroot.org/results/1af0fb3d905bfe02c9a0fc6d38094740d4a53d92 |     
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/15d7701244f0bf7a9a5a378ed4161fbc3a1d52fc | ORPH
   armeb     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/3e8e3b40e807e7dc6841dcb5d4d189aa92ab5b98 | ORPH
    arm      |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/d9141853e27a939abfd6b97de0d153c0f125cb07 |     
    arm      |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/257a57eaaedc07025e3c31b02a2b315e1446961d |     
  aarch64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/ecdc1f6a528ce2e1e2e4e12840478d18e1e1ad5a | ORPH
   xtensa    |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/250102468e4bf767fac804801a66775798454d1b |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/60c7655efcbfdf4dd5dee7cf485993dd51558e64 |     
  powerpc    |          kexec-2.0.31          | NOK | https://autobuild.buildroot.org/results/bfcc62c25bcf027c1fde79a40555aaade8aee903 |     
   arceb     |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/79e1a8e2f75cf5f427d585a9f535517c79365a21 |     
   s390x     |        libcgroup-2.0.3         | NOK | https://autobuild.buildroot.org/results/e75623cb0705e5afd048cea70c4ed8fd0888942d |     
loongarch64  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/590e90d41a8a12aa09b7c9d5970cdf358321e8ee |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/fab031305cb52796fec66f4e60b788f9b159133a |     
    or1k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/93248156cb07bcb56c2825243e3346a5758be7b6 |     
    arm      | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/28ed5b534268a26fca9f2fc7cbba97bd78fc12f8 |     
    arc      | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/7b8954fa54a14104789df9991f73ae01088e2ece |     
 powerpc64   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/7acaf2f17ba23bbf02123472b4465645fb6b8fcb |     
   s390x     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/d56ac9bbde6fb6f846549f32efaa78cbfe00b17c |     
  riscv64    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/22dfc73ae01a2513aedb7aa2ba4027bf6529a2c6 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2374bdadd4b18e3a2ee0f194f33d5dc3f4817fca |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f75f3fd48e2e4440cbbd144a694896cc35a1596b |     
    mips     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/55057e84b739bb4c70dbf7c065708798519ae4a3 |     
   mipsel    |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/8da639d1b8154446bbad737e2b900a6c6eef20cb | ORPH
   sh4aeb    |        libucontext-1.2         | NOK | https://autobuild.buildroot.org/results/317204e228f00c10ddc128c08a9db0cb03b85081 |     
  mips64el   |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/7dc37f37b6460beca70b07d01b0de068c18dd268 |     
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/3de90c0f1da4a76799fbe0a05ee92059fba33b14 | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/a0c286e1a60068110931dc827c9f46c145a85d5d | ORPH
    arm      |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/5b089d52532d62fb25f1555da09441940e524f9c | ORPH
   mipsel    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/e361f85f7ecabe9665db7652a662d579fde1b596 |     
  aarch64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/c63840968a7b7026558ccdbfc05ad8e458ac4c3a |     
    mips     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/09b30b821c8cb2fdc055281568fc6e419d225229 |     
    arc      |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/366f94ca01a28008cdb78ddad1a76f065d9c3a54 |     
powerpc64le  |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/ce4d9d746157ef6a7b460f12fda0ddbfe6fc9c41 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/58d37357970b3d21548817a997688da0383a622f |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9e7eb9b0fc62362c5d39a7a22a6a765da5408db0 |     
 microblaze  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/72a5e520a3f96fd808b1317e84fb051ca75d9265 | ORPH
    arc      |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/1b20cb4e288d88b9cc546f51c071567800abcf8f | ORPH
   sh4aeb    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/3f4b24b1ffbdf5c648ccbb71ae0151dfd6097369 | ORPH
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/d15becb28639eebae77b7e266b2931b641b854b9 | ORPH
    arm      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/0f73ba68882525362fdbfc405fdd3813bb767c69 |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/3b7bfa0f6a1b4df6e45a1ccfc310a606666521ea |     
 powerpc64   |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/0408f3cde4e875c4d810ce3539393a84b7fa90c4 |     
    i686     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/5146ad5fca17985e899b8a2bb49637248a0e1beb |     
 aarch64_be  |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/cfa50189cca6f1cf5900e7d89605790e8e4d266c | ORPH
  riscv64    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/a7a17cd5371106874537a39dd2fadb88b915a539 | ORPH
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/471161f18eb7ff132718f7e4132204b74855042c |     
    sh4a     |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/e52b76330ea6420eb38056dde8f3c6cdf8efcdad |     
 aarch64_be  |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/abc648062855c391bbd9538e0753d1dff1f821af |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/9a1a3b94fc9e35e30f5caa408b21c03da406113b |     
 aarch64_be  |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/b230679a1bd05cb34db1eb709650a25095b58641 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/91dfa5ae846cae601029f8adb48de9e72cdd9a31 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/8996353c7a4c6ae29dcb576a30bb780e6ff0d8c7 |     
    m68k     |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/607ab75763812d8e17bd1fadc253658948005470 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/a21b2eb750aa973b7707f451aaed4b086ddfe1f1 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/d6e4b6e8cffa4200d3ea2c800d63a3efd68c6e69 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/a0ba4979f0bc11b7bcd1f743197b7ba06d2cbdb0 | ORPH
    sh4      |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/d0e1b146b0ac2aef4a54e59f2f7c99c8b1d78d51 | ORPH
   sparc     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/bbfa70d9d14ee031078180ee69d6666ebf50408f |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

    host-mender-artifact-4.1.0 | 1 
                 libgee-0.20.6 | 1 
                   perl-5.40.2 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/a6a1487ae7d93b085ecdb21fdc2d201d7226b3b1 |     
    arm      |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/2143a76d65eb9b2c37af42dc5aaee36aef58b48b |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/964b7d4527c80bef346dd84f08196bc9c967afdf |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

     linux-5.10.162-cip24-rt10 | 2 
                espflash-3.2.0 | 1 
              execline-2.9.6.0 | 1 
host-binutils-arc-2023.09-r... | 1 
                  ledmon-1.0.0 | 1 
                libglvnd-1.4.0 | 1 
odhcp6c-53f07e90b7f1da69771... | 1 
             parsec-tool-0.7.0 | 1 
               procps-ng-4.0.5 | 1 
                   trinity-1.9 | 1 
                   wmctrl-1.07 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/8f10368c4aa5eaa8463f61e8c40ac6cc8ee3604a |     
  mips64el   |        execline-2.9.6.0        | NOK | https://autobuild.buildroot.org/results/4dbc592d117aaeea44f7ec372c5cf2d8bf1ec631 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/12b094bdf73ca46307a559f7b9b1480e82458be4 |     
   sh4aeb    |          ledmon-1.0.0          | NOK | https://autobuild.buildroot.org/results/7d344b638f6fdb9cfaa015e8954e5c582dcda4cf |     
    mips     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/bdd320c9fd334dd0525c26e9704a6cd1232b2bf9 | ORPH
   s390x     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d95d715c7382cda55cdb3b11eda6d55ff9a06ecc | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/059deb02232c3bfca221f7db798318e6c67ccad7 | ORPH
    arc      | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/7f2995b6e1229410aba93f23014cad631d57d1f3 |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/20e25605752c8d675210fba20a67cb0d7ef0f22e |     
 aarch64_be  |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/518ec6471a995b85527ac0b7aff8be41b498ba52 | ORPH
    arm      |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/f84d3266cce1470d4f016a58fd6d73950347f462 | ORPH
    mips     |          wmctrl-1.07           | NOK | https://autobuild.buildroot.org/results/7c2a5438c09e8f02b8c2609818795cda9173aa1c |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                     criu-3.19 | 1 
                 linux-6.14.11 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/c026481822cac4cd0eb9a0296af41a98c44e580a |     
   s390x     |         linux-6.14.11          | NOK | https://autobuild.buildroot.org/results/d85a1f260700fcb3b2880d69f7b8d17b6247d590 | ORPH


Gitlab CI results for 2025-09-09
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/11284619275 |      
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/11284612551 |      
                 TestPppd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11284607185 |      
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/11284606653 |      
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/11284605584 | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/11284604496 |      
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/11284601772 |      
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/11284600884 | ORPH 
             TestDdrescue | https://gitlab.com/buildroot.org/buildroot/-/jobs/11284586301 |      
              TestGitRefs | https://gitlab.com/buildroot.org/buildroot/-/jobs/11271126415 | ORPH 
              TestGitHash | https://gitlab.com/buildroot.org/buildroot/-/jobs/11271126414 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
