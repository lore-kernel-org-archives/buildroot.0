Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29189C28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 04:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87B2580FDD;
	Sat, 15 Mar 2025 04:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsQYOYEDXpJl; Sat, 15 Mar 2025 04:14:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C46E08108C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C46E08108C;
	Sat, 15 Mar 2025 04:14:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 085CC61
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 04:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E055B60745
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 04:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLCN5_s4PHU4 for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 04:14:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E6C26073B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E6C26073B
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E6C26073B
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 04:14:34 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5e5deb6482cso6892100a12.1
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 21:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742012073; x=1742616873;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TuwaP1nOphruJAz2dP3GUrgPJrkxzsdliqfLTsLoMh8=;
 b=SFQgQbM2ZtRXeHTo4DuilFBHDgKQ8JZi97jjPzQcW7SwBLYb6CXig6xmUCPezdKUv2
 SZ2v3eBtbjGOZVHttvbOxd+Nm10bD9aQ7t6dgcYSbyqR5lDxJW7Xw8HGQL3OfIOV9hnO
 W6OHrBSqS0ocxdVmr+t00ncLSZp+RyKTNzhZgohfL4I04GlqTpDYfzAtIjsSbzG9/JvV
 a9OckF8lkQJLmVAF4RsQQTRq1dU6/Z0r0QXzfdZcBx1UKUSvcUf//EhDknmlLBTTpCsE
 fgprs6kFOVEeDe1di8FmGwTihrVUftdpuf1bictALO7P957vkrSOsrm+qk5RaGLel6Wp
 F/yg==
X-Gm-Message-State: AOJu0YxaeVqk9kRNjIM8vw9ova2wPsUbocVTiXhY6yYSx6eTRDmqHkby
 c4FtSSdPDQyo+in0csKntTipTuaeM94uJtBAQ6skjkKyETn9EPggg+xjjw==
X-Gm-Gg: ASbGnctGuPVIZuesVaWv3aFBS2V2xdbSAUzo9hgphOAbzqNLNsi1s0wSXM4pl93TwY5
 aliYHSZk9ivxnCnxt2gEI1ZNAWCOsGHHuYpGMBN/4EbWVt3mUe3aeDFmPERAJd9y7zSKf+8msJM
 0EVlvslM3AEh3vvt31xNUmCT3uPiZ7aBIrjnAl2B7wIcSnplDO1921w8h4/ckUPZJT0Gm+Pe0r3
 RdEO6zsLz7g9Wpx1qXg21iKA/LTvnxj9hF3b1CwI7MTnE0bZulJVRWG8a5QPygf3iF8eL9ilhJw
 XEJS0ArWRgbq/YdKZq7+qh3KE2BibikOITUGa+KvsM5jXA31
X-Google-Smtp-Source: AGHT+IGHYZJ5GNkkiwwgd67pQm4IcO5w80/PTg4cLNFCLUPOn0uMoJXcvDYyk6B+7YCctySe7L32iw==
X-Received: by 2002:a17:907:1784:b0:ac2:d1bd:3296 with SMTP id
 a640c23a62f3a-ac3122c9347mr1030739266b.10.1742012072582; 
 Fri, 14 Mar 2025 21:14:32 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3147f1424sm310432966b.71.2025.03.14.21.14.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 21:14:32 -0700 (PDT)
Message-ID: <67d4fea8.170a0220.b21c6.b3c2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 15 Mar 2025 04:14:32 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742012073; x=1742616873; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=TuwaP1nOphruJAz2dP3GUrgPJrkxzsdliqfLTsLoMh8=;
 b=OfNUnNrhPfH1sFS32wyRB8tbQMbe4jEqULxgNGwATe3jglr6YFopCTa3TifluX/v95
 rJiDSZja37dQSIYX70lY56xmdT2Ctb8s2LNB0jy3LCxPDmd1TOjbr7zwx/5WpuEWh1kQ
 szBPKJAHUIV7Cu4lkVAP1eC9sHgprQB9Ub1H4yJmaEF3h0jAUorF0iJJK1+rgJMncLMM
 pkQ4uAiMy34P2ZAVwbt4T+Qk1q9WhD9ZrFYF1qp0/OSetFH8z74ZFJaliETroMg6PIWm
 OowPPKBfvKmsXJj8CtSsM9IqrWiNnEW9YYsRn1qJet3dgZ/Hf5XFX8xj71zk0Tcg3xmD
 FFEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OfNUnNrh
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-14
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

Autobuild statistics for 2025-03-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  3  |  0  |  6  |
  2024.11.x  |  3  |  6  |  0  |  9  |
    master   | 15  | 57  |  1  | 73  |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.192 | 4 
                 openssh-9.9p2 | 3 
                    azmq-1.0.3 | 2 
     bandwidthd-2.0.1-auto-r11 | 2 
                  ffmpeg-6.1.2 | 2 
  gobject-introspection-1.82.0 | 2 
                       unknown | 2 
           at-spi2-core-2.50.0 | 1 
             bluez5_utils-5.79 | 1 
                 c-ares-1.34.2 | 1 
                         clang | 1 
                 dc3dd-7.2.641 | 1 
                 erlang-26.0.2 | 1 
                     fd-10.2.0 | 1 
              fluent-bit-3.2.2 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
               graphene-1.10.8 | 1 
                 hddtemp-0.4.3 | 1 
                 host-gdb-16.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-python-greenlet-3.1.1 | 1 
 host-softether-4.30-9700-beta | 1 
                  jack2-1.9.22 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                libdrm-2.4.124 | 1 
               libgtk2-2.24.33 | 1 
                 libjcat-0.2.1 | 1 
                  libsepol-3.7 | 1 
                libsoup3-3.6.1 | 1 
                 libssh-0.11.1 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
               libunwind-1.8.1 | 1 
                  libva-2.22.0 | 1 
                 linux-6.12.18 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250130 | 1 
                     mtd-2.2.1 | 1 
                    ncmpc-0.49 | 1 
                  ntp-4.2.8p18 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
           oath-toolkit-2.6.12 | 1 
               openblas-0.3.29 | 1 
                   perl-5.40.1 | 1 
                    qemu-9.2.0 | 1 
           uboot-tools-2021.07 | 1 
             util-linux-2.40.2 | 1 
               valgrind-3.24.0 | 1 
wilc-driver-linux4microchip... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/8b735f9de9f25834529ed6681f06e704545cf0fc |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/462b99bbaa3e73be2d8960e8d1d03840ebed0fd4 |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/e938615b4d90cd7f258582e49f56f1315819dff9 |     
   sparc     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/f54c42edf8e83701996df9495ae55d789c73a7c2 |     
microblazeel |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/2b5d11a07309a398c7fafb794b0f12de1d4b4fed |     
powerpc64le  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/5ad0fa74af11f184335ba9d295b44d3c3dcb12e1 |     
   mipsel    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/557f032739164ad27febd3073e942b143a495d99 | ORPH
   x86_64    |             clang              | TIM | https://autobuild.buildroot.org/results/047b05dde18fd9c14304a255232d0ef53451da3e |     
 microblaze  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/2f8836e0718f64c982e62a4b727d5432eaad2bb1 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/75d3378f41fa092283bb261ecd398886d7a0cb7e | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7421f5f78f6e012cfcd13b5a348afc641ff1259e | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7afaf3c93eb89473fa9bed94d43efdaef9595d0f | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e0daeb9802f347efd141565df1f74446fd8aeaa2 | ORPH
    i686     |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/ef621be75b7af465c8c2a4c519f6ab38ffd3ba50 |     
   x86_64    |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/4cec9e02d4d1ade9749023a0ed420ac3277c106e |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0031c3091983916dea5f87bca437e8112f213a3a |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/90242439ee0e0cc5cb37718e371436297d471178 |     
   armeb     |        fluent-bit-3.2.2        | NOK | https://autobuild.buildroot.org/results/3e5048c61cc69d0b166a7e10ff15ae15f3b185ee |     
  powerpc    | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/c86b28dc7dbae4ea48f39aa81127f803796087be |     
   mipsel    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/4c85d6d79bfdc4242fbe96d0ab8c422ac5a89442 | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/a9dbe9634fc1ce4526eb1f6b22c5d3709b6a3acf | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/d325ab6125a784af774683a0e4ee7ea95fa038d9 |     
  aarch64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/f2f69c60a8a50c5721b0351251f1038f62f40ec5 |     
    sh4a     |         host-gdb-16.1          | NOK | https://autobuild.buildroot.org/results/2d8ed9017fc9b50700b9a7156e459b1011e653d7 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/f62e72bb2795d9d10fea40728c0ccfb6cb188ab9 | ORPH
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/08a615123c9d34dfb00b41006815e20cc79bed1c |     
  sparc64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/26de27c780bf8d860ddda10ec46082254e0e8e5c | ORPH
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/82956c36dfe1d4ec105327461333b76a396ffd44 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/9fe1d13caf9b0190afee5f9c1cf53abfd6a742d2 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/fd96b7ca3d56f34c485812bb139cacc0e2721590 |     
powerpc64le  |        libgtk2-2.24.33         | NOK | https://autobuild.buildroot.org/results/83f7fb5afed231f3e02362a434bf3e6ff8dcde08 |     
 microblaze  |         libjcat-0.2.1          | NOK | https://autobuild.buildroot.org/results/ee9c594e04a247d65b4c659455a4f4fc0a9f86f3 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/74661eaf657f9ee54f7e55189f4084cec1cef92a |     
 aarch64_be  |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/e9bdcd75370de36a263b2de8d78dfbe824b19b27 |     
   mips64    |         libssh-0.11.1          | NOK | https://autobuild.buildroot.org/results/178a97c394de05f27e949d7d220b96fd810d6dc0 | ORPH
  powerpc    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/aed35da1e7a87a6a92eec276b2912164c80692f4 | ORPH
   mipsel    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/04456c2b8f96d45855a1bd796aa066e72f2edbd3 | ORPH
   mipsel    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/8565de64abb7e1c821d8a4fece41b52f0955cb87 |     
   sh4aeb    |         linux-6.12.18          | NOK | https://autobuild.buildroot.org/results/31a57bda6e318298b87a03dfdbe8393c6fa35ea5 | ORPH
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1a92f3df8ff28b2fbbc56061fc03bb3cafe880fc | ORPH
   mips64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/74f22177241bb36be9488ea085f394d9eb8a0a29 |     
  mips64el   |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/eb8375b7f95787ec53651654f15d0944c1d074b8 |     
  sparc64    |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/ee96053c3918726eedf08c5933dc635ea219b28c |     
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e1d5438a99df5f8f282f6fbdd20ff8011461d916 |     
    m68k     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/d75681206e588deb994de23ab5779bb6b3b5ed3b |     
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/d1b20bc9ef4f81b94d5b31f4038a6f5e123424ab |     
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/b8fcda105af31d07a901c06b334f242ab32b7552 |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/33c0aa86c3aba208a61a6b334347e2e325dd98fb | ORPH
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/07b489c47e599e73bd3a241ae14fd6d2654e882f | ORPH
 powerpc64   |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/cdf4178963ac6065768479936f316ba9b8f9dfa6 | ORPH
  aarch64    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/4fa89ecc08b9ed59fb9172c231d10ad43ab603c6 |     
 powerpc64   |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/79742e62a6e333ef9df8040b65111903541113c7 |     
    arm      |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/c76f4a02bdb33a48eea7cfa4d51f4035c1209d8a | ORPH
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/d684a86bf499e5b60b3b59a9180d5b042f3fc55c |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/5783f1f82eb919901f55696eb119326a7c7a3727 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/cc4f57110ceeb613533d4268cc1b81e03c5c8268 | ORPH
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/f28ee0338dcb9dbfdb785021f5f9a76791a5316a | ORPH
  sparc64    | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/85f90c9cac1f9b60704baab303b13ba6bd2d53e8 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               host-go-1.22.12 | 1 
      host-riscv-isa-sim-1.1.0 | 1 
               libglib2-2.76.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-go-1.22.12         | NOK | https://autobuild.buildroot.org/results/da5f0f443ed593e7c5b23e8ede61bd896383ad0c |     
    arc      |    host-riscv-isa-sim-1.1.0    | NOK | https://autobuild.buildroot.org/results/4faa58f1bfab63050a726aabec4f0e6a3bda4214 |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/4ffee3353f7c2075c4b31fe017a7b4a9aec6220f |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

            host-binutils-2.42 | 1 
               libunwind-1.8.1 | 1 
                lmbench-3.0-a9 | 1 
                    ncmpc-0.49 | 1 
            quickjs-2024-01-13 | 1 
                     rauc-1.12 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/0384bcfc8886a061c96fda4acac1afbf5d45802d |     
    mips     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/e03184dc612776021804e0b3da8563c8cc47ae8a | ORPH
   mipsel    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/608988db6333d8b6b3bd267377b7c92080c39945 | ORPH
 aarch64_be  |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/1b9205dab35bda25009a666025559a695c95d86f |     
    or1k     |       quickjs-2024-01-13       | NOK | https://autobuild.buildroot.org/results/ca8adfabc0fb45dc66b625e84ed00dd3580f4bb1 |     
    i686     |           rauc-1.12            | NOK | https://autobuild.buildroot.org/results/497df113fc8348d27433f31d225b58dc5cb529ff |     


Gitlab CI results for 2025-03-14
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923357  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923429  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923433  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923436  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923440  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923478  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923507  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923527  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923536  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923549  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923553  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923561  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923568  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923572  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923578  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923586  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923672  | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923676  | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923682  | ORPH 
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393923849  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393924084  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393924149  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393924164  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393924236  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393924258  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393925168  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9393925371  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9407811454  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9407811541  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/9407812783  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/9407812878  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9407812973  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/9407813106  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9407813278  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/9407813466  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9407813767  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9407813951  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9407814141  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9407815131  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9407815724  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9407820011  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9407820060  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9407820204  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
