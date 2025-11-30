Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC0CCFD376
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 04:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F15040C19;
	Sun, 30 Nov 2025 04:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56DetgBCp5o2; Sun, 30 Nov 2025 04:20:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 124AD40C12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 124AD40C12;
	Sun, 30 Nov 2025 04:20:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1851D351
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 04:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1596B40C12
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 04:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4AfnB5qdF1uS for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 04:20:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6CC1540C0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CC1540C0E
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CC1540C0E
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 04:20:52 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-477b5e0323bso22563025e9.0
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 20:20:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764476450; x=1765081250;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zDN7EMuD9iLsXCdVbQUs68RRy2nDO6BOuJZx1BBhE2M=;
 b=jSqiRCgvDzVQkTJHhF4FcbWGk42IFwdtMvGhdGqba95TUwPCr94xyB7q+4Dtu3ZLi2
 CmjgmNIJRl2BrxnK+CB6wnIoGrcFcg0T0xsxcfFOuw/12ry53LWN7djY5AspEEWIijuo
 dJX7/sXSI++OkLS1tyEJyV/OnQAr2hZWYCxv0LXMv35qfh1jwdJDwtED/OYQikEvdMNh
 JgT9K7bFkHfH7+JtnbhK3CfTiLhsgsdsFJPvWWRSDvWegGQvsNNlT/kLXWpi3BqY0rrT
 mgmwcQJy7E1VXbHPbQ66Vb3WLi9/Ib895z0tRDkkgjOWvn7+MDTS0+GGfRA8VgHH6dPN
 JIwQ==
X-Gm-Message-State: AOJu0YxZhe5wp1cEJ+TwtLLW/ZA+iz+mqsRImXab8NBdCqMXm5YcPQn8
 jkdY4oakqGK1xHHgr4zUJnAEZX3O4xffyKh4GXyKqW+z2abQtxqpanCC6KXunQ==
X-Gm-Gg: ASbGncvpHryYyt6BlzdCoX9QyY+bcSWd1cxiMcFM8rfUMRnwqz+U9LHEKgCbe3muLd7
 xMewYHQBVSRvKZ/Gx8arsLq288PqZDv8XmfCTuZ51t0UtThrysMr8xrvJs5zDxiP1qccyyPOWu+
 Q0NKNRhVQ6yW+cA091jApGZ3GiRHP/lSGdRWia3BraMfNFr3K4D79a8wbk2fjuzEk4hRI8U13ZA
 PGZk6igEZhBAqTrnyJDMfZEW+XiP8Frjk2spOQdBW6qsl78SQmP++KxBuiWF+K2fpGKFXYB6uxF
 xmMlh6IMDsjFcsRIbsGmg7k+QCgypkZ6V7aLszKckkb4aI1EVGcd04wth7XBtMffyo9Gn54zVbk
 lkj8YJwlf94rz2kU3aUlPLNgp1snyaBgRwNz3dShH2MZW7cTFiIi3rECOkoQ7wwDAhbtx33o5i+
 I2jjR/bzWwuwNeW8jR5w==
X-Google-Smtp-Source: AGHT+IFelEiKPplZqwaOoPy2f27OriV13u612B58HUeXWIKCi1JT/+/Pa4XqSza/2VZqAPqjvi5cNw==
X-Received: by 2002:a05:600c:12c9:b0:479:13e9:3d64 with SMTP id
 5b1f17b1804b1-47913e93d6emr70366705e9.15.1764476450132; 
 Sat, 29 Nov 2025 20:20:50 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4791dd135d9sm22735495e9.2.2025.11.29.20.20.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Nov 2025 20:20:49 -0800 (PST)
Message-ID: <692bc621.050a0220.114ff1.cc4f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 30 Nov 2025 04:20:49 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764476450; x=1765081250; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zDN7EMuD9iLsXCdVbQUs68RRy2nDO6BOuJZx1BBhE2M=;
 b=UP6F5eMkZ34SnHPb6JkDDie+ujMyeMjJWfKno0oDYJ55yRiph9INmKZub/ivGdqB7p
 n/4WZiq6qDLGc/4rHPRKjr2u50/2ee9O1rXstXV0QX2S8Mh9KGcyfRllg3UCWsNfZPvu
 Y0OAW54S8/yB3evn8tFzJYOH/o6JjMhMfj+bJKczf2d6k/p2xLXB59bF24+e24f1hXre
 +U1V9vPitod7d6och+bzYr0KQlltj7/m4U2TkWU6dcDjGK5PkhMGI/vsFtNYn933BgVJ
 lAzueuShKUfRFDI8P2NoihwOAP11dBMsp22aT0h7MqiBLo6R48rzL9SmKfrmFr3NsgaX
 a/fA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UP6F5eMk
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-29
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

Autobuild statistics for 2025-11-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  |  3  |  0  | 11  |
  2025.05.x  |  2  |  2  |  0  |  4  |
  2025.08.x  |  0  |  9  |  0  |  9  |
    master   | 35  | 67  |  0  | 102 |

Classification of failures by reason for master
-----------------------------------------------

                     kbd-2.9.0 | 8 
                python3-3.13.9 | 4 
                  brotli-1.2.0 | 3 
                   cvs-1.12.13 | 3 
     libphidget-2.1.9.20190409 | 3 
                       unknown | 3 
             dahdi-linux-3.3.0 | 2 
  gobject-introspection-1.84.0 | 2 
                    mpir-3.0.0 | 2 
               asterisk-22.5.2 | 1 
           at-spi2-core-2.58.1 | 1 
                   dante-1.4.4 | 1 
                   dav1d-1.5.2 | 1 
                  delve-1.22.1 | 1 
                espflash-4.0.1 | 1 
                      fio-3.41 | 1 
freerdp-2.11.7-18-g0ee17e2f... | 1 
glibc-2.42-3-gbc13db7393773... | 1 
               graphene-1.10.8 | 1 
host-am335x-pru-package-5f3... | 1 
    host-mender-artifact-4.2.0 | 1 
              host-rust-1.88.0 | 1 
                      ijs-0.35 | 1 
                   libcap-2.77 | 1 
               libglib2-2.86.1 | 1 
                  libite-2.6.1 | 1 
              libopenssl-3.6.0 | 1 
                libpeas-1.32.0 | 1 
                libselinux-3.9 | 1 
                  libteam-1.32 | 1 
                 libusb-1.0.29 | 1 
                  linux-6.17.9 | 1 
               lrzsz-0.12.21rc | 1 
        ltp-testsuite-20250530 | 1 
                netdata-1.37.1 | 1 
                openssh-10.2p1 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.2 | 1 
             stress-ng-0.19.06 | 1 
               syslog-ng-4.8.3 | 1 
uclibc-ng-test-132c6134d691... | 1 
                     unzip-6.0 | 1 
                 wolfssl-5.7.2 | 1 
                 xinetd-2.3.15 | 1 
           xtables-addons-3.24 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/881612fc946f6bcd723e7e1978a92071da7583c4 |     
loongarch64  |      at-spi2-core-2.58.1       | NOK | https://autobuild.buildroot.org/results/169be4d657a656f5457497c3c6624a394d5bd0c0 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/224f146cb7146cef8ffcd4dc62466c0bc7336a64 |     
   arceb     |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/21e4cb2d5dd1eb895d3c36322ba64facc2e3e8f1 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/95cd46d6794e82f85bce58f79c5e85972195c07c |     
   sh4aeb    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/dbe1936faf7aac793c658238ada64893f9fbc491 | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/5820baa42d467e654b421be9d40d8420536316a2 | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/41a89cf91ffe598ab72641ba358f3ffa74d4ebff | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/029e4f2bae552788d8562adce1e970c46ce1c7a1 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/63d1b5eb621dffb994c57eaa04f4ad2e3aba5d27 | ORPH
loongarch64  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0abdeb36735ed20ab8a102da65064c99bfa0cac4 | ORPH
   arceb     |          dav1d-1.5.2           | NOK | https://autobuild.buildroot.org/results/69ddd94c02d46dcd07583dfa8895672bef5535cd |     
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/4cdf76d267d67236689d98b84c7a21d6149112f3 |     
   s390x     |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/c30cce264698706cb33d3210d9ae431ea17923aa |     
    m68k     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/fa95c597015619cce68166d3ca8bcd39b6080555 |     
    i686     | freerdp-2.11.7-18-g0ee17e2f... | NOK | https://autobuild.buildroot.org/results/73067563def3d21acd2083830c3aaf9da787b2e7 | ORPH
   arceb     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/9aa6a9d4e78f0ed6d2b5273bf63654fe6f07947c |     
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e1cd8b054579160276992ecedf87b135435d6f75 | ORPH
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5ec7baa2e875e155f6a636e1aaeab38d7bb319ba | ORPH
   mips64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/7d57a00f48cc84cb848bdd220e4bdfd0e9e6e14c |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/640b5f8e550316765e9b9a5fe07e67e6dc7875f2 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/017d4021b136f771aa78050eb0ec3bf9d384f174 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/2fdba25b9b63b3c8fab13598c966f30c768add68 |     
  mips64el   |            ijs-0.35            | NOK | https://autobuild.buildroot.org/results/5b2bb3520bcc80e5ca384e1059df82fd82ee0bc6 |     
    mips     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/cfc07336e05902e431f8e825cd4bb9f3c386697e | ORPH
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/8957970fd6bb8e44e1ce4980c11229057c4f5c11 | ORPH
powerpc64le  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/335dc26358551a52477e87462036e93a3aede892 | ORPH
    arc      |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/c763fbe6e9bcbb76cc42c0500d066f93875c588b | ORPH
 microblaze  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/a8d17f58e73b982f6b95a3aae31442e6f27f2d8d | ORPH
   sh4eb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/9b0423e95f8f77c3a3d2373de23c589750a8494a | ORPH
   s390x     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/bc3180f266d81b9c18792f9a90909e4942d0b2cc | ORPH
   s390x     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/ef57ed193c3e30ac94ecbb2919095aa76d3a661d | ORPH
   mipsel    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/c94980661d05c06dda81ceffd365bbd557b49ec5 |     
    m68k     |        libglib2-2.86.1         | NOK | https://autobuild.buildroot.org/results/53d579b9c26208390237cbabf67a3a7e53598388 |     
  riscv64    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/4454ca959e65f9ba4eec8356d7f32507475ba3bd |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/638180300664fff9f9471f1933c7502e467a0a7b | ORPH
loongarch64  |         libpeas-1.32.0         | NOK | https://autobuild.buildroot.org/results/32ee3965dd26c7ee3d3ab78a29c9aec3bf6c5806 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/8843e3131a6a4b7ec16d70ac3209552aa5df0068 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/2c8f9fba30a9fe1cb61c7946c90c23db90ecab9c |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6104149b28d05ebe4f529f255faf49fc35e8ead8 |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/8a6978fc069440287b2f56605faeedb30f1b54b3 |     
    i686     |          libteam-1.32          | NOK | https://autobuild.buildroot.org/results/a4c4c4135cffe607269cc0fdb36e4b2c86e7fe33 |     
   arceb     |         libusb-1.0.29          | NOK | https://autobuild.buildroot.org/results/58e5a2ccecc485d31ac9796cd8c62353bd6332d2 |     
 powerpc64   |          linux-6.17.9          | NOK | https://autobuild.buildroot.org/results/c3a8bd01227b682f7074be58f9029f4909ea9123 | ORPH
  aarch64    |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/2e33c61e1c9bee099f973c1e43b696c63e5eed4b | ORPH
 aarch64_be  |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/f85bffa4e901b0c2d7093ad8b309f8c2942dd6d3 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b26e386594dae249bf94f27db68f849e031947eb |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2b27e5f7414686d4f6bcbdc3e8b5fd9fadfd9e64 |     
  sparc64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/dc9d80b36ed31de8b3fecf3b39e9c20a98874fa1 |     
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/452c564a9aa5d76427525385595a1126c1dc7b4c | ORPH
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/a17a82746d5aee8aacb09cb90bc6815ef77421f2 |     
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/462c5942d5c0730a10947e6ad8dca798e107b420 | ORPH
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/6f7c5a2ede117987745ba2715d82a0a723f2b066 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/5f005f707df63c89565a632d1606eb874032127b |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/14654eca27c42b9676893c5ecb179cc5fea9616b |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/1e321df3b888886efad77ceb537746b8696ccc27 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/3749780343a82efc4ee48bcd80364f56dfbcb6f2 |     
microblazeel |       stress-ng-0.19.06        | NOK | https://autobuild.buildroot.org/results/d4fadef213455b1776d93e30e51ffe09fb1879c5 |     
  powerpc    |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/8c3a5fd6deef6986b6ea6efc47c9959feab8339a |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/92bde38a3d7dab27952323fe11cdbe7ccafdfa06 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/823d446643a38a034f68d0062e6aa289fd68cd32 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/b6d35f8eae33efd3e2866c231067fcb01a6c94b6 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/372cc06dd367a2150a1778a62ee02df18e78c294 |     
 powerpc64   |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/7003d0f34e32d287ad485129a98e87ba6cf25ea9 |     
   mipsel    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/68146c0d6ba781fe7221c9e6cfbeaedb5671933c |     
    mips     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/37bad733ce2d273e932962a95354a13fc730ca05 |     
    arc      |      xtables-addons-3.24       | NOK | https://autobuild.buildroot.org/results/3b8b0452edd616fa056b6c8f33fc9ad1911e39ee | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                 logsurfer-1.8 | 2 
                 cdrkit-1.1.11 | 1 
                   duma-2.5.21 | 1 
                netdata-1.37.1 | 1 
      passt-2025_06_11.0293c6f | 1 
              skalibs-2.14.3.0 | 1 
               syslog-ng-4.8.3 | 1 
                       unknown | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/3c1217bcd7e5149687bc6b443f4c85f78d05ed2e |     
  aarch64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/4a7ca4dbc82adcbfbc0977974f5ed9c99abcd3c5 | ORPH
loongarch64  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/a179564e19e9fbb8e97b6b15550c3944257e644b |     
    sh4      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/4cf0b116e5e3bbacd65f54816410aae862d320df |     
  sparc64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/bb444ac22e2f06f2efbeb76ab97c6d548547e2de |     
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/4064c10814eae48d8f0e23e692e6398acf0264d1 | ORPH
    or1k     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/4b694b7df6f07645fe6615374d8e1b02d746c1d3 |     
    i586     |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/2eab02e941ddc9e9e6738345d402062f3f997f3f |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/9a7fd84da3ee680deeb5fc6b55158c03097a1d46 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

      docker-cli-buildx-0.16.1 | 1 
                 openssh-9.9p2 | 1 
python-remi-2022.7.27-37-g1... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/a571a48d0345a9d61c3263b6700346916a9c2aab | ORPH
  powerpc    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/0907127a3bdc1821781f1c17d293625c6142121e | ORPH
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/97d338f8343bce858dde739f85377d41e42ecc92 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                 libgee-0.20.6 | 1 
libuci-f3fc0b76040685829191... | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/01be88aa0f1f1371ae2541f0f06f84b4c92d2ac8 |     
    arc      | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/5f7711ed861ff78075cee8b4e143e6a8d6f815df |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
