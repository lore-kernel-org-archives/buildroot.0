Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE283C8303D
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 03:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C9DE84C8D;
	Wed,  2 Jul 2025 03:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TizNLtbJ8_-L; Wed,  2 Jul 2025 03:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CBAF84C8B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CBAF84C8B;
	Wed,  2 Jul 2025 03:21:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29E49196
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 03:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B7BE4030C
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 03:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0l8n4PluXUR for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 03:21:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB9BF400B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB9BF400B1
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB9BF400B1
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 03:21:36 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ae36dc91dc7so675273966b.2
 for <buildroot@buildroot.org>; Tue, 01 Jul 2025 20:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751426495; x=1752031295;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EvQ3grh5Xg8vf1LsET9SnrvyEtx0/FVbNpm2lEUOTy8=;
 b=AgRlCyezlHKx1/gntj65y1HY2xMTBfRF9vOLu/ypzT0hqZKvvBzqypdlmtgS51nemP
 pRqY7b7gIw8mdGDCfDzrQEdrfLoJtJHfmi/vYOb7ERwRXJqgHuTZTd3zD85bEAWgctrx
 ITXD3NKHPryXblFyrLrcInbS+fR2hNa7PighvsOMjklhtyHgDllZf8IRzB1y87BxwMA3
 RlaTzWdJX8ReCbBK7XlAaI4CUUa1Jmoddc6jnppRtIYbsIPFRByyl1+maLcHpslKNgpd
 V+Bo7rCL6pxYewKsQ0V//apcTWIfgcCXwNk7XbwFImOPX077ukVDteN71eD225IHtYuH
 qj6g==
X-Gm-Message-State: AOJu0YxL8Az6savJ2TVjy+Xt7Bn+PgBG6URPNB/wDwGMMbQ573xX9PcV
 f6j+lzlLkGrjZuJCBofmDQQq0RxLaz1gaWI0UMDEyYbXwY2O9mXysG6KKC0kYQ==
X-Gm-Gg: ASbGnctYQIwlNP8ScTWlVMIjAvI0LzqCAy7+vNURj7OvEoDAe4rgmgehlL5ctEDptY4
 mVDCrH6wzoH5AzG5tsY0NGcJk+YiJsIrTuE463ofbrxuWc06SnIKVtLD4VF076tI9adkyS9Q4TO
 JK+Qxusgw1gOEj6kOSgMmPTxynpe9FDtk9JkTGc7GaazLQ6S65daoGj1XN0tDK8bjAvjXPPexdL
 1ldKHTRB5vnk8oYkEQ8xJvjBRgD5OY3rwd3vAyVJQ/h3ZkKq8zIx8r8GoKNZ+Yuyl+kK41wLbtG
 qxWfD6BTEGfT6NdQ6BAjTWaNVzEzFCuh53Tdf6UxgIma0yDLz615ETrWFxa9xROzOdPyZyLxQFp
 p
X-Google-Smtp-Source: AGHT+IGdTvSr1Gp0F1OMDvy5zrpPiRjkhSNuE2QYKR8xhc2yz7rDzZLmG1OvjpV63YxNSIIllagJkA==
X-Received: by 2002:a17:907:1c13:b0:aca:95e7:9977 with SMTP id
 a640c23a62f3a-ae3c2d2cfa9mr111316766b.28.1751426494470; 
 Tue, 01 Jul 2025 20:21:34 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353c01980sm969718366b.81.2025.07.01.20.21.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 20:21:33 -0700 (PDT)
Message-ID: <6864a5bd.170a0220.46cce.7838@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 02 Jul 2025 03:21:33 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751426495; x=1752031295; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=EvQ3grh5Xg8vf1LsET9SnrvyEtx0/FVbNpm2lEUOTy8=;
 b=AM+hbVDDrNAK6q5g2aVm1e04YYELh0qaTipRvwWNxFeRGpkIV9PYqDwpmdoS0YQpWx
 Emsq+3xhjXbv+gdiq1BBwzLFM3U60GRoDWI89GozmdoJZ0pDY74gX3RTRF/yVsmUMIOI
 v6elA5E4TIO9B04gU2i2m/mAlc8lRICSQiA5pVmlFMt1iSifh2MRZirehsZlGnaMlXIX
 cvM/kIRq+icS3h8L0Ju7kOsrRL3wl08HlfzqfmuDYLkssbw7suYeqHkVf312V7V+13d5
 M6FFO9sdp41llgpYld4heq3x43krcOEniIyHiHsEKdIiWVtkBq9iANp7XrMUL+KC5dax
 toPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AM+hbVDD
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-01
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

Autobuild statistics for 2025-07-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  3  |  0  |  7  |
  2025.05.x  |  1  |  8  |  0  |  9  |
    master   |  7  | 31  |  0  | 38  |

Classification of failures by reason for master
-----------------------------------------------

libdbi-drivers-0bfae6c43134... | 3 
                    bmx7-7.1.1 | 2 
                  iozone-3.506 | 2 
                 libgee-0.20.6 | 2 
                   bash-5.2.37 | 1 
             dahdi-linux-3.3.0 | 1 
               dvbsnoop-1.4.50 | 1 
                 hddtemp-0.4.3 | 1 
host-binutils-arc-2023.09-r... | 1 
            host-libp11-0.4.12 | 1 
               host-vde2-2.3.3 | 1 
      libabseil-cpp-20250127.0 | 1 
             libargtable2-2.13 | 1 
                libesmtp-1.1.0 | 1 
     libglib2-bootstrap-2.84.3 | 1 
                 libpng-1.6.49 | 1 
              libselinux-3.8.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
              netavark-v1.14.0 | 1 
            netstat-nat-1.4.10 | 1 
            python-tornado-6.5 | 1 
                 siproxd-0.8.3 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 
                 watchdog-5.16 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/d0c130cbfa3b7cd6385200d8dcade64f4d68c0e0 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/4612f3f1ddc20ba5c8f10a238fce85290330e9b3 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/6c4fca87f3fc8aa6032c25d25aa2610032808044 | ORPH
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3eadd3432006cd3d1728f0ed1ac62cf3bdc91e42 | ORPH
  riscv64    |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/ca215aaeacd22760d62b24624a170b81ff86aed2 |     
  mips64el   |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/2fca1d8018a9e8c9a5bc8aa7022e9c7889a21b97 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/721b0da5574b92c80e26c6d5e572f5b9ccea99ad |     
   armeb     |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/b74c0c91b89dae5f8589a7fb65d02e700cc98954 | ORPH
    arm      |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/b260f74897f69521ace4051e71afb007c8f834ed | ORPH
powerpc64le  |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/796a72412aa5eebeaaeea08646db71f3e453efb4 |     
  aarch64    |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/0cba8552ad82f3f96d4a1b1205e8606a2b7c5517 |     
   mips64    |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/2d2f32eb0253e5c5058bbfb74fc323396090c7fe |     
    arc      |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/0bba10b54163066cd67c6ac17ad9ce046b15e5fb | ORPH
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/87b415945b37b7181545b7ce51b2ae9273da8bf8 |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/849b0e5687476a6f49f39ca1b13841a51681fef6 |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/1fcab414871b76919edccfff6d2eae933b330b8c |     
    m68k     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/77950d172ebec069044bb809e8a5e21e2b112c71 | ORPH
 aarch64_be  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/43cd08b2be6baa7f5aa27e6d2b1cbf33aac24a9f |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/41b63725ab36db791d56dc25230c42ade4535c69 |     
    m68k     |   libglib2-bootstrap-2.84.3    | NOK | https://autobuild.buildroot.org/results/31258d952a552d7250423d276577bbdf4cc3ea74 |     
  riscv32    |         libpng-1.6.49          | NOK | https://autobuild.buildroot.org/results/3e787c11006e776bbf49115ce59721fd4b6022e2 |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/869b52593c6c81499447a73c34b180298115ce8e |     
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/64e08dc07402bf13f0f9e9bb3ed2a1b84cde83ce | ORPH
 powerpc64   |        netavark-v1.14.0        | NOK | https://autobuild.buildroot.org/results/eed7484d2a3475c5755eed1beb7603aaf9ba2588 | ORPH
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/de8e70b836a878c476a71d14d9c72e9967481e8c | ORPH
 microblaze  |       python-tornado-6.5       | NOK | https://autobuild.buildroot.org/results/689ea5e8c4d66a45b6a3d4602cb3d70f6b1457ec |     
    i686     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/aaf5f8a0d304e75712fd121cfe2052a7c469a4ac |     
microblazeel |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/63165ff812f2df3e48a04fc4be30adcb87be7497 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/666d5f9b364f44ba2893d4cc6cc193f3fad72163 |     
    mips     |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/aef04f05c5f9c0ccb8bae870ee42de38c1ceb9ab |     
  aarch64    |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/ecfd3bc24e6fb29e42dc78c87475966860ff77b7 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                     daq-2.0.7 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
               libunwind-1.8.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/c69ab134463a18eec65ded836aecf89a5cb4a75c |     
powerpc64le  | fs/axfs/axfs.mk:32: /home/b... | NOK | https://autobuild.buildroot.org/results/4a4a449677659260d69b7264127fe95473a1dc22 |     
   armeb     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/980b46be38d96e052fe8bc929bcd441e2a82189f | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                    azmq-1.0.3 | 1 
                    bmx7-7.1.1 | 1 
              fluent-bit-4.0.2 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
  gobject-introspection-1.82.0 | 1 
            host-libp11-0.4.12 | 1 
                    kmon-1.7.1 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/c5dd4e11ec39f282a9de21ca05e914c0be5922b8 |     
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/83660503375608cba50da3ab346333eecbc2e98d | ORPH
powerpc64le  |        fluent-bit-4.0.2        | NOK | https://autobuild.buildroot.org/results/c8ace5a30afb301af5a49b4ee7877f6e4b891124 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/991ed172d3165dc0a124a337439433b6eff4bf26 |     
   mipsel    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/36eb3e3e89200a3148a81a4e43efe3635cfd3579 | ORPH
microblazeel |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/635613cf4e0e659a7e67f4b3b97504cf3fc24d6d | ORPH
powerpc64le  |           kmon-1.7.1           | NOK | https://autobuild.buildroot.org/results/1ebdb7507233ac3c56ff25077951dc51009ef09a |     
  sparc64    |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/bda14fd6f5836b8591d04696968a24c699466c52 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
