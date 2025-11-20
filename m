Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D74CD4F3E
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 04:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C598884070;
	Thu, 20 Nov 2025 04:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Cw9UH_sPQyN; Thu, 20 Nov 2025 04:31:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8056E84078
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8056E84078;
	Thu, 20 Nov 2025 04:31:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 524762A9
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 04:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38F2540434
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 04:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNV-gBWlTqDu for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 04:31:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7414140263
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7414140263
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7414140263
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 04:31:43 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42b2dc17965so369917f8f.3
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763613101; x=1764217901;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R8UOv/TpJ4Twv2ju6S0nU02dmp+QAA00D0fbN6QqVkk=;
 b=E5F651c33oLNuGlK27HHrpmig88rx3wkIUtximPE19bOcFdGNU/XGQDEDl7UNDnT6U
 76WFbLu+RU8VkfET/+temU/hsyUtuu1an0nE5ODSVQgYmO8HezTvMFMNXdaehG9oLcds
 Ny1WPqpVxzPSYQ8cbojyIU0JgPJC6+lCu08DfHehJPW51vNtAb3HsAdKTyxDc3jmoD2D
 AFtiHQBKf0y5RtyH5JdL7SAG2b7k6lxMBxou/KUsgn1Zz4UfDbYTW+WjwMWFtmc+/HOR
 Td7st5xawT4rZyZ1MV+a6l7GxZr8BOVgBkdwn3+gALPlT2ZVirztqFWoAOrWw9eYmpjl
 r8ZA==
X-Gm-Message-State: AOJu0YxLbg+GIQGLqJU4ATUx/va+j3N+eOr+KyZBcNH26VYEauP3cmzB
 o0hFPoKCxclCw2phT6PloU099TMam17/mW1RDJDNtZUiRPiOPEYhI+Y6+YWV0A==
X-Gm-Gg: ASbGncvbnUxTW7wf71PK/q0asx6gHDbtnXJNkKHF2qUWkH2tIALlZ011VU/e9/cvwWY
 Y9fVDebdwvJkgeGDrVAYFp0VisvwlIOxn1ZTRMBfrwgRjrpUJUeSY9piMhx2v9R0qMxGpmCOwPn
 zWXxK32jIeSDUddH8qAVU+g58j+Ud+IwrM1wnawxZoCy73aicnzq2cPi9oO9eY0i8XdpFNqU1cI
 2KLRxZos6RwUJ95gf1vUuEU9o1BI/Sve3BbMlZNiS+o3y3HptMvSK1pU6bcp9ByLOk6RNEBdkvM
 838tZkdKGuISUfhR4yASdRSR6jAUbsODQoCNLwRDAul0mbz5hYV7XoN0BTLDq9UlXI9DAVUckXO
 QoxS99RBDdhzFMFXfH3K+b2G5T0F0zucpqSdrlcAAv4d4DNXK6TKyQld+aqXaHsKr6GHvHKy/JK
 CB7hUsRzh8Zc6sCf4OwQ==
X-Google-Smtp-Source: AGHT+IEmRLI5EfUqz0TgaKMg5GFC/eOPtpmCkZrBi9dcOmLiyx0kdZ6t8HeH7l/6enRd/fm0elsJ4A==
X-Received: by 2002:a05:6000:2004:b0:42b:32c3:3924 with SMTP id
 ffacd0b85a97d-42cb9a067d8mr888201f8f.10.1763613101098; 
 Wed, 19 Nov 2025 20:31:41 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e432sm2910504f8f.9.2025.11.19.20.31.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 20:31:40 -0800 (PST)
Message-ID: <691e99ac.df0a0220.171e07.8fac@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 20 Nov 2025 04:31:40 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763613101; x=1764217901; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=R8UOv/TpJ4Twv2ju6S0nU02dmp+QAA00D0fbN6QqVkk=;
 b=MFE/1cZjjwxaB3Tz/ADHg6Ux3wqLv3famMQwkwgpx7OzdoBSRvyfC6Tqw6B/bepB/w
 UWNHhYvYMCluAAnjU99gG3zcMb/HCLKYA8zQ0PUutofK8NQkMLAcl88E0pj3cr1mknw2
 zYIZ1Ezon8ReBxjWZKaEn1auc8tybm1kp8nv5tpCf8nkjbfk3GBjLbe8V/9STH1URFr5
 6hnNRiheb+SuilQn/rz+eTS/ZRQJ5zoNABsE8gxn4Zjm2h9dFHLhNpfFKi7tL3aNnsCY
 W4/APsqUwxxfAsEvtTlErIIS/V8Sg6dztxwYzSFmvWJARNB/Ms0tLjiQ0RkJJdNdQvZ1
 66TQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MFE/1cZj
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-19
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

Autobuild statistics for 2025-11-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  5  |  0  | 11  |
  2025.05.x  |  2  |  3  |  0  |  5  |
  2025.08.x  |  1  |  3  |  0  |  4  |
    master   | 34  | 83  |  1  | 118 |

Classification of failures by reason for master
-----------------------------------------------

                     kbd-2.9.0 | 7 
                   cvs-1.12.13 | 4 
                   libcap-2.77 | 4 
                   perl-5.40.2 | 4 
          aardvark-dns-v1.17.0 | 3 
                enscript-1.6.6 | 3 
                  linux-6.17.8 | 3 
                       unknown | 3 
             berkeleydb-5.3.28 | 2 
                  brotli-1.2.0 | 2 
           dmraid-1.0.0.rc16-3 | 2 
  gobject-introspection-1.84.0 | 2 
           host-openocd-0.12.0 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                    mpir-3.0.0 | 2 
                netdata-1.37.1 | 2 
                    bat-0.26.0 | 1 
               bpftrace-0.23.3 | 1 
                    brltty-6.8 | 1 
                  cairo-1.18.4 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
docker-credential-acr-env-0... | 1 
                  ffmpeg-6.1.3 | 1 
               freeipmi-1.6.16 | 1 
           ghostscript-10.06.0 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
                   host-gnutls | 1 
              host-rust-1.88.0 | 1 
 host-softether-4.30-9700-beta | 1 
                  iozone-3.508 | 1 
            libargon2-20190702 | 1 
                 libbsd-0.12.2 | 1 
libdill-32d0e8b733416208e04... | 1 
                libdnet-1.18.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
              libopenssl-3.6.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsepol-3.9 | 1 
                  libsvg-0.1.4 | 1 
                  libteam-1.32 | 1 
                memtest86-7.20 | 1 
                moarvm-2024.12 | 1 
           oath-toolkit-2.6.12 | 1 
                openssh-10.2p1 | 1 
         python-rpds-py-0.22.3 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                    sdl-1.2.15 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
uclibc-ng-test-132c6134d691... | 1 
          usb_modeswitch-2.6.2 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/362b2fcbb5645d994defcad9ce4f4837901c0701 | ORPH
   s390x     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/7c2ec045f0d82cebddd371cf765c41add336fbbe | ORPH
  powerpc    |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/8932688c56b98e73cf59b62b9a1d378c0f176c44 | ORPH
  aarch64    |           bat-0.26.0           | NOK | https://autobuild.buildroot.org/results/68ca8142574a0a20fdc4135dfe86a96bfb0d8d0c |     
  powerpc    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/7263cb14e43aeac925a95fa96f91af9eea78e37d | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/23c768fc38a49b43b5202e6eb863b5433b41f4a1 | ORPH
   x86_64    |        bpftrace-0.23.3         | NOK | https://autobuild.buildroot.org/results/a5aeaedc695aeaca4b0827b58252b227c4ce6b29 |     
    mips     |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/b320503ec782f5d8593b174ada943bf22611a8b2 |     
    arc      |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/ff9a922cf7702d5599879e692397f48446097169 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/77d3cf20e52a638479541bb09bfb5a988c28a6b4 |     
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/1bc377da417d214248965c542ee32553c3beef51 |     
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8210da55d88a5039e32b156f6ceacc6dd72a8169 | ORPH
    arc      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ec7f9c4c49617549288870aea639956525e77334 | ORPH
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f85dfdc614b025ca20165caba66779018714b7fa | ORPH
    arc      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f1ef3160f1ed07b41d853a9106a3ca0da6f05e39 | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/05a537f2498bb3c1967d245f3a0c36281898fcd0 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/ce963d166f9f8d46ee7970955dbcf7e950ed6047 | ORPH
   mips64    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/5afffd94a067c0ec4f4586c0e1a89295c74fcaeb | ORPH
    arc      |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/b53f25468ef15e326a6be39527fd105f11fd4502 | ORPH
   s390x     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/5e05706ae814b5cea914a1c105ec33d11dfe099c | ORPH
 powerpc64   |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/404dc3d4c8eaac26802d916bda2e0dd0b6ba6555 | ORPH
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/32fa70f187afea20c3fde63314e7a22cf4739094 | ORPH
   sparc     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/9d526532da75b6e9a16cb9830fb0c3b8780fbee5 | ORPH
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/6fe2a354ab313f04163f1f3844e7df07046dae50 |     
    mips     |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/2fd21e51333539517c8230a210a95c39c11ede67 |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/b6ef26d93d047329153337992a92148fb59cdeea |     
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/21d0af489c15838751f249362769b60a2a5db1ce | ORPH
    or1k     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/71cc9bf9081c2ae14654ce77a4140e32dcbfab16 | ORPH
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/32cfe4b6c2567a239425a301dbc057e9c7d99f4d | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/072e938523d02e71f76412a2341240f693cf360f | ORPH
   xtensa    |          host-gnutls           | TIM | https://autobuild.buildroot.org/results/76a038d7b17c4f54f9706fb069bf1dfb5aa9ea0e |     
    sh4      |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/fb90c6a1de68e7a46e239c0d08bcb48a78d15aa9 | ORPH
   mipsel    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/2f38743cb72f80a4aef5451a2487673eeeb0fac1 | ORPH
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/10570ac9e94e59be55449b1eb311c2d3a1d101e8 |     
  powerpc    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/5b032e99d8414f62514ffe120acf258684cf1a6f | ORPH
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/002fc74505c84c3d959be110992f3517c5eb13a1 |     
    or1k     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/9b044f3904ae8d25bc42d007e90e68cb1e947976 | ORPH
microblazeel |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/3b42fd26257e7364395df3d65ec0771bd8086873 | ORPH
  powerpc    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/4a3a12c05ec25f7b55ee390d7ff2893582d558ed | ORPH
    mips     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/4bf8cf2c44e246e70650db36d02a7ce729eb9840 | ORPH
   arceb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/d62ed8198993f4e974dc778174193c49b453f823 | ORPH
    or1k     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/ee257b17d4546c8c50f8ad4e72aa139ab5e3133b | ORPH
microblazeel |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/f988b3aa4a3142f0cc4dddfc535369aaafb1a2e7 | ORPH
loongarch64  |       libargon2-20190702       | NOK | https://autobuild.buildroot.org/results/9d65c211e8db17c0a51b016def320146c8df46a1 |     
    mips     |         libbsd-0.12.2          | NOK | https://autobuild.buildroot.org/results/5a2dae78525572639d3888f7200589dd5c3eb16a | ORPH
   xtensa    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/5dc7c9014d722f1650dc533859aa3a4205a0b805 |     
    m68k     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/21e840e2b451d56868650bd28d74da7563bf763a |     
    m68k     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/4403d4a4c3551751166b446ca0406d9ea6b3e91c |     
    sh4a     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/b5ba8ca0e137d65f75d1690eefabe621409a8228 |     
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/1106062ae6ea6b05cc802beb933efa6b083a4fb5 |     
   s390x     |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/8b1486344e42349922f581acead387a09bccbc7f | ORPH
   arceb     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/72124372e763974a41dfb6e248333a6b52b41fbd |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/20af475fb2e3426b2a3b83192044d7df25477049 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/8409166bd008f4e647eb78aca5dd64a63ee9f0cb |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/ba1460d6a9f830cdebeea8a4b89c76075cc098d1 |     
 powerpc64   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/ef933c6c0ca55667137e22ca69aaed32fa1a18c3 |     
  aarch64    |          libteam-1.32          | NOK | https://autobuild.buildroot.org/results/f0ade6f3a37e95bdf2cf6e9fdfae8c7d686a517d |     
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/525a760d59b61b0612e9ad1dd2cdc10c1ea5b7a2 | ORPH
    i586     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/cf1d88f766dffd3e19be1a6de7a2002dde469409 | ORPH
   xtensa    |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/ba17f185446dde332047c2ae5dc741041f01e5c0 | ORPH
   mipsel    |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/d1060282a82c81b80ca1dc97df374112d30a691c | ORPH
    i686     |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/f534fc81ab441d15bfa4b2cd47eaf9eda1b10525 | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/b80b0aed9ca01110cdff924924ee412a3b595277 |     
    mips     |         moarvm-2024.12         | NOK | https://autobuild.buildroot.org/results/927ade24c5197835296c08a6e2a4909b6e9a6e0b |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c39556f694cb80a7b4583347c022bd172c47b55f |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/68af4a670c628a8181de5be5a9d7dfa3bc1dbcf4 |     
 microblaze  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/e703b4040aa641bf368886c5947f6cf783cead6c |     
microblazeel |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/843d945842b59fdda161cbd64de117cdcf9214a6 |     
  mips64el   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/e85ce42de3a04144b020e6cde6dea290af64c26f |     
   x86_64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/ec744da0c44a339707a7e0a9db5e3ebdd9085edc | ORPH
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f3d9b2bc01321b2e4a0ad5e62c2b4e2a8a8273c2 |     
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/30cc847ac8653a3cf2504e358ae0f656864ee9f0 |     
   mipsel    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/0c81277c9ca8c1ec1a36356525da7c56a745ba96 |     
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/9a559049502b67542f1ccb8149f490ea932fc6b2 |     
   armeb     |     python-rpds-py-0.22.3      | NOK | https://autobuild.buildroot.org/results/d917ed68ea85167c7bc56b319591bb8f1f1ba757 |     
    m68k     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/cec82f8e606595c1cfccbf56f1d50cca3478f934 |     
loongarch64  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/035e67a0d9af47847119e402fd5e3fb0adc6c174 | ORPH
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/380781399cea57e640f553a9489244679fc1e1cb |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/e4ed84579917a772f163367dc5d1a903b4df4195 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2fc672948b48233428779e8e7ba937b75c9628c0 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8ea389dd283aee58ac5639ded566e1fa96913799 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b13e3ab6c2db97a93a4388ceedd6bf9fcfeeb2e5 |     
   xtensa    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/7b61966384c38b856bd07810564be3e720997428 | ORPH
microblazeel |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/0436ea9c969f16e3e054f384917bf98825cb1ad9 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

dbus-triggerd-ba3dbec805cb7... | 1 
                 dc3dd-7.2.641 | 1 
                netdata-1.37.1 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/facacc17d59e926b6ef5384a98df86caca85f583 | ORPH
microblazeel |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/9f2e3c6624a73705943c919e4936169b4cc31eb7 | ORPH
powerpc64le  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/5ce63e48dd645a60853b54fa845d487b6bfcc8de |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  cmake-3.31.8 | 1 
                haveged-1.9.19 | 1 
           host-go-src-1.23.12 | 1 
                  iozone-3.508 | 1 
             parsec-tool-0.7.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          cmake-3.31.8          | NOK | https://autobuild.buildroot.org/results/2f1de639b3eea5599b68770a16e9066f0c963be5 |     
  mips64el   |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/4f6d870ed979b03471f5c94f4dc6a0ced3c27527 |     
    arm      |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/df65d3fc91a55f85a34c55f3ff2bbfe1c500ba00 |     
   mips64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/a913bf4201841015e3619c2ebbcafd79e3b7dc88 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/b568371a971b7940454536fb5d3ec3e05549ae0f |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                 linux-6.14.11 | 1 
                    sslh-2.0.1 | 1 
                 sudo-1.9.17p1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         linux-6.14.11          | NOK | https://autobuild.buildroot.org/results/8dff35c8ece12cf445d7413032217abc84d17437 | ORPH
 aarch64_be  |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/b9d799afd53687937c52e1108581ef4f6346a113 | ORPH
    i686     |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/146021a291516a4f4a5597c386e4733ad46d3897 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
