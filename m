Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB441CD342F
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 03:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77BC3406E7;
	Wed,  6 May 2026 03:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qOwkdDndo5G; Wed,  6 May 2026 03:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CF5A4070C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778037594;
	bh=X/NmyBqrayxjPH47zb2fw6pPkCXL4mPYYLhsUwvZJuc=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pDzS06WwjD5RcD5YWszRpxgA18Pj2i4MFx07kI5DuKov68LYOQRy8VOSp2NRR1a1i
	 5RnPlcfdBWAOjsL0e9vUy0hph0N51BG1pAVGfoYmI8qk0NsvBBB26PLijHc597AjuQ
	 CEV85ToMRnQ8ad/QUGCy9jXMcKUFDK/NHaTyVezubpKXGacXDGNgpbeV4rkEgU4eoH
	 kxWEVjoExuFuWMqaZsv3FlvqB3YXIHnVO/D7i/bH4UwaoDtPcnQ0BHUMkq9hTVLcJ1
	 QQUq/apM58EEowmPTY5xT1f/SBsLRxCzw0zFri78cxYLp8VtC4BRwha3qYrsKqVWTW
	 jahzBgLVKSoXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CF5A4070C;
	Wed,  6 May 2026 03:19:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFF082A8
 for <buildroot@buildroot.org>; Wed,  6 May 2026 03:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D649260DB9
 for <buildroot@buildroot.org>; Wed,  6 May 2026 03:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDgjmVtV4sMP for <buildroot@buildroot.org>;
 Wed,  6 May 2026 03:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 23AA260B25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23AA260B25
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23AA260B25
 for <buildroot@buildroot.org>; Wed,  6 May 2026 03:19:50 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso45438125e9.3
 for <buildroot@buildroot.org>; Tue, 05 May 2026 20:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778037589; x=1778642389;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RUWD+EaPMAUPUXLdDl1PWKJ9lIVnpYtzCiLD0570hiE=;
 b=SsuKuz/9swrLcQnxWpR//MeoytZyI2+duswTbmUVHsHG/ToLS5PJUiNgKG2IAJN3fs
 hLc5vjp/4Mhej6tCbSgskivs7jGp9WmaXMNlncNhc5Xj2hg9teHa5FUhm9ZWYaTbftFN
 D5AJFTltAPm5rrwWjoMKhy1Fqthgl+xbfPsgF1vkimRvrKTYnnc69CkenZy5oGxu2aq5
 P6Vx+6KLZ6VE/ljbAikekRtMqZF1RBhQaOFUVTuGTSOopS0HZ7dDbBCkGjgdg6iWZ2OM
 onZMYDdIijU+XcdDobYVSTupRqUG6JhdWVYl9q0nCJgLxHI9FcezIpMHNFcHB+NIkDPd
 FbFA==
X-Gm-Message-State: AOJu0YwwfVHKJSOct49PhRZ8PSOTU/tMKUKUL4xohwz4KIno6HKXWqGY
 GBJcg+pqBMBP/Ux0fqDHIcxdv7jSlSrJHu2/L+oZCQh9DH1n2Qgq/87nYKSZ98jl
X-Gm-Gg: AeBDiesG+L4mJNqrzmQPWiqPI+M7XHdTlGLfD3eI+SEikxJb20Bmb0QMGDSH109e05c
 yggxtaV+z5yIe44cVFoBmJcJ9gpu3FpfQVbm24635Jponkr0gQZaOxAfFi+JWpx3BiRXkg/XMjH
 0MKCuT6kmxgFL6YC7AxdH6hnEIqaq+tXX3cAbCN2u/0hPaJcFnyJDEWq/GPOAduprKmlGNOM3IX
 7V88Mo8oBkdsvi5+htk+aogyp5gFHEDedDMc0DcbuwtIn1PqirSDBul0G/Vb3ed6Rwk9qA+g0rK
 96U3uGuDdLw2LLeib3UBDOyFnePf4kRuaGoyaf8yi0OdmblCvWnZY/NQbJXPdzp1xOvEwNtnPzG
 ue/rMNAcqbVnPbJH4CfJJ80000lfMBxRlqCEINbFRdK1SBBU4B870epyxxbPff3arSItvxq70OP
 9sY/FUPv+QKMkk2NjNF2P8Kg1QBv4NPcXDbMq3nbMXISm2a1yrHXU=
X-Received: by 2002:a05:600c:8485:b0:487:55c:e0c1 with SMTP id
 5b1f17b1804b1-48e51f2f853mr29199055e9.14.1778037588486; 
 Tue, 05 May 2026 20:19:48 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e538d2878sm20924665e9.15.2026.05.05.20.19.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 20:19:48 -0700 (PDT)
Message-ID: <69fab354.050a0220.2a3b29.efe5@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 06 May 2026 03:19:48 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778037589; x=1778642389; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=RUWD+EaPMAUPUXLdDl1PWKJ9lIVnpYtzCiLD0570hiE=;
 b=ahPPHQlItb818L6H432cCuN8OD75eW1LYNloNoIvs3pC/r7jdjTe4B0aY4hMRr8N2T
 HgS682LQ2jByNx3TrAUHq7cieEzK68Icm432Hy/H1ae+kcuV3gsNOCguPBVyaEqsB9tT
 YujK3637XyO93IBYbRV3IBOT8TCb0X6aeanFQq98exvC/0dRvyS/7CJ/Xm6BYph4fQ7I
 gRCLusM45exR8e+8k11EZ1+CrV0zTtgSKu3cCLWpylQpt7kqVfqoKoNLZpeRUhEJ+IJe
 6mqHun22dw6DrrTzDQOKgYpxEWgswOoi4tIQ9OCyY+lwBo5j0flOUkQUD8/YIkEze3IO
 mhTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ahPPHQlI
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-05
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

Autobuild statistics for 2026-05-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  | 21  |  0  | 24  |
  2026.02.x  |  3  |  6  |  0  |  9  |
    master   | 30  | 76  |  1  | 107 |

Classification of failures by reason for master
-----------------------------------------------

               linux-pam-1.7.2 | 4 
libdill-32d0e8b733416208e04... | 3 
           libmicrohttpd-1.0.5 | 3 
phidgetwebservice-2.1.9.201... | 3 
                       unknown | 3 
              e2fsprogs-1.47.4 | 2 
            gettext-gnu-0.22.4 | 2 
glibc-2.43-22-g8362e8ce10b2... | 2 
                 gnupg2-2.5.19 | 2 
host-am335x-pru-package-5f3... | 2 
                 libavif-1.4.1 | 2 
                libnss-3.123.1 | 2 
                    ne10-1.2.1 | 2 
                  ntp-4.2.8p18 | 2 
                   perl-5.42.2 | 2 
amazon-ecr-credential-helpe... | 1 
             babeltrace2-2.1.2 | 1 
             batman-adv-2025.4 | 1 
                  boinc-8.2.11 | 1 
                  brotli-1.2.0 | 1 
                   ccrypt-1.11 | 1 
 docker-credential-gcr-v2.1.30 | 1 
                   exim-4.99.2 | 1 
               freeipmi-1.6.16 | 1 
                    gawk-5.4.0 | 1 
  gobject-introspection-1.84.0 | 1 
                   gvfs-1.57.2 | 1 
       hicolor-icon-theme-0.18 | 1 
                 host-gdb-15.2 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
              host-rust-1.95.0 | 1 
          host-xfsprogs-6.19.0 | 1 
                   i2pd-2.59.0 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
          libfastjson-0.99.9.1 | 1 
                 libiconv-1.19 | 1 
                   libidn-1.43 | 1 
                  libnfs-6.0.2 | 1 
                  libogg-1.3.6 | 1 
                    libopenssl | 1 
              libopenssl-3.6.2 | 1 
     linux-5.10.246-cip66-rt29 | 1 
        ltp-testsuite-20260130 | 1 
            minizip-zlib-1.3.1 | 1 
                       mrp-1.2 | 1 
odhcp6c-f19dd37fb467c9cf10c... | 1 
                openocd-0.12.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                   ptpd2-2.3.1 | 1 
                  stunnel-5.78 | 1 
                 systemd-258.7 | 1 
              tailscale-1.78.1 | 1 
uhttpd-15346de8d3ba42200249... | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/c4a1099129846925f7e752e29f4632de949cbf4c | ORPH
    m68k     |       babeltrace2-2.1.2        | NOK | https://autobuild.buildroot.org/results/e29864fe984ee49f7b7084d147a49f4bdc8887fd |     
   xtensa    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/4dc15c0c18efbad78dacc7cc178eec005aeeb8f6 |     
  aarch64    |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/889c2c5430c645857a3f015928de35dddbabbce2 |     
    arc      |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/7479e83d342d356ac4fb13c19474f362380340f9 |     
   mipsel    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/98a7f90c9796dcd567afd0f04badd11d27b8c679 | ORPH
    arm      | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/77d59233dd695021d04b5478ab2279d7eaefaea8 | ORPH
    arc      |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/27b372be908702463480289bdb3caca55f6b8072 | ORPH
   mips64    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/7d91c1a0a5b19d771a4b813cc19a2f21b552e450 | ORPH
   armeb     |          exim-4.99.2           | NOK | https://autobuild.buildroot.org/results/f70bc43d4d7c5f61a117e690b92c805cb55276f0 |     
    mips     |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/fdc91f45396156d106b77b612727d6153658b388 |     
   sparc     |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/07f170c123a6b4505b9ff253e57f3a151c3309f7 | ORPH
   xtensa    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/96a1f2ef914f7e38b58ff1707f5e3d867e32e234 | ORPH
    arm      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/e3aecaa2ee41f351e5cf8ed969ad7eb14b96d84e | ORPH
    hppa     | glibc-2.43-22-g8362e8ce10b2... | NOK | https://autobuild.buildroot.org/results/da71971b6f34bdf5ff5f5cdb6da06b69cebef4ca |     
    hppa     | glibc-2.43-22-g8362e8ce10b2... | NOK | https://autobuild.buildroot.org/results/e02274232a2a9810365383096394f41e5f398c8a |     
    sh4a     |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/3589e63bf4b180812b951d6a35c34c3385085734 |     
    arm      |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/bc18a020d797610276ce44adcfd074c016184cca |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c1584ee29446155e88eb3937820eed7411174c68 | ORPH
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/e1296b6c8c41c2b60b4c4c48cabf1ba673f02b32 | ORPH
   armeb     |    hicolor-icon-theme-0.18     | NOK | https://autobuild.buildroot.org/results/22f7975ef23642ca1a2895bc13a01642da0d5e28 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/f019cbe2a7eeb88ff37bb46ceaa0255ab811f7f1 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/09f648a6be0da030d549b78a64d296c404d418d5 |     
    sh4      |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/f24d5d7e43a01928c7a4f87acbf1ee71607390cb | ORPH
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/d27bd14cf4050bb24422a9ff413ae3c70a5423d0 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/503b6d00c4e2a53bceec84320933a24f7b42d7b2 |     
  aarch64    |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/041a9c787e4bf40d35e275cf86c71fa280362742 |     
    i586     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/be89ba31fd4390903d32e04614ed0fc95ff672f7 | ORPH
  aarch64    |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/253a5980ed0c7d5592f951ec61b8024a7c8aa72b |     
   x86_64    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/9ad3fd03de78162b4d37223b4c265273ebe8e8fb |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/b499143cb1f0bf6e70a7da90e189cde6cd40829b |     
    arc      |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/ae028fa5fdc84f975d3ff73dc198247ffaff5edd |     
 aarch64_be  |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/0309a5c6353ad784c0832476d608598a2f05b87a |     
powerpc64le  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/a438dddfbf2144e0010273352cf1de25d3caf934 |     
powerpc64le  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/ff8ac27f49524a65eee58a715963cdfc70bb4eae |     
  riscv32    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/e98068b66ae164d074ba02b4248bcd31fe65410c |     
   armeb     |      libfastjson-0.99.9.1      | NOK | https://autobuild.buildroot.org/results/757d878f704abd275683f1f83c54e1e9188bcfd3 |     
    arc      |         libiconv-1.19          | NOK | https://autobuild.buildroot.org/results/41aa4c005d6116416119cb5e9c2104b40a6a79e1 | ORPH
    sh4      |          libidn-1.43           | NOK | https://autobuild.buildroot.org/results/04a8ced638db82c2bfc5ba4485694c8d9394890a |     
    or1k     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/ce7b57c8036261d1b75b891afbbcf101b8853b86 |     
   mips64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/60a96dc3f252dcfffa8efa3267cb31aebd37254e |     
   mips64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/fea26dee6e11b32342bc7ab5eb3c4a5fc2a45e3f |     
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/09414e35bd4d4e7c384f9fa00e14e800fdbca73f | ORPH
  powerpc    |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/586996238d9fd858c6b52ad4cd12cd5023fc0604 |     
  powerpc    |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/fd60bb7f43297f29add08a8447406b4468c8b252 |     
   mipsel    |          libogg-1.3.6          | NOK | https://autobuild.buildroot.org/results/69ee731a0889cac53b8235942fcc5e3e8932a688 |     
   mips64    |           libopenssl           | TIM | https://autobuild.buildroot.org/results/d73c774a8b22244a3fb07afde96a7a623114b4df |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/0fff825d15304f25855d9331d7409a61f8325790 | ORPH
   mipsel    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/03bddec13f5691a16268c193de93abe3b796a596 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/f7433672d94c8f25703afc450cc57574185974f0 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/c52bd274af3403a606631a5b5f97227d41f19d97 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/cee0862477910d6c55bc7bbd52a97dfea4a781cc | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/b90ed70db22fc1504663d074d03850fb10714277 | ORPH
    hppa     |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/132dedf879ef8c6963d1babc853d636417172f37 |     
    m68k     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/522e7158a147b6a0f6304e618a3586b754483cf8 |     
    sh4      |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/a19cb3d61564c60018488843c490704e6fcec8a1 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/a7f3a5f7f9e11643d281b2d63a025ee6f891c527 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/698b5b67e03d81d5d2a1c1cf65dc91be346c0f0d |     
    arm      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/60553283f512f4136d573441138c499b036c3c9b |     
   mips64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/4e2a56d083d875093882e3d1f0ad66250d38eda1 |     
powerpc64le  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/ab0fc0279852b97ea5025c85b7f5df37efd2b6b3 |     
    arc      |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/996e956ab52e07e31ee5be232cfea12f3da4d164 | ORPH
  riscv64    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/9a3f8f6ba3842051b3d263e041deaa165f912424 | ORPH
   x86_64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/c569f4b1dca3ae167511454c32a6b37aa613ccef |     
    m68k     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/8609065d27d68288da438233dde7771546a36e57 |     
microblazeel | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/03ebd176d08043879f9e4bc5223d1a2e231dd611 |     
    mips     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/38ec666938b5f9975835dc3f2ddd97a6704fd492 |     
  mips64el   | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/6d6d506e22752655298f83627edd0c491f28b7e9 |     
    or1k     |          ptpd2-2.3.1           | NOK | https://autobuild.buildroot.org/results/53bd0c1f42c936d7a181988c06414867a56afbcb | ORPH
microblazeel |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/1f16c822fbd55e91c1861faa6b600ac565e8e34d |     
powerpc64le  |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/18790ca18d0262f5f089c0483b3965ed680bb18d |     
   s390x     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/784ebaf9d18607187ac99f73c6186136b2005527 |     
   s390x     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/2479d58c4f011c040892e961b9a93fdac17cd421 | ORPH
    hppa     |            unknown             | NOK | https://autobuild.buildroot.org/results/bf5d3a92bdd632cf559ed88b8b6456a59af02558 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/d2fd5dacb2cf6a7fd04485790b00092e80121961 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/731234a4c928e597b6f40cb328b6eec445b499ec |     
   xtensa    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/cba710b07fb13146392520757d03612b88d10c86 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                       unknown | 2 
            gdk-pixbuf-2.42.12 | 1 
              libmodbus-3.1.11 | 1 
python-remi-2022.7.27-37-g1... | 1 
          sphinxbase-5prealpha | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/8a05398683347699fac1a1f5dc136753dbecda80 | ORPH
   x86_64    |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/abbdc053d36e16c378843aeed1f39d7b26998953 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/1e54dfd8ec8b07bd28a0ad06f1b2c547ce831972 |     
  powerpc    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/f8f0a7f25340e3c2fdcc9b00179b883e0a31c90d |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/30a1c77e93adda0d07eee22c310d1b2981060146 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/99c8b48687e349eaf3b6443467fa6053302545d1 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-util-linux-2.40.2 | 11
             util-linux-2.40.2 | 4 
          host-libglib2-2.82.5 | 3 
abootimg-1ebeb393252ab5aeed... | 1 
               asterisk-22.8.2 | 1 
         host-btrfs-progs-6.10 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | abootimg-1ebeb393252ab5aeed... | NOK | https://autobuild.buildroot.org/results/6f7dacc07e9010304ec365ed9807b4fc666c40c1 |     
    or1k     |        asterisk-22.8.2         | NOK | https://autobuild.buildroot.org/results/5fdb6f9c8ae690d15b73936bcd9bf77ec5992a71 |     
   xtensa    |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/fee4818a50568ddea03228ea05d8782c0269025f | ORPH
 powerpc64   |      host-libglib2-2.82.5      | NOK | https://autobuild.buildroot.org/results/e9774988ec85c8a626b82182f640942371ea18b3 |     
 microblaze  |      host-libglib2-2.82.5      | NOK | https://autobuild.buildroot.org/results/c6bc370056f155ccada6d85bd35d9241cb06b178 |     
microblazeel |      host-libglib2-2.82.5      | NOK | https://autobuild.buildroot.org/results/b493b8e3415745b7dfa75dd38649923de31e12bb |     
   s390x     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/0b63fb32dfa19ccd5f099f76605797b5379519e8 |     
   x86_64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/f53e40c0858d3b3083f102eb34edf76b8b4a50bc |     
    m68k     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/541bffc111ff182ab04df5735f5d5d98c2b9f313 |     
 microblaze  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/f3b6ef4f00cadf3de1c768936133bb535b99802f |     
   mips64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/f00f26080d1913906208f394e1a051d267f8794a |     
    i686     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/4ff4d3a7fbe10ed5ad94cb3510681e493c86ae28 |     
  mips64el   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/39efac6f0f26db1c0b2136c0c804a5690dcd89e3 |     
    arm      |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/7ec4fe6afc55c56481ec74081e8abcc0d8f834e7 |     
microblazeel |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/00b9bb3e32ed5c51b2faa3a80d8c1c96c486df84 |     
powerpc64le  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/55fdf17fd8cbce0e1038387c67c0758730367c0b |     
  sparc64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/dcc013fbdcd45515fde951f15257bf5df76d22d8 |     
   s390x     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/73ccaf1dd07afd097b93050df6b4e0ac8655ea2b |     
   sparc     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2c7997ab54e92513505149606ad8de051b2c35c2 |     
powerpc64le  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8b22035453ccd66be5d8300d5243c69f338c0f95 |     
   mipsel    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/83d8763f5f88a86f51c599b3f02ab36a3cb38e51 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
