Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CE7E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 04:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1683A61705;
	Thu, 19 Dec 2024 04:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0A2TPYzQ4KR; Thu, 19 Dec 2024 04:14:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB19561731
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB19561731;
	Thu, 19 Dec 2024 04:14:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32189CE
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 04:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0019F61705
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 04:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TqEZrhzNM7y for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 04:14:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33E3F60749
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33E3F60749
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33E3F60749
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 04:14:40 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aa543c4db92so69215666b.0
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 20:14:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734581678; x=1735186478;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=stjPOzWgOMPqudiVOQB2LfBTUnFGfGe1EZvwgtKpul8=;
 b=TK5F6Mri7jt36j+DNbbYk9WJEH5RLZPc2k5edmY8JEABn+mY0+g3oOtbiCKz5NUDgD
 qyZHP4nNnnx55sFEPaC897yMjVR8JA3zA19+SD8Hl+GDWbipb+ISgCsoj6XL0xW+R9EK
 HFZXGfrjD2XNQmL+GzjeeuSOSnvPTKHB08z9k1YoRCg4dzqiNWkZVleq4rytyDybilki
 ZNc7McAx6iuADfJamcUDwkG//dP/gFIINmuFISXjbh7HChXQwnMDpv7m2AifPiXy3yJ6
 9siLknFQMsQYjxK7avz5/dpzEsKSfCwf67BWgzLdAoGEYSJkoXDRli+hC0PXHDf1zkhJ
 wWRg==
X-Gm-Message-State: AOJu0YzwdAsLKLIPQS1psGQM6BcrHxzCgEsEUlPY/b5JBWvzCEhG95Uw
 7uk/08Kz/4vyQne4jumGHzA/cbsfwS0JkMVCNKSI+qgA95uZpkt0GaywKg==
X-Gm-Gg: ASbGnctszVjGgG3FvrJoItcypGDG2PHfV5BfoRc96l6KMlyzpmyuWoJ3zQBPRWGPsQ7
 j8vGFQNUbmmw/lmF364TjxCFC79Zn/tUQ5RCeiD69DGE+a7J9/1AsCo/6zSK4+FkkJgdp/HgH21
 c7X52ZVKF+Xjb5y+gLwepvDuNmd/SdOllTYOWPx6f69pAujsl1/Th10bqh04SVH5isJouin45xK
 TqU3hpEUNGz5DEymIUxlP1Htd2YXH/Xk3MLMKSE3JQomt3dihu0YL5QWoEk
X-Google-Smtp-Source: AGHT+IGNvWW5K3ucXXevk+W0OUxtVHpXUHQwg5BmBPjxOP+PCQntW2g93f3NERCaL60X+J97IhhO6Q==
X-Received: by 2002:a17:906:31cf:b0:a9e:b150:a99d with SMTP id
 a640c23a62f3a-aac078c912cmr151078766b.5.1734581677829; 
 Wed, 18 Dec 2024 20:14:37 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f1d2sm19820766b.11.2024.12.18.20.14.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 20:14:37 -0800 (PST)
Message-ID: <67639dad.170a0220.266cc1.0a77@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 19 Dec 2024 04:14:37 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734581678; x=1735186478; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=stjPOzWgOMPqudiVOQB2LfBTUnFGfGe1EZvwgtKpul8=;
 b=QgliupEh7cjrzrzLFBAVmhsVzY0Jg8NIblmxMFJiFxCQyqJxV10yRWpZ3jLtTT2Hpn
 FqIobsjozgL0siaGjkS/p8Ne3yEOtOgldoitlobx5rDLHHiiMDpBhog3qxOiomPepLUw
 B4lwHtRTzYiQ+KBuW1rYQ/m92iG/Vh8TgtpfX2imZ8dhGDuSfbtlQ1o4B694T+ZtYcR4
 AEW+SZmzD5TCkAEv7JVmQtq+A4SJ4M6qVCAIuNUdKE+Zd5h9runWHBSQ2xlI5kBVDZOv
 56Kp45tAJqUWJncc//+u4bMMAZbFn4Dv5bvLQCnJpoIT7SFrIhv97q2fkVrR6EQqZR80
 RL9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QgliupEh
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-18
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

Autobuild statistics for 2024-12-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  5  |  0  |  8  |
  2024.11.x  |  3  |  1  |  0  |  4  |
    master   | 18  | 62  |  0  | 80  |

Classification of failures by reason for master
-----------------------------------------------

               procps-ng-4.0.4 | 5 
               postgresql-17.2 | 4 
                  linux-6.12.5 | 3 
      python-autocommand-2.2.2 | 3 
                       unknown | 3 
             batman-adv-2024.2 | 2 
            gdk-pixbuf-2.42.12 | 2 
  gobject-introspection-1.76.1 | 2 
            host-binutils-2.42 | 2 
    host-python-greenlet-3.1.1 | 2 
           libzenoh-pico-1.0.4 | 2 
                   perl-5.40.0 | 2 
             util-linux-2.40.2 | 2 
                acpitool-0.5.1 | 1 
                  assimp-5.3.1 | 1 
           at-spi2-core-2.50.0 | 1 
                  axel-2.17.14 | 1 
                    brltty-6.6 | 1 
                 c-ares-1.34.2 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
             dahdi-linux-3.3.0 | 1 
                elfutils-0.189 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
            gettext-gnu-0.22.4 | 1 
        gmrender-resurrect-0.1 | 1 
         host-libxcrypt-4.4.36 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
               libglib2-2.76.1 | 1 
        liblog4c-localtime-1.0 | 1 
                 libv4l-1.28.1 | 1 
               linknx-0.0.1.38 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
                 mesa3d-24.0.9 | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.12 | 1 
                 openssh-9.9p1 | 1 
               pcsc-lite-2.1.0 | 1 
                 pixman-0.42.2 | 1 
                  ramsmp-3.5.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/2f6c81e53fd94db51151f7468d2f3dea9ee306f1 | ORPH
    m68k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/a34b277a5dd5019b5836662df1c6b194655a2079 | ORPH
    arc      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/939b0c0daadba43563990061b395103d3e00e26f |     
 microblaze  |          axel-2.17.14          | NOK | https://autobuild.buildroot.org/results/e0529e5fd4d81c04d12ac27df0116b0b31adaa7b |     
 powerpc64   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/925cd08980053b6b929b52ee4f3d37648e2f8732 |     
 powerpc64   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/22d38f957276bc2350c8955b2565f40c506d9162 |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/bf95c4af64abcc61bca91128ea423070cc21b575 |     
 microblaze  |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/d9c4d131c945e96341d260ff47465dedb5235d33 | ORPH
   s390x     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/8ae33f272eec00776c53d085de5bb2970ea21129 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bedefaef79181da81070fc382291468c14f7ab5c | ORPH
microblazeel |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/416d1bf66ff3655ee2883fde99b79743106a6b49 | ORPH
   s390x     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/11fd16637b8cf2d7243d6c1eadf458cf9abae048 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/b12be723541ec55a12aed529915a6bd51d96aa11 | ORPH
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6f166013c2d4f8d8152be35d10358812e407bdf2 | ORPH
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/140499cac034cfcefc6070d35972e0168a287e62 | ORPH
   x86_64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/ec443f53b59eb9e41fbb08a4823b092c95a3d8f0 | ORPH
powerpc64le  |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/9c18296dc4c087c358a0a2ad4c39e12778b58cea |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/ea8b78ad589bb248ee2fd4d502a8a1964d0196ba | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/58dbe700457e0e4a96d8a038196e51d2d195e622 | ORPH
    arm      |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/965ef4d202de95b5b1e4571303bb6287533f0dd9 |     
  powerpc    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/886ed8a7e1e304d90388d747e46841e663b99939 |     
microblazeel |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/0414feab80d9e3aa089161bbf9db12195904143f |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/19facab3e64927feb31c0cbf108b8a2998806c51 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/ec82c5d4ac65a3bc13a9d1ea34eaf5de5ccb1645 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/94759a6f888bd091d1a6b8c729d7594dbc024df9 |     
microblazeel |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/5c1c5b07b3a989807407993984a718327559d1e0 |     
   mips64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/84e95f58adcd01c285fa51020f3b6ac9c8a374c7 |     
    sh4      |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/191a676be46743d961f9c575836f8c7bc96644c3 |     
    i686     |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/7b48f375205c791b87c4e6fca91e2d34fb8b5cee |     
   s390x     |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/5aecc67d4d6af5c456cbdb85a78dd64084330876 |     
  sparc64    |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/c11b0da7f9aab30d1ff07dcca89d0843f4dec9df | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/ef9de632ea138de056e148c5df9219f659a1e305 | ORPH
   nios2     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/19dd30ae9abae1ceda2d6914f29ab085eb1330eb | ORPH
    m68k     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/c765a3060d7d2b5e902f7faebba546e3d87331ea | ORPH
  mips64el   |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/f659fe7e03c98fcc7f8236d48eb60c4060ca3caa | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/f77d7e9b9fd98ee6f8c7f6f73560eddca4a861c1 | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/d3709517ddd38a64ad29a8dd8978ccf6b3a37a74 |     
 microblaze  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3ad5705ccd320e8dc5f12c42c1a25153d83d18a2 |     
   mips64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/21e64384a196109bf4903bac665968aa6d252efe |     
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/fcbbc2ade1d9fc6bf8e808ecde878aacf828cc92 | ORPH
microblazeel |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/00f62304033106c7d74d7c87c075f2685c15a5a9 | ORPH
   arceb     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/64d5349c1566d38ca170a73350a323f69f567ed6 |     
powerpc64le  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/16e188e32d184f05719b9d4d371a8ece98e7567a |     
    i686     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/3c1af9a8d69de376533923d4085df486ae28b882 | ORPH
    or1k     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/80d81057aada65adbbe587f4b2e35dddb4d7bea0 |     
 aarch64_be  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/5eee49b9cf3a8132f16dd6b9e2dc0f5f14b6024a |     
   mipsel    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/d6a26088cabd656a28f612cbe6ca396868c4aada |     
    mips     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/f1079ffa4ad136ac84bebe9a9eeb5fca686a6fef |     
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/19f15dd5c2d4932261dcfa74dc4831c9636026dc | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/2b6b3602f5a8b459e02ca4306f941efa021f70d4 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e0eb5c6df3ed09d1af86a65e994abc8ff88c7fd5 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ba90377be051431a7d48e5de657db2158498c735 | ORPH
  aarch64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/66fbb66e8dc0932df91e883098b489063e9775ec | ORPH
microblazeel |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/4669e0f8165d9a139073e22ecd28033f43dc1f6c |     
microblazeel |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/c338fa26ea7804129d5820f8ed3dc7f9c209820c |     
powerpc64le  |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/05faf9fbdf92a626f77dc6cdf11ff8ba27211d26 |     
   armeb     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/b56178639efad0c2f371a1d337227f9b411fd6f1 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/bbe32b3fe745da90d474c099f957d56a0a1a3b3c |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/14346c48a7c5640631fe7de1e38675f6232207fa |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/b0943e5242148e2422a54d53c83bde5ba7d37d42 |     
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0eaf540dd0f351ecb74dd2798e0e773018a50f26 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/22aa30803f2fa6c600ee7d6bf7471390ba311675 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
       freeradius-server-3.2.3 | 1 
host-prelink-cross-a853a5d7... | 1 
        host-python-lxml-5.1.0 | 1 
                 openssh-9.7p1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/730058f4a72c528d9900e2068431ba989d69b662 |     
   nios2     |    freeradius-server-3.2.3     | NOK | https://autobuild.buildroot.org/results/355cf7306afc1238ff6a8b2b5cd1db77b5fc4d4e |     
    mips     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/df312ccbd5a7593a28798055aff49fbdd7bd8f9d | ORPH
   sh4eb     |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/845c0ea120a0d5b2bab386aa9deed82739e595c0 |     
  powerpc    |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/fa61699f0948fc1e16914f375eb6edcaecbffa54 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                   swipl-9.2.8 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/e399d449c2723b84ae3ebf4c1b2334c1445bd229 |     


Gitlab CI results for 2024-12-18
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648487321  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648489544  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648489546  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648489033  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648489135  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648487498  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/8648489214  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
