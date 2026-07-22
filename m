Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC8EC4451C
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 03:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAE6C406E1;
	Wed, 22 Jul 2026 03:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pdORVi6eOOv6; Wed, 22 Jul 2026 03:30:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACB3B40735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784691025;
	bh=teRj4b+JWNjmSdhBfDF1L1JnvFoXZlLXgsdZ7481mJI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eH0QeKseM9RwZ6ZMDYRVF73WArQDgx7ynC7eVjRB/xfrjBw25qj6n2TCp84zDt3ft
	 1qQYhjepCJzEpo6ZOkGM0gHkiFRplKKZ9cVbztuAXm4EU1w0g0kXUWx67ibDL+pweV
	 3QWfblNYXWAvA7tRPhe7HCIKojZTHFy/xBw60VAIbjjFDhtWOTsbaPXSy5OPXbD6AS
	 n6zarbIQEigCIzVHk0IC2uC7AlxocWEIaczy2wEGueaX1JmbdMoa6syulSFTOYTYOs
	 2yNt6LE5dMcyiZrsReXY6boPCgYHF18LiAkXo3XcUyZnKvjP4Y1Cvgv+VfQ5dYWqyU
	 jGtK1GkXUIBYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACB3B40735;
	Wed, 22 Jul 2026 03:30:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FE2F42A
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 03:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D60D80C8B
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 03:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0WkbCXLq29yD for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 03:30:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A19BB80B4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A19BB80B4C
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A19BB80B4C
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 03:30:21 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4955de8797cso17314685e9.3
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784691019; x=1785295819;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TTmSbOy3rL5zp8oktweg+Z4zcv2rjj0oQHHUhSK3o+g=;
 b=D1KDN1CPcsFgoFNcRVDsd9xc7I0ynVwC7W6Qf1XYtPOyygd94xjXdrNX5dPB0+9Cah
 AxEzN/SdK23+9Cmeoqqu4Ynjd85y6kN5KbVyfhUAurCepKK/ZdoEd/5duV5xH//AQZL/
 WIfTgRMs08EiA53GP55rdbls2aaLjjWYB4Q7bCUXmxDMl4puAZeyUmvUtjylpedQVD23
 HfUeiRnv5RK9oZlldoYgdTLkb5/59a8k2Fd7JW5Na07gtAOPNAlb/xpSjTI6hPusgR7j
 J3m/RhiJ0khnGQ5+kX9V182KAo/hUKxU8poZvuO1YhxXwxRUC7xSyS4qZReT/nJw8c8O
 KWRA==
X-Gm-Message-State: AOJu0YzHXtXmULYUPz7GnlogKlpJTzTtoR+lH8zXa181Kj4GGI/ol87O
 QLc5Ut+W6R8yf/39RaczuAfoSEdaRP1ipsnYe0GCN1cfA5YLMH1dtVHVh2oLBBg3
X-Gm-Gg: AR+sD130HsYkGstuFAIpMgYMOx23z7veb91UgoG04T9iJVfodxQCMANy0Mrzkh8RIyA
 3+U9n4c/DrDhBNhA9YSjNnsUScwk02e8c/JHJZ0rCnTiT01qYeeEkUGOXNsP38JoWr4pPMdibsY
 ZaTpFJdv7mSuevS75Ko+6CVp5THzWiksPLZgpevxffClVN+gq7ddoooEBPGdsf4ooV4JIpvJHPi
 dKkWX0AqjFn5P7CZWU2FRAnck4WvWg1PhEbMyENC2VpBJJmBxb0xa3ygaYFhDHuIauTo6EpVj1s
 pvDEU/tDr5mK4cX+yFeLOuV8LZrBo4roLfp3C1furivRCU5EMr4mogunmjU5cWHv+MR2Bv6V0ZC
 j5tiuuMXL+f+arjz8S1DEdyTFF8tEEGe+9p9yBxIfSykL/cBxU0u97XmDFv6zR5S7qabOMNc+Ev
 gP4yre89uHQ51Meo8=
X-Received: by 2002:a05:600c:4f92:b0:493:bd2a:93be with SMTP id
 5b1f17b1804b1-4954a3d0ce2mr233590445e9.6.1784691018907; 
 Tue, 21 Jul 2026 20:30:18 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-495653d38dbsm104629505e9.15.2026.07.21.20.30.18
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 20:30:18 -0700 (PDT)
Message-ID: <6a60394a.deaaa24b.3693d5.12d4@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 22 Jul 2026 03:30:18 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784691019; x=1785295819; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TTmSbOy3rL5zp8oktweg+Z4zcv2rjj0oQHHUhSK3o+g=;
 b=iNVY38Ccrp90OHAz3wJFIQmdQGGDuxsD93jaxuVN1GcyaWMFKK1IVp3s8dJvASb4wW
 mDDHGRP/04SL2op/gruo44EM3vn+aUTnPszZW3dSTv/o4TZ/sU1s9kjqnjIHoKnXpaAJ
 xlQckGHXBsovcbqEMCoq8BF4usuNlXpr3JKDM6phn/Trud7L7FEj6AkPRQjiJDymYV7F
 dCy9I2NYOxIakltbVWbD3+bDZLqLs4stVN9QDeQrZAPJGybpIHHNfenVnqxGP1X8Llzx
 Q3rLpEb9W1TdkOexGfpAk6oRj5eaPLjHISmJ8hQhnbLd2W7S3jA1ubg7ehbKpOw+E3N/
 5msQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=iNVY38Cc
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-21
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

Autobuild statistics for 2026-07-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  5  |  0  |  8  |
  2026.02.x  |  0  |  1  |  0  |  1  |
  2026.05.x  |  0  |  2  |  0  |  2  |
    master   | 59  | 226 |  0  | 285 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 31
               host-dracut-111 | 11
          host-binutils-2.45.1 | 8 
              jpeg-turbo-3.2.0 | 6 
             dahdi-linux-3.3.0 | 5 
      libabseil-cpp-20260107.1 | 5 
                    olsr-0.9.8 | 5 
                    ccid-1.5.2 | 4 
host-google-breakpad-f49c2f... | 4 
                   linux-7.1.4 | 4 
   openvmtools-11.3.5-18557794 | 4 
               tcf-agent-1.8.0 | 4 
             alsa-lib-1.2.16.1 | 3 
                    attr-2.6.0 | 3 
        edk2-edk2-stable202602 | 3 
               linux-pam-1.7.2 | 3 
               pcsc-lite-2.1.0 | 3 
                   perl-5.42.2 | 3 
               trousers-0.3.15 | 3 
                   dante-1.4.4 | 2 
                enscript-1.6.6 | 2 
              erlang-26.2.5.15 | 2 
                    fcft-3.3.2 | 2 
                    frr-10.5.4 | 2 
glibc-2.43-45-gdae425b55420... | 2 
  gobject-introspection-1.84.0 | 2 
                    grub2-2.14 | 2 
                     gzip-1.14 | 2 
       host-gcc-initial-16.1.0 | 2 
                 host-gdb-14.2 | 2 
                host-odb-2.4.0 | 2 
           host-p11-kit-0.26.2 | 2 
                  ifplugd-0.28 | 2 
                  iodine-0.8.0 | 2 
              libcanberra-0.30 | 2 
               libepoxy-1.5.10 | 2 
        ltp-testsuite-20260529 | 2 
                    ne10-1.2.1 | 2 
              tailscale-1.78.1 | 2 
           uboot-tools-2026.04 | 2 
                 uclibc-1.0.58 | 2 
uhttpd-15346de8d3ba42200249... | 2 
                       unknown | 2 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                   atop-2.12.1 | 1 
                     bc-1.08.2 | 1 
               binutils-2.46.1 | 1 
                   bird-2.15.1 | 1 
                  boinc-8.2.11 | 1 
                   ccrypt-1.11 | 1 
               collectd-5.12.0 | 1 
                   dejavu-2.37 | 1 
                  delve-1.22.1 | 1 
                diffutils-3.12 | 1 
docker-credential-acr-env-0... | 1 
                  dpdk-25.11.2 | 1 
                easydbus-0.1.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
                  giflib-6.1.3 | 1 
host-am335x-pru-package-5f3... | 1 
              host-bison-3.8.2 | 1 
            host-go-src-1.26.5 | 1 
         host-ti-cgt-pru-2.3.3 | 1 
                  iozone-3.508 | 1 
                iproute2-7.0.0 | 1 
                 lcdproc-0.5.9 | 1 
              libatasmart-0.19 | 1 
                  libcsv-3.0.3 | 1 
                libcurl-8.21.0 | 1 
                libdaemon-0.14 | 1 
               libdvbcsa-1.1.0 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                    libev-4.33 | 1 
libfutils-c326ce0cc2a735438... | 1 
              libid3tag-0.16.4 | 1 
                  libmms-0.6.4 | 1 
                  libmng-2.0.3 | 1 
libuci-f3fc0b76040685829191... | 1 
libyuv-4825d9b29eea4dac2460... | 1 
                 libzlib-1.3.2 | 1 
               llama-cpp-b8117 | 1 
                    lua-ev-1.5 | 1 
                  luvi-v2.15.0 | 1 
               madplay-0.15.2b | 1 
                   memstat-1.0 | 1 
                 mpg123-1.33.6 | 1 
                net-tools-2.10 | 1 
                  ntp-4.2.8p18 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
             odhcploc-20111021 | 1 
               openblas-0.3.33 | 1 
                openntpd-6.8p1 | 1 
package/mender-update-modul... | 1 
      passt-2025_06_11.0293c6f | 1 
                 pixman-0.46.4 | 1 
python-remi-2022.7.27-37-g1... | 1 
         s6-linux-init-1.1.2.1 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                 sudo-1.9.17p2 | 1 
                  swipl-10.0.2 | 1 
                 systemd-258.7 | 1 
             tpm-tools-1.3.9.1 | 1 
                tpm2-tss-4.1.3 | 1 
uclibc-ng-test-132c6134d691... | 1 
                  uftrace-0.14 | 1 
               valgrind-3.26.0 | 1 
   webrtc-audio-processing-1.3 | 1 
        wireless_tools-30.pre9 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/ba23d563ff461ad1643c1f2c061e022086a41519 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/51cb0e7cb69cc6525cbf617f7a71a1e37cd64de9 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/635ac4658b7801b5e2c56a347359fc222808dea1 |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/281bd8a265073703a0bbf34540102803bbc0b1da | ORPH
    i686     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/f983d97b232a45ce4e176d93684fffcc771daa44 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/0b7124d352d060851b454cc502accdb21fe9cd3a |     
  riscv64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/d503d92629c507872a3db673960c5e583c2a2129 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/9a4a88e1f1998a857f7ac4790bad9f6d5ec05aef |     
powerpc64le  |           bc-1.08.2            | NOK | https://autobuild.buildroot.org/results/a0c521afd3335755e746907236b45c6f9cc0deba |     
    i686     |        binutils-2.46.1         | NOK | https://autobuild.buildroot.org/results/3418c44e1351b9e30f87b86c1bb2d1d3555f8753 |     
   x86_64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/c13d0c5a61d81262a5201f62a91c65140d4b3cfa |     
    i686     |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/ab5c448f5f39aabf19966143f6fef2092c30f95d |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/fa351dfc05f0146aebe8ce2adb24750e3afa187c | ORPH
   xtensa    |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/9b1dafa8a0a2298b0cc275ed2caa326c15037836 | ORPH
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/8a161ca31c1eb0010a09815887a29650dabce339 | ORPH
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/847a917ba5da614e8e033cb13496c4491772d31b | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/5e54b42fd4350ff3a103a0d8e400d60c1b2253e8 | ORPH
    mips     |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/14b62f0714d379ea665107cbeb511161851d1e71 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9c4f77c526cd2572f8d6dc18211991c4fcf6a7d2 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a1b2e33234cfa863c60b6bf79031c7994d2a0d8e | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/125b307d0cf106d42d3b02c071708d68008fb687 | ORPH
  riscv64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/19d5638796716acdd43a0ef98297b58ce60bf79c | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9e645a4ecb08a4e07bc74ec338776033b150a19f | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/c4d27927284c1d608f51c819c64e3fdd670741d3 | ORPH
    or1k     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/14d75e792c89deceb94a488821c3ebb90ad453eb | ORPH
    i586     |          dejavu-2.37           | NOK | https://autobuild.buildroot.org/results/c20cab2c8506b885eb24710abe9136c0ad8c1971 | ORPH
   x86_64    |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/5b0695e86f31cd69badbb121727a10d3d5fe29ed |     
    i686     |         diffutils-3.12         | NOK | https://autobuild.buildroot.org/results/33315e335dfe300e7bd5669eeb519f97b9a2d87e | ORPH
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/ce8c3394976ccdb2c4a24e06575bc9a825b04ad4 |     
  aarch64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/30d4c73e25cb846c9340578222f7dc6c67b50d6a |     
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/b11ae3cba3368ac0600e516085630bd15a05f274 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/e6040d998ab15b0759fa951555bcc621a03d8640 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/68b530920beb6dcb990c32c1b09ed92e7d6a7df2 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/65b0750b601da2068b8fc891d62e499c0598382b |     
    i586     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/b83e715da0685479aff6de1f111a5b12fa3860b3 | ORPH
  mips64el   |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/fb10802386807b433655d551f1f348b71c469dfc | ORPH
    i586     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/5d6013292899546dfb2ced73e193498fa75880d6 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/7371c1938044e7629998a9d36846ffebe320de72 |     
    i686     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/e0d6d8eda1e97352c360afcb9fdf3d8e04b1b0ca | ORPH
    i686     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/8f58e6555eb7b0f168e0eb7e0dea03efaafc13ed | ORPH
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/3e69d5fce749d225cb9abe5cb98f9dea0c4de9e0 |     
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/85a55727102468f782c13c00fd041a28e4ef391e |     
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/afb9958d0cfef2aa08d2420837a59d0c2c5c0722 | ORPH
    i686     |          giflib-6.1.3          | NOK | https://autobuild.buildroot.org/results/22dbc51811eca2a70ee72df78ce9b6a215edb675 |     
  mips64el   | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/654bccb26f6a046d645f30036da493d25b378f3a |     
  mips64el   | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/675317beedf13975234d93125156909b449f5259 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/292e14b06c1637a71ff06a0d304a6e39a704353d | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b3cc23efa16cec1931fc52ff94fe0951321bf2b0 | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/0fe41aa3ead35fe6a3a350c97f8da69619c78878 |     
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/f8af31d7f0a78595822b2f7a0edc2ae7f1e42f88 |     
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/75504410e8ef59bb17d8dc3b353eff2146ad4a15 | ORPH
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/f42985229056e3cd09443a7a639a6a60f65bdfb1 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/db56477f25d9f439f9313323fe33aa4ae2c59049 |     
    i586     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/5258fe1d788637e86c2e2825a2a0c462626709b9 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/b5eb69f9c6e977cc380ff7adca41d3c674150569 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/e7419bc6a95c8a19cae8bb37294527172d6673df |     
    i586     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/cb779089749baf5c332064ef029abd684d1fa7f4 |     
   x86_64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/c91e243dfe8e71b3a6370885b6e28060c3a1a04d |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/e60942d2d6fb17dc4a9d0d42ea0623b02c5cd0a7 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/5d1780619ac117c73b33d7a0442143afc9974309 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/7f10251c012ee144524821e8762216cf1c01350d |     
    i686     |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/aa974651dbf9233579641c711ddf72aa35451164 | ORPH
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/fa79f64f9d8608957cca52417c1c7f9b35262b97 |     
   x86_64    |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/4955ce2e672c2890ecbc5391c03312406c24fafe |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/3fb6c8762ee43b66b21915e9c37e24fc21edaa02 |     
   armeb     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/0bed3cd6e2bec9f9a5f4c2fc0d28ccc5acaea031 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/9eaf780fc59850dab49be38d9cbf4c45490415e1 |     
    i586     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/6f5001329b95c96343363490881090197a6625b1 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/c77f02dec79524ab9e292481eb0fda998b268e6d |     
powerpc64le  |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/28ec2e5366e76a1a9a1066fcd3d67c586ac4c080 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/2eddaea0382e3555b292834e6d1b60e3dcf9af66 |     
  mips64el   |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/9ab534b3153937cd4cf359c4c81acf5bbb552482 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/1b85c929e573cc499ccdefa72eadb731d63fb067 |     
  mips64el   |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/0869ce1206d0c05045125313d18be929335e4691 |     
   s390x     |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/f88565af0f653df831a7fa43d2507d167fdb9d36 |     
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c0bafbad78914bfbc4a519812a2c1708bf79b30a | ORPH
    i686     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/50cb6a1508a8f8f92629a4a97e835167e56f893e | ORPH
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/8b5c7574c2e724a0dd00d1ed6abe0f5e8967fe39 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f1edb2cdee8c9a2431d2e706a79f4e67f1cd40c6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/40aec39e6e5cfd0d678b8cfb652bee3c24dd2a05 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4e05236ba8c42256b78582bbd3a2f30a0d9875fa | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/92bcf13c5f2e37aadd1f2b07b1b219ce403e8ca6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/11a60ddc236eff62ff84305eccdc557da13f9df6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5b47483d6876c64d9fe9c793cede69e366ba159c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dd29d355a81dfe5c223652777a171034b9325c64 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/63bf857009723389a5d0b78824b8c9eba700f8aa | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0bf804af40b925721efe69089e50d4aeac9a735b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1f8587aaa403ffe2d0618e377825e1a8077fb396 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/07af727e9790e5191f2b2f5ee5e630be86f9f88c | ORPH
    hppa     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/76d194b5013b30534e21a67b49e36b16a1afb1d4 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ec2e32ed6eccea97d5ded0e037d67ab5bc1ec0e4 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7d4fa83087649faa7c3686964ca669e51a9a88fb | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ee4c3e447a77bb1b984ebaa27a7e5aaf4d38c556 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1d64004220b3ad93f905a94ec6f7142fee139bdc | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5935eb3d6f39fc83f9d9b0d4e248070bdf30b248 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/31a4ca1e13ab19c0051439aff73a93cd8f11b322 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b9b31c6f26671b55389d7fd18f88a66f5be79725 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bff7460783295c0acfb498fcafbfb9c05916d043 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f7e0e9c405c3c20cb51ec50d211e3043d7b9956f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d170d40cfc007d50969b55017dee23a671ad76ee | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9b1ace5665c9d32dd9b033782987c904a8dc7fda | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c762d9704d3b4b5338f3333d9c69dea9090327c2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/db3425e72be4a6390b2cc57d1524e4885292da1f | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1c9ea20704c233288b0ce26225fc89dd89797a80 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/aae21f4c451348758669c63b0a549597d136b97e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2d48b6c060c11511627ca5058f09bc1dcc74608a | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/576d24ffb8325b9c438b8ef875f3a7aff9356212 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/921c860c03d389ea1d7c064b5ea7aa9a9eab9ddb | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4f92d0f0a9422b108073672056ff3487c096dd5e | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/84172af1b3afbd7d5a94c960d7d913111c5c3f39 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/241aa016f851aa87d07234f4901817cf8ceaab54 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/51b5bec9ba8e28ec38e1a38a7e0f47afd13a1f93 |     
  aarch64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/e2e33baf61b67b3cfeed77ef0e03edb4edd15290 |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/9d2649e0281e86fb222cfa9367d806703500bbf1 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/e7105dc1b000b238f5e42dee02bf8f68cf3705f7 | ORPH
powerpc64le  |      host-p11-kit-0.26.2       | NOK | https://autobuild.buildroot.org/results/547c56d610b924086acc48b2794791e4fef19d93 | ORPH
    i586     |      host-p11-kit-0.26.2       | NOK | https://autobuild.buildroot.org/results/0a4cea83556e5a146aa2736d1ff04683168b5159 | ORPH
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/1caadc1a2725af3818404b25c738baafdfe5232e |     
    i686     |          ifplugd-0.28          | NOK | https://autobuild.buildroot.org/results/885a6e929941d76cbdc00f32f49e95fbfd197349 | ORPH
    i586     |          ifplugd-0.28          | NOK | https://autobuild.buildroot.org/results/a993c1498e064328227d4b8bf125f243750a9669 | ORPH
    i686     |          iodine-0.8.0          | NOK | https://autobuild.buildroot.org/results/a1d5b62464a6daefc92d367b20c2467a70631e2c | ORPH
    i586     |          iodine-0.8.0          | NOK | https://autobuild.buildroot.org/results/96b88828fdc98dffbea1e1cd822bc22d11ae2aa9 | ORPH
  mips64el   |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/2d8464fb624c6c0d14c07e82563553ca6d163e26 |     
    i686     |         iproute2-7.0.0         | NOK | https://autobuild.buildroot.org/results/5cfee1d466ac9a37932f809eefbb24386d0cea4b |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/3dd8f0a98d34b4d3f5707cb6e7a38d548bef4ea8 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/2b8ed6fb495f658fdb70f2f57708c2bddb55a025 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/adc26055e6267a7cd60b137e265474f484075776 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/97f1bb8ca9bdf68db99198e732de63fc99ec50cb |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/c5d0fa9bbe4c75c16e2a511e151a106ab6af200d |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/5609ffe1c1159c816914d38ebde44691cf9edcf2 |     
  mips64el   |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/d96d0598532fca6dd69c39776f1b68dc253511cd | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/e4a6f9461870acd24cf1c43e197bc5cd0afac880 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/0b6b3050c482e9ca90c73892db030de373c124e5 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/fec6c2aab57e2a4e411740990168e81a8d8ae972 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/51b8afc6fbd2ef527086456c522fb66235a3ab11 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/386fa17d2967c918fe86b109787a07058ed7b94a |     
powerpc64le  |        libatasmart-0.19        | NOK | https://autobuild.buildroot.org/results/1b1a3be3f7140320f313b61528a4455457b05aa4 |     
    i686     |        libcanberra-0.30        | NOK | https://autobuild.buildroot.org/results/39c0324b6bffdabfb26298034e755e6a2d5fd2b3 |     
    i686     |        libcanberra-0.30        | NOK | https://autobuild.buildroot.org/results/721c7fdae2ea34c2de705d0bcd41bedc0a3c2fc6 |     
   x86_64    |          libcsv-3.0.3          | NOK | https://autobuild.buildroot.org/results/9060324ab7c7d6dc87f84e8f94a78ecb0673f2b3 | ORPH
loongarch64  |         libcurl-8.21.0         | NOK | https://autobuild.buildroot.org/results/ae2932aea7558cea8187cac373213ebcfa10abeb |     
  aarch64    |         libdaemon-0.14         | NOK | https://autobuild.buildroot.org/results/883777d726e717a5ed178ed4fc4d7827eb2ff4fb | ORPH
    i686     |        libdvbcsa-1.1.0         | NOK | https://autobuild.buildroot.org/results/2b4f4cc6d8233131b3f9a20ea72b0553c0569bbe |     
   x86_64    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/98ea28536d733635ede63075edcc80d241ccbe5b |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/90ea6b5a61156768838c9e3a96ba6dab0fce5129 |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/116fc5cc99131d004ab97654691260262fc63d2c | ORPH
    or1k     |           libev-4.33           | NOK | https://autobuild.buildroot.org/results/4f7bf0ef3f4fe6a2d7c3615ec346702f0770305b | ORPH
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/1a19214091b52d7ee45f1058cef709bfff75a8ab |     
   x86_64    |        libid3tag-0.16.4        | NOK | https://autobuild.buildroot.org/results/2e05003f505d44fde5b02d12271b88135c1c7490 |     
    i686     |          libmms-0.6.4          | NOK | https://autobuild.buildroot.org/results/1b347b7e4c1701d30d01634dbec63e6da5842cce | ORPH
    i686     |          libmng-2.0.3          | NOK | https://autobuild.buildroot.org/results/61d5a4ec366e1dcec2df43cc999fcc72058823ca | ORPH
    i686     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/60dc253b3b7ceb08b999c9ec960c02b9226f2a75 |     
    arm      | libyuv-4825d9b29eea4dac2460... | NOK | https://autobuild.buildroot.org/results/3cd42415d6cfdded4dd1af5ef466ccb7920a079f |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/0093fb3c565e282c354f0b7b153e49a193deeda3 | ORPH
    i686     |          linux-7.1.4           | NOK | https://autobuild.buildroot.org/results/1db52a83feaa4c7ba0ac8287af4ebadbf20543da | ORPH
    i686     |          linux-7.1.4           | NOK | https://autobuild.buildroot.org/results/f54b214e61e78ab324f4b937e7229bc0ebd23278 | ORPH
    i686     |          linux-7.1.4           | NOK | https://autobuild.buildroot.org/results/b6c2ec7cdef8eefa4db985cc45a626b4638941a0 | ORPH
    i686     |          linux-7.1.4           | NOK | https://autobuild.buildroot.org/results/aefe6ac362195f6e9952e428a42f31da0582a8b6 | ORPH
   x86_64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/72e2be542e2d85334e82bdd956a71589e1a74bd9 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/8d882fcf429750b63dd3ab23caf6cca21ec1bd74 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/34d20507884c37fd99fbb271a28f4da2b6f153fb | ORPH
  aarch64    |        llama-cpp-b8117         | NOK | https://autobuild.buildroot.org/results/ca8e2bc040b1d8b78e9fd0c181b20658195ab5f0 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/38bdc6350d6b9c51ed37ecd34254b0ee0d0d7d26 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/84a391e4e9f3f9f1f3e9d4ebb50b540ff2f1e1ac |     
    arm      |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/4b687b4ceacd176ea5744a529f2bf59f276a3253 |     
    i686     |          luvi-v2.15.0          | NOK | https://autobuild.buildroot.org/results/b2e4cda1073e9146de6d76edd2cf9f1675bb85d6 | ORPH
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/fb08089389b9f79eb3656e1e786cb1b932e054a5 | ORPH
    i686     |          memstat-1.0           | NOK | https://autobuild.buildroot.org/results/375a4054387174be420f74ef6d72aa0f88e92fa9 | ORPH
    i686     |         mpg123-1.33.6          | NOK | https://autobuild.buildroot.org/results/ffd68a15e346e76601119468598e2cac51c3e43f |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/74d6203bb3990db6e57aa26329897289a70f930f |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/a4195f4b1e64aacc0135dfdd41483c568f4069d6 |     
    i686     |         net-tools-2.10         | NOK | https://autobuild.buildroot.org/results/90408279e69ff1862742b83496adeac23a1dd985 | ORPH
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/dd01342906a0aa5525e1aab45217c619c73df0d2 |     
    i686     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/bf7f6ef590dda14763e3da6da03b0c3fe0416494 |     
    i686     |       odhcploc-20111021        | NOK | https://autobuild.buildroot.org/results/334a49f146c58b323412afb3091726059deceafb |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/223712fe6ba60f3568986ab9ccf781b1f5ef2142 | ORPH
   x86_64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/412e482a3990f55c6705425b4b966cdc35f2fe2b | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/0dab1e76dc2dc59844f0c61ebfb06ba518b56e32 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/eae1b7e69ea18a365595dbbcdbbbe381d95fd690 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/16a19d5853875f25b5869d522b7ca594a5502783 | ORPH
    i686     |        openblas-0.3.33         | NOK | https://autobuild.buildroot.org/results/317173bb7740b0f6a098ad71c7aed7bd000b85d2 |     
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/189116549f297056171bacb172575056a546ab85 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/289e60a94d3a7f10c7d57a15dccb38a5c3289954 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/0844648ab7a77c441fe39e40093fa3659d45b9e1 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/9110ff6beef845d86b6f7383b524efc0dde11e8e |     
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/9e6a320c2df5861a7c9097097f3284b106612049 |     
    i686     | package/mender-update-modul... | NOK | https://autobuild.buildroot.org/results/bbd4c1ae0b98d1c9d677c5f41c7a7830ab955249 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/380b4eb6e27298dd2a4bd1322e10e87284249a6c | ORPH
   mips64    |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/1348fd135bec36aafa1aa57c1d7eb46a765e11eb | ORPH
   sh4eb     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/eec01699cc8f17d8dab71ef09c1b09521b3447ad | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/b789515c2685b461efc25a424e3eb7513f76eff3 | ORPH
loongarch64  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/382342d1e7951425703a79ca7bc16131de458eea |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4038e063ac1f0e404e1eb5e518d0b805957df3ac |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/008dae0026e668355de58da74a2409144a9e3493 |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/ca552083fe6475d9cffc0c49e55c7791aa394e13 | ORPH
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/9be82e57091bac2f83a052aee6adc91acef7933c |     
powerpc64le  |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/45987a9777a203d5d2e4ab2549ba1a70e68bbb4b |     
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/f750787732fb01aa04a1a2fc97be1a530bc9ae29 |     
    i686     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/1bcd72c01a9cc0c423162f0be1822443ff04dd8d | ORPH
    arm      |          swipl-10.0.2          | NOK | https://autobuild.buildroot.org/results/2be780272385bdb92422b6e6a2acb679b08eb018 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/e48eaa40d88c1a74af40a649979b8e3894aeec68 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/b83cd838467fb913f96ff36a3d4d7a6bc3633106 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/38a53a90dd6f2c329e19bf5dbb9e999832dcdd1c |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/47572e9bfe7a2e1512e84d83f387b09340d373b5 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/96c71d8f570269c30afcb2dc2013280d83070e36 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/94c7dca653e150fd4367eefddbdf0323c50ebb61 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/b98721d0e6fae7d221804268875f8ebbfb0bd0b6 |     
    i686     |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/5be24cb6a4df0826cc5ff6ae8268a58c28ffe98c |     
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/4cf0da03a59d48d9aed60338d91821e8ca0a9bf7 | ORPH
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/5f7c75118f57e3b298df386e544eb7d19487f7cc |     
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/839c74398e9e5d573c075eda1fa79ac33c97b54b |     
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/b1ec9f915de1908c5108e9b8609f3965d38952fe |     
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/f564d1b0c5c3824a898a81d4b37a613c9078e271 | ORPH
    i586     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/6eee8be5f709809b1737c36310e1c9904a2af735 | ORPH
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/1bfcda124f754581a630bf5774c6f7b513632e12 |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/798654836f91ea0cd7cf8466982ea94a2eef6fbd |     
   armeb     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/d8db1d7599f977f99cdf1ed68eca9cda987fa6d7 |     
    i686     |          uftrace-0.14          | NOK | https://autobuild.buildroot.org/results/1752ffbd8a5fb31742e7dadd6a81357838d84b05 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/7b59aa7544c325bb8456d231c4cb7a9bacf78ce0 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/9bd4c91c821d262eb7376f1fb77a00b0faa88eb9 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ee510cd33c48a2f4f2140e6aa5eef14ea727d8b1 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/be4a725219ae6e58def1f5efaee64895151da657 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/17ea32cee106d3fb55ca66da17752bfeac3c1b3e | ORPH
    i686     |  webrtc-audio-processing-1.3   | NOK | https://autobuild.buildroot.org/results/01ab92d92d5275fb44bf562fd138b00bb36f06ba | ORPH
    i686     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/6a361b42bfdeaaff3ebde38a60d8fa194173f6ef |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/878ed40851a2cc8375e15706eb5004b231b5b571 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
                  ntp-4.2.8p18 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ed97a1328d8d518e2fbe324e77f70b872cede885 | ORPH
 aarch64_be  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c8bd76e27179cf724756b53d6ec608ce0b541a63 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                 linux-6.19.14 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         linux-6.19.14          | NOK | https://autobuild.buildroot.org/results/9dabb1a557707c96518df7ae1707202b7b2d6165 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

host-netsurf-buildsystem-75... | 2 
                libvips-8.17.2 | 1 
        ltp-testsuite-20250130 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/d5c2124d33dcc828ccdcfee3bfbbab1780d496a3 | ORPH
powerpc64le  | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/4691b44561bc8f2ff1db14ef14d336d8c7e464ab | ORPH
  mips64el   |         libvips-8.17.2         | NOK | https://autobuild.buildroot.org/results/9d79664141b202beaa32c7f60738e63baf61b934 |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/43815300b49caab7b82c27cb2f018b3820973697 |     
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/ba27cacf064a3e42057f2d51231e8f6afd15b9b5 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
