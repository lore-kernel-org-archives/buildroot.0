Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C39CEDDA9
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 03:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCD44813D0;
	Thu, 10 Oct 2024 03:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrjgKCqcQ2CP; Thu, 10 Oct 2024 03:17:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5399813C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5399813C5;
	Thu, 10 Oct 2024 03:17:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBE4B1BF399
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 03:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D97D6405A2
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 03:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUWNv_NePnIF for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 03:17:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D6AF40580
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D6AF40580
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D6AF40580
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 03:17:24 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c721803a89so483513a12.1
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 20:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728530242; x=1729135042;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BT9nCsIvQCypa+f17ly7BU6arVVuDTAwF7MRrICQvA4=;
 b=NzxDKht1lGeTSeFZH3JVht+lzLKmzyGfkRDksAkM4zBltenfGUa0X1Lo83TPKSj5RT
 9TuI5eJN3Bi2Tr8dhKBEWEK8NZOnCMDHw7/rDfQ3qePSD9MwoFWAmYIaXpVJQNV+Pr2O
 IvBxPUnfh5kgvsDdCH74MChL6oCRgf9rYmH+kFMzjjqM2++r2kE6CFbeeLpYR3TQcW/q
 eUIopbC4NwTNBaDI1CyiX8RJEuTxpikjm1+2d+H5mcbelSEROwPHiyE/gyp+ZKnlrOMX
 w7w3Dt9DwfjCwx3QVdZ+GU4MSjMIhxQkIXO2qS8b1BZ1ErvY2mnBDGJt2JdszIoyRs/X
 Fimw==
X-Gm-Message-State: AOJu0YxyY0lgEHmXXmLqy7CKGdCiGb0eObbyEC1/jPQ3KSiU2G/kbcGG
 fc+QH02J5o8qxPgxeDzbrMfCbTXFAtX4yNM52QwFhZJV3LS0rCmJd/1KQg==
X-Google-Smtp-Source: AGHT+IHfrF+BifrnwuIVmrkmL5GXHrJ5tyQGNRcJJ0N1KAskhUMgIzDJOQTvt1PE+tfhFlsltPjJ4Q==
X-Received: by 2002:a05:6402:5383:b0:5c9:1b41:77c8 with SMTP id
 4fb4d7f45d1cf-5c91d72262bmr3153054a12.29.1728530242043; 
 Wed, 09 Oct 2024 20:17:22 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c93729a731sm168272a12.97.2024.10.09.20.17.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 20:17:21 -0700 (PDT)
Message-ID: <67074741.a70a0220.28038d.063b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 10 Oct 2024 03:17:21 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728530242; x=1729135042; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=BT9nCsIvQCypa+f17ly7BU6arVVuDTAwF7MRrICQvA4=;
 b=MBg9xy8qnbQhbdjk9HFlZBA1vFRLjccqQ1sHTtekcvIWsCQU6N+RUkUnYAngx1uATb
 pEhoyTy9dmWcitPGUkkujjfNmkMunl2YU8hnbg70SJ4B/TiIQIXcHlslmIrjxctq05rz
 JyatAtqFKcwsCXZBuQpvA6Fi48Ij0RD8D1wQnyKSC120LptZh5EtSPpRA3wjgut9y+Ht
 aP1IfEcYCfGqyLLjn9iqrRQzb0aPSqwbtUPcFtOsxVWe+y079TIu6cl+QkdET/xg29Ss
 wU3ckDXvZUp+dJUtWFfI3c/IgO93MGLgqdkPcLgtsXHnYql3a5v+AIj3DWc9oTzCCHHQ
 0uUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MBg9xy8q
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-09
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Autobuild statistics for 2024-10-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  6  |  1  | 11  |
  2024.05.x  | 16  | 22  |  1  | 39  |
  2024.08.x  |  6  |  5  |  0  | 11  |
    master   | 10  | 85  |  0  | 95  |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 10
                libcurl-8.10.1 | 8 
                  ntp-4.2.8p18 | 4 
               procps-ng-4.0.4 | 4 
                  bind-9.18.28 | 3 
           host-librsvg-2.50.9 | 3 
                       unknown | 3 
android-tools-4.2.2+git2013... | 2 
                    azmq-1.0.3 | 2 
             bluez5_utils-5.78 | 2 
                  ffmpeg-6.1.2 | 2 
            host-binutils-2.42 | 2 
           host-cryptopp-8.9.0 | 2 
              libopenssl-3.3.2 | 2 
                memtest86-6.20 | 2 
                 pixman-0.42.2 | 2 
                 agentpp-4.6.1 | 1 
                 apache-2.4.62 | 1 
           at-spi2-core-2.50.0 | 1 
               bctoolbox-4.4.8 | 1 
                 coreutils-9.5 | 1 
      docker-cli-buildx-0.16.1 | 1 
                  evilwm-1.4.3 | 1 
                     file-5.45 | 1 
                    git-2.47.0 | 1 
glibc-2.40-18-g564178076272... | 1 
                 gnuplot-6.0.1 | 1 
                host-go-1.22.7 | 1 
host-heimdal-f4faaeaba371ff... | 1 
         host-libxcrypt-4.4.36 | 1 
    host-python-greenlet-3.1.1 | 1 
httping-0e26c53d5fe504eb720... | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                  janet-1.35.2 | 1 
             libargtable2-2.13 | 1 
               libdeflate-1.20 | 1 
                libdrm-2.4.123 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 linux-6.10.10 | 1 
            linux-fusion-9.0.3 | 1 
                 logsurfer-1.8 | 1 
                  nginx-1.26.2 | 1 
                openvpn-2.6.12 | 1 
                   perl-5.38.2 | 1 
      python-autocommand-2.2.2 | 1 
               valgrind-3.23.0 | 1 
                  whois-5.5.14 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/e66323db280e0546d40884e1a82b122ae5444435 |     
    i686     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/ac50d0481cfbe3cb166acd6061a6456781952b4c |     
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/76dfb075da3f7589e54080993d38e6bc988b2cc9 |     
    arm      |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/f398bf52991bb4eb3a603e9445757ddf0f5b89e0 |     
powerpc64le  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/ff06bce08a8d3c75c39f76d8ab64c98ff28609e6 |     
    i686     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/60b0b7a82fc5ed2d10bce17c8a4a26e4390d95d6 |     
  mips64el   |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/e038086229b678a9cfdc3da8e81981ba9459d75c |     
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0b8b06362c39925adb805bc23dfacf607ccaa00a | ORPH
   nios2     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/c71cba899a4d84591d473f298f62d81be1f8fb94 | ORPH
 aarch64_be  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/43ac85ee0a13ead32036d65270691fc7189597b4 | ORPH
 aarch64_be  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/913a2e5fd3a6a52d536ef92e8635b1eac93e122d | ORPH
   s390x     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/d48b65bf2259c64cba5bb63cc4b170fc15ce72b7 |     
    i686     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/de9cbe243302459a5fbfffac27dada2576d0feb2 |     
 microblaze  |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/6d597512575749b11d1b4c0916bac9b7dd1228ec | ORPH
    i686     |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/837f484f6e77a4791906cecf094ee8bc0527fc11 | ORPH
powerpc64le  |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/d02d5eb3d6bb1f4763f121c10ecd01b0dde789b5 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0e1836386ef2cb92d2f2d111c76b9bbd8ff77f06 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/8b4b145ff10ffe01240b2452978eae3134213fe1 |     
    i686     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/6f331be03a162108f25a30437da5932b260cddfc | ORPH
    arc      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/15e2f470ae6ba0c9c4bf40f306955aaa317bf87e |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/9ed333ddd0bd58319407f6091e9adb59a93c786d |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/c8bc1f74b25393edcf9b4d0a7771c0f5501e7651 |     
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/bdc07dffbf5efc3029ca346be98a8057d8edfd75 |     
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/3e0d246057028350046fbfada5991a0f5b7f67ef |     
   armeb     |      host-cryptopp-8.9.0       | NOK | https://autobuild.buildroot.org/results/1a073e86b4836f136ff02e067baae64203d75852 |     
    arm      |      host-cryptopp-8.9.0       | NOK | https://autobuild.buildroot.org/results/d047f8192c12be52b008c8f9cec86b341823a9c9 |     
 aarch64_be  |         host-go-1.22.7         | NOK | https://autobuild.buildroot.org/results/b271fbf54d8b51ff3e383d2c3bc241596514ab37 |     
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/767ddc36a103460af8ad9ee04277b9cf088b8854 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/682fb5835f6ddb7d5eec536c92825b27411db254 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/70880ae90ebcfea1640fa4f57b6b46d9cd8dbb4d | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5b81908869051345c5fef55f34d39c6511496f69 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/787db4ffb351b3cc7b3999425b8b8c96871b07d1 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/423b9966425d3451afccb189e6c3148a9dd84903 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a76e6214f9ef94d057aac88afcd492ee21c3cd1c | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5a5f1285e72ec655b3599e3f7dd998f5c1e459c8 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/75ed43300b002cab4db7cfd0536edb50196171de | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cd80350ad8330a158f6410dd852b329f05e515d2 | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/d21b4ff1341495d0f38ae7a0273bbafc64bab328 | ORPH
  riscv64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/bd39e3952f6adc82fe9a2d548dd0d40f47955337 |     
    or1k     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/c23716e286c992e1ce4a5495ccc5cecd6674a322 |     
  riscv64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/f7e8d0c93d9e2c2f4a0b6eb6efaf5b7b22d0bfd9 |     
    sh4a     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/992981b2af29bce49f2e61250b359fcbcc889f72 |     
   xtensa    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/c8594bdd1378aa7b3eb23f2fa248187d8c2857ab |     
   mips64    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/96b2ad1c966bf54e5c3d3cbacc9e36df5742ad9d |     
  aarch64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/28ecd233c5889dbdbd0ce712cdfe14248add2c46 |     
    or1k     |          janet-1.35.2          | NOK | https://autobuild.buildroot.org/results/25efdb432174ed5172f4cda8a3ecf44fb3d12527 |     
 powerpc64   |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/a96d7d068e0024e80580f95101e18fc86eaa0918 | ORPH
    arc      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c587132ef2b98926d3ffbecd095dba2f179c3331 |     
  riscv64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/2d9082d6e910f43e8caabcb83ce81d7284c83ca1 |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/a24bd2daeaaefb1ee144d2ade643ca3dcabcd886 |     
   armeb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/86a01691abe524952c1deffd66d4e1f5d9d86c82 |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/389eaad6890cbc1b57b5557927ec76fd2a1c735b |     
   sparc     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/0b2de40d3f20801eb1e482791be62b4779f59950 |     
  powerpc    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/5b76c88997d3d6056b8e6e61c9301364948640f2 |     
    i686     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/73d510889ba57719bd817537d58846cee221fb63 |     
  aarch64    |        libdeflate-1.20         | NOK | https://autobuild.buildroot.org/results/77e28976221c2a00ed3081fed21c21638d8c45d6 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/b77c4d6c5395149fbe1abce4f4f400d0e8f4945f |     
powerpc64le  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/d72b3a8ae391fd8c786a81217177bd1be21abf39 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/9b629e04b35c1b5c38d08ebc6d2de92ea2b33bf4 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/c228a0ad52c010b4baa79046fd3ffef60282c9c1 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0ac1432f53dee53dec1ba4b423c98bdd7456c7bf | ORPH
   armeb     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/966bb6c058ccb051d1f82e37afc761aab93800b6 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/8fbe2155f1588d88c65beec864f787dba693b0b9 | ORPH
   xtensa    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/2d2a3444f3bc43d70abb30c71b19254609a97cb3 |     
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/157d8ea385095b6894bf62d7f9151ca602c4eca7 |     
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/eb47b52ee3db3eece608db0087cba6e26b4f2e33 |     
   arceb     |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/8dbc51e46652db2d301706098dbadfd301d8da21 | ORPH
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5b5ee640c6ea13c64237b6a454c711b0eae7953b |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/8182a4db5e8d97770008f1d294fd4b44a827c738 |     
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/4a4449cce0ca9536ca38b464fc71e0b636f11b96 |     
  aarch64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/8ba1a3c30e8114a6144e59a0b2d8bf377cec99c5 |     
    m68k     |         openvpn-2.6.12         | NOK | https://autobuild.buildroot.org/results/e797ac31a73eab979fb80ba11985402cca5e07da |     
   x86_64    |          perl-5.38.2           | NOK | https://autobuild.buildroot.org/results/357dbd474e0f4be4e65c068bee295cf8380557f7 |     
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/37fa682e074d6650d666f8d8817fd760b76989fe | ORPH
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/e67a233b1b924cdfce8ef2660bc1c6d79077f343 | ORPH
    sh4      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3a593279763b4dc9a5fa982190022a984489717a | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/46c7a0c3c7049db6abdbec089a29d7d922560310 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0164c0f9562f782145f585b42955e75dfe4ad419 | ORPH
    mips     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/60394acd0ce75e652e1e217d59760edefac14771 | ORPH
   mipsel    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/31042434cd059ead252068b45465e5fe81cd939f |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/d0e41af7cf134fb19c6208f175c848092a81cbe8 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/f3ee12df493b6646e8a486d58847c3301f62f74f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ace3aca9d047ba83de96eb026c5a0c7b2d791d20 |     
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/a0ad093a6a3be178f8f2755923b700480c913829 | ORPH
  mips64el   |          whois-5.5.14          | NOK | https://autobuild.buildroot.org/results/23cb312dd42fa40c31628dc41a5c521163cec07a |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                acpitool-0.5.1 | 1 
           babeld-babeld-1.9.2 | 1 
                busybox-1.36.1 | 1 
                     frr-8.5.4 | 1 
         gobject-introspection | 1 
        host-python-lxml-5.1.0 | 1 
                libressl-3.8.4 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/ee6e1a50a2c079901c68a56163797affe3e2831c |     
   armeb     |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/343856770ae34ccb31fb8303bda85f338b57945e |     
  riscv32    |         busybox-1.36.1         | NOK | https://autobuild.buildroot.org/results/91d2e5d37f315f97939c2165caec4d2fcf65aba7 | ORPH
   xtensa    |           frr-8.5.4            | NOK | https://autobuild.buildroot.org/results/b52eb061dd471daf5405d62fd3cadc685bbf9533 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/213bbf76c911ba9e8cd375947337d5a454bf10ba |     
   sparc     |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/4f7d94e89afcbeb2f38153ee5c40d879c4fc6fe7 |     
  mips64el   |         libressl-3.8.4         | NOK | https://autobuild.buildroot.org/results/1c1b0635dab7ff7a43cbe83f1df9b87ca67b6a2d | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  ffmpeg-6.1.2 | 2 
                   foot-1.16.2 | 2 
                    bcc-0.29.1 | 1 
                beecrypt-4.2.1 | 1 
                 coreutils-9.3 | 1 
                     exim-4.98 | 1 
            gdk-pixbuf-2.42.10 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
            host-fakeroot-1.34 | 1 
                host-go-1.22.5 | 1 
host-go-bootstrap-stage2-1.... | 1 
         host-libxcrypt-4.4.36 | 1 
          libcamera-apps-1.2.1 | 1 
                  libsepol-3.6 | 1 
                  ntp-4.2.8p18 | 1 
                 openssh-9.7p1 | 1 
               pciutils-3.10.0 | 1 
                     php-8.3.9 | 1 
         python-remi-2022.7.27 | 1 
            qbee-agent-2024.09 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           bcc-0.29.1           | NOK | https://autobuild.buildroot.org/results/1ecaf3e62c01d19945fe3e758dcf77337daa16c0 |     
   nios2     |         beecrypt-4.2.1         | NOK | https://autobuild.buildroot.org/results/c9f16051b66ac3080a291ed6862f656b4a264896 |     
    or1k     |         coreutils-9.3          | NOK | https://autobuild.buildroot.org/results/1c6f900ebb9f62d3763bbe0c3d59265ea58e86e3 | ORPH
    arm      |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/de0386371dd67214b23ccee4b9eb36e01a0ca632 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f3f6b085276982e59c6f8644287daa0fed7e99a1 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0ed996463c28c70a51f77a9b352f476fb4d0dbb8 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/dfe0928061a13ab359081a974d988e60a707b619 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/b01fcc7a3fb8765bfe59981d50789dd801d31ef4 |     
   mipsel    |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/8a73c4105729fb8146b0074f07a5b1a618a04963 | ORPH
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/cd9fa8b4f1aced399440b680d9f08a49491e5cb5 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/be88843fa836f3695e9fa9f91373e1118e97dbc5 | ORPH
 powerpc64   |       host-fakeroot-1.34       | NOK | https://autobuild.buildroot.org/results/e55605a6a0c008cba2cf4a77f9c9f2eda99f9824 | ORPH
  mips64el   |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/ef5a60a634f99c15268d48d4fe5a7e17236d5ac3 |     
   mips64    | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/7da2386f6e101a4297f0f4942addebbb9234ff5f |     
    i686     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/647eee4478fc34a56490f2d68af68cf6ab2ad6af |     
 aarch64_be  |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/27c88fbf3d0af8498b3533ddb901778fd553f5ef |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/4cea8aeffdfde61a559efe538c4be283f481646c |     
    arm      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/7c3e15062086645e63aa8c1db24872ffa0ea6cb1 |     
powerpc64le  |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/b32fc0ceaba3536c3f33f15382c216ccc170502b | ORPH
    mips     |        pciutils-3.10.0         | NOK | https://autobuild.buildroot.org/results/ce303408f6dc6155f166cbae8b53839155888fa1 |     
   sh4aeb    |           php-8.3.9            | NOK | https://autobuild.buildroot.org/results/09a08e3cf0b63d1c51b00f863a93e082d54dad49 |     
 aarch64_be  |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/09cb7b0b1a15a7ffd8e71e3148cffdca73de5bbe |     
    arm      |       qbee-agent-2024.09       | NOK | https://autobuild.buildroot.org/results/8097d48bb715a2de0986998707f29b66b80e9bc9 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

              host-runc-1.1.12 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                  linux-6.10.9 | 1 
      python-autocommand-2.2.2 | 1 
                       unknown | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-runc-1.1.12        | NOK | https://autobuild.buildroot.org/results/b9a62906a0bacb04165030c3987b0495f073b250 |     
   armeb     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/3cd524c73dd4a7bf82e03b9039d19c88b37b6eb5 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/e398f3892cef787ee4fa76f5dab471f4d8f0d5d9 | ORPH
    mips     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/dc4e214ae65c71a63d27780bbf1d287f6fd3e702 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/11198b063a80c84a59af2fcdb17eeeae48c073e8 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
