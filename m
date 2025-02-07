Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA853C02192
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 04:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA65E42919;
	Fri,  7 Feb 2025 04:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SXDExCqd1fB; Fri,  7 Feb 2025 04:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E328F42857
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E328F42857;
	Fri,  7 Feb 2025 04:14:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AE4FC0
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 04:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B29B42857
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 04:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZHE5sblnSMg for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 04:14:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B315427A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B315427A9
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B315427A9
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 04:14:42 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d9837f201aso5271521a12.0
 for <buildroot@buildroot.org>; Thu, 06 Feb 2025 20:14:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738901680; x=1739506480;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DFm10xrXy35j1HdCvxU3Zcq56WcfpdWBetkaFslaVmk=;
 b=fdu2mFV0SxASPMedeoSjbdH818XLypPPU9PRATpYTQoe03XzGN/dy0CCjf73bWhb87
 c0gxJbaG7pG8cEN+CU0zvRVwNQ9Acjq7CvWNqcn1y8kVHsgX8nxDvZ9k0mzAXJj1WOZJ
 EI0vHj+/7mBc8pYnxV4E/N5OXipvFOsmeh8OOW7hGV1JhHSr2Av6JAo9frkLRe+BRvYS
 qmmxe3HY/ylcwBUsVa6soHrj3rLDqBng3yVHypC/8QMrC9z60RXd8ISP+FKyEhWmj5FJ
 AuRscgy7YQcN8hZuwlx/eJMz/1dJIWIBaQ9z+FL2bV7oNyyb7QKzAoWTlTWqt0u3x63R
 RQIA==
X-Gm-Message-State: AOJu0YyXqepWZA6Sb/xPP20tZ1bkWLJZKm/j1UbGeHVjYU9OMkJicWbR
 P+NuJKwlrCvDSQlmVZnfzo0TjMolX7Q6KslAkAN8NhMpxNGhaLVnyndepA==
X-Gm-Gg: ASbGnctYoisutx6iWcHrq+JWXT56fCNhqO7OnVdR19zNov+/iprtIMj2uW82TbLDLxY
 R/wzxm40Jn2ljR6wU1leVzZbHF85BtKLsh3EEbFlhl6DL60efH71NBb3UdrR+nVMJyiOr/ofZqO
 yE3acWqwBj0gcQkrik2NIDRyST/28pVwzF62NMZUZ0WrW3PR7VYheySpKPS5mNT+Ls/M/OVxYpa
 rvj4lLb9j0ypi6LsM9uGYgkX0LHXdfldWaPTpB/xAmHEvwfI2QtZWnEW4S5+kwHjply1itb2fF5
 l/2mz/skyXn/49VBKh0=
X-Google-Smtp-Source: AGHT+IGsHoA1fYN+aTW6TKMHsox4wHlq8v/VZ4igNDSMOq1rO1QR9owKl+PC8t4ncNLANEKP2/yr5w==
X-Received: by 2002:a17:907:97d3:b0:ab3:992d:d98d with SMTP id
 a640c23a62f3a-ab76e6150ccmr619174466b.0.1738901679894; 
 Thu, 06 Feb 2025 20:14:39 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7732e71a3sm196800466b.103.2025.02.06.20.14.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 20:14:39 -0800 (PST)
Message-ID: <67a588af.170a0220.3d5bcd.641c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 07 Feb 2025 04:14:39 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738901680; x=1739506480; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=DFm10xrXy35j1HdCvxU3Zcq56WcfpdWBetkaFslaVmk=;
 b=GVqc4A965YIUIlp7swdplFraEZEmGVrE81yPxa1MMV4OHF8IPU7mrDDfKKSaBOI6a7
 lychWl7jxRnQEivm5t9KmXWAIEeLwE6wG/yblcvNifLKtCUoV8EawAXoI6yHoW3qwDsx
 XHTF15FIpKlunKfmIr8HoOHpBmXugmRbGbW/L6/PI7GkakWrkOtIjYYPNNvkcBR2atQF
 CAYwVi5JszsUH/2+cRCAA2H3XjnquRcxOoVUB96uYD7Ly1LhBsTiVbXmr7NuthFPBjl1
 P7BBuEmxwsJkV7ON0URplOeky5BbVgfNhsllj8mnAQ3lY87ocUsaHpFbS0ZdiUEyB6CJ
 y5Ug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GVqc4A96
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-06
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

Autobuild statistics for 2025-02-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  2  |  0  |  9  |
  2024.11.x  |  2  |  4  |  0  |  6  |
    master   |  7  | 69  |  0  | 76  |

Classification of failures by reason for master
-----------------------------------------------

                   host-go-bin | 5 
              host-rust-1.82.0 | 4 
                elfutils-0.192 | 3 
                   linux-tools | 3 
                 openssh-9.9p1 | 3 
  gobject-introspection-1.82.0 | 2 
                 libcdio-2.2.0 | 2 
              libopenssl-3.4.0 | 2 
           libzenoh-pico-1.1.0 | 2 
               mariadb-10.11.6 | 2 
           at-spi2-core-2.50.0 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
             bluez5_utils-5.79 | 1 
                    brltty-6.6 | 1 
                  brotli-1.1.0 | 1 
                 c-icap-0.5.10 | 1 
               collectd-5.12.0 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
               ebtables-2.0.11 | 1 
                  ffmpeg-6.1.2 | 1 
firmware-utils-86739f2b3ae9... | 1 
                   foot-1.16.2 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
                   fwupd-2.0.4 | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-python-greenlet-3.1.1 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
               libglib2-2.82.4 | 1 
                libglvnd-1.4.0 | 1 
        liblog4c-localtime-1.0 | 1 
          linux-5.10.162-cip24 | 1 
                 linux-6.12.11 | 1 
               linux-pam-1.6.1 | 1 
                memtest86-7.20 | 1 
                    mpir-3.0.0 | 1 
            netstat-nat-1.4.10 | 1 
           oath-toolkit-2.6.12 | 1 
               openblas-0.3.29 | 1 
                    polkit-125 | 1 
               postgresql-17.2 | 1 
               pulseaudio-17.0 | 1 
                ramspeed-2.6.0 | 1 
                  rt-tests-2.8 | 1 
        s6-linux-utils-2.6.2.0 | 1 
          sphinxbase-5prealpha | 1 
                 systemd-256.7 | 1 
                       unknown | 1 
             util-linux-2.40.2 | 1 
                     wine-10.0 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/c04bb4892875e6a4608ae0e6800c1158f01b2d37 |     
    mips     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/fc3eaf166ffaaf42fa9ba86e56fc9533fb8659b9 |     
 powerpc64   |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/acfb79f40b3255c487656c8d6858937521b39352 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/2d490129fa228d2d3f4729a32b15d5200e41165a |     
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/31796f55f3e788e3d033c0631aeeb97fe278a3ba |     
   mipsel    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/63e284904ae8576f6b8cd2899b311f4e71d374ec | ORPH
  powerpc    |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/9fbeda787df70c7f29c72a132b99ee355a1242a0 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ca1cdcf5fbf16fb8cc78e212f04ad41f404a2729 | ORPH
 microblaze  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/d45ab3166b13eb099c8697b0bf07f26e078176d2 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/53febd589b7e0c5e7e78715f70acc1849f13a381 |     
    arm      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/eb8ff47754a1403796563f9f7b143fdb2724c006 | ORPH
    mips     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/755527409107ff4c20632a81cb898e4660ff16a9 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ec4686b267356f49257ccb1a5d05dd89cbc57b2d | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/543b36b1f67151f77ba3899ae1bad96a49b5ad5f |     
   s390x     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/bf9b1944a6f4f53f50c4e84ed91664e7967d0f5a |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/b93f1ce54c55a512499fb01f04f1fddcb7a45778 |     
 powerpc64   | fs/axfs/axfs.mk:32: /home/a... | NOK | https://autobuild.buildroot.org/results/132ed56fa05bcbfa421b1ed0c9687288d38ae9cc |     
powerpc64le  |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/4fa9a9c3b205283b5b56e8133c905da914a0da16 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/b6c16246310f099c14f527eb9a98956873a62de4 | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/fae131527f592226396730737b5863b23a124270 | ORPH
    mips     |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/d3e534529ac32fbaeaaa60eb11fbe214e69fa043 |     
 powerpc64   |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/afd147bfdabd71139ded504eb4d6834c562a3249 |     
microblazeel |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/365bbf726a00b465b834a9d7fc41c932775e1e35 |     
    arm      |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/8942540c0bd4cec83b716e0b975609216f0dec06 |     
    arm      |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/ff405c392916423bab7a5f4e277e21542971f962 |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/beee16c2714e9acf005acf2a1e94532e6d74abcb | ORPH
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/7d94e25560d35524e7f53dea6e9b7586f509da92 |     
    arm      |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/d7b765e545f69a60cb049d88e5d661437949adb7 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/8ca5b2d2057c906182109add08c3ca180974ee9c |     
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/487e648de2018010ccacd3d883b878fcc3690992 |     
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/773af79514c1658ba4bc6bffe10cf979dda6c160 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/24758c80723e58f8768142a795d4a4f156410a8f |     
   armeb     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/82f0c1ce7a946dc024710aa5c567bb7d4b495fe8 |     
    or1k     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/85d8ccbaa03ff8841068d10f867ed3702f92dd03 |     
    i586     |        libglib2-2.82.4         | NOK | https://autobuild.buildroot.org/results/4db3e0d3ad5a57e92198d05d37036d163f3165fd |     
  powerpc    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/9e99898d61b68616966a55263b728d948816e8c5 | ORPH
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/16a705ffd705551d59e4c9e77b056a0dacd40979 |     
  riscv32    |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/3e22b34bbbff4b302edc647f1d5fb9cc5727431f | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/d9d86443a3402067aa84cff7bb6c82ecd78aee8c | ORPH
  mips64el   |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/cd8ef638e5f0e12e9d27403a225a274e68348a1f |     
 aarch64_be  |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/59ff7a7dbb8c4a20aa2e65b4c5a263efec92c752 |     
   sh4aeb    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/38754d12939b52bdf9e612225e4bb54098960522 | ORPH
  powerpc    |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/d2f0d8c4eeeb7193a9b314b4c6a5c0904a595c78 | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/a4c75485d860952386aa2797027da46d31bc4684 | ORPH
  sparc64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/af573525b3b935cb55ce292cb759a9923d9614d3 | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/4acb89ed2f3e5472eac12c44632e815184a4a960 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/56250dec60ddd2079a90d763b6fb6fa7782ada22 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/87c9d02bde33d3540ff17956a36ea153caeb3da8 | ORPH
  mips64el   |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/8cdd2f2ad06137f4d7f42b9aacf9ad17a8687859 | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/0f4a531b53878f4d7dd424f65fcec512b0d165f9 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8e97a3fb63a0d257b037c162a59d8aa25005f6f6 |     
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/79153b3c88e8199be85f7468590215196df953ae | ORPH
 powerpc64   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/b72e5b033f90da7da92915396d78a0d1450561a5 |     
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/3fd850a803eedf9be3c0598c3f9a1820929be1b1 |     
   armeb     |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/860e777403d5218681fae559035905ebb3a827d6 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/8ed3c9a9f01d84c9051aac7db7a34e1b41605761 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/c3bc2b27f4812f9932bafd545713337fa11720d8 | ORPH
   sh4aeb    |           polkit-125           | NOK | https://autobuild.buildroot.org/results/6a2d54bec8eafe09326ac5bef1331c463f92a3aa |     
   x86_64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/22f4255f2855748235c48f5ad5c615a7a1cb387d |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/9925150161d1305a075127842579c5fc61247b44 | ORPH
  mips64el   |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/8e737de7950ee91f22069522b75180fe98d0cd03 | ORPH
powerpc64le  |          rt-tests-2.8          | NOK | https://autobuild.buildroot.org/results/62545ff5763a397eddd87ac3c7107680e6b09fcf |     
   sparc     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/c163d67635def179147ab7f01feb3c94893d2998 |     
 microblaze  |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/af87cf0339f42e81191bff4e9750a26e2ee1d599 |     
   s390x     |         systemd-256.7          | NOK | https://autobuild.buildroot.org/results/9e477c48641a6340a4724b306f484c33df091b82 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/96e02a1a5fb92f6c4406c06ace51549cd5eb2ad6 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b89e0a90a186579757694039a021c416f629254e | ORPH
    i686     |           wine-10.0            | NOK | https://autobuild.buildroot.org/results/e08dc89f911d1a9cfbf1fe4a7b773152e25b3815 |     
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/68c75cd6de9cfddf688bff949999b4a9f92bb3fd |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 1 
          host-sdbus-cpp-1.4.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/486e23a89762d174d50ffb1a4454c8af88016485 | ORPH
 powerpc64   |      host-sdbus-cpp-1.4.0      | NOK | https://autobuild.buildroot.org/results/bd0a9fe123956f01336462a31c3375a036744234 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
  gobject-introspection-1.76.1 | 1 
                   perl-5.40.0 | 1 
          python-tinyrpc-1.1.7 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2a8d140e8cb3276a8cb5ccf542b95ef9471bea77 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/77c6e771ecd4dead2cd1925d10982576c5cbb3b5 | ORPH
microblazeel |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/9feb9e6428e4343414a3c44fad7df17999521edb |     
  sparc64    |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/c089f076c1a26878613cffc1e5872dcad2998877 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
