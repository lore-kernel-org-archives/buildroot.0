Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DB8C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 03:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D761984A48;
	Tue,  1 Jul 2025 03:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u49kw2KJmbw8; Tue,  1 Jul 2025 03:32:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96F148404F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96F148404F;
	Tue,  1 Jul 2025 03:32:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 27DDB1BA
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 03:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1644B614D6
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 03:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zwFtw_cL9WoT for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 03:32:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7FA17614B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FA17614B0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FA17614B0
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 03:32:00 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-607cf70b00aso10455835a12.2
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 20:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751340718; x=1751945518;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tBE/3w4aIYJ4b6e2pGsel44eFo4FTcGkuN0EeQCaQ3A=;
 b=j/W3KCTZGG5oZe6t76h7VNcxoKOUMH6JQHMoGFIbRf+XB3B3sBeY5EnEokocFpRZcB
 eU0Mdj+uFTiHmyUBC9k30+BvcwTVCtcuzg6WCHyjFAIcKcRkoP1WgMmMAHQYCPG0duHM
 9h3JL8V+lPI75fSDn+717B6p2Y56C2VnS1SJnEOU4Xty6UjtQ7wK6D2UnFmQEym6Fmq9
 TfF6bBKxkVkwakYUm/k8TJJXooChntEGukydvrHwuoIVPeLCBsGXE0V0LOFzMA1QoEEW
 wVkeJoxKUernSF7K3DEokk9pYNPrkDL7SCD9QgKJFUtZApwQEesCPjG9Yvl3pS5HVkli
 xGXQ==
X-Gm-Message-State: AOJu0YziIGegByV0zPDdoxH+57Bbemx/Q24njJwW7fw51HrAu5MBY1HC
 J8hcHi5y8Ja6axMi1ieYgB0cmlb4lJIEqn0zRMDB78N1pyZJhkaYsHHfRZXPZQ==
X-Gm-Gg: ASbGncuWQwVk0yLBDH2tp6Vc5THvki3zzDlz1eqHi06ei8DvcmmghE0QCE+PCSFRsJH
 dKhjBx6Pho0dStimIfBlsEZCHm3Vf4Ko7H9jNd4iaM5gMzG/YG1y7ghTAFYXVgaV4cFvyd65VWS
 8XbohPGx9OuW4boM57buTC8r10d4dOeQCFK2TKyZ5i6yR9gzWdDduPa1zVzOtrNqvD5k+BEVYZa
 GAD7O5ZGjyW2HsmNvoy6D6UnIbBIucbPj9yHBH4m0N7yJUrE7bVItkD+8eergepTZf1zxySBFfv
 RFhFaoR9iPK3F8uua/Gmt8dJO6JcKQjFvRuuvZZd7XL29e3b2nYEfSuja2viXcpzKw==
X-Google-Smtp-Source: AGHT+IHJ3N390hMIh0mcbWtqnoQLd8omHNojFEBCp6OclOOzKZJY01BCsgnYNIvZlOru1+aJ3Ss60A==
X-Received: by 2002:a05:6402:2350:b0:5f6:fab2:9128 with SMTP id
 4fb4d7f45d1cf-60c88daa7cdmr14223469a12.19.1751340717986; 
 Mon, 30 Jun 2025 20:31:57 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c828de500sm6813738a12.18.2025.06.30.20.31.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 20:31:57 -0700 (PDT)
Message-ID: <686356ad.500a0220.db107.2614@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 01 Jul 2025 03:31:57 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751340718; x=1751945518; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=tBE/3w4aIYJ4b6e2pGsel44eFo4FTcGkuN0EeQCaQ3A=;
 b=eUJmwUpiFexBqbV1nFhJMk8Ho9cu2zBus7sGKbMxdtbFy0tis2231ZeBMRZHWw5dIJ
 5kRxw131G9n+oUbflpZYOY1CgOwlNmBOpf3hyHQAX2Iy4SiZbMvpRoaikSLXLeMnFVl4
 An+LLTwO7zsE+lZ5Yq+lYjcbogYAGohPoCIQR4pTSWDYWkBH4lcI4CgCkgogwBQ1yTUN
 jPcCZVDz+Sz9F1oFI10Q6iSPbwEl50+P2msED28mfgAJE5Ot0lnC57TnK4kLqM+h0cwT
 lMt97WhtE/H2jC9pOBxwNs9g5vdiOO8h6Q1dA4MNkCeQfIdksXknzLuY1K2cxWQ8BMnm
 Z2pg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eUJmwUpi
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-30
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

Autobuild statistics for 2025-06-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  2  |  0  |  8  |
  2025.05.x  |  5  |  5  |  0  | 10  |
    master   |  5  | 36  |  0  | 41  |

Classification of failures by reason for master
-----------------------------------------------

               bctoolbox-4.4.8 | 3 
                 c-icap-0.5.10 | 2 
                  iozone-3.506 | 2 
             libargtable2-2.13 | 2 
amazon-ecr-credential-helpe... | 1 
                   avrdude-8.0 | 1 
                   bash-5.2.37 | 1 
             batman-adv-2024.4 | 1 
                    bmx7-7.1.1 | 1 
                   cvs-1.12.13 | 1 
                flashrom-1.5.1 | 1 
                   foot-1.16.2 | 1 
                 gerbera-2.4.1 | 1 
               host-parted-3.6 | 1 
              host-rust-1.86.0 | 1 
               host-vde2-2.3.3 | 1 
                  jack2-1.9.22 | 1 
libdbi-drivers-0bfae6c43134... | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
              libopenssl-3.5.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
                 logsurfer-1.8 | 1 
                  mender-3.5.3 | 1 
            netstat-nat-1.4.10 | 1 
                   perl-5.40.2 | 1 
toolchain-external-bootlin-... | 1 
                       unknown | 1 
             util-linux-2.40.2 | 1 
               valgrind-3.25.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/9b513bc7ec82119bc14861ccb064a57f853bbd7a | ORPH
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/c68f71365e83d3ffe5b5c73132865057f467deac |     
    or1k     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/a3278d75273ae0df609b1e3e7c7c0f36c59ace80 | ORPH
   mips64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/6119c92b7fccdf2d661b0de4ed85f309ce50f6f0 |     
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a7210a13f03d7a2c454c08fd13211a59c32cc7e7 | ORPH
    mips     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/8c008560aec96cfa24c3d8b168dab606efb73c91 | ORPH
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/8eb0bf4716b6dc52279ee522a8a2a40b2fccebb8 | ORPH
    arc      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/f86d6161133ab24243039b3e9c629263b6fc8567 | ORPH
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/c82e70a553745a901dfce94be3d82f6a75ea041f | ORPH
  mips64el   |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/6c96072eeb70a4d8ee178af8243283f7b7b85c94 | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/660988d21d4ac312add5ee346f00b7fa37140132 | ORPH
    mips     |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/f5065862f5bf9a34fb5fb5f7a57aead02fc5b66d |     
  mips64el   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/a6ba80585f1d36ebf09f6edb3befacadf97ab621 |     
   x86_64    |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/2f38445c109361dfb0a884f722f4f9da515fc36c |     
  powerpc    |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/283f52d50ffef91d82a1bdc1f4dde1d54c5ffc23 |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/db888d623bd685e16c9b32590c5d3302ff874a80 |     
    m68k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/3c1acc1fbaa0f019e4483898018fcc132deaba2b | ORPH
    or1k     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/a6e7cf91daca15ab63954da1c5364c4a2812a0bd |     
powerpc64le  |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/03a8aad61e9dc5298ceaea4d68211363f4b5109e |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/9e3dff7eca1845d1bbee3c346e49e57714ff3970 |     
powerpc64le  |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/9f16768489db5e81d537e4aa33e8e8217b03b610 | ORPH
  powerpc    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/4492998c68d0329256e7f6e11d6cc9f53d706180 | ORPH
  powerpc    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/59bbeca30adc0f88e722a76d761d3f2f461bd295 |     
 aarch64_be  | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/d54810c342b2d7aa21ab22efdaf0e21dc9834698 |     
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/1b617d38cc3e839dcf3cbf2575dcadb59e21c61d | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/2a5a2cce7bab1b49fad73a3ff47ff827a84acc23 |     
    m68k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/a7972c619668fc1014c5d96cef83a14467413e0b |     
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/a69808eda0dd20c867047132bf750a5f58ddaaee |     
   s390x     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/cc8555ca6864a96c3339a67f9932c9870aea447d |     
    i686     |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/a59effffd675ec1b7b7732022208950190225d26 |     
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/ccb004e804de5f0d39527abfe7108ff663e6b72b | ORPH
powerpc64le  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/c8fd629c6c9c081e0fd4b0cd47c086e8ef3b2a2e |     
    arc      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/a0210fc1b43d71c9031c1f3bb015a0b106227119 | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3450221580ae8a8d13710e07bd692f810f57ddd4 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/009ee72c86a0d6e80e1b5cfd27d47ecb60ccf48c | ORPH
  mips64el   |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/2cce5ed93e015657558784228bbf53ce2d12e87f | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             erofs-utils-1.8.5 | 1 
               procps-ng-4.0.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |       erofs-utils-1.8.5        | NOK | https://autobuild.buildroot.org/results/3280466a07c47705a0d0ae5928055ba2482e4c98 |     
   sparc     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/bb607e59ea14feb10bd55c3b3af0e2ca1260771a | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                  assimp-5.4.3 | 1 
                    bmx7-7.1.1 | 1 
host-binutils-arc-2023.09-r... | 1 
                  libjwt-3.2.0 | 1 
             parsec-tool-0.7.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          assimp-5.4.3          | NOK | https://autobuild.buildroot.org/results/44fe768a212ca67b83a8bc8ef390e2609f12af24 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/64799eaa37f5640f6e250a0679a0add5ffede961 | ORPH
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/e9a03143d56f9057d5e3f83d0fa50d39f530f039 |     
   armeb     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/eaef69180256ef23ab6ad0de9de1c6cb3a6de21c |     
  powerpc    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/d5d7559332ad13d8006d0ff324388870eec5af4c |     


Gitlab CI results for 2025-06-30
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
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
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753782 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753747 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753736 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753722 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753671 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753541 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753539 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753519 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753434 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753433 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753420 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753410 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753407 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753404 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753400 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753397 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753393 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753391 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753389 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753384 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753382 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753381 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753377 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753374 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753368 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753365 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753359 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753356 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753353 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753351 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753348 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753347 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753344 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753339 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753337 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753335 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753332 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753328 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753324 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753322 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753319 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753312 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753311 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753306 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753305 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753300 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753297 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753253 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753249 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10506753191 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
