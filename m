Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D68D6E2AC
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 04:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5621D4EB73;
	Wed, 20 Nov 2024 04:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sep4DbXEFaS2; Wed, 20 Nov 2024 04:18:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF6334EB76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF6334EB76;
	Wed, 20 Nov 2024 04:18:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CECD27D6
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 04:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2724460BE3
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 04:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDnjhnpNFKTB for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 04:18:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 88D8A60BDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88D8A60BDB
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88D8A60BDB
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 04:18:14 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9a977d6cc7so309660766b.3
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 20:18:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732076292; x=1732681092;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SzslIjvMit65hbVK/rT/Lntkw3hy+1vTbU8KjeYJn3Q=;
 b=HFp06+V0tmuHOC6Lokofjs6A0Ykv3or7SWFsapU3lymvXc1w8uFo3oBAz3zcUBI5N+
 AGBnyzfPTLJ1dqk9aP8+SKL6oE3YjRBQu4SEwdZiXe8/K5vc1YCthXdF//W+Qt4xtH/e
 97XQxmrwFNyLtlHiyBMj8aV2BTc/EGOCpmaBuc68TMak6K/6XH1hvpPytzf1+jOsHCaj
 Cb+WPubyt2NDuimVdnQwMKvd/VjlNBgn/dUFrNHIVSmgJXs3UT22mHnKxKI+TTGP/ku8
 EXcxZfaOBYMpGxX9I4NPMp+lx494tg3rQ/XF9n5ulQZGLp1+yS/iOgaoy4XsRLzuRd9O
 5uTw==
X-Gm-Message-State: AOJu0Yyetl+MUJRyoN01wcAIp3t5YWxsGy5ucuHaHVRnhEHR2Gd4yVib
 jIrOmjUqwjLObWLnXbdaXhtoFETjjOhVwBWXnWMdYyhNWQ3nH96m0gz9IQ==
X-Google-Smtp-Source: AGHT+IGrL2vZu+FfTFO2Fzhhoru8ThCpYR3RdD2PFNvi2W32FQhw3V2yTnfRSUAWwepGViwMAFfoRA==
X-Received: by 2002:a05:6402:1ed3:b0:5cf:b860:349d with SMTP id
 4fb4d7f45d1cf-5cff4cdb45amr823124a12.30.1732076292437; 
 Tue, 19 Nov 2024 20:18:12 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cff442a162sm365537a12.0.2024.11.19.20.18.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 20:18:12 -0800 (PST)
Message-ID: <673d6304.050a0220.16f1f1.1710@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 20 Nov 2024 04:18:11 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732076292; x=1732681092; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=SzslIjvMit65hbVK/rT/Lntkw3hy+1vTbU8KjeYJn3Q=;
 b=nCpwz/wCSaQPTRWk74PBMTGCWQ/hfu2wsKMm7C5nhHnC8M3YWBuWvWMrhXayUB+1Cr
 4Y6kIAwUflvI6oE6L3ghhUUx51RXNTbXaamsIShK9FGyr41E0YSQkzr2nlHBwrYDOUmZ
 RCtlt4ZAbWiHP2owPIzYatHUtUVBpkHlYK/vIZE+G7i4tpywqRzsg2rtOAUdN0mZh7lW
 ymGHseNbL+ccN+48Kgp+xoBeuxQ3IJGYROO1YQXxAnKmPS2serT6WNx2oJziNq8BG+MU
 /qWQLntlkYrx5hJKfx5g03GSM2rf7TXOfEmsmAKE+2wWg1BGqQVbWsXXF5xwKPecSv3l
 QZaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nCpwz/wC
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-19
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

Autobuild statistics for 2024-11-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  0  |  1  |  0  |  1  |
    master   |  5  | 58  |  0  | 63  |
     next    |  2  |  3  |  1  |  6  |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.11.7 | 5 
             util-linux-2.40.2 | 5 
                lmbench-3.0-a9 | 3 
             dahdi-linux-3.3.0 | 2 
                   eza-0.18.22 | 2 
               graphene-1.10.8 | 2 
           host-doxygen-1.8.18 | 2 
    host-python-greenlet-3.1.1 | 2 
              host-rust-1.82.0 | 2 
                libxml2-2.13.4 | 2 
                   linux-tools | 2 
           at-spi2-core-2.50.0 | 1 
              atkmm2_28-2.28.3 | 1 
             batman-adv-2024.2 | 1 
                  bcusdk-0.0.5 | 1 
                  brotli-1.1.0 | 1 
                  ffmpeg-6.1.2 | 1 
              fmlib-LSDK-21.08 | 1 
                   foot-1.16.2 | 1 
glibc-2.40-18-g564178076272... | 1 
                host-go-1.23.2 | 1 
 ibm-sw-tpm2-rev183-2024-03-27 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
            linux-fusion-9.0.3 | 1 
                    mpir-3.0.0 | 1 
              netopeer2-2.1.49 | 1 
                  ntp-4.2.8p18 | 1 
          obsidian-cursors-1.0 | 1 
                      opus-1.4 | 1 
                   perl-5.40.0 | 1 
          perl-net-ssleay-1.94 | 1 
               procps-ng-4.0.4 | 1 
                  quagga-1.2.4 | 1 
                ramspeed-2.6.0 | 1 
       riemann-c-client-1.10.5 | 1 
                   swipl-9.2.8 | 1 
                       unknown | 1 
   webrtc-audio-processing-1.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/f5b3d4a2bb42de8e736bfc4faee7f139f057e59b |     
  powerpc    |        atkmm2_28-2.28.3        | NOK | https://autobuild.buildroot.org/results/20c06322d0169bf1dc3b2bdca8cc549c55e6effa |     
   mips64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/6307a68699d8c3fd4d71dd224a4f8ae5ce74ee78 |     
   armeb     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/ce52bcf150b57369b062907940361a990cf636f0 |     
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/868553711bbe35ba28610d97ff911c90d89df0c3 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/946731b07f15d85f990e628aad935cd23a85e6a4 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4c701d97974a4534d04daf63025c6f0bd5d21f54 |     
   s390x     |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/34beff7c5a91724fea4b443f16ae55a671e27776 |     
powerpc64le  |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/640f79b617ff06cf292984b64c6dc1162b30000f |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/7c3741727d0fdfe7a8b53611820f004cb6118fc1 |     
  aarch64    |        fmlib-LSDK-21.08        | NOK | https://autobuild.buildroot.org/results/e25da80ceb510c78273e8383a85e1b48b00169d3 | ORPH
 aarch64_be  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/d70f69f316f4f481568ca16ac484af175d465595 |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/34d87a08a7e3b86ab797ebeadfd1020a4867e8b5 |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/b11c7ae5aa0747e326a96546546d2c674882bda8 |     
    arm      |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/1d93622a6535092617ecbdae7e53468fecbb3ae8 |     
    or1k     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/2b6ed31b394d6e0b8c374ea48a072b18f51167c8 | ORPH
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/b39413433784f088c68e1fd15173aba8e25ebfe2 | ORPH
   arceb     |         host-go-1.23.2         | NOK | https://autobuild.buildroot.org/results/2dc64f3f936d008d52d60811e922d1bc35f1bacb |     
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/d7a1271b040b3eb7d4ac5112b546304fac0832c0 |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/ff26336c255e234a7ec988496ff726d45b532689 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/38bbbdf408a3d87a210050b06c90cb2d0385cbeb |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/8d2b7d1c4bad4b1c65e452157ee0dd8fca3eb739 |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/905139805dc8b6068132fe4db09effd592f31dc3 |     
 aarch64_be  |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/8c1489d710a5425125e2048b090b5386b194f42d |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/4ef5b5d4a07a36103b0758cab7a94afa582109e6 |     
  riscv64    |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/20d929e350dadbd91b1a89767419e1c563a10854 |     
   sparc     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/d35792f6171cc3b3dedc617d35dcb20d44e067f8 |     
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/85a45e3d10aaa838449798ff9904e4620d52d4c1 | ORPH
  mips64el   |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/8e704ad7cde3eaf043491c388e04cc8632946bed | ORPH
   mips64    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/babae8e647472fbdac12d3280ed947c685d672f5 | ORPH
   mipsel    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/1d44cd3fd647ab44a5b5040979def7b745ccbe11 | ORPH
   mips64    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/90297cbd702b7711285ac7b1dedc5647e4ea08d2 | ORPH
   mipsel    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/242c02f23c74e2248b1e06ce9fce5e561ffb887b | ORPH
   sparc     |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/14dd6be87b27928e1de2dc8108342aeaa9e03bb4 | ORPH
   mipsel    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/e5b43cd442795ac7a79b3bb34c533125b5634eb7 | ORPH
   nios2     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/a8d79bf533b08e60a30093ff0f5f15b3b5273a1e | ORPH
   sparc     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/3bb6cded620d795c3863b56bf310c531ec44f933 | ORPH
 microblaze  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/ad6d45b7e0dfba0ebefac268f6ec0d012ef117cf | ORPH
 aarch64_be  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/b6c114910ac7c1a80bc7f0d32b504d9c9d8b1852 | ORPH
 aarch64_be  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e1da12a3277938364560d26c557a43b4d0b2d9e4 |     
  aarch64    |        netopeer2-2.1.49        | NOK | https://autobuild.buildroot.org/results/ccf9ecf7e84fb2124b79a831ee07200508009eee |     
   sh4eb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/4e12eec7457975f437315e5e5314d2095df4acf2 |     
   mips64    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/f6e3b75e145bb8ca762a71661573898f20a1a1c4 | ORPH
    arc      |            opus-1.4            | NOK | https://autobuild.buildroot.org/results/c1924951fd1ddd19429a401be8491fab4f0410ab |     
    or1k     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/3890c512ea5f2f6d9c6b9df70ac4c5dedc8c73dd |     
  mips64el   |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/0f12a42d86b380fbf3cf8e81f03bc19af324f8f0 |     
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3e26fd44720db8fd9fc7916087b8bc0f35c464fa | ORPH
   s390x     |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/b9fa9e53cf5110d4d6a8c181bed0103a67f94bce | ORPH
  mips64el   |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/b5f7cecb1178638d1b0377ebfd20c9277aa7bbb4 | ORPH
    sh4      |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/c9cdf1028bc6c940e3647b5a1032778d684ac87e | ORPH
    i686     |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/3b199e56b363a1ff0ead60978af96cce200bf833 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3c4272683f45e1392a7430cbf147f578283af024 |     
  aarch64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/15317179c20b0e89ec67620b3e7eb08cdb5fafc8 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/24158d1d26ecf7d5054807f47a9eed20f1d37b0d | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8cf5d85bd364ef305d730a2add6e547f2418887f | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5b2db86ba2fecd27f781a6d82eb795b1dd471179 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/743f580b91afa94e31d8e0dbe34b25b0e08dd9f1 | ORPH
    i686     |  webrtc-audio-processing-1.3   | NOK | https://autobuild.buildroot.org/results/e9247e4e3d39d4de848667f5f90e9eae40685350 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/06ffeee0ed744734428410bc293a8ba92277af44 |     


Classification of failures by reason for next
---------------------------------------------

         gobject-introspection | 1 
httping-0e26c53d5fe504eb720... | 1 
                   nanocom-1.0 | 1 
                  ramsmp-3.5.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/ecf43c2d69d3fd147ba8715cdf3becac36a56f2a |     
 aarch64_be  | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/15eb024abaa48c9598132092b51861612417abec |     
    arm      |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/9f1e671062ffb44939ffa24f775f053d1b66b624 |     
   sparc     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/d9f5f087caef3cbf035ab4fd76bd214133171fea |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
