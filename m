Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DD6CF9C5B
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 03:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44FC340286;
	Tue, 24 Sep 2024 03:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAr5yikkHGB6; Tue, 24 Sep 2024 03:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 918E540288
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 918E540288;
	Tue, 24 Sep 2024 03:17:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED2651BF267
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 03:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E925B400D2
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 03:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7SBBntLaMT6g for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 03:17:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C2BD0400F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2BD0400F2
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2BD0400F2
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 03:17:40 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so821941766b.1
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 20:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727147859; x=1727752659;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eK39nNtUiet0C8OWpZF5wIdRB1t7Kb7ehNlxEP6KzjQ=;
 b=A+Z3yYurQEFFFnag0dzHfudww0RXKbHP4+HqV1wnwjHTspPvtAVi8PadJEVmuU1fpE
 HPb/8Sk1GZHmpQj4yztwHrGl6JOZ75rAHXmXjXsdyNObj6YtPgMiUw6jSnFPoeSIshki
 f23JsEU6ySfUE/GhzjU6Plr7mOiMR9c9U4UZvxCyhgEVhUoVqa9DW4JVmOD3vnyeR8cP
 piebLyPx7d+QymKMlIXupC+VZ+e3dzGI/dEF0d2ANT3IChLLWqZsUJvmukGihqb8AU+N
 sZN7tKOTtUoBgyJ6bHBbogLfoI3T0K9Xey/C+T4g3a0dMcU/xVBPYIk3ec/PcLByBD46
 VZdg==
X-Gm-Message-State: AOJu0Yx6WrAhVCPqcEmgH3CoLToUzVRnJqpNfGv3oSkUQL5JCuUeAFya
 zkb+4RktFQ4qi5LikG/tsCY8zCLqtqTpAm48ESX2kXFGIJbtXOS18gt37A==
X-Google-Smtp-Source: AGHT+IFaeZ+iNG2i8NfCQvo6NDEuBvoZeTDlZukfXJJO5tt6qXw3uVFx8MzYEP73jv5L2pJJVOFHhw==
X-Received: by 2002:a17:907:e283:b0:a8b:c9d4:5cef with SMTP id
 a640c23a62f3a-a90d5033e75mr1255274866b.29.1727147858072; 
 Mon, 23 Sep 2024 20:17:38 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930caeaesm28288966b.115.2024.09.23.20.17.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 20:17:37 -0700 (PDT)
Message-ID: <66f22f51.170a0220.38747f.0e10@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 24 Sep 2024 03:17:37 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727147859; x=1727752659; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=eK39nNtUiet0C8OWpZF5wIdRB1t7Kb7ehNlxEP6KzjQ=;
 b=gXDhhk5TRZAgUlkELUh+A5dOMMk1RNQAuFeAYjZS3T94B+3trA6N84mMeWDAuZSnLa
 V0lkS0k++qhKPpuP7yqgLuMEVCEurxhOtKzHSNRmcVRRxsepGYEGYdXM+vuwuLI1n5+l
 FLKJgSmyJcApHnLBZdCxCiBVA3u2ny2wn+q/y/yRYYyzxfzh3rGxVz4N7p2Kro00NOQX
 dVYvnvTo5HF8EKJdckXIVh3b656fKg6mopTN9mPVWgv4YIM8azyTf2jfeFYn5Y7uurjS
 NQftBKGU/KpgpCvkdCiRRUEnUIjKgJ9ujxcquMdyRUQn4BWX6durxQlUp8HehY6EHdkj
 l9Pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gXDhhk5T
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-23
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

Autobuild statistics for 2024-09-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  3  |  0  |  6  |
  2024.05.x  | 18  | 30  |  0  | 48  |
  2024.08.x  |  7  |  4  |  0  | 11  |
    master   | 13  | 250 |  0  | 263 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 45
             bluez5_utils-5.77 | 18
               procps-ng-4.0.4 | 16
                  linux-6.10.9 | 15
aubio-152d6819b360c2e7b379e... | 13
                    bsdiff-4.3 | 12
              host-rust-1.80.1 | 9 
     linux-5.10.162-cip24-rt10 | 9 
                       unknown | 9 
                  bind-9.18.28 | 6 
          cryptodev-linux-1.13 | 6 
            gettext-gnu-0.22.4 | 5 
                libcurl-8.10.1 | 5 
              libopenssl-3.3.2 | 5 
          linux-5.10.162-cip24 | 5 
               linux-pam-1.6.1 | 5 
android-tools-4.2.2+git2013... | 4 
           at-spi2-core-2.50.0 | 3 
                     file-5.45 | 3 
                 gnuplot-6.0.1 | 3 
           host-doxygen-1.8.18 | 3 
           host-librsvg-2.50.9 | 3 
                libxml2-2.13.3 | 3 
                  ntp-4.2.8p18 | 3 
                 coreutils-9.5 | 2 
                elfutils-0.189 | 2 
                host-go-1.22.7 | 2 
    host-python-greenlet-3.1.1 | 2 
                  libsepol-3.6 | 2 
                    azmq-1.0.3 | 1 
  binutils-arc-2023.09-release | 1 
                    brltty-6.6 | 1 
                  cairo-1.18.0 | 1 
                    chrony-4.4 | 1 
                     crda-4.15 | 1 
             dahdi-linux-3.3.0 | 1 
                directfb-1.7.7 | 1 
                   duma-2.5.21 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
              gcc-final-13.3.0 | 1 
            host-binutils-2.42 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                   httping-2.5 | 1 
                libdrm-2.4.123 | 1 
                  libnss-3.104 | 1 
libubox-75a3b870cace1171faf... | 1 
                  libva-2.22.0 | 1 
                   linux-tools | 1 
                  lvm2-2.03.23 | 1 
                   mimic-1.1.0 | 1 
                    mpir-3.0.0 | 1 
                 openssh-9.8p1 | 1 
            paho-mqtt-c-1.3.13 | 1 
               popperjs-1.16.0 | 1 
               postgresql-16.4 | 1 
                s6-dns-2.3.7.2 | 1 
           sane-backends-1.1.1 | 1 
           uboot-tools-2021.07 | 1 
             util-linux-2.39.3 | 1 
               valgrind-3.23.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/872a1afa0c1e21e0710604d03666b433de964979 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/338d48ae97a408fc776d74c9b9b17cb2e0dd3b8d |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/359fe959b497ffa780ef47d8c56f8dafce2083ae |     
    m68k     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/f7d84fbccf23be6ae962c1348937957a4e552ae9 |     
    arm      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/8aca2bcc0c86a0ee049d50c1dbf394ab137c56db |     
    mips     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/4e1bf08d6b943a87ef88bb32083bfd9323bc39de |     
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/da4529aab24fa4d918a95c34715f9b58f48662e6 |     
   sh4eb     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/3f9418f6dbf67752dbb3429b3afff7f062f56140 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/e75f1b853047031ba115b72247d61a15fb05671f |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/585a2afd2271980468d4a88dc45d2912887eb7de |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/05671c5ddda0aed0613f1c5a951e872800f05cfb |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/cb2b63fbaaead9f447ca0f96be111ec38d93a728 |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/1253a86928686d555b94c6b1a3ee2a0612aa1fdc |     
  powerpc    | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/c2f995baf92338de91e3c8eca1dd47429d9da502 |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/fadc7daf2548671bf8e22f873d7d7f2e08f034ab |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/e1e9b2246cb29956ebbabd2f69a142efa97699a4 |     
 microblaze  | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/192c21df9387e4435966cc9ffcaa2e3b9c3cbc3f |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/e36551b94666e1dc15f9a7b7c308e9ea3fd1c6ad |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/0402d7f7874f84e4355a49bbf26a5246f94ca07e |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/ad043aaac82c281ee0a4133d5eca9286a21e83e7 |     
   mips64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/ee92f1a9bdd41b6ea616723a4221abaa600348fc |     
   nios2     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/1a1293b46a6905898f042a6d0ec3f855193ab8f4 | ORPH
  riscv64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/aa14905bf1346e853bc6d7316db11d55761464b7 | ORPH
microblazeel |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/9f1414034ba41573b4eb128e8a2eb825eed8059e | ORPH
   mips64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/a8c3ca87fa6ef29d99289f02505b65f7860425e7 | ORPH
    or1k     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/25fad94aa239a9f2a4fbb965a1369485b00a098d | ORPH
  riscv64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/791dd79128123409ffeec80cca9a94a6e55708fc | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/db8ee6bd0b3cb6c65f8345973e4227b9e7e96042 |     
   mipsel    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/da1828001721e3f755f9ad35ba5e1f35c5bd662a |     
microblazeel |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/5cb0d672483b237ff4dcde2c9b91505e8383c7be |     
microblazeel |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/69c908dbf2dbbcc579b4d1567a801a5c4ccab288 |     
   mips64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/2985655fbfb7b64737dd13f9553d8791e654ddb5 |     
    i686     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/0cdb44043f769f428c23a8646a8f5fe3e3e87be6 |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/d8fc795e8546abd95d9f32fc070b1f63da0c58aa |     
    or1k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/7e74ca7d7a8dbf6dc954c285838455a4a066d78e |     
   arceb     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/db324adf5fa0d23cd59dfec561d94aacbeb88ca9 |     
    arc      |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/115b6899f571448c0c60eb8c766166eb9e0e2732 |     
 powerpc64   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/730310de50273c503eca42e03c7ff263a3cc12b5 |     
  sparc64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/4a294199ee2be6ed419e52f1eacaf87d6d02d831 |     
   x86_64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/6f3a1dbd722286ae6a9e826ea21e9ca57d258ff3 |     
  riscv32    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/d8118831131730e749a8dd6da3ca48fe274a6cde |     
   sh4eb     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/08e86ba8bcaa49be8658cd76cf4bac53a90ecadd |     
   x86_64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/e68422367bae6a45405ab3d197ef60f9024a4b30 |     
powerpc64le  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/283b9e9f1596de1f1b396e559b5d0019f4a364db |     
   mips64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/38725c60c7cae16a08bfbda499830a05169bbb7d |     
   x86_64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/11e282911c09dd6b2d4fdb54ab3040332c5e13dc |     
    arc      |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/5a545f6a27809f718ed4bf84900535183de3b037 |     
   sparc     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/5ed9b5b1b64a8171a89ac52e1fca6e4b94b2683c | ORPH
    arm      |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/4bce235c9704f359dc1583ddca5dd952a149cbe6 | ORPH
 powerpc64   |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/53739ab55488b019d0c50d4f3198ad9cc170d11e | ORPH
  sparc64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/44c2ddbbdf2c950cd58088ef8a3f76060ea9a108 | ORPH
    sh4a     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/1494cad65d96424d511a46202e470c4604843d79 | ORPH
 powerpc64   |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/9ac95735f7644be84f9ebb3bb41f1cf6c5921dd1 | ORPH
   s390x     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/e4b96754d4408485ab5962e9e61bfbed6d2ae898 | ORPH
powerpc64le  |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/4476e3bc3a37a0d356d50fd708dffedf6e9fb678 | ORPH
   sh4eb     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/89a9989e16fce8edb392f2e9c47599ca496ade8b | ORPH
  powerpc    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/2cf5282aa10f15c5684125b91492ffcda01693a4 | ORPH
   mipsel    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/70e98c6c248b3925888ceb831138c5d11c42256f | ORPH
    mips     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/84702ae7b06ceeff10083115a10422b332fde44f | ORPH
 powerpc64   |          cairo-1.18.0          | NOK | https://autobuild.buildroot.org/results/2caebfe567ec2388f055520a026f5255221408f3 |     
   s390x     |           chrony-4.4           | NOK | https://autobuild.buildroot.org/results/9747ddda85b0a7514f9c95d36b6c9a7e3cef0036 | ORPH
   x86_64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/841c121b00f89a2377abcf116f455bbf3028be34 | ORPH
   mipsel    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/20226d619fa6b543512505dd3ef673d33e853b12 | ORPH
    sh4a     |           crda-4.15            | NOK | https://autobuild.buildroot.org/results/ced0e27d8e810db0aa4dabd1726b6bdd7da621cd | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/c0d1c51a94edb2b2db7b8d6797b40a478b9b974c | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/b61a9f7346cbac8361e2e3725f41b1582af1a190 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/89230f8ef0774c8327c003d53d25a4270cca4124 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/5dc835371a84cf5654e104b350b188b921b14e96 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/ac6968635fcbe8ceea20e8e4d5d4203df9d1cb9b | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/e2903ad606052cc8c2c8d838c04de684bbbfce6f | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0c880c6c58e37605ccf0e073e3d9ca1c2c90c9c5 |     
   mips64    |         directfb-1.7.7         | NOK | https://autobuild.buildroot.org/results/f53d7ad4b1f9d38dfe35bb219081890a44f0989e | ORPH
  sparc64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/083feaf9d8d9cfc48ecc7cd7ae8528b6bfb7acc5 | ORPH
microblazeel |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/bfedd997e4fdbe08ea8ad3ebf2158a4b926e137f | ORPH
 microblaze  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/c41f9a7d8f09327c04d45483741765fd752ee332 | ORPH
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f8aa5dafb35a8797ddb84e8c760e2c02d88eb2af |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/c0f7ab6e3fdb4ecf3d4edc3461ff593d6572e15e | ORPH
   mipsel    |           file-5.45            | NOK | https://autobuild.buildroot.org/results/8003da399259f6ac51e2ea3b03d60316fa249106 | ORPH
   armeb     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/82b2d7f0a005db14d96f042d0a759d08e53eb93a | ORPH
    mips     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/2cdaaa838f6cc7e466f4d1945dada6ef926932f4 | ORPH
  powerpc    |        gcc-final-13.3.0        | NOK | https://autobuild.buildroot.org/results/16e147f5e83bfd87e9e0716047c1360abca6b140 |     
   arceb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/2217181ef8c4e8b154433eabfa7444625aa7568d | ORPH
   armeb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/d0a79ab4336d316977dbcb8d506faa85e5bcd731 | ORPH
   xtensa    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/86845f81dd08b8d722365df1bf52372950de8dad | ORPH
   arceb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/8d1d0342da4a5b7ff29f30f4a855dca58cacd882 | ORPH
   xtensa    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/acc3641ba1715cedaa139ec287c64c5ce6fc19a6 | ORPH
  mips64el   |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/439fbc7ec652764ecec430d70d17ba6478fa077a |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/2f9784903bbe028f7f79f00423917850d42b6edc |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/3903de9acedb58fc748cccb468a287252d50b63a |     
powerpc64le  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/fc76525b1a0ed1eeca346affbe7259a31c48dbf4 |     
 powerpc64   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/6e9c56b03b947e4e69a76523748458181918950d | ORPH
  powerpc    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/a2e228bf6cd8359cda059892d084154179222d85 | ORPH
   sparc     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/a42223dc3904a99dd490b97c02b70e6c1b8e673d | ORPH
    or1k     |         host-go-1.22.7         | NOK | https://autobuild.buildroot.org/results/3dfc68bf2b2a0263c1e7500f79e9e5a750550652 |     
    arm      |         host-go-1.22.7         | NOK | https://autobuild.buildroot.org/results/1750abd412c95ebc3842c00eb1fc1fd367e6613c |     
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b5e982519bfe15a938d115aa53955687741a7a45 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4568acb1c75bf3f1bd95c3e10ca1095f07f660c4 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6f99bb8388ac241f8776c87ad350e618cbaaf837 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/df55baa52134027a9ca0fd0f02d9ed68a8e53ff3 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6e7b8a308414844959052c7602568de48ff760f8 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/801ee30dfaf2a396b5d9557196f575bdd574364b | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b64802aa3bb9ccbb8504d63de6407e58e2ea54d8 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cd5c6b7b221089d0780d3c8a0b96e7eafe95e2b4 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a5fd2943efb760bf1607a51611031df72dffb5ce | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cdf982b7a144844d46f6bceed00a5b738a8e40c2 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2a39f0d8510ab7cea794da7388fa101c50dce443 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9531406ca3c8a5cbe5a9e19e2368aaba659989c7 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ff5eefe5b7883507a6b845bd4c7c0c5f0f09204f | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dc55c802b6c05dd7033bca2bc31252a1d85e305e | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d70abb0aa888145341d66d77157db348aa67d0fe | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fd6f1b5dac505083972e03e5c7f0299ad8d5e505 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b1479870426312bdf53b8da5073793e8f693ddab | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/060cdf4119e6339da1228eddd3d04e6d8b9093c0 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7767123560ea28d39c62911f19bfac2b47c3804a | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e97cc55c51a31efb1a4c9e046980e1ed9a3e2d8b | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/84a929e2848bd3ae57dd4ab697ca94f7919a190c | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/902cb3ea9e4b1cacc8d84b1603948ad8cb06bba2 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b0dac4bc6ddd27e18e209b28d114e36096f1bba0 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/283430c9c706aae6bfca783cfb3b343a26d10a83 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dff5f4747e57e280526282eaa5bf74e06f6a12ff | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/79351e4aa4809b25bd7db62ff670a767ebeb5d0f | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4d19c66b6db9cc41064fda8c59d7bc66c0de9024 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d6dbd1f56987ce122e9023a1affc6594ab23b4a5 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7e31865938e58241432080a34c98a016959459d3 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/93359368b710ae317a3550743a963b2422f1452d | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f41bf1d7b218a2520077b12afb115846ca5fc594 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b49f4862ba38111de8543c03c6424614e4c98369 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5fff556813b42d2b5a60d27dd1979b7a696da14c | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f55202e7f279d7076c956d4c0b1e9c4a0729a584 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2e1cf83e216f82dcbeca6cecbdd1fac9cc5ea596 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9939ab084cbc95426b91f09cc32b33635b454ab1 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8e7afe5105089d78eeaf13e4d9a0b961e556e850 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/be739fdd247f52a47cda718ea09dbecc3ea4a248 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/75b63cd21fcba0416f2487da21b46215725752dd | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8b73457cc0cea4b7bb21edae03f018f0ee6f8ab9 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f3aba4876fb850e45e8d3f01a49690cc7729194c | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8febe8215218883fe5841d058f8728f1ca4bcebf | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/274cd4a660fd2cf8869c7c4eb3a839c3361f7675 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2520a6b005a54fd6015db875a0418e2d98cf18e0 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f91ca73e5fc0cb19f04d526d80c60c7d7d5efd55 | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/6059a47ebc46c40ac6dd051bc72052685be20bd8 | ORPH
   mipsel    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/5aceb816d73c554700da3000cbeeb2ea6b243f63 |     
 aarch64_be  |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/8c9894698f7756df01bb25aea3d470bb83c3c405 |     
   nios2     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/3d6077ada4676f013e2bf887321581c91b2e6e45 |     
    mips     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/854bf059932788511f5d1dedfdc26202384361e5 |     
  riscv64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9ace2af77e60661e6606c429431e47755116d6ea |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/0b70d0223abb661e0d17a1e015584f08512d7d55 |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/7ce583949f087eb1fd2dcad2244685efd27e1cdd |     
   armeb     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/b5e3ddb835e48627b0c1c958d5f5c4d92bef3bb6 |     
   x86_64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/19adb55ea5380460710f39cc1fcdb88eaee4f790 |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/ab83b06825a432b85662518624b1ceecba0088e4 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/58aed1f8bac19ac89cbafea73027c209ecb454f8 |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/a111afb4f2db030094b5b37dd24772bdfc793f38 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/0a4bbc2c3c272f5d8589e614ee2eb492b258d3e7 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/f9cc89f1ae170b8cf21eb3db605da3c8c58968bc |     
    arm      |          httping-2.5           | NOK | https://autobuild.buildroot.org/results/a9f96a9771f716bae59e971a56ebe28b74b0636d |     
    or1k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/117e4eea374ddd30794a597fa2a5be494c013ff6 |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/d36c0d863df790b047ae59d6ea87fb4a3afbf6ca |     
powerpc64le  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/2d553687a32651f81813c82d7bbf9bb11fd3eca5 |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/5ed7c462b2e6516712e6584994eefb0c209b74e8 |     
    m68k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/466094d05ded9a3235b97ea5dce48fbb4081eef8 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/76239c4e931f4bc07d686caa801b862740a3c6e9 |     
    mips     |          libnss-3.104          | NOK | https://autobuild.buildroot.org/results/f1091733d479bb8b575f50a3f1490dcb1f4390c2 |     
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/da28405db3a9b5d92fa9e75402a1530664a51ecf | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/7ec53e370eac4e2bfabfa9596c44b63380a1e941 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/f71f70e7c5a1a25db71263288f8effa9776f92fc | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/489bd11a18f1bdf3a47ee0472dc23bb70de57dba | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/9b109a3533e3d3bba2ca9899c4f4e747ee2cd6a4 | ORPH
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/10a8c49c65d10ab12781842a279b8104b6536f0b |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/a91df9a7f9a7cef34f70cacb5cc828cbd4623ba6 |     
  mips64el   | libubox-75a3b870cace1171faf... | NOK | https://autobuild.buildroot.org/results/03e9f81bac52a08918b1781273919507ce21896a |     
   mipsel    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/8e27472f76bc769e3cc88e5aa9ff892a4535569b |     
   sparc     |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/72dc779dd60748b55f1738f552a3e0828deb642b |     
  riscv64    |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/e79ce19bf624189de0e6740031134b794e218efe |     
   sparc     |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/2b25c3084d47f16c6595e7de8b0652ded36c8f38 |     
   arceb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e9a99fe902a60bfadddaaba301cf83c804733ec9 | ORPH
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/01a6ad25d6675bc0f31a0ce79986242ca89c6e00 | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e6c0a82a50fb8b791b5c6467dcf047781a50a730 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/4313cdadfaff00c9d3ffd8babf33637d6b50ed5e | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/5ec19517c3aed77b63f0709c8604620b5660866b | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/3d67bffc00dbc0df2fe0009c6d7edf11533af065 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/46acab0230940b7c935d17cfbbb553c0a96546a3 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e1e85dbb874e801bcb63e2304f161861fe622c4c | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/8e70a92ef1e7d3f466838ad3ed655eefad64339c | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6330b4a257164af2900d3ca23dd6869cada21a01 | ORPH
  sparc64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/c4a71e16bb1739551da2c07ca9771ea5dba058b8 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/02eb496034e56e5498c8c74aba1f0a7eee0af4a0 | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/879ffe8c4aaa46ed8972731e9a022a4d44bdf681 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f156be4b546f3075590ec2b46efb3f3b61203378 | ORPH
    sh4a     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/c7a5d714644d81463494d7848330bf3dba9fdc3a | ORPH
  mips64el   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/43984136f9875ca6181f4592b105f9f9a4340425 | ORPH
   mips64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/de18c667a4213f93eae1f1d9f7669e9331ae0a0f | ORPH
   sh4aeb    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/3fcfdf07555f7c172de3993fd278f958dd78003c | ORPH
   arceb     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/b6b290a3795f29f0fbf5cc000c90c851b535759c | ORPH
   mips64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/ef973a31fdafe8bb79cfa4df4f3f07ecff335649 | ORPH
   arceb     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/58d7365769e6584c2e51bef149a5a1671c3d5b14 | ORPH
   mipsel    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/b27acd8393e34fbbac92202beb4c0de5323cde1b | ORPH
   sparc     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/7dd785c28189a7ce6750b16cc624a75f12a50131 | ORPH
    mips     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/80b12d3da4c8414230ac3c0b9e565f6bfc255a15 | ORPH
   mipsel    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/1311727487588fdce18922c57a6171ccce72a8cb | ORPH
    arc      |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/aeb38047737d5ec5d75b15330c8e3fa25d9fb6f5 | ORPH
  mips64el   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/89c7987f11c5d662676792aead84c6ee7ba39172 | ORPH
   nios2     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/442c5f5cc5b7d3976a9a07a901d9e12a8c5a7ceb | ORPH
 powerpc64   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/8b9d956d8a986511b580461cef614ac37e25f542 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/78057945d72ddb270b51e52eb4d9840979335d84 | ORPH
    or1k     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/fb4540e8e9d8a686c82d0e907459166687872729 | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/a47f28e5e2e141f3dbe4a9f8b85cb7e316bbbe4d | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/b8727cf37beba4812d712ff02cee96810c0b98c9 | ORPH
  riscv64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/346c4f71d56eaf718e7bbb63c9c4f89db3c9b300 | ORPH
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/dbe916220d3b61063e3f99659e9cea4fa8fe6f64 | ORPH
    m68k     |          lvm2-2.03.23          | NOK | https://autobuild.buildroot.org/results/f292303f0f582d0a7ce1acece9848b83b09e9490 | ORPH
   armeb     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/1987502c9a21551fb9230fc5bd39ac886f73cd21 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/79fd783158842de7c7cfd50b69c0ca088f35303f |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ec5a0be6739ed57a6fcb704a80f0e41f7a98695b |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ed23d4df5480d27ea644b9c180927f3f0682c1cc |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5e41b2a50772b961eddfaacea29175a815335469 |     
   mips64    |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/dc8bdbf649ecb54756fbb1b63eff4d3c2af1ccb4 | ORPH
   armeb     |       paho-mqtt-c-1.3.13       | NOK | https://autobuild.buildroot.org/results/f52bf2dcafe00406d9e272ecaa72b098f4b59ccf |     
  aarch64    |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/c78e30990f6cf904197f89c03f2f437b1b49bee1 | ORPH
   xtensa    |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/7dee83033afac55d4448760b1ecb66f5f9cc31c1 |     
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f3ee80919eb2ebb9fd08ac2ef17955c783e94545 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d32c3e3ad86441c49c4c8451bfbbada64bbd7cb0 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/16c0d3775071f6d1097ebeecab05919d4b92bbb4 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f6506cfcf4a6c392bf45249f8ac89e9bdce32a06 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/2e75c38a0f46aaa8cd1cd74623bf15d6de0e9073 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/dc7f3442866e23a4cfb940d9173c805511b8285a | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5b727256586d068f08326b244dfe3b98ec4a1171 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e0314efe875624b6503d8f65f65ece38ceba18c5 | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0729778d8db587d9cf51c4d920bf4f56045058c2 | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e0b9df8843eec80dd23d2f57f5f59cb076e8855f | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/4b2a5ff26a4f9fc9251879ce862e7ec9afc5634b | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f41ef08d3af8090cd7a5fd3ae37da2c654f1031b | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/383cdc1f71f5caafe4caaa677d556b0547d69de9 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/619941dbef8c00ae19ba546849fd8ec0e65048df | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/30af7ad09b86b3b2057410fe2c64820cb3702b32 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7d2751b611d73828285e1e1f3d3b6c6efb3cb2df | ORPH
   sparc     |         s6-dns-2.3.7.2         | NOK | https://autobuild.buildroot.org/results/c7d387128900a30cb081940d76e63339c6adc4ac |     
   sh4eb     |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/512a1ffd93daa62f6c55acadce27d29d3c6efea4 |     
  powerpc    |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/2ded82ab12e10052e54d1132cb6baf1638948be0 | ORPH
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/f08311b407871a9dc037092831c3940e2cf11909 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/aa2e79b000d3fd29b01b031692c7860e74f782d7 |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/0175dbafadd7fccec5004e36c54c43967371ea10 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6e6fb99fa3e86d1d8035fabd1fd513edcdfb349e |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/04e636f7e14e6fdc84eff326507acf716f59b64d |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/792392aa09e0f67335d75a9b266fc1055aec55ac |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/61b905d024199c60f1c465ce6cc9a82848d430d1 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/5748ac0e713cecf7ce81419bbae409c42f5c954d |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/c9fed7f88cd8a0186e7cb6b38fcb9f96f4f1aafe |     
   arceb     |       util-linux-2.39.3        | NOK | https://autobuild.buildroot.org/results/e3ac38e2fae07a7eb12a6e0cb022f652b4146eb8 | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/c7bcd9fe4f52805bcb5fd3e8a70c194abf077690 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

             host-ccache-4.8.2 | 1 
          linux-5.10.162-cip24 | 1 
                   lsuio-0.2.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |       host-ccache-4.8.2        | NOK | https://autobuild.buildroot.org/results/01842a026259d9367aadc5d76cd53555bfffe5a6 | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6252822cf6b044299d055d77be13c0d025b65a71 | ORPH
 aarch64_be  |          lsuio-0.2.0           | NOK | https://autobuild.buildroot.org/results/0ab0ef5f2c22dbf823aa467cdb03e4b5310e34b7 | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

               procps-ng-4.0.4 | 4 
glibc-2.39-74-g198632a05f6c... | 2 
  gobject-introspection-1.76.1 | 2 
                  linux-6.8.12 | 2 
android-tools-4.2.2+git2013... | 1 
                 apache-2.4.62 | 1 
             berkeleydb-5.3.28 | 1 
                   cvs-1.12.13 | 1 
                  dhcpdump-1.8 | 1 
         docker-compose-2.27.1 | 1 
                    fcft-3.1.6 | 1 
                freerdp-2.11.7 | 1 
fs/f2fs/f2fs.mk:64: /home/b... | 1 
host-go-bootstrap-stage2-1.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
                libmad-0.15.1b | 1 
                 libp11-0.4.12 | 1 
                  libsepol-3.6 | 1 
          linux-5.10.162-cip24 | 1 
                 logsurfer-1.8 | 1 
                    ncmpc-0.49 | 1 
            nodejs-src-20.15.1 | 1 
                rocksdb-6.20.3 | 1 
              skalibs-2.12.0.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/44bc239e979f0a26489853c05a3c32a48ed63a93 |     
   mipsel    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/c18b28b02cd08877f9622d9974adb1125880b25a |     
  riscv64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/3b7df31b118313776330443cb8e140d4e4874885 | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/fa1a32d917f5969ec938d61eb8d31f49485543f9 | ORPH
   xtensa    |          dhcpdump-1.8          | NOK | https://autobuild.buildroot.org/results/77a69f0885fc1c0f204f45d427d9f5a9d61b2c76 | ORPH
  riscv64    |     docker-compose-2.27.1      | NOK | https://autobuild.buildroot.org/results/09f95c23e28e6b49a4d97ba2f3aa28cec225efd0 |     
 aarch64_be  |           fcft-3.1.6           | NOK | https://autobuild.buildroot.org/results/6e30c45ffb57d1aa172bb71ca7290b39631a80e5 |     
   armeb     |         freerdp-2.11.7         | NOK | https://autobuild.buildroot.org/results/13955f8ea59608573ae9736ffe248fa521a764dd |     
  sparc64    | fs/f2fs/f2fs.mk:64: /home/b... | NOK | https://autobuild.buildroot.org/results/41398aef740f27ed11a7a538c7fb202c87cb2fa2 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/65cf360e40eba6fa01d450cca879937b2c098ad2 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/7533c12100465bc36987a00539a939e9a1ca9d72 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/78c513ba33104074347cd891070f4aa77387884b | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/5708b452aeb42218efbaa5bbcd16530dbd0adb8f | ORPH
 microblaze  | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/6245fd374ffd5ddf1a793ea258fffd3885f01f98 |     
    i686     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/2d09266e994dcdc2903b08271e8c57b8cfae728d | ORPH
    arm      |         libmad-0.15.1b         | NOK | https://autobuild.buildroot.org/results/c49387498426917ab716b35574a5e993d6138897 | ORPH
   x86_64    |         libp11-0.4.12          | NOK | https://autobuild.buildroot.org/results/443b084c3f7a4aba273573e5c8b7ab77b641e4d4 | ORPH
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/49b307ae413ee8aff1a0304b38ed8d68ceffeb62 |     
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/8fde71ed57087d986c4f27eb799ed1fe33eedc28 | ORPH
 powerpc64   |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/cc3b991e2d716b817e5439abb4309800f783ddfe | ORPH
   sparc     |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/04a64a5ee3c5e95efeefd8279e571619054e7d6d | ORPH
  sparc64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/ed45a19bcb9b1fed1e85ef584e90621b1c1f1800 |     
    arm      |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/3ba35199821b050fbccb6c1aeb4b46a7d0e1ef45 |     
   x86_64    |       nodejs-src-20.15.1       | NOK | https://autobuild.buildroot.org/results/a148b76346a38214e52653d94a8048a75c1b61c8 |     
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f7378ab1615517e7f2aeeae6ae7a1b7ade451d38 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/183ee2dd17ef906d1f530c451c0906c82a27a98e | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0c0a7aa64984af6f7cac97d1ba72a8e4cc73b356 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/58dbefbb4c9b8381e7ab82174ddb1ef6d819bfe4 | ORPH
   x86_64    |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/68e66e7dad13e2be466c9b0e5b6c668ae3866d8b |     
  sparc64    |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/222048893480d461ec70e58bac0e9d5916ae3f66 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                    dust-0.9.0 | 1 
                      gdb-14.2 | 1 
            host-binutils-2.42 | 1 
             parsec-tool-0.7.0 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/35337bf2091b65c27a30c5865d70ecfdb211eb74 | ORPH
    mips     |            gdb-14.2            | NOK | https://autobuild.buildroot.org/results/246b5df5cc0d0b21c811d0f925854ef296d2899b | ORPH
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b0e90d37b79c2315246319e3ea4a626d44de603b |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/1d0fad151b4ee48fee040335064b9e5ffdea3387 |     


Gitlab CI results for 2024-09-23
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888799779  | ORPH 
           TestExfatProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800354  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888801305  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888801307  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888801431  | ORPH 
    TestFirewalldSysVInit | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800363  | ORPH 
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800364  | ORPH 
             TestGnuradio | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800399  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800410  | ORPH 
            TestJailhouse | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800437  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800561  | ORPH 
                 TestNmap | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800610  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800631  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800636  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800671  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800782  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800733  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800746  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800753  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800800  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800820  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888799847  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800837  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800917  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
