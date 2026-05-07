Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF6CCD3427
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 03:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1764B83B78;
	Thu,  7 May 2026 03:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3Ipi-wixame; Thu,  7 May 2026 03:32:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F30F83B73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778124738;
	bh=juIzDIfFBiDZG6taXWfcmBRiZI2X37eBeYJjjnouKL0=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q0ZP607gb0Hp8QI8sCMqM6MdUPBsW5eIFd1jJkpg8jw7gS3t1JL0lDxtLUOdgVQDA
	 joWtI9NDWYk1PthpKzlzaiSIGErQd8nBActsD5Pyq4epZoEGVh39MpbUtzmAdCqk0N
	 KKrLFYs1m6rMEQlOiiFPkTeWn7UpYya5T11pkj+7I/QkX0lrh3KzvE89PifBvHZyRa
	 pCVAF62qoogG75wkKAAI09ToW+Wa7UfASnkLdLxrxgxUWE9RmQcrtSpyIlUysSy19Y
	 pr4jMUXdwgyi7cDnt/QkrteOqr9g/06e5xZrczTOBTxbY2l+x5OX/KmHFY66j8nZLR
	 q3xUHAW1zBD/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F30F83B73;
	Thu,  7 May 2026 03:32:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A41D377
 for <buildroot@buildroot.org>; Thu,  7 May 2026 03:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFE6683B73
 for <buildroot@buildroot.org>; Thu,  7 May 2026 03:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B7O6SRgV28Cn for <buildroot@buildroot.org>;
 Thu,  7 May 2026 03:32:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5746B838D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5746B838D7
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5746B838D7
 for <buildroot@buildroot.org>; Thu,  7 May 2026 03:32:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488ba840146so2581375e9.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 20:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778124733; x=1778729533;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=duoDly+xeliV7it5mHSGknoxi/+Uo0Z5Qv0NfdI1E24=;
 b=U3Cs0mH+73Yk0RT2Hr3DtZJJhCybnHeJMplip6tTGvu8MAX54m+S1v2b5/Hubgm3ca
 qCZpnyrEwIZeECog73rnugHDMTmLIfs7wGeHnSAR9tPZrx9lGsqK554CN2syI4q711ct
 BhMcUD1N2p7dtKYywYbLh3l7NGgMBzz+nfcM7CywZqvGvc6NhfHdgS5oHd9PFetninvV
 9Rsya5lNEbHvF3JQKrUIG/Lx2ZPLxGDFDL1zJ4syy6frAkYTdzFqulyFz425/vK/yTm1
 4zJsYHjHhkcVvQEZQ929hwz1Jen2bCDewA6MTKxBFRd6Orsp60xajlXxxwGzBXwkx4H0
 WV+g==
X-Gm-Message-State: AOJu0YybYht50PKvzzCz6e0lIEh/ThCSTCnOrMfjOSUoV2ISWiy28Ndv
 ji8DAwJ0d8yVksWL65BDvtmMzAvshg7zYoiDJl+wk6ptuFwr39qMaSnv89ZUeArK
X-Gm-Gg: AeBDieunSp3T4WRJJwA/tOE2q4nl/TIF0nbtXg+qHgWWd+1oDD5wXqdjAAnrC0HuV0f
 awdhXnDMtPUvIEC6QMY4lE7yireBO2t4yjqHbsx+xYnXZlhGw3VjatSgHK0zhLlvaD6LXYfocEy
 0doM2ou+tSaAHmUKStHlDzK/gmvpu4piITcb+YReCP83mDjZVQNNTE3E5B/7g94J90FYQ2YCPv6
 k8XAlmkosRvc5N8qiBb2H/8AS+ZUexkB/RVhjtxOHgUDUOXiwxf3NNPTqmzWwoA16r+rj5tvECp
 Jf15C5wjiHz7sjH9cOJo9eFCOcxvtWI+At9hwqq3IH7f635wgLvO60c14Xnlzd1mTqscTkTOKEf
 peg+uOTd2CCBdRsvnHqAzKdpnOlKS9xPMrMFrTaYgI73ZBR950KAa9UUMwk9XZmHvimZtr6vo8e
 zD7wgU39eOh4BpwQk/IizJzIp5ras1aqqtJ5Wq0XnO
X-Received: by 2002:a5d:588f:0:b0:441:1cf9:4f06 with SMTP id
 ffacd0b85a97d-4515d5c69c2mr9494521f8f.31.1778124732805; 
 Wed, 06 May 2026 20:32:12 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4511d8cd160sm12255587f8f.8.2026.05.06.20.32.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 20:32:12 -0700 (PDT)
Message-ID: <69fc07bc.5d0a0220.177bae.3cad@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 07 May 2026 03:32:12 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778124733; x=1778729533; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=duoDly+xeliV7it5mHSGknoxi/+Uo0Z5Qv0NfdI1E24=;
 b=gLAf34K8/2td9uIwnIY6TitlIduhXSZl7U2NBC4ei5ZB6tAWUK6t/1fJ1h1X+lj77m
 rwdOou1j8POBWqeoG/c4LCXiUpC0CkZUp62xtQSWmfsWUf+1/Oynxp/avdm2XhdRAg7+
 gkT/VCXotr/CEs9Y5fJgWZ0bZpGnmyImfIUZrnsYlxeI+J3+r6+T7IGo/o8wvcncv5a+
 NI2BRzfX52+bdmVWXXBPe2dJ59cMwUlXhtmpbU4FzzTkw9YuNwoe7G4f0UK5gt3ApFN2
 H9XOaz4u0GcsMixM6xLi+Jtr5425EBv54aFhBNQHQt1SrMF9BmCzo3hrA+MYUWBOdrQL
 qjAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=gLAf34K8
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-06
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

Autobuild statistics for 2026-05-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  | 28  |  0  | 30  |
  2026.02.x  |  7  | 11  |  0  | 18  |
    master   | 46  | 95  |  2  | 143 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.43-22-g8362e8ce10b2... | 4 
  gobject-introspection-1.84.0 | 4 
odhcp6c-f19dd37fb467c9cf10c... | 4 
                openocd-0.12.0 | 4 
                       unknown | 4 
             util-linux-2.41.4 | 4 
             dahdi-linux-3.3.0 | 3 
               linux-pam-1.7.2 | 3 
                 gnupg2-2.5.19 | 2 
                 host-gdb-14.2 | 2 
            host-protobuf-34.1 | 2 
              host-rust-1.95.0 | 2 
                openntpd-6.8p1 | 2 
                openssh-10.3p1 | 2 
                   perl-5.42.2 | 2 
ustream-ssl-5a81c108d20e247... | 2 
        util-linux-libs-2.41.4 | 2 
            18xx-ti-utils-R8.8 | 1 
           at-spi2-core-2.58.2 | 1 
                  boinc-8.2.11 | 1 
                  cairo-1.18.4 | 1 
          cloudflared-2025.8.1 | 1 
                coreutils-9.10 | 1 
          dacapo-9.12-MR1-bach | 1 
        edk2-edk2-stable202602 | 1 
                    fcft-3.3.2 | 1 
                        gnutls | 1 
      gst1-plugins-bad-1.24.13 | 1 
                   gvfs-1.57.2 | 1 
                   host-gnutls | 1 
          host-xfsprogs-6.19.0 | 1 
            igd2-for-linux-2.2 | 1 
                iproute2-7.0.0 | 1 
                     kbd-2.9.0 | 1 
                 libavif-1.4.1 | 1 
libdill-32d0e8b733416208e04... | 1 
             libgphoto2-2.5.33 | 1 
         libhdhomerun-20210624 | 1 
           libmicrohttpd-1.0.5 | 1 
                libnss-3.123.1 | 1 
              libopenssl-3.6.2 | 1 
               libunwind-1.8.1 | 1 
                   linux-7.0.3 | 1 
                   linux-tools | 1 
               lrzsz-0.12.21rc | 1 
                 mdevd-0.1.6.5 | 1 
                      ndctl-83 | 1 
                  nginx-1.28.3 | 1 
          openfpgaloader-1.0.0 | 1 
           python-html5lib-1.1 | 1 
            python-numpy-2.4.0 | 1 
                s6-dns-2.4.0.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
           sane-backends-1.1.1 | 1 
                    sbctl-0.18 | 1 
      shadowsocks-libev-v3.3.6 | 1 
              skalibs-2.14.3.0 | 1 
                   swipl-9.2.9 | 1 
                 systemd-258.7 | 1 
                    szip-2.1.1 | 1 
               tcf-agent-1.8.0 | 1 
uclibc-ng-test-132c6134d691... | 1 
uhttpd-15346de8d3ba42200249... | 1 
            vorbis-tools-1.4.3 | 1 
                 weston-15.0.0 | 1 
                 wolfssl-5.9.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/798b6d6983cca21c8bb83155fe6c61ff2a90ab78 |     
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/6bd876ed9ea7481e9559c238bc8b0e62792f87be |     
   sparc     |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/24aaf3ce0e761bcd6e754a9e9c51adc7faaffde3 |     
    m68k     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/c1c032308082666556f2625fe8ce2c7c683da2ef |     
powerpc64le  |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/00c551105147ffc5289a9622e35e9776e7e578a8 |     
loongarch64  |         coreutils-9.10         | NOK | https://autobuild.buildroot.org/results/6138b9a905467e21e6995eb7fc971e2599b316fa | ORPH
  powerpc    |      dacapo-9.12-MR1-bach      | NOK | https://autobuild.buildroot.org/results/18a085317b39c8c8de88df1164e20dca3608c6c5 |     
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ca0eb8789696de93c1c9df3de285176eb64954f1 | ORPH
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/237c9789ccf19ce5ba138a8e73efe8c4c2d9d9b8 | ORPH
    mips     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c2e6382433ceb1a879d89225e1ec76fc6ab43bc6 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/047f2df25120d56f1854f3150894651049f61c1d |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/f8a360e2820a0f53ce198bb1e92979557dd8174f | ORPH
    hppa     | glibc-2.43-22-g8362e8ce10b2... | NOK | https://autobuild.buildroot.org/results/b00a721d6b8144c8ded8b0e71a073a8058be2b3a |     
    hppa     | glibc-2.43-22-g8362e8ce10b2... | NOK | https://autobuild.buildroot.org/results/fc5838ffecf6a170ec4155e8e6da9cfd1a9f2bb0 |     
    hppa     | glibc-2.43-22-g8362e8ce10b2... | NOK | https://autobuild.buildroot.org/results/2285c332c1f2f4df88fa2e4f4f82c167b97051d3 |     
    hppa     | glibc-2.43-22-g8362e8ce10b2... | NOK | https://autobuild.buildroot.org/results/9bb7e67768d05b0256b3ca54f1a18864733c6508 |     
  mips64el   |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/e924c7c0d5652e241811850974371349fa5bbf14 |     
   armeb     |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/86a2f34d88e699d87ad00f0efb0a1997ece2eb50 |     
  sparc64    |             gnutls             | TIM | https://autobuild.buildroot.org/results/ac28c079dd67890938150a7c2200c7e0aa4375c0 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ae2701855a5dacab9995b111f9d03c1b631ec924 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d5606e70f9092435ed043eaa1642b0173933e0fe | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/cb2b53e792416e08f26116fec4949f6d5dbfc68e | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/57a261b65a8054c0eb132cbc6fe20606c659bc85 | ORPH
microblazeel |    gst1-plugins-bad-1.24.13    | NOK | https://autobuild.buildroot.org/results/bc2b2324f385d2cafdae71ac19804f27f7a7414b | ORPH
 powerpc64   |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/86372290d9b9aa19737a31fbc83031a824a6d1e4 | ORPH
    or1k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/92f6b34efb8d8b2f117c2da23a604819fd14432b | ORPH
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/9f77592410b6668aba43b9edd44c133c862078c5 | ORPH
   mipsel    |          host-gnutls           | TIM | https://autobuild.buildroot.org/results/4e446635309d3d37fb47fa48ab3509f3f7ffe118 |     
   s390x     |       host-protobuf-34.1       | NOK | https://autobuild.buildroot.org/results/7d454d84bfada8666c0008c3f4793b18998ca71d |     
  aarch64    |       host-protobuf-34.1       | NOK | https://autobuild.buildroot.org/results/be218fd10fc7163cb70e1026d9db0a8b247de6de |     
   x86_64    |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/d65b009a80371c777e647d1e2102934496b14f3b |     
   x86_64    |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/2ceaf56c63191118ecd890710381f54b63e128b9 |     
loongarch64  |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/19a6d71121b771465f8f8286537e77f102547f3f | ORPH
microblazeel |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/55b7215264e2f6691f7fc54696321e7198c9677e |     
    m68k     |         iproute2-7.0.0         | NOK | https://autobuild.buildroot.org/results/cd26838f4bd63a0afb12ee1ec5b3bab135652bd3 |     
   armeb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/7ed5c390e4dda23fead1ee6b7cb14c8f30e7ece7 | ORPH
   x86_64    |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/f48a58e00e8c6f6189c2ec5ad8e3412cf0cf9d13 |     
  aarch64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/7109fc72ae00988429c74ed38d5432e506626362 |     
    arm      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/bf48bd0fed0193163a3c2793d2e78699665ae867 |     
   mipsel    |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/d29106f897411b29e2e89b4a59b30ce434e22fa8 |     
   s390x     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/cbacf481e61badc006efe47b59e5c9afa15088b8 |     
    m68k     |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/c36b3f859054ab082330bbbf6905ca9faf6a34fb |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/6854a4e46dd7e07aca7ef3e629321b75b83fb9d7 | ORPH
  aarch64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/1f4eeb9076364dc6243b8ecf533d84cced4de98d | ORPH
    sh4a     |          linux-7.0.3           | NOK | https://autobuild.buildroot.org/results/28ae5297eea1bff9664039362e122d3b36c1c82e | ORPH
   s390x     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/38207a7d21213002beb0207a581e6ffd4815403b | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/53ad3bf0716fdb28363c64085e8f129021b7d1fd | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/3fc13abe8f314220b9bb5b82fcc054aa6e35fcde | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/94a9587982cfd323f5aa8700aef08642591e6828 | ORPH
  aarch64    |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/bce0c8efebbc4e7661636982a8add7cc2bfe6174 | ORPH
  powerpc    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/3d591a67232e3b3b26b80e35647e31b458d4df65 |     
  aarch64    |            ndctl-83            | NOK | https://autobuild.buildroot.org/results/9838ccb5359696ee5838e60b5f7ab31f7930edf9 |     
   sparc     |          nginx-1.28.3          | NOK | https://autobuild.buildroot.org/results/42a2c3f9a85b37822131cb2a9c6048e8d9639fdd | ORPH
   xtensa    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/1fb1767ee90ca507bf62b65f09d93551fafabe7a |     
 aarch64_be  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/96fb17160c530daa142ec6bbc2e327e0b0fd2f9f |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/869a1e357904b7396865f6c7dbef69a21c987c80 |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/7e24acd47337df6c8e56137300dbd8ba1425fb2d |     
  aarch64    |      openfpgaloader-1.0.0      | NOK | https://autobuild.buildroot.org/results/efa8faf7fca4ab0267a4602675c640e26aa272ac |     
   sparc     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/2077f44f85c85a6729824f0118676134cd00ebb5 | ORPH
    arc      |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/c0c51c6c9627fc1b2490629216f6dd38bcbe04e2 | ORPH
   sparc     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/8dc42427187f4457ca6dc67e07fa38cda37b21d6 | ORPH
    mips     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/2c168622234b9797ca6da7b99759f99a1784bcea | ORPH
   xtensa    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/ff250e1d5a4129ae2fdda330ee48cbb67d177a5b | ORPH
    mips     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/763963fefb8f1af03b5f861b0e88cdcdf2b67ec8 | ORPH
  powerpc    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/e3825ebc6ede1b886aab09cfa78102f049678cc4 | ORPH
   armeb     |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/8bef8d97332f9fd42815ddfb7bd8b2809ade6f07 | ORPH
 microblaze  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/acee0b99c2b9a2e8b4cbf1fdcf6539f8f44c1dc4 |     
   armeb     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/82b48b0979a49dbffe06389c9a644ed5dd0c7cd2 |     
   s390x     |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/c9c2081da30ef80f36561c317e2e9d247806273d |     
   s390x     |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/25d8db828ab3967207cc57d0721540096a44ee38 |     
   x86_64    |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/20d60c4444ef47fe6c6c98a38c7eeb30126ce182 |     
 microblaze  |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/77e0099924aa1a9dc883feb1f56b89fcdc21066b |     
   mipsel    |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/63f77eb30a3775b9250675078e4fc0e804480ca4 |     
   mips64    |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/4a4bf4df163f4e64beb6f31b3eae91193bbc7e06 | ORPH
    mips     |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/e151a1a2a6c1ebb43248950163567d81d5014f83 | ORPH
   s390x     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/6ad46a790b4b1de613fa270fc7abf13141b3d65a |     
    or1k     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/af55fd4cafbb7758a47d0df4db0d1e7e5d81859e |     
   mipsel    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/4a547bfdc231874b022848dad6b5e583f8a2b5ef |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/4a60ec6c8b0705e1a66b7d45d79e319ade677e5e |     
 aarch64_be  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/4400edfa3b37bf8f0875b7722a9401a7cb9f8b93 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/1bc6a23398b1cfa875aa1966a730d203c05f0946 |     
 microblaze  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/4093eb8295b305d32f0c6fd4c97b19712a0d3942 | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/618f8eda70d048d64438fa9346c3286d3d8ee9af |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/8e4a9673cf7d0482f2e0903bfc8a655469b844f1 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6cfaf3dff1dcd49723a1c960c0571f9075eca8d9 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/973029a51f71900331e2f7a10e92fbdc9bf012fa |     
   s390x     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/b953f4d4b7d82f51cfb3b5e5911ef01baccbb85a | ORPH
   mipsel    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/3fc767a12dd6e5745b1d1af58136b4655881e0a4 | ORPH
    arm      |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/a3bd2ea84c1461220b264022b519deebdbf8a3cb |     
   mipsel    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/ca0d5ffe36d46c62b1e66cd5d1f768e0c33b4361 |     
 microblaze  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/5424089d7c4e685708de478380a0ae1ae7214c72 |     
    i686     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/d3c0308123d7c7a32d0243c3dd7feb9f7e8c720c |     
    m68k     |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/6276e9a82716c699ad0c34a78c4dbcab0fcec79f |     
powerpc64le  |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/126627f8fe17419bd4fd8c3201b948f578111809 |     
 powerpc64   |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/76eaac90f6ad2b08b0e9d6ace5b9ba48b1e609fa | ORPH
    hppa     |         weston-15.0.0          | NOK | https://autobuild.buildroot.org/results/6695297fb71709cb5903e39ba628daf65d4068e6 |     
   mips64    |         wolfssl-5.9.1          | NOK | https://autobuild.buildroot.org/results/4825fc37d120dbb3301e0b000538cedd821f327e |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                       unknown | 2 
                     crun-1.24 | 1 
     libphidget-2.1.9.20190409 | 1 
          linux-5.10.246-cip66 | 1 
               llama-cpp-b7271 | 1 
                   perl-5.42.2 | 1 
         python-rpds-py-0.30.0 | 1 
uhttpd-15346de8d3ba42200249... | 1 
          usb_modeswitch-2.6.2 | 1 
             util-linux-2.41.4 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/8fd48b626f664c8f91876d506ca87b17fad28b56 |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b82776dab5073348c8e632ba815ebead62f3a2e1 |     
    m68k     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/d38d8dc8e3df3610bcdb9fe95c712358ec39702e | ORPH
    or1k     |        llama-cpp-b7271         | NOK | https://autobuild.buildroot.org/results/0667cd69fb5de773282c1917ad9a21010cd0082a |     
    mips     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/e9f7805f7665c739c3137a4bdfb6ddda6c3fc88b |     
   armeb     |     python-rpds-py-0.30.0      | NOK | https://autobuild.buildroot.org/results/b8a28486098060c89e7b61192127f00104f70460 |     
loongarch64  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/bd639765d8f2dc36324e6b57c5712b90ac68461a | ORPH
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/328f97a436d930344bafd6bc67ab2c1dbdef31fa |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/b254b607d8c4bc7fac6593204ef2f43a4054a5f0 |     
   sparc     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/86fbb8133546aa0b32c6bef066c4e999604b54aa | ORPH
   s390x     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/10c8e5ad395715093bfb6f1f39ec4a137f159ea9 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-util-linux-2.40.2 | 17
             util-linux-2.40.2 | 8 
          host-libglib2-2.82.5 | 2 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |      host-libglib2-2.82.5      | NOK | https://autobuild.buildroot.org/results/8d5dcf32759cbd77b8e286b50a15c1d8ee1c83ba |     
   sh4aeb    |      host-libglib2-2.82.5      | NOK | https://autobuild.buildroot.org/results/7d9fd1550e430f1596e5e8fdf9f97298385335fb |     
  powerpc    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/6bb995e117391029a2f4f91e8aadf257e1442a81 |     
   s390x     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/3a753492459df76f9fadb2c8be5cff58e034fc3a |     
  sparc64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/e2949add09cee15213c23ac80a3c8e901842b354 |     
 aarch64_be  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/cecf7ab0829c1af176e683ea8546cb40b51a4ba2 |     
    i686     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/24ed98eaa0c6d28f9f0ae89ddd1e17d9d3dd6146 |     
  sparc64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/7e570c675e85a900f040b960cf5a223e2c7d2c5e |     
   x86_64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/e521a5021c4e923607bd64fbadfdf84a8c00d3db |     
powerpc64le  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/218aacadfc34f33d4ea2c7359bcd59e10257f57a |     
  aarch64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/f7476d1e5c200c7699bc73488ab99adc73477ae1 |     
   x86_64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/02b30438e83b4824544e8c8a130fa4151e0ffd82 |     
   mipsel    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/531abcb66194f8ce02244a0527c13517a1099ad2 |     
 powerpc64   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/1ddd51c17937ca96f743735fd7ab4ab1cac19776 |     
powerpc64le  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/392082205ed5467094064b7c43b2881720fa74c2 |     
 microblaze  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/f747673cabe52feaa2d9a4812275487eec8c7a51 |     
   mipsel    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/314b0c9f495fc8f525be67a82c8c9ab2d9be5fef |     
   sparc     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/a37471ec9f2de0f1c1c8e2c19fb942b09ee243b5 |     
   armeb     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/e81b3be204d1e6c0fa1fde623d03b08f9a5b5325 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/79d68cd53ee1a060e84a3581ecad5dce2a76ac7e |     
    or1k     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2d78e2444a500bf44b9ce0034e0769e84eeda856 |     
    sh4a     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/df4b05c69ddfc7b1d6e88077e3697a21ae4163ff |     
 microblaze  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1a1d7a45e5ed5c1262cfa13b865d956a89a13347 |     
   s390x     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/6f7460cc72c0a6d1256ab3502fa64548a6ab3d88 |     
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/9a639ad60db085d2b4e34e81971b9dbc9f88df2b |     
 powerpc64   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3fb0ecbd52b3e181fe4e89c6aed0b297d9531090 |     
 microblaze  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0ca7ae641626343712503add7cbd2f48b44ffe4c |     
    sh4      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/48c051ac3245e285a43924594da25f0677975e11 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
