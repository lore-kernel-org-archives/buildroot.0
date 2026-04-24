Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FFAF34C45
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 03:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D9CD612E2;
	Fri, 24 Apr 2026 03:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWgFtuJBc4vs; Fri, 24 Apr 2026 03:20:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19304612E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777000847;
	bh=ilJDCOnatWoaLwUUu+Cf4tfU5AsRPv2M/LsGUTGR1Sw=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DEaC+9MredeoO9LHVdfiwI6nnkYAyQT7+dvP68d7XG9h3sMfiPFL9CFKxDolgbtIg
	 K8z/Pi0S+FpL4RYupgfk9/V+UGW2wNnspJmznZ+U2kt7haRhglwNXob8kiDvlYi/Gj
	 gpqUBC9Tmb5qLJlPcZgIe+o3fNrEcEVJEGIxfRYEq4e5qt0/5CxzM7BkYL2s2zHR48
	 K6j4a5I2rmDm3AANo1MuUGaCqFXTNa0bGeI4DxsbhqYJb7897FsB5WwfVBZGqnmzRz
	 iDrZXYQk4Es2V+d5U74Ewb4KtuYnmx09IDec6EQKkdhQHIqBN9d2RrtvDsX071jJQK
	 TIRoXQyFwLCkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19304612E7;
	Fri, 24 Apr 2026 03:20:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75BE0231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 03:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BB13612E1
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 03:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loJ9fYHXVeGi for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 03:20:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D19EE612DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D19EE612DE
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D19EE612DE
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 03:20:43 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43cfd832155so5342702f8f.1
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777000841; x=1777605641;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rB2SiP+P6Gh6Tu9gX1iKmet2dA0yNmOy73v+1pUQDq8=;
 b=PFZfjiTK82pPTfX5Jy7u+BJRZjXDfEkW1ZpqSpJFppa/LwniLCdvTo3MONvUpSNNpi
 tdPYQBdJJZ7tN9/Asz+ZP+5L9CDf/BkBZEvciDCmsH88v48gGfEzmoWKMpPuHTWKjHsc
 U2KqqN3KuKIgXyjNn29XSfVe9JjIssGo8cojs3eEV8JqSGus/LsTGp6S5B713V0lR4Ib
 +hMufSmOQpyOuCba/dEjn+XeItPA6gF+hD3ZYM1ATUCXcm1HCcTJmPoQ4P/hvRbXuhrF
 lrwAeHm4gghT98Ng2gA+sS6yzYtRsD9xM9iFKUT6JBddHTx+vGZ00UNAPEIVP1Pa2Ke0
 Gv9w==
X-Gm-Message-State: AOJu0YzdkDJcyi2gExb4p2jfG+Dd9gRjimQ6he1T7ESqLpy7gKJYNULb
 3WCL1pgsyHW9kiALCWUbQcB8QnQgGxyp1Lx4Ho4zzMpUQoTsUpEP2Cuu5vm20C81
X-Gm-Gg: AeBDiesNTEHsEgNnaW8m3yq9C0W7bM4IJtw0ZKUIW6Pbay+iZqKnpoRrFnknm+p3XU1
 HG9YRJSRKBjWfc9AobOD8PXjaAnj9FIjxSnkp39hGvuU7AnIoh7MutKMVdarW7eXvTDVHOqk6oi
 QfCgr9yYotnmtsoSGTdC0k/imu3rnn7+BbVYVL9f95/ZB0mhENM5X9r7mT5t7ulZmxpzIgUGlu7
 c6dMsZDmHGXQVntZpmlUJFvv5i/ij4uRbNqDaRi5qCzDe1/x6kH8xc/kcPl0hkFY1YjjBFVT3CO
 DkQTnq/C5SUEJ5stf9Tv8AbSDlqCqAQy43VMdsKvHEDE/vt1OYOR1orzXsTeTVYdB8M9dLOTNpI
 SIWUHeJ57sIcJFXqxbIeZvmJy0kZCknahqb4BZv9mpYmf+6J11q40yb7HMts/4i2/xUHyUSI+k5
 Yr4W3N+2sSJb8FQZqxEnuqivGd75d8VDX5cxtkYH9Y
X-Received: by 2002:a05:6000:25ca:b0:43d:75a2:44aa with SMTP id
 ffacd0b85a97d-43fe3e125e1mr47181704f8f.43.1777000841257; 
 Thu, 23 Apr 2026 20:20:41 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4412150a092sm22192047f8f.23.2026.04.23.20.20.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 20:20:41 -0700 (PDT)
Message-ID: <69eae189.df0a0220.15ff57.84e9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 24 Apr 2026 03:20:40 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777000841; x=1777605641; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rB2SiP+P6Gh6Tu9gX1iKmet2dA0yNmOy73v+1pUQDq8=;
 b=NfKJ6Zxg8QHG/bOReFghYU14Dl4Vj0Paj0bACb3JaTr+mASz1s7M8a84UxGu1E6JoA
 oiWYLxwgOFu2bIUZMetL4S5ut+KIcwekfaVblUeF6qnBeWSRIH9Jal7GkYhxGiyyFjLs
 W5e98lE4PLkArNb18Cz/AhwdDsPTwOEYmUT0H3sU+ZqJuCajTUWcUtMnCkpMSZRQ+mXx
 fT4AX+eVI3tOOnWIERGwwBrXAt+cVSz9F48JrFQF+H6K4xW11lfRn/+WLArNEpVOnDVN
 3A9pHC5NlwAbbDuZSXfGgfl2cw6JYAL0YZ9VeVinGTw6T91Gz1y81/nrUvG9K+BRdP0g
 a0fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=NfKJ6Zxg
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-23
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

Autobuild statistics for 2026-04-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 10  |  9  |  0  | 19  |
  2026.02.x  |  5  |  6  |  0  | 11  |
    master   | 39  | 77  |  2  | 118 |

Classification of failures by reason for master
-----------------------------------------------

                  libnfs-6.0.2 | 6 
glibc-2.43-17-gdd9945c0ba40... | 5 
odhcp6c-f19dd37fb467c9cf10c... | 4 
                   perl-5.42.2 | 4 
                   dante-1.4.4 | 3 
  gobject-introspection-1.84.0 | 3 
             libgphoto2-2.5.33 | 3 
                  libnss-3.123 | 3 
phidgetwebservice-2.1.9.201... | 3 
                   ccrypt-1.11 | 2 
             dahdi-linux-3.3.0 | 2 
          linux-5.10.246-cip66 | 2 
                 linux-headers | 2 
      shadowsocks-libev-v3.3.6 | 2 
ustream-ssl-5a81c108d20e247... | 2 
             util-linux-2.41.4 | 2 
        util-linux-libs-2.41.4 | 2 
        edk2-edk2-stable202602 | 1 
                enscript-1.6.6 | 1 
                    ficl-4.1.0 | 1 
                   flann-1.9.2 | 1 
                flashrom-1.7.0 | 1 
               freeipmi-1.6.16 | 1 
            freeswitch-1.10.12 | 1 
            gdk-pixbuf-2.42.12 | 1 
                   gssdp-1.6.4 | 1 
      gst1-plugins-bad-1.24.13 | 1 
                  iozone-3.508 | 1 
                  libbpf-1.6.2 | 1 
libdill-32d0e8b733416208e04... | 1 
           libmicrohttpd-1.0.5 | 1 
                     linux-7.0 | 1 
          lttng-modules-2.14.3 | 1 
                       mrp-1.2 | 1 
                    olsr-0.9.8 | 1 
              openjdk-21.0.4+7 | 1 
                openssh-10.3p1 | 1 
             parsec-tool-0.7.0 | 1 
                     php-8.5.5 | 1 
            python-numpy-2.4.0 | 1 
                 rtl_433-25.02 | 1 
uclibc-ng-test-132c6134d691... | 1 
uhttpd-15346de8d3ba42200249... | 1 
                       unknown | 1 
            vorbis-tools-1.4.3 | 1 
                wolftpm-3.10.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/d34cfaa40aed17fd7d92f5e889c3138ebc1434d7 | ORPH
   sh4aeb    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/989425328f67c86143870b9eca029581958c6988 | ORPH
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3daae2433f0bcb0b6128e1d1be9bac502e82b47d | ORPH
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/cd9c84c2d4cf6790ec7327929a7a557cf9b39b9b | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/31c07b94b45328007b15c957fc70db4b62be68a8 | ORPH
    arm      |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/5d18f05c58b589ffabcf3e0c2d1bef6ce96b18e2 | ORPH
loongarch64  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/a01cfddbd607eb08711b5780ab6c998eaad2c0f9 | ORPH
   x86_64    |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/f60f4388177cdc5bce91810a21d543d9763e595a |     
microblazeel |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/bb47cbcc80b583f29fb0e20b8bb89637004e4336 | ORPH
  aarch64    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/c8af091ba5c9b2a7abc96368c2e90aadc69694c0 |     
   mips64    |          flann-1.9.2           | NOK | https://autobuild.buildroot.org/results/980cf8d051b9d512294471ddb6d268a6aac0e98a |     
  powerpc    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/6522c01f9c581ca980db1a34282e63960e0730c9 |     
 microblaze  |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/aecaf3d9963020ed2f06c9ddc40d29a3d692af3f |     
 microblaze  |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/f57674cb615c9f44f7f1bbc9a90b4bdec672e4b1 |     
   x86_64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/04b5e90dbafd79fbf0182734824396fb454bf893 | ORPH
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/a47f79e4d403e40e99e33f8f0826144202b56d2f |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/ed84edaecc28b2bf0bf748aa646ede1d65c609c5 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/e9a2e9a5c2c38b28be2de47e3abdd69ab92c135d |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/db2faff236814458dfc41258895c001c05227a03 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/3f9a991a903c302a8b7b683a41eb447bf82c945e |     
    sh4a     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7d4ff69a6e224e3a81f001d904736cfd24515bb0 | ORPH
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d7d1c8444c89901ee212c543a3e20da16dc1a51b | ORPH
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/412e9336aefd3198d7424302f46a9d6a5043ab3e | ORPH
    or1k     |          gssdp-1.6.4           | NOK | https://autobuild.buildroot.org/results/f77439774a6ab9704d3e91227e28ef7b8074ca25 |     
    or1k     |    gst1-plugins-bad-1.24.13    | NOK | https://autobuild.buildroot.org/results/517c90e509d84409669da36e568b08eacbbeaba3 | ORPH
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/ff8fc3e5bc6ac7a827ff73cfadca70abf59cb665 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/cf4c00d6e3fe32671ac92f352923867c44d76f00 |     
    hppa     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/60b7d6a1602886a94def0671b6e19927d7ca4816 |     
    hppa     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/d8df2dc84312780035fc7cb4ab7ba5f53b373407 |     
    arc      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/434b29e174019a144baf9e12f971fb89b1a353be |     
   mipsel    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/9ce959fb1a5d50d8175a6d7debc731d18a7f4058 |     
  aarch64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/9c9ccbcedd28bd3383ea3356ad176074b867e41a |     
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/83c2f15a23c2330242eae380035502340fd526da | ORPH
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/e0b9be7ae4d2e7de42a8960beada480088cdbac8 | ORPH
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/1050ca44840dd1bf79f37876df7a4296a7d5ada7 | ORPH
    mips     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/acc28d0713a49dfc474e48175aab2de51263440b | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/f53231cf5492e78916d03af51b7557aa8e2cec9b | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/ab10c303afbc6c7b3e43ab42363e6394e398f4a2 | ORPH
 powerpc64   |          libnss-3.123          | NOK | https://autobuild.buildroot.org/results/c0d6638438a855630c8b6ea80b40adfbf6682190 |     
 powerpc64   |          libnss-3.123          | NOK | https://autobuild.buildroot.org/results/cea1440c17cf9bfeabb2b85cf1971032f4030885 |     
  powerpc    |          libnss-3.123          | NOK | https://autobuild.buildroot.org/results/9e94a289d4b1e0f8bdc68bc6b8ce7ea4281f286c |     
   x86_64    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/92a8bc4297e65599786e23a2d87fd2bb4aa5edf0 | ORPH
 microblaze  |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/451f1cc33ff65f28c37b6064b8a5288f51dd9c57 | ORPH
    arm      |           linux-7.0            | NOK | https://autobuild.buildroot.org/results/c0d42573e83bdfd723284eff3d9a67f5b9d6badf | ORPH
  mips64el   |         linux-headers          | TIM | https://autobuild.buildroot.org/results/0dccfcf116716774f169207882c72b43c04096da |     
 aarch64_be  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/298655a272af16ed311bbf9c7e74da3f1777ebb4 |     
   s390x     |      lttng-modules-2.14.3      | NOK | https://autobuild.buildroot.org/results/321d928800f02d73d444083f24887df27b849643 |     
 aarch64_be  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/685aaa180a9d43323dc90f7ce68ec0a52368f6d4 |     
microblazeel | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/8ad0d2df6766fb584ed44eac433d20a92efc1b02 |     
powerpc64le  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/d127ed58e28aba96ccd661eb6eaa00d6b6bb1264 |     
  sparc64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/fe998d261a7c7f7ae4d19099270252987e55fd6e |     
   x86_64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/582a2859188df0e7235f466f71a84c9e1d3619b7 |     
  powerpc    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/a343759b3a2a09305888991c53cf2a827fd8ed99 | ORPH
  aarch64    |        openjdk-21.0.4+7        | NOK | https://autobuild.buildroot.org/results/f77c1b486c14f1e2f4c48b55863438d051d50a66 |     
    or1k     |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/be268caec1f5646ffe4f509455f63525cf22f702 | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/a1e56766d73955ceb41114936aaba7a0b63a8005 |     
   xtensa    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/dd3d0c7f2807d3e9748696b8261c625135b0fe11 |     
 aarch64_be  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/94b181ee9e2321694a9ddfa6e0a5f66062e47c73 |     
   sparc     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/a570f08ec7ca41e004ca280f5c371ef6f2399954 |     
 microblaze  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/a669e384ad18baf1ef987d6467c03f0563d1b030 |     
 aarch64_be  | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/3801c62bc5feece3789d60f1021d26388e440411 |     
   x86_64    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/8ce79f17ae821dfd6bfdfd119f37efe85ef3bcb9 |     
   mips64    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/7b740eaa77ec44d421b585cea079ed8646e86fec |     
 microblaze  |           php-8.5.5            | NOK | https://autobuild.buildroot.org/results/a260b7e563b5f40f74cc8ea50f0426d5266fc32c |     
    i686     |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/8afc4bd979c7a16d71d6d2cc231313bb53e831d6 |     
loongarch64  |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/52b29965abb97c51c5a50891e73a4a536221f158 |     
   sh4eb     |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/0eb0b6ec0b0ecd7c83ff987d90ef582cf174aeba | ORPH
    mips     |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/21e6b1fc0cc7c2aae6dd1db2a93bbebda7e20f11 | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/525ba2b16516967b6ae77635f15a7011f3287606 |     
loongarch64  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/42e3fe1abdd4468222029014f0998a6cac688f86 | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/96fbba33db1225e09ea0092c7c47402b91f85a56 |     
    mips     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/fe9ca85350dc41965ce82547da77ed27dbf9e296 | ORPH
powerpc64le  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/fdf6afca028a2b9360729018aa57e19b76bb129c | ORPH
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/8ab2f260a135b4e1e09f1ba5d1b0e06d462371d1 |     
  riscv32    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/065e596a53816b018e6aff0985fcfb9f968906a1 |     
    or1k     |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/a43530ee5d8d1815cd81d4907960c18f0345657b |     
loongarch64  |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/5617b6582ecd52e1210de59a5c9586ea6a3637af |     
  riscv32    |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/ebfcf91ce521694f908dc5711870710b84c073c5 | ORPH
   sparc     |         wolftpm-3.10.0         | NOK | https://autobuild.buildroot.org/results/b40292dce2a60cfc949c2b101586316da817aaed |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                       unknown | 2 
              fftw-quad-3.3.10 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
     libphidget-2.1.9.20190409 | 1 
                 protobuf-33.5 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/3bcd9d4c895625b930a3cf7b36d1e0c21f7a7f4b | ORPH
   sh4aeb    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/4ae20b1ded5e1d5757d021ada48106516d0cace8 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b1a91de4680701e2c23dd616d37a35d609ae57f9 |     
    m68k     |         protobuf-33.5          | NOK | https://autobuild.buildroot.org/results/518da53f4248c1d522b1c89feea5417201bc68bc |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/7cf22c0d723c04e661f45418663d3fb2df4dc866 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/3e2516eccd7d8e9f2fe10b130f9119649f302c60 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

package/linux-headers/linux... | 2 
            gdk-pixbuf-2.42.12 | 1 
        host-python-lxml-5.3.0 | 1 
                libcurl-8.19.0 | 1 
                libglvnd-1.4.0 | 1 
                  ntpsec-1.2.3 | 1 
               pulseaudio-17.0 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b16c2f299b7db01ffcc54bd1a90912947de45ac1 | ORPH
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/12f0f5eddec97a270bcfbb5210ee83ccb29ea4c3 |     
    arc      |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/ba852f68a8f06bba2ec6f2b5fb0224802ca60085 |     
    arc      |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/aead18f239028f78d75a0a91291dc0ba2c53dd10 | ORPH
    sh4a     |          ntpsec-1.2.3          | NOK | https://autobuild.buildroot.org/results/249e7c44d56d46ada73d0545612c98c6710a55d4 | ORPH
  mips64el   | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/9e1aeddec445358e841d752f13339ad1ca68aa45 |     
 aarch64_be  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/d86900e0fe71283c31d3d790e09f793284d3a799 |     
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/cf515fe64d2d68cf35b0819e85333a8a3736d704 | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0fd1fdcedadd0f737b9eacb1dccaf4e93bdd6f3d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
