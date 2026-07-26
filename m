Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740A4C531D0
	for <buildroot@archiver.kernel.org>; Sun, 26 Jul 2026 03:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 031D76067A;
	Sun, 26 Jul 2026 03:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5itds5fVR_TP; Sun, 26 Jul 2026 03:22:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C19760656
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785036176;
	bh=+AJoMpqlzStf4D0EQeLz74BwO+nBiMgEQdeudwLpN3E=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R29eYmVAR67yMQ0PZHATChonPL5XKgM9rc3EnYnnafpwDsUpraUkErvBPiPCEORCT
	 ascHtJ+9WclzqrEZUF+X6PmlkU6gNUJCBJYfsjIqrLGtXgtaEHOt0gIdaMOADcC/xt
	 2MfZ8IbIpbVyPu4rscQLlRKoY5rEuvLwxQjWqvXlBthIKsEukwcOBaUJmHD37Sob0t
	 RuWGkN1wv++0zggP0wMtmI6kqGQlgfojx5hLyhiYCFCUh0ONKHKQbfQeDWb3hku8+i
	 crZEoyHzY0sJ+E5NC9aED1oiUKxFJXCL1AT5/KpNfTzASEZr2sC7p7LBe1gJ4sv2aK
	 B+8JeqIBCu6tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C19760656;
	Sun, 26 Jul 2026 03:22:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B4993B0
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 03:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F10FC406E4
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 03:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XlEr7VTazsg7 for <buildroot@buildroot.org>;
 Sun, 26 Jul 2026 03:22:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D4D14406E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4D14406E3
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4D14406E3
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 03:22:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-47362928f65so1495299f8f.2
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 20:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785036170; x=1785640970;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=+32FLpoUDbVPhf2UlumYHHf56lUOq2OqSycVrP708yc=;
 b=YU47ebm+khPTdSDnL4NxIhMgl7IbIfm1F0avNuNBCUlQziTMjaGbbIO85Rvr++SUwD
 0bdNhBOd24aWp5P6z4a5tEvGIq2f5X4mOgzKNY/RiHmcBH6nNk2i9xY40J9g1Y+7Mv7k
 asHa1CtqnOaQdnv2LVzLcXyxylb3BLwFtkE+JOZ1lbUp11agwW72jHFB/NcaPMHEkfOg
 6qs6VjR/uBGIMjYAKhopO4LVvILYswMxG52NV063icvs4SbOw2AsPdS1GPVSQQtRhmU1
 gcal4DVs8eXke+0m8SzkJjDb7Jz0hcllQ4z4nqCkdmvyFA9MddiAz7Uo9K4G5XLx7irR
 WBcw==
X-Gm-Message-State: AOJu0YxyzWfxNx2+IqyNPoao8BrOWZIm8zg10GhHWqh02dlJSZXrWO2D
 JvOmk8/GVmIseNeCmbzhZKUaQrzkL+SuwBDYE3edE1ulZTLKSmpnNZivqPFKf4J0
X-Gm-Gg: AR+sD12XhvEqMaGtubpALkaPYZVWy5ro8tcfPa3GLwEWbpLiebqYDBb0mthOov8ylpY
 2SAtSaTPfddk8n912yJe8hyrScpx1JWzMZnsKcNUyd8sM/50gO8XrrWhhXVOqbTEQk4oDMg2Xwy
 5n4LUnB4m3/oDHlSxoDlzKMGpq5vwUtj8h2tMlYKpEFk9iXCqAtFiqzTg66PFuAe0e7t5PCaHty
 4iVmXDCJw7Uv2t6ic4//baSzALWzsVKveCoRYIJBadyc+3R6eTIbgeFL+VtQASYltLxeDQjwBm5
 3Mw5IEU9/k9z31y2YuUNY4AX6gwphR25N3Q4rEh08j8e85Y8v3HZKWJ4qGfxrADDAS70RNq9HgJ
 yNZLVtrx6W/90dwWrJn0B77O3/+hpPrnzKDK8/Y1Mz9pumGDIJHvhJ6aNNsaGrdTE71XLx6LSmn
 0H52bQ
X-Received: by 2002:a05:6000:18a8:b0:47f:776f:3845 with SMTP id
 ffacd0b85a97d-47f9fc8a4c9mr4707352f8f.7.1785036170131; 
 Sat, 25 Jul 2026 20:22:50 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c63bd3sm36320527f8f.27.2026.07.25.20.22.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2026 20:22:49 -0700 (PDT)
Message-ID: <6a657d89.b251136a.1b7537.b4fa@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 26 Jul 2026 03:22:49 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785036170; x=1785640970; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+32FLpoUDbVPhf2UlumYHHf56lUOq2OqSycVrP708yc=;
 b=GXbRXBz3U3IsjrY+QTWgsrbULIYsCDwBH3dZ89CmPapbhPd5ULNPK8ufe3+pAqw20u
 1wGYxI19TJ+oOUalEYVH1FFqYGJy7ab57XKD/nzBtaXDpVDYxp876mnRa/cgc2OdupCs
 3YRBf8RvXdRaM9uSOWQclOFBSDTZaetRaX0nVmki1b4jR3eB1VTU4oPi1ZTaCc44J0sG
 oOk8q8OVT1qZ8WtQv+hZy9iMTHbRkD79mKy6MCnO8uDwon+4W/aXdmtQ2joVbTaaprs5
 NQmcfaZprbAHfZEuxnsSVa/W1y+/ngt8I0T91+r4o5NNzEkLn5SOQKRr/HNPrzB2XhBu
 7r6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GXbRXBz3
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-25
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

Autobuild statistics for 2026-07-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  0  |  8  |  0  |  8  |
  2026.02.x  |  1  |  3  |  0  |  4  |
  2026.05.x  |  2  |  3  |  0  |  5  |
    master   | 44  | 171 |  0  | 215 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 27
            host-binutils-2.44 | 5 
               host-dracut-111 | 5 
                host-odb-2.4.0 | 5 
  gobject-introspection-1.84.0 | 3 
          host-binutils-2.45.1 | 3 
              jpeg-turbo-3.2.0 | 3 
        ltp-testsuite-20260529 | 3 
                    olsr-0.9.8 | 3 
python-remi-2022.7.27-37-g1... | 3 
             alsa-lib-1.2.16.1 | 2 
                    attr-2.6.0 | 2 
             dahdi-linux-3.3.0 | 2 
        edk2-edk2-stable202602 | 2 
                    grub2-2.14 | 2 
host-google-breakpad-f49c2f... | 2 
              host-rust-1.97.0 | 2 
                  iozone-3.508 | 2 
      libabseil-cpp-20260107.1 | 2 
               libepoxy-1.5.10 | 2 
                libglvnd-1.7.0 | 2 
                    lua-ev-1.5 | 2 
      passt-2025_06_11.0293c6f | 2 
               pulseaudio-17.0 | 2 
                 rtl_433-25.02 | 2 
                 systemd-258.7 | 2 
           uboot-tools-2026.04 | 2 
uhttpd-15346de8d3ba42200249... | 2 
                       unknown | 2 
            18xx-ti-utils-R8.8 | 1 
                   aumix-2.9.1 | 1 
                    ccid-1.5.2 | 1 
                   ccrypt-1.11 | 1 
          cloudflared-2026.6.1 | 1 
                     crun-1.24 | 1 
                   dante-1.4.4 | 1 
  distribution-registry-v3.0.0 | 1 
      docker-cli-buildx-0.25.0 | 1 
docker-credential-acr-env-0... | 1 
                    emlog-0.70 | 1 
                enscript-1.6.6 | 1 
                    fcft-3.3.2 | 1 
                  ffmpeg-6.1.5 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
              fstrcmp-0.7.D001 | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.43-45-gdae425b55420... | 1 
               gocryptfs-2.3.2 | 1 
         graphicsmagick-1.3.46 | 1 
                   gvfs-1.57.2 | 1 
                     gzip-1.14 | 1 
host-am335x-pru-package-5f3... | 1 
              host-bison-3.8.2 | 1 
    host-gcc-bare-metal-16.1.0 | 1 
host-gcc-initial-arc-2024.1... | 1 
          host-gptfdisk-1.0.10 | 1 
    host-mender-artifact-4.2.0 | 1 
           host-openocd-0.12.0 | 1 
                      icu-78.2 | 1 
                ipmiutil-3.1.9 | 1 
                     kbd-2.9.0 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
                libdaemon-0.14 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libfutils-c326ce0cc2a735438... | 1 
                libmpeg2-0.5.1 | 1 
                  libnfs-6.0.2 | 1 
              libsodium-1.0.22 | 1 
                libsoup3-3.6.6 | 1 
                 libsoxr-0.1.3 | 1 
libuci-f3fc0b76040685829191... | 1 
               lightning-2.2.3 | 1 
                   linux-7.1.5 | 1 
               linux-pam-1.7.2 | 1 
                   ncftp-3.3.0 | 1 
                    ncmpc-0.52 | 1 
        network-manager-1.56.0 | 1 
            nodejs-src-22.22.0 | 1 
                  ntp-4.2.8p18 | 1 
                 openmpi-4.1.8 | 1 
                openssh-10.4p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   perl-5.42.2 | 1 
                     php-8.5.8 | 1 
             pptp-linux-1.10.0 | 1 
                  prboom-2.5.0 | 1 
            python-iwlib-1.7.0 | 1 
   python-pydantic-core-2.46.3 | 1 
        python-selenium-4.39.0 | 1 
               read-edid-3.0.2 | 1 
                   redis-8.8.0 | 1 
                 rtptools-1.22 | 1 
              shellinabox-2.20 | 1 
                stm32flash-0.7 | 1 
                  stunnel-5.78 | 1 
              tailscale-1.78.1 | 1 
               tcf-agent-1.8.0 | 1 
               trousers-0.3.15 | 1 
                 uclibc-1.0.58 | 1 
                   uhd-4.9.0.1 | 1 
           virglrenderer-1.3.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/607924027852b129180877502c9dbb6245eaf0fa |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/836ba5b142479095f60b1edd992948fdaa1da72f |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/7d318ce905953dbbca6bff4223713dcb7430f0fa |     
powerpc64le  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/bbc114f04dac3aba520d488dc142d51707287249 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/78253ad29da06b51c25a08e271445da24d5491ba |     
    i686     |          aumix-2.9.1           | NOK | https://autobuild.buildroot.org/results/ed49994c2acfcba725c0bab3670266d217478286 | ORPH
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/2ef72b621e6d55c5cb15e6d32a83ed4676e49772 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/43795f77eb0a7620acbb09d70f3db6d4d1891261 | ORPH
    i586     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/f599b40fe74ee888b90c8d43882914a4d4496166 |     
    i686     |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/29a373b8de73aeaf71f262e54d92f2ebd290b759 |     
  riscv64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e61c1e59617c0ce63ef684897a336b462765821d | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/74726f189ca09160679976b51e82e5a4f3fcf2af | ORPH
    sh4      |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/779ab8f18f95a232716966bccf64c87790a1b633 | ORPH
  riscv64    |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/582763a1faa1cb60dfe955c85bd5222cd81e94c7 | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/6106e36f05587b056a63858bd9e39d511d3685ad | ORPH
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/7731525c58cc6658292c9fb043c0590135bb0339 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/cdd8625867148c09cca6fc563164d28d1c069ca2 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/c8f98178aa5344781a4ac863c6577440366048cc |     
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/1bbbf933161145948a0bb06ae030336cc400af3e |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/02ccd55ed03478bb272304e578fdd8ba7ba60b27 | ORPH
    arm      |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/2e9a391d6990c76b51e10896397cdd0dba63fadb | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/7acaa9575ad42de828084c413c07c540fe2cdae1 |     
    i686     | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/c28c8f53b103fbdb46eb4fb032eb7e7acdd0e3e7 |     
    i586     |        fstrcmp-0.7.D001        | NOK | https://autobuild.buildroot.org/results/aacd57f0dfc726ac3779abffd8fe453542e4e836 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/0881a0b1db1a13937937b72ae729fb2c07c1d67d | ORPH
    i686     | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/6f508f718f3e3e92c09d92b2928a87398b5748fd |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/298a5e02fbfd208182e3211e9e481af786df8566 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/77108b0267b5e8b37ee6955fa2bfd0faab4b2e6d | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f189da8e9726a5f769819a1ecb3e5fc80aaeeba8 | ORPH
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/d5550b3145c4a1ea510a6f7233c0447f4b31ac40 |     
powerpc64le  |     graphicsmagick-1.3.46      | NOK | https://autobuild.buildroot.org/results/c12ba00c8d56f60f1e65277ddb5d7a8893801f27 |     
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/432f8e0c6b3390151df6c1cb8deeb1232f42d8c6 |     
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/f72bd51a4d5b7e2b3ef93e4a83be446a04541611 |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/fbbd54b0705adaf8fdae79addd9d279b91de6840 | ORPH
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/f4d8ce497d4f80e957f5d6cfde18fddf741748b7 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/bdcd2e74d514a681e7a375ab0d9aabc5db792075 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/6b120c2eb9c731a327c0d2ad450416bcc4501990 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/95da58b7552a782f0891ef5519508cea9a4d0f77 |     
    i586     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/fca341f5dcf0f012da9bc5309b77c3129ecbcf3b |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/5e183d1e5973f37cd3365773579984d3edf9b121 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/69c9822dda4779f2e796da60fa144ea3ff37b758 |     
    i586     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/010391806d772e26736a1cc67f1d341ca93e4e17 |     
  riscv64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/80ff9ed79b48faa9fc93178a8226fe25538e4b3b |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/e8c98c1d0359001d734d8e4e9b2af4f9cd3e0203 |     
    arm      |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/e16a9bdac3443366ee4152a076d68d242cf3082c | ORPH
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/93af1eee68ed9df7b34d035e2fe2b77e2a6d4a98 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/31957c1e2292a073541cf9dc0cc31417790efe73 |     
  aarch64    |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/af7aa60f4d3553ea768fd9efd7414d534856a012 |     
powerpc64le  |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/9f08ce35a197ea5a242ba59c8317a4787ea85cb2 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/126c29f8cf22dbcd9cd8032e9ce96a9acaf861f9 |     
    i686     |   host-gcc-bare-metal-16.1.0   | NOK | https://autobuild.buildroot.org/results/5a83a81a47cbff285f7a6a8dfd8964b0351fcec6 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/8b284b9318cbd45677a3e33f7e0be076549aa2a9 |     
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d4561c93b6cf75ee7fe2e8f707e912cd928509b6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fb4096d003e4f1e6eee11ecbcc0b810035a12111 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2db2a586e4045e7d9d9e8679b8f4a72397f124f4 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e98c66dc6587ce6bf8a645bb7adee2dd3eb91a3b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/775c25fd3d71a21e63aff894c75d4d5d9bd881c7 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/46ea64d7fe1bdb3bc09c0241151b33e6bfd06a3c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cf94ffca41f62aff902fee6d863b30113c9f9320 | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1345bec52e71eed3e8417ce1740f3cd33c819f04 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/63cd16e94fb3006e40230daf33f921aee2286efe | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f186c16453d451266150e5c81b548e31703f3489 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/90d5040ea96fa641d1d50510e40ad471c4d8b810 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ea1fd661064b9bff661544505f2f6ece5a6c8a89 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/48f044943ada9084b067c925dbf098f042d100f8 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/48ea558442f571c2109af3609fc334e12b64e309 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6141a9148d68cc762258d47f139e60952729e3c2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c3f9209804b8cb829d0f9e8024a29d087cbb16a1 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/01245c1b2e97f970eec17e0daaa6d11c0712bdc2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/28646f10d9c7eb71d7be051e68bbd2e5cb4d3dc0 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c6fc00fa1faa963ccbfd4be6c68a5834cca7e81b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c1058011729b92ce47dde1e233a3bb5261222fdf | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ed95e9c5c35ce42e4061d4f986d6da849243ba23 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/13e6c2866eb92ad55402ab53bd4a23db95711602 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c15889ace53a9e89106280ecc91299f9f71380d8 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1011a1d4347e5e635896f2c3f8df9e395e121a5a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/02a79a76b29c337c9dbfb1543bf54c0c4813030a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7dad1f24facfc4a6f9fb3937a2c29acada233975 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b30e88f3d306c2670b83dd0eef426e5aa07910bf | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/2ed6fb97b9daf01751858afb679bcc23e479b2ad |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/3498c1d67a168c89a760cc352950944d81502bbc |     
    i686     |      host-gptfdisk-1.0.10      | NOK | https://autobuild.buildroot.org/results/e6b48fdaf65e49882ad0c1a4d55f5c4a6936bc67 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/a6644303efcdc85f0cdcd4d8c8e905075221c641 |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/9942298f29f97d674a5a930accd3f9102dba5535 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/efc96b9c0b2416c9051235fb7c6511cdbf47f604 | ORPH
    i586     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/5695aeb9f9f593a88845d984d3e4df928084db9b | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/a06e6a27f1e25013502e2cbaedb10763d0a72e9a | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/dcc24f6b242efa6d2e0e687b899e58c3920edabe | ORPH
    i686     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/051d97d055d22532d72df123daa5c0ffe327ebaa | ORPH
   x86_64    |        host-rust-1.97.0        | NOK | https://autobuild.buildroot.org/results/a0b8f9b17d267501a8d188e50f06144ee0f93bfc |     
   x86_64    |        host-rust-1.97.0        | NOK | https://autobuild.buildroot.org/results/6fae992848860834c84663633d70b6ab961db61e |     
    i686     |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/7b280c61716e85128410dc0b4d0be5cf7d07e7f5 | ORPH
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/80742b461af3fbce6f1759489d60f52321f9b6bf |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/e9cebc2ca6ce947565c956d23b61ae091ea62302 |     
    i686     |         ipmiutil-3.1.9         | NOK | https://autobuild.buildroot.org/results/5baccce3637aa06b1bf372ff4178087974844110 | ORPH
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/ada60d3d936991c0e29beefe2e8def0cca4a1daa |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/499f9e8ef9c621c29059810a9dd3ebb9aac2c1ed |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/b37ed087aadb24ac68a4b0367481fabb1a094233 |     
    i586     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/2e50ce0df12439e0e5a5f1c5ebf77b8045f79d3f | ORPH
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/31d0f9af18040bcb73afb8e3a14cdadcaee2125f | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/7c494ef4dfea2db166d2f3b092e28365d168ee6b |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/59537327f7fb133534dae47f837501b28bd89a14 |     
    arm      |         libdaemon-0.14         | NOK | https://autobuild.buildroot.org/results/fc11020d4cc2de325a2fa313be087562801642c4 | ORPH
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/2df0ad18fa59a8f1ec2c09ce4b60c0c0c50aad15 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/d1190b5b410c97845778e33407c83713a008fef1 |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/bfc0642f7656b15e61f1cce83a4961342da12f02 | ORPH
  aarch64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/adff32e603306c7f85cc0c0756294f41668f006b |     
    i686     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/9faf99025bba47a42d97a414b552a8e61e837694 | ORPH
    i586     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/00d59e4da06b3d0bc8c52fb0d9a115e72d34df3a | ORPH
    arm      |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/79ccedf9cb3f1581736eae4c0f70148e685f2a57 | ORPH
    arm      |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/1bf77a9e78570e51d836a5ecb8c88f0477e2a768 | ORPH
   mipsel    |        libsodium-1.0.22        | NOK | https://autobuild.buildroot.org/results/2acaa1ba57e704179c9ca3a3442913a19c08cb28 |     
  mips64el   |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/b600ee7248b24d95621bebe556ad5abf76e0199a |     
    i686     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/30ca6de77d74d1080bf82dc970c271fbcbdd9d70 |     
    i686     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/284d5e1fb7c0934c2f5ff3f6b7cc80765f8c1d02 |     
    i686     |        lightning-2.2.3         | NOK | https://autobuild.buildroot.org/results/4ae0a5cbd4748a8a233520de757e0b79b8eafd56 |     
    i686     |          linux-7.1.5           | NOK | https://autobuild.buildroot.org/results/55c9fc1454be9bd68cd756a8122fe9f1c6fd7e2a | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/15accadc5520bd518bfc918af7b5d3e261372735 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/706a31a48a86dbd9fa7c2f6af21f2bca84ee2c7f |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/d04ab0bbf4c6e44c9ee407b49d145a10b77f7343 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/08af53dde105aef8516d879415b9c3ca88959642 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/2b16718048f7393d84e4112a4ff4525f07275cac |     
    i586     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/c013a92fa7c44d2cdca19839f88ac0f0de3c1e40 |     
   x86_64    |          ncftp-3.3.0           | NOK | https://autobuild.buildroot.org/results/f08a1ac0595e40b3c0f79f0b7c426fa976a4b8b9 |     
    i686     |           ncmpc-0.52           | NOK | https://autobuild.buildroot.org/results/29b948246c0317f46f55a5ac2de9d77a75288156 |     
    i686     |     network-manager-1.56.0     | NOK | https://autobuild.buildroot.org/results/9fede6154b25e9792b953abc7c73519efeebfdaa | ORPH
    i686     |       nodejs-src-22.22.0       | NOK | https://autobuild.buildroot.org/results/30108df94b8474d6dc66f0d6be9af70db5dcb342 |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/6f6b5acd1acce05129663fbc15e02629d194f700 |     
   x86_64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/cd2019508e357dfb05aaca3d96ad26a084035bd9 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/8c20cdbb60d59aff3a00661b0b5aad5be4c30f12 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/b9ed02815719b47e2936a32e0cbb53de9d2cac40 | ORPH
  mips64el   |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/d719bc0f10ce87862d6b1f63872155ddfbf938fb |     
    i586     |         openssh-10.4p1         | NOK | https://autobuild.buildroot.org/results/99b824157166c22d023ff6edbf06c041eb62931f | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/7f0de8362ea0ce8259d327bc1cd5a1f7f6045fe8 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/71fbf818a2148be32f6df40c35bb3c2062c5fdf8 | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/9a148f17fe940f485dff47f17ce7ff48a0e24fdf | ORPH
   x86_64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/245585943d038fb84ac068d3e910fde1c74d86e4 |     
    i686     |           php-8.5.8            | NOK | https://autobuild.buildroot.org/results/12a2edcf510a2fd3a995b4a446d9c9fa5be1ac6a |     
  mips64el   |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/c07683f8ec7c75def0682231c835637bd31b0971 | ORPH
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/738beb8b71b54e1b0227dd852d6d27554682268b | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/fa013e6d6024519e34436cb9ad05314b170c3b22 | ORPH
    i586     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/39d2d66331a31e1f22fe107cfb891ee3c0100b47 | ORPH
 powerpc64   |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/2543c1abecf99e64c97af3a0cc1fe357cf0b41be |     
    i586     |  python-pydantic-core-2.46.3   | NOK | https://autobuild.buildroot.org/results/bc106e5512ce5aff61e7643f84e5bd0ab18c793f |     
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/63744a8562ea70b117feeea6b88befc1358c4cec |     
  riscv64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/e1dc06b2436843e7e7166c877179faa636c629b2 |     
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/fa1642e9d0fa824b442ebfa6042cb4bb62337dc0 |     
    i586     |     python-selenium-4.39.0     | NOK | https://autobuild.buildroot.org/results/c69e4713f599cbaed8021a3c4b5abb899f10919f |     
    i586     |        read-edid-3.0.2         | NOK | https://autobuild.buildroot.org/results/2fc79d219d4fa63947bdfa63b53135c4092e339d | ORPH
    i686     |          redis-8.8.0           | NOK | https://autobuild.buildroot.org/results/2090691967cf64eda3d375ec49eef513b02c860a |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/7927490f430378512778e32c1297d4845f7639b4 |     
powerpc64le  |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/509e8f005d94db06739a50c20945057f5b7e13ea |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/e5f33fe5a38a72a6f9e4fbabfaa92ecf5ac9e3a6 | ORPH
powerpc64le  |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/7758f3341e688f7079e12c82d13ff0d8cc695ed9 |     
    i686     |         stm32flash-0.7         | NOK | https://autobuild.buildroot.org/results/6617eccbec14ed753b3e491491c05201cac6445c |     
   x86_64    |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/4ba5eead5899346f7a0c6f4f679bce847a913320 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/dc140f2e4450e1cc103211e14401d07051d23423 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/bb2d6f65be399ab136d1f458327859d0a85aaaae |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/f082cb857fca20f36f8ff8e8c6443f2074fcaaf6 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/764b57c03c7b901a6fe12e312a9fbc5d81656055 |     
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/8d82d945723187db7d5f84769773be9220ef2ead |     
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/1f0d005b7c12349eaf3d0272367068251af8f873 | ORPH
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/da2e6f2b269c2860de58638fe0ad8ab9e6753fb6 | ORPH
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/31c298c73e997c559dd15137372319ee0edacaa0 |     
    i686     |          uhd-4.9.0.1           | NOK | https://autobuild.buildroot.org/results/ec37c10dda4083ab1e2193bfced09cdf7762e058 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/cfd7b903738b4194d539ed1330a4d743002ecf2a | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/7853bce9edf964cdce8cc4a8fe4faef89de625f8 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/11f1ee4ceba0a1a0f86492376fe60ddb9849d4e2 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1854f677987683379230568db4184c35ccd41cce |     
   x86_64    |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/0f85d8fbb48d3a14e013fd3212e67c71c5de13fd |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/7e11e731abd6a9dedb10cc5b6554f674205c02db |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

              erlang-26.2.5.15 | 1 
                openntpd-6.8p1 | 1 
        perl-xml-libxml-2.0134 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/e63de321c71651492f8e0b3e1dd1289d2aec50ad |     
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/1b88b1ee99d57cdc210e296aeb1f1780659f4656 | ORPH
    i686     |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/090c569b04d14dbb67477978f8688a18b89929bb |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

glibc-2.42-67-g4ebd33dd77ea... | 1 
                libdaemon-0.14 | 1 
         libhdhomerun-20210624 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | glibc-2.42-67-g4ebd33dd77ea... | NOK | https://autobuild.buildroot.org/results/4a65e687e2f27273699c2f8a9794cc71deffc989 |     
  riscv64    |         libdaemon-0.14         | NOK | https://autobuild.buildroot.org/results/f3cb39541fbf9b59f76bf12e62f5064eaebdffa2 | ORPH
powerpc64le  |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/eee76728713d0cc4f27935548334035237e68b5d |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

glibc-2.41-143-gfc7a48bc9e9... | 3 
    host-gcc-bare-metal-14.3.0 | 1 
                libdaemon-0.14 | 1 
             libgphoto2-2.5.27 | 1 
                   perl-5.40.4 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | glibc-2.41-143-gfc7a48bc9e9... | NOK | https://autobuild.buildroot.org/results/91a0b7ccad116911f84281b4cbcb080309ad952e |     
  aarch64    | glibc-2.41-143-gfc7a48bc9e9... | NOK | https://autobuild.buildroot.org/results/7c9cb239803244a67baea42a5e591ac96a3a315d |     
    i686     | glibc-2.41-143-gfc7a48bc9e9... | NOK | https://autobuild.buildroot.org/results/fd48fb96639871889fb2238dba360d1740d7962c |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/9e45b18fcfe75295cdc93da9eba53a9f697c3059 |     
   armeb     |         libdaemon-0.14         | NOK | https://autobuild.buildroot.org/results/63a45ae4b8e92f4f54b7c62cdf5e2760ee0d7342 | ORPH
    i686     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/1dce906c367c92061302082879bcd31ffb16ade7 |     
    i586     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/755f0c58795c58dfd3d19bec3915cd4b052c38e0 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/f570f35bfe28689776db938e5ba24cc4a05f82ea |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
