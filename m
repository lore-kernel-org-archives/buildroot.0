Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B752D5A6DD
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 04:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ADD060B7C;
	Tue, 26 Nov 2024 04:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPTiRYtKjtJK; Tue, 26 Nov 2024 04:18:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1539960BA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1539960BA2;
	Tue, 26 Nov 2024 04:18:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 057C3DB3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 04:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA36785031
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 04:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PajWxKjUoi_d for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 04:18:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B6F385038
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B6F385038
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B6F385038
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 04:18:02 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa55171d73cso288884166b.0
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 20:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732594680; x=1733199480;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NuB+SzeDNtqBsV6MRvg7wVAqpMzTRwM4ckuNZIqsiFg=;
 b=LjxydAQNVYaantFBQA4XXrniGd8KZN5D9jpx+Jrt03ZUZTsHjZpxl9rtGTjqCG61B2
 6+Q+733llBgxQmxZey3Qhv3Oa+dIt5UBpP8HRISPbjkF0YqvW1VG9DKyITYkxSBvZUXZ
 d+54S+1dWsd7fEeN1E7rBDq/MIUAeBwMLwyLT8QB65/f7vh1PESeGfyI0w9u3No6a6yS
 YAUb3Sw86wto94/gUHvoAOMgM6/k6H5WxlSIPPnq0ac/2koqgZab42WHbu3ONQy5kkNn
 tsAo4g68qwFfrR9haM6i+BYaQWI3yy1RmVbcKjb9cmNdA7weurtelcZDbbpVr18ekxsc
 hvsQ==
X-Gm-Message-State: AOJu0YxKWmLC1gbX5z3dJeTNgDL64l+pccvt0A7z07TYaruvIY6LLOrb
 zKbrqWDCiO3sKaSVZZJD5eaGEpSvH/qQi4jAbIzM27CV7mZVapXzrYXavQ==
X-Gm-Gg: ASbGncv29hQQmVH9kGQkHAC2awvkTFuWnFWRcee0Z1PfVKajtncZaYM+9r1VXrebZfl
 uakWr2h+lJiFQZWM6dtM5l3r99fjewr9cAjaQRmLdOPRBn1bXTTMfsza0Mfs48vXZk860dJBu5X
 59MSTmGR5/lZaIJ/em60/f1mdiSB3S2YoJQcm256fGsgn5epFwioAy3VdEnJy9/t3Qqi/NXMPxE
 Byrbcz5P6AJjat2ZZcVEylJLlZVUXiJA8bWFjBYhHQqrj8kYQfafg==
X-Google-Smtp-Source: AGHT+IF9e2EzBDY9Evj53CuZ3PqiRq5i4QRqmPgOFd/iznQ4MMX3tAR9l0RPzUkZcPXZvsemViL8MA==
X-Received: by 2002:a17:906:cc4b:b0:a9a:170d:67b2 with SMTP id
 a640c23a62f3a-aa5648ff7famr169941666b.29.1732594679828; 
 Mon, 25 Nov 2024 20:17:59 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b52fcf9sm543371566b.118.2024.11.25.20.17.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 20:17:59 -0800 (PST)
Message-ID: <67454bf7.170a0220.52cec.2f5e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 26 Nov 2024 04:17:59 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732594680; x=1733199480; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=NuB+SzeDNtqBsV6MRvg7wVAqpMzTRwM4ckuNZIqsiFg=;
 b=I2btc9bE3IWCPdC99A37y94LZJpcYt0dXI2TTNFFG22SGMyJ468QCfH3dq5MRed4FB
 QduTH6ylW1a/rPCocgnhoV4BcnQUu19dnA2RLy+DkP7fO1+qmkJqZONYM1ZuO0nZu5NG
 hsCwAYjIaLU9ZyKr2Cz4De2CjAAOuqvlEvGFAmMyQBBwy3yI6VHkZpkX6gZettDDjao1
 row4ukyD4DgArddruInX/BPU7MvtJ/kbsa53TfwAjxwZs1S3tpIU1sgOBWA3rqZAdcXC
 DG7XlnOidLuYctxpYX4xhJQqCdSNcfBnoHLBRC8CvlluXA1F0zIGqOp7oSaiKJj73XoI
 nGzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=I2btc9bE
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-25
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

Autobuild statistics for 2024-11-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  3  |  0  |  5  |
  2024.08.x  |  2  |  2  |  0  |  4  |
    master   | 12  | 172 |  1  | 185 |
     next    |  1  |  9  |  0  | 10  |

Classification of failures by reason for master
-----------------------------------------------

             dahdi-linux-3.3.0 | 10
 ibm-sw-tpm2-rev183-2024-03-27 | 9 
                lmbench-3.0-a9 | 8 
                 linux-6.11.10 | 7 
               pulseaudio-17.0 | 6 
             util-linux-2.40.2 | 6 
          linux-5.10.162-cip24 | 5 
                  ntp-4.2.8p18 | 5 
               procps-ng-4.0.4 | 5 
                   foot-1.16.2 | 4 
                  curlpp-0.8.1 | 3 
  gobject-introspection-1.76.1 | 3 
            host-binutils-2.42 | 3 
host-binutils-bare-metal-2.... | 3 
         host-libxcrypt-4.4.36 | 3 
              libopenssl-3.4.0 | 3 
                 libv4l-1.28.1 | 3 
                   perl-5.40.0 | 3 
                       unknown | 3 
               arp-scan-1.10.0 | 2 
                  bcusdk-0.0.5 | 2 
             berkeleydb-5.3.28 | 2 
  binutils-arc-2023.09-release | 2 
                    brltty-6.6 | 2 
                 c-ares-1.34.2 | 2 
cegui-00b4e1fe174da53b7ed72... | 2 
          cloudflared-2024.9.1 | 2 
                cryptopp-8.9.0 | 2 
                   gvfs-1.48.1 | 2 
   host-mender-artifact-3.11.2 | 2 
    host-python-greenlet-3.1.1 | 2 
              host-rust-1.82.0 | 2 
      libabseil-cpp-20240722.0 | 2 
               libglib2-2.76.1 | 2 
                  libnss-3.106 | 2 
                libxml2-2.13.4 | 2 
               linux-pam-1.6.1 | 2 
                   linux-tools | 2 
                    mpir-3.0.0 | 2 
           oath-toolkit-2.6.12 | 2 
          obsidian-cursors-1.0 | 2 
      python-autocommand-2.2.2 | 2 
android-tools-4.2.2+git2013... | 1 
           at-spi2-core-2.50.0 | 1 
                    azmq-1.0.3 | 1 
                   bird-2.15.1 | 1 
                   bzip2-1.0.8 | 1 
                 c-icap-0.5.10 | 1 
                 coreutils-9.5 | 1 
          cryptodev-linux-1.13 | 1 
                     daq-2.0.7 | 1 
      docker-cli-buildx-0.16.1 | 1 
                elfutils-0.189 | 1 
                 expect-5.45.4 | 1 
                   eza-0.18.22 | 1 
                  ffmpeg-6.1.2 | 1 
            freeswitch-1.10.12 | 1 
                  fwupd-1.9.20 | 1 
            gdk-pixbuf-2.42.12 | 1 
                  giblib-1.2.4 | 1 
         gobject-introspection | 1 
                 hiawatha-11.2 | 1 
host-heimdal-f4faaeaba371ff... | 1 
              libcamera-v0.3.2 | 1 
                 libcddb-1.3.2 | 1 
                libdrm-2.4.123 | 1 
                libesmtp-1.1.0 | 1 
                 libvpl-2.13.0 | 1 
                   mimic-1.1.0 | 1 
            netstat-nat-1.4.10 | 1 
                 openssh-9.9p1 | 1 
             parsec-tool-0.7.0 | 1 
                 pixman-0.42.2 | 1 
           python-numpy-1.25.0 | 1 
       riemann-c-client-1.10.5 | 1 
          sphinxbase-5prealpha | 1 
                    yajl-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/f059fc6ed672204264e7c8230fbdf76b5608cb44 |     
   arceb     |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/754aa6585cc2c120c1f4825538c81284faaa0f92 |     
 microblaze  |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/de5318ce2b22b6d3ad56a079e2d377ef57887007 |     
   xtensa    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/e63675ade9d0cbdc472299d95a89370f6faa1dc2 |     
   x86_64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/323457c2fe5eaf87eb288bf4b5b49c2254bbf4ba |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/91c16202290fc8ffbad5ddbdcc1b1817844f9619 |     
    or1k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/5fb70448dee288276e35cb1c82cf5dc714a96610 |     
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/6e8c6f92d8655985db6fa329be1ec531949764a5 | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/30150de9f00586740ac9d7c5c6e239323a9bfd83 | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/0f106beeb5852265f55f77e0a976fc0eaf5aa34b |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/5887456ef586c51e170f34f5825f3e7c1e1ed340 |     
   s390x     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/7c5c59a1ccada39f6546b7bbb57d32ef6fc524a9 |     
  powerpc    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/4952549580747b7a794c3e38732f779fdf7393f5 |     
  powerpc    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/b479b614828f84865ff0963df0a23cd12e121e99 |     
powerpc64le  |          bzip2-1.0.8           | NOK | https://autobuild.buildroot.org/results/58903e3c7494b326738e8fcf150c1a0ce3959793 | ORPH
    arc      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/b7274d87a92a95ddfb5c3b142bde7533ad3badd0 | ORPH
  mips64el   |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/6893e423090c6d0a1cb9091196445aef912fa8c8 | ORPH
powerpc64le  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/076d9e5a51579b6773bdf9bac9f45d458fa3f729 | ORPH
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/8fa3c7f7f9de5b60a3082b145e0c1fb6424ebfd7 |     
    sh4      | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/b1a68d1af64fc7bac1e5fee6deb8bf87274c73b0 |     
   s390x     |      cloudflared-2024.9.1      | NOK | https://autobuild.buildroot.org/results/f7e1e0e80fd7f33a28917e69587d540a01493161 |     
  riscv64    |      cloudflared-2024.9.1      | NOK | https://autobuild.buildroot.org/results/ece814f90fd949a2425edb4f659dfbbc3488d113 |     
   s390x     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/0329898440b699055c7139d9d2ae8d20b400d474 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/60aa030cfed89b5a0785c448d93e5c13ddf47f44 | ORPH
    sh4      |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/6acfe94f8d957e4335d5a1535ccea89ca41527f1 |     
    sh4      |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/a7a5e3ba1c35f41904b0ede1ebae604afc587a77 |     
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/d4e62e9d95b68bd0a835fd3a1c5fd146c04580b2 |     
   arceb     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/cecfa4c42e7c70be2300425563573df62413082b |     
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/bc5fd4ea6e312a1861c4d369d9d20f1137036ba5 |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b7e3e1778ac9e6a374cf3b96db329c346a41ed81 |     
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7a7c093e7f69b54a652b593c8c2d7419e653029c |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/df795cff444ee4d9e1aee12259e7bf293ac02360 |     
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a29228e1f9e86ccb5d9b64165c08273bfea0d18e |     
   sh4eb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/47f03c0608415fd185feaff529449cedbe7c4fd0 |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/de54e06d78c80e4e6a1e077239823819157cc72e |     
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3416fe03c749fca13e0a4974eae258872cf6dc89 |     
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/995971231d1ea0460b200ea92b87ccb7e969ad3e |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ecdc7f7dceb22df0cdb3ba0e27507311dc08d6fa |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1afaac2662784d3ee1755e93bc562e38188f3e80 |     
  mips64el   |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/2adccb88eacbe1f5da7e6e541ae2f23f13551f17 |     
    arm      |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/f0b893b474dd11d751bf862e9cd47026c1d89aac | ORPH
powerpc64le  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/df68f22eb6563758b115a2cd287f3b2e0901c22c | ORPH
   x86_64    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/0c257dbadb10fe5672e0066c52cec219a1002455 | ORPH
powerpc64le  |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/c15e696dd0771e246b54963f490ec0334101da1b |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/090fd21f8e2613d1ac0fc5f5bcbaa51a1dc23548 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/a429cdc068790f1953056856fbcdbec8361cbfbf |     
  mips64el   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/a989d1c766c709f88a790734bc5a19b8970f41ea |     
  mips64el   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/c5887bbcc64f771ac8ad79e4978994fe64bf79ae |     
   s390x     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/409d08f111d7a40883e7ea7425a8b312b0d452b1 |     
powerpc64le  |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/ec94603cc8d1875d9c8300b30509e0e85e13b75f |     
    sh4a     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/4f97a343e902b5778ffa135502d6fa03ea05ac7b |     
   mipsel    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/9b044f77a25eff3ecb0588af89a831de2d6209ca | ORPH
 microblaze  |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/1d03a519915dc503e98f5ad200205479e1482f1d |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/74112c29b9a52ff4b9b23137c1a3ead6a0eef2d4 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/b917913655c2fc36e9731b69f69fcedb86fd78b2 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/64b7d58973c0f32c8920d0b20f7aecb4cc933c30 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/56453c8167baa968a36a94642512cda43c19199a | ORPH
   s390x     |          gvfs-1.48.1           | NOK | https://autobuild.buildroot.org/results/bbbacebe068063c0d8b36096676e879aafecfa76 | ORPH
  aarch64    |          gvfs-1.48.1           | NOK | https://autobuild.buildroot.org/results/5cd098f01bc1fc6e84ea1cdf1a0915f7519f8dda | ORPH
    arc      |         hiawatha-11.2          | NOK | https://autobuild.buildroot.org/results/3e11cf3648f11146cd176ef165ae08f2c0526b9b |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/14ce5f5dac9ab370c63c24511546e99d85996a45 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6b089d7031f1238fff4ab510daa7052d95334fb3 |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/88d336bd3fe0526980f4b8f0439f8081eebe1095 |     
   sh4aeb    | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/21497e5a6f7b6717b061f74c7debd83f3bdb3a6e |     
   armeb     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/dcd1dc0b4b1327cfe57aa88077a110c1d42f52bf |     
   nios2     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/b25bc6b91f22ebad69a60b48c5a190a6afe2caec |     
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/e100410628401fb5d1dfaced67e07c9d955ab128 | ORPH
    or1k     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/e6d2774801cdf354413081727ac8cfa6aae2fea6 |     
  powerpc    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/f995a427cf4154cd7903b7ebc9ad66158bd3daec |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/9cc4b41e37604b17b8cb4def459c9adaa1aaa552 |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/cacc647397a7bfc63bfb8c5d4c2d97507ec4b5a3 |     
  riscv64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/7681782c4b6f30ee87cd51c573654c3ca0c4a82d |     
    arc      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9a4810182f26fa50f26d2d939de9f4ec5e658a1f |     
   mips64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0aa5f56b040e206876bea9c1d375a7060d2814e4 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/c94be6078685762685da0405d41616cb7f5400e7 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/d656e67dbc46dd0192841047ea84d7aab6bd94ed |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/20227fe9f0b115c4d33a8a18270a5285cc3d26e0 |     
    m68k     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/d5191523e979e3e6bf8c81983612c2ba9d12a65b |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/ccf748306eefa2870c9e6c3cf4e4b0f037483254 |     
  sparc64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/69127cf59138934ab694eb45d27150561b168cba |     
   nios2     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/e6ab37f7f56731e7c91d310f65e836fd3b89e42c |     
  riscv32    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/2f226894a6b1ee6d379ab566ca6274bb7924b9a0 |     
   arceb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/093d33ce4888de0976d2c4f633cac36f7135a7a9 |     
  aarch64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/2ed9b9e69aaeffb3db908f1183c65ad837c73741 |     
   sparc     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/32791fb01caa1fd709a93ecd717d972f685598ea |     
    i686     |    libabseil-cpp-20240722.0    | NOK | https://autobuild.buildroot.org/results/839da9cf66a10f7bec1eedb0cc7bbbee7dafcdf6 |     
  mips64el   |    libabseil-cpp-20240722.0    | NOK | https://autobuild.buildroot.org/results/5458d5578477a738ddb79ae422bbd43ae8953206 |     
    sh4a     |        libcamera-v0.3.2        | NOK | https://autobuild.buildroot.org/results/15cf83ea97526a2ad7e6490975f62f54e10be664 |     
 aarch64_be  |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/5c2f004b794ccfe2add487c3e8f7e0fe2535cf93 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/c28f86c516b88009a60579dbc0a64afd5ccfd17e |     
    or1k     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/b0bca80c2bd3834e7bebbf39d2573be6d5236d2c | ORPH
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/e1308733cd222a75c33bee992e2fd7c006819ebe |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/d90d45f81ac38e762eb7e6fb60111f4b82580c6a |     
   s390x     |          libnss-3.106          | NOK | https://autobuild.buildroot.org/results/4c35c6f36886a58752a7d03460577225b8098cd7 |     
   s390x     |          libnss-3.106          | NOK | https://autobuild.buildroot.org/results/3e2861c18dd031b43c88a694c2bdde01a8ce67fd |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/c1e800526bc0130d93bfed938848dac891928820 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/d06a090a1a2e33aad6577f83b441026586b28363 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/a090f13d270d25a896f04a2b46a0a0a7f9691573 | ORPH
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/452da03d8e609f3accfb2bdfab0f586a14ab0567 |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/6675ef89a941a5e4d725ea89233c47c91814dafe |     
   mipsel    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/13a2e3dd108f258ef1f8483d04d7d9f5839fa846 |     
  mips64el   |         libvpl-2.13.0          | NOK | https://autobuild.buildroot.org/results/1e9b214305841aa649d122bfe7772ba0b73e8747 |     
  riscv64    |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/bf5c78f54b4e0ce921a607657fc92959d9a7ff0c |     
   sparc     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/87245379ac5141ed14bcddb9398afd2ca3a71558 |     
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/563c3698e68b6e1bdf5449734166dc00617728db | ORPH
    arm      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/0e9c599c8ed5f4faa74bc325e5b68bc2963aef10 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/b286ebf30fa54b60a2e47191b96163f29a98f307 | ORPH
    arc      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/b50ccc8ccc22be832b4d1d9cdac83df01dfed5e0 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/00a23789bcf39b30d9ee5be3f13503efcbf096e3 | ORPH
   mipsel    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/87ae00493cddb8e1d9eb399b315686fc166c7ae9 | ORPH
   sh4aeb    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/2c73dccf1726da6cd045bc9974fb628c72802582 | ORPH
  powerpc    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/0915c54c017b6cac94168e116df49e615ada4bfc | ORPH
microblazeel |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/b5222b33c76e0f51e7f35477c640dc3694fc4d2d | ORPH
   armeb     |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/45f0b8fb9b98d91d5fe21154cfdabb2dcada030a | ORPH
 powerpc64   |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/6c4efe79f4c3a45c2f6dae8f8ea8786358449790 | ORPH
    sh4      |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/f71ac415f2bf5d926875f2b2caa71696e00ecdb4 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/540d0bd732706bedd24d03a04384d46b21470387 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/0b9a7288648dad962505293a452d36f0aa866452 | ORPH
 powerpc64   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/a1823cf744902a6d72bf03d4783854c382b38a40 | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/a68a9a4e2dc2ca9b8a9fbd7533ffb1f2ce125498 | ORPH
   x86_64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/8450f57a18d23cc4feefad790de7d5b44464d880 | ORPH
   mips64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/7588bf2c81478d3e6383dba176057beeae2f7d34 | ORPH
    m68k     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/22e0bd2dec3711f3cc49cb82d4c5cbd109fe92b5 | ORPH
    or1k     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/4017b0894b1cf2c5055f8a7cadc99450d311adc5 | ORPH
   sh4aeb    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/9744601bb608bd0bf9b6202b7881fa90aad84fd3 | ORPH
   s390x     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/67a479ad4622467f2df2af72c5b884b666d1b162 | ORPH
   nios2     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/9efb31dfdc963d4562cccfbbe1c92c5b74d92714 | ORPH
   x86_64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/12ffa7eaab55fbcc785347e18e7f6bfea7816a29 | ORPH
 aarch64_be  |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/5349f31925b76ca6e761d1fcf73e8df5e381dce2 |     
   nios2     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a350e31b95cbd734b83db5a0a3ad2de77c05ffed |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1cdfd2657151e4ed5a443be229e584065a868cf8 |     
  sparc64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/231a73e92c68088fb7bde84cbed2d72771dba841 | ORPH
   mipsel    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f752af7aedef2aa8b1ac402b70446f3b659d72da |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/30dc975bd04c0ae0e721b39c2464378bc44b4bf5 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/92a0abe4599bf41539cc6c4022fbf31e7dc978e5 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/052c60a9dc73d09eb0106c8d41cef7a35c2d6db8 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/1389c85e48321747a384d51a4b27b48d9ec95ec8 |     
  sparc64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/3abdd091cab15d95757771f56bf138e36b8fb608 |     
    m68k     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/e63f063b8810825a8401020624333e43a2c62ea0 |     
    sh4a     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/65e5efd50baad7738ef9cc5b302e5d5a29f72dab | ORPH
    or1k     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/64e5977adfa363bf6dd683a33077e2c0ff477a23 | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/9c3c7cb8e95d700fd57aeb144067a37067604394 | ORPH
   armeb     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/f934d85399bf955431389bbfdccb2f8b38e0ae47 |     
  mips64el   |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/e304d6b7ad15d5f657d8d7468c4c835d2281c637 |     
   xtensa    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/3ef631321480712d93e0a8a34ac722277b681df6 |     
   sh4eb     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/d5ff3dbe6d1a8f74acbfe75b12b1058061f19a4d |     
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/82c69f1f4f988f317b959432cec0706c0d106e90 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/6c371367f67951f5918cece1f56b6769d1cb6c38 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c8f26050a91432381fa23012d4c59e84b0f63981 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/afcecef51e81f8e91533be2162329b9780c11362 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5df4c9d6feb6fa11132cd87cf049a139fbc917d0 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c4f2f2bf283e4e12c45ff751b0a41c65c5cbbc5c | ORPH
    arc      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c91c8b8d05cc178f8e7a1d123ff85587a8953e71 | ORPH
   sh4aeb    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/cf5de88cc0ace58e7140a721a5ff314424b58dd5 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/9936ecded741bc2ea3eccab1e06d901e052ef069 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/81966392cb1d01268068f51f5144e2de0102c0ca | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/94c482fbae408b16706aeb1369af2597df750268 | ORPH
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/f5cb75de3ad4be36719c217fdc40171576e195b8 | ORPH
  sparc64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/13160d04d8712fc391a088c85e902cebbd1b0bc8 |     
 microblaze  |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/431501c0c66fc54db3ef87563935768af962face |     
   arceb     |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/1533591a2e5f258108f7bb57d36608ac6f3d806b |     
   sh4aeb    |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/35e74064ab9bb072e56afde3b053d4c46955fbb1 | ORPH
    or1k     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/b24677fea294cfab71a698d0dafb34a834c3cfb1 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/dc492a1b9198213b92d72413b85eb799c8e26b15 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/df3ea64c0e9ee94740b419eda67d6b1690626b2e |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/e4f01f7725de0f0489dc73e5f7cecf9f0b79ab5a |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/e2d4b26bd60e17737d97bcabb0526a73e1fff3a6 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/155f07084b5c90cb981c81380a83cf738548c9f9 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/325200fe766e464006443d53066f873270ccb3ec | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/bd6b90b4b8deb0bb436cde53d681924e32e0d155 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1a8285e2ea84771d85ddc5c1924850a091791590 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5fb25ad0218ba1775aa1a1037a2e2ac29794fe94 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/375dd60de4bfda771e5b48dfb15018d4c1f9e8b6 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

            gdk-pixbuf-2.42.10 | 1 
           python-bcrypt-4.0.1 | 1 
    python-cryptography-39.0.2 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/4984274f9fbada851914161813732571ce4ecbdc | ORPH
  powerpc    |      python-bcrypt-4.0.1       | NOK | https://autobuild.buildroot.org/results/659fe442d5df6ec33097d1e09c78b945dacd31cb |     
    i686     |   python-cryptography-39.0.2   | NOK | https://autobuild.buildroot.org/results/f728703a4ced572e4518c92d8796fa42f4e47926 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                   foot-1.16.2 | 1 
                       unknown | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/e3c1b4b43301abe3004a87b84a5b697aaafd6893 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0874ffc95df5ad3ed30d30bb6674a1b29b032a9e |     


Classification of failures by reason for next
---------------------------------------------

                host-go-1.23.2 | 2 
                 c-ares-1.34.2 | 1 
            host-binutils-2.42 | 1 
                   host-go-src | 1 
     linux-5.10.162-cip24-rt10 | 1 
                lmbench-3.0-a9 | 1 
                       unknown | 1 
             util-linux-2.40.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/f642df891e991dd9c1c4e93a658165dcff33eafe | ORPH
    arm      |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/33e6a46e49c0a2627bb7bcf1ffa9fdc36e78e1ba |     
 powerpc64   |         host-go-1.23.2         | NOK | https://autobuild.buildroot.org/results/2f09f6472e2c73aae6d137dbc784e76820df4347 |     
 aarch64_be  |         host-go-1.23.2         | NOK | https://autobuild.buildroot.org/results/74e76f46994b1404ff3023b107c926642e6a9f93 |     
    i686     |          host-go-src           | NOK | https://autobuild.buildroot.org/results/2d6aeaa5218a85fc2173c4b535bcdc3259a74687 |     
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6fa742565d6a483a1d62b3ba9a74cc3554fa704c | ORPH
   x86_64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/07adcd7202b1d36b0b6baafd8794635e2e7c6ee6 | ORPH
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/1e62ca91c83995a6b42ea5c1c43b9b8a67de5c7d |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/9ca3140ecd68a8da025ce74bbafb1706a417593f | ORPH


Gitlab CI results for 2024-11-25
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8457357765  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8457360788  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8457360790  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/8457359645  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8457359655  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8457360274  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8457358086  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/8457360366  | ORPH 
                TestSWIPL | https://gitlab.com/buildroot.org/buildroot/-/jobs/8457360438  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/8457360500  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
