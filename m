Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F51CAC59A
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 03:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32B278131A;
	Wed, 24 Sep 2025 03:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFGrI3LuvtaG; Wed, 24 Sep 2025 03:19:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4ACD81311
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4ACD81311;
	Wed, 24 Sep 2025 03:19:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 20C15129
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 03:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E4AF608E3
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 03:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kDXBdHoErNN for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 03:19:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C8CC608DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C8CC608DC
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C8CC608DC
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 03:19:56 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3f1aff41e7eso5214412f8f.0
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 20:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758683994; x=1759288794;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UTOuyUaAqW9nR7sQz3SEu0oBpngudo1neL+7xOm49jk=;
 b=X34myknttnvkKys+j4+eedBEJO/VjFajmy62Z9HmHh5W0RV3W3/mPKLNM5TTVmbL32
 rbj+hBor/5d/7jVXXFb2FXF8WoZGI6SM7cAfIfBpfqigozzCejN2qyOXQbU3SwXaSbIE
 tz6h/hXQ8rp/22MPZKcwisXktDH/by2PstFqSS8cwfGl/vCz45shxWUBoBT2p7IqTThj
 zAhc7TLBMk9nGB2qeGVksFRzCVAavs69+8fRwPfaDkuk1SXFrZOqO2UxILoKabdqBPUH
 P0I4etdlb1+MmVSt4AQFjD2wdMhuLaEK422fjcoTDgkEmkCLcIQ3QYLv6eVNvYqeeAQc
 Tceg==
X-Gm-Message-State: AOJu0YzpRbp9tg642YzfFJx0E7jQwBApCXT3SagOauqDO1+/oD89NY1S
 hzFXtGvJ5CogQLPmUpfrxvQqWYr/sFpclNmugkr2CuLu4OOZML3ntTEmF91FQA==
X-Gm-Gg: ASbGncuGevh7IYwO05jzJ8A9836ZPK8C/Bediie3tchG6RgqLaqM7MPYXVTpn0AfMk4
 TxQMdERbkpUYLM+Rh+YzIpXQMAHw1uPmJbE54ulyLFwb8tsdQFZEqrwSaWRHD0veUZW7qWc/8HP
 VR7JpnePm8N8fqdb3e3CbZZIR3PHnR6u1hDTjMsWMOjnXY0dEAZuiWAjBxl+Z40R/vuDBaiEs6k
 tRP8KuqtBRO6qdbQ7k7DXu4kJjgL3qJcWACebLCRhpiUbQjme1ighrXURNT+Ca7eCnGOFWkghum
 ntRsri7RdgkPJeVKHrLSmGHtwvWKJ1aqpjWXjYEzqxWexZ5XsGGcH/kAYzZJdHmOUst7P8PVQzJ
 gG6rMR+osM+zWwVzzn9+fyFu11w==
X-Google-Smtp-Source: AGHT+IFwPHOdqa1pjNMMNwlN5wQF2n70GM41O0/8FOwbkfuBdoQfBqsY2JEe5FF6obBsNcK3JJ54cg==
X-Received: by 2002:a05:6000:268a:b0:3e8:b4cb:c3a0 with SMTP id
 ffacd0b85a97d-405c5bd82d5mr3213628f8f.8.1758683993977; 
 Tue, 23 Sep 2025 20:19:53 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2aaca1eesm11176835e9.14.2025.09.23.20.19.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 20:19:53 -0700 (PDT)
Message-ID: <68d36359.050a0220.1ca6da.2cbb@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 24 Sep 2025 03:19:53 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758683994; x=1759288794; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=UTOuyUaAqW9nR7sQz3SEu0oBpngudo1neL+7xOm49jk=;
 b=d5Eb2cuLOUdfG4A/VZI+bPsI9WLfFMyA2AkJdkhMrQIFYzPV75coPKVSosLrpiK/OS
 0KAo/R5z12uDJcFJCJf4JxvwoO8WM/BI3q1AVCuLcGK1GX9hCwFzXsoQk1AUPIfXFhLL
 J7N6nOXdkRmJeVZhBM2iQJIPvcbishEokddH0C0/v7mErnStCg2PWJxeRbEYk8fw/3uq
 phiKz2q4sO0rH4BGiDcUsOMa5hYX8t51PRa8pntlQUIT+nNmJs+98eb2ZdksAMnlcBnr
 DXfGWSZXfvAKN8tvOCrfu3UWbMMydKGghib0nblNTTwcAGj2zMVAYRXHtoNCg6+SPKu+
 lX+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=d5Eb2cuL
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-23
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

Autobuild statistics for 2025-09-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 11  |  4  |  0  | 15  |
  2025.05.x  |  4  |  3  |  0  |  7  |
  2025.08.x  |  1  |  3  |  0  |  4  |
    master   | 33  | 96  |  0  | 129 |

Classification of failures by reason for master
-----------------------------------------------

                   cvs-1.12.13 | 4 
                  libsvg-0.1.4 | 4 
                  cairo-1.18.4 | 3 
             dahdi-linux-3.3.0 | 3 
libdbi-drivers-0bfae6c43134... | 3 
                  linux-6.16.7 | 3 
                 logsurfer-1.8 | 3 
                       unknown | 3 
        vulkan-headers-1.4.317 | 3 
amazon-ecr-credential-helpe... | 2 
               bctoolbox-4.4.8 | 2 
             berkeleydb-5.3.28 | 2 
                 c-icap-0.5.10 | 2 
               ebtables-2.0.11 | 2 
                   foot-1.16.2 | 2 
               freeipmi-1.6.14 | 2 
  gobject-introspection-1.84.0 | 2 
                 host-gdb-14.2 | 2 
              libopenssl-3.5.2 | 2 
                   perl-5.40.2 | 2 
procrank_linux-21c30ab4514a... | 2 
                 siproxd-0.8.3 | 2 
                apr-util-1.6.3 | 1 
                    brltty-6.6 | 1 
                  brotli-1.1.0 | 1 
              containerd-2.0.2 | 1 
  distribution-registry-v3.0.0 | 1 
                    eza-0.23.3 | 1 
                 fwupd-efi-1.7 | 1 
              host-guile-3.0.9 | 1 
    host-llvm-libunwind-20.1.8 | 1 
 host-softether-4.30-9700-beta | 1 
                lesstif-0.95.2 | 1 
      libabseil-cpp-20250127.0 | 1 
                 libbson-1.9.5 | 1 
                libcurl-8.16.0 | 1 
                  libenca-1.19 | 1 
                 libgee-0.20.6 | 1 
             libgphoto2-2.5.27 | 1 
              libmhash-0.9.9.9 | 1 
                  libnids-1.26 | 1 
     libphidget-2.1.9.20190409 | 1 
                libroxml-3.0.2 | 1 
                libshout-2.4.6 | 1 
                 libssh-0.11.2 | 1 
                  libva-2.22.0 | 1 
           libzenoh-pico-1.2.1 | 1 
                   linux-tools | 1 
                openntpd-6.8p1 | 1 
                openssh-10.0p1 | 1 
                openswan-3.0.0 | 1 
                 protobuf-29.3 | 1 
                python3-3.13.7 | 1 
                 rtptools-1.22 | 1 
                   s6-2.13.1.0 | 1 
                s6-dns-2.4.0.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                   seatd-0.9.1 | 1 
              shellinabox-2.20 | 1 
                 sudo-1.9.17p1 | 1 
                 systemd-257.7 | 1 
                   trinity-1.9 | 1 
             util-linux-2.41.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/71fdbec1cc75193e52c7727daf797edf79884ab1 | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/fae17e186078079fff3d0f51f441ac1e5a1da266 | ORPH
   arceb     |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/06110fc69a93b30190630c67f9b7f78ea900ade3 |     
    mips     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/ea8e5d205ab6c500c2986857b92be4c343c6c05c | ORPH
   mips64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9ee34b43a0589d360ead25ebf3b36a79e4d91ee3 | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/63679b69d777abd585f725a3dd61d2d86b4a0003 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/62ba68448a8f4964b3596ecc70097ecc7b272a8a | ORPH
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/ca2289b702d464b018bec2cd3b209bc51eaa0309 |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/d6a60afc18af56780b01b8c6c94e2caba8d00ff1 |     
   armeb     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/f0d8d172f21973cbe33e2bd3e30014c4c8d82971 | ORPH
   armeb     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/b5cbbd5e7ade0cf99cb6bd810d6f4f24172b6dcf | ORPH
   armeb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/5d3466b63ccc8216732e1a5b6c7e09b7bfff658b |     
   x86_64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/e4dfba9425186ee228827a8ba9345d9b4f156818 |     
    arm      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/728d6760dc8d7b1aa4723e6aea597f5e79e19e1f |     
  riscv64    |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/dfa6f3aa5c4345ab17c3bf9f3b1e87868690d51e |     
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7a177fa6dd1f60cccf3755f63ba22c42384344b2 | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/71a5c5514cb3525ee91542df5be840f23598c36f | ORPH
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0d26b3c38bb5b2c1170c50c4edb7e96a22bf5262 | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/dba1578d3c78a9016fcff03b49733d24f99032e9 | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e9154de619e6a5cc41f3a2f11ccfd3d47cf1a853 | ORPH
   sh4eb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/58db7658f15d258c99079df0e199d3c2eab5441c | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3a9cb05576b6fa26173b4c6455d31baee4a7e021 | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/ab65ab96de183b6599c0e618f6897db10ae1e3f5 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/f0c84a574d13bd345d0a5406153807390682a2d6 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/2f1acedd5b5d22cfdc407cb19ac80eab5f3b0ef2 |     
 powerpc64   |           eza-0.23.3           | NOK | https://autobuild.buildroot.org/results/4ca2ff518fe327f2cb1b55a7e9e5b758b638b442 |     
powerpc64le  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/8e6837bc63944298cd4099e47fd701c24862b063 |     
  mips64el   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/ff5dde5e238909d6e85e30617f4c9b58ef82fb00 |     
   sh4eb     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/af2a43f4049681f4fdf5393245028c701d56e821 |     
microblazeel |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/53cb8007c4274c95133f7c174e2d2057060747b5 |     
   x86_64    |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/723ef54eba78a9ea63985a267caf3a8764017194 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/17570cc5ac663ebf70413487d0febeba7775b384 | ORPH
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ab39c0b562814bf2b03f77f6ef9aefb3697f71f3 | ORPH
    or1k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/2569c3d4deeda4feaf7ceb35f17f26d1b87d601c | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/6fb6bbe3a25db7a9b833681346f55c55ec272305 | ORPH
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/53d158361e180b438221866b5df56ff9b0517081 |     
    arm      |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/d628ea2c9e7cf45fde9f3f1812dec735d1af9aa8 |     
microblazeel | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/f1725ae9009624f63e3a68a54a8f2386cba4b8ef | ORPH
  aarch64    |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/69a41fd7e67dab1d89098bde79515ff450d428ab | ORPH
  mips64el   |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/3de096660898e13866805b473eb81e02e4dcaf4d |     
   sparc     |         libbson-1.9.5          | NOK | https://autobuild.buildroot.org/results/adac17da4f3ec3e0b27f83c29dd974a3ba8d1569 |     
 powerpc64   |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/debb54707e0e94e2dc816e5a34e45e039269a6ee |     
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/cf7684182f17208a2196f0f0cc8927e4cc1eea34 |     
loongarch64  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/dd309bdba4980c42900bdc149a9f4285dfd2c56a |     
  sparc64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/27df36281aa0b3b0d59d9242decbabfc60d0dd29 |     
loongarch64  |          libenca-1.19          | NOK | https://autobuild.buildroot.org/results/49b8163d0e6757e08624c2870ad286cadd8feaab | ORPH
 aarch64_be  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/1142e1625c2dfad7213b3517687f97f9988f041c |     
   armeb     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/e486030e971a2f5992451c8b76d76961e27a4287 | ORPH
   sparc     |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/3679cdbf1d906aeaef678f1d0f11ff5e3d7d01e0 | ORPH
  riscv64    |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/9ebd3bb35c65eab84d6a8f8dc34112ac86e1ba41 |     
  riscv32    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/6f505a56242a2f70ea48a8c76f3d436940911ef7 | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/e6c9da121eed6f314aac36abd26840117e880629 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/c1e040b9222a9faab274accb0038bcc5711f7b8a |     
microblazeel |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/010d47f88ad73e2c8e6ebeb600f1062dce39dd2f |     
 microblaze  |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/3a3bb3c6e45820275063128a116134717ac85963 | ORPH
powerpc64le  |         libssh-0.11.2          | NOK | https://autobuild.buildroot.org/results/deffa3afe4f0083a522870bf951d5890db8e08f1 | ORPH
   arceb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/d1eb66ea7ace94b323ad9c35c48faf1cbc54befd |     
    arm      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/a6365572b8ab438085affcfc92bb30aba8ac744d |     
loongarch64  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/13659bd54364b872cd4de54e69e7fd2f89cd6733 |     
   s390x     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/338b8e8378c81b72ec1538c813b6adda2e307679 |     
   mips64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/78c2c7ff2e24525e45182f86c7e08ba76dedebb2 |     
  mips64el   |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/f06b7fee0908203a871edb86b057d4b73ca69e5a |     
    mips     |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/f961724a08bab4a8dbdf4df8104008cceb6d87cf | ORPH
   s390x     |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/921689e8bb834920613f71a63205e9cf6236aaca | ORPH
    i586     |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/24a4956e090145bb23a67da1f9e7ea8678203061 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/4f45c8e3658ec71bf7ff4517a0d23916025e895e | ORPH
    m68k     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/a8cb134d94017f6888f7803b075585c9ffc03c33 |     
   xtensa    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/fbd882beef9813fc14b440636de426f787370679 |     
 powerpc64   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/de57bfc1a3aab82e3d6be47ed68f09d1e0117252 |     
 aarch64_be  |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/b37e68f9ce5470e79afb2d9af06eade43ba02cfb | ORPH
powerpc64le  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/d6cf8202f545000287fc21eec190f131e86ecd5b | ORPH
 microblaze  |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/ab1ed04033b85e8772f18762d342ebb991f1061e | ORPH
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/9cc061087438df3536c8e443c5f035ac40aac1ce |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d2f3b7b1d6c9857bb5bc637657dbc06b42e8637a |     
    arc      | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/fea2d18cbc93720c40ca969fe6ec3a53fc46a792 | ORPH
  aarch64    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/fbe465c909d59f233f137ce12d3b8aa4027a2c4f | ORPH
    sh4      |         protobuf-29.3          | NOK | https://autobuild.buildroot.org/results/e9761a20c2b82fc074d5a8a7cbc4d572ef1e5fd1 |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/f6e427a15abd73fb3ddab00d5d2b01e008f9582e |     
powerpc64le  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/5665f0a0d6572453c5f7760e2924d034a563cb45 | ORPH
   sparc     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/c7678131487d634f4642d29436117b47296553e9 |     
   armeb     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/315f726ade3c2dad6580e3be5cddbe456f527f4d |     
  riscv32    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/a86edf5c2cbec989f8fa24d2b6b32f9d149cf860 |     
  riscv64    |          seatd-0.9.1           | NOK | https://autobuild.buildroot.org/results/8bd60ee6c4791399fb4232055a68e57b52ba2fe8 | ORPH
microblazeel |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/47eff2eddf6d6aa0ab5d00727bfbadbb33829ddb |     
    sh4      |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/7cb43cce7e1fc7c864fd8a418e7f5071711e691d |     
    sh4      |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/42f3b83ded884128b1b49290935d2856d6ab856d |     
    arc      |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/8ff1e7d9ed72df247d6deddb241db80dced9c348 | ORPH
 aarch64_be  |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/b535f0b6f209c2b1272f4a2be04d8b4519183366 |     
 powerpc64   |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/f954fc3a77aaa54600010713ed5753b41481acae | ORPH
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/b6273c7e6b0e0fd0adffa0861192aed080b72a92 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5329c6c1a9ffbb30cb9b76832a5718fc7776f758 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/ed6f40809e0dcafb758d60f7d9628ef44f5b4991 |     
  riscv32    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/e98d4ac0a8ebd89ec136381533cd9387d58cc28b | ORPH
loongarch64  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/a1d1f8dd096c6cf75642210c358905ecf2b3553d | ORPH
    or1k     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/92cd78f809a5ec37f4890bdd45217c0c85e3b403 | ORPH
   sparc     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/5b0c7d9a4d6e1e7d850dc28bbb13ad2c9d79739f | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                  libjwt-3.2.0 | 1 
                   perl-5.40.2 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/186f84b0b8917c62342518d1b32a1eee8cc3933c | ORPH
   sparc     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/3a00bc99130427bdbee54d5f25fe7a3a9918ed03 |     
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/c8e1aff5da7eb71ef32dcba0de917b2c6603a98b |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                libcurl-8.16.0 | 1 
             parsec-tool-0.7.0 | 1 
                pipewire-1.2.8 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6c18954d629590f84342179c2a61e95f198ee60d | ORPH
    or1k     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/ba793376b64f723df453367ad50fdf9c4fec7e7e |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/2204eb2c4c5843e26fb2ac47ce1d4b08aba2f418 |     
   sparc     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/fa9284f219f599997d4a05a0b39efeaeb9f353c9 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                  ffmpeg-6.1.3 | 1 
                 mdevd-0.1.6.5 | 1 
                nushell-0.96.1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/237d4ee7adcf325ec0af4d0da8eae9b13c3f6cfa |     
 powerpc64   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/4c25cf48a4e10483cb9547425c2b9fdaea726d84 |     
  powerpc    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/7762df14a90ef5f8015b42e98ffbbcf4757e9a91 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
