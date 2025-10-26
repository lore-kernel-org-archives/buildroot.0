Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79384CCD193
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 04:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC72740D48;
	Sun, 26 Oct 2025 04:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18rN19kJSRwr; Sun, 26 Oct 2025 04:24:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9370F40DC8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9370F40DC8;
	Sun, 26 Oct 2025 04:24:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 002E743F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 04:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB2E440ACD
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 04:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubpxIT8gHBSu for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 04:24:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45E7840406
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45E7840406
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45E7840406
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 04:24:20 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4711810948aso24388205e9.2
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 21:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761452658; x=1762057458;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nBtmHXuAoac44Fp4vMJGugoCgYE0/+t4fmiBgvT+SU0=;
 b=TXxELzGL1SDZHx45o6juQU+SHY4kv/HxOElu1RcARKwHoXCYRb/rQWxjIBiAlc0KUm
 9geMuiHrC9kvk1gO+KPZdGYJXQx6lHRCIL4lYjuZ4uoakjNUNtncWXWBbdHUdQryw4mQ
 Un96VzNnscaYi4erpHUYgNsfmZLjpQYLE+5TSnzf5rhy3j6dABtrHtYr9a4I0oeqsL8l
 AVCg/BpCP/gn0Ir9uUPUq70QD2yoSsNjuJww8gLGygvvSGaGPemuMvduV07KbQEP+6z9
 nsCKkA1T1nJxJhfRPU2EFEawOHnfH9w8nGRiK79cox8vcEC5DMr18dovWD5tH3JwJJt9
 2Q2Q==
X-Gm-Message-State: AOJu0YzdH5dtO52l4XjhcUq4bzOOlyzaFwiEddUieSVk84s45uaUlQyM
 qdR3mYkwyFXhb0EK8TCpg0sWo+5lkDoScHMnVmoi1RZSBfpWMLuJ53RnsRoKSg==
X-Gm-Gg: ASbGncvpKTV2f05Hf/dbGNr+h4kQs9MBtaVvu5/iY3wa1Rryy5x9r8lh/DdJuDO3siY
 mKB6cHqSELKuJ2Tn5GgX5Lsi27uWr4ZQMrl4HQ5KVAh/14hV9A0SyRp6fRcf71uWaxBJqx3E8Hc
 35I2PMAq0fsDftnSnoF3sEfgylbONpGllFYoubkdF8dx4ZZ1JGbjgewmLAwmBLRVuntnKP7Yep9
 STCqcKjW/kDohpxYxNdwnYKEZuZ1RZGOmbaIp9KR4vngmr0eWoi2O+Nogqur6rxUXG89OpJRxB8
 YHOJHdV8jmpI3+PCGmAYXPUg5PiOQ7vgIW/1LgnZAOjd/2piDhVaTrsdWLDR/Z6vfhYiyoe8AQe
 vzxSzzT4BaxGVItsIbddsQg8qJpix+oyuloxnPAfKSxP0sEhscDHMXBTXme1wzcaHg0g5DonKkT
 I/mj9lcSuf9hWkYWUfUQ==
X-Google-Smtp-Source: AGHT+IHIJd7qQQGVktcYpFR4e+nZlYz6NzJaKafPPQ5fF7AXDk5N9KYjyGYQv3qOklNWOMCFa71F0Q==
X-Received: by 2002:a05:600c:a4c:b0:46e:37fc:def0 with SMTP id
 5b1f17b1804b1-471178a23c5mr246885055e9.9.1761452657788; 
 Sat, 25 Oct 2025 21:24:17 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475ddb01036sm29975285e9.13.2025.10.25.21.24.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Oct 2025 21:24:17 -0700 (PDT)
Message-ID: <68fda271.050a0220.8ddc5.69a3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 26 Oct 2025 04:24:17 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761452658; x=1762057458; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=nBtmHXuAoac44Fp4vMJGugoCgYE0/+t4fmiBgvT+SU0=;
 b=CQxJXyDLt3kldylZgr+0yLmqQIBcTWybWml9HT01Oa7047CoLXL0x8/sNPdiGczXcW
 tQHF/lkX5FHAth2Rng32Kcs2rKDGOcfN09wxfF3d/2fLPpDs0xcQOrXwu6OXSz5gUmCE
 TCodWXnTKtF5JctRnEZFlnUv3y1O98I+pxZrKIBeAMZgs1QEpoeqYJg/WWBOofu6CTwH
 RhQKRXK+oRUeIehsygq0a8cFbz/52QVMu/7r0eH1hrIY/xgDblsDbZWZjwWcBwar+JcH
 lhw4OQWlRwz9ERe7O/wjIP5nivG5XsTGsGcGA8xTBWtqlgOvq2Gg2++NtUljdd5jBJ3e
 hC+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CQxJXyDL
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-25
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

Autobuild statistics for 2025-10-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  |  8  |  0  | 16  |
  2025.05.x  |  2  |  6  |  0  |  8  |
  2025.08.x  |  0  |  4  |  0  |  4  |
    master   | 35  | 74  |  0  | 109 |

Classification of failures by reason for master
-----------------------------------------------

libdbi-drivers-0bfae6c43134... | 7 
           host-openocd-0.12.0 | 4 
                       unknown | 3 
               bctoolbox-4.4.8 | 2 
                  brotli-1.1.0 | 2 
                   cvs-1.12.13 | 2 
                   dante-1.4.4 | 2 
 host-softether-4.30-9700-beta | 2 
                libselinux-3.9 | 2 
                  libsvg-0.1.4 | 2 
          linux-5.10.162-cip24 | 2 
                    mpir-3.0.0 | 2 
                python3-3.13.9 | 2 
                 agentpp-4.6.1 | 1 
                apr-util-1.6.3 | 1 
                   bird-2.15.1 | 1 
             bmap-writer-1.0.2 | 1 
                 c-icap-0.5.10 | 1 
              containerd-2.0.2 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
               dvbsnoop-1.4.50 | 1 
                    eza-0.23.3 | 1 
                      fio-3.41 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
  gobject-introspection-1.84.0 | 1 
    host-llvm-libunwind-20.1.8 | 1 
    host-mender-artifact-4.1.0 | 1 
                  iozone-3.508 | 1 
                    kmon-1.7.1 | 1 
                 libbsd-0.12.2 | 1 
                 libjcat-0.2.3 | 1 
                  libjwt-3.2.0 | 1 
              libopenssl-3.6.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                libsolv-0.7.30 | 1 
               libtheora-1.2.0 | 1 
                  libva-2.22.0 | 1 
            libxkbcommon-1.9.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.17.4 | 1 
                   linux-tools | 1 
                 mdevd-0.1.6.5 | 1 
              netavark-v1.16.1 | 1 
                nushell-0.96.1 | 1 
                openssh-10.2p1 | 1 
                   perl-5.40.2 | 1 
procrank_linux-21c30ab4514a... | 1 
   python-pydantic-core-2.41.4 | 1 
          sane-airscan-0.99.33 | 1 
                   seatd-0.9.1 | 1 
               trousers-0.3.15 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/0c4f38c980cb6cfa3e857af5f3c6bc545632815d |     
   arceb     |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/16c105dd59604247092e83af2748f1303d017eb2 |     
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0ded730d428b9b7860ece6a67fb763d11fe5f1de | ORPH
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0f20d2d67c95ca8a3c1074783a61d0259a2d8534 | ORPH
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/700fad766ff4c6f515324eea633924d394a22f71 |     
   armeb     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/18d8fca3f4a13c77af8afae1f3bcd68774728e9d |     
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/fdd48fd48ec7694655056d24660c720d4d3889ff |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/cc70f32cc51ea7bbd530b962cdc46f4f9cf790b9 |     
  mips64el   |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/f6c6691d820b7016c76bbe41d699e66a6675cc1a | ORPH
    arm      |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/504e99846a9c80a972f883a7e5792d2a25b9ac8c |     
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/cc4ada7e28279b86fb4141906f0b47d5093ff009 | ORPH
 microblaze  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0bb1eae58fabdc55a37bae2569384dfa8fdb373e | ORPH
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c5b33bd459995e3f0cd91d93fc36019116a74546 | ORPH
   armeb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/dffc40074af23a1d596017839ecbca6615ba0455 | ORPH
 microblaze  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b9cc6ea0d52c63e468268b4e430b57ffe06e5e9c | ORPH
   x86_64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/63740a54adcd4633b5a580ffec4df552007629b2 | ORPH
  aarch64    |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/dd4c7b4e5c4e280f6e808deb1cfe24304e9461a2 |     
powerpc64le  |           eza-0.23.3           | NOK | https://autobuild.buildroot.org/results/81dff1faaca37dd3dcfc66ed6f145d2ee9755539 |     
microblazeel |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/e4509dbc2c6f0617da8da4a98f3abf99f69a703a |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/f4b5b2b7a3751cff29ba1ed07387acca37254d48 |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d0f5297af4c8ad8a8ea09d8273282e6b20af68ae | ORPH
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/c2689ab2d52475a2e2e7c34c12f1cd3ae83ab21e |     
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/a049bcbac7646799fb5aa27cb467b136f7d21e69 |     
 powerpc64   |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/9e53654f327710474c81d3320658f651ed432505 | ORPH
  mips64el   |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/49e40db2f0c5f66d684c7bc52e3684b980df5f42 | ORPH
   mips64    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/a73d6d9ae5ee33343c1b92dd26575688ea6f155e | ORPH
    sh4      |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/9313c2866d65159f849ee4137037878ef28e18d4 | ORPH
  aarch64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/8d1c41193d54add00c0cc8892496ce6e79003f5e | ORPH
loongarch64  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/319d5a8ef69b668252d3dc80041a7834f8878410 | ORPH
   x86_64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/40e615f8d3ed86c691e580c7bb7c5311246f6c07 |     
  aarch64    |           kmon-1.7.1           | NOK | https://autobuild.buildroot.org/results/7e16499abe2df779180393ea150a34afd18dac7e |     
  riscv64    |         libbsd-0.12.2          | NOK | https://autobuild.buildroot.org/results/25d8b0f08a0359d2fa244e6a72fa19977447eb44 | ORPH
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/ecfff49fca1eb1f039864675a5b212bf71222ecc |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/66bb29c44843345b5725cc300638b2d5842a25c5 |     
   xtensa    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/ea91506361bc3d7f78a53c7312201b3725cd1944 |     
loongarch64  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/a2a58bcd791a65d31cdc0971a3833beac062abda |     
microblazeel | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/28474dd80d2488a72ebfd822469638e0c4fc5502 |     
    mips     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/d3068de2f477d68823c4b7e537f120edf03338bb |     
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/50838fb58111c649b1edc14c0ea27930a9bf737f |     
loongarch64  |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/027fb4d4d10bdfb66c2f3e47f5d9dfb5e447d363 |     
powerpc64le  |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/dcd91bf61b49be37f3955922546b10e6595f88d1 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/af0578183ea623ac06a4eccc28413affc980cc34 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/726a3055c70b1ee8757590ffe68ff7634a9c9c26 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/79cb2106b3272bb14922a1df9d524f1d96c4e89c |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/7f86d55049ddb2264e68e0a7a7751cd1b4b5bb02 |     
   mips64    |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/98d1f5612feacd13f325ac58ceaf40173226b1dd |     
    mips     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/aa95a7a10d27d9e95228f5d62ad5459318f2f915 |     
   mips64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/393d596286185d2bfcc2e8e23a8bf31fea797f4d |     
   armeb     |        libtheora-1.2.0         | NOK | https://autobuild.buildroot.org/results/20374511c0068ebc6f8a96cb71ee8d5d09a23c62 | ORPH
   mipsel    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/b01eb6a18b52ee1cd95b9135f3b6283df91eaf28 |     
  riscv32    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/0641549b3f0e81ddcfbeb59339d250f9e8b1b29e |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/c6b9c82352be01dd4bab2021a223e72dfaf1f522 | ORPH
  sparc64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/1f226d028d85c085d82f3890e804b39bccd2c2dc | ORPH
    or1k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/04c85f2249f169403c488d6fff77610e9962a62a | ORPH
  sparc64    |          linux-6.17.4          | NOK | https://autobuild.buildroot.org/results/8d112fcba1c914b3db70d4a39f223bdc8ce9788a | ORPH
    or1k     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/f8b86af53963a6e2afdca5a3f775199347ca7f60 | ORPH
loongarch64  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/21e4f6a39a596776d29135f94e0f538dabc84db5 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/94521f893a7fe037b37da8b488784ab328282eef |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/eda76948f83e47bbbfd0681b7ac2a71ca3d89dcb |     
  aarch64    |        netavark-v1.16.1        | NOK | https://autobuild.buildroot.org/results/99cb3c938cbc941ba404421414ae9964ca1db994 | ORPH
  powerpc    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/87a93903afe675c1258f6068533133990bb041af | ORPH
   mipsel    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/9b2333e40bd4727bcbe23c1949a6b78c59b1dfee | ORPH
powerpc64le  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/11bcbcfc5019aa7a6c1f83ce1783b6b03d1f7fa3 |     
  mips64el   | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/f2b41d27cf32808783b582e8ad714fb653c05713 | ORPH
   s390x     |  python-pydantic-core-2.41.4   | NOK | https://autobuild.buildroot.org/results/187b5e9bfc015ac4b1cc63c2613370392bbc6b24 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/bca66acb3037849b1fad239f1a8bd1d33b43f4ba |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/3dabc73c79b3dda6e3b300cacb3b673c8d678a6e |     
powerpc64le  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/d6a2e87531d7536c8f8ab22a90ca461b5c832d99 |     
  riscv32    |          seatd-0.9.1           | NOK | https://autobuild.buildroot.org/results/8d8b4b4d41a19f132303bb0dbfff30546f505171 | ORPH
microblazeel |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/51d42fd9fddbad1454827aceaff170241e16ac41 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/bdb9409531cf7f235869763ea77304e48e261c21 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/c169f3565c8856d73e390f2511930e486ec302fd |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/d46d552814ded90b6c061443076655075fde39cc |     
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/e3f9d299f2fbf8fd1a9b4a9b627cc505e4ffa0a9 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                   atop-2.11.1 | 1 
               bctoolbox-4.4.8 | 1 
                 dc3dd-7.2.641 | 1 
                 netsnmp-5.9.4 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          atop-2.11.1           | NOK | https://autobuild.buildroot.org/results/0ff5aadfb5c5b5241fe9c182848c4ba148113937 |     
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/d49d836833ebcbbc1c6398b746378ce93ffbddb7 | ORPH
    sh4      |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/b52a19eb7ecc107bb5d0ce23f91d8eb6a9c622ce | ORPH
powerpc64le  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/c3c4b2a1373544d76faa56b878befa94b8ea181f | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              host-rust-1.82.0 | 2 
                   perl-5.40.2 | 2 
               bctoolbox-4.4.8 | 1 
                   cvs-1.12.13 | 1 
            host-binutils-2.44 | 1 
              wireshark-4.2.13 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b1c1a3fda5c8f535409f5564314eb5eb39fe53ed | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3ebda9a2f169e9573990e977b920584c0683941c | ORPH
  mips64el   |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/68f1a31b9c35d2f53a051cb509314be69b91d0f9 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/67e1b3798a215728da0b8f4e468e6ab91c5d3898 |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/f6350351301eb3ba136bdf132d651f554c47f561 |     
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/24651e3099568ad1ed0e3d4eb1b6903e34e39f41 |     
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f3d81075024efab376de1a41d16e5df8d64fe902 |     
  aarch64    |        wireshark-4.2.13        | NOK | https://autobuild.buildroot.org/results/b29ac865d791b66a270364c10ccc317eb1e1bf0b | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

             bmap-writer-1.0.2 | 1 
                  cmake-3.31.5 | 1 
                 dc3dd-7.2.641 | 1 
                 expect-5.45.4 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
           uboot-tools-2021.07 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/ca5a3e6f9d545f6995bc875c5f9f4feb80315ddc |     
   mipsel    |          cmake-3.31.5          | NOK | https://autobuild.buildroot.org/results/d0110ce577ed8061a813fcc89428883de8d7367c |     
  powerpc    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/1ab21e80f4c3cf6516d605486f0ecaa22b9e43ae | ORPH
    i686     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/de941b2a6be3ca8017a32492f9dfd5cfc157b682 | ORPH
    or1k     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/c9906b2bf81c36e4b27267de62c0a8f0c36aec42 |     
   x86_64    |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/b877be82afa0ca139818fa4ffd6274be4b7c87ca | ORPH


Gitlab CI results for 2025-10-25
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11829566663 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/11829571179 |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/11829574574 |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/11829575241 |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11829575275 |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/11829575369 |      
               stm32f746_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11829575473 |      
               stm32f769_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11829575624 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11845797336 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
