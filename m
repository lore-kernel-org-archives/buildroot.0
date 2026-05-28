Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C80BCD5BD1
	for <buildroot@archiver.kernel.org>; Thu, 28 May 2026 03:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF3C6426F7;
	Thu, 28 May 2026 03:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cyc0pSifQWFr; Thu, 28 May 2026 03:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E577E426CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779938280;
	bh=PEi1/qUjpkSut3srhCx3qPHREirr+19kMBB+Wu9zsg8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UZGsG20BAHwV07GgIVWbyRkwL7uL8ebOuP7f59qmn47PDR2Pp/N23Nf/23BtrnGa3
	 Y/QyL88dHVTBmvALM9qg/lu2kGAK9pBxrdHvU8fl3Cihwbi90PTXgIvSu+ePh+dEcC
	 8m5EwCpDgXrdlKpnKw6Q+++EOPqnY81fyodBzwW5xBugTx0JD/u+HqKddsOt2h668Z
	 xsYqrB1+p9x1FdeaWvUHeg8sPVRnlTgxESHQcNitTxgLt+yM8hvhqhl2R3AN2mF/rw
	 Hjmpzwc04SYXtjJWt0qxTZGhp0yQSB4VdnQdutsx5+Gke7boHvo3eyH0ou9gctLxIH
	 Yw7ujM6Q6xgMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E577E426CD;
	Thu, 28 May 2026 03:17:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8905BA21
 for <buildroot@buildroot.org>; Thu, 28 May 2026 03:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 780C342656
 for <buildroot@buildroot.org>; Thu, 28 May 2026 03:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yg43nWrPEAp for <buildroot@buildroot.org>;
 Thu, 28 May 2026 03:17:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 180AF42651
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 180AF42651
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 180AF42651
 for <buildroot@buildroot.org>; Thu, 28 May 2026 03:17:56 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso78645975e9.1
 for <buildroot@buildroot.org>; Wed, 27 May 2026 20:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779938275; x=1780543075;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8SJSFiY/SyPDQ5F90Nu86a0pwMF/u5Dx3hcL6VioSKM=;
 b=cFUx02YtFi81KS9pIWyZJMHDVyyMo9mWvycKIMwbC03V0RBbgZUSvnlqNbb696iEN6
 GHdviUOOw+twdznsMClVYRSYJQXC/zqsUDPPVJwdc71UIT1zVq9b10/fioPx9fi0ThiS
 SF46ozjX1fzOcOeTj9I4r0pxxpdXypOBKzRfvJdNP2wLQk9g9j4Dh+hYvjrECweEQYoN
 HEPF0HE24edNNDap06x7yxzQL1NUibXgExl2vrGXUxXoh3RnvSvix+UgIzT8eIvgK84J
 B6RtFiRuIaaX9NTHHq02fqXqlnu/cDW5kZi1hMwClb2MiKVwECT4FyiEfUJpDR6JT1EI
 d/Ow==
X-Gm-Message-State: AOJu0YwXS0RRALKXwf7NTUULknTrmMIlSz/DtR6qVpzOS967yVdNexF7
 yJ89Rct/xEGzN40ou5DzM5jBsmt3l4xQ5ZzCrppjTqyIlyw/wBHLcphgiQ48qM/O
X-Gm-Gg: Acq92OFcPXrrxVXEFiCsNBVzwrBRbld/44hvj2w8+I8WE2sRhSJK+n2WSBXEvWJM2B4
 uP674MAFK0txXJ0ZgQaA+CpS9J/g92cwrSr/1Qc+jdpYfstqXrMQEi7QP4OT1GQhtwUDhsLTpGB
 kMbwybWGlgprUdpWdS3iTCPuYGlJAS3wM/jceZiOpPCefCJkCkY6blRGxqHWfaOHE/w6bG6Gx6F
 UnjOhs1sS1XY5vy/42fIEVx/m7xfSOtFMR3/hUT/gqzVCfEFfKdhRM1gUnvpmql0J5hOoYBfThD
 rU6iWhQPw77xOyj4dj5JU3Ws7lkCiGT7KlKmByGLMAw+iThGsFWkqtS+ODERw8IpprirV1j+xiR
 CdmIJpkRHxf0H3xWwsNz/rRkdCPMazxcfltCUMsqwWRsfT67PMm8ITPaVPDMni4wCdnUkooTZBJ
 IrDGlV3YfZg4MWQXREpNUay1pFVJhgAgfncumTtF31hYo4gBYB1ew=
X-Received: by 2002:a05:600c:1c21:b0:490:44eb:c1ea with SMTP id
 5b1f17b1804b1-49044ebc2edmr428643455e9.24.1779938274367; 
 Wed, 27 May 2026 20:17:54 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4908b5a618dsm8178155e9.8.2026.05.27.20.17.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 20:17:53 -0700 (PDT)
Message-ID: <6a17b3e1.84ea6d52.3106bb.fd7a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 28 May 2026 03:17:53 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779938275; x=1780543075; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=8SJSFiY/SyPDQ5F90Nu86a0pwMF/u5Dx3hcL6VioSKM=;
 b=KDtJyQ0M986DI4GHLHFma0xVRW7pGuNvhljxAt2QuDaQSXZeWpTRjoPCs76wb0+6AL
 Aypma68Mc8BeCQqWGhcMaPrOr1iLK1CiMIm2VZu61Kyp2E8auW/88UlDfE7a+kfjlefq
 i9K65Qhkgv7fY5fpL44XN+xjofDKdkDMaiJkhi2BUnHNKXh0yiCwGup78IoFlmMa8+/p
 pSXfuozypzYztO9lgK8iQMvxK2qX9AXqw2Y/8+u7XSK59bK+aSZGS+YcbHc3LeLvvMzJ
 Rb96niNzUL1tMIBJFVP1rffPdcZcFvIYrsGVET2F9lMqamrpFiWSrAUaoPaxlgIEz+Ze
 Fg5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=KDtJyQ0M
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-27
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

Autobuild statistics for 2026-05-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 16  | 16  |  1  | 33  |
  2026.02.x  |  4  |  2  |  0  |  6  |
    master   | 52  | 77  |  0  | 129 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 8 
               linux-pam-1.7.2 | 7 
             util-linux-2.41.4 | 4 
                   perl-5.42.2 | 3 
           at-spi2-core-2.58.2 | 2 
  gobject-introspection-1.84.0 | 2 
                  linux-7.0.10 | 2 
             parsec-tool-0.7.0 | 2 
uhttpd-15346de8d3ba42200249... | 2 
             cni-plugins-1.7.1 | 1 
              containerd-2.0.7 | 1 
                  delve-1.22.1 | 1 
                   duma-2.5.21 | 1 
                elfutils-0.194 | 1 
              erlang-26.2.5.15 | 1 
            erofs-utils-1.8.10 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
              host-rust-1.95.0 | 1 
          host-tipidee-0.0.5.1 | 1 
          host-xfsprogs-6.19.0 | 1 
                  iozone-3.508 | 1 
                  janet-1.41.2 | 1 
            jpeg-turbo-3.1.4.1 | 1 
                     kmod-34.2 | 1 
               libcgroup-2.0.3 | 1 
libdill-32d0e8b733416208e04... | 1 
               libglib2-2.86.5 | 1 
         libhdhomerun-20210624 | 1 
              libopenssl-3.6.2 | 1 
      libphidget-1.24.20260127 | 1 
                libsoup3-3.6.6 | 1 
          linux-5.10.254-cip72 | 1 
                   linux-tools | 1 
        ltp-testsuite-20260130 | 1 
                   mpd-0.24.12 | 1 
                       mrp-1.2 | 1 
                     mtd-2.3.1 | 1 
           oath-toolkit-2.6.14 | 1 
odhcp6c-f19dd37fb467c9cf10c... | 1 
            optee-client-4.9.0 | 1 
      passt-2025_06_11.0293c6f | 1 
phidgetwebservice-2.1.9.201... | 1 
                     php-8.5.6 | 1 
                   ptpd2-2.3.1 | 1 
           python-brotli-1.2.0 | 1 
           sane-backends-1.1.1 | 1 
              skalibs-2.14.3.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                 sqlite-3.53.1 | 1 
                 systemd-258.7 | 1 
                tpm2-tss-4.1.3 | 1 
               trousers-0.3.15 | 1 
          usb_modeswitch-2.6.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/22171797b3c74cb30f31ffc333d4db3fc1721295 |     
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/093932d3e557c75f57dee335c7fcbbe1978ada54 |     
    arm      |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/1692838c96f7d05386e9ba02410a74fb8ea82094 |     
    arm      |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/26047b4eb1d3d453fe07dd3cfa294c1eda694af3 |     
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/766c3aab0222cc7cfae35c7e0e6190bb13b56f41 |     
    i686     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/c3fbb590490253eedadec1eb4358ee459284d07f | ORPH
   xtensa    |         elfutils-0.194         | NOK | https://autobuild.buildroot.org/results/abe48fb0f494235f7f8bdd5e6d2899ad0afa9e16 | ORPH
  powerpc    |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/89dc6150e5d8624b0be8f72c09cc01f71a86074d |     
  riscv32    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/4030c6e66bbdccc0dd582dfc10ec1c67ade5361b |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6003b9ed8a9ff488e78d2eac3558b1425ef9ac55 | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6b4fd405f5b2d5830da40b31cb11015283b60d57 | ORPH
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/e7f1534ad43ae50d01d8dc9c6f4b935ae307b022 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/26d07526cb2014d69917777ae587ca3695c39acd |     
   x86_64    |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/89ef293066e93e86127cb23d1e6472ad44611286 |     
powerpc64le  |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/073b8a9e7eaf444e769356796f1328d79a4402d3 |     
powerpc64le  |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/e6440f91c750a3a26d3a2a214fd71c9147cd0e5d | ORPH
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/34f825f89600685ebb54751c50bd64c64e8aef0b |     
   xtensa    |          janet-1.41.2          | NOK | https://autobuild.buildroot.org/results/2d8c1fcd9e9283e5dddc212ae2454232228b689e |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/db98c8a657b65da39a8058fe2230b12f9329ff18 |     
    arc      |           kmod-34.2            | NOK | https://autobuild.buildroot.org/results/8f6cb0d72f34548ca5776d66b6bb0fe31288f226 |     
    sh4      |        libcgroup-2.0.3         | NOK | https://autobuild.buildroot.org/results/8c24647b6c97326d009e3416b2e5044afd0dc57b | ORPH
  aarch64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/9cdf2c211f8e051284c42c7b055d8b8f82ae06b8 |     
    m68k     |        libglib2-2.86.5         | NOK | https://autobuild.buildroot.org/results/0338775570b946dd4a4ffd12c8befa4113ad43dc |     
  mips64el   |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/684da26ec06cc25a685cd1392052e4cc51e5bd4f |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/af4631c8f8401f8984927cf126ae5f59f1a1abcb | ORPH
  sparc64    |    libphidget-1.24.20260127    | NOK | https://autobuild.buildroot.org/results/a4271d900aa1fbedd85d213585c99a5dd95f4aa5 |     
    arc      |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/330b7be8d00190e9b8201ef1c7aba53e12f7a731 |     
   s390x     |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/f5e77a8749202c52a32d67cd470c04ae974c5542 | ORPH
powerpc64le  |          linux-7.0.10          | NOK | https://autobuild.buildroot.org/results/40b44952a5d279442221f266cb959ba4a0f98258 | ORPH
  powerpc    |          linux-7.0.10          | NOK | https://autobuild.buildroot.org/results/466c8dfe3104bba1af88f6f48396ceb8a060ddcd | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/860c513d128133f73e4a7b4500b470405e480806 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/f117f477a0a7c47a5c5fde026ba3411f2036652e | ORPH
   armeb     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/a59a38c6cbfb1690835e0903953e91816c877277 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/edebd9f333ae1ca34c7015e8545cb02f55050e99 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/164700601a9af4d4ac8cff33d0a7a5bd7288ebf7 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/4960e20c2c3b8da75d22ae4ac89a57ba212c8da6 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/8e8ebeefefe80489c0dfa5b17f907762f1aeb491 | ORPH
  powerpc    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/480d1619e4b52a74e54df49b187c4cbe6e09d0cf | ORPH
   mipsel    |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/3680fb57276a57e488202899a354beba048cee3e |     
  sparc64    |          mpd-0.24.12           | NOK | https://autobuild.buildroot.org/results/e1461b76121addd8f04f08819b2e3e453a12c679 |     
  aarch64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/6f58a8189d1e84ca69c0a4817f124bd0bf99662e |     
   sparc     |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/bed65da01d369111a43ddeaaa1a0fc391d1e082a |     
    arc      |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/6a78791abb8cfb69b1d4b91cd3bb2c48cff95cb0 |     
   armeb     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/9efffc4d504a08a5b2133dca5ec013830172fba1 |     
   sparc     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/3c80c59507ac80d11b793dcaa97c0e6d78b85726 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/c5c0bf83a3572d960753129b10eea536bbfe6580 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/2506b3100deaf501341236254e45cf0a4996536f |     
    or1k     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/4481f3d6340aaf22c5d5e38ca5bc496609dd8d54 | ORPH
    mips     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/34c89bba2432f0b105f4b461d812ad60054cf016 |     
   sparc     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/c84fb531700f5a79a37982a84eb6a76fc9323267 |     
   xtensa    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/d2e65df25414d13dbfc4944d9a4b824cdbabd41f |     
   mipsel    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/e49ed5c81f0effcd238120feeb4ba06dba005806 |     
    hppa     |           php-8.5.6            | NOK | https://autobuild.buildroot.org/results/460f82f394de8b72e9de04244c9ef3d9843b26d3 |     
 powerpc64   |          ptpd2-2.3.1           | NOK | https://autobuild.buildroot.org/results/5f3ffe7a71a8c2f3265b0bbf5fc7555ff4b5d201 | ORPH
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/fd71bb262d9a534e9d1ab95962c2cc466470add7 |     
   s390x     |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/7593ff945ac9010364cbaabae675ebf1859ea9b2 |     
  sparc64    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/af108afb68b913852291c0cc0614a1840f7326d7 |     
   mips64    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/a83aafd13a50bf42f4a687deb2e83f63ef966bf6 |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/ff0a2911cdbc5b93956640c5326896840b671df4 |     
 powerpc64   |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/2318474991afb36ac254c575d1630397e535e28c |     
    mips     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/f84477863c1e0ac961044a2caf371efcefc7d761 | ORPH
   sh4eb     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/82e0eebcfa0233d8f121dd832a5876e23616fba2 |     
    sh4      | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/2275c1b46580069667313ec6eaa4eb47dc5b050c | ORPH
    mips     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/7d8aacc1e86a9b8cbf56907e238ccaab09a78a9f | ORPH
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/71ba545bc8e6df54830734350db393f6d4b28172 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/fb16a6b9a16e39b3f7bd2988223e5983e6595df2 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a73058389b4e246b831d64ba488bb739afb79054 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/cd0adbf98f6d57a4d6f3b79d1a5888e95dda5d83 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8ab6f683f66ca3d1e0333a4c61c5f8a58e06093b |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/0408d2272e8b482b6615339f1ecc3dc0abd462c6 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/9f1bb9eae7ba781d04a8910106fdcf0ddb60d5ac |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/e24edead8b623e8fe6f0d0407974484618acce26 |     
loongarch64  |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/30b42bcd500476aa69940f484f947ea67494e682 | ORPH
powerpc64le  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/2500d176a01e6e988ffae9d72706bf27aacd63b2 |     
  aarch64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/23b903aafff996d24ff7194d86ec53de99e5afb3 |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/f7ee6b140cea893bcb0b72980bf4bc07409ec005 |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/6280e09dfa18b89152a563a14860e2413f4a9dd7 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

        ltp-testsuite-20250930 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    hppa     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/1990f747566138a02a17ef37d18552922c30704c |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/468e9f4cb26ce4d73b778d327d5a4e4eb52d7db6 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

 host-softether-4.30-9700-beta | 3 
                 libgee-0.20.6 | 2 
               graphene-1.10.8 | 1 
        host-python-lxml-5.3.0 | 1 
            igh-ethercat-1.6.3 | 1 
           libmicrohttpd-1.0.5 | 1 
                 linux-6.12.90 | 1 
        ltp-testsuite-20250130 | 1 
                     open62541 | 1 
                 openssh-9.9p2 | 1 
                   perl-5.40.4 | 1 
                ripgrep-14.1.1 | 1 
            swupdate-2024.12.1 | 1 
                tpm2-tss-3.2.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/6b2061257089648406961473c3473a7a8e61d17a | ORPH
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/540b7eba10358d93714a2abc572e8b8ba92e4da7 |     
 microblaze  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/b118615fdb9fecffae36bc4ffae9cf0e854a735f |     
    mips     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/d89bb1afb942eb97b61474d36aa6d489db462749 |     
  aarch64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/dd030f35502fad234fe2aff26dfc9efbd112efb7 |     
  powerpc    |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/7eaf140fd97a5da18cd77ad85ca928000fc1ddb5 |     
  sparc64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/34e0d3f090dda7cea7f0d67e22561bbf5c1cefd7 |     
   x86_64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/d4818e8113877e711586f6ee19389f6a7396d2b6 |     
microblazeel |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/05648b53e9e137ee6041dc31b4f802e2abf3859a |     
   xtensa    |         linux-6.12.90          | NOK | https://autobuild.buildroot.org/results/4fc20d5235f2a782abd5027153d1eb05963ae0e7 | ORPH
    arm      |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/1e36dbe8851314cb2574c50328f0775eb8e71035 |     
   sparc     |           open62541            | TIM | https://autobuild.buildroot.org/results/bb535bec51ce22dc5ec200f42f4e8137ec3a7a52 |     
 powerpc64   |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/fd5d9649b212aaf7b900cbcfcf5aba32d61dd5bf | ORPH
powerpc64le  |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/7325bde4ee4d814a9bf07ec8dee62ba4d6012b71 |     
   armeb     |         ripgrep-14.1.1         | NOK | https://autobuild.buildroot.org/results/c32729a2363dbd030360d2b3b3dd1309001afa50 |     
  aarch64    |       swupdate-2024.12.1       | NOK | https://autobuild.buildroot.org/results/6ed019be7ff0144679f150dbd67cec4dd31fdb15 |     
powerpc64le  |         tpm2-tss-3.2.3         | NOK | https://autobuild.buildroot.org/results/b71c6cc369bf9e9bf39aed93145f86105b017511 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
