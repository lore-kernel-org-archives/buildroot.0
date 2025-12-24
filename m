Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D1BE7491E
	for <buildroot@archiver.kernel.org>; Wed, 24 Dec 2025 06:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7357582861;
	Wed, 24 Dec 2025 06:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3eyLGQTfxMwY; Wed, 24 Dec 2025 06:33:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 389E08283D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766557991;
	bh=YSlhjNQDIx0jNBXM399Dce5Eqz4DJChQVQ3Zx2Rs/Ig=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=czxTU3XiQJa8UNcgjcEfStEFKTXQQTEKJ9/XTJoFynWBvbw3KQUVy9eDKKS2HrHOF
	 HOuNgI7e8xLnY9kzYJYXcsjsMeFJ6Wi7srL8FIRzvQQxZFzq7usdBrC5xQ2bSjAKcZ
	 3LZmdRxGxqC/2AVqWnjNpDPw9BbEjG2cfKIi0flbeXuQxprKcpum3h6QpfphM0qSKU
	 tpWy3pX5ID5jjsGNLuqsgybjcEjrf6ZuAOUf0aON0EU9+XzXXBqwYh0LLxHV8Ha1T9
	 6B3OCjhasH86SApIyZA2ZMHemXUpsJVY247JFXagH4u0tu2tdSqBfKRLrCg4V2TbMS
	 d5IXHmPEXymaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 389E08283D;
	Wed, 24 Dec 2025 06:33:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ADC20119
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 06:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A977D8283D
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 06:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JibUrC_cHcKG for <buildroot@buildroot.org>;
 Wed, 24 Dec 2025 06:33:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D670E8281A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D670E8281A
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D670E8281A
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 06:33:06 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-477632b0621so35696685e9.2
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766557985; x=1767162785;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gc++ubiBxIq7WghMxnPd1am5scFhVmR3O4C4tkChiUE=;
 b=o0VuhOFF3PAtM0q2DBvrXU2yCfXHI4W/TOOBit0QySplaVhFxsO9HcDsSMs+mhOHeY
 lxAZT6lvzW38VODaVbXMZ5B4PqiPHMWi9VDxwPDypZIilwB3x9khD3guzB9t3zIQGnId
 JFVc59sl5hmrATDO2i5KEBoAnrm5Eb7ztAoEk1YrmxP0iRGi/JzVpqVWdX3gJIErAb9W
 qE7dJOfZAxMZjcMNAr+UmxcGZi4cup5hKTVNqNXpiWXJSBi/HNuxsz5fIHY/dYi7pTA2
 UvRVCiKkUQBf/J9nlUUCgIlxNpormxPD+CWlLR93LgmNfbZNLMQB7l7nrxvzE7w1TSyX
 jw0w==
X-Gm-Message-State: AOJu0YzeDXNyrSlQ0lJTzH0YPBzYonAfSlqFkGqYqe8j+puInv/ZA0K+
 sbX2XU+9rSrT4U6bR6I7Ns/RvyzKecM5q1sU1r1MPVAdku+moVay/pdEgHUdRQ==
X-Gm-Gg: AY/fxX5TuvIXxsZBwnojQKkco6ZVhLjkIHi2cofExv09lCQP3q2SvTT//b6Q0rtdy6C
 ENPmde3bIktvcg4zcsIVFJymXqZkWket0lAN+qtD1g/iGxkLFRXedSct5azHtPMsJ1jPYYgDwrw
 TQlfZmx8Wcmq+I7LbiDsCl2bT90vy/Ykg5tGbtUZuTI1vUR0bUdWBEL8IcoKkPukmEKDscnRFrJ
 sJ7Xc1VNTiYDcOq+krclh01O9Yw5uFuYlnT6QHla5M+6P6mjWpM4GLaaNpGjGagiPZZmyluY5+p
 JmgdEuElA4qbW1gZ4yD0XZF5FvGQIC5HZ7Zyqg0yVslbOSQe+QeNBBcMBmB91+pNDYvBfjSxwNC
 Bs2GmEZ4io+9oeta5lHL2lmbraYnAemef+Y0zVdX5Is+4rkfpEjS54egzDSFg8RKODP+TJJMDnW
 gikSelhqQWE0DTiyBrJ1IDHepNK092
X-Google-Smtp-Source: AGHT+IG4ub+L7NrVCfkVtGk4Hd8bNAE1zH+i/W5Tcf22D8wXSf3+4kZB7/k2Moe/k/btjlSh78cDdA==
X-Received: by 2002:a05:600c:348a:b0:477:95a0:fe95 with SMTP id
 5b1f17b1804b1-47d195ab61fmr171672475e9.24.1766551258011; 
 Tue, 23 Dec 2025 20:40:58 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be274e407sm323359135e9.8.2025.12.23.20.40.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 20:40:57 -0800 (PST)
Message-ID: <694b6ed9.050a0220.3ae0a8.491c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 24 Dec 2025 04:40:57 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766557985; x=1767162785; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Gc++ubiBxIq7WghMxnPd1am5scFhVmR3O4C4tkChiUE=;
 b=NbUpsRa/39ez5LjXzHcHCztplngXGRll1VC9z9OkElnThfTGtSI2bMHq9j2n/bM+TD
 lGtfNPP9X2ngi1viB2flPo5q0gajVlcyPyhfz2Y8waQmVHf2WCzUXg/VqQdbj4Ay4Zs7
 R6C1MUncxJgyNjtcXWKMnsd/PYNRfKCRnoEjGNODQnyrhN7zy7ywjX870y1l8jGwWklw
 HNgGp/bgv8Br0LRwxNj031tfZ+RJPV5v+PFhL2Oy3YSXM4UVyLSdCFOJfeCRJnqJ8wJ5
 7afqQ/4unPDMeQbBaBQUp4V7ImmK5XJhIpJB0kB2dHplBc0i7OncjWIZPdGF1sJM3XGm
 /YyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NbUpsRa/
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-23
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

Autobuild statistics for 2025-12-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 21  | 62  |  0  | 83  |
  2025.11.x  |  7  | 30  |  0  | 37  |
    master   | 67  | 201 |  0  | 268 |

Classification of failures by reason for master
-----------------------------------------------

                libselinux-3.9 | 28
                       unknown | 15
                       cfm-0.3 | 14
           host-libselinux-3.9 | 14
                   cvs-1.12.13 | 12
                  libcgi-1.3.0 | 8 
                libcuefile-475 | 8 
                 libuwsc-3.3.5 | 8 
libcorrect-f5a28c74fba7a997... | 4 
             util-linux-2.41.2 | 4 
                 libiqrf-0.1.2 | 3 
            18xx-ti-utils-R8.8 | 2 
cegui-00b4e1fe174da53b7ed72... | 2 
             dahdi-linux-3.3.0 | 2 
            igd2-for-linux-2.2 | 2 
                 jasper-2.0.33 | 2 
              libopenssl-3.6.0 | 2 
linux-serial-test-bf865c37c... | 2 
odhcp6c-53f07e90b7f1da69771... | 2 
                openobex-1.7.2 | 2 
               python3-3.13.11 | 2 
alure-14beed2a86d5a36030e90... | 1 
                 apache-2.4.66 | 1 
                 apitrace-13.0 | 1 
               arp-scan-1.10.0 | 1 
                     avahi-0.8 | 1 
                    bat-0.26.0 | 1 
             berkeleydb-5.3.28 | 1 
                 c-icap-0.5.10 | 1 
                   ccrypt-1.11 | 1 
            cppcms-2.0.0-beta2 | 1 
                   cppdb-0.3.1 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
          dfu-programmer-1.1.0 | 1 
dtv-scan-tables-15661aabc34... | 1 
              execline-2.9.6.1 | 1 
                      fio-3.41 | 1 
               freeipmi-1.6.16 | 1 
gemmlowp-16e8662c34917be006... | 1 
            gettext-gnu-0.22.4 | 1 
           ghostscript-10.06.0 | 1 
  gobject-introspection-1.84.0 | 1 
                 host-gdb-15.2 | 1 
              host-rust-1.88.0 | 1 
                   i2pd-2.58.0 | 1 
                   iotools-1.8 | 1 
               iproute2-6.17.0 | 1 
                jemalloc-5.3.0 | 1 
                 lensfun-0.3.4 | 1 
                   libcap-2.77 | 1 
libeastl-45469730d641868ce0... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
               libglib2-2.86.2 | 1 
             libgphoto2-2.5.33 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsvg-0.1.4 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.18.2 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
                   lsof-4.99.4 | 1 
                    mpir-3.0.0 | 1 
neon-2-sse-097a5ecacd527d5b... | 1 
                netdata-1.37.1 | 1 
               nfs-utils-2.8.4 | 1 
             ntfs-3g-2022.10.3 | 1 
           oath-toolkit-2.6.12 | 1 
                openssh-10.2p1 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.42.0 | 1 
                pipewire-1.2.8 | 1 
                    quota-4.10 | 1 
       riemann-c-client-1.10.5 | 1 
rtl8189fs-876e627a5b6a80217... | 1 
rtl8821cu-7f63a9da2e8ed8340... | 1 
             sigsum-go-v0.13.1 | 1 
               soapy-sdr-0.8.1 | 1 
      softether-4.30-9700-beta | 1 
uclibc-ng-test-132c6134d691... | 1 
ustream-ssl-68d09243b6fd447... | 1 
                 xinetd-2.3.15 | 1 
                       zsh-5.9 | 1 
               zziplib-0.13.74 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/425a1a31b429721dc7faa27b1983576813412cce |     
   s390x     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/1b762443f91326b169382a6fe22d007e7446861d |     
   sh4eb     | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/e4065158804ce69e679cdb9e3b900ac4d6063e24 |     
loongarch64  |         apache-2.4.66          | NOK | https://autobuild.buildroot.org/results/76ed72a1c0a11ce7b080e600a7b657cabeb83073 |     
    arc      |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/028a53322e03a36b53d024b66b352ed0a507dbd8 |     
    arc      |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/fec9d781406eec7652496f0fc79fdb4399bb1832 |     
    arc      |           avahi-0.8            | NOK | https://autobuild.buildroot.org/results/0103cb304dc527594e6f31970d5ab8eca8da571c | ORPH
   armeb     |           bat-0.26.0           | NOK | https://autobuild.buildroot.org/results/8127007a3b1b5260ad4ab7ca22729f7c31fa1673 |     
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/9780f938cb57c1c8175f901dc2acd9281ec2ebea | ORPH
   mipsel    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/1dd3fc742cb98ea16b3c8686197cc24de82d6eed | ORPH
   x86_64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/08dc595d55bdf48374f1398f90d70cc3102622f5 | ORPH
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/e0af34a6c3dae5b3835b55dfd520ac0ce7037b97 | ORPH
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/a2c0d7d6d297b2b365ac4415820a6565c06475c6 | ORPH
    or1k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/25397ab28ea74ee2c683222863fd25305aca80aa |     
   mipsel    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/a614d248e4571e17257bd39081ce57674df656ee |     
   xtensa    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/a2e527c1d7d5024fb07729fc0e80bc59edec2ecc |     
    mips     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/f14974d4d1d90181ca98c47886a9bea8dc158acb |     
    or1k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/8e7ae607e989b0983690c7de49acfc5610b5f97d |     
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/955875c056c04ad664adf9d948f6304fb4aa5461 |     
    or1k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/d23d39e179752a1581463686c5026dfefa35a6d4 |     
    or1k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/5ad4819b72a60f07015c3f7d1d9c17fe3fc26e4c |     
  sparc64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/3f2351659193a5246d2e320bcb8420005ccdf0df |     
   sh4aeb    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/ea1e41168fa72f7135d5ee047a8c55d4b6537404 |     
 aarch64_be  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/671c7c0b47423f95ac48fc611a3983930523178f |     
   sh4eb     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/b51101c8a4d5b89108fc578485b21c1b6343a802 |     
   mipsel    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/8101e5495a40290af90cf8d581458e0da75eaa46 |     
microblazeel |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/12f26ca0cadd94661b4d0bd16cfeb101fd1835a9 |     
    m68k     |       cppcms-2.0.0-beta2       | NOK | https://autobuild.buildroot.org/results/e136fc2a013392112b25a26d7d33ca5ce31653bf | ORPH
 microblaze  |          cppdb-0.3.1           | NOK | https://autobuild.buildroot.org/results/aedf7188109d98f1244081717c5281ee053cebdc | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/531ed983ff0d904745390a4733dd768224aba9e9 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/14e408bdc56955aa6102c8610ec1660a5ed6bbee | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/57e02b731a055349e0de9a72012774dd53c0baf9 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/827b36cf09e5e6085c01c82453d95accc4e26fc3 | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/88061c9b2eeceb5936e784455d9e3e2f43c21229 | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6adb03754a785e2202946c40fc1380e7762e5d85 | ORPH
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d57d37bdf0609226f5f2ec315618717de52033ee | ORPH
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9c0319cd9f7c36054fdcad5f1b14740f70605696 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4af4cbae4d3ac6398d49c424f1d3655ebcddbb81 | ORPH
   sh4eb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/5e1802302a5b33b27a13e9a9407acb02f0c53b71 | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1836ad0597343b6bb294ebc6d89c01e21c865fa6 | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8172aaf5c150c53644018689ba4c3d8c68b6c10c | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1dd7b017d32d99bdd7258ea1169e4e2351865dee | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ba59c3bfc5d22b4e3e3e5b7d2bfc547dc811ed60 | ORPH
loongarch64  | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/aa21c4fa72dfc8810a87ec773a3e1cda178735db | ORPH
    arc      |      dfu-programmer-1.1.0      | NOK | https://autobuild.buildroot.org/results/f34e749fcb6071ff257bf1483e9de139026f9579 |     
   x86_64    | dtv-scan-tables-15661aabc34... | NOK | https://autobuild.buildroot.org/results/9b61658fab72847aee4ee8cd4edda6e5ab5b7288 |     
microblazeel |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/49d3658b1007ccca9b27ff61f72e73c220fbf221 |     
   mipsel    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/d60a18000706259541366b754d51a63b7e62fe7f |     
microblazeel |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/f517798df9d606a88a4715915f159b1030d55b44 |     
  riscv64    | gemmlowp-16e8662c34917be006... | NOK | https://autobuild.buildroot.org/results/7fe09cbd2297009402991d4cc80e02ca25f4799f |     
   armeb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/15d8c3759e4fbdc9e95188d9f8d71a0ae295b4d4 | ORPH
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/0657c8c25cb342db61d4079e23a7e76885738b0d |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/184c9e0346b93f94ed008797d40f87e0ac83f835 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/36ff5d6a1b504a1bee6587bd7a461f34afe95d94 | ORPH
   mipsel    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/a2e4722dc6e7c596542104eb48fe8d262ffd624c |     
microblazeel |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/f7e9f96da900f26e0426b70fda67005c37320640 |     
 powerpc64   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/8ca54bd7491c51ab0506807bba4c88dfeb00ac9d |     
  sparc64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/9ade09c047c04ab908242cffe37ca26f0f8d9610 |     
   mips64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/fe1f478df67914580143eef11d85fbffba1a5f1d |     
   mips64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/ac611b3bc0cb76646fbe7dcd7e8d6c5324683be9 |     
    i686     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/62eed85398b64be831224cc3068b7d9d2da94ac1 |     
   xtensa    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/456f2c8c68f51f8f5ed019a73481669b872b772b |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/cb34dbf83ebfe3d5e6dd0cbbdb6df994a999b2c6 |     
  powerpc    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/521ac2559059d4e66ac6913a8e6952d43bee869f |     
   xtensa    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/d699353853198bfd76aef23893e0588248811116 |     
    sh4      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/381c7354332b98072f1037162884df3818162b3d |     
loongarch64  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/e34bf6d516ac25277044ab311d0ce16f09159155 |     
  aarch64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/4611c30e1554c7d07afb1ef626de8722422e4e5f |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/e01c2c01cecd9f8bdda9e6299b6891c33f364967 |     
    arc      |          i2pd-2.58.0           | NOK | https://autobuild.buildroot.org/results/a2a85d72c261bb5c5fc9fa4f689176b2131cdc51 |     
   xtensa    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/da80fcfa258c3c4e3f83405a9483738766e8fb75 |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/baea2f77bc778ccb8163a05e8874d8752106ac66 |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/c44dd6bd3187bd6d25e73a6ddb59a44cab4fe18a |     
microblazeel |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/30b12e32e0a67d30f5f763e5c2fa8b20c01630ff |     
   armeb     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/fb5a731494b5835a5f5ff56db8c68274a6223c33 |     
powerpc64le  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/7a7fe2b138a6d5e54c830e41d1b10981336cc872 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/f018dab80a114d54f8fde00b8b9b98a9b413f0d2 |     
    or1k     |         lensfun-0.3.4          | NOK | https://autobuild.buildroot.org/results/29d23780f6ab980484d5bd4340ab57a6488059c0 |     
    arc      |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/4bc22822c4bd242619e840cd5c6a1db811994a2c |     
 powerpc64   |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/dd2da173692267c660fc0985c169038eee4fc89c | ORPH
   x86_64    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/902aec2a5b6dba2976d7120b359baf96f1c753cf | ORPH
  mips64el   |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/b045cc66c994c4600c19e728faf21cfa46802586 | ORPH
   sh4aeb    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/570ebfb40d20d132909f0b7e0771244a8f7c5396 | ORPH
   sh4eb     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/4ecc7e408cfd82fe4385c27eff116b3503ee478b | ORPH
   mipsel    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/76d937063d68f714d037991b1651ff5c5ba848a0 | ORPH
powerpc64le  |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/92314d44842d25255dac7b27825091388ed0147d | ORPH
   s390x     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/38def8a9cd086ccd1665cd4494a984f040d56580 | ORPH
   mips64    | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/77f6f99327c7b2c5df48eb8bb9d17ddb996c1232 |     
   sh4eb     | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/427ca8e0a67c59f70885c11f821eab3209df9a94 |     
    mips     | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/fbd4753aa862b3884513b2b71db06db41d519c6e |     
loongarch64  | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/ff83a5e05db20c8fed17bb8d6a133d1ad213de8f |     
    sh4a     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/e676024038d0f6e678d1dfb104d6c474ff441821 | ORPH
 microblaze  |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/7c695d5866920e597b38da7d38e9b0ce318732f9 | ORPH
  riscv64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/39dde83844ab609e8c30e4b6b6ed141d81d7b1b3 | ORPH
    mips     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/e616dd7ed3ac8474eef2c389eb398116173144b0 | ORPH
  riscv64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/e144e5279274c45166e17eb0c14ab15d1694c481 | ORPH
  powerpc    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/1e38d82c2689d4b3a8090732bb53f701e13de555 | ORPH
  mips64el   |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/7b90394bd72d2eef58947848e2597aff8c4e2902 | ORPH
   x86_64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/b16746931baef9f7cc71015775e61842ab8c8343 | ORPH
   x86_64    | libeastl-45469730d641868ce0... | NOK | https://autobuild.buildroot.org/results/695ecf00824d81cfe718949e35e565013423638c | ORPH
loongarch64  | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/0f76a7f7a9071ecb3a51c7752be3cce2757dcc1a |     
    m68k     |        libglib2-2.86.2         | NOK | https://autobuild.buildroot.org/results/440731219454d4852591499c6932966958749cea |     
    or1k     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/873dfb87aaf139d04e9078e8ca9727311f411e1d |     
   xtensa    |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/e185f71cebeb5bf5c85e6bc39d91bb0162004556 | ORPH
    arm      |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/781d4d0a80f738d0354ae0d8c51358187a4026d1 | ORPH
    arc      |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/9ec90b8376215b1fbe9fccb65f678f2a14b9dc55 | ORPH
    arc      |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/2b8e3b807e7bb3f7e0e3156db7e0ebd292e1d6e9 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/f3b2b281d60c20192cac2d1cae2de5f0c5d300c0 | ORPH
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/fa06a20572e779f3c077860bcc7cecbedba45b02 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/fea0f55a39df7494de58662b290f38dacf464511 |     
    m68k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/37eba6ceb40cf353ca796f2a6883d94b5a3504a3 |     
powerpc64le  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/9c7f87b1fa43d798b0d8b207db45456c695db74c |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/413d0877f7b4353f2fe1f04c1b63e2795aba44bc |     
   mipsel    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/7db2e6b6a94904fd4e9dbd793a78797adfb030be |     
powerpc64le  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/932f779eaf0506b7c848ccb1ea8db6c720c2673d |     
   sh4eb     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/41a4aec99b0746961a9e9b4b9b12a7d3aced4967 |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/d342ce92f07cebf1c45eab931bfa1b943b465d25 |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/0125ee4fa6249888d359e4861d938822579f7837 |     
loongarch64  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/85d9b156f53ab026a31b7d57b8df0f8a312f46c3 |     
    or1k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/f0ed9e6d8dff2c4e41f482e0efe6671948dc2439 |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/b8aac9e5d32426e2a2f5770d8efe98402b1f36a6 |     
    m68k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/4ba12be0ac058c28843cc956fd2f03e68967132a |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/f827d72e9fbf1ac6413004891b596ed485e1553d |     
 microblaze  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/f86a7acce70f1b082ad63d2d154856371ea14921 |     
 microblaze  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/e0af929bb5559bbf03c35c371db05abc22798f85 |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/e98b760e9fc8ec80fb2f52bde1f930b16d41f4fa |     
    m68k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/89a5b455994a3803c52c591c9b532fc84f6ff499 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/f473a6854a93e795ad2bb0499be632f80a9142aa |     
powerpc64le  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/4cc898a29db62d27343b9764ac1086f1b3798ee8 |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/c020e10257a8d1ec261521565a28a23874932f0a |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/d42c7c24226755ee627f006d06cfdd5dc6bddb51 |     
    m68k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/aca1c8a5ca298ad8eb99df62152e3d4bba039080 |     
    i686     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/c216e04c7f0d1095fdc3aff07f5dd16596f06629 |     
loongarch64  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/fd3d8164be5ae4e6e1afe9f4c9acd64fbcbf02c5 |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/60b057e2e880b6db4048f63422dfae3fe91ef02a |     
   mipsel    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/569c723a6cf830e6fc21a68035d30073bc5e4425 |     
    m68k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/dedd2ada5da74f80893b3e0cbc370149b7e8b0ac |     
 aarch64_be  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/f318f2838c8687297eef4b0b8296600d6b92e45c |     
 microblaze  |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/1c18029f471257836946106ca3d8f0b5e66f4065 |     
   mips64    |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/b4c258c6bb54aabc2cfedcab92c5a7a0b320bdfd |     
  powerpc    |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/1b31c0247e28ec3817ec5c9924f873523ca49fc0 |     
   x86_64    |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/61161737dc707d20aa9789dc2c6ed78bbe1baf33 |     
   armeb     |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/c2b78992b813a5c63e34cc0d2fa243ffcbb92f84 |     
    arc      |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/7a36857179baea7b0da10173c1761dba6cdf8c33 |     
   x86_64    |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/f957736d780d4cd1defd1f4667fc06e3845c8486 |     
powerpc64le  |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/f9eaa34bdc486b5e3ddbe15b79756a2588d22f48 |     
   sparc     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/18ea6ca14e9211a3b82470608830cecf3dca828a | ORPH
    arc      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0dad2865d869ff7f9e03c8e41b1d2c1b3fd9acd7 | ORPH
    m68k     |          linux-6.18.2          | NOK | https://autobuild.buildroot.org/results/a09cf71d585464060e4ccd89066ba818a269a626 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/fd3440e35c3a5bd0039b0a48c85d50ed8f6f3f86 | ORPH
   sparc     | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/cd6089f596f51dbeef85ece3b910a4a085f3d6d7 |     
    m68k     | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/c5c94ac7521891f358633081ea80e13c16aacb6b |     
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/3b52ade4a6b9143e988d047d9779153d7ef5eeb5 | ORPH
    m68k     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/b04d90033f7fb3a5bac31d2af608ea8482b23903 | ORPH
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/7674cc492d7781a126aa4871e2a3076c53a23225 |     
loongarch64  | neon-2-sse-097a5ecacd527d5b... | NOK | https://autobuild.buildroot.org/results/3c589ae22b13805d793ad1657f088bbf12ee9551 |     
 aarch64_be  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/5dbec84dfea40f9088a8582785c64e97ef150488 |     
   sh4eb     |        nfs-utils-2.8.4         | NOK | https://autobuild.buildroot.org/results/40a503822b20840563f6eca9373138747a23c3dd |     
 microblaze  |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/6bf2f70ae79bc435ada15033524c2f6b481053db | ORPH
  sparc64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/e6a7e2651f5fc76fcd9d4df00862a32bf6137117 |     
   xtensa    | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/2d770e89def2afe1d2e3582a968bcd2fd434f0aa |     
    mips     | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/b738c35342bab79b2aeb4326fc2691b76a01272f |     
  aarch64    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/bc89a0073fc0c49e67466edacd564ca30e1e9400 | ORPH
  aarch64    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/05348e9a63d072c3b15efa6fa76e7141793b58c0 | ORPH
   armeb     |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/52df857e17555dcbc8660963171bd50603c40b56 | ORPH
  mips64el   |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/53c35555e72706c6c375f23e6e88a3bd32fc69c0 | ORPH
    arm      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/3fb5692aa5203e6e496012eca199cd38f5b07907 |     
   armeb     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/1fc60d4f9d93d7150d2bf4d1e2d16ce004e91a74 |     
   sh4eb     |        python3-3.13.11         | NOK | https://autobuild.buildroot.org/results/c768747d8b48db108be0f4d185a161053262e078 |     
   sh4eb     |        python3-3.13.11         | NOK | https://autobuild.buildroot.org/results/e7b67fcde5deb0b84c4a85393ccc1c3dda7afe27 |     
  aarch64    |           quota-4.10           | NOK | https://autobuild.buildroot.org/results/138c7d920669119d1efb1869235fa1f61c587406 |     
  sparc64    |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/1f888b72ffe96d131582b6e32d60862ab4015179 | ORPH
 powerpc64   | rtl8189fs-876e627a5b6a80217... | NOK | https://autobuild.buildroot.org/results/d407481cff02a01085e64b52ac3eabaf5e3eb005 |     
 aarch64_be  | rtl8821cu-7f63a9da2e8ed8340... | NOK | https://autobuild.buildroot.org/results/5818381bf900c845317ee94533f3eb856c7d0f10 |     
   s390x     |       sigsum-go-v0.13.1        | NOK | https://autobuild.buildroot.org/results/355a4f9ed576518971e02aecedafff2b9a1d50e1 |     
 aarch64_be  |        soapy-sdr-0.8.1         | NOK | https://autobuild.buildroot.org/results/074098fef4f8a5e89a4f04efbdd1f545f4616772 | ORPH
   mips64    |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/422333aea386583ddd41a823f75ca7716d98ca69 | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/4a2811100847d577a6f2a0154492616d5dbb34b3 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/c1acd01126338b1bfa93d8201f2f0b64c16b704a |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/b0a7678f70463e2e0aced0be82b9d830912c941d |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/cad63956079e2306347292e8edc8123aaef9907a |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/16bb76a6edcdf3bf4eafd942edd1a3608f1547b0 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/8ac3541f3c78e6c58510ef69b3358ddc3127767f |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1e382d5dc5a5c65bd176351a1ca8841bc505335d |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/b14d9590dbce22c6c38018e4ab17ae935cd53383 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/dc35f6c39f8ee2c40baae5375b6398eec9d25a6c |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/cd1270fafdbbd77423fa663b7b36b8a6bdda5cd9 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/efc829a63ad1f7961dfbb614dba12fa8a30e1a79 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5231dff8a6c972cf931035dd87502958f4de6384 |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/0a8e5f4e2851423c5e9f5b6601c0ae41aca78899 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/dd3b17c47c57eae5adb01f2396b417f0ad0de6d5 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/c40d08fd03514447c15179445e7ef220a31c5f68 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c0daffe7dd98d758c57a69526966e68b8af4f7c2 |     
 aarch64_be  | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/0762a9d3f14690e9c05f9c95102e7f11bd02e506 | ORPH
    arm      |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/8fdb0d775df3194d910c38aa696f231919da827e | ORPH
  riscv32    |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/9434fe20c0a7628278d69206534c4956178aee1c | ORPH
  riscv64    |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/323e1fc4bef0bc402a7bce90d81c0657f10ff648 | ORPH
  riscv64    |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/273188d62b7f5c06aa059005da6a33ef413f993d | ORPH
 aarch64_be  |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/f33749a56d32cf9a6adadf613d56e7f83a2deb95 |     
loongarch64  |            zsh-5.9             | NOK | https://autobuild.buildroot.org/results/d2c7363241f39320f62047b8127ede3a041682f2 |     
 aarch64_be  |        zziplib-0.13.74         | NOK | https://autobuild.buildroot.org/results/a67f14d1500643a0f90b4258bf79091aa5a69b0a |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                   cvs-1.12.13 | 5 
                       unknown | 3 
                     exim-4.99 | 2 
             libgphoto2-2.5.33 | 2 
                memtest86-7.20 | 2 
               asterisk-22.5.2 | 1 
             dahdi-linux-3.3.0 | 1 
  gobject-introspection-1.84.0 | 1 
              host-rust-1.88.0 | 1 
            igd2-for-linux-2.2 | 1 
     libphidget-2.1.9.20190409 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                    linux-6.18 | 1 
               linux-pam-1.6.1 | 1 
                netdata-1.37.1 | 1 
               nfs-utils-2.8.4 | 1 
                 openmpi-4.1.8 | 1 
                   perl-5.40.3 | 1 
              sdl2_mixer-2.6.3 | 1 
      softether-4.30-9700-beta | 1 
                    uftp-5.0.3 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/3925056f672674ec4126ec684bb8c07a262eebf8 |     
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/498c247b67f60f0d2fe9a9e248f0267c22c60920 | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ced08ae3455c44ce831fa96a8d7771960bfe1920 | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/908b37eb498e6337bba942f0477144730550b426 | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/fbef2436b14dcf28e9d4a3fcf3f2e6ea53b90c91 | ORPH
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/59f6e77106ac98535688ff5b9392b0b3ad3041ae | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8546b5ce8bf441c4f3032fc0e51b021aa6807de5 | ORPH
   mips64    |           exim-4.99            | NOK | https://autobuild.buildroot.org/results/63638a9c333c8f2d70c381963a7945824049e3f1 |     
    mips     |           exim-4.99            | NOK | https://autobuild.buildroot.org/results/e1360c5dbbc588c5bdc73e0499f8cc50e8210dfa |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/60f0be370f554ffc8fbde20524664ec4e8bd205b | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/c468d62b70e5b922ca442cef3291abf32fa00467 |     
   s390x     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/7ff9ae957a6212ebd41f7e237ff3e4e396d4d6f3 |     
    i686     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/50b1a52758be9b683a1104b1334aafe006b5b561 |     
   sparc     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/1215d10dcdd95f3e5c2380fbab679d1f95a9fc7f |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/bbfe74ac2b8b7549c52fba71939000b980b09d54 |     
    or1k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/26c60619cfb6c1e5c7abc9c20eb27a7ef71670b8 | ORPH
    i686     |           linux-6.18           | NOK | https://autobuild.buildroot.org/results/852b105d351a668a8488e555f69fd4c689aa0456 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c361b4f35352a322e9596a9598118894b1795dbe | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/864439dda6acc4a10dea081b022313a2cb6f84c8 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/04ef4dcb57e41830c65797ef61e05fb9d31871cc |     
    i686     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/d9e9b5682bcfb4135271d38adfbe26b2aa699c49 |     
    or1k     |        nfs-utils-2.8.4         | NOK | https://autobuild.buildroot.org/results/1af968f897595dd03740873d9641c2088f1065fe |     
    mips     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/3a347642a24abe995352784168733fd36f8586d7 |     
   xtensa    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/b81cfd8823f56d00226f722f1d73b611882566b4 |     
    arm      |        sdl2_mixer-2.6.3        | NOK | https://autobuild.buildroot.org/results/13d3ae520869a0bc3b733d58fda5582bebb87699 | ORPH
 aarch64_be  |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/ec9acb5ec2fde853a6d0119810023d0884dff121 | ORPH
    i686     |           uftp-5.0.3           | NOK | https://autobuild.buildroot.org/results/cc8e968ee0bdf68a5781ff597e9405cba80b319d | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/dec31187767d6cba017c630cbeaecd6cc94e20a9 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/7bd7d5819fe240a57f9313965caa25754ed8a578 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/620f523d0733a20dc356dc5605ff38281c059eed |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libxslt-1.1.45 | 18
                libxslt-1.1.45 | 8 
                       unknown | 8 
  gobject-introspection-1.82.0 | 2 
                netdata-1.37.1 | 2 
ulog-0389d243352255f6182326... | 2 
                   dante-1.4.4 | 1 
                  dpdk-24.11.1 | 1 
               dvdrw-tools-7.1 | 1 
                  ffmpeg-6.1.3 | 1 
             fluent-bit-3.2.10 | 1 
                 gerbera-2.4.1 | 1 
            igd2-for-linux-2.2 | 1 
                  libbpf-1.5.0 | 1 
              libcamera-v0.4.0 | 1 
                 libjcat-0.2.1 | 1 
     libphidget-2.1.9.20190409 | 1 
               libunwind-1.8.1 | 1 
          linux-5.10.162-cip24 | 1 
        ltp-testsuite-20250130 | 1 
         lttng-modules-2.13.10 | 1 
           oath-toolkit-2.6.12 | 1 
                 openssh-9.9p2 | 1 
                   perl-5.40.3 | 1 
               tcf-agent-1.8.0 | 1 
toolchain-external-bootlin-... | 1 
               valgrind-3.24.0 | 1 
                       zsh-5.9 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0ca1d842fa92f3bcca12955ebd910b582ce90d68 | ORPH
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/6805836a33c9a2fafb5405daac75cf052509ed11 |     
microblazeel |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/32e90e6b5ffc3d05692c9562f1215107179cd871 |     
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/02ac93d7b4ae91592a8c574c49529016770cedf8 |     
   mips64    |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/7c555c9a7559e61db94f6c239872c7a53dcd3f0e |     
    m68k     |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/6aa950a2288ef3a70d010eb4bd946ce62c726e50 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8e20b1421f5984443f279903c24ecfbe11d01396 | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f761b19ca34fe006fa416a425ed9a70e90e124c4 | ORPH
 aarch64_be  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/c0342f8e91244059c6c67fdf910cde6ecbc6b0e0 |     
powerpc64le  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/b1319e6d59b3806e536a7f57611ee27124f2dedf |     
 aarch64_be  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/d1da8c7ba357e89c2d201b3f18a1985a072fbe09 |     
 powerpc64   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/f604a2e013ea629f88b956483b5aafa2b06eff6d |     
  riscv64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/9d7d527cac54d9f5954428ff69156afc62790748 |     
   sh4eb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/46539e1dfa9ad2f02ed9ab4fada4b3bf6a2ebf53 |     
powerpc64le  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/59a60788fc72ae6d983513c15127ce39bb45c2b7 |     
   mipsel    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/49521b410883da9c9e574bc3589be8643321100c |     
    arm      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/79fc9a3f271b6d654b329097768945e95f491a84 |     
  riscv64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/2494c6e4d56f9a916a9374d954d7f48db4ee21f8 |     
   sh4aeb    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/c36c360633f94fc2c449161ecde94b7cc0179462 |     
  mips64el   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/48bcb27c9d8edec573f86271da80a16e8b73cbd8 |     
 microblaze  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/6cb32aacd9bd99d107e756283ecc9190a8f2a066 |     
microblazeel |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/15e65d5be90542985d8cdecfc074b32400d798d5 |     
  sparc64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/8c990b850aed94ec1dcb2492dcfa8bb279eb07ba |     
    sh4      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/23280af6aaebb92d88809444f4c9daf7b2e54167 |     
microblazeel |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/41b4acf69e69b6024963fee3f47b9456bdc363aa |     
   mipsel    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/9de9912a8e666d22cc00c4e78b50d46323b2891f |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/9e710e5ff53dc97b187c14ca60ced544b708c81f |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/a23035bc9358e7ef2c977996748e6d1ff30b157a |     
 microblaze  |        libcamera-v0.4.0        | NOK | https://autobuild.buildroot.org/results/79a509a3c74e19986537f970e9c752fca58ebbf4 |     
    sh4      |         libjcat-0.2.1          | NOK | https://autobuild.buildroot.org/results/dccaeb8f809c546921e5b3e98a504ba3e46f81e7 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/675879627a0776428e414a14d8e83c8c7efdbdc4 |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/467cc91bd32216a5fa6b42b9c437c6f814606cd0 | ORPH
microblazeel |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/c12b19b108f536609a2b678c5ff740cc41986c7e |     
    i586     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/a26ff008b774f5ace2e4c15618779e1e5ab1e4e3 |     
   arceb     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/8c1e4c9d10c56cd1ee02d1c5a024a2eede4cce44 |     
powerpc64le  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/0d6d4b41c17c9b431a83ff74ca251b47374070a6 |     
   s390x     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/f22f485e6092eedc85dfb4813ce1a7615122ca62 |     
  riscv32    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/b6638f1142bd21a86ab6ba2951cb8fb80040dc2d |     
 powerpc64   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/7d2161b4f18a82023f11409485f135202641560d |     
   s390x     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/d572b06b6ff3814002220313e3b8c1568576dc40 |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/3143b0598c9f427db61f1bde768891ea9dde4658 | ORPH
    sh4      |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/e3bcb7fc8c406b32cb193c59dbc3084ee83adfa1 |     
 aarch64_be  |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/c4c5dd5f9967c7a6743a54adb6f2163a02bfcf7e |     
 powerpc64   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/738732342a1791717cc3f0e88098a8f4725f7150 |     
    m68k     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/d320cb969dfd401d15dbcb03ab42e2304ff5b3ea |     
    m68k     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/55cd70f6a28519f9c02c5a13135212ae6f68632a |     
  powerpc    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/4439a459fb0c97347c9a1900df5d77b36c5ab9f6 | ORPH
   mipsel    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/d6d91de0527e7bd60d4464da6bceafd2f157df58 |     
 microblaze  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/a3f5dbdb9ad4c49850cccedd3e9569a9f35326ed |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/8481266aa273ec8f6b503acbd2750144c3c36d4b | ORPH
microblazeel | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/3692ebafb9f5f38a99de502071699da22f435147 |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/7abf3cfde611ee73e2c80ebafb443711a3c63c23 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/8681d88bd33f1eadaa031ee3a7ecef9efee2c051 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/5e7e564f604b0dc5396e73f28415006d617fe74e |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0edfdb90cc4eb41c1f57db44bffe3ccdfe3e1410 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/cee028a4097dd79fa6cbbd63a3427645f5daae21 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/fec323a4c361862b9942869d966b12e8a6132139 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/dedf88abbdc70d0c0897b104e164f3beab7b080a |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/e47654f21b49e629d16924ae773b5551789d9af9 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/361c8bb875ba69c4c38d7028730efabb91ec3e8b |     
   mips64    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/b34cdc0c93ec2208d5c1bcafdbee7a99b2a58722 | ORPH
    i686     |            zsh-5.9             | NOK | https://autobuild.buildroot.org/results/52ee63d1df1a60fe9319d46db84aac7d8c1d510e |     


Gitlab CI results for 2025-12-23
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/12522879488 |      
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/12522873205 | ORPH 
  TestNodeJSModuleHostSrc | https://gitlab.com/buildroot.org/buildroot/-/jobs/12511538616 |      
  TestNodeJSModuleHostBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/12511538615 |      
                 TestGawk | https://gitlab.com/buildroot.org/buildroot/-/jobs/12511538468 |      
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12511538463 | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/12511538419 |      
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/12511538418 |      
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/12511538374 | ORPH 
   TestSELinuxSetBooleans | https://gitlab.com/buildroot.org/buildroot/-/jobs/12511538340 |      
       TestSELinuxPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/12511538339 |      
...ELinuxExtraModulesDirs | https://gitlab.com/buildroot.org/buildroot/-/jobs/12511538338 |      
  TestSELinuxExtraModules | https://gitlab.com/buildroot.org/buildroot/-/jobs/12511538337 |      
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/12511538336 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
