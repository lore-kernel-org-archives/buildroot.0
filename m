Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D3EC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 03:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7764841B68;
	Fri,  3 Jul 2026 03:27:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXWEdszF-c1I; Fri,  3 Jul 2026 03:27:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 563DC41B64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783049225;
	bh=9CrgR/F1yHlHwxAVvv2DK77rdMucdWbz/K3exps+2b4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PF7v2+tmblu1K6bl2nH2LsyQtiSPCe0H3+9RS3+OILqmBKp2u4yeSQBbsAMt/Kse8
	 5McN1FcIUqcMBhiHanvJDmFw6HEHBzqnOYmqxMcoc4AAwEpAn8F30UVmjnPUzkQgUE
	 YnOUwmybpgJM/IvP/QDZL/SUgx84D/ANQpIv85fAYXDUab9U4IMKC1QP1dGQrUD+Ee
	 cT7bLMc5zT4zivUgV+lE7NHgmaEOWLS4Sy62kkQDjW0q5u70enkuFnmAG4qlmP1XS3
	 abGm0O56OWiOWlk8WUk3a9lRKGr28kmlVeO1h8ts3+FdUIIPmSETQl6MFM7Qqv5mQU
	 aTJ6+WerhvCRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 563DC41B64;
	Fri,  3 Jul 2026 03:27:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 694CB363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 03:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD30881A16
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 03:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRQ-z4MRbhM9 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 03:27:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 21C6E80DC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21C6E80DC2
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21C6E80DC2
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 03:27:00 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so186725e9.3
 for <buildroot@buildroot.org>; Thu, 02 Jul 2026 20:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783049219; x=1783654019;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dG0RvSzyRM9PPNIbOks6k9JMROOhiuU7hNWDVFER0u0=;
 b=TH9uQNWU9zw1dTOOWc9/Z6F/ccpv5MCv1Z9DIBCFeohJhT7QrPIkcwzZilqa2zRlDR
 MfrFoMKdMk62/yrnQDeE9tBebosrAxpJ/hxj5HyJF8Sfx9Y+7tmQAAAp+JHMYM+l1tM6
 /9o9Xko+QrPPjZQlNNkdKCmaooqj1QVlsVoVZr+eL/JyZoBiuBC6EmTiv33bVcEU2ts9
 GSN2Jz1cYtmlh4BEio9CXVCiLfdAkZfuJMxKPjY7qbOXGjZ4YMxuWlLg2mtUIN3JiD8B
 uUkAbULr55crXkn+rwoQDV5cZ69SpzzSUwSB83GkcKsYkXIVeBv/LFSqC/BcJgLP5Mfs
 lvtg==
X-Gm-Message-State: AOJu0Yy4h/UdwwXumsg5r0Mk7nKeiKr5MdPu9pZlvQii07lrjvVv5J3i
 xboJkf7rN5Kg2dttd1L6c7hDgjc275xcTxbo6hFYxvbz8a7xm3IQ9eCGzauW2u5i
X-Gm-Gg: AfdE7cnLbYUtA2Cf4aZpR57wF1q/OwLiC/VF2yVniTAr9PtCGsScbnB/48sYTdMR6ec
 Z+8eAta+/clriG5LqatmOF45hjBsitZNXNG7jEkS4wJUtJG6cLB/0JSq8qKYtWdqRurx+fnp6gk
 HMtt1E5TTke0lYbVfgdNGc9nsxWaSo063Lq4r8nhnYwSgm6MEx6CYWWjAb+M0vznkIDKJhSBFmM
 shM8U2YCvGU2IMBTggXKRHpnYzvh0wkAAHJEJU5Hf4pFXRf/PjopVpoOcgo8xSWcXmomxUhsCjV
 zMeUFKxyI2uCDqOz4gMjUwDjEmSl16hzTjAJmhZoURfGlB1sheuf5RZINCC7dkT2FgyDvuOXpBf
 hUZWUa0aIcXEJbKorQbERCFMIWtDUxnLzjG8RBN3hle4RKc70ObdDNgrF7Bo9Xbqik0H15j0M1+
 /p+ZV6+eigc2a+uRg=
X-Received: by 2002:a05:600c:8b6a:b0:493:cc25:85c4 with SMTP id
 5b1f17b1804b1-493cc2588a7mr8446495e9.8.1783049218059; 
 Thu, 02 Jul 2026 20:26:58 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493ccdab27dsm12530065e9.4.2026.07.02.20.26.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 20:26:57 -0700 (PDT)
Message-ID: <6a472c01.c5b9c171.1c5f2.6326@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 03 Jul 2026 03:26:57 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783049219; x=1783654019; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=dG0RvSzyRM9PPNIbOks6k9JMROOhiuU7hNWDVFER0u0=;
 b=OT7uXwlpG4cdZWiPJT9S7mwqltHITWcMUJTYDWrwc19rqzwjuIlEjwmZwqip3N1Ct6
 GB4xS6FZngyaBXXRIIMJ8PfOP3PPacl5FKDeYKhq3mpf6nJPO3Fq/zLfFV8MK+RTf4zg
 mcUv8766sdI9MvHRKdlRFcMi61eeytYK07eul/AVOoxRQjNQ+sDg6D6M8Bn+XuKdDB2j
 nlwKL+TJs5ameFGd6rJEGY2FkajxQ5TelZqvEV4CdSNwUPsqI0lLHjrkgdI9QY+W7dFh
 W9BPiGdOR7txw5W5F/wQPolrK6BfGBiYneCg7dEv9Ncg3LFhe+0aAALv6aJiOCVo9dgB
 NBRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=OT7uXwlp
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-02
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

Autobuild statistics for 2026-07-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  | 10  |  0  | 11  |
  2026.02.x  |  1  |  3  |  0  |  4  |
  2026.05.x  |  2  |  0  |  0  |  2  |
    master   | 36  | 259 |  0  | 295 |

Classification of failures by reason for master
-----------------------------------------------

                 host-tar-1.35 | 36
               host-dracut-110 | 13
host-gobject-introspection-... | 11
        linux-headers-5.15.210 | 11
         linux-headers-6.6.143 | 8 
         linux-headers-6.12.94 | 7 
     bluez5_utils-headers-5.86 | 6 
                       unknown | 6 
host-vboot-utils-7dfa482d6a... | 5 
        linux-headers-5.10.259 | 5 
         linux-headers-6.18.37 | 5 
           linux-headers-7.1.2 | 5 
            18xx-ti-utils-R8.8 | 4 
             dahdi-linux-3.3.0 | 4 
          host-binutils-2.45.1 | 4 
         linux-headers-6.1.176 | 4 
                    ccid-1.5.2 | 3 
                  ffmpeg-6.1.5 | 3 
                 gnupg2-2.5.20 | 3 
              host-pahole-1.28 | 3 
                   perl-5.42.2 | 3 
am33x-cm3-fb484c5e54f2e31cf... | 2 
                  bcusdk-0.0.5 | 2 
           crucible-2025.05.28 | 2 
        edk2-edk2-stable202602 | 2 
                enscript-1.6.6 | 2 
                   gvfs-1.57.2 | 2 
            host-binutils-2.44 | 2 
    host-gcc-bare-metal-16.1.0 | 2 
       host-gcc-initial-15.3.0 | 2 
    host-mender-artifact-4.2.0 | 2 
                host-odb-2.4.0 | 2 
              host-rust-1.96.0 | 2 
               linux-pam-1.7.2 | 2 
                  ntp-4.2.8p18 | 2 
                    olsr-0.9.8 | 2 
   openvmtools-11.3.5-18557794 | 2 
               tcf-agent-1.8.0 | 2 
                     apr-1.7.6 | 1 
                   bird-2.15.1 | 1 
      ca-certificates-20260223 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                   dante-1.4.4 | 1 
                   dbus-1.16.2 | 1 
docker-credential-acr-env-0... | 1 
 docker-credential-gcr-v2.1.30 | 1 
                easydbus-0.1.0 | 1 
                   expat-2.8.2 | 1 
                      fio-3.42 | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.43-27-g4070d808bea1... | 1 
  gobject-introspection-1.84.0 | 1 
               gocryptfs-2.3.2 | 1 
           heirloom-mailx-12.5 | 1 
host-am335x-pru-package-5f3... | 1 
            host-autoconf-2.73 | 1 
          host-binutils-2.46.1 | 1 
         host-btrfs-progs-6.10 | 1 
       host-gcc-initial-16.1.0 | 1 
            host-go-src-1.26.3 | 1 
host-google-breakpad-f49c2f... | 1 
              host-guile-3.0.9 | 1 
          host-intltool-0.51.0 | 1 
       host-nodejs-src-22.22.0 | 1 
                host-wine-11.0 | 1 
          host-xfsprogs-6.19.0 | 1 
                 i2c-tools-4.4 | 1 
                   i2pd-2.59.0 | 1 
                 ifenslave-2.9 | 1 
                  iozone-3.508 | 1 
                       iw-6.17 | 1 
                     kmod-34.2 | 1 
     kvm-unit-tests-2025-06-05 | 1 
libcamera-apps-v1.7.0-10-ge... | 1 
libfutils-c326ce0cc2a735438... | 1 
                 libiconv-1.19 | 1 
                 libjcat-0.2.3 | 1 
                libmad-0.15.1b | 1 
           libmicrohttpd-1.0.5 | 1 
               libsigsegv-2.14 | 1 
               libxmlrpc-r3335 | 1 
                 libzlib-1.3.2 | 1 
                   linux-7.1.2 | 1 
        ltp-testsuite-20260529 | 1 
          lttng-modules-2.14.3 | 1 
                    lua-ev-1.5 | 1 
          lua-lunix-20220331-1 | 1 
            minizip-zlib-1.3.1 | 1 
                     mtd-2.3.1 | 1 
                 nettle-3.10.2 | 1 
            nodejs-src-22.22.0 | 1 
               openblas-0.3.33 | 1 
                opencv4-4.13.0 | 1 
                openssh-10.3p1 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
               pcsc-lite-2.1.0 | 1 
               pulseaudio-17.0 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
        riemann-c-client-2.2.2 | 1 
                 rtptools-1.22 | 1 
                 s6-rc-0.5.5.0 | 1 
                  stunnel-5.78 | 1 
                 systemd-258.7 | 1 
                    szip-2.1.1 | 1 
           uboot-tools-2026.04 | 1 
                 uclibc-1.0.58 | 1 
uhttpd-15346de8d3ba42200249... | 1 
ulog-0389d243352255f6182326... | 1 
                     unzip-6.0 | 1 
            vorbis-tools-1.4.3 | 1 
                    which-2.23 | 1 
                wtfutil-0.47.1 | 1 
                     zix-0.8.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/d84f98457b725f070257025fa091e1a2935993ff |     
    arm      |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/81b7835928128977be5df9bcce296856bb6d4b5f |     
   x86_64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/4b3d081ad8fd22a6be29ea71c2c97e3c85598ee2 |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/45fb74c639902230cb8e770a281261b07fe4e9bf |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/0a60aa71f741622400bbdebd9092449124d5ad08 | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/00518818f1f2efea47cf26ecd0f7797cfbd297cc | ORPH
  mips64el   |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/81b43f070f079ea8cc0f74ee9f38f78003f42ee0 |     
   sparc     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/db65de7f91f61ba618c0ed2e931a364b57774c15 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/fb42c26bc4e877f938d10d92685d8069010798fd |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/6e994f13d680daa26948aa07100038efec7409a0 |     
    i686     |   bluez5_utils-headers-5.86    | NOK | https://autobuild.buildroot.org/results/ccec0dc5231f4015131438e17b5efb07c57bf002 |     
powerpc64le  |   bluez5_utils-headers-5.86    | NOK | https://autobuild.buildroot.org/results/d2a6e8223c98716ff4a97961bb1851adfad3dac7 |     
    i686     |   bluez5_utils-headers-5.86    | NOK | https://autobuild.buildroot.org/results/ff3e099e03ae36f7cd2f488a5b69df480a8fa44d |     
powerpc64le  |   bluez5_utils-headers-5.86    | NOK | https://autobuild.buildroot.org/results/e5727bf3515d30b57943bc6d3e39496ac70887d3 |     
  aarch64    |   bluez5_utils-headers-5.86    | NOK | https://autobuild.buildroot.org/results/84218195d709e7f576d6fb6912b601455d76b592 |     
    i686     |   bluez5_utils-headers-5.86    | NOK | https://autobuild.buildroot.org/results/763588bed111823d644b82929512e00d561af447 |     
  aarch64    |    ca-certificates-20260223    | NOK | https://autobuild.buildroot.org/results/1e199e08ddb34273cb12e759f35dc79711cd1641 |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/c5c928d825454435e08a46132e2f66b57fe757c1 | ORPH
   s390x     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/debf9027c6fddac3e195e387cb05838d7160cf1f | ORPH
powerpc64le  |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/84acf2eed82db3c415b7c958796c42dc908c0b80 | ORPH
  aarch64    | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/0239760210f233a61e071f3244d95f43f3c79616 |     
    i686     |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/9e25614703c41c02673191e5ab3dbeb278fda1cc |     
    i686     |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/ea90b0c2c73f4edc8ccc1a7b01a94abac4048b9e |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f2096bda3a468f9ffc3fcd4b35bf76972e5a0efd | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0b062e381879e6c84d38330ff6564adda7039226 | ORPH
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c1ff04f90c0b209d579fe791a0997c33222fde66 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d204e8170b68be68e613f70c9eeb4fdf96fedfe5 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/43baf7e855824763e0c84338600c0deed2d0957d | ORPH
   sparc     |          dbus-1.16.2           | NOK | https://autobuild.buildroot.org/results/2e2635b23ce5cf18321bff00a6c007eb2afc8ed6 | ORPH
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/bab6205f4907530d74b486a4d1f38e2a4e4a6305 | ORPH
    i686     | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/a815c8ced7ae9be654877793d02542d6cc7d831c | ORPH
  mips64el   |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/b9388e56ca189851ecac3e5e39a94a6939e5ab47 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/b693631b583a46fea9d11485cf5b4983594d2d5b |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/457bd4afa0f493d3c701d91e9f3796460658feb3 |     
powerpc64le  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/ce130d71d3b36f20f84a654b461da970a224c661 | ORPH
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/c83dbecaed3f6bc3e2a39c99c3b04355b4d0c609 | ORPH
powerpc64le  |          expat-2.8.2           | NOK | https://autobuild.buildroot.org/results/f70df0b54fb01b368c35d66fce34abdcf9389186 |     
   sh4aeb    |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/33b2331c102b63e2d05238fe1d31c7607c7579ea |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/9c5462ee332692e85d4cdacb2b82bbe23039a161 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/5e6837684dcc5ef0cba5cff3e6c55ed389ae6036 |     
    i686     |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/65e1099eccdf09824c22cccded561de016e76c39 |     
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/00095b9ed78b42f352d740e174551937dcb3b785 | ORPH
   mipsel    | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/76b6e12e9289117ec8824019adaaae8ec8f7e638 |     
  riscv64    |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/b9b97bbc8999c643b00753f8279255744bc5a78a |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/1e89b4342e3f33a0b3c6ece93d79a44ee064848f |     
  riscv64    |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/298f7144994f7f8707e84667129010e1b72ee45a |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/2fd3776f31b4f7485695779dd37aa11a9fafa13e | ORPH
    arm      |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/33a48a798be401805c67b811e82c23a31c5565c2 |     
 aarch64_be  |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/6f756ad3fc076a684410504548b1749cabd67e6c | ORPH
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/e6a7e1fed5b4479e7afdaed6e6132e99e452e4bc | ORPH
    i686     |      heirloom-mailx-12.5       | NOK | https://autobuild.buildroot.org/results/7e0feba50584f2a460ac5652ba1a23f6d425494c |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/e5324fc0641a7e7674732e5046835225af33eb76 |     
    i686     |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/6374e5d30322e28d6c569917e36491afff72d505 | ORPH
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/51fd0700a92d7ed39aa6e9db690f06d7a706c0a0 |     
   x86_64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/75f163f67aff4097d1765145b4bbcc84c7a15f63 |     
  riscv64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/92350b3df73804146f545b1ef3a1384552bcbad5 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/ca524b87f6222466df0faf1a3abb68b3d83b0ad8 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/1cd075dc6d5a7078f1f1d6ea9e0bf1a0b64d0827 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/f9544b75e4008faa5303a6e4a6689b3d467159b6 |     
    i686     |      host-binutils-2.46.1      | NOK | https://autobuild.buildroot.org/results/def46625d1fd090ab1e208db8bd25ceb8cca6e4d |     
  aarch64    |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/997b6b05075e141c48cb0dd1d21f314af7fc5f88 | ORPH
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/8e9aa974e290b8e117d646f9ff6fb74a41621c55 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/a053e27fe4fa556971b5a6e3912ab031ea3f10b6 |     
  aarch64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/297b8b4bffd97b01858e49b273103ce2db4dd794 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/0c98f60bd64648a3fb2cb404dccffd375f27644f |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/881b95763d5df560ad8eee7a9dc7a7439694865b |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/30c486c968fbdad3749b1add729bfff8cebd05e5 |     
  aarch64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/57f682d5b7313a37f2dc2bf80654c86640bfe1e6 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/c1a0b177fe2315caab607cd90ee7f1ea15d70842 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/b363b974fb276386e2e38ed87f2234807c317720 |     
  riscv64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/fecf3e44fc66ef2473c95f8d757dddaf8288788c |     
    arm      |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/7f6ba33d7f4293ff26adf71bf507f93db022a99c |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/ceb295d69af678c8923ea70327e795fdc7fb7bb6 |     
    i586     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/956af3419559de80e8fc511fc312401e63b02050 |     
  mips64el   |   host-gcc-bare-metal-16.1.0   | NOK | https://autobuild.buildroot.org/results/b305f0a26ab61daee72361ea1317588287ac321d |     
    i686     |   host-gcc-bare-metal-16.1.0   | NOK | https://autobuild.buildroot.org/results/65cd63506bbff80fe352bb74267c0dc0352fa5d0 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/5014fd0103701af78de3edca996b1ef667d82cb7 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/d826846f995c71b5827d66e31efde9bfd0776925 |     
    i586     |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/ef1e0d4e83e25e551a01f3c5a4032e0b57f688da |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/5be09dbe268916dde8c76d1fd4c8fc41f426768b |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/09e268c02f3d918e5647eb8b51e0628bc9a3bedd | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/493ef7abcf0a9a3e370772199c0c7072e450a11e | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/34a8eda14b749d60f48c680c175797d61fc410de | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/12e87c4e5f32ab1dfdad056d1db470647e4add39 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ff7ec35444854986712bed68004b923123fb83ab | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3245e811eaeb0a10e14b1100f3775b4f665073f6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a15e12ebda228b379e8c21e9a30162a4ce1c8795 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/73a37b4b1f8a7b2e22fc34060b134aee166b7565 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a0249df2ab8689581a339d56512c0c98c8e9c0f9 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/56edfdc47678bced365b4abe022730d043c51e5a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5a98f65aa4a95e58f6ea9775f2afd700178c6456 | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/65c0ba7576f370ddcab4a97cd4be8a8850a2cfdd |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/fb136637b2b3a4a497334417364f80de4b89b4bd |     
    i686     |      host-intltool-0.51.0      | NOK | https://autobuild.buildroot.org/results/d451a65a1875c2f5cc9129fc29333ae1ab272912 |     
    i586     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/f15f6407caf356425b16466e6db37f5a91116788 |     
    i686     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/709844ce56de33bbc374ed0c7c07ffb7e5023ce8 |     
    i686     |    host-nodejs-src-22.22.0     | NOK | https://autobuild.buildroot.org/results/da2e344d213bba3a98b3d4a0b4635c13fc8972d1 |     
    i586     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/fc8046cbc9d61849a0e2447870d1ff8b1877b957 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/8b6a7d44c31b92bf3d65d9ffe13c163e7c93e334 | ORPH
  aarch64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/62e1f19b1bea55ad096dc0148d7ca9430109d76e |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/ebf8370f80cd452af7d4d0c06c778538a029ec03 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/85d786fb9f5eb001531af83dcb02e921ae620f6f |     
  riscv64    |        host-rust-1.96.0        | NOK | https://autobuild.buildroot.org/results/e52745426a82f3f3cfd5113c799f135bfd8d1c8b |     
   x86_64    |        host-rust-1.96.0        | NOK | https://autobuild.buildroot.org/results/7718764e3e5813628ecceba7c6d7860fab411dec |     
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/cd144414769a156eac506ea206f35e9d947cb0c8 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8f8ca40514530adcd39eabcc5c0b7e6eef5ba493 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b704fc9bb4758697433381d24215075d052d4e69 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2341a223765a88e6319383ca2adb63d012f5e5f8 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f8608a87fb5ff8a6f35c5d846aba609692c2d665 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/335f7eb7c505a02800c44fddd492bd8043d1e070 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ac8adf99d3e0140d2175951f0afc8f5a524a600c | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/52320cdb28683d4573a8189e15e8e2369f23807a | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/027ca4c2755643fd4a6dc4a801ef33fda07d48a8 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e2468577cbd9e251a726aa61a3c8919553416de6 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d486f366e5fe51b2b47c99b8b2aaa09a6e875a01 | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3a6b76fb0c03d983aed37a43bb7048dd37fed706 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/780d2c2a33b1a4d0b0bdbea3ece2b8c674599816 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d271d74e7ee0a88b3505adaac781e43054265016 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/96adcb3288b6c84f8da0740e4d694a6aa5177439 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/10302b9ba59736a766118a46aa48cd2c4d4ef651 | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/63809d17302157146d81a547d736cb849bb81b92 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b2c1e556c2ccb531350e9414df79686adc6fe86c | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/fdbb87c0283833e14f81ad0a2c66473ebbed2c9c | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/744f82be19f36915e87a731c1cf2020ba749d0bc | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0d55d1811030aa4b5c9ea45e560369852e1809cf | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a4c083a1b8e6a7c3b9b0b6b74e6bf0f14a3d2063 | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/60900ad617900c71a286620279a9da4bc12dff85 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/aafe62539f0abb64820ba8a444994f66749a33df | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a322e2511ac5c7a97aacb84e6fd0ba88350429be | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6cf4a5a447b1ba44ada1e8b96deb39a57d581580 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ce899e8009fa374f40f0c2adffe4e2a17d90234f | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2dd171daf1277e28e576953793f1ed0c4b174720 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/78d8c7405b85f3c48f5645a177a288234cf08354 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c823c068148bd970d0cd1f8618f18b5d8dd7019f | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a75291d621b5ede5f186fde50cdefdf109ca6924 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/bfc5275eca3b1f3fe561eb81748facfdad96ab00 | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5ccbaefbd9d08d7af5775479ea6f81101a7a6423 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a53927617f0e7701bedbb9e9440dcaaba90bc650 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b9dcae9b44d806f2a8cc6b2db552952e7e3093c7 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/78043137c7b7d409f11bcb6f8afc554b507e520b | ORPH
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/3e3a1750c274dbd29dca9813237a7f2406b5895a |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/0226afba1e3cf902d5368f9261bef56f21844155 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/81b77f80e6f6b6ffef23c5db90f966d564f54062 |     
  riscv64    | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/e6e21728628a49faee5b74258629b98ffd7d6719 |     
    i586     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/c12ac740801211794c73e04586cf5ef78958571f |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/0ae6a5e9b72470e39b1228c01042949bb4719b91 |     
    arm      |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/fc1ad7d8aa60434dbfb3f47f7d479a49c057ab68 | ORPH
    i686     |         i2c-tools-4.4          | NOK | https://autobuild.buildroot.org/results/e282ec77d7b8adf5b16e0046f78a82d4e7ce8e3e |     
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/c8b8f11f4ee3ae54eb284c2d5d28c45d2172a035 |     
  mips64el   |         ifenslave-2.9          | NOK | https://autobuild.buildroot.org/results/4bbe198e8976e4a502f2d6c8cb817d40cd4162d3 | ORPH
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/789a63523134626836499f193c35f53b7e707eda |     
    i686     |            iw-6.17             | NOK | https://autobuild.buildroot.org/results/ec7f97f394dd72b9f89918aa1ea48115618b9bf8 | ORPH
  mips64el   |           kmod-34.2            | NOK | https://autobuild.buildroot.org/results/e38afc08aeeddd45bf5c72300157bf5d4728d926 |     
 powerpc64   |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/ae402940fe10ad6bdd5b60f9e49589073d174d99 |     
    i686     | libcamera-apps-v1.7.0-10-ge... | NOK | https://autobuild.buildroot.org/results/739f6757395cd2a48dd0431bd82b5871d91a4ffa |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/26b6d38cb3457ce4e47dc6f8814bac37fc6691ef |     
    i686     |         libiconv-1.19          | NOK | https://autobuild.buildroot.org/results/fbbee606612c42267ceab00484cf5e3d90ba7bbc | ORPH
powerpc64le  |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/fe0a8634f30d0be0bbf0d5fb6fd14e661f46c6d4 |     
    i686     |         libmad-0.15.1b         | NOK | https://autobuild.buildroot.org/results/5dc48c4e9ba682f3a507e7fe9c8bf5ff09136e55 | ORPH
    i686     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/ee38558a69598eb5ef94cbf3fde5adeb2c72d281 |     
    i686     |        libsigsegv-2.14         | NOK | https://autobuild.buildroot.org/results/d19c829e9b4187b20b532e67875f8b2e3330eec6 |     
    i686     |        libxmlrpc-r3335         | NOK | https://autobuild.buildroot.org/results/5719bb7f5bd709cebc8012341c0b448a8fec3aba |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/aa10d352c143630517a549c5fb5385ffdd171ae6 | ORPH
    i686     |          linux-7.1.2           | NOK | https://autobuild.buildroot.org/results/2436bab8af3f26aeec6d7cbe985acb3f4b9d1abb | ORPH
    i686     |     linux-headers-5.10.259     | NOK | https://autobuild.buildroot.org/results/d0abd54cdfca316c95e61c2ffe46127bf082d60b | ORPH
  riscv64    |     linux-headers-5.10.259     | NOK | https://autobuild.buildroot.org/results/c3add2bcb40135ae781557344ff8dda7d6e41584 | ORPH
    i686     |     linux-headers-5.10.259     | NOK | https://autobuild.buildroot.org/results/5f46b003e89a1275457446e3db9f4ae89e081df1 | ORPH
    i686     |     linux-headers-5.10.259     | NOK | https://autobuild.buildroot.org/results/c2cbbeb74b45ad345bf95d6695bf6a88d845dff3 | ORPH
    arc      |     linux-headers-5.10.259     | NOK | https://autobuild.buildroot.org/results/f57bda47c83ffd5640e1daf4ac7bcb573e3958a4 | ORPH
    i686     |     linux-headers-5.15.210     | NOK | https://autobuild.buildroot.org/results/d7a18f569c6269c350d0038d8697794d9250733c | ORPH
    i686     |     linux-headers-5.15.210     | NOK | https://autobuild.buildroot.org/results/dfcdeed9135f9dcc101becf37d0b247594949b05 | ORPH
  riscv64    |     linux-headers-5.15.210     | NOK | https://autobuild.buildroot.org/results/b2bb65977358bf6e7738eef3d7235f951fd5b14c | ORPH
    i686     |     linux-headers-5.15.210     | NOK | https://autobuild.buildroot.org/results/49d7df42fae44f9f5de3a2a51b81d2065b7e7dbe | ORPH
    i686     |     linux-headers-5.15.210     | NOK | https://autobuild.buildroot.org/results/4ced1457537d097e627d46f5c018550cc8c0b39c | ORPH
    arm      |     linux-headers-5.15.210     | NOK | https://autobuild.buildroot.org/results/0753e03e74746f99c16ad74e91549450d59e675d | ORPH
    i686     |     linux-headers-5.15.210     | NOK | https://autobuild.buildroot.org/results/0249c92bfad05f6c82dcd4e3f2cce1587237a98b | ORPH
    i686     |     linux-headers-5.15.210     | NOK | https://autobuild.buildroot.org/results/45c5510ce1141a9d2962ee6a185ee66ce9e66da5 | ORPH
    i686     |     linux-headers-5.15.210     | NOK | https://autobuild.buildroot.org/results/50998ded2588a2a11fdb9a3da351ef6ed2647277 | ORPH
    i686     |     linux-headers-5.15.210     | NOK | https://autobuild.buildroot.org/results/01a60e4f649866be5e67ba91f1f1462843bc60c9 | ORPH
    i686     |     linux-headers-5.15.210     | NOK | https://autobuild.buildroot.org/results/f1eef013b4bd414961c94ae6d407d53df7745420 | ORPH
  mips64el   |     linux-headers-6.1.176      | NOK | https://autobuild.buildroot.org/results/4bd57549ea70169afe17ee97efce45bb0bae286e | ORPH
    i686     |     linux-headers-6.1.176      | NOK | https://autobuild.buildroot.org/results/c9498c51ed212d84572b7c469699ae810aaaa4e9 | ORPH
    i686     |     linux-headers-6.1.176      | NOK | https://autobuild.buildroot.org/results/9b9e803e0628558c91aad5cfe168318746540eee | ORPH
    i686     |     linux-headers-6.1.176      | NOK | https://autobuild.buildroot.org/results/e48f9131fc79cb6f5abacb7c3b97da9fc579bd74 | ORPH
    i686     |     linux-headers-6.12.94      | NOK | https://autobuild.buildroot.org/results/53f705c264939a3c8325effffdc0b4cf5e8b8193 | ORPH
    i686     |     linux-headers-6.12.94      | NOK | https://autobuild.buildroot.org/results/aea066f8487d338516d6847e2d10b65536307a3d | ORPH
  aarch64    |     linux-headers-6.12.94      | NOK | https://autobuild.buildroot.org/results/326b3e9286f655d10fa6c0df75fc193f09981ff0 | ORPH
    i686     |     linux-headers-6.12.94      | NOK | https://autobuild.buildroot.org/results/5235d9e886e74a192b7783b243efa460baeb3c8a | ORPH
    i686     |     linux-headers-6.12.94      | NOK | https://autobuild.buildroot.org/results/32dc58d99578b7e8ce68496d2fd72753ee41da43 | ORPH
    i686     |     linux-headers-6.12.94      | NOK | https://autobuild.buildroot.org/results/e05c63a9dc01a2ef270f7f8b6c408a9892962c5c | ORPH
    i686     |     linux-headers-6.12.94      | NOK | https://autobuild.buildroot.org/results/639dd302c85589342c4ceed6bc0a6853689cf7cc | ORPH
    arm      |     linux-headers-6.18.37      | NOK | https://autobuild.buildroot.org/results/3a26fc84d36b94c74143e02f8871958d0bbf43a5 | ORPH
   xtensa    |     linux-headers-6.18.37      | NOK | https://autobuild.buildroot.org/results/e576dffb7762d9bb6287e224b0913308c9e12f15 | ORPH
    i686     |     linux-headers-6.18.37      | NOK | https://autobuild.buildroot.org/results/55dd10423485ba4ad63ef53af6e9fc33f196de69 | ORPH
    arm      |     linux-headers-6.18.37      | NOK | https://autobuild.buildroot.org/results/b5d4ef73494f19dd7c0795102a7d0795dd87c219 | ORPH
    i686     |     linux-headers-6.18.37      | NOK | https://autobuild.buildroot.org/results/79f7f0a6fd4bffbea45d37a1f7e897f85b56b15d | ORPH
    arm      |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/18a5b941a73915298c2fe7ddd2c65cfe10c357cc | ORPH
    i686     |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/0d112fbe0e7610c36231ab64ce5d802e8f2b8222 | ORPH
    i686     |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/caa27044ea1f3dfc70f5f4d0a20fb972528e5cf2 | ORPH
    i686     |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/93e3b6fc942ab12427b2d6cce2ca8e1c6a206f37 | ORPH
    i686     |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/93eb628dd7dfc65d47cadd4bdcbe5bc4ec3778c0 | ORPH
    i686     |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/f7afc7dcbbc4d847abd57cb38e07ef59ecae017c | ORPH
    i686     |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/3c56dee896b96ed9443cfe0eb0ff663279a41da7 | ORPH
  mips64el   |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/3811852e5d7dfc9d61fcf1af558badc9ae8272d8 | ORPH
    i686     |      linux-headers-7.1.2       | NOK | https://autobuild.buildroot.org/results/47e1fbc7abf68e33c54d5fd7fdf70c118a09b034 | ORPH
    i686     |      linux-headers-7.1.2       | NOK | https://autobuild.buildroot.org/results/70c42d296b64fa5166eec0ed903c3fe7c53af7fd | ORPH
    i686     |      linux-headers-7.1.2       | NOK | https://autobuild.buildroot.org/results/b00e0b59729acdbc3353d9a7b0c62860fe647666 | ORPH
  mips64el   |      linux-headers-7.1.2       | NOK | https://autobuild.buildroot.org/results/afd8c5284fad326be5f28b92fd16de87c035b2ec | ORPH
  aarch64    |      linux-headers-7.1.2       | NOK | https://autobuild.buildroot.org/results/41b926d381e20762f050610167ecfeb56bf1a1bb | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/3b8ed6cddb550b8e51ce26fa7d687ddb69cc496a | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/e495dd6885b1544d09ee8f4ce156bf206dacf373 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/292792a5bd5a6f010a4bece652cb47deb8b3c3fb |     
  riscv64    |      lttng-modules-2.14.3      | NOK | https://autobuild.buildroot.org/results/29e32d510bf7520f06769795469e7c4c7b41ae9b |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/17939c48d70ac26603ec6171beb7ca40074c5a7f |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/c12d57c3bb08b243813b4813cea0fa2af0e5ab90 |     
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/5c4894ab8af1c6978659aa646482a79435913cad |     
    arm      |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/343f116b2b188ed5189f49192873f443a0c93d32 |     
    i686     |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/6a2a86fc39df6e9e239106dfc182b300b87861d6 | ORPH
   x86_64    |       nodejs-src-22.22.0       | NOK | https://autobuild.buildroot.org/results/28ed6b786b659705ad7e58fb9b60e97bd49eb4b7 |     
    arm      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0eee1bb768664b0b134bd58cb371393f9818384b |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/87a4ba7b435d11e692826e24c55c9bbe957fdf50 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/c097599218fbfc83cec8becb260a8d82acb1433d | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/7569ecb2df81f1cd5b814dfd1b86140c140effaa | ORPH
  mips64el   |        openblas-0.3.33         | NOK | https://autobuild.buildroot.org/results/6e0b3cc120451e1c583acb13f84e780a561b8e26 |     
    i686     |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/5b6ad99199b1a0149267c17ec197c62b8465836e |     
loongarch64  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/013a6d6aa1198c13433214ae9f2bc07874a9ed18 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/a79cfcfc7e41dc1b714c9977d1dcc7caaa45e7ec |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/1277ae33a242432be27f08c65ec20a9356134c79 |     
  riscv64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/f0bd3c037134fd3189c0a13a96efaf165c224ca4 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/48c3ce7e7ec4638a1df267fc3d760cdb6921c89d | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/aedb03e102aacf0ee71968ba2ec5feef3262d0e5 | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/2096f2641353fc586dfd531a739afbc3c06fd544 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/60ae43be3c3b96b8f4c2ded20216585cc0453b8b |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7a1adb0e718917c03e3d986ef25df9624d7c18b1 |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/961f5ccaca888db6e3da60e95a0579ad861ab015 | ORPH
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/0acfb8fbd3212dc8da90b3e4ea5d5ec055615447 |     
    i586     |     riemann-c-client-2.2.2     | NOK | https://autobuild.buildroot.org/results/a77c4e57ba433822179373b07ba2d3500e63cba7 | ORPH
powerpc64le  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/5f917d937af5371dddecaeff86f7848a87108246 | ORPH
    i686     |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/48f16acb1e8ba9cdde762fb2095f0df18ac0ebcd |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/b5d7226cdef9a1fc90f6a3a5289b1c0401c42687 |     
  aarch64    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/2461af85342c0450340801f19054de1e5a53536c |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/6ad9f120c480759092c06c46d6cb0fa5493efe60 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/610f68558effb7252615e5839a653f5db2468c24 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/6c1e9844122c3bbb8c02bb4549aebde297365d32 |     
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/cff84cefa74a37a2d2caf87f37b6444f5f8c6c83 | ORPH
    or1k     |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/837db52f63638e7a5d18ab262cf3d0179343d073 |     
  riscv64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/059557f40b2e62b5fa56e7d751c9253e8ddcc409 | ORPH
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/d27cbf172c98e5911da52a47f743b403f680dab9 |     
    hppa     |            unknown             | NOK | https://autobuild.buildroot.org/results/c20ebefbd5a5d023131cf5e5ef04f17646b1e59c |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ba8e7d2c14a1fd9966dd6b20cdb425c0b8afe9bb |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d2e28432e68c670324a019955118c71ea484f02c |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5ef547c8c58823d24e48c1ad596695332b6d81b9 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/eeaab1c9f2e5923c1d6691b91c042bece3ac8598 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5a688302b5e05f516c436f640aab9be849ba003e |     
    i686     |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/ed9c64241fd265c013e84c226aced3634b5947ec |     
    i686     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/15a1faf6fc2ed3a29d57482c1a35a9be18711c55 | ORPH
    i686     |           which-2.23           | NOK | https://autobuild.buildroot.org/results/007d9b06ef6cc14dc3c03e4ba0ee9eed88f17fb1 | ORPH
powerpc64le  |         wtfutil-0.47.1         | NOK | https://autobuild.buildroot.org/results/709c7dbb1191101e45babf39c5f0afd50ad6cdca | ORPH
    i686     |           zix-0.8.0            | NOK | https://autobuild.buildroot.org/results/520b24341aa473d57e93138bfe926d51b1c38e51 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                  ffmpeg-6.1.5 | 1 
                 gnupg2-2.5.20 | 1 
  wireguard-tools-1.0.20250521 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/ac5527851b85569fb0a9aa2c4773d45210d10010 |     
  mips64el   |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/542af57bcbdc3f773ca2e03c11227f1414a3fcec |     
    i686     |  wireguard-tools-1.0.20250521  | NOK | https://autobuild.buildroot.org/results/920dd24a8e63b78d597b78d0d6273e57818d00d2 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 4 
             dahdi-linux-3.3.0 | 1 
                  iozone-3.508 | 1 
                  liburing-2.6 | 1 
                 logsurfer-1.8 | 1 
                memtest86-7.20 | 1 
package/linux-headers/linux... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/45a1ee88d3d5d6670a67fc383489cb1776ee0366 | ORPH
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/e87fdccbe05646b453437beeb34974a6946a0924 |     
    i586     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/5f9a5a4155f4cd690599fe7202f27095b92f6885 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/486b82f6963d9f3bce421878593b73711b14c791 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/3c51ba94697fd063b1e74147320dac79b1b9c6a8 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/9f3924c869428cd27c1ce7711e0124287cc5a8c6 |     
    i686     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/86f01397804ded68a4be52d22a6e75ec5fc5254d |     
    i686     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/93ff77058666b0a75ab6e72c31f252e72fff3b63 |     
    i586     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/239ada7b7d09ed9c8b8de1d1be47b4d7c2bcec02 |     
  mips64el   | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/4dd9c140c719609dc396ce8aa03d3d666f4f37cf |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
