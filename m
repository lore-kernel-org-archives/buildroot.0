Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26C0C43602
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 03:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BADB980F2B;
	Tue,  7 Jul 2026 03:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyNYSCpcrHQ2; Tue,  7 Jul 2026 03:28:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F21280ECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783394922;
	bh=fqOVYR6uRsgGvV4LzY0ugkBzb10qkt/XwomPWRc/pUM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KPdV9keXEchBagDdE7OhBw0ZC8FlnO28xizaHAbkRPtHVxcWUW0BKJnUZCENpyL8h
	 aV+qwN4mWwkQoXJZpljao2AlMrkx282v0bO57FATiVHRgtooihupeoU1fpcnzA+Jyl
	 Umk4pdiOCIrQzDQMZUuUZ/IAhrbW7upQrmffKZDj85aafH4wwFZslKsq1DsxBJ8gh9
	 5i9PdewxpXdTNIbxEStmUJD3c1O+A/5A/ntzFzKYdYbgBKwE/oSsBUVD6HzDzkSHRs
	 xLcUtobaIDGHBai3DzPoGmmbC2dybipIsMbrVDZUw6YvLL6Qam3ifGCJZPA992JFH+
	 iKyFQdYCTZDlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F21280ECF;
	Tue,  7 Jul 2026 03:28:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5012C315
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 03:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35B1C40087
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 03:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgYHZwhzgGz4 for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 03:28:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5146A40064
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5146A40064
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5146A40064
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 03:28:39 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-475417f010dso1994573f8f.2
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 20:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783394917; x=1783999717;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pUzOAZAN3kntMyAgr6GD7jiVW9EU8Vyb/z3dNSdcclc=;
 b=S/MeTbajLZI7r/pmJl7uDdAjfzVCvtHMNH3/z1eCqY9nLtzwYWcQwrSo2E2rYItOZb
 uhz1/WVTtGuNyx5cx3AUgJ7GSecxpo7E5nH7P1XyZ0tWkpFpGfWRz+pjZbloEo3579O8
 UIC+g4MC0sUvqBUn1DSAb+B+OP154AhyTrjV1ZD4iLkwdjrHu8ScDXA7h2Z5LPGV5UPd
 ZYHiCh/yXEOHC/oG9kV8KAiJXjU40AhWMv1SYpFr4aueeixJA5xcTsFfQhGLFPfXJuc3
 PHoef45ulyNKZeYqCe7qEXB1TdFw3nUKxTq000DLj3ZoEqbiZrMXvzi+FZ0sADAgbgON
 nj6w==
X-Gm-Message-State: AOJu0YwZjnzFOU/bWSV2zj0lw7PBLsSsam7pXhHpDZzZJkyHyVz9JCML
 qUa/eJwkGwXzjNYFCBrkGxoXuWBCMHs7AtJLNMUux7lwsd/XTRmIh0Vxq6w1R1NZ
X-Gm-Gg: AfdE7cmFAJWrE/gO0zY1CMPHzd0sbE4BLjK56r+dLxq0fQMk089B/DGcktB5IlqWPAx
 OI+n42K9pRKfhY2n72+7KRCjJSsptiewOS5/2oGd3v/dcxrBUGvfsvo0gC9SpIMpmdsHrZAzwt9
 GVGpsDxGID44olG8dRQBPo3oEGQmlma9gFZYW7GB/F3YCHDZ4o1iudklnhp7XcSl7q42Kc74Udj
 ycUe3DjlUWzTkrhNEA2UYEBlUgqzgkWE86QPT8VXXdJZftqPIRBQKQyalRjpx+ZxYriwOB7Pnjv
 tMPEhyYo/GiAOqhoY6o3aGNbO1G6O0cwIddVoScQhguAcO49nH0HQ52itO6Ej1FoLxGxmj8HsdH
 KKgDifGKnsr3UUSEAZelaJLE9SQ3ZTBbWOq87vOIL8hpgmy3+u4DQ1QVHSTeS1qOAd7DY1UGzag
 hyiqbpTDtPJShFWPimaevs5V5eaQ==
X-Received: by 2002:a5d:4801:0:b0:473:53b7:e390 with SMTP id
 ffacd0b85a97d-47de666b175mr2501478f8f.11.1783394916816; 
 Mon, 06 Jul 2026 20:28:36 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039afacsm28364102f8f.19.2026.07.06.20.28.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 20:28:36 -0700 (PDT)
Message-ID: <6a4c7264.d87903e8.1f05cf.b7b9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 07 Jul 2026 03:28:36 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783394917; x=1783999717; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pUzOAZAN3kntMyAgr6GD7jiVW9EU8Vyb/z3dNSdcclc=;
 b=CDCWTp8gqCPTKFM/RUE/q7Cdo2A3jtZ1kR6Uh0puhgb9ipoDjzI068rDVcPZLfh6mG
 vuTZ6MKS0lST65MaPdxteQzPMhdlqGsyHlAvBZkRrsUbIE0LhMeD/6CPZQmdN8kv9wIX
 JFzR6LU7MYSbWSnPjXLsQ8ykIGkYIEjBs5ePDN06uNrMLw15+1AbMMFpjqwJQhBwHpt8
 RIOqPz9otM6aK6vCbckWmFp22uET9GCuDFzYEDLEl2MXovq7O9k+j18Vlw/WoUHRIJor
 XC/6qbveys8VaCuWZnf5T7c1VkeA4zkacDikB7VYiYzKFcg/R/0b5YxMCB0kRvrPVr7K
 g67A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=CDCWTp8g
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-06
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

Autobuild statistics for 2026-07-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  3  |  0  |  6  |
  2026.02.x  |  0  |  2  |  0  |  2  |
  2026.05.x  |  1  |  2  |  0  |  3  |
    master   | 39  | 162 |  0  | 201 |

Classification of failures by reason for master
-----------------------------------------------

                 host-tar-1.35 | 14
                    fmt-12.2.0 | 12
host-gobject-introspection-... | 10
              host-pahole-1.28 | 7 
             alsa-lib-1.2.16.1 | 5 
                   perl-5.42.2 | 4 
               host-dracut-110 | 3 
              host-guile-3.0.9 | 3 
                host-odb-2.4.0 | 3 
host-vboot-utils-7dfa482d6a... | 3 
                   linux-tools | 3 
   openvmtools-11.3.5-18557794 | 3 
                 uclibc-1.0.58 | 3 
amazon-ecr-credential-helpe... | 2 
                  ffmpeg-6.1.5 | 2 
                     gdbm-1.26 | 2 
  gobject-introspection-1.84.0 | 2 
            host-go-src-1.26.3 | 2 
      libabseil-cpp-20260107.1 | 2 
                   linux-7.1.3 | 2 
                    olsr-0.9.8 | 2 
                 pixman-0.46.4 | 2 
rtl8189fs-876e627a5b6a80217... | 2 
                 systemd-258.7 | 2 
              tailscale-1.78.1 | 2 
               tcf-agent-1.8.0 | 2 
uhttpd-15346de8d3ba42200249... | 2 
ulog-0389d243352255f6182326... | 2 
            18xx-ti-utils-R8.8 | 1 
                   bash-5.2.37 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                   bird-2.15.1 | 1 
          cloudflared-2025.8.1 | 1 
               collectd-5.12.0 | 1 
              containerd-2.0.7 | 1 
                   dante-1.4.4 | 1 
                easydbus-0.1.0 | 1 
        edk2-edk2-stable202602 | 1 
              erlang-26.2.5.15 | 1 
              execline-2.9.6.1 | 1 
                    frr-10.5.4 | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
            gdk-pixbuf-2.42.12 | 1 
                    grub2-2.14 | 1 
                     gzip-1.14 | 1 
               host-attr-2.5.2 | 1 
            host-binutils-2.44 | 1 
          host-binutils-2.45.1 | 1 
              host-bison-3.8.2 | 1 
           host-coreutils-9.10 | 1 
         host-opkg-utils-0.7.0 | 1 
                   i2pd-2.59.0 | 1 
                  iozone-3.508 | 1 
libdill-32d0e8b733416208e04... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libfutils-c326ce0cc2a735438... | 1 
                   libidn-1.43 | 1 
                 libjxl-0.11.2 | 1 
           libmicrohttpd-1.0.5 | 1 
                  libnfs-6.0.2 | 1 
                  libnss-3.125 | 1 
              libopenssl-3.6.3 | 1 
                libressl-3.9.2 | 1 
     linux-5.10.254-cip72-rt32 | 1 
               linux-pam-1.7.2 | 1 
        ltp-testsuite-20260529 | 1 
                  ltrace-0.8.1 | 1 
          lua-cqueues-20200726 | 1 
          lua-lunix-20220331-1 | 1 
            minizip-zlib-1.3.1 | 1 
                    musl-1.2.6 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
               openblas-0.3.33 | 1 
            optee-client-4.9.0 | 1 
               pcsc-lite-2.1.0 | 1 
               pulseaudio-17.0 | 1 
                 rtl_433-25.02 | 1 
                 sqlite-3.53.3 | 1 
                  stunnel-5.78 | 1 
             superiotool-24.05 | 1 
                  sysprof-49.0 | 1 
                    szip-2.1.1 | 1 
               tcpreplay-4.5.2 | 1 
toolchain-external-bootlin-... | 1 
                       unknown | 1 
                     wine-11.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/58f812b593d5b1baf10330656ed166bee8cfd936 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/ebe820ed064286be2c615a7a3fbd043eb15be754 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/9cbb4aed32bdc228138a8e0fd2feb7415d9a6db5 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/793992497ed29cab344b865790ed6b3394f23702 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/bf7b13e86d68f88449d01c1982df5c917c4ebc61 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/f18be79baa597bed5ab6290649ea0c79adaab7cd |     
    i586     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/90d94184f04bc7c1b81f077e803dee386299e7ce | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/0fbae9d8eacaec83adedb5eacc69b35ae4e4e5ec | ORPH
    i586     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/1d184c4ea18faa30ae7cac77caed748f929c3f4e | ORPH
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/befd003dd22e2b277c30b7d4372e2afe271a06a8 |     
    or1k     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/dc57465fa3cd2d8eaf9c65c51a312726778fe2af | ORPH
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/b377cb6dc80c2da0f99fa86c709323fb431e1a47 |     
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/18b5b5290c30ff7457c180f809a79cf60b2350d0 |     
    arm      |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/cc07c5fbfaa771424b7b438ff71dd8861e07b2a3 | ORPH
    arm      |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/4570ccb1588eb5ff2b477036df86dc39193d08c4 |     
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/096d7eb6b37e6a0c376057744b1b2fc0fd0d8559 | ORPH
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/66cdbaaa150a720a861a5d3df7a0e6998b31c7ee |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/201f8eb62f129fc561f7d6dbdb2d0ccd96f7f976 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/e0661f8cdf16c898bcf51b64ced97e195767674d |     
    i686     |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/913ad06ac8be2c71a11eff4ca3b92f862d4d0218 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/4b40df0ed9455ca396c17cb9ead4b7520159f8f2 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/64cefd61c42f2027a5fc0d4197272946ac986cd6 |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/030b4d4e21c8569bf68981950ddfb67f3600ddcf |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/cf64beeb7621db217be19fb02d06ad0381073ce8 |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/49572376c46110f2133b63ea6e6d6f240dd47084 |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/dc418861aad682a328abfe6fdb15111ac821e9af |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/8350d046c006b241fbf60aa2c1b872cb52a0f351 |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/8d0704b7e32b6cee77a5288316d6b1934e27f65d |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/3ecd58603d7b49fda76b40db0872672622ee2d2b |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/888cd7887958af3da75964c205cc31cf375f14df |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/a827dcafe9bf2488587d2f5b9bd901d0580218e2 |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/db7ef2eba4095ad60ff072562e16db749ef896d2 |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/77fdac00329c76baffffc836c6735ee55d2a6bad |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/d5330b5a9f174ce75a3a2df8d11d563edbfe3377 |     
    arm      |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/6f9a6886b61ead03d8de0ffa13fcdbb482387a04 |     
 powerpc64   | fs/ext2/ext2.mk:65: /home/a... | NOK | https://autobuild.buildroot.org/results/ec0fd8c80ebca3e44930c8873e51b1447e1a98e2 |     
powerpc64le  |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/567b9e0e11dcfc9fe73199cbd69b5cbf56ff160c | ORPH
    i686     |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/c23fc5a3a15fca0123dfe3c9743d85b13fa16086 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/209fac8f47a0046c7292e6fa196203080697530a | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7b5f786639596d86e74bf4dec1e149b36cd9fa15 | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/eb42329fa0cfda9a75efb59645f8990e1f291912 | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/7a7702cc0a9acc4efadfb3955a5a598719b6a8c5 |     
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/f714ce719a955bc7259cb671398a33c9c652e75e | ORPH
  riscv64    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/ec12e6bff6d4b9e288af73f2d355e1d91400d0d4 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/2a509ecc51f85a200ebb676c7674d2febf33345b |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/f45252a18fbccc5ca501ad9063f5ed8f69ef4ce2 |     
    i686     |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/1e6ffbf9be609b84eb135fb2756122f232ef6b34 | ORPH
    arm      |      host-coreutils-9.10       | NOK | https://autobuild.buildroot.org/results/7e36861e5607a0b2beb8a4879dc70bd828f41169 | ORPH
    arm      |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/a66addd3cbd73a62b6456270b1cd29cb883b2124 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/f4a06d9dfc7b1452ed6f6aba16cfe51f708aae9f |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/a974706f6ac777f5c515fa54a583a3863840977f |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/b6b2480cff1ad111afe3e1cda15dc6775c8185cb |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/927316603056f658d1df6ad3743b6271a98da05f |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0fc80b035d69977e6b490bda6236d833d25ef6ec | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/27219c86fc42ef81713cacde4405754c75fae733 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/64374decf51a61ce76e8ed9656888ef8e05c4294 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/db3c95d784bf6d0bcc43c1c00b327b9952c1a65b | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/effe9731b77d03276382aad427af795d8b1ad048 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f16ccbc014caf88ce0d70db395fbae118c41c2dd | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7180d873797fc9e6ce453222926fd67f7e9fbfc2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e765048fcecb39f95686f4c21945c091c9b0fd70 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/97ee05dae36490eb481137ada008774cef3f30fd | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d86d1b8d5888d0b8822736b37dee6f7a387f092a | ORPH
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/9e38809a4738573f900284fa9eb93b35c94fc958 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/e9c02dfd89dfeaa334add320ccfe0c87f0e08ff6 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/52bce3fadea7db9cc984c8a5420459dd6013156e |     
powerpc64le  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/edca2a3fe3085c2fde725c0d20c7870791f7f016 | ORPH
   armeb     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/a3792d917fd1fa06e51cac5631a47038021bdc18 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/662c57739643b1ac0f36abcb792815e8dfc353ba | ORPH
    arm      |     host-opkg-utils-0.7.0      | NOK | https://autobuild.buildroot.org/results/3318a4ca8177241843fc7f50de255a8f77bcf781 | ORPH
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/98ca4384a46a97abc6c4c2fa327176f45630f800 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/28cad1d55e4ab600b21545494ac9405c59cc836d |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/610f8b38b57afa69659e6fe8d863e96045564ee0 |     
    arm      |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/aa87d0d265dba5453deec2efdc5fa86bfcd150bc |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/028003e2a7fafdc8814207028a1bab00d932b2d6 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/3f9e800f285877b317034ef22653db215f729c67 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/c55b4b8a150421da71ff2133c631c0e165b322a0 |     
    i586     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/99065563d769815746a70422002d0128dd5b2e2d | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/feab1caa9f1b34c67c01a5a890e102471e1094b1 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/156f787690e890d3d96c51b9ef1b0ba6a303a278 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f9b488578f44c9936ae7b443f5859e4e8bad4bfd | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/908afc18ec6d4f0a0ce53bdb670700fd183e9589 | ORPH
    sh4      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6266603d0e42e3de3786ed5c00224913d17c2f08 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/315e4543c95534bbd4b62363b7468e06a560157e | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/aeac52a50bfe1a7531eeb4d15d5fb158a7cbf8aa | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d596ccb599f899b319d72d65aab535c4008eae80 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ced82d7b11cba26ebeebaa8afe440c716b594d78 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8e87aa381f6c2bafba8cd6324b7ac887baf1c72e | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3dd416a99435f82ded3b2ab6f534f3b6a984d69c | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d6a471dd47f7cbda6320543c88f4cc7420d27688 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/62e46e40d33b56e9302dfd47e5ac9c7a86c49bab | ORPH
  riscv64    | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/c3456010a8633e2cdfe2fac1075a72f61d653491 |     
   armeb     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/eb5f34d8ed4fd0fcba9092fc04e0bc51086ecdb6 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/ff7bbe7014e293abd95a5d6fcfe4ce882de0f42b |     
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/d7da49b38705d86403d373603669abd3845cf2aa |     
    i586     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/51bd1511169e288cf4abff0971b6822eee8d109f |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/a4ceb6b6bee570121de63fcbd364e11429a96d3f |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/7c7d069415ed021a79ee72de787e2850b8ab92b9 |     
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/770cb795713cf493eb53ae069dc04da158b998c6 |     
  aarch64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/e780f9dbcc34b3999d8d6c43170b5d843b183e3c | ORPH
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/ca94d4111a4660c390a7a64b18ef4b729cf5ceaa |     
    i686     |          libidn-1.43           | NOK | https://autobuild.buildroot.org/results/f706ac2fc7855a4c98a02d43c3370f17bd267977 |     
    i686     |         libjxl-0.11.2          | NOK | https://autobuild.buildroot.org/results/8852b003dcc5eca44784b4c99f3abddbd12d1255 |     
   x86_64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/4ca50e8bdf5e688025b9a3fb609718941431eaa1 |     
   sparc     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/1b1093c61f74f294d5650df1ba4b620b49644943 | ORPH
  mips64el   |          libnss-3.125          | NOK | https://autobuild.buildroot.org/results/3668caf9dc88f60feee01130d3f675431f7fbadc |     
  riscv64    |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/b06a7baf47a86d5f4554ad0690207f92c83f8ce4 | ORPH
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/0f3c5989f79f010b67499ab2048f0c845b7f71e6 | ORPH
   x86_64    |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/5fcbf3a79c808f34a8dce9b0fd8976f5db27927f | ORPH
    i686     |          linux-7.1.3           | NOK | https://autobuild.buildroot.org/results/70057fd9ad68b9415ab5491e8b0d4a70d5e1beda | ORPH
    i686     |          linux-7.1.3           | NOK | https://autobuild.buildroot.org/results/90392200d966195c98e30e4efe1d5aff7f9a0f4b | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/6cf98fca46ac0d577e5856e78c5be63c287ceb00 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/5b124a7a09859810e8b42c88fdfb1b82f3028166 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/2f5677c6301f85417cb0d6c3f659c117c266822e | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/61566e7b1af500f946f3c67b50834486ac8764bd | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/7877a3eedb8383f3848aa8ee04bda885405780a2 |     
    i686     |          ltrace-0.8.1          | NOK | https://autobuild.buildroot.org/results/b533a763a266f3af95d92680386bb4ec1cf988b8 | ORPH
    i686     |      lua-cqueues-20200726      | NOK | https://autobuild.buildroot.org/results/641b9b631f522a0bdbe9798a4f242d7451c7ab56 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/59fcce6591e3b78f6225fa630612dbb2aaffcc07 |     
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/f76732bc1140ace9b4394f2d1b0ca1fbe2c872cc |     
powerpc64le  |           musl-1.2.6           | NOK | https://autobuild.buildroot.org/results/ff74c6e9f884dbaa1fa1114875a52557f37f8b2f |     
    i686     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/7b558aa70e885b5b7c154462d341ddaa4650bbd5 |     
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/a30be87a89511fd478284dff646453390765187c | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/b073ccb036f24d6c8d1db585003df10cad93f8b5 | ORPH
  mips64el   |        openblas-0.3.33         | NOK | https://autobuild.buildroot.org/results/bc6e9a4b2855e24aedb4010da0293395a5f2db55 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/2ae77096e7e6792166eecc759aec58df1bad3e38 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/617733e925774612f9cc26d0f79b0604fbcd697f |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/032d42efe95821e1c21aac6d2adac2459423f00d |     
   sparc     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/0f4804bc5b0cee0ed1f55188e060f7d199f7deae |     
  riscv64    |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/295a583b82089f27944ccc1ed5268868e45aa13d | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/e53ff31c7c791d1b1c740e900886bd86236007fd |     
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/ccb979a8be0c2ca5da4e375721ce4e6ce38854b6 |     
    arm      |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/218c2a1d2267a42cae771b1a4629fd5cab297d22 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/363d2bf01a0846b58aeef040c49ca15b488a9483 |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/86ed30213d1c9c9ffc3e7f31c4895204686e00b4 | ORPH
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/3e42b562e32e893675e0818fd734d917f9f32d40 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/0c9e31c3f1c833829602c51ddcc929c74456e0b0 | ORPH
  powerpc    | rtl8189fs-876e627a5b6a80217... | NOK | https://autobuild.buildroot.org/results/352ffa0a70fe5e058c592bb422fb8ca89e52df22 |     
    i686     | rtl8189fs-876e627a5b6a80217... | NOK | https://autobuild.buildroot.org/results/89113b78a22d1f80a4abf72f6c8ff8790622605b |     
   s390x     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/8af5c72a4004a42d12f401bea4e8515494012aff |     
    i686     |         sqlite-3.53.3          | NOK | https://autobuild.buildroot.org/results/f1d8230fab398a81ad4db1acf896350423db4023 |     
  mips64el   |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/b785374994d7239f05a939af0d72bfe4a96c54f3 |     
    i686     |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/9993922c9d6c122731c35d53e8ab6021f2874eb3 |     
    i686     |          sysprof-49.0          | NOK | https://autobuild.buildroot.org/results/da26410639d3a50cdde7f967ba2292179885cd7d |     
powerpc64le  |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/6f7c5fe84edfb6ebc6c938f83bd2b8c650b038be |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/1066e358caed60d08930e9f4335e034d248f3342 |     
   x86_64    |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/39284ce2d858878abc6c281a3f675ef6a98d0877 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/efd094cc2954219f5d7eca7bc97b75ba65a1f9d5 |     
  riscv64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/1cd05ee1608775d65054fa8571c086ca0106f081 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/c50ea34652d1d43e55b56c251f9eb7a9467d0296 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/10da4e9f8c0b2e9b2dbe9690394fe90a4306ef73 |     
    i586     |        tcpreplay-4.5.2         | NOK | https://autobuild.buildroot.org/results/a01481c8da30e9404e1f4f3ddc444de423bb29f7 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/370e0d59eb818aba12ccd84eead2a80a51a0199d | ORPH
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/79219a64a0d326590d206879bef90b8570d829b1 |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/c8c3b18ed115ff10b267fa9efb3a38b2f80b2639 |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/342b8581a6fb6816bb45fffb25648593f4194666 |     
    or1k     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/6dcfa71dcb09581d63d717df1461b70374adbfae | ORPH
   s390x     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/1c170894e3fff2097e9f5233d7f29fa0a45b5c61 | ORPH
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/a47e3c78200c4568fe75950fd0dfb5fe693be768 |     
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/31011cd38091f11ef1e539c5095430a890f91092 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/9a3fd55ad5adb5410438958968189478b95691aa |     
    i686     |           wine-11.0            | NOK | https://autobuild.buildroot.org/results/e02589e09097d82b3d636734a8b37efe717c58ce |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

      libabseil-cpp-20260107.1 | 1 
           uboot-tools-2026.04 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/59d02a9a1d0be4638b568265186914f2e8ebaf83 |     
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/846383aeb74595e1ab73b03c81388ac316c93d42 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

            host-go-src-1.26.3 | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/038b8ad5fcd32c63daff78b41fd6e7005c0a1df7 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/4523de30eb0fd86bb8980c1cde8b52badf008ca9 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  ffmpeg-6.1.5 | 1 
        ltp-testsuite-20250130 | 1 
           oath-toolkit-2.6.12 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/6c564111e1b49fa655bd834229854ad80c05955d |     
    i586     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/1dc5598cf8ea3a874b071d4f9a1a2d85d2b8637f |     
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/c7031ae4368158b1c3bbaf1503d24671b0a17855 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
