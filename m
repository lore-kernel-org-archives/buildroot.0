Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BB7C28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 04:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 704DC4F1CC;
	Fri, 28 Mar 2025 04:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbBEtnS9ME3v; Fri, 28 Mar 2025 04:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B82164F1C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B82164F1C6;
	Fri, 28 Mar 2025 04:18:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 877F51B7
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 04:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 642B040B30
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 04:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3HAadXcMepN for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 04:18:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A60940112
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A60940112
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A60940112
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 04:18:49 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ac2a089fbbdso310513366b.1
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 21:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743135528; x=1743740328;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xY3MLH9Yzcsj+hf611OhMKnKluriOtzYeKktd6T7ujE=;
 b=mYCLaphZV1sOazPB5Nzy4ASjpqlmxJPqh6FBmtrbpso4U/LwGaBNs5vXHg6pjuztQd
 0X7tnzac+xUAo5BXnSK1YHQYzCYKUHwukxmPzFtAFvhTBSgu1x4T6iQSqYd1ziMEl+Uu
 yvUdEiXVMj0gzMXJnWEq51ZhD/FkniH1QlBPYr/lMrlFXqEbQbhLxhqSbTV2f1CQNa8C
 8Z9Ytzk3jNTUD4IHfhl6dIzeLpWEg2Qrv8TtBtM8Uu5otG72ad6IPYg6qB59DHYmiuxi
 97iBiPhtfR7/L5Es08MOAilCcI0cAPsnH8JoNz9GYADaN27o3AX7TzbDbowf6EzrR0nA
 LdUA==
X-Gm-Message-State: AOJu0YyC9Ma8GFcozUrYk4RVHMPo7BMUX6c1NOs9HAs9iAC9+p1NfaKY
 OPbwFI7CWvzNcCbDHtnkCPuaubNcoUufD40Q/ZVIh3Z71LhwOiZwvgkyGw==
X-Gm-Gg: ASbGncuMwjDoso4rIFAG2J2IqpANq8cCYGwDu2nx/YtQe05MXpd7RdR/yGZj5bT1yNg
 fCFMIhkNXiaA/HCpDuHRoSQO3ujrnVa4rp36102zJA5CEfFHCTLat3bjjOSl80ulkArMDo04gq0
 mFRpqV1apy+O9kXURJZd8Y+dxJI6xhwOTWtMG5zXVItBU1ePiw/uAVH+SDZE3hxlvcT/C/cEd85
 uDdToYn59bVMxiiEn06yhHLEfafbU5RAPWHvmjXqfv4VKiTwoWAJqI5V7TPtz9I5e1W+B4nnC5g
 7LWjrEP3pBytiJca+TlIzguyp4F26Cl0cQc8k7AR26opbrb/
X-Google-Smtp-Source: AGHT+IGWOPYbxY4cXHSqoMYCj9M0DeERc1auy1cBQ6SOuFP9399U+RHsgFmHtZUtEs3emHBPP8dB/g==
X-Received: by 2002:a17:907:d09:b0:ac4:3d0:8bca with SMTP id
 a640c23a62f3a-ac71f85afbamr124668466b.29.1743135526878; 
 Thu, 27 Mar 2025 21:18:46 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac71972d998sm93035366b.185.2025.03.27.21.18.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 21:18:46 -0700 (PDT)
Message-ID: <67e62326.170a0220.abc55.327c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 28 Mar 2025 04:18:46 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743135528; x=1743740328; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=xY3MLH9Yzcsj+hf611OhMKnKluriOtzYeKktd6T7ujE=;
 b=Y0vAy3t3QbhVYl77xohC9OIsuhvHxlwbq9YJF1y75DzHINa+jPmZLqAFfHyqTkI6Ir
 D6U5rFZR36eFWe+cMjYIUdDpJI4SvpqufBMXc/sL8Hz4BClue1t6Q9jZ7OXqOzzglyAl
 tMb1K461bbcq1GLI533jgHKLTJ50H6bzGXz4cQ8rRWDAWDGDj6n1SSyGADJ1Zw/X8hrm
 Ps49rLQ4DEnKctYZRvHxQQjXBx5Vb4B6+R2x1tN8TnTiUpVeiwkS8ZyGLQvZX7mbSwpP
 Ph4MEOVDMhd/JtLEDPib5MmasjE/dLRRYDZQeUJPFHrkVKPqYhoTgvb90dQBUM1yb45r
 QsfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y0vAy3t3
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-27
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

Autobuild statistics for 2025-03-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  6  |  0  | 12  |
  2024.11.x  |  2  |  4  |  0  |  6  |
    master   | 17  | 953 |  0  | 970 |

Classification of failures by reason for master
-----------------------------------------------

             host-cmake-3.31.5 | 614
                host-m4-1.4.19 | 56
 host-binutils-bare-metal-2.44 | 55
            host-fakeroot-1.36 | 53
          host-binutils-2.43.1 | 36
               host-flex-2.6.4 | 29
         host-libopenssl-3.4.1 | 13
        host-util-linux-2.40.2 | 13
               host-attr-2.5.2 | 12
             host-libffi-3.4.6 | 11
                       unknown | 10
     host-ncurses-6.4-20230603 | 7 
            host-binutils-2.44 | 6 
            host-binutils-2.42 | 5 
            host-ccache-4.11.2 | 5 
       host-gcc-initial-13.3.0 | 4 
           host-python3-3.13.2 | 3 
               host-zstd-1.5.7 | 3 
                 openssh-9.9p2 | 2 
                acpitool-0.5.1 | 1 
               ebtables-2.0.11 | 1 
                host-acl-2.3.2 | 1 
              host-bzip2-1.0.8 | 1 
               host-gawk-5.3.1 | 1 
       host-gcc-initial-12.4.0 | 1 
 host-softether-4.30-9700-beta | 1 
                 host-tar-1.35 | 1 
                   iotools-1.8 | 1 
                libesmtp-1.1.0 | 1 
           libzenoh-pico-1.2.1 | 1 
          linux-5.10.162-cip24 | 1 
                    mpv-0.35.1 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                pipewire-1.2.7 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/d7f5f5585e08c78c4619b10a2a0c0c95e9599cae | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/cf90072fb59dec2a4a8d72a463f2c0fe6f73783e |     
   mips64    |         host-acl-2.3.2         | NOK | https://autobuild.buildroot.org/results/1c2b48c117eec8a2d83c09051d3d0036b83aa8b6 |     
    i686     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/7ea8f287698abc8b37171e60bab544fe0164556c |     
  sparc64    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/ac5f8a09979ef5543b1267cbc5fd95f7e258ef53 |     
microblazeel |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/a8c8d9d1a37caf5f24d34d8551414647c64dedca |     
   s390x     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/373d3c9da53bc6792244838d76d46e9a7338f3ca |     
  sparc64    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/346faf40410432f31691035a0ba0c7185fb2776e |     
    i686     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/266ca8ea8c143e734d0827ebf3fe76aab6f434e5 |     
  mips64el   |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/4d2c11101c64a6c405cfc32150b50b38e596bfd9 |     
 aarch64_be  |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/acb5d22c7187afdf8d8f631e4fb6ceb03d83d3a4 |     
    mips     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/89ad082602907259296638b7e470a1f804e987cf |     
 powerpc64   |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/95f194bb58d39f1372e4db305adbf345ca1525dd |     
  powerpc    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/65969e885c313d8eb7eb0a33ff8cd3aef5ca9646 |     
    i686     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/de664f379ac481c345eeda5b6f69ec1ec104d87c |     
microblazeel |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/36e683d9f7d0872d19ee40f34f979dc08bd40540 |     
 microblaze  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b82e7164e05fcc466376a6242a60dae43d94f6c8 |     
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6573fc1696b46484800a23a71f74e67d9b77215e |     
 microblaze  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d9172b9f49c65a3d2fc95e6fffa6f280348634f7 |     
microblazeel |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4f22bff84226a4ec1ea528f301a7728f74bc1c69 |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e64086340e2245068f9ca8dd18f721466fb6ba6f |     
 aarch64_be  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/40f670659d7fef56ac11008cfb84136915647c0a |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/251bee43b42e59ab9095561bc7ff94352f05640a |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e9b586a9d1730869ea7ee0465c32f3a1d4e49edb |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ad9dbacc7077e107d2d48280741b1f43e7c87c11 |     
   sparc     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f726f1d45d72d7e2fe0a208cb94f4ccf2947bd06 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a7b9c774819ff6588ab938a330bd0355b5f88a3d |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2fb154bedc6588e35af7391dbb8e60bcdb64ba2d |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/03073901d43826aa1cb9d6104cf1e4de8cd37d49 |     
    sh4a     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e79123021f5e0d99936b08f038e916166b1e6d32 |     
  sparc64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/aa0baba84ae56ca01eabbf8349fe93ab96223d81 |     
 aarch64_be  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3b25c2d19c84c877c15885d29d980f67573a4b95 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/114a014c600522fdb23492156cc1e496c5cb9505 |     
   sparc     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0ee8e55d7a803d9670be51b1d7b8333e709b5800 |     
   xtensa    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b2d7775196d1956e2a4c26c5f8609b25e3068fa1 |     
   sparc     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7725cd23f3947f4119f1081f01ef8907279817ba |     
    or1k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/265fa9a1764d2d0dc6a6fbe9935f1b87f3167e7b |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cd3cad75678325cdc9d7dc2a7e3af793e6da7351 |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/aa5545ceab3a29903104ad7e0ba92b59ed734518 |     
    m68k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5c97e1a857d204454c22b09d37c4062484cb2a3d |     
microblazeel |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/913c2c6d7874a7df6d38189dc9c06413f042d12c |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1f6ebcc7a64b5e3889730e75eea76227a66535d1 |     
    or1k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/aafc498984d15b53ccb6c41b1e620cddf29aefd3 |     
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b92bc656681a0c34343cae2631fefb2e66c3bfa4 |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/102aae19e107bfdaaaf849fe7054d1c7454674ff |     
 microblaze  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1bd3f0e0b0b9e3c75f4deda149dab91e28eaf48b |     
    or1k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c3cfdcba1b987c9264168a63a04e67a222c6eb16 |     
    arm      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b6f292747a0061fa69c150724477b798990bc6fc |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ae104a0cae89a413cf5f179120a6df98ddef9fee |     
 microblaze  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8b94aba26bbcfb750f52d6e8817c4a4b6d8f2241 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/01d0651a47efa07d4c487332b8fa16bc02cfec9b |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/360f26cfb9de75c6e857c03ad577bc317cab682b |     
  powerpc    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/310071988917e3b0aaacf55c7cdc7ea5acb46881 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/56a480a74872ac5cfb45977cd63a88c106c74a45 |     
microblazeel |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a49ac9d51021cf961bee457e48e60f82d647c09b |     
    or1k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e640e69badc4b465858bd9ab243ebb33d14137ea |     
 powerpc64   |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/cdc2da05003a3535b74ff9f1e66d856660e8a5ef |     
  powerpc    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/2977fae03fa32a68f6fd344a76e06f7d949646a3 |     
    arm      |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/88f40b2ba9a55f06b00627f9d63acde36be64685 |     
   mips64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/b72bde941df7d397ceb2605b645333938f638f70 |     
powerpc64le  |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/c2e6bf8fc17761722aee545b04a9bf6f1f209b62 |     
microblazeel |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/0d591fae3614ed468df207f16ffea174d56dcc86 |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/aa1bf924c9a2116456266a3bc1c2f5c2ed5255d1 |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/c4100bc165aff411093ef5770601d8cfbfccfd51 |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/4a102890f1e841fd3306e3df4b41e12acca7b8a4 |     
microblazeel | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/c1203b416848488c1096799bb36a4d146868b6a1 |     
   mipsel    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/b516a42970f72e4eb951f498b1c0ba8e13143f81 |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2cc43d0b3c9a6835db15d8952a1d4fde5a2cab59 |     
    sh4      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/26df88e274e59902a08c4b3bdc719fe03c525ee0 |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/8d743e59b5e192bcb0ff94802d02bca6da1380e6 |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/6a8b55e2e4073dfd878219e227365266909f50d7 |     
  riscv64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/5c5cd8b857eef3a0760c53f522299a863d24223c |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/b431b5910b469fc368d5cd5aaa8731ca7bf5988c |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/bc4fb6f3c6cacd7d50e96d298c8ddbf1ff4e2387 |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/14ac9470b817e88db0bb838eabae2a7e73efbacd |     
  mips64el   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/c4739432b4f7e91ee7d11c8fa636f3d1b6118183 |     
 microblaze  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/1b80cb15aea732d62ba6f419c4596d13172ba05f |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/f90aa5724cc97450db8c2b7d90d87cc8411cd09a |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/48603287ec9f8cf6918e3e4f96935b58c7117497 |     
 aarch64_be  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/38d59a01211f26b5dc166c09b5be7d14687a66bb |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/1f4d0ec2821ccbfdca0e3bb89a08b4a06bbb4490 |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/a5ba63fa2a3b60efe4aefdd6809d7fb8f0b59108 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/4d51e2fba7417094df426c6c78d1941f8045b8e0 |     
powerpc64le  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/cdea1422619af588ba32d6f057f351007d197bc6 |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/b81b2475a59d21a2a7697af29bd3c0915a12faad |     
   mipsel    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/d40751424dd937cdb379f7522f417678b9151d89 |     
powerpc64le  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/6801c8bb6195793b0e5995d06496d3d3305ec12b |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2a5e46120081d07e6c740759f98825eb9c993a3d |     
    i586     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/24b8cef5ae7451b1640cfaf35043cd272df16f29 |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/20ee1b0e2ff07c73e3dbe4ab1de2ddc73c886968 |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/9e8619a6525295004a33ab99b6e7c8b876431061 |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/f70d790858d93fa7028774462dc1c96fc0e08eff |     
    i686     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/da059bc4c62c43d358a0042e14c6cc6636130580 |     
microblazeel | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/09669fd8ade3208b10a1999029ad69909b810cc9 |     
  riscv64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/0cef37b3c632cf7a7f7f51f1067e5e7d03684cb2 |     
 microblaze  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/b6a4f3956c4248fcd8e7c4dd09ecad257c275f6e |     
    mips     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2a08e0f9d14809954e8626b85b4aecf40d48f4c3 |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/7f98589a77d12e0a1f5892b425c723501a9c4d23 |     
 aarch64_be  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/09e3acda716150468e9f791f51cccee58a2903ba |     
   sh4eb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2f43b79d599d60320343c1b0ea5aa165a4962f3e |     
  mips64el   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/99e5cfe60f636ca212477a00d25aa4735f010ce6 |     
   sh4eb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/5f073ab7938682a8ce84cde16ad237ae0c38d608 |     
    m68k     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/17d623de53e9da8dea10d528a4de767bf96a111e |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/4fa38a70c5a26efa2d9c32c296b032fec0378e0a |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/eadfdfb5fcd0d821020f45e75021b3ebf0f772dc |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/567fdc0f5bcc1d50cc28e1c20b38ccfffcd41ebe |     
   sh4eb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ffb018c8239a09ee4659a2153fcd81283e1989b0 |     
   arceb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ac1152a4bfd416254d2d529752f4b17a7d975495 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/04f2178d5f38bc5ad5aafdfca6ed774e506f8932 |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/96aac67308504a3dc5b1ff529b166861e84ec47d |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/41bd4e05f3c3e0dd292041f30efa40d885b2deed |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/77ea606b38110f0872e37d2ffc08ab8f1cc98657 |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/9e0c7e425409732d9a05deffdc217a604b545e06 |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/1f44d8dfdfeb1765c06a00626d162b80a0551287 |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/e4268bd6bea00ae8ff5093f98677155c49aef74b |     
 aarch64_be  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/43e9a0aec3b48517c37af01e8a16e5984662d4b8 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/6c4fb03328809365ed7859d9911b27cdfa8548d5 |     
   armeb     |        host-bzip2-1.0.8        | NOK | https://autobuild.buildroot.org/results/26b11248f60eb6bbd4bc33ce5d1f038cbfdaa780 | ORPH
   armeb     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/b38e9a12b1b7e2dc7ef3a8b199e025b18db3a47a | ORPH
microblazeel |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/d4583ec1d7aeccd99bc165bcb525c9004db46341 | ORPH
 powerpc64   |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/430c465fe54f5271abd15086b2b099564066f5fa | ORPH
    or1k     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/8d5afc200352990a24a2459a901f04324efd8e66 | ORPH
  sparc64    |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/a9e8a9dc8c2b854784fe25900a4aab12dc24672f | ORPH
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a90d0e7c0b3d403b881b2cdfd12b14181ff20791 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/14d52826ae33eac896a3f85c8da2ac0c776293d4 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7456ef10962a15d9853bd821a0357af681f62550 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/476af4b48cb4487456a67ae0beb117b7f840be4b |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b85601723eb36007eee7c8761e4e93b126932377 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/52fa035c15f04a7b01173347072bac4ee72c8067 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fc119f29046e12df297f24d9077ce608fbfdc456 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/48241d9c63540205ba33a80cf6461e00fa6284c9 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4c35ac6ad7c005bf1069b0ea928965fc3db8745f |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/38922c29bffe7d1269c3bf18423cbe21a6061ceb |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2ba5e8fe5a7f583880cbdde7b23ffa127fa18cf0 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1ffcdf640ee74174a24fe38db4ec354a49ecba77 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c08705e41b259788053686b1311eaad024a2015b |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ad0c1a34a62f0eabfab251eddbd8b274975ad774 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bff9d097ce478aa56dc0ee97fd113acbfff3a46d |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a5cfb08a765f4e62496560518cf857b1b120fe29 |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6cafd5189721a9f4b83e5afdb6bbb65b7b19f64a |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6fb2ff0548dea883922e6887fa199ba058357c14 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/84b026eb528f2fd41d1c6a5a1f3c2a87ec841203 |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8d274e9779b6ca9940562bbbb444b87e2f5c80c0 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e3013cc2f523bb2d993261bf7c2dfde0423561f6 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fec9ad739db82bc5f0cd295fe8b836009ce563a9 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/54fa5ff3da3e8909100384f870e749e65ac3437a |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/debfcc03e8b1f13a9ae0fbd31517b65f71f60e96 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fcfc3934164c58e127fffbd47c9c57cc0f950442 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/135f27c6a5e4787c11f0215d240405ce2143b431 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e0ed5131ba911ab4fc2b8f351e19d5999efb2ed0 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4b933b44f197a299842e9315067d2569f9162def |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b43af352124d4b7e09d9ba93b19942935f1b9f0d |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6a56ff600a50ed290144d45dd5b332a4b2096d93 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9f46e6ff296bb3bb4dea7a92cd34e9d300b723c1 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/138d12a696687655f87e50ca53617c8232d2da34 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b9d11e0e4cd068e3ab16ffc71e01b0ee2e8d0b89 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ce63fac003cbe985e93b9eec9d4df413f17572e8 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c2a70d2e88c85657a6ebd51934f4a8bed1a98eda |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d4d88adad79bd9814c08564166660f6357318541 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6a25bbc246a51f7681fdf852ecba02bfa301f1bc |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a25d37362425ab29a78eb4fd59f2709ba9c09e1d |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/055cb5b3428606e233c2d647a48e33d9ceca070b |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8ff6d8c3a03767de48fbbc6d98356137c70a8473 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e70917edaafafa7c8bd9324607fdcfc906e33487 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a565b920e4023a42729b493af9708f3abcfbf38b |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a987d7ea516cf85fed8b540f5e61cf744db4f2a0 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7c3f22c3caa6aa81c56163f1a233001666bb22d4 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1038895ec4b42c2f6df3d9dd8ecea7dea0797e4f |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f5f6bd22a67918a06a4a5258ad5c575cff21ca15 |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4e4162f63b8ab8f88ef458af1968904f7c24685d |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b1de270d3affe0b08fee5b5ace25ff1d0a259b66 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8a5ef17575b5f745a473ebec98320537c32a129d |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/672d37e3ad7cdce2e6d3236880721154defe48d0 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/672898a22abe803012495f4e507e0a18388df001 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a9366e52e24676062c44d35034cb9d278978c05e |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d159a76f98f5855f080993433e4e721cbe84a19a |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/79eccb4dc8b6ac75fee6dab4397b40a7b6cdfdde |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2837a4fd27dadb7031df1ceae9c0760a136cc423 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/383cd280f40f052c96696fb786788e91e835a349 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a92ee41a117b98c7bd1972ac1beb4306260df151 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e7443a321645c7e5450d88045a30add25eac23ea |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/374fde70b5f30e4d8751aba9a48d239bb431b4ac |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/98802afed62e453b59d4b6e6228ae7ff6bf5dcec |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2a4db9bac2c179128c5e36b2bbe02505001263ef |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2be55cc76df1269e1081b7914b3750375a468f15 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b22e23bc8bff43ff2f2d0ce6a920b799bada3660 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5e78ac33782555a1e1c6a1e1a8f5bbd1147292a7 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8ac3d19640c00b642480f5a41de38ee91d3b2655 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9c1350300308678a20bcbd72f6540fc5be2cb42d |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ab75d81b250dd2ff58c1583161c64b89dc8aad63 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ba5f9a0b272c8cc231e0ade4d5408c967c77e2c5 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0822f0641f88003bb03d5928eb19d977523c4090 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/454dc01298e40a2b4442cc659ee3122b44c7a574 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/afb70f5134808caccff015015b36f2a17c52907a |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/470e510906b59a2e4517715870ca8e623e85813e |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0afd4887acde714806e4473d2d2ef91c1c599bf7 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/888361a231e3f46e951b7592b772ba75fe484175 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8c8ca598d561ed318c8b9423ecc94b883a119a98 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/301563e65c1fb8b559c5f5b24d86bfc14155fc1c |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7640dff0a5d06a262d2e3465470e1a61d9072cfc |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f9e90297ffff210c4ce136732816e368a7c0e2bb |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e2ff7e5aa8a9820b882cee91f01f6eed9bd6a195 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e18f652d9fa11e8bd182c787f3b83c9dd8c57915 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8a83c402aaf6949bca8e299440f1cd3100151117 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9f37f2d33482e7fc0c164494a799cee480045c68 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/909f85e0d4167215b409fade1cdac3810d317a86 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/66c2210e7ed00f96ba1adcb61e9af6fa0263a8be |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3a0dd5c4115c5ffd732ff3425c240baea43aad25 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0ccdb4dba8762a78d6b1f1eb9e13fc49e2e485ce |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/08b872a284985fbe6872a62878c21f7ab90d55b8 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/eb338f41f55f2785f7caa2ce6b269ca4c6798485 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e088dd06abeef996c321b335dc4ff9c57618bcc4 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8131c7df282b076be4423b1dada2ab4992140e3e |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c6b2c0dba10f0c50877f502e29acf4514336811c |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/52ab1853f441709f87e73ca9192952d570d3d597 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/40da61c001d0b844efc7177e8a890d2b4f1d3837 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a39df2a4fbfe5581e6c99f49ecb201e8adb89d89 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8169277b084e334ebc7a81f11c60aedf24bffd71 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8180a614f4e62bb7a620f5ef8b716fa133e82bd3 |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/52083f514b1e3e2599e8aeae4ed84c39fe36b364 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3d6e609aef0721450e098fb82659ba57a7ca1fa7 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6cc9cf5de08af86a6fc903d4c37992bc4419310d |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/97225c5f500d440425ab83a33c47085bbc12a731 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/119577a6a792e03928fe725259d77f450d57a8bc |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/68248e32be688f3d18c93c656ec638f647c99746 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/eb1b63318c0fe005f1525f81681699f08baf71df |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d5d8a1986aa4026bef46f0b4ae0313b3f4f07771 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6c541e054036fd3ca95ea2b67a57f43b9c51b8a6 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4d28c43cb07a60189b0adae9d91001e603050334 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/272b35333ffe0ffbca861222afaba8c286e57c10 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a9d94868fe8833ed2978d4a2826b147ebbdde11e |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d27f8bc196067647cc07ad522fec43ebeb28dc08 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/542213fc066011eb530acee8be981b70ce405028 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/274ce21ced45feae3fe76fb60f73159e3ae6e2cb |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9c53e3ab2b8c6d23a9670d9c24bf4fc84de05202 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d416b2349369b88021235c627770608e8b8d1b34 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/272f733be44051eafe1177334d7cb7cbe93bf0fd |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c6f8d3263c40090203f434884235f86eaa2d0662 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7e500524604e403e721bbf403dee7f36aef86bef |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/af0ba1f6a0adc585b4f827104b91871276d4b0a6 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/59589fa02bef2a886f25ec20ca2f8fd86e3e48f7 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/70bcfa8c73ac014769442a78d72ffeadffd2b3af |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c89d1cb7e1ae2dfc25fbce5375c7831fc91e3883 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/536d922812745e4a05159b2290aa0346bfa8aea5 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e4b16bd13e9e8818fe6e132d3bbc255917f6cda5 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7105af34b377b6cb6554cf69f07c854ca12e479a |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e01b15217fb15774ab32a5b81484b7497a9a4600 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1f52b286bec539f49c83d1ab9f37e53b7dbc97cc |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fb70f0c94a57a85bc11c07fe27beee4cdf13624d |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/706196dd170c2dce7352a0f97a5917b0fd381d67 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bccd467bcad5633ae01e9f9aeb96ec4264b4eecf |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/305052c0c59abab0fe0d07dbaa79f7216d9b0929 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5fad0da85cbdf2782077c1a3d823362570354258 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/225cb2b30602843388cdf942202c83eeb3767e62 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bd2c9348ae67890a328e108e87b4427a6ec029cc |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/84285b08a4a9eae413c358d7a9af762e031f7a5e |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b96d28e4cbd4c233b445e841b612b8b8ee69e5c4 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9477a64c050b3eaa6401348fda05cbf4b2404cd5 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6aa743d22dae8e1792641e12df6c5c9adc4d1eff |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1059fa17e49243f14771ef2dd62545cfc464aa54 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/89343441550047877ff70b38d919f4cb0bb0edfb |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d83f7fac1881b62dc2b27f3460d0173e2e34422d |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/60a4ffbec0ba0a964e75b1af3ee700b8b04c3c24 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c2bd28b97bf5fafb7c8dddde5387a26eebc5e003 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/61e9e64fd9fafcad05559df9c229ea18025dfefc |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/37f0bb2916bb5731374428f668675097f8b065cb |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f70e1e22c76f1953ea22feb2fc87068026a8c3ca |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e802b989b75ea92a17b31846cefe579063aa412d |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/70b16bd649bcddd9aff9439236918cf56c9d2e67 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3dbce374ad8b19c362ff42f565462dd742c62534 |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/51cfee4b917162f32069f95743c32c1a22a818c0 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f4b77e8fd57ad9cef59b0a216fc965b7c80c8649 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/70107e846af7253be4c79647f1e19e0c1b94479c |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/30abb7c5ebfc27ab5b2ab9b0e7ea2e2457fdbcce |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6e6603c3d0f7ea188e600ce1f9a7ee2d81a60411 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/eab6f8efb3b4c5d425fc94a84fa7a9ad09d17bcb |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/235240a3a7c18c27ab57904af0389982d6418063 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e35804b9487ded8e96e6137cd7a6bc31ff9da5c0 |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/72b328999b60172a562f6a87a992e618e2be38e6 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a48636d21b7b6f78c53d614c8a66705dc8287214 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e48bdafadbd573b8d16eee14c2f872e26f5f7359 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/baaeca2eb64686f9f11c9412d7c4f84eb75e9954 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aad0bbde5a69887c7f4b52f8ea56702401dae668 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/16643e8ae3f29234ccc623ac89c4b74cab9ff15c |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d8a6da0781822a57f0e3f96d38dfa05083655f1c |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7fa32a8390e945b6873e1c76e4c7ca371485f918 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5afbe7eaa4d28c961012f6f8d87097cc96683d4c |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e16afe7e9ad81510618954e441c07db5f2ef5042 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/94788fd51e4e7855d87a9cae8edfcd9878d5d916 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7012297b915d1e0a7eb1a832975c149315c8b781 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/17985d68028c0a84c621626efec56b96c5dfb060 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a47709ac7528d6d488c105cde0c74b3793d3b13c |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d932a8d6ac1b519f8f8cd723043766ffa85f0b0c |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8839d1681403b23e0ab3c686c6dadf649cc92b43 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/39f314f91cd2be3644919b36136eadcf4614f172 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dba05affc36e9d02dbe55a3c9fcae111758fa1dd |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/22a64021561547615d43b97b0aeadcf69a5cdc26 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1b1949b8b0034d7b3d31deebb4dd8347fe90f179 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2d9c109994ef24ee451bb09b3d4dc31d3e06480e |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/29a0e2c38e3271bd11cae71d8260ddddbdc892e9 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0374186a1592886a93afb282d29d67ea5059c237 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/386c2189fcfbd382a2f2d1ba5f8863a48bb3036d |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/76429dcdd3c4d1b238e0f96293c1c67b1c7e08fd |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b961a0d69f86b8657c791e07656f7a95e0a6cd99 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ed76f47eafaa59973e2cc1bc37435e0f96acc28c |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c2bc62fa8dcab38ee823c18f0a68985b34f4c152 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8461a45d3e5daecf26c6f96f227b37c326073d4a |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1c41d16d48f454a812dd595ed1fdb8b3cadebc81 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b90572c1a86626f6ff5ad2c31bab1b089a0bf938 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/770ff499c155f776ef247adb8bbd9bfce9a26758 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dd0da17e9dbfe6794530d61d37715b818999064f |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8e0d925bdf95ad4df7b54f651340347d7fcad4de |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4a157138d3c95cc8a90ddc98e8313f56a02fbfa5 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5ac23bcc6d4a43fb05618359928f3c899b5daa40 |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/99e75c0f12ea5195413cdc7a979215764c813e6b |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ccd2d5f7c8373a02f43808840634c44a2e171df2 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8fe2c3dcbc11f94cdf4d8028b5178f721323a30f |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e673bafb303d659203ef551e28af1e34cd6d8e9e |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f2f1f32d81c89d703f4eafff63949641fcf99c6a |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0942125a75c0042a2330746732585d227f10e341 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3b6b52e73921cd5255956699f358d068d011981f |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2dc1815bd0e33dac909b0fa57ae8e415d6cc1e0f |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/333733cf974e01134457a940d177113023d10d8a |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/97979aa5dbce0a58d22193151e9fab4133d10465 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8c02af44883025a2297acf02b5244a7636ec84b9 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/46ce548d6d760d14db54c3b406831b3a0a5bfd33 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/03900ca9a417d67ef6fd9c8a473d3190b713b46a |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4c5c8140278f5be562751be3b743fbca3ae9eab9 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/19690a68c72f5340f7c47c8774cfa375f5656b45 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d23b53729735f3fe79d2068a45a6eee5affd591f |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4e900fb72828f0b3512eff5c53acda0076bb6b0a |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/99054553c606b7139687d9df856be77a824bbaca |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/819a2dc9e5635321414888b417362ef1cdc25255 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9f0514467fb971f1f436b54c2458cbfcefe35b2a |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7a89a2eb9c0b3e2781cfea4c4fd68dc41077366f |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6948dcd63cd29a90308a06169c847182b68cdc66 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d0bc2c95d32633e9c9850b078a2c969639a796e1 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b78484255a59fcce8d356ecc6a5ffa41f33c26a4 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c360759c0b64399547de4b1235a331eae3a1bb1e |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/67a3d6e2e2b5fd4a1a459e57c721cd34ae986649 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e82b81bc35f065420529281223dcfce19667822a |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/33c93024aa444fae7a7d2145aa5963ee196e7389 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/535b992eb3605ca87669145e5e834a3c0bf613d8 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a77b899091f3200c3c27c672f5c07bda6d1ceb49 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8eaad528183881de27206570ec46a8328edfe78c |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6aa32871b7a73368ad7f6dbc2480cce9a5be9b6d |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2c799da3fda3b70802f02400b7948c66f8b94471 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4b4d97c71a3100629d06144c696167d3cc68dabc |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7fd2cc24df75f7486b84c52f229de81593a2c289 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/508d0ac4b3a09f1ef5f80ef044a054ab8b6da902 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3fd3d1585b2df758379dcc1eab098c421681b7ae |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1f4d75722484b5bd3f820ae8d39e9e78ef0d176c |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/860f7d4523f409db3387eb62aae3c22a92d1c029 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/62be537232778956762db7204d58356e60d857c5 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/769ce1553e9832fe558e1a38277d243d179d28f9 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/26b284964a02a50ea42a747cf1fded0d32528b86 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0707b7dd9c44527007266fdab06de8215a275c65 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9496ab5562c4d5256c6c118e5f9fd58a9459ccbd |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aac95f0277cc19279625ea4f54be11d802c49fed |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5a2518624f2a002725fc749b0d53d9db11508e78 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1773046b38845b77065b63547d1954430820c5a2 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/23f3b0d088d150fd0397eeb72d5ec35a02ea92c1 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d53b55260bbb0b66df91aba5baeaf16e37591b34 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2b5c1aa74d87af10ae47a8dbfb0081b9cd23ff7c |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7d95f3f77d99a0658134cce7b6af95e2c6357046 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a7fb4aaa533a2c54ef95638866c2da08b9cec77e |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3965d209825314cbe92ac269d397594b54089db7 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f380c200037f4cbaa4aa09ef9d829f87d6676746 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a4c15eef7773378255dcec2f1bef1f201c178bab |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/418af0454a73f1e858e1fdfa39c6654ab58336fb |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/95b3a313cf749473c374039e5245ed6ca2f5eb06 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2ed00ad62b7d80b4daf0fe2f2b696194462ec5be |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/22e5db4d1fb97c69f7f488df78614f9aadb59ca6 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/19e33a1443fc542c41543d724fc6699dbb88eda2 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/93e35a224937bee003747ce8d64b9d7a17b7669e |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bc10c70d8a053a466e13d468d541b1d57d30d036 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bcd588fbc85411c70fd40f56345a74d513d1352b |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2797d1a2ee3b948e9864d7af22a8cda47d8e0194 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dc906fd5a8e98911336196d450020b879617bfe3 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/054f6f2696afd1e91fa189a0255e3c337a1d03f3 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d43fbd5cd8303752c6f3b84f16b8b9e7cfedb330 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b8a774f147ecd871577467c9b29b8c7b5b4aba18 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6c0c720e1a59f37d0c1c1addbdcba197f30175c0 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b1a4117e64b8f8b21ded6b737632c135b85e559d |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3a810f51ab7159f11c2ee32feec4a355105de821 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2ff836da9fb99672a47eaaa4305398bd3c48f0c7 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d34315a75991b3803a479e16afdc8b2cd4e2c368 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/eed29fc32d8b4f794f599be3dd5db41bdc5ca7fc |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/754ca1c8c6e0a2dcd410688953efbb497148a946 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6f7218b62fb7c67892d6919b18667e8e5a5f9c7e |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/70009001b27b2e2d60b995723f2a20d06b66c4d9 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7e3f9377292eb484d8910a84af3731029dcc79af |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6f00465ab3769b9d29c9d952a941fd4615747754 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ff3d6bcd01cb9acb015a42eedce52513a1a6fabf |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ad9c6bcebe087b2f93fa6a5defc8adfcb54792a9 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7504884c3f539e219f136ef991b0dfe23df34e1f |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/173cc7678e0aa38c83f802f496053345fd644e10 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ae91e365d168bbefbc47480879a86fc970547723 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/56096678521fc3fafd0f1f0e5098a9a19a8d588f |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/461a2bb6272279008d114e4cd2a96b59c36bfe15 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9b2405eb2ffbe57f54834d89585c53daab77ce35 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/64f9cca70370de3a672c0904b64115be35da3c2e |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/50311668afdd0da8c0ae012a0e6e34bf2ea499ee |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e5ba6e5970bea42e461ecea0adc788874b497ef1 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a5e7a5970220f68a5efa036df6865f9d34337a0a |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3a6382d13f6c1c55967c5fe9d45ee7dbaa1e0477 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/073dafc84cbfeb1af1fdb314fd7ce72c557a6dc3 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3e16560812632954cee5f77813fbe2c7e424fa4b |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5b21c1e42648127d9182841f22f7e533978dd2b5 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6380aee87e2efc62b72db46f863481640c16a33f |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a744376cacd2fa431163e6ef806c27a2388c5f68 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/22dabe0cd324569970d72f5f720e39c132940bee |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3211703a1d071366bfd7e307f6e543725218bece |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d7b44f8e06a5e0e7dcaed4546a0d2ed17c046f86 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/990fb46c2d84a8b44b5333a50424a3b115056828 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/36418f066d0b3c1eb746f148a5b5f222df4e360f |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9f9a8b0232313f0505b4190483715d6938e004c6 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1574190c5289874734fd6c75b3eb8e160a1849a5 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/83eccfd7886e720a00c25c691393c72c7ec69250 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2cdbcadc8a426e4e40fa002a765202553c3fb24b |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f0f33b5fb47aaea3c72f51e530248b33a5a4477f |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/23b53d7aac050460484713d55640aba88d8b4ae6 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8ffa184d23f88db9e5b1ed8113becaad21395815 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/792bfc313d4a0490ca9704dacf039c61625391d7 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/08b930405d5568cd492a7fb2a3d57e9577ffaa24 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f0e872633ec963d8ce9b1d660a1db5612957746c |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5ea9f58bef1bb92f5bdf66bfcbc9b1f621d4d12c |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e2b1fc2b694aa1a2cddde066ad3f1902dea17e0c |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/68312b5cce7315ad5f8d3abb05a1e9fb74a3b478 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/89ccd3d856be537fc9f2bd4ad50fe8236f6eb3f5 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c0ddf134095c39e7a39410f4febd630f8397b5d4 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6d9f42d17d3f4f0cafad055690f82c59930aece6 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f59bd947ba2051f09ecdb7c29778c7f44b9fdbd5 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8f753866b6ef65828849d697a71ce4480966c71c |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3829a657727ea083f48af24f5ceae1bb854225d8 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a5f0d54e22f60e1c0eb31b318053c1b5ce6efdc2 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/61d5a8f6ce3989b36be8f2d6dfc41fe599dc5537 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cfaf60adb8572ec0a0694a7b8c06edacd83f223e |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/eb5bb8ec58b6b9e93a8e4d613530fd46728ba669 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1ea11cae592faa47a811c0b681a59ec17d36c249 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c2a97ab89639e3e452e1b999046dc35538952c54 |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7277b7efcd6f53ff2ed5b1a7c120d2304a507d42 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/37b0035584c8e79f66e3d856686816d91af9653e |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/22beb448b846a87adbc6dba8a23ce9abf77341ce |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/643381bb7df115f3ddab6f0d71d9a5c772d9bc2b |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0eb5b5b091f5144b318c831a9834085ad87c5d2b |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/43cd40adb4c0ca3d23a073ad6546030bf7c47c7f |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fe3bc0d67f224add33dd31732d519f2e096ee5e9 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/48068f7c28fed5ef5ba5015d1d0f30f6afd3e810 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ec779533b2935550ee388d5fa10413fff0a88cea |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c19e62b21b0aece30ed3b0bdb086b8a98dd38ecc |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8a156e16d48cb7e1d9558f0017a1d1bdbade466a |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a2d454f5b9d32b8a8c85cdf3c25ad05ad5345f9c |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1ebdd2967260daa4a89458a2e06f1423b52ddadf |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0175aec9f226cc125c93b6d324237e3974ebe116 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4199e34d97c2f45633b6b7e57cb70e945968693a |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/417b28323e548bf7090461681bf99285f132c696 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b791569edca99239cf782821bf2a812bd991d09e |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d6bcb50998f297a34a32e13042bbb796035de143 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/474140efdf44b84b735ee4c94c492f2da864877b |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/165e56c23fc3db5d57c7af6d1580cd4b0b0600e8 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ec47496df3fbcff7af7d9600a0d9fc3b533480bc |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7726a5ee84db0c79e768b303794e26e0b854cedd |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ef27f47d1281bce8b751851483286ae6c2635b67 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/07be9e89eb3849cdf4fdad73997c84a1890873e2 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b28919cc4d051dd85a8209e71995765acd6d2e41 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fb2e0805fdf24c59d5c0c33cc45812b32845ca9e |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c2333d1862c2c7ad732de85bea400cea0a11d998 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0c5e3d727ddf7b2544285b8dbca16868ec6bc3ca |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0c150e586c92c77521a8ab6fc929133821690e2e |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e5e254b00cb27c525599388396f4b8a69ef7f43f |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/14fd558ca9679328ad6ca4c8766c4770ade85a72 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2258418fd5700a1e312c19fd3e01f0ed8f4f925d |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/465b41bb43aea4fdcfc4010f52352e941090898e |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5fefcd5ffbb6247005024f074da0494183280100 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4cd294f052542b5999c476f98e3531a85f1eb173 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/802eddaa4f89595d4b67adbf74316f331839b9c7 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0a14490239daf5d23fa59ff7cec2be0b404aecd1 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4db2ddae8f714c88b6798a1961926b67129833d4 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/31b9e3aed586166ea7fac5eec14c2746a5e5b339 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/570f610d1428eaed32587a8b1ccddfde802b63cb |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3de5a7d340ea8bcaae39b7cb6c91225a63c9b7fc |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6c7bd20d396c471b45c9dc0e29e1dbac2f1004a6 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7f06510b8303c9fb69cf6386db6df3e53f15c980 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b1fd55471ef78f59cd862809426c01e1850b60ae |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/832283898e411ee24665dec971ecf93758f91d65 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a8ebf125cdf53256c1cb2d81bcbf0e2ed47e6ce4 |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dce9a51e3c69a4e2229ed28ad7c1a8f984c966f6 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d33df658822943a27155c19df83f12e3d7634036 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a0708bbe80f64b1fe8a3661936c63b437ea50711 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/eaa256d049b6da7f107137193fdd560fbdfde167 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bd8f43343f9b37106054137e1b4e775874190a5c |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/846fdac6bd5773cf74dda065e6552721c1365ff2 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e1a7fcac7628cac1a6be4228067baa33070094c3 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d38b0eb5d9ddc3e01c0bac976f662e61e7bcec00 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b431746d2e3a023a059196931d807a50486d6eaf |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/49586870e885d2c8b1c7cc4423725291ff877117 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/86c6208e289b70e02f0543fe2a39b98ed6c9139b |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d2c339b76f8abbac730c5e11b4ac84a9947fc91d |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f05f79df14be9404e441d3f12dd48703efb697cf |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/44c14bddaa0c41848d522870566dd8b1cce96b7b |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/94a641d78863b7b5e4cd1fec47f3fe4e26e80e6f |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/99ca7c7c0175b49a6f4bb75f5129190c5820f407 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a830d3685562b77ffdabcc5b4915a2cdb12c4c81 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/edac8322e8950287583878b46c359ff56fa9a7cc |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9b83730fe859184a7ccb3d816421e928a6e99087 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ede3944920449bfade8215fba73116f7df8e3771 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ed116b9ab8adfcb118595d27c4311cee704ade16 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bace70a83e690b86456f9bdb9d3c1cbe48b461c0 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5bd466a509647ebbff740a65c807f93798147797 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5f767fd31c41a9ceeed97a9e9cc3111919d20319 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0d9b6080cf91600ad9d52fc81d0615de93cfc7b8 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/610cadd5f71a213ac09360b6026bab7d046b8186 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1239f8198cfeb4c9be9a22c5ec2ed98ea62abd3f |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/214f143d3882547da02e3b41d067493478d5e1ee |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7684e9e66cbb38ff9bb36555ddcedac68953688d |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/44593b9dbf42fabd6b59e4a5d2d1ca41acbc2c1e |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/593f8eaf0aa2eee4ac80beabe4e1062dd0404735 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/82a4c4372c150a7a04ee87257184cee6b8e5b59b |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/50dbb54dff54b0a8c50d2e091b9539ce94615e15 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6fb4bea9a9f86ad5a4750198a573cbdec019ee0a |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f3ab689eaacd1920e6f816be1ae96f585895159b |     
    i486     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2be5cd68c21b19bd4d84e750b233e2b7fcd087f0 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3381ad11eeaf534d2af6bf524160f41f8c41f504 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fcebf4f31ebd1859c05f721b66e9e0d04e19c3df |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/68792662a41e261bed1314bb24a7b85e4ce993db |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1bff369a4bd6503c21c363f91e77b473956344a1 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c90b39b0b5f0009e802b468b5d369b0abeb17a76 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1b5c0f44c874dff363632964092fffeab8614bfa |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d1f7aaed21b19c7f547312dd00dc0ecedd1c0701 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/46da93f956326600e283d84847b1d8e9c22523bd |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9493f5d1f6e2ba05af6f6c0bfd5f95423250d46c |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3d862650090d35057e28744fa3f2bbbc584752ba |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9427633ed72c483853a258e65025a0301554791a |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2f3df081e2e97ee9658ce9dc621c6972c86360d3 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/367068292b80d1e508c20df095d95a08e68b8aa5 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/68276d6264fa37bcafb1e0937fc839fa3d830d00 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5eafb8999370a71fcdfcc57c655308d9f656e852 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d2b72ba5e024454d836333956cde8801799e48d5 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/10140dcf43deb88de18c9882a31ec810dc20a27c |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/170eddde0071fb502617b222b0b53cc67dce7447 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1f037a1288ff36b619450535a81e4028ea7ef074 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3f000c530ee891be9298617447a3b85f91948990 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f58b1f26e724410eaa69c82e690058c98858372f |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4b698295c3e9846d0842ff15c760c615d66cb177 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9391ed48b683879aeed0ee492809c6290c0c2846 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bfe67e7fe26d6931c6e5f00f04b25ef1c17c2226 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bd6a3564dd02a99c3a8fd204909f230d9bc5322d |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c61b6088af40dd29b6d88490f70daabcde89c213 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/965978b3043c4899ed1cc12dc905ea3883513d13 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fe36566222b696c568ec5bd5cf26cc12bdd57508 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9b25eacca4d2198a76a36eaa102052fa2c0d7613 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7797944a63c730f5186969606990b6723de146a0 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/af0ba50d71630380856f2055a513900411f0577f |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/76f73c5345758765d7f6c238c78764a7f62e7701 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/943d1308dc90a1fbf0267ec62182cd3434d366f9 |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c9ee807954ab2a59f3b36e43e53484b4979404d3 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/92cae6919a3d9eae7c303e252e61a8f2a8a35237 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8358581eec73cfc1eb3f84e0f3bb9eafe74cf909 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c8f1c511afef262448bbf11451106c5d2e9e1f35 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ab554499055dcb5dc19d17d9e2ed9769713583ae |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9d9a6c9e265396803593e5e30ff6183112bd3bb4 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/931643a20fddb350399c6b9a5152d4e12d76740b |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/00626907284a601e93bf3ee1016aacd0d569ba56 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3e52dd1a128588e97ee218c350647fa7f052ecd9 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/456ae094edc5818a42c8a393a4816a4bb49a38af |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9f640e024896c1debfa9393cc91f347bc6a679a1 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e5cc86aa2a7be9f6ee44f781101d7313a635309f |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/35eac0458d8946982eeda830f49f99e6b17f1755 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/93e6e6a673b2a2409c035d2cb5e6a077c80d6b8a |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7b1f02604314b9a545b69540c3cc7528b2e6c171 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b9316f5950d8289b111f9f248a410fbf65f83b16 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6eb107d8adfa033032595a5eb7bfd9168325244a |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/29381fb50f34669963375e566cfa58582f9f531c |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/131670e3b8e6ff3417967f778578329d0047d776 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ff706c10d13c0b137a105310c53cc22943bdefd4 |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d3707a62ee59811f0005abcf0ce8a6e240e0fe43 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5ac4c5e9a34cded49037ba279072d8b79f5be59a |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aa11f748953dbe51d3734c2dd2843cf455039acd |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4660084d5c224c5c613f45dd824343356f186b50 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9ef992d7ee7bc37286ba79501bbf270222b58201 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1ac19554c9430432c5147d96183565baabd22ff7 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9f5b78eccd3a763b051b34890b90f9db8474dd60 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2c8f5af7a4a11486b748906d5113bae089f90205 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/15ba4a2463264abc99accc4cfca928f0e415b5a9 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/eaf131871765b8cf3d45d75f456a30f37072c183 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4161825d4457e62f3bb82037b9996827d1bbcd11 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1232686eed73c236e00d8dd49b0ae1a0d655d916 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/329677e8262e382ac23b269eafeab359a4c2b318 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8c6d7a323841c69cf266343fddbe711a4ccee81a |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/29e0c430bfb4bd68dd794d849b896b47b234d311 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/78748f154c57e136d1c5573650e328b5cc1cf33e |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/44f3955240e7e99b801f7b75c303bef0a5370ced |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/94e3cbfcd37458598d73d5b2ef42cd0f5cbdcfa3 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2bf660646452328e4f964c1f9d338ced3202a9de |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f4398ec64d96063546b4857105dc9bfe4486956d |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ec5bb0c4ae93bf3f7891ac5ac3e456948f366523 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c65ad1783b65bf46f4bae9790e2cfef35d1de51e |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/20acecfad667f436d875d9e9bcf6ab86c270e101 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1eaedc7a674ee401e9bc39a384eb9ddb8a0fee41 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1672ec14bc48825b2621d28980dc1118b2b0949d |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d776ea4a697f1125fd5b3b7d749076c2f70cfc80 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c256c1bb0dd626c0978a62494d000c0be4898179 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1da8bf11ff8b948bf2f50ba6a383f1b511cff323 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/77959d74459f5832568805cb175506532655c6cf |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f2d682f4b451856afe5be314118cb80461e898d2 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/176c071f0e18dafad86da2fc3dde2a87845f1a47 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f022e56c8376cf069057f3d4ea051eb6424d10cf |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a7de5404254dee33ba140bd2d1a0f1bdc168c7a0 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/64772ae034354bea4459ad5e2128b9ca7ef35ed6 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/138021caf2598c5c3c9d372aacdd919dba16d83f |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e4c72c1cea279e4bc8fbc16d4f304344ad6a87ad |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/576475fe33b76567fdfe06b77cad735d22223d00 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/74ca9d7a6548db25ef88e914899074ee004aa12f |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3ba451b184e3d858cc1166e948fdc36c340bbb4e |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/84b71101acdb2baf947a1eaed55517eda2970eec |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9da85706aa5af8e1e81799d7a6f62c9098f351be |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d11806c1beee1f64dce79651f33a5e300d835557 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b31185658d83824054503b6831b9204565e658e2 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9ad6e57576212bbca87892fe95739c5dae50d7ed |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b214630b3a0a76da0316e88ce22f8cb7c70f3a02 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9eee2c000fe03a3e69bd81b58c452ac4f48d3038 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0ff7b2f016ce1060b01c22a4e5de51f77c4df830 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c80899d9adf0000eb22bcee829a72a47c5801298 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/61ec8dfcc589c40b0cf86432a9c60931bb567f80 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9a0b8e5423d5587355a22c51b481e735f7868316 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5aa968137decd9c30e521eefc39655c71ff54376 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/48b85265f53dceda1a1dfe4a38493eb1c90afba5 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5539a4d9f646e45562d8a9bed179a0be95bd4ef2 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d1d71aab493ec5d2150adeff5417fdd5c7a958ad |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1cc898ec5e568a5f7cf459d8ba44c8d1165a67eb |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/487f76ed3df5ee3422f5db6669ea74aa847cd943 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e499dd0608852fc1a8d256a4fd3e2d535acd0af5 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e2666e219aeba530979c814fc9918bfbac0545b1 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a562442e0c8d16180996aa2ca8f12185807693a4 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5e8dafab24a29b6c347358488fba7803b7616b68 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a3afc490b09e6fd647a7ad8750923e41f029e3dc |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8c36d63156cf3151197ffcbd78d6576bb7667715 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/56c620e310b437abeda798fe40315ee418fd9671 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/eef7e41b4343dd70e55abe9921655bc66f884d93 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/066d412e17f86c96c07f52158cfe194628444a6f |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cbc4b5dcd5b759eb52f1d268031ecf1e113092aa |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1eeff88bf5a98725f6d96d0ed25d0e9f9bcd5913 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/186b07c917e35f66d6c038099317c4bcc39d4f38 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8a0a2c410f5e9fe26d77b565818e8d64a45af030 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3e65ca3b305ee82213fa26f64e050332a4370fb1 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/17bfb5efea1f8d4ce66df3a6a93442b501fb1031 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/370f6eb6b29fc79a2cc1dd52b05be5802614aa55 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ae5857208c84db8c424a6d463ee5f980ec5dd189 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/be779ab784ee3b5eb119a775684f7da90d15d95d |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f329e345577b48b1bc0487fb85fb8454321b7a85 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3e6e119f16918a7a7257198d4cbfb18ce14d4211 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d264e354eabd02878b50018a7e13177894e5e047 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9bdc03ad3b570d013f82251594c627526dc539bc |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3c0fedefbdf730a5e6505eecab6646fe48968ea8 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9f5e5d2f1b635a33d436a6aa091f9da57fb938f8 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c78373967ae05b87f0a1d646811b18d72149b5ad |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/761a4e5aacd4d10829c24bbfd14b1135fe24b6bf |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/af4fcaa95a83e3ed22db4a40e2e6043d67324051 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/22e9e423a2f88057121dd89a670f60e8a3183c54 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/eb54edaa82491b8ecba28b6db7f760a39fb8fa1c |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/62de712c4b40e21f35bd8d4f4c4519a15ade3d1a |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5358676e47fcd4e719c3662ab039ca26a438385e |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d6b26ca6f7ebc25001d6af5a54f8eabfd60ae3ed |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dc6dfe403ca1f77dfdd0f347ca9e96701f4e3de9 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c44ba7a38a09b371da615b8dd54ef4b7c05cec43 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ad4c69b919f83ff59c9bc1eb400c0a7107bd0f81 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ef57a2cdcf91cbc4c49705307aefb06c95d54827 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b8a35cc3813340a5e7f7c3b114d3061bd1305565 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3d6e7764f43aa15ca4ccd682aaf771f50e808f45 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f6854bc551c08f81ee2b71bd2568addb20dc8a48 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9d6a7ce9902371180e4d1a3d79ddb7ac1477975d |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9516f01ef0a5639a60c927c3f7728e06f620a41f |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0145a427386534455709de03076d151f33f980f6 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3c036f44e2498b33dccb90efde9aaa63b12422a2 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/da74baeb93c73c1113f043093b82d628c31adf3a |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/36e834f837892f155ac9789795a4a8558f91b328 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/568ef2d6f9b8875dce577364748c08d647489a65 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c0ede48e6322d878a1f6b5433ff45498bad96733 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cc7cdcef4b5fa6e5fa1c44afcf985e98268e3f61 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aa1f72b13ff5d76da13c4f347a4ef2f21e60feb3 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/de509a3125da5698f38c84aef303c9c8d4e4435b |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0868418a3d1e4e6d36c96365761b77eff7fed75d |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a3df1bf0fbd3d720814478eaf5e446928f745929 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b48dfda48293185168d18bd4251db38f62d03e92 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/af1f7fe39fff023d99830a61e39458ba7e55ed08 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/99847fcb479a79a33bceb5e6ba58da6a87c5de39 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f39e13d29bf4880fa0b878ed246cf2c41b676f51 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/519a3abd8f3e143b8104498f7c713b5d3577b47f |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/611000921ee44496d5d5422cb5a694098cd836bc |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aebec11d6fa82f210036bd3343d9b7ec80668545 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d3a6e2a84f30fc3a364dc9582575952646620ac1 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/18d03f8f42b328225bb959e7decd06e937fbc723 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7c1bffd5d6fdb4c224cb2a04664a5c9e56aaebe9 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6210f478cfb8f69f861806c1a5dc721f496ba15d |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/58e12de2c76646e987a5494a4a88348f1dc80786 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/738894f3a7a5e3ef969ea8a0e364ab076484d4c4 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e464534b24fcbf09550fe027f1e0eeec52d242cb |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e490defdd2ff071d528f64281bcc608e7632b4b6 |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c8d0c531dd6127c15fec1c35a20a856f035c26c2 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/17fc5b80d9907b97231cbcb4edacaab82c2bc4dc |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fc220286f087dbeb3fe19a6e46b0ff8921ad97b6 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1cbfd1c49f40c3b5dd8a49b461286581e25dfb5b |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b03d0be3d0dc13841383cf2f4a5f348f7ad4e800 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7b1d6dfde06a590b2170785d4a393b763503df68 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dd7014a9f8dd9d6bab7e2b1e2232073fc77537d9 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/132a4c5449eec0003b4880d9f14e8332650de33e |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6cd855779a9f3daa65c72fbe0e917957b66a4139 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f9eba6e9bef75ebe89d2f8ec773ec7033f4b7e50 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fcdb72b47a1e1b900d6fe97ebccd38c7f55c64d6 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6f7c502d5fe4d601dfdd56a06f0ff0857fdbbad6 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/278113674602e8f66dfd2b93bf3a98fbc0c363f1 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/26cb7e5af97bd17a9479a6d4070a38b9e9a1dd0e |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fdfe8aaf625a5de0ea0c6b090159ef853ccea659 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/850cc01153991f4665284a2c70b84588505556ce |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9aec85606fea09fd1766d432ca1bc4aeace0ff3b |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0b707accd8627deb11ef22b5b7205b0d93efebfc |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a5085cbd5562aea80af97b16ed676b542206034c |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a3c566515aca616a625f9ea4662f994046282f5a |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fb904801d692097dc169e403f5403f71e4b21455 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/37f287db019f100a3bc9420bd16be02b2c902734 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8b0612beecab5ff458bdf6efc11e60b660d3fcee |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ba2d48b85c221ebb46d3dab6680056e58448c7e0 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/62031e52d9901fa721d811beaddc632eaa987ac6 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/31ba3858b4ea0383a6ea45cc6d9a5a886d845d4e |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/80a3b99b24790caaf258cf0cb91c71e78f1b1080 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8348ad13fa7e3ece0e52be2990ba3969eef070be |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8658b235ed593e62c8e4ad4e7ccbac1ca103181f |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/68d062a6104a89bf87cd76cf987b19162237da50 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cfa17df995d3d85d7c868bb397cd75d04df111ef |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/170a44a90d8f3af3853a33741999dbbded156cf5 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6f2abbc6091ff99356e00d812722f08174e9e262 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0cd5bbb217098216d3fd9f3a10ffea7a21df72a5 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/da2a6e6173a359a0c0f5e58caf9abb6747253308 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/18cdfc97640881989a4b671c10b89133b260c58d |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a12ba23cd576e07b6af75e9317a1a58b062bb597 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4c6b3c7de73452daf991bd50ffe9368003b44d61 |     
  mips64el   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/cac97a3441828409768376b9b4b1729c505256b2 | ORPH
   s390x     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/b6042a698a395c6895bc5bf0f2efdf4dd450b87d | ORPH
   armeb     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/18030c6a921e860054f089f623072815412c5742 | ORPH
   mipsel    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/a78a9cf757b608f5d6998606d397984ef0b70fbc | ORPH
   mips64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/8410b53d0a9ac316428075cc8de5d87eff9b6eee | ORPH
   armeb     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/1124761047d00f97986f1e603067a40209a7c7cf | ORPH
   s390x     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/23146dab751f6c52e84e0d09b94b4b8042a0cd33 | ORPH
   x86_64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/ca3b07e2e5e6d75e46c39b7b7773330210f40510 | ORPH
  sparc64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/d4ab06a67981af259e166b3048a4d0f7b45a0fb7 | ORPH
   armeb     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/796cbd387d644ee053652b8b29d6455bfe94e237 | ORPH
   mipsel    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/b0988a642b689a68472c3c759327c46843e1feb6 | ORPH
powerpc64le  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/5d6561af4a8fecbbb3b4fd1634442a79306cdf41 | ORPH
   x86_64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/0617eb986682ddaaeacee95fc4f4a5daca2fed89 | ORPH
   sparc     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/8bf1d0eb0bfe1dfa86909bf36d62adfa22c9ddc9 | ORPH
   mipsel    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/97bc9f6c70f10fb53552ee58c078982b22dbdc49 | ORPH
    mips     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/2c8f571d71139a42a3dfba922d655d0efba670f9 | ORPH
   mipsel    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/7f1042edfa4d9807d9a4f5c27709b91b426049af | ORPH
powerpc64le  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/4a493d579f00487215209438aa009e1f229b196a | ORPH
    arc      |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/ba3aacd1e61a7ffde28e0152c87c83a97054d94a | ORPH
   x86_64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/381e896d93143f0016b1e9e4ec1d543fa010e8e5 | ORPH
   mipsel    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/abe7af412ae1cc5a2d61d95990ee6b7ede16acf2 | ORPH
    arm      |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/14b86ac618338980f792460aa48acd6c2a588bbe | ORPH
   x86_64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/07aead1babbec3db6ea613ddd4f15b25e320f7b4 | ORPH
   s390x     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/c2332d42ded1367deb262833b0dfc65c4865f6c0 | ORPH
   sparc     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/dfacd962bd7c9085e38ffa66c410f612dde16c76 | ORPH
  mips64el   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/de4a2ed2b8b5b6f6ca4ae552038740ea0924d129 | ORPH
    mips     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/588f621c78b258ab09e2eb951c05bef40a419f28 | ORPH
    arc      |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/11421f304e3cb5fadf24e771adfd8bfe48c88ffd | ORPH
   xtensa    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/b90c5f7eff660ffc0bbfe2cce808db0d46583606 | ORPH
   arceb     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/e1a2459049e66e347fa9d3eb6d6a6b8aedc20dce | ORPH
powerpc64le  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/560bc6104859257f481ac5a93ce2b3a3287007cc | ORPH
   armeb     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/24f53b41e210b21d478d69107aa6861ceab25843 | ORPH
  mips64el   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/3a39da0740dd0b707924cffde7e50ee6a3baa8a9 | ORPH
   arceb     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/1a6325f07558b14bb80d4f98e02fedde3c4a94d0 | ORPH
   s390x     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/4c5d95a523e30ac89b62d3b9f880adad686b4949 | ORPH
powerpc64le  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/043913c217fc52459a5863661a71b3d21625aa6c | ORPH
 powerpc64   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/9773611e9b27219f684017d1d6b2e7474f63e70f | ORPH
powerpc64le  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/57bad62362eb1e8562853cca76da784ca9925ff2 | ORPH
  mips64el   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/1d29e5db799db04470da50a6a9259b6e4aa965b8 | ORPH
 powerpc64   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/c1d623da45f228ef5a0541984a1ebfb2e7da8155 | ORPH
    mips     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/d58650bf404e294a4d68c3fbce95034778034b13 | ORPH
  mips64el   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/230a3110fbad51c306bcadcae05662d816273e0e | ORPH
   x86_64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/88367c0b394bb3db1b1825177d204be9e31de64d | ORPH
  mips64el   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/6365beb0a97b37c5a362441882e16f4463dd08c9 | ORPH
    or1k     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/b7852238728b78216c9a44e88d7e34c619025ad9 | ORPH
  sparc64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/a066d18aa2821eb424f5136a51ac13d43e5ea677 | ORPH
powerpc64le  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/a742aab55f7b0947d57761976cac4b31f6086481 | ORPH
   xtensa    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/96f0c16ff74f6cc9a57de9b099c6488261449206 | ORPH
    i686     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/92cc76220deb3daadc5674962351e726241ab0ca | ORPH
    or1k     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/eed9fe28f99354d71486fd649ad69e985b3dd87f | ORPH
   mips64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/2e618aac91ad9d5d83f5a2488444e9ae4758b506 | ORPH
   mipsel    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/5b5d2083803afa67f4ceed7691d5a568f8326206 | ORPH
  sparc64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/bd81b6eeaa8089e2c2fbe1fbb1786584a477a498 | ORPH
   mipsel    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/a2fa035a7ee68108af4178b6c2ed9c80d1625798 | ORPH
    mips     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/ad4d3fad88f04a5c4b39108441a07dba3102ab43 | ORPH
   mips64    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/89d3308e5c315ab18f024a41b58e3a03c9cd9294 | ORPH
  riscv64    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/d0c608ac225871804a8de76f2f7c7408fecbc4c8 | ORPH
  mips64el   |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/7483f1da298b9598b671af4593a55bda153020b0 | ORPH
   sparc     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/40d11cdb6a8237983afa05286e2992013b8676b0 | ORPH
microblazeel |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/d8d9c28beae4fad3e2110125fa6320a8352774d5 | ORPH
    i586     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/3aa60a4d9adc3243f4e0f6d50c7c0fc6c5510dc4 | ORPH
   sparc     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/57454d7365ef3780908f81d4b3d47de116a8cb0c | ORPH
    arc      |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/2338a2bbd0082b1b72194ab17e8ae2a291376388 | ORPH
   mipsel    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/d66757293c44403d79978800d298388b3a1cca8b | ORPH
powerpc64le  |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/f8c06e68dcbd0319eb5fefa7ab24dd63d97c7be4 | ORPH
 microblaze  |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/62fbbb2b262abcd70e59ee83113a26185f3a9541 | ORPH
   mipsel    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/e584c6ceb943f5336d212779126136f751a2dc12 | ORPH
  riscv64    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/4501c48421d0f25a97e4aba48c0afd30d847c9c8 | ORPH
  riscv64    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/f06e91f04c092ca2b9462905913bfbc8e209e9e8 | ORPH
    or1k     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/24cb8b7b23a0b84c083053c3c6be79c6ea4899bc | ORPH
    i686     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/7cee3d9262842b50e4551f6158adc03efdcfafeb | ORPH
    arm      |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/4a84193b3d990f4a51565768b2de955ea5413c1f | ORPH
   mipsel    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/1c2ef53a42a0d134774be7482c9e428a5d05f9ec | ORPH
    mips     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/7676f75049de755b6bdde3ca8c940d4eb8804ab1 | ORPH
powerpc64le  |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/652b868337f8f0d7e5b90679e42a92e33be422c1 | ORPH
microblazeel |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/c20c5b8e064713346ce9835fc505fbdd6baa5229 | ORPH
  sparc64    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/dd4eed507de9d0600f320c2d9e7ddead51568c1a | ORPH
  riscv64    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/74a29787b0dac5fdc03b8d276aebda371d778f17 | ORPH
  riscv64    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/dc8927d20c93d37fceffa95b2e31ecd1abef2e63 | ORPH
    arc      |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/5eccedb247a6c4a52e720d0774efe4e1421daf2e | ORPH
   sparc     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/8de49cc921d6633333b51915cd997b245c4f5c36 | ORPH
   mipsel    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/c2132e4163051b6e811f389a9049ae1fb56f422c | ORPH
   armeb     |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/3b6ae459c7d3943052f3c136cd2484c37f8db9a3 | ORPH
   mipsel    |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/33081ce10e4af2858275e88e9a2ed59da2466437 |     
  powerpc    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/939e51ce519f811165462bbf413289e713de41f3 |     
  sparc64    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/34b0b6122a90d0c81f44aa1862b704569b4eae39 |     
 powerpc64   |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/2789a91103637ea9ff03e8f8326bee5fc6bd1b01 |     
   s390x     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/77f51a8114891b1f2e38dc47bd7ba3c8645083dc |     
   arceb     |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/795bdffa1a39e2c8a1cd0f5c02e7fb7c777c83bf |     
    m68k     |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/0ef821caae589939c7b6e906f147c0ce80bf72d4 |     
  sparc64    |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/d2e7d98fffd50111f8e9841470527e82e1cafe39 |     
 microblaze  |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/930cd90efbb55e60293bd2216bb1a9ca9df95264 |     
   s390x     |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/ec90335e6a7982bedc084425a9854dd5a84e8ead |     
  mips64el   |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/15db0fc4905a4c15f68b15ab046d38ce3abed613 |     
 powerpc64   |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/7e3d3976a27fa242f59f483afcda7cef58749c0d |     
   x86_64    |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/e1e005b0b410fd2dae8c21d35e6fb090e95529b9 |     
   arceb     |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/50bdd6046e4e4c8aba38490dc96a45caadea47d2 |     
   arceb     |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/d737449fe4fe2d8973ded7c7a5ef1d73c5407f65 |     
    mips     |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/a8fe7f1a88af5466277b6561da09ff2fbec65054 |     
  powerpc    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/df2eb87b1f8d1e4bde64d16f8e42171b6d5a27a6 | ORPH
    i686     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/212e497a9b590023aa72f58823b3cb750da8a739 | ORPH
powerpc64le  |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/456ce7711c04fe4b2fdd10258a17f47a26ecf537 | ORPH
   arceb     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/9d1760193b03954c48661c4b2f6ccfd0341b8b4a | ORPH
    arc      |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/9a3f9c9dcf26285c4c2510194cedb91a73846f6e | ORPH
    i686     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/3f61d26ff49e504e514aa4354a4e5c42641eb9a4 | ORPH
   xtensa    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/50f66a291774436bbe637b67587a021bbafcde9f | ORPH
   mipsel    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/95abc86d72bdd627083793b312abcd56589c5e8d | ORPH
   armeb     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/010f31dacee89cd6478a3732f68c802083a2639e | ORPH
   arceb     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/dabcc7648cb4f26879680fde5f07b0a80fc1e084 | ORPH
    or1k     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/0f9b39ee63eaea179121372e637f3591e48420db | ORPH
    arm      |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/d3aabcdbab4059cf4d9db9905a17af90220c653f | ORPH
    sh4a     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/a4b04de5d3b614e96de4dd207db91207f18ff680 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2debe4beb85958649003a45355b2691c6429706c | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ecc2a85cc9f744cb486d00fb8aa4d7e94b291fa5 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e38a269abb733e6343f43e01273ba4800c3cc2a1 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d1bef0cb52b03bdb94f07856b69a37c458816815 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0d61569e9e47de3e6086253bec06d4d4ceef178f | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e30f9e60faaf75bd1e6ace7e97d8cca0f61dffe8 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/017b96b5f10bc3e635417eb15dbafa3d4f59704f | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/03d001e8cab128b04f849c13f1f217efc5ea87dd | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8451d5ffb190612dd7781af7e8af1f02143948af | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9b2f62f00a1daeb1f8177cc32a0d2da7c93e33df | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c91787e688ee98f686256386061e87af8692f3ec | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3cdc0387ebeebca3330e8f42b2d17c732175974d | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/76b401b1ff932a3d53cca6062ccc1c0b60af33db | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/291acea0714d68554fed7c2101639db38c50ec95 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8548dd952425b338b6d5b64e9ec4e56530adad55 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a532cadc58b77711484e25f9349e5b69db17c80c | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/03825edbc39900daf14d778e27e84e9104811bbd | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/95aacac64c9c2ad989acaf06b8137abc794c40ce | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/83e7bdfc56cc995506c260cdfa5c0b2c4960c898 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8e66d201017080c8b47e798b83ed1c201b1732e6 | ORPH
  riscv32    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b523cab70332ff21a138c9893ccfe32a65cc3ec2 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8b409d733455eb89b98efbf89b9c8519de6b0f7e | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b47ac7bfaf6f03b3ec6e15b85216c8cd7b0478c7 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8ed2e9568bcd89687cd45b70557d65892e9a0795 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/33868b1acf0e3da5e91d924cedb1829b3e996ad3 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f433d0ac88c5fa854d41258dc33af24c089c4557 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d3949eb1038a185d7fd5aa8e3264d60c4ade0fba | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ea8d333552a6135c673645cb7738990b78a7ff53 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ea1b7098d4535ea7e5427d182aba3ed0641e3e34 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4ca62f2d938c4fe29856c48804b0d13baf250116 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c316c7d92648a25d38221f11347e67bd7a4c7f1d | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fea5b88b67d9112c86fece22481242e06057dfc8 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e9dc43ea84d0131e7bb2f202a2d0018a0a652845 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/da1af2571fadebf399eae372f753292db76718fd | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/16d5dfcbdcfe4e858c43737cefcd61723f3c6fe9 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a591a4d887bb8826e0c4ebeae72155bfd8b77a42 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/64f4985335a844b8b0751f338d8e8aba0ef62194 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6373ef1c439639c0f48e0aa771c7ca35429fab87 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5049c3525762c4abf1a7d277c00a8cb4aaf05145 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4418d53e4355263f6164abd48dd5402025abb32a | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/77e545779b3c4b85e21adb7cda88aac04da9bb4a | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1a6bc105cc94989ebbbdde9b25be91fe3fc1ed97 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/565a47132ac94982727f7c51d0ab3944968144e7 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/eb340adb2060855bfa459addffefb03e7178c36b | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b573343f7b9f80f4540a6c24e9995a42619a52ef | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a2e45761b634809bf01d2edf1dfd5ef239ce4946 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5fac82afad49e1328bcccd792ec30643fdeb5a84 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e4a83f32963febc8d351571e52285b24e11a2fb0 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/41a4e3f936b771ab417ae68ea8cf0e03b2ce5c69 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4bcf16e67b2a860a441a9d061d1e49a79817dde5 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/772d88158f387cb19e03f34430bf0d6fc6cc8011 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/316fa10a700a68eb8f51ac8c16f94a978b8fa050 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/777e328313919def0d0327ff88afa0fe4e2a8de1 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/504333f5a808d9bfe84d4150048d4d0b596cabd4 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dd2dc86cf538224cf67d276d32e50c6cb5ad0f1b | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/631e1ca6ea1fa722bdf8b891db8012e1010efda1 | ORPH
  riscv64    |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/0238d121d0a9f5b66f77deda2f1f3c4dc8d3789a | ORPH
    arc      |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/5a3f95695a02a2cdbba4cea8611028c7ee2f5809 | ORPH
microblazeel |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/cad55dd1d20cba66a353b86bbbbfc5ce4581be91 | ORPH
    m68k     |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/286d59ea5d703a17ca588cee2e9fb7a5115e949b | ORPH
  powerpc    |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/fc665ae1eb7e0a0f32313e412b3c296dce142c8e | ORPH
  powerpc    |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/4cbe067ce55ea091326e23455784eb772bcd4b27 | ORPH
 aarch64_be  |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/fd03558567994345a97745b2c9458808d2e384fe | ORPH
   sparc     |      host-python3-3.13.2       | NOK | https://autobuild.buildroot.org/results/0e89bc3c0bebba17146ea4f8d03d1b3757698e11 |     
   x86_64    |      host-python3-3.13.2       | NOK | https://autobuild.buildroot.org/results/dc10428d518af3cd7493db2435ddea60ced663f0 |     
  sparc64    |      host-python3-3.13.2       | NOK | https://autobuild.buildroot.org/results/b2e3472ed7f63e6927bdc932e8634d5851073729 |     
 microblaze  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/64dcc080a271c41a73315bb8ff975abaab0013f1 | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2edc54128d8093319f264f9e0fcb8e4b2ddc1969 | ORPH
   sparc     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/539c8dfb57a1c2203fa0878e2f309dc2012e2850 | ORPH
powerpc64le  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/fbaaf27bdde5874b554e64aa7871fab1c37cc949 | ORPH
    mips     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/18ba93a0b02202797fd02f6b7684b5e372fcd1cd | ORPH
  sparc64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/f2c904db3321d8d0df277a7589439ec4d47c1389 | ORPH
    mips     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/6eff836f64d9e518e9915ed4684dfa3398df1339 | ORPH
   s390x     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/204db8bfbb2df96773408ff4dee7dd240e0b7e5c | ORPH
   mips64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/e1b92c9c63c0f6a968aa4604a5a680f537a116e3 | ORPH
    mips     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/7536684ec89367c60343cf56cc70365381b1db93 | ORPH
    arc      |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/b6df31d027f99590ce85e47a0f646a4940a7c51f | ORPH
 aarch64_be  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/50b613926dfdfc697d4db88d639f8d924a61e451 | ORPH
  mips64el   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/a158bedcb5eae5531d16dd7d4897fab7a48ea027 | ORPH
  sparc64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/67175ac3dde2f45d85aebee31d8db93725db290c | ORPH
   s390x     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/50b0c86117a3c7e4c55eee82998690e8d57267e2 | ORPH
    arm      |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/1825db1ac5d96ac01822183b2ea8ee8cff4301a9 |     
  sparc64    |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/005e359e7f07e77a6cffe73ce8728e71d08c971f |     
    arc      |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/926e6b07ce3f380f3d9db0586f9e762cacfc32d8 |     
  powerpc    |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/b7279d4f32128daf5d9ef428ac0dbf66109de71d |     
 aarch64_be  |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/8452b432f8209df482c7c36d39283b4bea8513db | ORPH
   sparc     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/18efd22c52b476add8b06b10381f86464ce99181 |     
   arceb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/ae2014c28bb8f36cfbb5e3f6ec365187548d8339 | ORPH
    mips     |           mpv-0.35.1           | NOK | https://autobuild.buildroot.org/results/e7fc39f314881a572693fda61b07b6db627457b0 |     
  mips64el   |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/8deee49024288632c822d930ff8867719ec39d79 | ORPH
    m68k     |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/ef273d85d095e5317f3d9a0b87c46b931c4ea14c | ORPH
 microblaze  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/cfe5d4d4f45bf36d88775e4fcfc6a87445162d9b | ORPH
   x86_64    |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/28f9cfa7ac362ddfcf378ce0f2ec211fdb9f12b9 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/033af6cc90b973921af0f16fed3d16797bde4efc |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/62a2693bf8cddf147247b0bee3e0fa74f263189c |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/90ab572f2b81ea70bd37834db8b91c2bee3846db |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/da894a6b310500072494360cd322c6e752b3dde2 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d91b243a2aa1feaf0d8036ce986ae272b62316d3 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/f7feced510a0c7849298e0d0d3845d563b1e6d1b |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/b191e2fba89e31bceb5152f77b06983a5d8d588b |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/2cb547aeb313341fbfee77e3d06ee8dd54cf0178 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/15f44e82029e7c3eadafad46ffd9d15bc7ead307 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/ea2a3f998610a2cf4b15587a4afe5dfb9c3c024c |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/800444dd1ac76d8d034ded593d4dce0ea3d19c99 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 1 
host-prelink-cross-a853a5d7... | 1 
               libglib2-2.76.1 | 1 
                  linux-6.6.83 | 1 
                  procs-0.14.3 | 1 
                    qemu-8.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/f7dcde9c633ef83e16bc29cd587ba9fde5cf4bc3 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/444dbaa54c22b0e3e404d8c1c711559eb6f8b3c0 |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/1feea4687ce21b474d2be2741491490f0dddfaa3 |     
   sparc     |          linux-6.6.83          | NOK | https://autobuild.buildroot.org/results/c32b6daea0d472005044250576719cf2d65faee8 | ORPH
powerpc64le  |          procs-0.14.3          | NOK | https://autobuild.buildroot.org/results/c510f97d64cf27c8be267b28940993ff0834121f |     
  aarch64    |           qemu-8.1.1           | NOK | https://autobuild.buildroot.org/results/99896186caeb746f74d6504724a0db11d9f1ea24 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
                 c-ares-1.34.2 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                 linux-6.11.11 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/3a4736b5f37e0609929a2bee356251b0d00ccc43 |     
    mips     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/90574cf4ee11f1bb5da7bdb22bfd4384963b3a44 | ORPH
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/c17dfc43b6e1eeda452c1e42a68319de1e632bfa | ORPH
   x86_64    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/ec84d02d3b8e84028d76b6133fbe3914afef9d15 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
