Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D418AC8303D
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 03:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56A5183B4F;
	Fri,  4 Jul 2025 03:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8dlKpEC94EX; Fri,  4 Jul 2025 03:21:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25CB483B5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25CB483B5E;
	Fri,  4 Jul 2025 03:21:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 08B1515F
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 03:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE6B283B66
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 03:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xf_FvAurAcV1 for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 03:21:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B0F083B4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B0F083B4F
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B0F083B4F
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 03:21:45 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ae223591067so72006066b.3
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 20:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751599303; x=1752204103;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YXylnNCJlveO12l/90Lf5/VdDYC5S8uHiHWvJb/pQwk=;
 b=xMmViqbHQdz+2EI3uxPGa7R7G01dsjdwz4grtQsN6ziWoHLhOPMAjKt9a3MZ75oJx5
 84MiwqzN2Oy7rFRjZbn6S76evsNUb5ryUecSXl9UGXb4ldhpcl7svJVe0Kux2UPvEAbP
 wc1inH9BHlZyfd6GsEbN+XGJnG6s9vfCEpjWm1uE2eJ5C5KrzGjLUVIskEGSLYkDlnz+
 l2L3A4DLkRr5BzjkSkZTZaa+/lJJH9xQLb3BvIVZ8AKYGpVJPh64BHZ2PLtCBqxkIHDp
 qqRUOMxXELuQQGs+EFMwKbRIm5zwbb3C/QFtT9tAj6bga6KzhFNrVJKmFZng/UHtciTD
 SKfQ==
X-Gm-Message-State: AOJu0YyYa9PL6GZORlFc9OxWQ/0wbxjhB4fE3aJNU+mnlgxn3MeOKj7Y
 ObbDuYw3EtJdlrYMQ9//qn90u0dbvnnyNXaCG/0zfDgXsyLo5gcINwmY7HEXeA==
X-Gm-Gg: ASbGnctGbJbFmBlYnEX4HajAhkjy4h6lfDQwIB+CcFc6pI/IohEXoF/f5ndE7RZJRj+
 X13g7bOkJ0HET5VLPKbLw+uAXwZQ+odylrTM60/yG46qS1W+VUOYghfrTgGQ3ycEQqr/KKo9c19
 Q6O+tnUsteD5iNiw/9lTPFiCcGs3nUeXMJhTeTt/QEjbsXHobhAwtHhFiWRPs5tZRwt5bGfhhCi
 7kIM7ymq8bXI2xB/meGtbFKchXzKFouJdoG27lwUYtQ3pxYojl3U2lzPf6LTdHAnHFsd0rSLsxj
 DiiuPB9t6amAZvdDVSFIjJGL6lU3KRuJAUkLWqbJEOQuNLVYLLlTFlGWdCCw87w5bA==
X-Google-Smtp-Source: AGHT+IEV+XRU/9lOpM0FD9VeOfyssHmzxh16mUSeU3peMkTNWwpPW2xTyf4BEXiXHhyZfcMrc0vJXQ==
X-Received: by 2002:a17:907:3f88:b0:ae3:53ac:2999 with SMTP id
 a640c23a62f3a-ae3fbe430femr73054666b.53.1751599303070; 
 Thu, 03 Jul 2025 20:21:43 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f69231d3sm84500466b.41.2025.07.03.20.21.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 20:21:42 -0700 (PDT)
Message-ID: <686748c6.170a0220.31d288.1f9b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 04 Jul 2025 03:21:42 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751599303; x=1752204103; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YXylnNCJlveO12l/90Lf5/VdDYC5S8uHiHWvJb/pQwk=;
 b=QlW1XzV7oQ3h1eu7KgSqwaofya8LleuqvNid8O1Nc1ygkMT/8zuJjBTSa4EPLU95eU
 xTLWwTqBhoITpB5TOVI1E8yCNFcm/Otl6oaMAFLa5XnS2wiqd04AwDqc6i5pMJcx8eXn
 Ovmn7GeKrh0vFbSng6KCyGewESCMAE/4JcpXuGxmQq2HrCgxfs9G8wpv8jaTJN2GVbeV
 TGwNIryG+4otlgIIngOR2qYOb3QGpOygAkXkfTE5VvWzk+C48D6Xvm+RWHADbixTBt32
 CK5yR7scbnnbKL2d3DohBTQMwphYs+rIr+Bp+0nrOi51wG8MhzhDtbDanUeSRwEz3apH
 2NEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QlW1XzV7
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-03
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

Autobuild statistics for 2025-07-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  8  |  0  | 12  |
  2025.05.x  |  1  |  6  |  0  |  7  |
    master   |  8  | 34  |  0  | 42  |

Classification of failures by reason for master
-----------------------------------------------

libdbi-drivers-0bfae6c43134... | 3 
               freeipmi-1.6.14 | 2 
  gobject-introspection-1.84.0 | 2 
            igd2-for-linux-2.2 | 2 
              libselinux-3.8.1 | 2 
                   bash-5.2.37 | 1 
               bctoolbox-4.4.8 | 1 
                    bmx7-7.1.1 | 1 
                   cvs-1.12.13 | 1 
       freeradius-server-3.2.6 | 1 
                 hddtemp-0.4.3 | 1 
              host-rust-1.86.0 | 1 
          imagemagick-7.1.1-43 | 1 
             libargtable2-2.13 | 1 
               libconfig-1.7.3 | 1 
                libesmtp-1.1.0 | 1 
                libglvnd-1.4.0 | 1 
                liboauth-1.0.3 | 1 
                libsepol-3.8.1 | 1 
               libsigrok-0.5.2 | 1 
                  liburing-2.6 | 1 
                  linux-6.15.4 | 1 
                      poke-3.0 | 1 
                     pound-4.8 | 1 
   python-pydantic-core-2.33.2 | 1 
                  rt-tests-2.8 | 1 
       shadowsocks-libev-3.3.5 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/3a435b02306a709c7a112cfd0f6e72e5f16b3419 | ORPH
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/04b7ebbc7dd896c066d467a8a64b205e94f1b0e5 | ORPH
   mips64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7bacdfc30092d1516d8420e9696b83639c36c7d8 | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4c674db6457fb3a2c7d267d803feccfdcf0aef2b | ORPH
   armeb     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/78b64f4a29b58528312e1a826280bf1d1b7fbb6f |     
   sh4eb     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/5a245feba5cb22466cdaa2324545f2c9ea8ab5c0 |     
 aarch64_be  |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/62d9e54ca22f9762b02c3f8d00468d8cc75b2978 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3f8d023dc070d5bfe7709ef600d84854a0bb75aa | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/21cd64bf3235781fef79711e338bc5b179ab8a70 | ORPH
    i686     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/4e36911ced8809c6d9bfb06bc09b5aaad5ca292d |     
powerpc64le  |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/5488d196d68cc00560e374abd4dda3f6db737ea0 |     
    sh4      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/061e7485b58a020262420f4e8fe1a674a8aae50b |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/25debe620bae5f42fc0f3006ae70f7f705788cdb |     
    arc      |      imagemagick-7.1.1-43      | NOK | https://autobuild.buildroot.org/results/fcae5d6d983fca0f53a10813ae0ea657eb08859a | ORPH
   armeb     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/47ebbabbfd7b0b0799f4fd928d5fb012f04849b8 | ORPH
  mips64el   |        libconfig-1.7.3         | NOK | https://autobuild.buildroot.org/results/95a445392870e66e3f9108ad4553ef1471c3eb54 |     
   xtensa    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/315ae5a16dc306b1ea44d82667e11f9650f8be3a |     
  sparc64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/3d5aa3d94944f762fca364418db4775df714ca44 |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/e4bc300bcdb6bff922261cc13dfa2ca6be4386b4 |     
   x86_64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/69b085709091413391c7ad3edb3560e58db15854 | ORPH
   xtensa    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/9233ca2f5a363edf985c596d6f9b6cfadb6262a9 | ORPH
   armeb     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/0822b95ee732463c373a47038aa787f05c578eed | ORPH
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/13a9ee952a5337460aff9e7a9126a274c44c9fd2 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/942d16bda7736c017424ae217961c8cbc8354403 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/dc8bb236a016e5b983ef64b146d6c8d7d3e35f68 |     
 aarch64_be  |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/a2c8fc1c9742102012d10718e18fc67d0d630963 | ORPH
    sh4      |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/24962fb90b9cf24a48fd8d508b46285bf050597b |     
  riscv64    |          linux-6.15.4          | NOK | https://autobuild.buildroot.org/results/b8998f7639ff71b38c3e244646e722ce5ffde168 | ORPH
   sparc     |            poke-3.0            | NOK | https://autobuild.buildroot.org/results/b15af4ab20cbe6ed288218ff45e2646e98022483 | ORPH
    arc      |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/076dedb8cdf1790b1e6055fae0129db77dfa8694 | ORPH
   s390x     |  python-pydantic-core-2.33.2   | NOK | https://autobuild.buildroot.org/results/e00254d566a645b30d810a5619d70bb26937af10 |     
 microblaze  |          rt-tests-2.8          | NOK | https://autobuild.buildroot.org/results/e1927e6e29f0abd32f87b0bb0c8f67721d1b88f2 |     
    arm      |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/97441774b3f93abd71d6211651f708b50106c65f | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/ea1442d64abfc90ce665f27216d53f42c5ed6608 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

          host-binutils-2.43.1 | 1 
            host-libp11-0.4.12 | 1 
    host-mender-artifact-4.0.0 | 1 
              host-rust-1.82.0 | 1 
              libtracefs-1.8.2 | 1 
                memtest86-7.20 | 1 
                    ncmpc-0.49 | 1 
pthreadpool-560c60d342a7607... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0977ccc39f4801814ce9f8591396f109a960f64d |     
    or1k     |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/775d2d68168f214f9b027d9d6a512f1a170ba9ae | ORPH
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/83ed71bccf8e99be83db8397670d996adc440cf8 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/2d0c6b25d76950ca2bd0a5c609014220232e154c |     
  mips64el   |        libtracefs-1.8.2        | NOK | https://autobuild.buildroot.org/results/a0b87e4428f27bf0c18e1ddbbc9cc33525082f7f |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/56dec3c4a97cf64c5d5c7701e79b96ca4e37b74e |     
microblazeel |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/cb292f2c99cdca742a8f52dbfc25f193fe513c6e |     
   armeb     | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/35aa100d72c6875350ad10c57f028f04052cbf79 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

        host-berkeleydb-5.3.28 | 1 
              libopenssl-3.5.0 | 1 
                 libv4l-1.28.1 | 1 
                 linux-6.14.11 | 1 
       shadowsocks-libev-3.3.5 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/12ea254c70c0c6c1b4dccdcb9f8010790795a441 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/d4f8bd9e5a5fa206d562887ea8a4ba0aac80ec95 | ORPH
    arc      |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/165680a4cfeb4fb74307868943ec1aeb585d56c1 |     
   sh4aeb    |         linux-6.14.11          | NOK | https://autobuild.buildroot.org/results/5a22e4d78274b2d622900831ca3210c8e207250d | ORPH
    mips     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/661453524316835fe9be326de6bb3474a1c43d32 | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/41b3670664428f8f8b9a666e2bb157982bece938 |     


Gitlab CI results for 2025-07-03
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548235977 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10548234174 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506754767 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506754326 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506754211 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506754015 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753997 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753992 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753891 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753826 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753819 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753789 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753747 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753722 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753671 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753541 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753539 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753253 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753249 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753191 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
