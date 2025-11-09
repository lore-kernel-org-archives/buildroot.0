Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA394CCFA13
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 04:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 493F54064A;
	Sun,  9 Nov 2025 04:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ep_v965tceWj; Sun,  9 Nov 2025 04:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED33140647
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED33140647;
	Sun,  9 Nov 2025 04:23:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D05611CD
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 04:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6ADC40345
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 04:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3mRlygIM49H for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 04:23:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE07D4002D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE07D4002D
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE07D4002D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 04:23:14 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso3288595e9.2
 for <buildroot@buildroot.org>; Sat, 08 Nov 2025 20:23:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762662193; x=1763266993;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GnSVdtvf2lSJj5Y6ru59zvGp7qBrkzjGH/zPNaQakYo=;
 b=AW8AvtM8yjeEmmjcl2EfIFp8vdhWtpLmRjVLxAlo+/1OfmGnlq//G3KjwMmYif00A6
 7wo951yMS1VQS39W4zwgAztBXoU/akd1pz6ACba7sWZmbakZeU+ELwFDpsCwRjMnt+66
 nAhfMi2/EI7w9x5KGmfBg5Q25cWrUrBeLBBgjcSe1j5Q1nYeojmIxyRmeBdt/N4/UZ2Y
 E2H2AuJ0RIH/+03c5STO2VchJrPeQL/pmKYm5X3w7BIsUvz2GreQ2+Tjfj7kURCd9PiJ
 4Tas9TwmBnOl60+RM3+CppBT6OviO6qO0YP/DOipN1ZvSt3ER5I/YkME+dPNkAATwBD4
 j4Pg==
X-Gm-Message-State: AOJu0YxJhYsXOicfNL6Esz4tOQ1F0OpDMsR4OlGp6GM1HDaQNOUg6aKN
 wk5o9P16TvaNrUsja8ku93RSUQn5gVIumbTWUZQC/Mo7bbCK1Mbh6fvTrZja9g==
X-Gm-Gg: ASbGncvU6JsIxhmnaqBJsGSguXZ6EBu1y+hxD7IRrV5xgcloIf1peKEtLfoO54f3nbi
 H9z3n/K7BeybiEDDrxxcpUNb5DGlDQJr5XrWS9TH55d1aK8Xt1tJDVz4J6umLIqsehTElm1BBNU
 TjZOh/aqTZSCqc43Jlwo2S62MLrpMgRk0UAJ4NehR7ksHVcu8AjaQp8XIgpUgl+QdLFRRIYjI2r
 Q5iRmEsM0llK9EHFuFiyj9/Lht8HbHSnskcOmn+KAByEKrXw+DxGDzY/0c4YHlV2KnJzMyh37bR
 zJCKcV8leSnI3iGm1eh6m7FWZOET+jm14odxTmnttUaqoL/s1KD40kVoSchWTY4wIFAxDUcGnXQ
 hboumCvNktTEjBzZcje4WR4walOVkiFEl7EbyODCX6XJVFX7Qd3MzcYzEFS5ielCe1Kjw8nrg0p
 UsRhAwveeeWVHJM53eNw==
X-Google-Smtp-Source: AGHT+IEZ8nF1VJqt28Fm8hqfo1uV6jBLSSLcbaK3fbn5NP3sG6Rjwvu8mSCQaBCIIFairsxixAP1/Q==
X-Received: by 2002:a05:600c:4fc7:b0:46e:506b:20c5 with SMTP id
 5b1f17b1804b1-477732834e3mr21907575e9.26.1762662192442; 
 Sat, 08 Nov 2025 20:23:12 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47775e9c6c7sm28595105e9.2.2025.11.08.20.23.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 20:23:12 -0800 (PST)
Message-ID: <69101730.050a0220.a5bba.5fef@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 09 Nov 2025 04:23:12 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762662193; x=1763266993; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=GnSVdtvf2lSJj5Y6ru59zvGp7qBrkzjGH/zPNaQakYo=;
 b=VyYDq7FpeW2s579h0JEg1VM42Yp59nSoqhSM9C+6vSyFAVz1h5nwMSZrYT7CT5JVMO
 HNE6sbd+E6sbTYM+OOQ5K1Y28tthh9dELDHyyrxrGfuXAD/c1CqLqS1DH7PTdqUVqYZ7
 niaZT5jbEG7BBI3CoprlIWSyiEFjNmoZdq9CWRg3O3ekIDd71ro/d5hHV7STaF+DfXWS
 qMpwJ76hpdFc3dORDMTNmtNORWnRMhzPeaGuWTvB0EGoWmFgjZ3GuitvFBeb2q5w7noF
 l8XdqBi/oZ8N92XzNoI5oNx2Rg+YxtT00apyucLOHfnr449WFmP4hKIolZ0EnDyimz9Y
 WL5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VyYDq7Fp
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-08
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

Autobuild statistics for 2025-11-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  6  |  0  |  7  |
  2025.05.x  |  3  |  3  |  0  |  6  |
  2025.08.x  |  2  |  5  |  0  |  7  |
    master   | 38  | 82  |  1  | 121 |

Classification of failures by reason for master
-----------------------------------------------

                openocd-0.12.0 | 5 
                   perl-5.40.2 | 5 
                       unknown | 5 
                   cvs-1.12.13 | 4 
                   libcap-2.77 | 4 
              host-guile-3.0.9 | 3 
                  libsvg-0.1.4 | 3 
               asterisk-22.3.0 | 2 
             berkeleydb-5.3.28 | 2 
             dahdi-linux-3.3.0 | 2 
                    eza-0.23.3 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
           host-openocd-0.12.0 | 2 
              libopenssl-3.6.0 | 2 
                  linux-6.17.7 | 2 
                netdata-1.37.1 | 2 
                 netsnmp-5.9.4 | 2 
                    azmq-1.0.3 | 1 
               bctoolbox-4.4.8 | 1 
             bubblewrap-0.11.0 | 1 
                 c-icap-0.5.10 | 1 
                 dc3dd-7.2.641 | 1 
              e2fsprogs-1.47.2 | 1 
              execline-2.9.6.1 | 1 
                    gcr-3.40.0 | 1 
gemmlowp-16e8662c34917be006... | 1 
  gobject-introspection-1.84.0 | 1 
               graphene-1.10.8 | 1 
                 host-gdb-15.2 | 1 
                   host-gnutls | 1 
    host-mender-artifact-4.1.0 | 1 
     host-python-maturin-1.9.4 | 1 
                  iozone-3.508 | 1 
               libglib2-2.86.1 | 1 
             libgphoto2-2.5.33 | 1 
              libmhash-0.9.9.9 | 1 
                  libnids-1.26 | 1 
     libphidget-2.1.9.20190409 | 1 
                 libpng-1.6.50 | 1 
                  libsepol-3.9 | 1 
                nushell-0.96.1 | 1 
                     nvme-2.15 | 1 
                openntpd-6.8p1 | 1 
procrank_linux-21c30ab4514a... | 1 
                python3-3.13.9 | 1 
               syslog-ng-4.8.3 | 1 
                systemd-257.10 | 1 
                tpm2-tss-4.1.3 | 1 
           uboot-tools-2025.10 | 1 
             util-linux-2.41.1 | 1 
                  zoxide-0.9.8 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/f5979088aa25637b62ac69c5b88358b21e1805f9 |     
    i686     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/f9831dbdc851e5cbd259f83519de37c0776fd734 |     
loongarch64  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/b1ba77c74318caa37c5aadfc7e41390aad058601 |     
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/521ccc721bbb1166344643a6c02504fc25249355 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/8a89a8c9dd00cd71cb201e6b3b5f00fc441419a6 | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/49a388968b07d660c37ebf1a6dc17b91dacc84ec | ORPH
   arceb     |       bubblewrap-0.11.0        | NOK | https://autobuild.buildroot.org/results/a53d734ca156ee3c968f3f63d7e7d8f5cf631115 |     
   sh4aeb    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/71e60dd50cabe8f3886a4e0dbfed63f2b566de57 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1d1427f3480ca432e253c755173e57c38594212d | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/85554c4992244ead03465a8381e371abb038ec45 | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/25a67af6a6b748bd3e1a10393e853488c991c76d | ORPH
    sh4a     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ba91d77cf2b300719b3f1ad4a5f9a1c0dd03dedf | ORPH
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/96a7d2738826e8456a787feccc2895cb66165d64 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ad93570323f95d2af616741f86798812dd76736d | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/87ce6e03887551b5bec0b6b71f31f1a2530153dd | ORPH
   mips64    |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/b6c66a34d26aa4e9e695ea07e59b89f8de861193 | ORPH
  mips64el   |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/fc982febf9ee23de3a2ba3d5336c52bf9418b258 |     
   s390x     |           eza-0.23.3           | NOK | https://autobuild.buildroot.org/results/8591dfbcbaeaa3dd5672efb14d71a8f27ff13482 |     
   s390x     |           eza-0.23.3           | NOK | https://autobuild.buildroot.org/results/27c994e18a587deccae4dc0c67d5f2bb010183af |     
   s390x     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/88ed4db6fa17b2095b1df69c6dc61e42091394e3 | ORPH
  mips64el   | gemmlowp-16e8662c34917be006... | NOK | https://autobuild.buildroot.org/results/2fabb7e37d167eee8d923b36b261cd72057ca5f2 |     
   mipsel    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/9b79cf3fc9552b256227cc2128724025968ba8d5 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/dad3dde2ca7b677dd06e27a91be7580aee421bec |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/42fab76220ac3c1257b432e759e30e7de9a94cdd | ORPH
   xtensa    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/9c994d2929b29e4e354989fd743a63f61e44d8ae |     
    mips     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/2ea2451c424d8f2aad13e63417574fb8cc9b1034 | ORPH
   sparc     |          host-gnutls           | TIM | https://autobuild.buildroot.org/results/f62a703e2c61fba56edf5c31d1b2ee6bcd611244 |     
   mipsel    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/4f9f963e9dac04ae7fff6d743fe0942c12269baf |     
   armeb     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/af7965537da47f9d24ab4cbe414a4affbabac0b7 |     
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/c0ee3369b9a55453717a8048e90f8b7ddd6b9e36 |     
  riscv64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/79007408f4a9b15e1a3ce8daf988ae1900cf82f6 |     
   mips64    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/793588c10c017bd9277aa038227d92c58c1bd042 | ORPH
   s390x     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/f11360aeff27712a5404a52a7fca177b8d35339e | ORPH
   x86_64    |   host-python-maturin-1.9.4    | NOK | https://autobuild.buildroot.org/results/cda895a05f236bee6edfee47b8bc74efcefb7c83 |     
    mips     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/55fea59b45d06d627ce50502b7f7f8b2c6527f31 |     
  powerpc    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/8cbe2b27bcff7cf8b1757fbb25ee035d5c8de0d8 |     
    i686     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/e8c9d136fc1e88a92e503271c781b65d00783d87 |     
   arceb     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/26eec3ad5e281cbdaf7223d4cc2b85e88510fdad |     
    arc      |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/3255359af31cf3fcb01856844d5f0d43459ed4a5 |     
    m68k     |        libglib2-2.86.1         | NOK | https://autobuild.buildroot.org/results/760c98e1b4bf10da69da67ffd5310b2cb02c449d |     
    i686     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/08150ef84ca368e7449a83d0c1ae7deb92fba4aa |     
   mips64    |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/2565b6407ca488b7ec2ccf8e43dfc477e3d931be | ORPH
microblazeel |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/28cd22d2eed2033c2b18f94986baa3329d852dd9 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/fcd75f36e297e7766d0c1e583b3fdbb003cfb929 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/72b7c74605228c2e8501e163328094fc63463e70 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/8141b48309f84f79d94155aeb85aed56467ff0c1 |     
  riscv64    |         libpng-1.6.50          | NOK | https://autobuild.buildroot.org/results/573c2dc9a144da25e2d1962af09e5931a72cd8d3 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/e9171b73bca6420fb35e1e5f72e4743b913da427 |     
   x86_64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/6f57c6cbff5d3e06a6ff333690f4898a58422f80 |     
   mips64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/322c665ed6b199372794361d27a085f23bba0759 |     
   xtensa    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/d365796d0601206c069ad79f50d2e7b7d475a8a9 |     
  mips64el   |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/89b8d990bb8917336287c4023119b91bea992553 | ORPH
  mips64el   |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/3e5c4efe639611e0a0666ba068028ca9b2b4e242 | ORPH
  mips64el   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/c7b316d553153cd7050461a4447423c5e6a1a00f |     
  aarch64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/07b97fdae353e15415e3948599c84a74d0f18b7b |     
 aarch64_be  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/e1e5ef4e018e441dee05f9df92e0cec610bb9ef3 | ORPH
loongarch64  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/a6a179ccd4d0e7b699220f425e1b2e03bb8f9ca6 | ORPH
   armeb     |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/252170f7b74d89df8f5dd0402e130266328c9a48 | ORPH
   armeb     |           nvme-2.15            | NOK | https://autobuild.buildroot.org/results/2f4fef3a0bd02058c4b96c602d7164893ee547e4 | ORPH
   s390x     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/31070833d6697642ab86f9fd8f85af68815719ab | ORPH
    sh4a     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/91f29414e6221fc1906ad973f1cff9e6003206ad | ORPH
   armeb     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/045c16aed515dbcb92260408540ec138ba07c0be | ORPH
  aarch64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/ea2d05a733f75b31e4a90fa402081dd1d12f8aa3 | ORPH
    or1k     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/06ed2aa29e461ea2f5123c8db71ddb86c4bfb2b3 | ORPH
  sparc64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/47a88dca06320140a5dcc479539c4e112410062a | ORPH
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/07a60aaeabd0af26980543c87adbb1030eb5602a |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/e5b9c8ef7233f5b9f500eff03c973b25de0636d3 |     
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d96b70799b6e6c732070787189b68585f89b82a1 |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/b9f2f6b102e681283292f72ca6ce7ab43e4b6603 |     
microblazeel |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/1cb79fcfbac5c7f703ca08c2394d34140befdd85 |     
 aarch64_be  | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/8088692d06bf343ddd9f0ecee562f696bf096e68 | ORPH
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/5542470fdd655685cc160e5703651ba2906239b7 |     
 powerpc64   |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/e3c75a266ab60b0e776986d4f6c50402c90debed |     
powerpc64le  |         systemd-257.10         | NOK | https://autobuild.buildroot.org/results/50513b89ed966c1fde26d2375360f6f84ea75495 |     
 microblaze  |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/82279da663194db5644984b68902962efbf8f419 | ORPH
 aarch64_be  |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/8693beb848c927c660031268e8feabe678a8a155 | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/267fe6509de2d1eb41be67bd7c88969beeaf8da1 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/fef9880b5b1697839c9b833068f80b861f2fb572 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9ca0702fb38db73d2cd55e7e20ce855bcc1b8a84 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5cc3959c0f9c38ecda8581b0eb28b2f3c7ae95f5 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/1df4eff025970458878709e61c3d302ba1e4de26 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/47870cdf2538042de1de9fbffc2150e691303e4b | ORPH
 powerpc64   |          zoxide-0.9.8          | NOK | https://autobuild.buildroot.org/results/df188da53d1e4f7113c54e1351dc712c09f03521 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

           at-spi2-core-2.50.0 | 1 
                   cvs-1.12.13 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
               freeipmi-1.6.14 | 1 
                netdata-1.37.1 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/0521354cdecf6287cfa5a64b20baaf4b27dd8fef |     
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e57be5847c5e5eefa43fff68790e5dda4ea58baa | ORPH
  mips64el   | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/70424b2182818d7cacd3b7605ab06bd37f97ef36 | ORPH
   sparc     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/c01e28d4dcc830004a2cf78d5c7dbcfb911ca8fe |     
 microblaze  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/b88933e7892699987bfcc543ca47579c03fa0a4c |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                bpftool-v7.1.0 | 1 
                   duma-2.5.21 | 1 
                jemalloc-5.3.0 | 1 
                 openssh-9.9p2 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b258414d2b189942b9cfe7020a406aeee6d17447 | ORPH
  aarch64    |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/71226b017dea29605806edf2b1b29146185165a2 |     
   s390x     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/11b89f78cc506b0d5ecb80c1303f4aa67589fe0b | ORPH
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/ecd4187ab19d652c91c5519189fd35f42d101f0f |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/ae86c6990ffb91d26ed550983511435d836c6092 | ORPH
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/8e2d83367eac0f4638fe439aaa8f3b72d3ffff6c |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
             python-webpy-0.62 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/047a3514d44880a2161d85e748dd0c91e75e5949 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/75b8e633d64edf39b4b36f0a46a4a9a5a2b37f5f | ORPH
    m68k     |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/24720dbab4379d53aba1c63c13de453b04ceec02 |     


Gitlab CI results for 2025-11-08
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/11989501203 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/12005655252 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/12005662092 |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/12005667138 |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/12019130700 |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12019130736 |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/12019130818 |      
               stm32f746_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12019130906 |      
               stm32f769_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12019130962 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/12019131742 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
