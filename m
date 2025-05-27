Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CF6C54FB3
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 03:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 723B94030A;
	Tue, 27 May 2025 03:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f0K8_xwpCcJR; Tue, 27 May 2025 03:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20F174033D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20F174033D;
	Tue, 27 May 2025 03:14:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CEF928B
 for <buildroot@buildroot.org>; Tue, 27 May 2025 03:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2316560A4C
 for <buildroot@buildroot.org>; Tue, 27 May 2025 03:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjA5t0vn2XMS for <buildroot@buildroot.org>;
 Tue, 27 May 2025 03:14:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E27746065F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E27746065F
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E27746065F
 for <buildroot@buildroot.org>; Tue, 27 May 2025 03:14:33 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a4d33f971aso1437051f8f.1
 for <buildroot@buildroot.org>; Mon, 26 May 2025 20:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748315672; x=1748920472;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SAxGhJzTJwEaen0VOQJJnECY4HjrppuXbozWBpdEA5k=;
 b=qj2iFBe/aHNDSJWMKZvT6W+ALHy42ihKfFIbSUBK1nZQ1ez68xdr/M14Qa57Hzf1of
 1CB/1AeFd0S7yvOWlHA3iTz2PATD3mskWKwYMtKn/qfEbbTvG4p2MfkIx+DdmUXCjTw7
 7CskEWV7oh2kRjzkoW3I7Msx8RWVPnk22/A1d0J21laCsMXnWCgxILa7m+hQGaEf6p0T
 98kqOk9UWfLDuo7J5mQB0K4K1MmmaDb6YSpwk2zjt6TMv2NmAAG5HyUlv5dgxktGZdVx
 99kJ0HtJFuGLs9uylCnM1HTnlnDmTlY/CObMtnCc7wH6tYip/k4wEWLOwGfc1uE7t28G
 rq2Q==
X-Gm-Message-State: AOJu0Yyzgyo+YYg82k4zO4M82+DZmw+KLUaW8Rs9uEXG8a415kkidFSU
 HqzDnFj1VaLQxGq6tMP8uWCCBXXY3aklY5ONOVf9NllgsH2ItTgutSZa1yHasw==
X-Gm-Gg: ASbGncvBAZvnCC9Aq6BoXEs+xfhyds1E5PvprPhPUDJ8ZJfuNac1ANySt9/C2LyTuwW
 /OhUmzXc/WrcrNnOmaix16CrVFreD6gwLrJpOU9ekqM8E6VHkQHCOFmlhPpNbPx5gyL5s9d/e3D
 wuqMy4HNCWzsYLCKogvyg8WM64zFouqisAu03jsd5VW4f/7VMUyh8Nhlhtn+RTaskScNl8hW6qh
 0XbA28gZQTZV8X0GOH7XZYrmwP88XLzmrnDWT3qSWxGu84gpr3T0048uOdrCcVR7KQ16NzEAysr
 lalhQ5NHqod0+WOSk/8RR/calRY4lYxAKyTSc7DbYfuOqyHjkJzlS8Q=
X-Google-Smtp-Source: AGHT+IHIsQ53JGhr3Vi42VE56nenYBxQa999Z0cJRfbxfeTZ8Q5aU2jSoQEnkVjC1Efwua91fuI5Ew==
X-Received: by 2002:a05:6000:40da:b0:3a3:698a:973 with SMTP id
 ffacd0b85a97d-3a4cb49fa3bmr9292271f8f.59.1748315671565; 
 Mon, 26 May 2025 20:14:31 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4c9dd7c27sm9609178f8f.45.2025.05.26.20.14.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 20:14:31 -0700 (PDT)
Message-ID: <68352e17.5d0a0220.2097f1.bdc3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 27 May 2025 03:14:31 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748315672; x=1748920472; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=SAxGhJzTJwEaen0VOQJJnECY4HjrppuXbozWBpdEA5k=;
 b=PxmfwzkGGANHfl4YIadkyQV1UFNvnIaunkGpuIKzlllNY/Q/MU6Qvvj/WuNhfXtPPC
 2b4S4geBMZ9FGAXufBqA9yd2G5ECv/0BLQxDLp2uAvrnBjJRisdhB1LhHbUd6LTIpDst
 fLk0JRnNqgPmoVfbMyYT1igMWtD8AV537JD37O0+R023V+3mjfWkHR6mtDVzRnazGS4K
 Erxn3Mua/xWQVkLseRMB0op4E9AZjiU77OZRIEBFUCll/RPu5JfzvkqiH/C3sBaEvKWa
 +Ve3LEahBGvsT15KsBdilLJ9yZnq++emsXDVdsFqQ76JedB9hJOXAai5GLFzce7yscb8
 mVPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PxmfwzkG
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-26
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

Autobuild statistics for 2025-05-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  6  |  0  |  7  |
    master   |  9  | 32  |  0  | 41  |
     next    |  0  |  4  |  0  |  4  |

Classification of failures by reason for master
-----------------------------------------------

          host-binutils-2.43.1 | 5 
           ghostscript-10.05.1 | 2 
            host-libp11-0.4.12 | 2 
                    bmx7-7.1.1 | 1 
               freeipmi-1.6.14 | 1 
host-binutils-arc-2023.09-r... | 1 
                 host-gdb-14.2 | 1 
  host-gdb-arc-2023.09-release | 1 
          host-oniguruma-6.9.9 | 1 
              host-rust-1.86.0 | 1 
               host-yasm-1.3.0 | 1 
            igd2-for-linux-2.2 | 1 
                  jack2-1.9.22 | 1 
             libargtable2-2.13 | 1 
                libesmtp-1.1.0 | 1 
             libgphoto2-2.5.27 | 1 
             libiec61850-1.6.0 | 1 
              libopenssl-3.5.0 | 1 
              libselinux-3.8.1 | 1 
                 libspdm-3.5.0 | 1 
                     nut-2.8.3 | 1 
package/gstreamer1/gstreame... | 1 
         python-remi-2022.7.27 | 1 
                python3-3.13.3 | 1 
                    sdl-1.2.15 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e8cf1434c38ee20a3f1ed5e2361001d333ed51b4 | ORPH
   sh4eb     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/340afeba8b0e4727753932fb3800e883516cc42f |     
  riscv64    |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/e68b5cb167c471e272bd6f19ef9a3631622c838a |     
   mipsel    |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/0fd138cc0dee8e528575e623d9c96941b47a35a5 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1fe7e68060f98d5a7c43a6a9bbd54ebefc9eaa01 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3d703e50a88d64a0b65290706f0472db899b35cc |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c279c03833ae9c52b0a13a3aa0116719916e13a0 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/694bf059b34681272fc2859d27f51bd65da6a91c |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6c3aca8221365a2856c1291f59729672f21919c2 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/e6d0323b5e69f7a1444984cd75f04d924b06f2f9 |     
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c2d6bb6e79cfeaa642e5313edf52d08e148441e1 | ORPH
    arc      |  host-gdb-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/f2cd879c127e15a04703a26de445a560d5389234 | ORPH
    sh4      |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/c811af465290e117ee4b2f0b59ca95ee083e20b1 | ORPH
   sh4eb     |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/7b532d50047fd6fcf2f0a50cc3cd4df81037df5e | ORPH
   s390x     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/7cb1cb2d8c65ea8467d317f3506934e352f4e08d |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/d3b4746c8fb0c333ffe75deff3cb50ab9e36f3cd |     
  sparc64    |        host-yasm-1.3.0         | NOK | https://autobuild.buildroot.org/results/6bb11d0b40a829265812641e5261e2ed956615ef | ORPH
   sh4aeb    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/0c5331c6752f71f3586aca3569e6762cf4a3aca3 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/c21aba22c352fe22257b729d53ab510f5af90cdd |     
   xtensa    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/a83a285ae79222b05c66c83944491a44d3e2f093 | ORPH
powerpc64le  |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/0552222b13b0b8d73f69f9a5f630a009dbd38933 | ORPH
   mipsel    |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/93a5c38aeb44bbd8b334ba7d83a301bd4043c72d | ORPH
 microblaze  |       libiec61850-1.6.0        | NOK | https://autobuild.buildroot.org/results/5fca384510d2fb9dd1d01736dee34b53339d62ff |     
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/cc6693f800b71f6120a240ecc300a9b7e1ab624f | ORPH
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b631ee3756e8020ec8614f0ebdfaf85dc1d81701 |     
    i686     |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/083a42fd77f020fada51300a9115fa6cb9a4bcdf |     
   sparc     |           nut-2.8.3            | NOK | https://autobuild.buildroot.org/results/be4247d1027f3b5d8093821254e5ce6574a5d15a |     
  sparc64    | package/gstreamer1/gstreame... | NOK | https://autobuild.buildroot.org/results/de332834d4bf3cc1c80f2fd7c1803fc90f7a3125 |     
    m68k     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/98efe428694dcccda589b0ec2282dd398d28c0c3 |     
  aarch64    |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/d6738058a358294356fa254c8345309ddeff2a68 |     
   mipsel    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/af5e6f1df54232e87ca7e19a8f9372d6fe5fb756 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/05fdf845d14cf997ff7dd9a89b995780eb6082de |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             fluent-bit-3.2.10 | 1 
        gmrender-resurrect-0.1 | 1 
          host-binutils-2.43.1 | 1 
     host-python-maturin-1.8.3 | 1 
              host-rust-1.82.0 | 1 
                  nginx-1.26.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/5920f0a3f4766c8c89d16e49befe638ef856b814 |     
 aarch64_be  |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/1e1e5a494bf1ca5ba920c4e06a1affff4ad61033 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/86207f4648cbec3c71bb7e21926e14ed20e791ad |     
  aarch64    |   host-python-maturin-1.8.3    | NOK | https://autobuild.buildroot.org/results/91b9c4e2adea920bdf77f90af66a4bca1a911ac7 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/871714cb8dab26ea55e414ca039b5f99ef72f503 |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/db50750f4cab8a9af55aa854fe7618b4c6213d50 | ORPH


Classification of failures by reason for next
---------------------------------------------

               bctoolbox-4.4.8 | 1 
           libfreeimage-3.18.0 | 1 
                    musl-1.2.5 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c2aeba2d0f295e197e66d999062238508a652061 | ORPH
    m68k     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/1d5c338c2c4dd5edd98a74e0b62a59e843861aa2 |     
   mipsel    |           musl-1.2.5           | NOK | https://autobuild.buildroot.org/results/06bc4101e46824bea52656f5c758c085b6e65263 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/07f844f093cdde98208b75edb0e0aa370108fead |     


Gitlab CI results for 2025-05-26
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477713 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477571 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477553 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477546 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477544 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477538 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477537 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477534 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477529 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477523 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477519 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477517 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477509 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477505 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477501 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477494 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477489 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477486 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477479 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477442 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477424 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477392 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477387 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477367 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477362 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477353 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477342 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477310 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477307 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477302 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477299 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477297 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477288 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477286 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477279 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477234 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477216 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477205 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477199 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477192 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477191 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477186 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477164 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477147 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477140 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477093 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477079 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477071 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477060 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477053 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477040 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477031 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477013 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146477011 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476980 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476970 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476968 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476958 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476947 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476920 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476913 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476891 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476870 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476867 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476859 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476849 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476846 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476844 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476838 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476823 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476807 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476801 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476797 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476717 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476698 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476685 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476681 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476616 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476598 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476515 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476388 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476279 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476278 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476216 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476157 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476155 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476154 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476152 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476151 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476150 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476149 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476145 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476143 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476141 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476140 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476139 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476137 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476134 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476133 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476131 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476130 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476129 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476127 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476126 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476122 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476120 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476118 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476115 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476113 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476112 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476111 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476110 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476109 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476108 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476082 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476080 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476078 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476063 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476058 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10146476036 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
