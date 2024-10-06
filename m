Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F9CCFB422
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 03:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E88F460699;
	Sun,  6 Oct 2024 03:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBq7B9zN812F; Sun,  6 Oct 2024 03:17:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94C70606D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94C70606D5;
	Sun,  6 Oct 2024 03:17:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99BB31BF5A0
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 03:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DE7B40160
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 03:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m6OR_N3qmoiY for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 03:17:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 53B1040143
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53B1040143
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53B1040143
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 03:17:48 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a99388e3009so125749066b.3
 for <buildroot@buildroot.org>; Sat, 05 Oct 2024 20:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728184666; x=1728789466;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wm5GdPFsA6FMFW8QdrW0LkJBKOo1LmpYE5jnBg4sk5k=;
 b=sgVB4j7DKLdlhU9sYAs9/wi17IuDr7NUW+xSbnIishI6TVPkofEEFSL0j7sUwa/U5C
 0ibd1YZ/IlqA4aOwVdfhEq3j2q/WGAeaPnwEXYAph4LhLbtEEohDwvGKyqf1WebuoKRb
 kPKavy28KgzeDxPaGuWmDWJ5Hryo2Z32/EiOS6lj61hK5hpGokPTV0pTXP0+seDoFrhL
 3CQTHHflmDm3D72X4y6W8CdgOuD3mCUycw6v/u0MEe7Fumncx7Ceh1tIu2AQKn9GuRE4
 qwK9laQ+BMLX5C2pY1R5wW20w1IoEBN4j0sduufC1JV9RR6L/qvdxywcG14OYn0DhHiu
 tpCQ==
X-Gm-Message-State: AOJu0Yx7mSVENOByWTsXQ1xPDwf/3oLl0fRkCoRgNjCYvppid2UL6+jn
 4KfJc2jL3C1WbKhjjHHe4qmrJbA7Pbt47IIyktZaGjU21yz2/FKGPspaQA==
X-Google-Smtp-Source: AGHT+IG5zkpXzuiOZ3Y7plosHHN2FpYBs2t1zL1K4IGML1GDjHK/hD5FHA6bEscKNLiTd5ySnheqXA==
X-Received: by 2002:a17:907:70a:b0:a86:7ba9:b061 with SMTP id
 a640c23a62f3a-a991c02397amr818699866b.64.1728184665562; 
 Sat, 05 Oct 2024 20:17:45 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e5bb23bsm205412866b.34.2024.10.05.20.17.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2024 20:17:45 -0700 (PDT)
Message-ID: <67020159.170a0220.2619db.71c6@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 06 Oct 2024 03:17:45 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728184666; x=1728789466; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Wm5GdPFsA6FMFW8QdrW0LkJBKOo1LmpYE5jnBg4sk5k=;
 b=XYy9Se/Q9Vwt6PZyuGR2Zo7XUjwj9afqA2WkBXgGfAh3ZzFYV0skI59+WhFct7OdUG
 BNU/pkq4rVjFwaRg++w56H+jKzyHoWo8Ss4ncBUWenvTf72Dqh5qZ77HtCs8HQUIQHkf
 CIXLg5DuBW+1Ou4K1lceyGMrVdmPSk5foDUxrhfIIWfk7OjvWnXlb2USdqUqk+VKobwY
 HhHQ5CmuLIGmm+5bws6VAknDZoQ0Xe8gk2QRSY+RxoYI1lOBZtKzPDry4rsIRzLjidun
 iTp+RELBoWqGuSsoIgR3gKS3yP+ZG/63tPhtTAHk6R1GsKnJY91ythx9XMbE2reKJVVJ
 zpWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XYy9Se/Q
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-05
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

Autobuild statistics for 2024-10-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  3  |  0  |  4  |
  2024.05.x  | 15  | 33  |  0  | 48  |
  2024.08.x  |  4  |  4  |  0  |  8  |
    master   | 22  | 408 |  0  | 430 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 83
             bluez5_utils-5.78 | 42
                libcurl-8.10.1 | 30
                 linux-6.10.10 | 21
                 apache-2.4.62 | 12
                  bind-9.18.28 | 12
               procps-ng-4.0.4 | 11
                  libsepol-3.6 | 8 
                  ntp-4.2.8p18 | 7 
                 gnuplot-6.0.1 | 6 
            host-binutils-2.42 | 6 
           host-checksec-2.7.1 | 6 
                 coreutils-9.5 | 5 
         host-libxcrypt-4.4.36 | 5 
              libopenssl-3.3.2 | 5 
          linux-5.10.162-cip24 | 5 
               linux-pam-1.6.1 | 5 
                 pixman-0.42.2 | 5 
                       unknown | 5 
               valgrind-3.23.0 | 5 
                elfutils-0.189 | 4 
                  evilwm-1.4.3 | 4 
     linux-5.10.162-cip24-rt10 | 4 
android-tools-4.2.2+git2013... | 3 
           at-spi2-core-2.50.0 | 3 
                    bsdiff-4.3 | 3 
                  ffmpeg-6.1.2 | 3 
           host-librsvg-2.50.9 | 3 
    host-python-greenlet-3.1.1 | 3 
              host-rust-1.80.1 | 3 
                 openssh-9.8p1 | 3 
               popperjs-1.16.0 | 3 
                  ramsmp-3.5.0 | 3 
             batman-adv-2024.2 | 2 
                   bird-2.15.1 | 2 
             bubblewrap-0.10.0 | 2 
            gettext-gnu-0.22.4 | 2 
glibc-2.40-18-g564178076272... | 2 
          host-binutils-2.43.1 | 2 
 host-binutils-bare-metal-2.42 | 2 
   host-mender-artifact-3.11.2 | 2 
                  libva-2.22.0 | 2 
              luabitop-1.0.2-1 | 2 
               mariadb-10.11.6 | 2 
                memtest86-6.20 | 2 
          obsidian-cursors-1.0 | 2 
                   pcre2-10.43 | 2 
               postgresql-16.4 | 2 
      python-autocommand-2.2.2 | 2 
                 rtptools-1.22 | 2 
           uboot-tools-2021.07 | 2 
                acpitool-0.5.1 | 1 
                 agentpp-4.6.1 | 1 
                  assimp-5.3.1 | 1 
                    azmq-1.0.3 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                   botan-3.5.0 | 1 
                  cairo-1.18.2 | 1 
check-11970a7e112dfe243a2e6... | 1 
          cloudflared-2024.6.1 | 1 
             dahdi-linux-3.3.0 | 1 
             docker-cli-27.0.3 | 1 
                   duma-2.5.21 | 1 
               ebtables-2.0.11 | 1 
                     file-5.45 | 1 
              fluent-bit-3.1.3 | 1 
                   foot-1.16.2 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
            gnuradio-3.10.11.0 | 1 
               gocryptfs-2.3.2 | 1 
               graphene-1.10.8 | 1 
                 hddtemp-0.4.3 | 1 
            host-ccache-4.10.2 | 1 
                  jack2-1.9.22 | 1 
                jemalloc-5.3.0 | 1 
               libcap-ng-0.8.5 | 1 
               libglib2-2.76.1 | 1 
                liblinear-2.45 | 1 
                   libnl-3.9.0 | 1 
            libsvg-cairo-0.1.6 | 1 
            linux-fusion-9.0.3 | 1 
                lmbench-3.0-a9 | 1 
                    mpir-3.0.0 | 1 
                  mupdf-1.23.9 | 1 
                netdata-1.33.1 | 1 
            netstat-nat-1.4.10 | 1 
               openblas-0.3.28 | 1 
             parsec-tool-0.7.0 | 1 
                pipewire-1.2.2 | 1 
                  quagga-1.2.4 | 1 
                    ruby-3.3.4 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                tpm2-tss-3.2.2 | 1 
             util-linux-2.39.3 | 1 
wilc-driver-linux4microchip... | 1 
                 zlib-ng-2.1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/78f3369a987c921b4e24752e01cbfea621fcdc01 |     
   mipsel    |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/4ee8101375859f162836369c9218b28e6db8eee8 |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/f29d6cc57d795857834f1611c58c3b2a8ff05c0a |     
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/f41f9fbe851187b4c1d2ac25aa78fdb8164eba81 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/e1c289de5b5b0e01862b7e880bed1c1fbf31fdf7 |     
    arc      |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/0c2d5a8be613c473a5cc8954fb1ca88f42c54191 |     
    m68k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/ce461b0a98e3f0a429fd952c82aa0bed00afcb64 |     
  mips64el   |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/cf47355b32f982c89a36f40360576a32c0666e47 |     
    i686     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/5d20695e513abcacec42f2db29c29c9c1665f523 |     
   s390x     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/c29fba5a26cf895c553f74d11544954189800043 |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/562c14be23dd386b57788834048d2c4d346003d4 |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/3513e2bdd4c8594fbe33ada79b1f9af5e564c0de |     
    or1k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/5af1b4bb341e4bb3a047cb9e07d786f483ba04b7 |     
   mips64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/17e5724d8713835ebb6aa9a20c450d123d70c0ae |     
   mips64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/6356970fba4fd0acd457b4e3a7da8b47691617d1 |     
   nios2     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/55950e18885281122baa08160d61ca3e9ae88626 |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/d499140a15393a37c0568502d205a14fd278589e |     
    mips     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/94e71ffebae0badad5b5e35f29423e5a0756bf2e | ORPH
   mips64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/4599ec333f1bb615648e214b4d586617bc77c779 |     
   mips64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/ab4c7969003208bb8e35891b776008de7262df6c |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/015043cf0bc34aeb506d00b0ae85a51e18d396d4 |     
    i686     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/ba93053f6d616a011356c362c037c852e1e5f213 |     
    mips     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/f20f047c4d9bbfc851f800f03b176ab5b6371138 |     
   mipsel    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/28bfe74ccd9d3c10d9fbece982a36f33893c592e |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/0ebe74386fe38b034379f0dd47c8d968dd7029fe |     
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/b42150460b6d16329f13a3ffe8408ac719e32c91 | ORPH
   armeb     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/19b16c6970795aab29c1b02b2951d1fa528a36ce | ORPH
    arm      |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/18dabd4b97eae58b27172e19d06258ce0bcdb3bf | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/d0d39febc3631a0b79db02161c818ffdb179613b | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/520277cf52fe310bed66a2dbe8b338e115ed975a | ORPH
  sparc64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/0e335adeb3ffbcca22dd3cb717542dd6fd697d0f | ORPH
  sparc64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/2ed8c6a2d47aa1fd2d837a5d71963ca38a84dc5c | ORPH
   mips64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/4a6e1656cc8af7eeabd0852844edce07734a41cf | ORPH
    arc      |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/f6524348bbe2b248e22f237c0ea62537420ffdc9 | ORPH
   mips64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/ef23bba6d5e7a525ee25ebfd092ffc85ac6e327d | ORPH
   mips64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/0413cb70f16637a94bc223237c583c9cc61eda10 | ORPH
    sh4a     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/2a97b2af7f94dfd3eaca4dabeac8fd19361e0da2 | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/dc452577a0ffb89023747f8cec1558e50309f170 | ORPH
   mips64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/42a7799c30db1ff81ee9709ef671816a2a9d3464 |     
   arceb     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/7e909c587985210f5d9857545b66cf9199d6ecb7 |     
 microblaze  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/34ab90a930e1ad9e6c9467b8ab1653d90a43a89f |     
 microblaze  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/dc8fabdfaa1be22a6c31aec0acee05d50cebb115 |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/0d819ccc2a35a7a3366218763399c111cce7ccef |     
   x86_64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/4c41ea766d17a082aaa3fd8622d9e92c80e1afa4 |     
   nios2     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/0318c6419ee94d7995d7416342517e14905ddd02 |     
    i686     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/e679f81a50bc11bc761a69666cbebd039ee6a9e9 |     
    mips     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/1bd10a15b4558db43fa2beac413ae3c0d21d9366 |     
   mips64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/1784cfe7628eb78a718dc472a86b2c4b27040ce8 |     
powerpc64le  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/c830c6d5d2083c30a3a7b8b36193d13f7787549b |     
    arc      |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/0b4191afcfe08420566126c73e81cc6da1a034f1 |     
    or1k     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/d92fa051dae784193410928ead6912f5e48b9e41 |     
microblazeel |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/a152939ba77ad040c7b3d0249575918b0c93e7f3 |     
    or1k     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/a3560a137c923d7439944530e12f44245e6594fd |     
    m68k     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/eee8823ff8eff000fa5fc47ac90ad6fbdea04209 |     
  mips64el   |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/7b057e51c9f7575ece34a9431ba4092232170237 |     
  mips64el   |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/56d48ece35fcf64ac4a9bf9ea35dd23585a4f045 |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/e17afcda28f48f279ebe5448e403670a9ec7f1e3 |     
powerpc64le  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/2588e809821182d59123d599dbe5f47b4a8e83ff |     
 powerpc64   |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/30c5821a3badf9bd9f4c7921a77d861734403583 |     
powerpc64le  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/5a6af6aa1c85f147466b2dd1504086a154084417 |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/885b027358c7d7d340bb6be4b5820ca4c49fbd2f |     
  mips64el   |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/d31524dcb80b49d919774602d0137974ddb7a5bb |     
   x86_64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/48d88d9998c24cfd87a7ee32372c05b48da5bf18 |     
    m68k     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/4a08e5d830c52e3ba681345ab2bf04099fa7b513 |     
    or1k     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/5fd2f5a1ba68bf4f63f5db44729f42dab53c905f |     
powerpc64le  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/097adfcfe7da4f54508a622ae18c29d0af91601f |     
   nios2     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/afe99f31e2657427bd0a1cf79757d0f62fa06f67 |     
   mips64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/6175db00fff9e129d91cc911bd8e9b1f3ac5258a |     
  sparc64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/1552b50409b9d7088a7040d5054e00a33192cfcd |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/74e1fdbc249f0f5dc7ab987930eae2f6f13a5c46 |     
   x86_64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/dd2a714e67331e9755db443b149aeda944ae4112 |     
    arc      |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/c36a36b7a32d9ae171f93363c36e33fd31c8dca5 |     
powerpc64le  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/83e6d25f4e191d2e6f0ab2c7581991fbdf01db2f |     
powerpc64le  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/f92992e6873bcb2524f872649551b0e9fe19e118 |     
   nios2     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/7a47e16511aa5efb02b4ef4c8c475d304585f72e |     
   mipsel    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/3c4aa7e632413c589703c85598dff51f23565600 |     
    m68k     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/5e507131e28c5a1fe28b5dca95b3d8ae85c7c8de |     
    arm      |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/7d026641b853ef47392dca6d573a5f91d3a6efae |     
   nios2     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/b02e19d2a8db63e2a48ebc7a9c8ac71c9c2c98e7 |     
powerpc64le  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/c92c24a2f7aaa01f9ebf780572b2685f347a272f |     
   mips64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/3af5679b5ac895fdc305639c182ebf559ba85057 |     
 microblaze  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/351140af266b1720f025a2b4dafcfb4fd1e8cac5 |     
   mipsel    |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/2c4974f0fa83629668b28c1b64dc7fb0743ccde9 | ORPH
   sh4eb     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/8c35586547a588a9c9abb80cdf661f44d0571114 | ORPH
   mips64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/10e615f0fc0b8854b83bf437d5a217b81c1c799e | ORPH
    or1k     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/8f7f749c927200cabe838002455b2a987eae0add | ORPH
    arc      |       bubblewrap-0.10.0        | NOK | https://autobuild.buildroot.org/results/430292544068f059cd3f7a29fca8bb16c325b3cf |     
    arc      |       bubblewrap-0.10.0        | NOK | https://autobuild.buildroot.org/results/4c0a2f52e4545acfef76cdf4fa6b2c8cdfb3decf |     
   armeb     |          cairo-1.18.2          | NOK | https://autobuild.buildroot.org/results/5c0b5ea556c868d0e28e85c3f41c53f49d10495c |     
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | https://autobuild.buildroot.org/results/30d0a10d715e2794fec67efa1f6bee39bff7279a | ORPH
   s390x     |      cloudflared-2024.6.1      | NOK | https://autobuild.buildroot.org/results/87bf6e79b7fc04617bdb41e11ac2abd90b43130e |     
   mips64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/77d2748729c1170f83d6259e134f62f1b14c4168 | ORPH
    i586     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/743a0314c77500cd159d9a8e9b375f6bb0b2b39e | ORPH
   sh4eb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/90cd18fc23ebf0c585320e615379206171cb5fa3 | ORPH
  mips64el   |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/9509654750fd09eaac8d565fff83d563716afcd6 | ORPH
microblazeel |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/e2f791249921efbba111caa1663edeee22cc6049 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d660799d4c57a64507e688795e144882cc404c76 |     
  riscv64    |       docker-cli-27.0.3        | NOK | https://autobuild.buildroot.org/results/cd55bc65981c4a7bf70267a8bc32cc422ccfd2d2 |     
microblazeel |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/f7a586f58038ee5327d71afc902215bde76534a7 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/189b6e138f6d4796dd91fbc504fbc9c9df958097 |     
   mips64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/c3b7d6223da1ff29db6a21cce2a2a481164fd136 | ORPH
    arc      |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/e8a36d781fd979a0268276e3e760c2594b5ea4ad | ORPH
 microblaze  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/3c8af48bcfca26476269074cfc6ff31d2f20dad4 | ORPH
 microblaze  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/d07cacf4e9dc2b688553904aafb4c378e56a9402 | ORPH
   armeb     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/1b79afef16c5c54b608e7fa948f75a8794f1c7dc |     
   mips64    |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/d8a1b1e9ede923958d216a49e533336bfb347b04 |     
   arceb     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/80098d7cb5c5499690c0c893a9dbdb2fcf99717f |     
    mips     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/8a0e8a80188e61fca94c639deb2cf10dcb6845cd |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/047196e9cda7de3e9a2830071452c6ce8161651a |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/91d9600f60e47b3d3d7948b773cbc38a8c08abad |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/ba90c61ecaa408de8e57d1f4a51a67c3f2d32b0b |     
  powerpc    |           file-5.45            | NOK | https://autobuild.buildroot.org/results/d2513ee754b3f027b986de98184ad09c437f4031 | ORPH
  mips64el   |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/2f091c6ebf9c39195b52adb106a4b64f1902570f |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/74ec959b5c15970cbfbc385711c00d74cf1937d5 |     
   s390x     | fs/romfs/romfs.mk:32: /home... | NOK | https://autobuild.buildroot.org/results/3a3ea33a8e6ec9cfc0a0614a16f63ef684146182 |     
    or1k     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/a4950601a5cbd466f0d0716069176153bd9a1a03 | ORPH
    arc      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/ae05d405cc955eb2c0e462c769edb738c61c7cf4 | ORPH
    arc      | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/4817d53981bba7cd744261770c47bf36f9d4878a |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/f78ad66f74d417dfc60b97eca339e2f20bb1ce0d |     
    mips     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/0ecc117cc0ade23511d39d83f09e5df9f8c38185 |     
   mips64    |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/f1ce58c3fa601fec608f206501517b99e440c099 |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/2377148119f837ae6819bfb67494c8953ad72bcb |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/f8f30310a58af5ceab06137464a62ab819f51cd2 |     
    mips     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/ba89dd191103d4dcf81af01e4206fb4c921622a7 |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/47c40974b5073157ab0abb32f017b9a4d9fae854 |     
   mips64    |       gnuradio-3.10.11.0       | NOK | https://autobuild.buildroot.org/results/6b214395f8e3c02c7fcd4fff7ba6139689789bd0 |     
   s390x     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/48699724d70172f6c4f96571b0ffa4f2d6931a9e |     
   xtensa    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/f230707f6349be1c851cf14140b76f382914a392 |     
  powerpc    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/ad5c94995dbcff45ee7d320a5c51280f0aa72494 |     
    i586     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5216ff9abe6828de7ee6c079d9ebcfe666f7ec16 |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/52189bc6861dd0a466c501b912bb130b3f15ef7b |     
powerpc64le  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5b490cae544ca21720f6ac29153f28dddce191cb |     
microblazeel |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/942afc4ae02cbe5d49840d8b75c5e42c98f8ca9c |     
    arm      |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/af17676a1457c5f47b6175c6635d7d449920fac1 |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/18c4328b94c91e69d22a80862aa24fc270eac184 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c5d33374772d7fed5befc569dcff834c4250a09d |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f59c85aed0e437b001b98c6413d171597fd51c89 |     
   x86_64    | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/aaa826ebebaf1d483da0b722a7afc9c98da7eca4 |     
  aarch64    | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/cfdc4057abdd34ec73f0922ff69b8b542d8cbdb0 |     
   arceb     |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/8264bd67a499c442911f5805df48f5e50063c3b8 | ORPH
  riscv64    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/5bba1069e1ca8f49ae429b0a5f63e728030e9fbc | ORPH
   mips64    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/acd0e3375e7d4c87a072b62a55d3991630fce3f1 | ORPH
   armeb     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/e3b726f71fb2dc9d7ccacfc26d0ace8d8993c141 | ORPH
   nios2     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/25bf2d271b0928c25c403e56064ed806870a4aab | ORPH
   sparc     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/cb86e1daa1e2430afd4f502090a2f0176c35ca18 | ORPH
   sparc     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/f1ae6b02b3d7b79729ad3a298b564a50f2f57514 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d34a69f05a0692775bebbac1a97497b22913badd | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b9ece6a0eb56e84dac5c233aa889c7fbf977b649 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5ab0c70c4530699882bd7969c693f83b8cbc0e83 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/acb0a4a8f1070a54e30759a6fb70946cc6653429 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1c5d36683075d7601330971b13cc7723c98e51f7 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d6106f111faad57936b3ef25b056e6cda168b3b2 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f29413f7bc5ee72d86212a1fbfd764c9289409f9 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b81dbce05e590c51496965692ff95efd86bca6fb | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2b6001952373738152d716111290b05a8d34d6e6 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/02f78ad74ee29a3e79aafafab4ce831252a954ec | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/da235b7577b571fb483032f2eab3ace0e7ec306c | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/847257c44def8377292082fcbe4ac7d030a3bd1d | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/37b51a3e9a3733fd0e98da5f536531d38f747b86 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6b860cf646b8f2e0315c95b0045a3e8555f3b9fb | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f85ab09235ba0c41914fcfd0cda1ab7a4790924a | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9c9a220a5bbdc2fb1f7c461f67f1c1f0daed65fc | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3100c05344cab40f33b9c54f1709b182ca02e025 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6dbd4b80b7b0e954ea8e18697bc1c59c48f159ae | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/673110d61f83ca94ad1b8b03d9968d1a2e9561b6 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/de16770a9ecd52331f96ca5cdfa05d2138c2aa9b | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dc8c7b3e5b22b705d5f4cb93dc1df57c9ea14b23 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/14c1a29999a3e0fc55c2cd24fd2e9ae93b42a733 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ed91271b471fc31bffbd150bfc68baee3144adf2 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8cd0167d4c5955a48fbf4ecef6f3ea582da4c62e | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6356ccf405db40f27883e127d308a20e4f9a83e0 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a2d821972c15092fc3e4c7727bbded5223296ea6 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7b211ec12bfc2c04301cde0f1350e43def52468a | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/52c66dfed4bf0892ec05ee94bbf3aaaf9af6e62e | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fd63a8a55712ec27825c2aa9ec4e4c88dcd96810 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8ca3fbe541093a273f1a7805bab06d70139ee73f | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a640b1b45009647f4728ecccb9c14fccdf81ea0d | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ef1fbbcda638dbeef74d43f11949efc2c6e41769 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/15116d26c879f3942ab37b8bd6f948a7a3e98001 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e662ce9ec5432bd3ef99e8eae35a1041dba553cb | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fca5ce1b71ef0c3d0fe024fbd5b4dbf477c294f1 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/31b906929b378ff3b1d05984493e2b439ffb39dc | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4ddd3eeecf07f953b2696bb45b00f3035bef0fe5 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1206bf4700eef26404fe46ad44100b0e2f4a586d | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7697d6bdda9a90e3559908950227445bda270532 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3b464feba610f21c7c41a02842cb8700b8c9a13c | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/08761c74168df927b7a00c8a7c0f91df5a3d5418 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a1d95feb3334c0794a2ecc58a113e654a4277f02 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fd1538dee6218e94f06c50d4701c91998e0e07d5 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/26b7273524acd4a1ee368d619ded6aaf09ab0002 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3fea2f529fcf502429ce151ed0ad6ddb6d9718e8 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b4ebcc6409027a4aa476d214bfd9eaa9d0f0f0be | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/18f2730b4314212cc1af861bbd67ff476f6888cc | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fc12ba24648a90c4cca3ea866ab58e43eabdd78f | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dd009f6b224138b995709b1f1b2612d380e1aee0 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a4248512d8a379748b388a1549ad656797a220f1 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b6fc09b4e9470abcf0cfa5f9907ba41c2f40d9ff | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c3300557df4cc945929206b41abcbcf7b97633f7 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1895987e19d8b7851b25c8d758be49eab44046f8 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1235b26a2144cce282eb19a1c994c4892f7cc2a8 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3182482b1f9096b08fc4ac3cb2887b7bb509416f | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/83dce225ab43fd4f4ef402dac51237071ac6d360 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c49c503ae6bce29118ef18f0a5ac9cf8eca606db | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0c251871e6854334ea0cb41a8484eed8beddfa6e | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1f6817e1773a20466ad88333412a88e15ac8b601 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dfcc1ff4ba21453d7320051d8b543a4f72c90f69 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/393374705b459667efb647cfa289f7ba55ad41e5 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/804bf598cfcde159542f0c6c889a5c0c667f8dcb | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c8f93557c3fe933a5998081d680f96728dd088dd | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/424578cf8e941ced8517f9bb6707ad167d07294f | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e8f8d6459f4202ad0c6bc52fe732df4c27af9bda | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eef42a95ddb21d6962bf88e0e05d903d6e36a6c7 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d089300111e40fa7b6e5ea76ad9d89a236cb2992 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/818ca2ccd1072d477aeca1edcb5d5e523b79195c | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c493df6fc1c0c2b67e6281162ad53dab6da6f637 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/77c901ff425cada17dfb17d5110243f59a60df60 | ORPH
   sh4eb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9403a0ae123a9f85946d580005b43b5da0df7f13 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/242d25b1b0e83d332c4f087f1ab656214a41a0b5 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/438ff62c16f11635f00ab80dc7dcd537ce31ad16 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5dbe110d79ed5d587aa2a439849cba0a0e1e15ee | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/44d778f4f64811fbc99f46e25ba5da1a52060ba4 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/210adde38f895365749c9a3b0c5f77bce0cb97fd | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/04b43659a89900062b8b10a4bc60756993bc2a67 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9eac1b407d7b1d29f5f29ee9a9561d2ad02df061 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1d0b11111472e1a5fdc6bff41e7d95c750fd6fe3 | ORPH
  riscv32    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5755f0ff410f8d2765f791c1244b67de179a242c | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9cff8cf45e353dec8da24a9afb16269660bf1fed | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6e72e024ffa31a859fc1c632ab6527381e62c12f | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/21b39ac09fd01d0a752ee3278532e34d1b4dff75 | ORPH
   x86_64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/c8ac79248269df22bc996bdb42464897553a9c3a |     
powerpc64le  |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/e418958e05f8c26ec97a17b599f3917ddbb5a03f |     
 aarch64_be  |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/33290169da2ff4df8b33ba20e9cb54c07991940d |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/fd5bb5b3dab3ec074221d8939f796b807e7b9b52 |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/8714b34d3f5fb2d633dc2b5b07238cb15de15a7f |     
  mips64el   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/476949b83fa294c41aa78683c9fe96f17dfaf673 |     
powerpc64le  |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/fcf268ae42e7cf726f25e33481852e3832bd128c |     
    arm      |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/f8df0b89f3ad4f29ecc2d02d2f09f386159ee7fa |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/c32934dd0b564f8abb749f1510818d615ab420e4 |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/23b3bc6789ae171229c3dbf66d5c677b09918280 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0ca56685d913afb7bf14539beac4f8121bb6aed2 |     
  mips64el   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/a8cb8ecb2a5571c5d30eb189015de4f9d2febe42 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/25cd88624904124006827a1b565681362ae36142 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/1e9f1b066008d0ab7d1fccd921b1cc19161d0cbc |     
   x86_64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/213c9cf3bd3a94747cd492f9ae7c76a2772cc457 |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/2852febbf6259f840423ead982caf837a1275903 |     
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/d1a0316f8a4101decbba8ed4553f8eb61c1537c6 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/6e2b4eb0b5661e688c4c6e33abe9e7cbf33b00b0 |     
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/8205a54109d9575e074d5d837c2784e83b32fe0d |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/3b3f0c9be7836b92aec53d0b4d7428bf827cda48 |     
   armeb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/17e1c51539589b0436076e9da6800d7fc45de55b |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/687e49285e827828e39e38d2be4d90f3762d0a19 |     
  sparc64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/9f3c16e51506952e5829c2cf3cf33bf03181a235 |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1fc651ac2ff8dd96ab4139b0cc30c5cb2533e1a4 |     
   mipsel    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/026131ad866fbd1f2247904bae1a9225642b03dd |     
   sparc     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/a2c3583f4533993e2648cf31c0012f22047c0093 |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c5815a73a2ad1faa7222f61f882df6aee382f2fe |     
   x86_64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/ef9fb220d811d4684897ebcbc9e777c6f42ae65f |     
microblazeel |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/7c6c3a1469352b26fb0fe4a222aa0c01720b0f29 |     
    mips     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1d5f8bd58b07e4dbbd4565d1220b6c8dc5bbe174 |     
    sh4      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/7916ea047f0779dcf285811055a585921141906b |     
    arc      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/df4ba9b550c1b442337fbc0b7a2237b58276e36e |     
    mips     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c0e83ff2522565105012bc0f4f225c1dac306322 |     
  powerpc    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/61e2b7878967be1b6284f05d1b7c3fb8e79e1323 |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/48d7ba14e0980dcc3dd5e18f765a491f6ff71ca4 |     
 aarch64_be  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/ec2b04c59f9508e4bb8a873408e717e6475aa4f3 |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/59eba22ed353b42b1a6b82e030ebd87a3099889e |     
    arc      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/2fa5e888ea0f647c7ca7112b1ed4cfbd49304ff2 |     
   armeb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/81cbb19b20ee9967a81aaa669bb441f84009a502 |     
   mipsel    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/6e7861d29746e3d244b3c72722eeab08c254fd8d |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c6bfab835e8b5ef52a2cadd5c99b1f9b9e065def |     
    i686     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/98beacab233e8fecc9bf26a7a12e9cf97286bb61 |     
powerpc64le  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/d92bc9f11e723f5d3aa11789812566d8fe0746e6 |     
  aarch64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/7b193c5982f639815d8ca0ae5f9ccf885e562ffd |     
   x86_64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b7002ad39a75d5ab9b66983320a2f9845cd0c436 |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c53effc4725cc3d7bb969d8b58c1ae145b5a7d03 |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/f548f3e1ce2e88d41a1d21d0e77ad24292858fbf |     
   mipsel    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/9ad7fd421a27bcfe4be791cbff5c07c0fa9eb0b0 |     
 aarch64_be  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/24d927e4f7e184dd848e14cb631580f0a8c890f4 |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/d5a13b2f06cb3f35b06ae2f56b19dd8388a8174b |     
    or1k     |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/e35d5d60b7899931dc838262ed2c023b7bf6c83f |     
powerpc64le  |          libnl-3.9.0           | NOK | https://autobuild.buildroot.org/results/d55c311790d96703a049022918a07bcd98fff01d | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/a3ad18a8f380b277d726c9939936e9e9d78e5447 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/7d8f9e23dde53143554e955767cc1764986bca47 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/71dca021fbaeb3bcf02089b70b342f527d4dcaff | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/8f6e2e85cd5855fae23c5f96c36e7e9809f6b9d0 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/1bf9a017247370968ba8f99767aad79618c7dc88 | ORPH
  riscv64    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/0c651508dc352306605e120771d46d0d8d89c807 |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/295601d5b140f9d61c762dad53f30598f8a0eb61 |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/f54b25bbdfca4374793bd55cf1f8b710984f42d5 |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/6a56baebdac370698b95ecb8e3508b6edfc06547 |     
  riscv64    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/5e9435a36f98ecd937e28921aa154f106dadecce |     
powerpc64le  |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/0e01bcd258ef9d10db4150e2722e12bdea1ea93c |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/b1b8b81a3fc9ae20adb023088f0bf7591658fbfb |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/267468e8bf74c320ca42bb511dfaf286fe965cf3 |     
    mips     |       libsvg-cairo-0.1.6       | NOK | https://autobuild.buildroot.org/results/fcd2ed55f8e07e4efe943cbd6ad6500f13c6f91c |     
  mips64el   |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/f03bc9a432dc16c525e0dd1c420f1b5a434b06bd |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/c1f46f96ad222109d975256fd5d92647cbd27da1 |     
   nios2     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/9e304ebcd2a099036961a740b01d2df39cdbd1b1 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e5b72b354ce0e989abc9d14927feceec31ed506e | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/c13f5cc4755712491d5e4db2af429dda37672fc8 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/87971a053363d5c41ffe417f84b07365daa708c4 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e97b7a5481379d681cae9dc5d04a7f8106683923 | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/39965029e10cdc5e6c53379cc69c69e7fdba2041 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/090cedd2234633420ed24a069d29047a36513e7f | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/8841f78f2b5dd70f98518b38529d38a56a125ae4 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/50b4314d47c647e8f13a92470c6f7b201d5a0535 | ORPH
   mipsel    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/fd9fce408cd497c27a81187e61d137ccd2218212 | ORPH
 powerpc64   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/21347173b56340b760b8fd8be9a3215c99e2ad76 | ORPH
 powerpc64   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/48defe55c29804aa4f3d05516ecc829c8415becc | ORPH
    mips     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/f90462e35c42f23ef18f978319906c53d05a56fe | ORPH
  powerpc    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/174f3d3004709bde8cd08c02eeb3bc48156e9d7e | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/9aad8aa310cfb0b6d0f41948f63f3ed1fdaa0e9c | ORPH
    sh4a     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/2fcf28e25134934511d26f93de39e0c6c5686084 | ORPH
  sparc64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/c29f457483a4c26957a6f401d12e3e84a58fd101 | ORPH
 powerpc64   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/dca4fde398b43e0b262ce3b4939ba43af7ec33ac | ORPH
  powerpc    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/76029a1c54be533175e78a610adab3e6e68c4c58 | ORPH
   nios2     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/4812b7c5295c1373f734a1e424c9ee4c7c65ea7f | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/6cf77ef47661a29a532c8cfaca2e8474be2a4405 | ORPH
    sh4a     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/294f301ff7adfafb04873965a2926dce4fbea8fe | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/0f4a94c91ae26e8b0e74f9ddf4ad7b3bc72b3a54 | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/bf8525929ee8ce5b3536cdec2e4453131bd8e61d | ORPH
   arceb     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/480f087da414aefde71af8bbc5916e82a06b88e9 | ORPH
    m68k     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/2fe754218ee874eb4e14418734d9d4c980c99eb2 | ORPH
    arc      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/e2976cb14f1b28b0e74a0b57145b08a279d9b708 | ORPH
  mips64el   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/54195765eb393f04c584341594e49f22d2417dfe | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/73af4ac134c186f65c7918c4b50a4186aadb4ce0 | ORPH
microblazeel |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/d28317948d8624450bb3ecaba242342d012680b4 | ORPH
  riscv64    |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/e2ee9a5919b78968df703030173f212d032ea021 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/7ad92a029faf07513db4949d32cdcd1f1059ad3a | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/10232b3b67da201b14b058257623b350bebe3636 | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/3f17d7bc6cace1d1cbff42456c73048a1bc61ca0 | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/7355a8a37b45f5f90ebb34a22481dbaeb4432aaf | ORPH
   mipsel    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/2dd129ef63c84829949424aa58e2610f9d980b03 | ORPH
   mipsel    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/4acbff0454f402e98e0657ccae6d9d533ccce0a8 | ORPH
    mips     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/ebf136b26523c7f4787a837fe04fe904debe0780 |     
   s390x     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/1d2647f794a07bc729009db91da9223db0e6b9c2 |     
  sparc64    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/69a8c4120b50235bb1e91e91f7359721eaa5f74a | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/43988da3e552f1828a391ea16a24aa1bd14e88f6 | ORPH
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/1b25cfbf77a46ecec373677e0b575f34a6c1786c |     
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/dff56b7c5eacb48e90d5c956b030fb4b8a027270 |     
   nios2     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/432741aa1c2c6cfdc1842affeefe1b4e8ac6bf0f |     
  riscv64    |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/79e15f96dd36a9896711f1fd9a32ec8670476c6f |     
    or1k     |         netdata-1.33.1         | NOK | https://autobuild.buildroot.org/results/9f315ba41ec140e77f0184c508c88b64a80f5767 |     
   xtensa    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/88f4d683f08db6eeeb57a13e76676ea49d505628 | ORPH
  mips64el   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/38b176cb07e793398d20e2e1457cde100ef2777f |     
 aarch64_be  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e3bc0588cbdb39cc313073205152cb98754e5153 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/cee72082f5f6e8e1be25c43905aea1c446a9b621 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/49756d058079cc75fd2460814dd8fc37b83a7f2b |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/de586f23f167e749b42a33b2dbd6b38da392f0e1 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/abfe0160260d1909c9df65bbad32f073991c4424 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c2faf9f3976beb9dfca8cfa50af267012246e3aa |     
  powerpc    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/7e107b297141b15bd5494a36a84588feda3c971f | ORPH
 powerpc64   |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/7d4e14eea6b190d9e19349f0b758116565145f7a | ORPH
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/c86dcbfb5c885f673863fc783de6db1264aac934 |     
  mips64el   |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/77ec42b7fa2b3b42ea97fd68452fc98641619db3 | ORPH
   armeb     |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/b86d39a346059ffeee473255c57692249b3aa77d | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/7c02ff9be21bb7525179c18118545076412fad55 | ORPH
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/1c8165b9257df0379d1aff2d800176147e6079d1 |     
   mipsel    |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/2714e83674dd8641839ed787f3e187aca87956a7 | ORPH
   mips64    |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/4f3c29f1c4a001ed665a63d50e501c8b72c96202 | ORPH
   sparc     |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/22c3e5eef99da4b5c6a0de05e625b172eddecd32 |     
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/0d14abebe9a585c79e1577e11753f48a2dde9fd7 | ORPH
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/01fd7f7f72f29588d2f0c219a3ba2311e9506f31 | ORPH
    i686     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/18ac388b219684fa09b788af108ac68a3e688443 | ORPH
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/65acfbb7b0feacf98cbf08b6dc3f73d94e7314e3 | ORPH
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/0bf3071a626b42f0b7d8f164ae8cae143083235f | ORPH
  riscv64    |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/c1eef82d01242b5339c7f4b0a10c5753c20593d4 | ORPH
 powerpc64   |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/3231e948c81bfbc673fb867e2e9f7f853bf5b2d8 | ORPH
   armeb     |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/ff24def88d6c700f4e7bb248fdbb2a0675fe56c0 | ORPH
   x86_64    |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/3d91b745a210a7a1f3a35369c38e80798921a72e |     
    arc      |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/b84c9be5181156448c33627b18466112fda5288d |     
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7568f538ffcddc25e8ae934d8d0bc6e07da4f869 | ORPH
  riscv32    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/201acaff45a8a97e473e527d1cac86453389095b | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1ab8f748ee724a81372a4d3ab545af70dca90f49 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/90f429978bbe0e538d7f104e8690bde17702d466 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/31fe41a059e27aa2ce823a92c5bdd065a0b60f78 | ORPH
   sh4eb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f69d05ef1ee36b3ce4b0d9bd60b838e9dcd280c3 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/422869e4c157c8a9dab6f15a58f41241d41261a0 | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/be24897ccda1f3d709326fae2dc26a2212aad712 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/39a9f039c9bc3f7dc19e235d5dd5bd5f7df66fe7 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/cc441317440599a25871e3c6acb2d5239f48c71c | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/67383c676cd81670f9b950ed060ea641059585bb | ORPH
   mipsel    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/cb73bc1f55a2408ed8ea0311a32e87c7962b38b4 |     
 aarch64_be  |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/587228654d030cb803dfeea42b633af0617e23dd |     
   s390x     |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/d2ce94c82082f8f28190cd1d464dfa514bb9fde9 | ORPH
 powerpc64   |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/d8abf855f2c3e559df66dd9668b7bfaa927c92b5 |     
   sparc     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/236656a1834bbcdeff6b575f7a29de26bf27f7ac |     
   armeb     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/0248c91700548e8203d6235eecd3e0c8798f580a |     
  powerpc    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/702fca1c9627d76f836372f4efb6dbb3626c69ff | ORPH
   xtensa    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/79b407a62de4dee0678174f6a22c3fbe43c63c15 | ORPH
   x86_64    |           ruby-3.3.4           | NOK | https://autobuild.buildroot.org/results/a9ac122b665068600ea720c3111ae9395cfe35e8 |     
   xtensa    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/086e7fa8646cd03ae66e81295c5c9d93fbd571aa |     
 powerpc64   |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/b4eea708bd8f168092850b9edaaab4beaac702f1 | ORPH
powerpc64le  |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/a41a2d439991ba1b4c0894cbe6b6bc351ca6b0f8 | ORPH
   s390x     |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/80365411956871740cf798e0d5aaaee3fa4a652a | ORPH
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/335fcd2f10bc7991cdf57b3b84155401f849fc90 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/514d3a9259c021ca1a75a2b9f5c2cb4d2d498c9b |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/6bfd0ef77677509b76ff5daad8fe4794d4d10374 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/93c2f071cf89c2236c6359590866049ecb122b74 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/907b46793caefbb57333a4d8024261c911fb849f |     
  riscv64    |       util-linux-2.39.3        | NOK | https://autobuild.buildroot.org/results/549b2eecde86ed205722aa28105602b774f37105 | ORPH
    mips     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/7c751893ee035fa9b81b02f1f5a8943b9f7983cf | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/cb5f8e636dd77c803f796cf64e3d53c93538d995 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/e806b36c3feac8a36c9e38868e6fd670805aa6ac | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/ddb2d127552fdc158eea371f3736f08788adf84b | ORPH
    i686     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/cfb52a2d61f09f36b84969b00ef42cf89c39be29 | ORPH
  sparc64    | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/f5577b910d82711eedea4e4021948bb1e3b218eb |     
  powerpc    |         zlib-ng-2.1.6          | NOK | https://autobuild.buildroot.org/results/78c252642f9a5090917a9dc8301c94fc8b7c14fd | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  giblib-1.2.4 | 1 
            host-cdrkit-1.1.11 | 1 
host-heimdal-f4faaeaba371ff... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/86237da8a4457f363311f3811ecb6b004aa55c56 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/e22df091c3bf35bbd59650e5eaac440e3674ca41 |     
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/cb162a8fe625dd251c3c36d51d875bd1685e118b | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                host-go-1.22.5 | 3 
  gobject-introspection-1.76.1 | 2 
          libcamera-apps-1.2.1 | 2 
                  libffi-3.4.6 | 2 
         python-remi-2022.7.27 | 2 
                  bcusdk-0.0.5 | 1 
             containerd-1.7.18 | 1 
                     crun-1.12 | 1 
                 dc3dd-7.2.641 | 1 
                elfutils-0.189 | 1 
                    fcft-3.1.6 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
              fstrcmp-0.7.D001 | 1 
                  gamin-0.1.10 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
                gnu-efi-3.0.18 | 1 
                 gnuplot-6.0.0 | 1 
              host-rust-1.74.1 | 1 
               libglib2-2.76.1 | 1 
                libressl-3.8.4 | 1 
                  linux-6.8.12 | 1 
               mariadb-10.11.6 | 1 
               openblas-0.3.27 | 1 
              osm2pgsql-1.11.0 | 1 
                 pixman-0.42.2 | 1 
               procps-ng-4.0.4 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/8a05c7111401c7bdde9d8401db29a92e6588a510 |     
    i686     |       containerd-1.7.18        | NOK | https://autobuild.buildroot.org/results/b4c9a2663115ea737498a6e15323b7f0d7b5f30e |     
  mips64el   |           crun-1.12            | NOK | https://autobuild.buildroot.org/results/df1edf45e9724dfbc51ed64a92155aed2bab83dd |     
    or1k     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/a61d0ee328bc5d389dd0d672cb6f4c00496492f9 | ORPH
microblazeel |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/ce953bd1fb47967fcac0fb0f7e3ed81ba5bb43aa | ORPH
 aarch64_be  |           fcft-3.1.6           | NOK | https://autobuild.buildroot.org/results/d4b9669213f3ea178b404b13d2477cd6a6d1a2b3 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/88c68e104ca7c34be51098fc9e61e1afb8ef2895 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/ce0ebcb12df76eadcff197c0101d2f49ce428925 | ORPH
   armeb     |        fstrcmp-0.7.D001        | NOK | https://autobuild.buildroot.org/results/2c0faa20605a4b5d7f919cc78b6fb81921ec39a9 |     
  powerpc    |          gamin-0.1.10          | NOK | https://autobuild.buildroot.org/results/c4bd0de2bf06af92b57dd46231f0cfb1c97348f1 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/8f5bda222fa19a7d938c7acbd0ac7eacd72b971c |     
  riscv64    |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/670453a1743b081f9380831ae532d6669e15b486 |     
   nios2     |         gnuplot-6.0.0          | NOK | https://autobuild.buildroot.org/results/bbd07f3852d7514c736db37db8fd5e4ad36bb04d |     
    m68k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/9fcf9c358c158031e7f266adc255666989d49f73 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/cd9fc11df19c7c664168632b561d1b8f378a6c51 | ORPH
    sh4a     |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/e435ed8622cbf552c6b84a76c82d9ca5e8b8eaa4 |     
    i586     |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/86039f4a0ef7e049e32274f465b23bd04c85e4fc |     
  mips64el   |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/dcab926c89d3a2eaeee734268668ed60037d1cc1 |     
   armeb     |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/cd235badc2cde85c4cea211f0f0ee9fbef2f967f |     
  riscv32    |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/1951b6c23688e156706379507d18801cc9a98408 |     
powerpc64le  |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/f8ac11b8e4dbbebd05ae85bd356b4ec61bb34ded |     
    arc      |          libffi-3.4.6          | NOK | https://autobuild.buildroot.org/results/b2f7f34e40799db48c1ca06683c3b5b396fe16dc |     
   arceb     |          libffi-3.4.6          | NOK | https://autobuild.buildroot.org/results/f490f1790ddc4f8cab0da1208d19d7ab12316b9b |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/1ef88901256365835a9313a4c06b0d8336359027 |     
  powerpc    |         libressl-3.8.4         | NOK | https://autobuild.buildroot.org/results/65fdc792fcab7736698a1cad44c9ad7c6bbae156 | ORPH
    m68k     |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/06eff9940c261ebfdff77c2c04227856c32ccef7 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/e134b5453ed7f1fc5a53bda81666d1366a6dd16b | ORPH
   mips64    |        openblas-0.3.27         | NOK | https://autobuild.buildroot.org/results/19a5dfddadbd8d8386485c06f6a9702a19e0fa58 |     
   mips64    |        osm2pgsql-1.11.0        | NOK | https://autobuild.buildroot.org/results/2af5f1ba605202d7a4527ba94b9ee49d80ce7b9d |     
    m68k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/e166b614019aa016431f53d7083aa51752ba366f | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/eba29c6a73f3a802907389adcd252bb1ad6414b0 | ORPH
 powerpc64   |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/40ec4b371d739f2d542e9e1a974a0e79d8d566c6 |     
   armeb     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/30a28e937a23fccc93a85c99c6f7eca155f91aa3 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

host-heimdal-f4faaeaba371ff... | 1 
          linux-5.10.162-cip24 | 1 
                 openssh-9.8p1 | 1 
               procps-ng-4.0.4 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/3afbc831c8a8647e3e66916598bdb951529356fe | ORPH
  aarch64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/d1ee59f6b02a9bf022c60e8e1de396113686e24a | ORPH
   mips64    |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/57536f0c1a252c9d5c34525fd329c331a1b24c59 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a2f1f8bce5c18572f9de184e887164712f2a9f48 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
