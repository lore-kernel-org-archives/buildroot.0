Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2E4C3ABC3
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 03:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2329B80CBF;
	Thu, 15 May 2025 03:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTLKnXUhV5dS; Thu, 15 May 2025 03:10:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6398380F1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6398380F1A;
	Thu, 15 May 2025 03:10:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F3B2A153
 for <buildroot@buildroot.org>; Thu, 15 May 2025 03:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFA3040498
 for <buildroot@buildroot.org>; Thu, 15 May 2025 03:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKf9nbgh0yb2 for <buildroot@buildroot.org>;
 Thu, 15 May 2025 03:10:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1CFF840169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CFF840169
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CFF840169
 for <buildroot@buildroot.org>; Thu, 15 May 2025 03:10:20 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so4362735e9.1
 for <buildroot@buildroot.org>; Wed, 14 May 2025 20:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747278619; x=1747883419;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IpKIEqbIJ6A7MEo/RjLprgUuirEPQ3KkWSqt+2BrEAs=;
 b=sIv4zoVVj0ONaUdl+xCF6PcMXYNBm1GpLHsGYEz60n6Ld7TqP4fSnU8bqVNz8agOqs
 6AacRAN1kHKce70CpooQkJlSF1NX/iXauYm/9tiw3zwFnqmhJcoDTEYiSieBcjS8HZIm
 FQ2YZhJxwPpsVGvAps5dhWYrNXwxHFqQc6wYU0E70zAwaleLB+8OuWzCjZozabZLM6qu
 W8sGZNhTefAvNUucruDG0mcJELNxxmIxI7yUPHmdJSOeKhCyQ6r/aOMZ1Ob0/pHygeYN
 6oVepP1SivUNUBaq5tChkCHMpOG8jXlWBeyFJBhq3yVco4IVNofKOTSkmOT2ZmYZkC5m
 LoBg==
X-Gm-Message-State: AOJu0YwRC09S28Hlrb5Xhe50I85WrE22kDikq2GNCdKFMuCJMWjWlLYU
 rYYloV+1kPN0Hwecx3XvNSqm4duj8sNQ+Rq/U4AUNuJ4EeCvmS/U8+vlYw==
X-Gm-Gg: ASbGncseNYNk1FJDA6DOFuXCruMK89LQz0v92lchbazZeK34NQJtJGh9sNaesYDc0lf
 80g8TFDdtXbxs8NaWuoHAeFAhSWTURAeqrZOkAHLoKujxqj2FZlcIZJ+duG1Jl9H/xeknwTtI7T
 6QH8LE/ezGT1TCfwdbd0B78efeQgCQMGbc/be7F4MrBQvFZ5Av5JzI1f3qadpMyg6crRSfORpPP
 bb7FWhwMLETf8CcfmNGs3RS0Es5DUqVQM2Tq4qWFpxEoRXeycph7eKFjLXghswXfJ1vDRPukfoh
 wc7KwGtfj78AW9FVGYroxE/JXY2HMcC+mpUEgOmm/6W07aJAHx3/C/8=
X-Google-Smtp-Source: AGHT+IF+Ezk1JeqLZdNO9Q8FuQMcbrZTkq5sHUJVKBSa8hGuEP8942TAq7J5Kn/E47yshXIc2arC+A==
X-Received: by 2002:a05:600c:3f16:b0:43c:e305:6d50 with SMTP id
 5b1f17b1804b1-442f2168adamr51481965e9.24.1747278618594; 
 Wed, 14 May 2025 20:10:18 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f338070csm50659905e9.15.2025.05.14.20.10.18
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 20:10:18 -0700 (PDT)
Message-ID: <68255b1a.050a0220.1dbc75.e14d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 15 May 2025 03:10:18 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747278619; x=1747883419; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=IpKIEqbIJ6A7MEo/RjLprgUuirEPQ3KkWSqt+2BrEAs=;
 b=iDkp+L+3/3suL+qvMhS21RP3LAkE7DtY10AmOGnyvwCoSZmlYFGWAu789z5IyuTbpm
 RRz9lBtKlqTvALXMjzcfci4mMEqyV0cjkwjbx0sV6E+v4RuhN4U7QIpwOrDR7GHbVahE
 oAvXsarcxFgyLFljO7uXHUZyTgEvHitAf+7+6rnCPAB+Fg1XssTzdXE1c51K3T70/YY2
 aFa/PIqRDaPcgATlPsysGlVYo5WANAwXE3sTKc627N8T+bx/7Zpj8mVkcfgxEeb6tkXj
 sBvY8liXv/6oqrnBcjcrFTxhUIWxh+MiaHXuwJTD0SHI9HO6HH6YcOJSjJTXCmW5kca3
 0GfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iDkp+L+3
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-14
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

Autobuild statistics for 2025-05-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  | 14  |  0  | 16  |
    master   | 11  | 379 |  0  | 390 |

Classification of failures by reason for master
-----------------------------------------------

                 host-lzo-2.10 | 67
          host-binutils-2.43.1 | 44
                    flex-2.6.4 | 36
            host-cdrkit-1.1.11 | 35
                       unknown | 35
host-android-tools-4.2.2+gi... | 29
                  bcg729-1.1.1 | 10
                elfutils-0.192 | 10
host-go-bootstrap-stage1-1.... | 10
                      lzo-2.10 | 8 
          host-mariadb-10.11.6 | 7 
               host-vde2-2.3.3 | 6 
            host-binutils-2.42 | 5 
          host-oniguruma-6.9.9 | 5 
              jpeg-turbo-2.1.5 | 5 
                 openal-1.22.0 | 5 
host-binutils-arc-2023.09-r... | 3 
                  libftdi1-1.5 | 3 
                 libsoxr-0.1.3 | 3 
                  ntp-4.2.8p18 | 3 
                  bcusdk-0.0.5 | 2 
host-am335x-pru-package-5f3... | 2 
                   libcap-2.76 | 2 
          linux-5.10.162-cip24 | 2 
               mbedtls-2.28.10 | 2 
        util-linux-libs-2.40.2 | 2 
amazon-ecr-credential-helpe... | 1 
                 apitrace-10.0 | 1 
              asterisk-20.11.1 | 1 
           at-spi2-core-2.50.0 | 1 
                    bat-0.25.0 | 1 
             bluez5_utils-5.79 | 1 
                  boost-1.83.0 | 1 
                    brltty-6.6 | 1 
                 cdrkit-1.1.11 | 1 
             dahdi-linux-3.3.0 | 1 
  gobject-introspection-1.82.0 | 1 
              graphite2-1.3.14 | 1 
        host-berkeleydb-5.3.28 | 1 
              host-rust-1.82.0 | 1 
               host-yasm-1.3.0 | 1 
                libdrm-2.4.124 | 1 
                  libjwt-3.2.0 | 1 
                liboauth-1.0.3 | 1 
             libopenmpt-0.7.13 | 1 
             libqrencode-4.1.1 | 1 
            libqrtr-glib-1.2.2 | 1 
                  libsepol-3.7 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.14.6 | 1 
                 mdevd-0.1.6.4 | 1 
                openntpd-6.8p1 | 1 
                   perl-5.40.2 | 1 
          perl-net-ssleay-1.94 | 1 
                 pixman-0.44.2 | 1 
          python-grpcio-1.70.0 | 1 
             python-webpy-0.62 | 1 
                python3-3.13.3 | 1 
qt5base-2b9835f5c9bcfe3105b... | 1 
rtl8188eu-f42fc9c45d2086c41... | 1 
               snort3-3.1.40.0 | 1 
               syslog-ng-4.8.1 | 1 
                 watchdog-5.16 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/df3f79c67715c0ffebdf1aa6541c6c76fe4e9eb1 | ORPH
    i686     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/b8ad483def78017d002cfc2223334d068e4f267f |     
  aarch64    |        asterisk-20.11.1        | NOK | https://autobuild.buildroot.org/results/5822bbfc7d56a89acbda4ed9bcca28f675e3c41f |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/ab102803d8a57c9037058498562fc9ec2f99382b |     
   armeb     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/4234029c7b8e85552047202f8bb393a60099a584 |     
   x86_64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/cfc6ed40629ce23fe6c93a98850a6d6fa36704b6 |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/bac089e56bfb30d46e771c9870801452fb41ca01 |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/24f03630aec425b2b3a74a4c59b35260d1537445 |     
    arc      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/e111a82480c23d375a4bec5918f70b9f360138a0 |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/fefe164e4233994cdf45bde81696e098fbefa93a |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/e81f4d4f5b2a2a612e821af03d2ca6feeed9b894 |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/64d73e43225e25b28d3417e130f710fbfa78b625 |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/e8bc4020251e0fccb9cbd1ad2b86451cb9f790f7 |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5cdb0cc4baf40c41436bb6599c6ca8f579785923 |     
microblazeel |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/679897575f78d8d094d1d395f7106d9da5754378 |     
   xtensa    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/eb243bfd3a230033d80c39d7113a0226b443ad16 |     
   mips64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/668ac7f59ad85d75443ff09424edddae4e0c491d |     
  sparc64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/566b74dfd0dd209ee031af3120caa1cdad8106ed |     
  aarch64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/fecf92fa8070c994c2cea7f38ce9e6b1f9106492 |     
   sparc     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/e31ab10ff49b3e286dfebcab67bb9d179a239b2f |     
 powerpc64   |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/4bdf8d059a874148db9c140f7404392b8a035277 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1225d71224018073ab9b8d59feb0ba2ab1a51a98 | ORPH
  powerpc    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a3f8c9c93ecb616aa3bb6693de3706bfcc7493fb | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ac683881f6d4b3c970953e28c064df0eadbc8817 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/253c738e999c8ca01dedf949bdfabee07ff51a94 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/adba2b4c4c81dce46890557ec071fb9c83ef3ed5 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f07b8dd5bc74931569138e30d643e237559fea69 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/be404c3af0bbea1f7bcb684cb8739ae7d4345508 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/697a8fa1b20624c564c5002eaf5f3b912831c0f9 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b6088c59274cb5a1c2c862390fc42f52b4b58514 | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0d681ccbdb2454d9603186785853a056d02c301b | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f28015ce1aa97518821b6bd559c551e1fd5cb82f | ORPH
 aarch64_be  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/497df89a0a6834defe9995dd4c26148f0005902b | ORPH
 aarch64_be  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/700b2d21ca700b71defe24870e8cc18cb8978f6f | ORPH
   s390x     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/42ccda8518dd94e8953c8db553cf8726a5e44958 | ORPH
microblazeel |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/d1163f7afa61e363db51c126d0b8a614a19bd157 | ORPH
  aarch64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/09275aceb1d4afd876e966050cabb4d015fdc5a5 | ORPH
 microblaze  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/120acaa4f4622a2c2b1c668b1380ee871e094945 | ORPH
   armeb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/4069dbd075cdc8bb0c95760cb9d83fe76ba207c7 | ORPH
microblazeel |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/a1664a4bcc0659cf9da126f8bbb27293b0b8726a | ORPH
   armeb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/528dee1c0cb21023cc44c1fb9879bf4886872368 | ORPH
 microblaze  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/a561716fb107a3dfed81524b2f8336154319346a | ORPH
 microblaze  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/8e85b75ff55f8f2bc5f2006bf09a84dced32552c | ORPH
 microblaze  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/fd26ef269953981c6983a78a90a3484a6d593d4b | ORPH
    arc      |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/79c05aa38ca55376c1362f42d1aec20ded5a7b7e | ORPH
  sparc64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/92ecca757868017b7fd53d1382117aa9e2824e15 | ORPH
 microblaze  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/a2e739cecb933c92b070c5deec1c671f5b98f52b | ORPH
  sparc64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/bd2d91091b30d836a4c43040183071156a2afaf4 | ORPH
microblazeel |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/fd1c39044b076d3d487b3773bbee2a15cd794375 | ORPH
   sparc     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/a750bf44522e36f551e9846224bca43eccf7c16e | ORPH
    arc      |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/a0f66370d49d328b51bd2e16ac6a0e3f073f2d90 | ORPH
  powerpc    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/004823b721fdc895886e3d4c1f988353fa091870 | ORPH
   armeb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/a11939a278bf5019d3ba680c6a6d0f6ea8188165 | ORPH
   armeb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/90ddd6aa1d53ad4a6fe01e67ff8a36cddd7c5f4a | ORPH
 aarch64_be  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/45be520d515c4824766be01a22d6f3db603dd343 | ORPH
    or1k     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/17f09f5a4dd3cafd01144201a805ad140f4f50e8 | ORPH
 aarch64_be  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/adcc7c5e4f80abe7ca81b2b81a3713dab9c33b37 | ORPH
 aarch64_be  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/36a7472dae3b28b3bc06d666197dfa8dec2eba91 | ORPH
   mipsel    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/c0642a1e1424e67548e1850b7a9eb05dd095415e | ORPH
   s390x     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/fb1758ba00606045a9159f5b9f6bc062b229ec4b | ORPH
microblazeel |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/6c6105ba60c4168c23e3b9f204865c30e5a758af | ORPH
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/8c6b0d64d25d3ddff91cae4e2087b9d01aa6d64e | ORPH
   sparc     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/1f0cd7fe876927ccbe540ae38c8ab6d4bb4071d1 | ORPH
 aarch64_be  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/18d5616588b572040eb53bfb05be4b08917693e2 | ORPH
   armeb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/0947ec1713b12c44b2af17cd2b2d85cc8499558b | ORPH
 powerpc64   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/e735a9f796ebb9a1b0106c2f148c708c7114b9bb | ORPH
   s390x     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/fef50bc2d01cf05f33e3bcb16f5a7696a3f29e1f | ORPH
  aarch64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/d8eac6ac4860cb6a47e7ede9209cdb40423cd79a | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/08967a6802e0ccb35e4731efc6223d1b49b94d32 | ORPH
  sparc64    |        graphite2-1.3.14        | NOK | https://autobuild.buildroot.org/results/056ad556f8e571403d0dbf12d3536c10b3631693 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/cc0ab932e57cb20c6ed120a726b5be8381280992 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/eafe8b0a09e3eb8d1e0e7e9532b9c3a3d5e4e2be |     
    i686     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/2d41e4346a306f8e806e63779015bc72c70c39ea |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/00ea22bab49bc24211b5c07057f316d10a26c337 |     
microblazeel | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/0aa9ec976a126ff3e84169a7652e51d80dac4f97 |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/6096c0b7932f10091fe0f6bc889e194858a54a69 |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/c0ffd948cd72a3bc8981f79c0c5211aa35ca99d1 |     
  riscv64    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/12b58547f2233eaa1104eb967c5fe53feaa3e223 |     
   xtensa    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/221eb8c8bb94d760e1d7d89f1c68e844c4b35733 |     
 microblaze  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/852e4f0f2dda44efc266e2cc9eebf6b464113032 |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/9cb971374c1f4d0624f21d02f0c1cf49449c7487 |     
    m68k     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/afe8be2fab4ada90cadc6d05d5dfa0a9374b2fc5 |     
   x86_64    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/fa1040af383cd8cfe52c1dc1eaf7e51c9fccc888 |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/cf182cdab72e3be2d9e32736d6791b4371ecb329 |     
    arm      | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/0a7bf0ad9d201c11eba9a0929cb2649ffe83e3c1 |     
   x86_64    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/4f0bd5fec996ba456977f44c2d9d51ffd7e21820 |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/98dbad58b75a779ba4f5a75de408d23cd67a4f71 |     
   mipsel    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/ad7ac283348f6b397920af0401e52ba5a8d135b2 |     
   sh4aeb    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/e8152490540ee1968182f4eb7813e5e940f3e9b3 |     
  aarch64    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/18997b3f1554eaf9a9b0ef1c9c4d65ec76bccf44 |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/74583cca6158e9f1ca3800e51df7592c9f80c2f6 |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/d95c5a100ca9a11932caf7afe0a528a4ee76fbed |     
   xtensa    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/3f022b5546febb9268ba204d1afe46121ba4bccc |     
powerpc64le  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/898372c382688ebf88321819b8687d61bd7466de |     
    arm      | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/b03e40a657333db6a142992cdfa7ec7c876eff2a |     
 microblaze  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/d80db72cc13f141ac08f504c99e262aca0331087 |     
  powerpc    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/f693066cb2312f4a37837986ea069908b2e05644 |     
powerpc64le  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/d82b023453ca6a83a17ba7d7a26205e4f7eb4c0f |     
powerpc64le  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/fd128e92884855c32e70f781ab0288c24b9cf3fe |     
powerpc64le  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/1c4a0bc8919461a611a3e10815345f7798de4867 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/530a832cc61be41e9b686ed6c91a1c141937eeea |     
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/60387c3c099a1bf30e3dac604c44f5865c6ec619 | ORPH
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/e51f9a013b3a9d100a9e165a40c87383231ae480 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f0ddc24ce8efc00b7188851ff5874026270654ad |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/fa2d72769272254d41bd84a9c93401e6231cd8da |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/deca14a6da2e0c1e7696948f11951ca2541f4485 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c89cf877c864642d3d887fe6d3e20d3820bddbbd |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/61a7bdec31e4f5cb3eb6c63d9a897c9bf5981a9b |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2a9eab6ee4a6cf7a571bc76c6f43a104ee68db24 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f9007eda1c7b9664a4c3c9e73bd8f01209ffecf4 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/95e59743fe3982a5322e06a79ea3e34af5659129 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c7f1a108798b9c95bb5d01e1b35d899969deb59a |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c187745ca11cdb5ff1ff70b8e1a69dade829884a |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a87a5700fd32b0ed092d94e9bdc4f0ee9ebca09d |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/615a65692dbf65609828ad37ee22470b37dcfea0 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4e869f577a877d663ed78e4ecf6c2701630d92de |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b87a82174443be5e1e8e2007acc7697473d5d0b9 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/615af8c85577cd65eaa3b4ceef5fd334eba2d659 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bf7e9c365e0cf0b2b99f540601b74e5fd339c806 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/60bec9a81eced5ef9b869321a6bbdde807f1eccc |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/40c8617e8a0889a74d5ca7969f9a115d5517e326 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4cd724365b910dc1eb4373bcb829a204d86b51a8 |     
    i586     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/43c5c23bb42dfbd5dfcfcbc832fae4333c3e54e4 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d4b1fd6547b2ca8b0398e0b18f13bc47667d6099 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3c200a3c73dea32a2ec0b0f55763c15b6f4889e1 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0d3e4022289dca301a58b405c8db0f6e99cea006 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bca661fbb5ea8e984622bdf77bd57c484701a246 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ac9745f4bfbd5c92ee4c6f8eac9d54d1cabf03cb |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2bcbd9a6d7294be13b9bffee520e966e093dad4e |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/278c3548d82b4cc8499264f9eb7e5a53cd4dd4bd |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6eb923c2c8a44cabf9287c0dfe359384a0725208 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/03554144813f65b298b3ff3293b6b16a070d5b4f |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b05e32f531b1a72d6f03c1926b714401a8d46e25 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f40a8ea429260b313cc0e97d8341474c62a260af |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5b6ca160417aae4a38c36a667015d51b6dee343b |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f608bfbda13d11905cf2a91798cf4cbddd40c8bb |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e33672fe200463290e0670ebb8e2b8d4b7b4b588 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/88b4076d3c7d065a29fe490468d4416af302a414 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8a37269a1e5bf654f9abf3cc58c272a6ff04bc83 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9551de0cf4cfc1a6b60984220cfb647379f2ff7a |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f23c4b1fa1eacf1733d041f24b36dda3b96cb117 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3c017f7b46f610b534aeb45d2c94a61f63f13728 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2981420b65d0c53546772cb3ca2e9d0ba6850214 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/52bf822a434f37e0294b2c232430654f47507d45 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/794231af586337fa8ccbbd5ff01a4aa8e2e32c5e |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0222dd00d9ef073086a270536c075032e1d845d7 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/de3796c46b25bcfb330d5815910b5f940e32ce25 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d55b9753fe374da80bdf2f8727d56de0f6b08cef |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9b267c951d3fa04d26c8128272ae8070faef928e |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e2ea6c1ac9b51f40119742873af7015c08bc4d96 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4afd8f1be8dcb5b3f42a74122649293a9e9354e6 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/5c207ce53bb0966323a0df345c8b6d40f936da47 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/1653a8897bcdf49dfd1f7ae5dd073c1ccf27f778 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/9332745dc14d10b2ab95a6b68ed67b77bcbc2f6c |     
   sparc     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/54321e7d1fe5fa459c808a6efdffa846c52e68d7 |     
    sh4      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/6c1f0a78902bae970b9c53a5fcb8c7d76da47c2a |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/856ea37451d43f12b7b5c27b69335bd1318ab028 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/bb719fb375ec5b011a983a006d6f0b51677d73d2 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/1e02fff3513847c2bdd9eb8e60aa510c0614522b |     
   mips64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/bcd2a3544877e9ce3b0e40ca5de0c3db8db86cb1 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/3591301e47a46dbffd9b8f27a40c9997f3e35302 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/60e65826246aff05b5ec4aa9c378e688b1f581b1 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/930acd3f5ce4fc2a42827ea2433d29aad8475656 |     
    arc      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/3412e47836b54928a55c12b46549d6307ab623e7 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/49dbdc656470bf46dbd94d8f6d215e4757782c94 |     
    arm      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/fd9a29fb92b3ec75fa765399f7a9fd0699b5f953 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/6efe3e4336738938845d634b7e44d2987ba24848 |     
    arc      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b3ec893ecc7959217af05c046a33960d029b08f6 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/df29ca450c20cb882b9c71d062f1169b8b485657 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/1bd6c3a9cc975696ccd9ed8a597545c0a9aa8e3e |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/2c68de1bee849fd0a23fb447475b5b250531eed0 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/e6e688ff921c9c5aff0bf913e642d32feef587b6 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/94a78e3bac7d7a18edb0b605509b9755fa112689 |     
    sh4      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/65e1718d8259e1eaa4509602f99165bf4ee79709 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/356d0efbbbcb2299039b0126bf808e3bb2b27226 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/2cb8f8191236d69f61ace42611592785e16965f0 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/5a515cbf0e2f3fad9e2a87f872ca9475d3dd81d7 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/8d26f34818fe6e70f720d07e589729993cce334e |     
   mips64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/08fd26ee1ab3fd91bd705f452bb5db7cb09ee09a |     
    i686     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/7df3faa58c929db56e8d6a3c2b9f7d1b0fc3bce2 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/17824a9dcd9397ab063cce9acb1682c3164bb0a9 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/5c65a4359a16481b202c17b0ff6d8a4dc0f4e2cb |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/a75efeadd7a9a84a9d19bcdba8827ff4fbe6e649 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/be604033155d22ebe79fb3c4e4cd6be60f3b750d |     
  riscv32    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/11ba14b2a6a92ae82b6473b2e178dce3e711dde1 |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/30a3a0802e874dc00af0ff10ab6f02bb767626ad |     
   sh4eb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/1c9a6710a9e1884a640fe1e54bbe379ea259280b |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/16e9547f0b2b41553e48d7bf967073dd1c16c502 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ac7cb612682dfac53f6b8f1309f56d7f02d71d2f |     
    i686     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/f7ecb9040f54bb8b00927256d56d518559b4ee72 |     
    i686     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/9b260cf2e44e7e6a84f18ecd1884b7fd8a67d599 |     
   x86_64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/6c435d5ad1eecdd42179e148372024f5e67ef913 |     
  riscv64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/b4e4da5be9d729fbb456fda3e26c69148215797c |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/a3a765027cbe4d1dc45dad5ba36416670456cc1f |     
    i686     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/7b8ccf2fc2971a88802fd6807ca8a0d9d5d3422a |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/0ba43f6546964067ff3d550a14bbd0264ccf1c36 |     
   x86_64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/37270491928bd80b21c9eef1c19ae9abbf3dfce6 |     
    i686     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/a8beba2c3ca477b3b75ee5e64b0ed36b5c1427df |     
   x86_64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/910b03c5fc6eb6048b27f28a3fe01c79046bc0ba |     
    arc      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d8da28c8fe4b32068d16a28c52e4cd34fdf6b5de | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/787e4b3e4c5478e9face9315562ba4ab474aeb8c | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ba1eb2989af3cdbc06de69251b91975de323747e | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0f424e90dd2e3390abb6da328408623b8c7cc6b0 | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e74117e3ff74ea89c2e553242c6a1c71af015bc3 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/916f489220a84924df468c3edb1902df19d0ab68 | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/aaa9d952f4a7d5f65e6e2fcdb9f72e7ab2193aa7 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/14a8c65c80d70f2e610fa431523126549a8c8c64 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/db0aed41cf479f3d0684f270102b04193a9de6be | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5a379512d40e623435b68dad1bc5f5357293052b | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e923ffb92767bd17e25c321b13aa5dd1d1c0a019 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d96e07d7d3199d8fbd5c2856091813a57cd0c026 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ea59c719520862949d24ac2dccbefb57be94cfe5 | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e73f631828ff4415e9cda52db5e7635b7fea9330 | ORPH
    arc      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4b68c2ffbf5d4e8e05c90f0b4b20fcaa2c46ffca | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/aa950f1b6b63081b831875a001801ccb2b907db0 | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/603996082b9676129c924283eab6661867877b9c | ORPH
    arc      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/96035f56216944ac6bd4cc4d630c4503484b9eda | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d773fca62bc569b4561228e95818b7ab9d2b07d4 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/889b68a1f5fcc51935b9bfb7f5e7357aa98711de | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/11a4375ef7a15c2c674e48911705d61f8b82a613 | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4f41c499f8ee231f4032092af7e7125ef780d931 | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/17c6596e0b5bc3bfb0bc7013e782e0c62b8bd53d | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/209b37b603ea1898efdc0513e5e4171c7cfdb893 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/aa56f9e762d9af4ea4eded065959e2f043a892e3 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b718a7f67ad4b449f868fbc14aabb6d97b091a9f | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/22a031512d44078988c67dd1e98a5712496cdfcc | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1fc20c16f6894a83b77a4e3c3747e227fb9d673d | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/acca54e002cfa710e0a6fcfd2f8f7e74caea5e1a | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b107fc3964db8f6b32d04e8822271958c31726ba | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6c145b33b0b710667e81510e68488f5c184ce3c6 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/58fd404f5efd1d7f6175236fde1930c5c5833dac | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/56763939d05a4cae4496fb37666f748e8da5038e | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e87a9cf5e44b58e709ccbc20011675473d20b56a | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4c90baa5945b3e1062daa4f5fd101ef6daa8a348 | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b37afd04f0fc9e8f16ea82adef33094ffb44876b | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a0af15773ba337e0ff0acecb509190f5dba09fc4 | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/36b4dcbb87c30b7b498b16b07fc8685e32c1b427 | ORPH
    sh4a     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/3bbc0450e280777ad136d350c07d9f174c8a4fb8 | ORPH
   sh4aeb    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/da540abb58ce16d508dc2c6ec06bec70a1dc8139 | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ad420a4c66e1b40652d03da7ef9a8db9e766982e | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b137f6e257230d0894ad7778d8a3f1e1c53346d3 | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/50cf765eae3ab92706249793aff229c8419d3918 | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/99770e9f09db8b222769eef591b506646cf2888b | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ff4268599db48b588f602b6cbf55b70d951c7209 | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/41a527f4d313d0e4c5a47a605187d458a3b5260a | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c58d376bf710dc06daf612356b46ad37dedc2ce7 | ORPH
  riscv32    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b82389e350e588a944badb2b7ad9d03a5d3cae6a | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/970f26bf50abcbd028719a39129beb76845f010f | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f7e1e06be5bf867436de0af25a0c424705f44d66 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/daf25427291427f07433da001396a80b076fa153 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ba2938ceff7e2d0f5246209ab31de2011407052b | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/682ce3fee011c856b295773d0a956236e79a8199 | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0b858154350bce69ba5ff57f5c85236364b922ee | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/153bfea8504435308d4d02a4c631d2be5b34f147 | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/027d1072c6fe61b9adf770dab47ffefb4b951663 | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f8899f63d6090793e74db72f9de1d8b1fd73b96d | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c92bbd63650d4832c71a6f0a6f811abb1951d661 | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/dde79d2ed030ff5e7cdc1107326be7595fc62d9a | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/21affd368a33bc4fcf948c93ad850e2c44f04c83 | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e10e06e9f8aec496d8e810ac3bb743becc921cb2 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/84c56dba834d949da38e5b710ded76a1895001f1 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8f7e7cd895bd08b959edefc928281207d477d4e1 | ORPH
    arc      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e8efa6b8a24e85c204e00871aaa5295fdb14d5a5 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ab169ae367e3f2d7d1ebc30d96b5c79238de3203 | ORPH
  riscv32    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a703cb111387dfcd45dd0270eb27773ceb27557c | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/436eada2031da33c680bc6a6a14413a56380e180 | ORPH
powerpc64le  |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/96b72cd8b82a3389b1208d599f4f139a2738371d | ORPH
   sparc     |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/ef7eb25bb89ee49b2514268051c10355dfd6ad06 | ORPH
  sparc64    |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/885f2c201daa068dbbfcad3d9765ad4ff209cb6c | ORPH
  aarch64    |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/27d169ee464da92f365276981de6dc0b758f718a | ORPH
 aarch64_be  |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/0d2384896110795d6be29da969dd3e4e03e3e511 | ORPH
   mipsel    |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/f8e1b55fe42cabbd54cb766b5ba7ea22f03608da | ORPH
    i686     |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/b63c01a0ed3d8306b60e504a4fa077eb3a3aea32 | ORPH
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/6ee5a4ca73f923483c08671b213e664b24e578de |     
   sparc     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/97562f982f8828443cc86323676156ea2407c904 |     
  sparc64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/17f121188a962713c43514ecf60d4ba60b2cd24c |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/2e65123af76601f08d505935628cfcfd216d6369 |     
  riscv32    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/392e9377a09939c1da41ef069370c4ecea46ffbc |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/26f5e2271f6b48e18ca9b4eec8f2cf6330fad1f6 |     
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/4e715533c2fe22d4bd477e32473e1da232a6be14 | ORPH
    m68k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/e7676dca0b0e5aed327e6027930d1e4031843163 | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/47db573e1ad484e5778237da43b9ad018e21628d | ORPH
    or1k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/206345cb1925e0f3e68412fc7e6c5ced9d9fe918 | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/93fce1ce8e87ef6f77d51a639480746241f8c2aa | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/f241c1ed77d6e335f9e8733596715d4b15e4ac50 | ORPH
   arceb     |        host-yasm-1.3.0         | NOK | https://autobuild.buildroot.org/results/abb3b1ebd73aaae9222ebaa39bd15bf278d1b418 | ORPH
  powerpc    |        jpeg-turbo-2.1.5        | NOK | https://autobuild.buildroot.org/results/934932ea2813d5b9d495ef7b9cb9c95fabd49dc3 |     
   armeb     |        jpeg-turbo-2.1.5        | NOK | https://autobuild.buildroot.org/results/1340cf0344dace998620815cb50da61c8c0896b5 |     
microblazeel |        jpeg-turbo-2.1.5        | NOK | https://autobuild.buildroot.org/results/a6174570f13a3232753365466dc7a7b20c103656 |     
powerpc64le  |        jpeg-turbo-2.1.5        | NOK | https://autobuild.buildroot.org/results/b8b4a238f7328740ed3a53c933e4be16524b9a5a |     
 powerpc64   |        jpeg-turbo-2.1.5        | NOK | https://autobuild.buildroot.org/results/f13393fa138cd2bbf85bc3358c13e6e493b35ef0 |     
   xtensa    |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/a4dfece6992aeb22448bcd839eae378d9a0f064e |     
   xtensa    |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/b9ff9258f407898eeee80dd8cc4dd1d777f44c06 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/912f8cdb2c963d53b1d1f4eb6a02ae19b6d67027 |     
    arm      |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/f972341366d82e9d92cce2dc8e20e2ec07ba33bd |     
   x86_64    |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/48e7de06653e6e21f9deb51579d178913589adf2 |     
 microblaze  |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/331c667ec2a380ab46ccc43c4a23507a19f056be |     
  sparc64    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/e11b6ac8e6072771e7039365e37e5566f63078cb |     
  powerpc    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/31b6977df5e6205ec1adaabc7a2bb2e330cbc287 | ORPH
    mips     |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/ddc526582fa395ef5da09e549b35ef817a2e6a2b |     
  mips64el   |       libqrencode-4.1.1        | NOK | https://autobuild.buildroot.org/results/7ebb95104a4d74befa15902dd21fa7018b3a61b2 |     
    or1k     |       libqrtr-glib-1.2.2       | NOK | https://autobuild.buildroot.org/results/c75bdc5046ff6306dbfd314ab5720fa3f98281af |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/eee63fed5421eaf049de52f7e01343474613beaf |     
    m68k     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/fb600eac66c4d425bd77448d19ce0599d4ddd46f |     
    arm      |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/922662cf266da79425f0d2805637f540bdf076cf |     
   x86_64    |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/65bcca18733c2312b97e01b757d7d42cc4e7ec1f |     
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/c2f70a929e60ec3d35aac27b184214369e4581d0 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6d5c93e28c53994e0bcfaaac62150337970c4017 | ORPH
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/079651c141287ce0df547cf333a8402a614d1421 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f3cb2f1eb3d885e554b6d7a8ea9260ea0d6b23d1 | ORPH
    m68k     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/1ffba485261486e848648e4cbc09265828829312 | ORPH
 aarch64_be  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/a44a2df4f84b827cef092bd9a4ab38e310296705 | ORPH
    i586     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/8e8ca1e69e6e24f78fc4526abc5ade84a705e474 | ORPH
   x86_64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/31556c25c7d3cc865b60d0733dc7b4092bd1b765 | ORPH
  riscv32    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/19ea1a17df71d784dbdc0bf02989c2bd293e9fa5 | ORPH
microblazeel |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/d3788bf0dcfe10e8e967ee801d425792f5a05a6e | ORPH
 microblaze  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/5dee7a2df71c9ae1f1cbdcd5ac150b9eb1530b8e | ORPH
    arm      |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/17fb7e052433fdf8868cb27f8071c9e36cafa572 | ORPH
    m68k     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/d1f214f79e951ce65586d8ed10283e0a70da2443 | ORPH
   mips64    |        mbedtls-2.28.10         | NOK | https://autobuild.buildroot.org/results/26fc2df20657be8d0c91ba5768ad34cf85a8ecea |     
  sparc64    |        mbedtls-2.28.10         | NOK | https://autobuild.buildroot.org/results/e8bb01c2675b93b8325eedf898e92ec96cf91214 |     
    sh4a     |         mdevd-0.1.6.4          | NOK | https://autobuild.buildroot.org/results/35788f9d39feceda74bc5a4f65a049b6ef89b9cf |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0cd9005fe06466173654a6d6dbcd0097194e9abf |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e782f30177faf58a4f2a1629d13fea4cc8402cbb |     
 microblaze  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ef9034fc18aa9921a01288b6a296a991a4eb6b9c |     
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/757be27ba9f68d0eab5704969e837558a1de0160 | ORPH
 aarch64_be  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/d5b489ab6fb94e719698f27ed8f2454049c54a63 | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/4cbcb64c1cb476685aa952934a9d80b62cae24b1 | ORPH
    or1k     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/b14eb77bf8f7a71ecc4d671b888eaa229fbaf86d | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/903c83d50ab8015279161469820f6a1f9984df9f | ORPH
   sparc     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/64621e2950733787f505655331c0561fd44fba98 | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/dffe7fec77bb15e7b3afc1b957aba2c9a0b56d69 |     
  powerpc    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/8544787f607db35d2b92a3064b2954af57cf0bf4 |     
  riscv32    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/30dfafe6d213cf563260ea41ba667a10eae8cdc3 | ORPH
 aarch64_be  |      python-grpcio-1.70.0      | NOK | https://autobuild.buildroot.org/results/be837c1c6aa15cab2879ae579a2c98ac698ffa98 |     
    arm      |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/91aa2f56058eff7af45531f6e33310ef9257c393 |     
    sh4a     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/2cd631ba6424f8d623c190c453dc1d4e6f0de4db |     
    arm      | qt5base-2b9835f5c9bcfe3105b... | NOK | https://autobuild.buildroot.org/results/37c0c3e469dc61fd70dd2053f623ec28a221e419 |     
   arceb     | rtl8188eu-f42fc9c45d2086c41... | NOK | https://autobuild.buildroot.org/results/065b9afc1c6f9f5561547b12171269adc8c12275 |     
  aarch64    |        snort3-3.1.40.0         | NOK | https://autobuild.buildroot.org/results/87da8bddd46e7e7f1427f79499d1238093402cc4 |     
   s390x     |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/b11a0dd7bd23123ede696e1b49086a5cb546b20a |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/c82e07df779c518348186a25551fd3b73a17ec8e |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/d6a6c6cda249cf1b01e3071def7bd98851eb8d0a |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/d3fb8b888c0ae4026bddc9b02f2a4e44aec1fe1f |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2183b907ea3ed82c705fe6fe62b10f9d0d581331 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/bbd88aba83a377d9ff2ceca76eb4f764b910aec6 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3e51a7ad2e7ef7fe4a4adbe0fb0789f2e9941e02 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/9578a50a50f476b985e608f7e6f26f40eda1af55 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/c9c1b4ff6b34e392b6c50e35c4518533585368f1 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/b4d27faed8838b5154d58171c846488b2e84d580 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/a5030e7b02d8d8714fb29f72ee6fceb17f128bb0 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/e7162849d2c1535392571abff352f624c361ae7d |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/f65ef14b0e0689664eba7baefce8fb42ea724b7e |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/eb6320443ee437b0d13f901ebc3c1ba129671ddd |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/4aee50606b8eb220dfb795c98856a33d43bcadab |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2eed0a0c3b147b158a85af30338f9ac593b2326e |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6e7e69c89c744e878cab31ff222fd0872a6e0c55 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/fcc1bb600c9d24271eb6c2940692b6a1887a549f |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/d258b6020fa8621b3876e4821744258c3ebfd043 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/8a138174c2b02922f76d9040f604039862adfbef |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/9ca63b46837b1b0291b65e48aae1f84599a33028 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/26ddc7eb97de421ebc9ad3f58180652ee8313ff4 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/dab1d034a9c7af320cb1ab99098e9b166ad76375 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/606ea57b8bd8f37cd8b1c8a8cc48a55e39f4aee2 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/4679f875dce3888f271b671ecc8d757d221b2a41 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/27614a5aa90499e07c2e8ae2e2685c6b23e7e9bd |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d13246f0e584b200446a961fcc6702fe5934f4da |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/19035212e01d5ac6acfe006be27e70e225e6075a |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/5f5b989f62c8cf9e63399a81c6ba977d0b7a5163 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/ed76fb6e69732d1816ca1b2c0a1a900d4834371c |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/e394cab8532f64af5c14e8d0855824973733b562 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/22521b9eb75525b59db1822f4e3e405ad44621ef |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/4186d43058b9e17f70c679209aacccca986d7697 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/a6376f600eab9fa421bb32a306de7582f6831c29 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/84227b4c86ec3a0d7cfc94d6f3c785c58d3d6390 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/e48dda74025da228c352f3058993172812681650 |     
   armeb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/532f16d1adc5019a288a553a8a2621b2fdf8579f | ORPH
   xtensa    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/2081f0f65e22f4316a23ac14bfae0be74495246e | ORPH
  aarch64    |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/fa0f61edcbb8d2a7cce782ea0c3491d6828fdb5f |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                host-m4-1.4.19 | 11
               ebtables-2.0.11 | 1 
              fmlib-LSDK-21.08 | 1 
                 libv4l-1.28.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/45c7c86eedf78a56182bddad67ae2eb1e50c04a2 |     
  aarch64    |        fmlib-LSDK-21.08        | NOK | https://autobuild.buildroot.org/results/567b0405b3cf51037aa17bd7e951bdc408b38fd5 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/25e0d6f6aa399b699b6b6502062d500f4379ecfa | ORPH
  riscv32    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/72513ea12b8e88b23b5bc82b2cdfac5b64135d37 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/31a3390e9e1c494e5311b3986a0f44aa775770f8 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/184a207a3414bf4defc9be2a4904ce24f1ef0053 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a989438969760ea7804cb4eec71429498c1fc297 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f9dc8a4e234d7f3e2192d9d351e78e7cd921684a | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b9c7f231da5f65a90253647a71a5f078a4ec1801 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a68bd019b45fae89b2ec6ac4a652f794436fb920 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c45ad57ca4978c6c326fcaa714cbaac7baf653c1 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fcdc4ddd75b013668d364c0fec17ebaea256b7aa | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ac48b6764a09805d8a449ae319a639eb9d7c5ddb | ORPH
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/fbe97537cc09fe0f0ed7233eb530490f9ce46635 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
