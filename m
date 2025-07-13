Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0786BC83F10
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 03:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 863CD81B17;
	Sun, 13 Jul 2025 03:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1dyI45hSkrv; Sun, 13 Jul 2025 03:15:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95DE381B83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95DE381B83;
	Sun, 13 Jul 2025 03:15:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09EE1DF
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 03:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 069A181B83
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 03:15:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WonNUb5eGGm for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 03:15:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD79B81B17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD79B81B17
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD79B81B17
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 03:15:38 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-607ec30df2bso6501693a12.1
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 20:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752376536; x=1752981336;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3NCn0ZYbTLLN2w6ek2ogBrNbj6PgnVw1AQ+L9mv14/c=;
 b=X57Hed9KrgVOobeVu9RjO5LEOA3ZYV+Zzd2tz4HyOk2lYTJzPayUbl19zx5lKpDLFn
 yFIHGZAtRA5GQ1nXllAj5phdrVRxSJe7X10c0vNBDeeGK7YwW4kro4JUkBaFgtFwm2pf
 kKuE0rDntyCOm2IPTdwS/3V/emixzmmJ0LLLxL9BhN2kmD2am4W0OdSWuGqmU7oDWzns
 ji0hzuB8FDOTrwkACAG9c8XV8rEUxHxaaBr3AHyuCFnCOwtfcuFMuU+kMk3T3dfqaMX5
 qm8epp/53vit2QZ5ZdmXSt581vUj9jnspnliXn9fHQKU8oCNabnWBnPhJK5X+TKXuwcy
 Md0g==
X-Gm-Message-State: AOJu0Yzl8t9JJ43aNdugrki0XYfq6vDZ4A9L3Wwon3/scJOiRcIgrqYn
 yhEp8JKsG2J/ubh+Dfc1Gk/KTiJ0ePFUCuzuqO0GF33AALm5owEr8R6p6RB7tw==
X-Gm-Gg: ASbGncujk9Y1RXZFFlMpMs9YHuqvemMZOeFp+kWALpgT12MxWXRxoRhvGZ1kC7/kGta
 8YiYR4iK2VZxP6eNIUD8J7tV4CF80eaDYD6ypG1u7vPEteUs7L3vW6W7Bi+Yo+B/jW3DjhTn+qE
 ECBAWsVmfh07zW6zxx328dfGi3Xdu1b0QNhXh2So/CLCfReQ44S7znxqoWttIsVv8NX+dMKaBiu
 +kuxtXD7fpOl2sov8c9Yp9O2fIDy7dqIjSYDS9wYPpztmcpyv6ahs7sHrIO4CtDQxNEtlA0W1yu
 KD7DGnKV9hr2OPrz428vCA5cBVmzwns+eCrFdrSMljL46MKCy27YBBXzAQpH2PGzp4/B95WZgSS
 hwH9ExAhGhwCScj9F5CFvM3FP5w==
X-Google-Smtp-Source: AGHT+IGC/NxHTb4oGKHwbMMCSdmQA/dxqVLVJUYDEA5d9zdYOFL6egBSCDogkkEa9ZI4LAQqJs1F3A==
X-Received: by 2002:a17:907:3c8e:b0:ae3:a3f7:ad8e with SMTP id
 a640c23a62f3a-ae6fbdec31emr859281966b.25.1752376536315; 
 Sat, 12 Jul 2025 20:15:36 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e9235esm591431466b.12.2025.07.12.20.15.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jul 2025 20:15:36 -0700 (PDT)
Message-ID: <687324d8.170a0220.94f46.00cc@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 13 Jul 2025 03:15:36 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752376536; x=1752981336; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=3NCn0ZYbTLLN2w6ek2ogBrNbj6PgnVw1AQ+L9mv14/c=;
 b=Gci+ZRav7fPGCELnRNzsxtNU87EwVkQeiKPrJIxAiJVEABbW/rC2kMp2/EEcLZVt6s
 zSxT8jUTtG5r6T16+fPwSBr6mgQr8asHUb+4yd7TsZ32dXmRt5w59maPDcorak6FohGx
 35SrqqwOoiB5IJ5GfWwHeS+OMr4093aIqQG8yL5faNDTfbfmUXnWO0CjgGqFXNMceOH1
 6ug7QkJavfKv3G6/f027RBpynL2IH895ivgXJ+2S7NfgD46oApeQiSQTV1cQ/ecBDUlp
 kXZwKvYHuX1A9YBXyrocgzH+gGflS7POykbBQysxoU0NoN09KSdgxcKWYRcrxQQn+q3g
 sbaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Gci+ZRav
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-12
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

Autobuild statistics for 2025-07-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  0  |  2  |  0  |  2  |
  2025.05.x  |  1  |  1  |  0  |  2  |
    master   |  0  | 15  |  0  | 15  |

Classification of failures by reason for master
-----------------------------------------------

               bctoolbox-4.4.8 | 1 
                 expect-5.45.4 | 1 
                flashrom-1.5.1 | 1 
        host-berkeleydb-5.3.28 | 1 
host-binutils-arc-2023.09-r... | 1 
       host-gcc-initial-14.3.0 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
              host-rust-1.86.0 | 1 
             libargtable2-2.13 | 1 
                libesmtp-1.1.0 | 1 
                libpcap-1.10.5 | 1 
                openssh-10.0p1 | 1 
                   perl-5.40.2 | 1 
             util-linux-2.41.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/1081a9e91fa5e0a1a67280e22a9a39fb6f1b587c | ORPH
  mips64el   |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/9a58d0996789a4a82dce87e2b772879e0c312f87 | ORPH
  mips64el   |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/b8f69f337e348b2ad842f2ad740a906420544ac0 |     
    or1k     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/623e495fbfcd3ede4a9bce210ef921c9d004fec9 | ORPH
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/fd6de0208b520be5bed54e9f56c556d5f673f6c2 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/28c6c87dfc4dea8d7dd7951ebe06998e8744ab2e |     
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/0e6936e370ed991bc2fc107e05d0a2c031825a77 | ORPH
   sh4eb     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/984f18b51ed193625415e9a0489072fcb956748a | ORPH
    arm      |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/3665cee070534cf7d69fe31dc165f8014d153c8a |     
loongarch64  |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/dc00f40be560d2e61d4e33a91e207b02aed0e289 | ORPH
   mips64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/f484ae0196991d9d69cd5d7539a9e52d111c5ece | ORPH
   armeb     |         libpcap-1.10.5         | NOK | https://autobuild.buildroot.org/results/50e49cc4c3794bb89818b885a3de1ee6aa8666f6 |     
   s390x     |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/92d23f6ced63960531f53b54cb0b4a12a347a6ca | ORPH
   x86_64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/128ad4636b7cc99672da1a2d7ad073f1ed411299 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/9d2666b318326b5a7b583e5e02c3b5176df292fb | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libesmtp-1.1.0 | 1 
                 linux-6.12.35 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/ceda012506edccda1727904eb3327017b07e27d8 | ORPH
powerpc64le  |         linux-6.12.35          | NOK | https://autobuild.buildroot.org/results/1036a167d34a4a97d8af7d65ae3f7c81b3325d98 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               libsigrok-0.5.2 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/66e9e9af2d567430b8fbcc4ed980920bd0539ba8 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
