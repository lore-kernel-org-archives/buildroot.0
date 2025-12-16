Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6B2D5B87C
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 06:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DEDE811A1;
	Tue, 16 Dec 2025 06:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id npsFjb1PDEsj; Tue, 16 Dec 2025 06:03:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D70B1822CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765864986;
	bh=uAukJq07CcB9LZhoZa1GC9TZDNhFFtdDHOqq78uLsbE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aJE8pEwvAVb1CHIrhMFewZgNy/jw3aALC/y/LPlwEpocHa34jfgvfrlU7wsh8Nrs5
	 e6Y/WZvsp+vGqH4gL86Fn0FPfuv+sgGEbNLncwnoslQVc7qIUgU7cPa9TKztXWdE+1
	 YPX0+zEfHKC55nxzsxgR4jcIxtBIcd8oaOTZFQlFkdv3A+a527Wxft9yHABUqrhugN
	 Mxe4UVcs6XCV8yyUEkOJL5oevilAoz2E+NM56lyT0hvXW8AjK1gJn8dz+ocvYWs4ZZ
	 HfEmq4XJwBIo2Gi+IwzbezSYfFzHScgKTggYQ+bgYHZkRwO5g4cV1oTB+tDL8Ajs2C
	 UfaMymqv1DfIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D70B1822CF;
	Tue, 16 Dec 2025 06:03:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB078117
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 06:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC8F0404C9
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 06:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8px6AiUcIdNg for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 06:03:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3BDCB40123
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BDCB40123
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BDCB40123
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 06:03:04 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso36778255e9.3
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765864982; x=1766469782;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXF0NJPV+LeL9zqKj7UmXWfFGtnP+iyMMM9hNUMsk1Y=;
 b=h+EVc/xdEspGgOaRcLYJ8IIO75jxllApV/Temi9X1DqvXZMt/Y0fNTFepFx9praFqK
 zl3qnt+HIfY1YnOBEs8fP2AOmWG5wvOSVfmDHPQlfw3CKHlEmzc6naNYhFH24QH1iucv
 c4NNrizYz7gFrWLfOmcmirYotwA7MHXBvJv5cUA1ZPMBXF/j7i33EFhgxc+zFCh3gDP+
 iSGsMxM+wk5F6O/iJgoRV529CDXjZkMH7sDhp83xBjaCcCWzwdN9Dg2OC/DrRvbff+aY
 BuHA4U552/yQRBVUfqjDMqRcE2gevKJJIIlqLFeF+/0myKieIR4MBfJkZZy02682x8GH
 z+SQ==
X-Gm-Message-State: AOJu0Yw25s73wKNN0bQGZxoyB/33qdNKsevYImzjXTFu5vFVSLJUja25
 zVteqProzsJ1d/+uG9VURmhh/0xLKkAXYBiBKVhqmrlFwO9m6VO6ZuDCVFcCuw==
X-Gm-Gg: AY/fxX5UNL/8ecJ0G2cTwakQIEueimXlMJP366yJQRoavyDcJbATr6SRrFQmSq9w9HR
 YP93nw1THJIzdfnJw72sVah0KgdmxWK9JP5cJ94961fNtWrfbASYAIIxNklSi4tjvGwuGQvbDAF
 d210UQMrd8xQgDg3XER6Yi/7jxolx5PGOQd2foTDo4ig3+ETHmcUQwHk5M/eLNA5P7pWFqkRDk8
 V39e28nigFDByB29WRTTflkrMrz/x5wHtqVx4MzTnlqFOS7ArWrH1iiCG0YwGC3sE1qgFTJbf9z
 ynXln8GM6A60a+aKiktRTdTgdpojhE8UwPHOja5YBT8gvxGknbyVetdknEYxxksEd3jP+PFGMCW
 GN4h9CinoacGd9C5wf4rRRC3Vkwc6SXNOPJLuZhQIGqjydlPawP8JGcHEjgrlJZRpEIrQOC9ieO
 yt7gGCvwIyDo3KChyOSQ==
X-Google-Smtp-Source: AGHT+IENhZv/LGYgyS/FghHEFQqaJLYTX+NVUUn+m/SY3xv08I7t5ePv7AtzlDEIT8uSD71jqv2YxQ==
X-Received: by 2002:a05:600c:450b:b0:46f:b327:ecfb with SMTP id
 5b1f17b1804b1-47a8f8be22bmr141302615e9.9.1765858789537; 
 Mon, 15 Dec 2025 20:19:49 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bd8f8b138sm1258045e9.1.2025.12.15.20.19.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 20:19:49 -0800 (PST)
Message-ID: <6940dde5.050a0220.16de8f.0ba9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 16 Dec 2025 04:19:49 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765864982; x=1766469782; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WXF0NJPV+LeL9zqKj7UmXWfFGtnP+iyMMM9hNUMsk1Y=;
 b=RpWt7eRn87hZgEvmMQKUH6jN/TjwvSKIPUD5ZNdE1/Zino4z4YWroYuILsIzovXY4F
 Ut2HXSB+yVoPvnTyR9a3SF9hrNcExgbwnPtwH/cVgKO63XiKsE9py1/cfxDo7phsT+bD
 cTuBFyHheA9ukW7zcXh2RnhGq5VPhfRKQ9QViNrQpo9Bj1Fc/XzfSCwqfi5hrkCYaBrE
 18I2i19lun35X5WOVrpxalIDf8MQHm5ktKuXueo8P/vorN7DflGNCDPb2Gid9D0UPujD
 v963Z2yAtG38ve3HSdOQI4rjDNqp/fDMxbVxbL5BVC8t7dBFkUcR41yQ9mzq1WHX3zcN
 qa4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RpWt7eRn
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-15
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

Autobuild statistics for 2025-12-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  4  |  0  |  9  |
  2025.11.x  |  4  |  1  |  0  |  5  |
    master   | 37  | 73  |  0  | 110 |

Classification of failures by reason for master
-----------------------------------------------

              host-json-c-0.18 | 6 
                       unknown | 5 
             dahdi-linux-3.3.0 | 4 
                 jasper-2.0.33 | 3 
                libcuefile-475 | 3 
                   lsof-4.99.4 | 3 
                netdata-1.37.1 | 3 
                 host-gdb-14.2 | 2 
                 libiqrf-0.1.2 | 2 
     libphidget-2.1.9.20190409 | 2 
                    mpir-3.0.0 | 2 
                 rtl_433-25.02 | 2 
               asterisk-22.5.2 | 1 
                   atop-2.12.1 | 1 
                  boost-1.83.0 | 1 
               collectd-5.12.0 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                   cvs-1.12.13 | 1 
                   dante-1.4.4 | 1 
              e2fsprogs-1.47.3 | 1 
              erlang-26.2.5.15 | 1 
                  ffmpeg-6.1.3 | 1 
flashbench-2e30b1968a661474... | 1 
                 fwupd-efi-1.7 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.84.0 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-15.2 | 1 
    host-mender-artifact-4.2.0 | 1 
            igd2-for-linux-2.2 | 1 
               iproute2-6.17.0 | 1 
                  libcgi-1.3.0 | 1 
                libcurl-8.17.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                libglvnd-1.7.0 | 1 
              libmhash-0.9.9.9 | 1 
                  libnids-1.26 | 1 
              libopenssl-3.6.0 | 1 
              libseccomp-2.6.0 | 1 
                  libsvg-0.1.4 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
                memtest86-7.20 | 1 
                  parsec-1.4.1 | 1 
                 procs-0.14.10 | 1 
                 rpcbind-1.2.8 | 1 
                setserial-2.17 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/27fa1ea609d774378ea9164fcf60188524213907 |     
  powerpc    |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/a74ce4b515fb5b133e274cf35b929b18b38d7118 |     
  aarch64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/8345236b4d1637c73ea60ce2a9c2683854abc1e2 |     
  aarch64    |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/4630d706dfcbc20d8b9d1a8ecb4bfacde14c31a2 | ORPH
  aarch64    | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/266717ece3ab2d490c12e9590a1ee5225251ebec |     
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/559b062c2b5135f66cbd7f39f4f5cbb48e7ab788 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/49d9526fc9d180592bf154f0edc5bafe15a20131 | ORPH
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/593fd977e08af824b73e5805d5198b3114b6fbcf | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ecdceacd51e53f7365445f9713787527bbd40390 | ORPH
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5e5a28eeadb7ed2daae9a4a898fc605cbde2c256 | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/ba8ba95ae200e855126a4ebcf2fdee18fb07e31e | ORPH
    arm      |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/15b7f329821e09238e597b3273fc1942c85aefeb | ORPH
    arm      |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/008c1e8985a893b83934d8b0df647e62141bb715 |     
    i586     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/fa0375003a8fdf0b692f50e17e8e02e9883fef84 |     
   sh4eb     | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/40114ceaf1054e30e30c5c14a546882e85a1094c | ORPH
   x86_64    |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/4470af908e8e6d41725ae039472a8cf42962cb5e |     
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/10b227fe26aa935d1d72abac1e2047678de164ef | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/16c971c577e0dfcf320e19c92b4ee383b16ad868 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/9815b1962b149eb244c27baa92a6a99eeba5263a |     
   sh4aeb    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/edde9d76b552c27abc444978a044e2111f7f527a | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a6e9c4ee00c811f51cc8bb1ba4d0fa2988bc2080 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/60de5012293b38e93d77c4abb9e739c193b0191a | ORPH
    i686     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/90aa8f413a2e014ccbb1ed6b75cd9987dfd29ac1 |     
   sh4eb     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/83cb4ab5fa298e55d98798864904f253a9cceea9 |     
  mips64el   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/77988dae6d1f788f958cf8633f338d459ad9eaa8 |     
   mips64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/098803c1991914a1ef5bde075e6fd9dabccb197e |     
   mipsel    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/c45ab38ae9022f349319b37f223de3d74557e981 |     
 microblaze  |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/29ff74ac650a4c925f96cef7e63c127b9f6392c8 |     
  riscv64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/a3471fc237069c36f5dcd755aa2add7dec2705a4 |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/3a3a3e8a4f623f523698c268b516ca7fa6f52089 |     
    arc      |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/cf9384577ce0da21928412ae8b0361be36b54b62 |     
   s390x     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/d10b5116f0607f2eb1899429c130baa6496a9ac4 |     
    arc      |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/e86f5a74c8ea9780dfb7d995e8466f7707675e75 |     
    sh4      |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/161115654ab3d33c83bdc219a2f329e97bc68b99 |     
    or1k     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/69289a05006e24d6b42d6c450f6700b7767c23df | ORPH
   mipsel    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/dc5f4b46a09b5bda7c058074676b7fdb2dc35610 | ORPH
  mips64el   |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/6fe6b0415e1c97b7538360a139e3b51549200e87 | ORPH
   xtensa    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/b92211c11edcbf4a0c5abe823e0deaa14133ae89 | ORPH
    arc      |         libcurl-8.17.0         | NOK | https://autobuild.buildroot.org/results/721147ec0806306aec992d8d881fa5d2f1638758 |     
    mips     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/5357c7233a964c764474dc167d501ea780b54b50 |     
   armeb     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/1682ca6db80ebcc2f2514ea19849b8e0821020c1 | ORPH
   s390x     |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/e5de6c70e971c5ba10cf4e5c645f7a07d2726bb0 | ORPH
  mips64el   |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/13910475160dad441862b45f8aefca30bc0de658 | ORPH
microblazeel |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/5bf33f8c64ebcbb94bbdd235863f4813755c0fc8 | ORPH
 powerpc64   |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/e751666f7b28d07bea1674debe5f462125405187 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/9db13bb83a9743aacf4e1641a497dc03654d39d1 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/f67ee31154f0f6f4d0784410dab3fc9455acfaae |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/9eac1462efb6f04d7edc5eff0c92e4ae0bd388b3 |     
    mips     |        libseccomp-2.6.0        | NOK | https://autobuild.buildroot.org/results/43be3d92fbda873299bd6e39a14ee9305d144685 | ORPH
 microblaze  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/2ac2c13857938cadcfceb0a2ce1acf430e4b618b |     
   sparc     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f86a0c3ff87b7af8d03054088f8ea88fbe27c9f7 | ORPH
    or1k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/eaeb858205d69e0ead312d459188232aab9c49f2 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/31d9534d549a1000b21959b98f1c16ab4ef5c62a | ORPH
  powerpc    |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/727daf2eaf565b6fba0ad58dd10021cd62ebe8cd | ORPH
   sparc     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/b1504a67816cf24b44281b69131c6c68fde5b535 | ORPH
   armeb     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/488133856d233ecea898a453a32c1f067afe9f44 | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/11a7ec39f25226380cc110afc871162eca82b917 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/68ac022769cbc491c0027be6088f6b98f4793739 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/31f4480ad9de09e09a7bb8b50828c28079a2e2a4 |     
  mips64el   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/85ae888db1b9a22227fd7d227be6c57d2145783e |     
  aarch64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/093c54c250d5100ed44d38740b7b95a021b972df |     
    arm      |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/0e363d40c65fc1c8ab3bb2e2fd28a9e1f43ef9a4 |     
 powerpc64   |          parsec-1.4.1          | NOK | https://autobuild.buildroot.org/results/1c49a77e86f871d6d5eeafbfc07c4ff728ef6f9a |     
   s390x     |         procs-0.14.10          | NOK | https://autobuild.buildroot.org/results/8e2b3d33776677eff3ebdef88f7f5047516bfb2b |     
   armeb     |         rpcbind-1.2.8          | NOK | https://autobuild.buildroot.org/results/8021235d43f26ffcf23222c354fc22a358e0c817 |     
 powerpc64   |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/bd9d206966a5bbb4bbe308e8d95acb034fe6873d |     
 microblaze  |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/d73cf52d8fd752c4864a114962e645db25bc38c6 |     
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/ce0be43388126880c2011b64a218565de2227b72 | ORPH
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/dc185c3d4886e9cfd9e6f46b50b864e5b2f28605 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/99e28d61aa1542acecd475ccb4e08c79bddb6200 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/b7912d2c3b7eb2d0b9c79ea8bb5faf22ca26e432 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/ef1a3e21f33cc08c0442f3057e5ab28465f28d8b |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/fd534d57fa113fb508458083ebd3b2ef468940bd |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

 host-softether-4.30-9700-beta | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/7151b39303f5b2310e8b2681596a8a671f3b82f1 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                haveged-1.9.19 | 1 
              host-guile-3.0.9 | 1 
              libopenssl-3.4.3 | 1 
rtl8821au-8ea0ed9da764448c7... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/e908d029f97aa35f60a0e8bbd0fcbe60ff9544c7 |     
   mips64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/2acca8b129175dd3fc14f43d96f27c6eaacb2830 |     
powerpc64le  |        libopenssl-3.4.3        | NOK | https://autobuild.buildroot.org/results/52923a3391f851b8ccd535016d44ba760500efe7 | ORPH
  aarch64    | rtl8821au-8ea0ed9da764448c7... | NOK | https://autobuild.buildroot.org/results/c74f49c05616dac139cbf4686d4acc867749fa7e |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
