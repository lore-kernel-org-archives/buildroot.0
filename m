Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E974DCD4F3C
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 03:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E6E86066F;
	Fri, 15 May 2026 03:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtTq6zkuOyjF; Fri, 15 May 2026 03:19:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8D8460898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778815140;
	bh=Kh14Q1dPUWw7akd0t4aH7kMAllAbeRwjdIF9fiZs09c=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nIyx3uGBsjNru6r5lNyHzENHFzk95CuwY6DeQDLNJD7IWzlZngueSTJQrBpIe1AL6
	 yRPKFGyTh9gNA9DHdSeX8+EHqjDI5Pyhiq713whfCSX8/yo67/f9tb+mz4WvbwAZv5
	 OAkEWO57cWwELU6FF40HB+6Q5VUpKPGS11swTQ2qHoeY/E3b/hy+35AlJ8a0n4kKXf
	 7vmx40PuQMxTTSWvuTMueqmCMgZw0/PJI1+NGCNXBHS0Ushcf4rZbkGw6FOWee6shJ
	 KdrLkJytYFsU23eYw073aiNDHcIPE/vLCHLCAuzQGMnNEeZ2yhj8ioaeOwpjco7XUt
	 cgOPsGjSYqb8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8D8460898;
	Fri, 15 May 2026 03:19:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1C89E7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 03:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90B7840511
 for <buildroot@buildroot.org>; Fri, 15 May 2026 03:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_3cRM7d2iYK for <buildroot@buildroot.org>;
 Fri, 15 May 2026 03:18:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C52F041323
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C52F041323
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C52F041323
 for <buildroot@buildroot.org>; Fri, 15 May 2026 03:18:55 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48e8132c6d0so43116535e9.1
 for <buildroot@buildroot.org>; Thu, 14 May 2026 20:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778815133; x=1779419933;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bSdTeRZ/ufi7jkS1KNbd9ecv5wZyKsM8HhbQ//+CfmA=;
 b=ZRhLFHbExjXwRFEcK6SmQIh2YR1LvfJ6LmYWhrdgxlhVMzVpGWszqhv/QTCv4n+2OL
 BJgfvw+RDFqpcwbYz4+Kz+rHXg1y98wiHfqqa1VZsOirYZoaAfb1I+xwr6d63oIeNjsq
 qBnyKKOJL4k9hjTX5dZm0CdjHYcuXhB6jk4Pqq/0yDanP8h9VZs1KqU32crVoGdDPjw5
 Tll7R2pagtApOhZ4LLGBQM31TdgCOiXsew3C8J/TZJ9VBZWkwFCxpW1gcwbOhMedmToH
 Pk7zgwbd1c7ec2jqZPef5oy3HUPaJa+XJHG5K+CahdU704C4m/Ac1qRQWG2aB1J49hKe
 ZnJg==
X-Gm-Message-State: AOJu0YwlZMAWnNyB6JDUwmQ7hwsPifAbz6a/TKdC5aZ5VuEZIzK+JBoV
 J3Rb2llDbGaoSeKluUWL0PontRqqUEkOqnjZvesanr0sorBOilX2mNKdWC8s0rOi
X-Gm-Gg: Acq92OEKCqvkLPsSYk1zaqjI+sfiaA8getU6n8fW8nQYQ3iPmDToqiswwSJ9d4urvZ5
 CsY/SVm3TCjHsVQ30bYsMIVbLI0k4aAgXf37VoosNiuDmjsxbCxVBup2CR35kFtQS0tEGQP1UR+
 EHF3HU5xqOH4wCXKHxR6ksGf7O6/X822gXpyStAxWB7FTNVfpbDF9I9wPJrrSAznkHOLImcKAKx
 KRZ9Xf0GimshcWcPn3vme5xmis0Tn1rM9BgVBjLxMGBW4fF8T0QNV3+RZjxuBYfiXoFijijaj89
 VHSCS/juByLhGhXg9xVsYW6LLO196hTYNqhxlaLm8S1PHbo7h0n011a+KWVcTIzlUQyHCdyN6XN
 1cmoZvCl5TZSdq4avtUdQ7d/jBK7yiGCHvcNOHnOZFsJJFra+EF2ywIUIU/3Bk+Dy69Zy6k2oRM
 6jfmg4y3upvdu9yApA1rMIzcvPrPmehg==
X-Received: by 2002:a05:600c:4897:b0:48f:e6de:1cb2 with SMTP id
 5b1f17b1804b1-48fe6de1db4mr10581055e9.19.1778815132828; 
 Thu, 14 May 2026 20:18:52 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe537ccf5sm32636155e9.14.2026.05.14.20.18.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 20:18:52 -0700 (PDT)
Message-ID: <6a06909c.0cd0b31b.1acf18.084b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 15 May 2026 03:18:52 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778815133; x=1779419933; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bSdTeRZ/ufi7jkS1KNbd9ecv5wZyKsM8HhbQ//+CfmA=;
 b=LfXgg55qarZoyTCP/DbIu/1+QCJnNn5pA+29eiS+PRKHnAPy8u+4GKhs2V5rC9/zWK
 6pghC7lxI0BgB6/82YX5DtLQI54B56SLa4wJ+hMcpi2fyjec+Z1dEQOdoYW6zvnlkPlW
 1AGx883PxJwnCK95gH3/wG/1z1qLvgxu4hLOG6DcvZu/cSsrvqgjVq8iHj886U80h5RR
 NNo4srirqh4O+u3ItpWcxZcI3yhO0Zlo80L1lTXKZopEXTfeb+gKf9ljlKRCxlIe+gHo
 UuS/+yXuVVxwns7BOTPNnUyY8Txd0PK4O4NKZ73Zfn6RvVaJw8hUuLrxNWybf35KC4eh
 l1hw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=LfXgg55q
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-14
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

Autobuild statistics for 2026-05-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 17  | 68  |  0  | 85  |
  2026.02.x  | 10  | 25  |  0  | 35  |
    master   | 58  | 156 |  2  | 216 |

Classification of failures by reason for master
-----------------------------------------------

ustream-ssl-5a81c108d20e247... | 8 
                   dante-1.4.4 | 6 
                       unknown | 6 
                host-odb-2.4.0 | 5 
phidgetwebservice-2.1.9.201... | 5 
glibc-2.43-27-g4070d808bea1... | 4 
    host-gcc-bare-metal-15.2.0 | 4 
host-gobject-introspection-... | 4 
              host-pahole-1.28 | 4 
               linux-pam-1.7.2 | 4 
             util-linux-2.41.4 | 4 
docker-credential-acr-env-0... | 3 
                 gnupg2-2.5.19 | 3 
host-am335x-pru-package-5f3... | 3 
          host-xfsprogs-6.19.0 | 3 
              libopenssl-3.6.2 | 3 
             dahdi-linux-3.3.0 | 2 
                easydbus-0.1.0 | 2 
  gobject-introspection-1.84.0 | 2 
               host-dracut-110 | 2 
host-gcc-initial-arc-2024.1... | 2 
              host-guile-3.0.9 | 2 
           host-libtpms-0.10.2 | 2 
                  libnfs-6.0.2 | 2 
                libnss-3.123.1 | 2 
                libsoup3-3.6.6 | 2 
                 libzlib-1.3.2 | 2 
          linux-5.10.254-cip72 | 2 
odhcp6c-f19dd37fb467c9cf10c... | 2 
                openssh-10.3p1 | 2 
                   perl-5.42.2 | 2 
                 systemd-258.7 | 2 
               trousers-0.3.15 | 2 
amazon-ecr-credential-helpe... | 1 
                 apache-2.4.67 | 1 
                   atop-2.12.1 | 1 
                 babeld-1.13.1 | 1 
                   ccrypt-1.11 | 1 
            cpp-httplib-0.43.1 | 1 
                     crun-1.24 | 1 
                   duma-2.5.21 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
           googlefontdirectory | 1 
          host-binutils-2.46.0 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
    host-mender-artifact-4.2.0 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
                iproute2-7.0.0 | 1 
     kvm-unit-tests-2025-06-05 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
      libabseil-cpp-20260107.1 | 1 
                  libbpf-1.6.2 | 1 
libcamera-apps-v1.7.0-10-ge... | 1 
               libde265-1.0.18 | 1 
         libhdhomerun-20210624 | 1 
                 libmbus-0.9.0 | 1 
                    libopenssl | 1 
      libphidget-1.24.20260127 | 1 
                  libsepol-3.9 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                   linux-7.0.6 | 1 
               lrzsz-0.12.21rc | 1 
           lttng-libust-2.14.0 | 1 
                    mpir-3.0.0 | 1 
                       mrp-1.2 | 1 
              openconnect-9.12 | 1 
                opendoas-6.8.2 | 1 
                openocd-0.12.0 | 1 
             parsec-tool-0.7.0 | 1 
               pax-utils-1.3.7 | 1 
             pptp-linux-1.10.0 | 1 
               pulseaudio-17.0 | 1 
           python-brotli-1.2.0 | 1 
           sane-backends-1.1.1 | 1 
                    sbctl-0.18 | 1 
      shadowsocks-libev-v3.3.6 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                  stunnel-5.78 | 1 
toolchain-external-bootlin-... | 1 
             tpm-tools-1.3.9.1 | 1 
                tpm2-tss-4.1.3 | 1 
uhttpd-15346de8d3ba42200249... | 1 
        util-linux-libs-2.41.4 | 1 
            vorbis-tools-1.4.3 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/71bcbcf45b084174cca324c7440cdd524f94b60b | ORPH
loongarch64  |         apache-2.4.67          | NOK | https://autobuild.buildroot.org/results/6352a240fb8b07c4b80d4be2820263f6bbdb312a |     
    arm      |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/17d5935cd1ed870cf83de333ce0eebc2877bde09 |     
loongarch64  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/77a188d1e6af3420d1ca19062cbcb08a48edbf65 |     
microblazeel |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/bfeba2076c1cab392a3ed93ebf3bd0482a5db576 | ORPH
microblazeel |       cpp-httplib-0.43.1       | NOK | https://autobuild.buildroot.org/results/948db0dc4eff9318c75734a57b59fdfdca13e32f |     
microblazeel |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/8c19288ad37ba663613b8fdc6a05dd13fe26bac4 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/81e65bff3b3c7c2f3a18fb4db8dc26590539927f | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/de970480dcf6d7acd3da58f7b8b7f48b78400289 | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/8a7f2df02a919034f1701230ccf2cc323a94fd0c | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/523d6732a6f56276634b37d4917b4098fcd24806 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/691a9be429fff6cb9aa9e87fa17a3d599cf7624f | ORPH
    or1k     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/fd814bcea9eb1e8e5e54c1ff2d7dd6fc33cfa772 | ORPH
    sh4      |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/1dbc42fc8a9c521e0f58588a4d1f3ff7960a5562 | ORPH
    arm      |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/6a43e44d2cfb71c19bbf77cf782a521f72d5eba9 | ORPH
   x86_64    | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/2557e377467233f1c6eb465be745bec01eda5711 | ORPH
   x86_64    | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/ef4ed9cd4dbf49ae5e8fe92e11498b8eef45b9d5 | ORPH
   s390x     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/be3f93f2bb38c79d240cb4f717b8ebefc747424f | ORPH
  aarch64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/99ea191a1081666b9e0f9eb40a5d68ebddea441b | ORPH
 powerpc64   |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/0cda8793b657b2bc3ccf821e15909ff50b1118b8 |     
microblazeel |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/669e987b758444f5858a9e5845f6ff4c8139bf40 |     
  aarch64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/cafe1e29acf05735ee89232dad28f92f40f5529b | ORPH
    or1k     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/e49ddd9baf72a70d5571ff9486027c084690bdb1 | ORPH
    mips     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/e01e2a6e92ab0f8793e6b0bd0bf4ea4607cbb232 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/6e53ea4174c213a094c8b813580d057249a49006 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/6acbea4c64fd0d978db32890e08b8ba66caa477d |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/de36519fffddfbf1f36403abfde844d0d577896e |     
  powerpc    |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/fdbd7bc2dabfdbe75cb635ec73535a12336434d2 |     
   mipsel    |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/a059a48d01933b0fb77318138ad3a664d9d1484c |     
   armeb     |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/b62e54103447443a7712b9ec63aefe72a35f628a |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7d0f2b707942e06467673581f32acf93fa48d723 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/53eb18e8c0968af09b66f4c7793b0b3396a0e1a4 | ORPH
   s390x     |      googlefontdirectory       | TIM | https://autobuild.buildroot.org/results/202277d1cd632d0e30323f50ce4c1b0fd8a1dfc1 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/e2a768d3a9f9062b2917c1a2c6e3c484d3b70137 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/600bf268fc872ecedc0cfac7e6f21a948c19112e |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/a5fee000533b40ddea52bb774486621bc4b99663 |     
  mips64el   |      host-binutils-2.46.0      | NOK | https://autobuild.buildroot.org/results/4feda049276021e5042a55be2c3461886f3f3da8 |     
   mips64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/aabb2db602ae2966b202ea00e66423bb981dd516 |     
   armeb     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/2b03baecc1ae366114c897bbe7d34868801c1028 |     
  riscv64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/fc18926c7d37805c26740cc3f24ed58988057032 |     
microblazeel |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/0868e67b8c8fc532a180e193ce56c9068b11ea41 |     
   sparc     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/51003429d6b20bda4b46ea18293be734b07c11c8 |     
    hppa     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/b1171e54e9e149b673e0163b10e429384b45adb2 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/548234fb30331f84d3dc46c5aba1ce7df3790042 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/43d36d230ec7d2a3e6a5230fbf9786316552fecf |     
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/f891414ec1758785e92c553de6a1feef490642c8 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/5e8be6df0dcb733a8c223eb0d7bac4fb6ec93c8b | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5dc04674b7ba86938fb77058ec5aede48d937b63 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0d1c7824e51640b0a215c53e0daf71aeea1083be | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4730ff9e1c28daef064efcb9b3443a6b5a72224e | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b834392e40a8f1f067963840650466ebb70e1b31 | ORPH
    mips     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/ed9436022d8a4a9925f05a9acbed41b8e4cd5719 |     
  sparc64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/6b5c14fc15cc2c6736895f32a4f520e0577fe6f6 |     
    or1k     |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/caa481a19b945c0bbd079902452fbe9f07791783 |     
   mipsel    |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/032260b5bfd0d39f87e26fbb137ad012b068dc2a |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/2d333341a2a3a2e2d85f0402c0c33f3e8ffb483a |     
loongarch64  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/36fc1ac20fc99c85e37f54ba6a1dd56ab8a00a5e | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/e4363ced46b4d1e6e6ead4b9b56e54c53fbf7b90 | ORPH
loongarch64  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/79df45c29d457315b60a039923d97417a3dc42a4 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/317b6a3e3090f951322e32f288f5c3162df57d04 | ORPH
   sparc     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/e77c289f1726d699a005019d0f491a64aa56caa7 | ORPH
loongarch64  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/0a06924017dbacd75e191a8ee5fac4f928061997 |     
loongarch64  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/0d15b1ff960162c8f6ecbfb958f7ce9d0bad8407 |     
    or1k     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/53e0c3378f6e3cccd62ea40ff4f9b778c9d2e1be |     
    sh4a     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/9bbb58cfb4bc3d74f1d027dd4a60955ba95d4c60 |     
 aarch64_be  |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/d1bd79c18a98f354e6ede8e1968a336e2b1d6848 | ORPH
 microblaze  |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/2f017cb834014d54e1033833f6ee38590e4fded9 | ORPH
 powerpc64   |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/e71cdd50fe0850f676135247447ebc1a93420e36 | ORPH
    mips     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/6b99087b55739237c8674383f378ac4df53ee0c0 |     
    arm      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/e8a57f38428530affcc1f09adbfcbf7fcc109eb1 |     
 aarch64_be  |         iproute2-7.0.0         | NOK | https://autobuild.buildroot.org/results/227f8c0b3b18d15b17047756edaade85a8653af1 |     
  riscv32    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/ceec321dd5f5f9ee115f9f947797456b8cef3fdc |     
    mips     | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/3569b151a2dfd9570ea0894bdcb8e186acf05948 | ORPH
  mips64el   |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/4e256fc0cd4e8dc8013e8190d0577f9d3f07dd44 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/e88380a47395f77436c915a2bce6c81875ccc84b |     
 powerpc64   | libcamera-apps-v1.7.0-10-ge... | NOK | https://autobuild.buildroot.org/results/188eee96aa00e6057db11d3d8bc6278960eb3bc4 |     
   sparc     |        libde265-1.0.18         | NOK | https://autobuild.buildroot.org/results/ec51feaaf4516c9f62be4eedf729fcac1302cf31 |     
   s390x     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/6f134b3edece74bf8da3a2a95addf5bffe6ae7b5 |     
   x86_64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/91f69ef5486ea88fde3f16d93d2fa3c2c86f8efe | ORPH
   sparc     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/24853fc45fd7fe5c8ef59d7083891ab7312652e0 | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/f66008ef444cad0c0be6f0b0a148ca75cb747bdd | ORPH
 aarch64_be  |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/211aa61f3406c0b189ee81c38b52a56006cd77b2 |     
  powerpc    |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/145eb1c24934b36b00c504686211042bcd942ef7 |     
  mips64el   |           libopenssl           | TIM | https://autobuild.buildroot.org/results/22cdf3793c282ee1700e58bf2ad951a04433d8d2 |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/ee4fcc83151febf6f8ad5871f57b9aea2a305cff | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/c6d8402f8304bee6805fa14f6f3d81b6324ebd73 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/db8534d589c5d54048759c0435bd30c1489e3663 | ORPH
  sparc64    |    libphidget-1.24.20260127    | NOK | https://autobuild.buildroot.org/results/55aa1909bdc6cf5ba31758f13b977f6611408fad |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/bdc8f5ea9cd2af75ae1a49fd1da434000dd6229a |     
    or1k     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/719c474ff43e06fc56f3064797e65335341ecaca |     
   mipsel    |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/35b9d21c18e0f72d9e4a8ab3de6a53b3ec99869d |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/8232ca975f304e3510b2101241425432d6b0128d | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/6182243f6011ba768737c5b43772d0e18ed982c2 | ORPH
  mips64el   |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/1167b84b4b29365fd8e51943c03f7bb3be357f10 | ORPH
    sh4a     |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/e9cebf221b2eac935cb8b1ec091675adc37e0472 | ORPH
microblazeel |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/f73ddd5b9d13bbda37c9629b114e80181917553f | ORPH
loongarch64  |          linux-7.0.6           | NOK | https://autobuild.buildroot.org/results/694340c736a2f54ee2eeffb8fd65dd855555c566 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/e5623291a22bb4bd10b33d1c6d1b7079fffb1bcb | ORPH
    or1k     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/8f626fd8956f8108dd1b9a283d3f503fcefd74c8 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/51cb01ba66f8f239adf4985f6c29035a8531b857 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/5587b7c63292e8855a6cadeb338ac08161f069fd | ORPH
  aarch64    |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/8fe1abc27cfbad1794d3572fae59fa2225b6f435 | ORPH
   mips64    |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/83e6f224d7efe851230816652e37f77bc77ac1dd |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9e66dae1aca4f68cab1608b7dc9c438fb540a4ae |     
powerpc64le  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/0685bfb72e1606c16f148596ddf5c69e87877db0 |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/0af65e736479df981ab0ac39d0e07cca68ef4009 |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/585d932b2fe36d306edb323ba3c86de93b3b2a3d |     
   mips64    |        openconnect-9.12        | NOK | https://autobuild.buildroot.org/results/6f6906eb9621fa7b54692d4ccf68c21c7f753b1a |     
    arm      |         opendoas-6.8.2         | NOK | https://autobuild.buildroot.org/results/57b1a865332c2e0ce08f78ddbe9755b0b7667841 |     
   xtensa    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/2ca9821bbeae6e0600796f541434f929bf97767b | ORPH
   mips64    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/a42e9b0cd992897780d68b139ec8e03c5019e6f8 | ORPH
   mips64    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/cc1cfb60608fe7a28c0cd3652e469d1daaa33ec7 | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/5ad3cc5932277d266dba73884595849b8a3af629 |     
    sh4a     |        pax-utils-1.3.7         | NOK | https://autobuild.buildroot.org/results/304cb587eb727f27f924fbe63f6821b33022ee0d | ORPH
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/c329bbaa3495efcf448acee5c9d3b39d77337a69 |     
    mips     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/a7bb84b4faa554c2ca77a1699b50040351c49fc8 |     
   x86_64    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/cbfbee5c82070199ad57ffbb9b02a4af08a4dc49 |     
   x86_64    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/4e061151a5ca5477b19b94780f107442433fce41 |     
  aarch64    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/184fd430edb9fcfa8fbfe91971b9e307a9b7b556 |     
 aarch64_be  | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/075a82a632e979a9eeefcdf7a84d73664f124374 |     
powerpc64le  | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/045d7294eda52291a57bace9fb0defdad085aad2 |     
    mips     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/77f380e1ab421b0805470266558adb3e122b1b68 | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/bc25c32f1c3d97508ce12819a30bc415d1151d7c | ORPH
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/1a20947990fa56f8fdac2c5ea00fdd0eee6875c9 |     
  mips64el   |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/757b5dc5c0796c5db06fa38d4e39fcd3c802a545 |     
   mips64    |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/511ce1c75445cf90bcdff52e396a1b439573ac97 | ORPH
 aarch64_be  |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/54d34fc452f12f6471304be2da664669c5ebbb9f | ORPH
   mipsel    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/2d53c54d9b6607b4f1034c0f6b53f86be3829574 |     
    mips     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/e42c1ec8155a22597c843a5521bbc530d125068c |     
powerpc64le  |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/7d488bb951fadfbcb97979e0bbcc3eebf883033e |     
    arm      |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/b4cd1835a6a5ffa4c7e0ad7ddb8dd1c431a0b9b6 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/c5b93afae5f5307c758209e99aba610ed43d1bc3 | ORPH
 powerpc64   |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/c1913d357f399cafa8a5c6ef1da4c2f056525009 |     
    m68k     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/9cd95372fe7307db8be0c93a461e9b0119fb478e | ORPH
    or1k     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/be194289cba7334b448ac3edea494f16d946bc19 |     
    arc      |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/2a2a36d5a1598d8cfdd13c2036bba4b79c63556a |     
   mips64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/c4b16ba61ac1001df6134ead1ed76d3628d0cd17 | ORPH
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/05be073048ac7229c26080525f9c94c29256320a |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/84d3876580ccc6452ce10788662962736d8c16cf |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/e3f1ab374d82e05fbb3255429b4ccb410738e8b8 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/8d6fa04f1288fa7333b51b2985ef1f9a44a910db |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/79dd03d133908281beeb1cf062f9a896fa336922 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/385f7e6ba54ea69b9b962c96ef5a6f283665a55f |     
 powerpc64   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/7931d3ca3185c7fe471fc0e106c3efa66f3bfa2b | ORPH
 microblaze  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/f3c63766c630fa2a93f52b5f1efa486b98b20f3e | ORPH
 microblaze  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/3e1989d43c80e2c6d98b5f4e55e756f0f686dcf1 | ORPH
loongarch64  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/0c1db158adb8d39a4ec3a3d08a2f96979d93c917 | ORPH
loongarch64  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/3da5d3d141d9cca867e9f2b39e93893bf8d2877d | ORPH
 powerpc64   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/b78588b31495a1dac8cae97e12ff50e1a11222da | ORPH
   mipsel    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/69343a0ccff41c8be3ff0932f6b64dcf50b0eaed | ORPH
    arm      | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/8419a6be73d77441a7cc58895303c7b1b9dc818b | ORPH
   armeb     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/a99e7ab6a42a4bb2f0712c40e11cc71a1dcd9042 |     
    or1k     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/2093dc348ffe13526aa372ae3e51229ef70db9fd |     
  powerpc    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/05f3107703490084959b69b1c68c001965dbfb14 |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/f6cee5ce53565cb7718d549d30f0b8276e6f9da4 |     
    i686     |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/43044ab389947ee30073e49fd9fa98acd6b55087 |     
   sparc     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/9c6457c5707d6833f4e138bbbb8efbd3fc7ebc7f | ORPH
loongarch64  |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/4f60be7bbc18cd1f87d59a979cee62ee2c45d30a |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

       host-gcc-initial-14.3.0 | 14
                    fcft-3.3.2 | 1 
                haveged-1.9.19 | 1 
    host-gcc-bare-metal-15.2.0 | 1 
       host-gcc-initial-15.2.0 | 1 
             libgphoto2-2.5.33 | 1 
                 libmbus-0.9.0 | 1 
                   linux-tools | 1 
                       mrp-1.2 | 1 
                    ne10-1.2.1 | 1 
                openswan-3.0.0 | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/e18712fa114443c77780d177a4ad9b615b2331e8 | ORPH
    arc      |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/0ebd993d0dda316400b4487bda91e69265a066ea |     
powerpc64le  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/af8c5bcbdb8363d7e9cedfc7d16d3cc382d6c46f |     
  mips64el   |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/32e265cd163d7b69e124e010a4d68b98e356d19a |     
   mips64    |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/21e7363f8576ff67d997ea036c3a4012e17f08c8 |     
   mips64    |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/8ce92a6a84089a6da5a788a38d11f693dfcb01d6 |     
   armeb     |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/fe582eda461b0a08cf0b2e82d0cc0eef1c9728eb |     
   mipsel    |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/da0cf32d03d55c439d6350c4e5101c2b33233787 |     
  mips64el   |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/e50ae08ec741338cde33475cde190326016ee049 |     
    i686     |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/eab980f0da75872f73e047c35e385ac281dbfb3a |     
    or1k     |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/2ac54ebedbc54bd4110236114e6d6397aedb5435 |     
    sh4a     |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/89bbec759bb66e267b99dc40558bdf3bcda325df |     
microblazeel |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/062382e37ddb3ed4d66c4447d03031095881c9af |     
    sh4a     |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/70679c2663a5aedc1551ff3f1732af6ba2f962f3 |     
   x86_64    |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/43108d60165299794b7fe650087c6816175cf4d2 |     
    mips     |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/f3272acdc379574645334a48020aefddd8f0fb13 |     
   x86_64    |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/00ed631e896b69258b99d8d6dc7c51f5902bbc18 |     
    arc      |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/36e713eeef999469d2237f5830af07f153c9591d |     
    m68k     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/09a0ae733705de9e2996fe04f64eb5191f019f89 |     
microblazeel |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/c719da379ddec8a30391ba09ff3007884686c12f | ORPH
  sparc64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/5f4dc16ea608141d945f57a9f8fe682dde705d74 | ORPH
   mips64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/6ccdac2bbf3bb1cf442f10b6e02696ab1f2aa032 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/36dedd9af3175cd27d83f9d5808eaf02ee43378e |     
    or1k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/a4f04244e4dda0dee69d8399cccf944f3c80152b |     
powerpc64le  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/36801abf4e92a28f09523ee4f6aac818f447f62f | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

       host-gcc-initial-13.4.0 | 19
             host-cmake-3.31.9 | 13
       host-gcc-initial-12.4.0 | 7 
 host-softether-4.30-9700-beta | 4 
package/linux-headers/linux... | 4 
       host-gcc-initial-14.3.0 | 2 
                       unknown | 2 
                   dillo-3.0.5 | 1 
firmware-utils-86739f2b3ae9... | 1 
 host-binutils-bare-metal-2.44 | 1 
    host-gcc-bare-metal-14.3.0 | 1 
    host-mender-artifact-4.0.0 | 1 
        host-python-lxml-5.3.0 | 1 
                  iozone-3.508 | 1 
                libsoup3-3.6.6 | 1 
          linux-5.10.246-cip66 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250130 | 1 
                picotool-1.1.2 | 1 
    python-cryptography-44.0.1 | 1 
python-remi-2022.7.27-37-g1... | 1 
qt5base-2b9835f5c9bcfe3105b... | 1 
                systemd-256.17 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          dillo-3.0.5           | NOK | https://autobuild.buildroot.org/results/016a6da288c011cdd28b4c6b0c31dd1d91247a33 | ORPH
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/192c1394067165fb1377feb2f7ea3c08e4b76f1d |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/c6937ff8e34b3a3a3791889b4f69307d80cd5605 |     
   sparc     |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/7d35f73d86d5cec1ac5f66c4a8dccd07e8744f33 |     
 aarch64_be  |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/703f3a4dec246be42eb679aa74cd5922d72e625a |     
   mips64    |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/a7700d15040a738dd2d0b9255374ca887bc24351 |     
    arc      |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/fd49421286b7cc43c9f1897b494467dfd46a0d26 |     
  mips64el   |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/dc1086a5b9f8eb8f438e753c2a78c3f905c6b987 |     
  aarch64    |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/452c2742052c4000deece39940e060da93348002 |     
 microblaze  |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/647446695f4641084190201d1067ab6fbc6df97b |     
  mips64el   |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/51a36cf703c0e2653dc05706575e7329b43ff8c9 |     
   x86_64    |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/e4aef9d9b0736077fdc7b6ada80a3838a9327147 |     
   x86_64    |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/fdf8639b2ce800342639c444decd71e2a5129f47 |     
  powerpc    |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/3d93c059264cb2cf3f54c48e5f9bcec9a086c1b7 |     
  sparc64    |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/40ee3d765c413337437d075466ccb8c229ec27d8 |     
powerpc64le  |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/4e05afaf9132f8b037d0cd197384cfe009cf1b76 |     
   mips64    |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/c40a0424441e24811fdfdefd994e181f7ebb83ff |     
    m68k     |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/5f2250c2ea804b72349061180b54464ec72d28ce |     
powerpc64le  |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/48e3334156652032736a4500ad2eb0ad64da4889 |     
   x86_64    |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/4884536c2b50a3c11e04a65f9984826c60280904 |     
    or1k     |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/9a29daeff1beae2f4665fcba0cf27d96417ac1f3 |     
   xtensa    |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/6e9b4955af2d3b6dd758a5e797f617c00b98f754 |     
 microblaze  |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/2fd110348923c959ae58af35af708044f13194f3 |     
   armeb     |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/5b7504330244ab6f6dbb6f63820591a69f6794e5 |     
 microblaze  |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/60901f8fcf73a1afebcaa0ddc8d912a97ae972bf |     
  powerpc    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/d353806ad947b0717cc30d8c68befd61218b26fc |     
   mipsel    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/df6fb50c5a9eab59ecf80bb6f5609efceb7458d2 |     
 powerpc64   |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/280110391769edff4af54eb4ba72fa9bc02aa022 |     
   mips64    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/9c2434c7a6e41cecde4ee210017a61d5d0294ec3 |     
   armeb     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/b71885c1d6a4209ae3fa7edf9b109ff2c8c8c0a0 |     
   xtensa    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/745cde5f5be42b66859d0fa57c3ee92e298599d0 |     
  mips64el   |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/1846c827da413bda77e1bf25c077cdee6c80bf0f |     
   s390x     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/76e06d60a596cef0daec6786d9643e74e7c652a0 |     
   armeb     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/fd2c467b1bb67eb5a2526bce103c56c047c72a41 |     
   armeb     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/89a7c71bdebb332ff0f624eda59d5f1c4d33e941 |     
    or1k     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/b51f299b8677b4fe308c38229555f92386609ae7 |     
   mips64    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/eccae7b9f194ba055134c02d8bec276c3ec24f22 |     
   xtensa    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/cd345e712d6951d84b63360ddb5923d38f1485e9 |     
  riscv32    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/2f53b8f8ab0f4b541c13f4851e1eca04bbf5f9d3 |     
 powerpc64   |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/5e13ea649eeebc83e76908423a7f471e95db9e65 |     
   sparc     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/33ebe56a82729c09ebc5b24a8ba551c3e4af779a |     
   xtensa    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/cf825c034771e9a0a7d70ab38603ee90f55ff435 |     
    or1k     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/ee90d7d52795e366ebfd1cd3a3c61b46bd6c1ee6 |     
    or1k     |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/ee74758de93c5970d49cbc1f789e432496a1ce59 |     
    sh4      |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/0651bd116eefc271331697ef3cb3ad24d69357c5 |     
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/b6321ff5275e310a38c6a1dddd6b8ddecea97fc3 |     
 microblaze  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/b697a0aee5c9adb704d2775a836382ed228d8882 |     
    m68k     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/63593d3cf3ccb651a9ba0458ded957034c52cb3b |     
    arm      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/a464f4795d1c7f313abbd47cf9aa61c90c2e01b3 |     
    m68k     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/6557e7de5e1ab861f4f87adcb2c81a2f4bff1634 |     
   arceb     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/14660101c392011da600a3991c8d2710260619e4 |     
    arm      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/5e63440c389c03364604e4230d3f3db34acadcb4 |     
    or1k     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/f77c0434a458eede2ad76a221ded8ca0f2df12d6 |     
   mips64    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/35f615d29d29092c9e82616f990c3da658c72456 | ORPH
    or1k     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/becf27ab1916e19ac326f2f046e6154f0adbf09d |     
  aarch64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/dbb5db3fdd8bdc686683785feb1a592064145a87 |     
   xtensa    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/be07352dceca6574ea59739ed627103a0925e934 |     
 powerpc64   | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/dff1baf39866c41f8faf7949d372b8fb9cdb615e |     
 microblaze  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/ddbff7ea59d2a33a564daf9e6751d53fc9ac2812 |     
microblazeel | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/101a4dcd5c217b2e31b6e9fa730929036bcefd5c |     
   sparc     |         picotool-1.1.2         | NOK | https://autobuild.buildroot.org/results/15325434f2018bf8d503643be349e295e32e3ef2 |     
   armeb     |   python-cryptography-44.0.1   | NOK | https://autobuild.buildroot.org/results/dcc1435c2cdcba837bb6b3469a97aa43659433c4 |     
   mipsel    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/8d1c1fce2b7c6a582d72dd4a0aede8db280c7323 |     
    i686     | qt5base-2b9835f5c9bcfe3105b... | NOK | https://autobuild.buildroot.org/results/3e179552069080a8807dfab6a53ecdd639693299 |     
  aarch64    |         systemd-256.17         | NOK | https://autobuild.buildroot.org/results/f42fcc61f4e84f8681a64270594313d32de45bc3 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/9d4d83ac25c314a3273a7d97e4f577b55be0d115 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/c73db9d32a8bdcdf53b185bc0b13dfef4b411f79 |     
 powerpc64   |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/88dcd541ac287ec7193cc7f8416f196c878d0a1b | ORPH


Gitlab CI results for 2026-05-14
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671539 |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671540 |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671541 |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671542 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671547 |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671565 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671567 |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671570 |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671571 |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671592 |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671593 |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671594 |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671596 |      
                   beagleboneai64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671595 |      
                       beagleplay | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671597 |      
                     beaglev_fire | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671598 |      
                       beagley_ai | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671599 |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671600 |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671601 |      
                   chromebook_elm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671602 |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671603 |      
                        coolpi_4b | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671604 | ORPH 
                      cubieboard1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671605 |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671606 |      
                engicam_px30_core | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671607 |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671608 |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671609 |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671610 |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671611 |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671612 |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671613 |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671614 |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671615 |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671617 |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671618 |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671619 |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671620 |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671621 |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671622 |      
               freescale_imx91evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671623 |      
              freescale_imx91frdm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671624 |      
               freescale_imx93evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671625 |      
              freescale_imx93frdm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671626 |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671627 | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671628 | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671629 | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671630 |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671631 |      
           friendlyarm_nanopi_r3s | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671632 | ORPH 
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671633 |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671634 |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671635 |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671636 |      
                 hifive_unmatched | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671637 | ORPH 
                          hp_9000 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671638 |      
               icnova-a20-adb4006 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671639 |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671640 |      
                         imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671641 | ORPH 
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671642 |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671643 |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671644 |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671645 |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671646 |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671647 |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671648 |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671649 |      
               imx6ulz_bsh_smm_m2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671650 |      
                        imx7d-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671651 |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671652 |      
                       imx8mm-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671653 | ORPH 
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671654 |      
                  imx8mn-ddr4-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671655 | ORPH 
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671656 |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671657 |      
                       imx8mp-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671658 | ORPH 
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671659 |      
                        imx93-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671660 | ORPH 
                    imxrt1050-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671661 |      
               iot-gate-imx8_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671662 |      
                      khadas_vim3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671663 | ORPH 
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671664 |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671665 |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671666 |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671667 |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671668 |      
                  loongarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671669 |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671670 | ORPH 
                      ls1043a-rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671671 |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671672 |      
                      ls1046a-rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671673 |      
                  mangopi_mq1rdw2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671674 |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671675 | ORPH 
            microchip_mpfs_icicle | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671676 |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671677 |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671678 |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671679 |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671680 |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671681 |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671682 |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671683 |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671684 |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671685 |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671686 |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671687 |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671688 |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671689 |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671690 |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671691 |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671692 |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671693 |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671694 |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671695 |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671696 |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671697 |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671698 |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671699 |      
                       nvidia_bf3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671700 |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671701 |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671702 |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671703 |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671704 |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671705 |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671707 |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671706 |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671708 |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671709 |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671710 |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671711 |      
    olimex_stmp157_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671712 |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671714 |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671713 |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671715 |      
                  orangepi_5_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671716 |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671717 |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671718 |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671720 |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671719 |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671721 |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671722 |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671725 |      
                  orangepi_zero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671723 |      
                   orangepi_zero3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671724 |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671727 |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671726 |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671728 | ORPH 
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671729 | ORPH 
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671730 |      
                  pine64_pinecube | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671731 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671732 |      
            polyhex_debix_model_a | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671733 | ORPH 
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671734 |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671735 |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671736 |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671737 |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671738 |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671739 |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671740 |      
                  qemu_hppa_b160l | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671741 |      
        qemu_loongarch64_virt_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671742 |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671743 |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671744 |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671745 |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671746 |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671747 |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671748 |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671749 |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671750 |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671751 |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671752 |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671753 |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671754 |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671755 |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671756 |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671757 |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671758 |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671759 |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671760 |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671761 |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671762 |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671763 |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671764 |      
          qemu_riscv32_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671765 |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671766 |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671767 |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671768 |      
            qemu_riscv64_virt_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671769 |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671770 |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671771 |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671772 |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671773 |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671774 |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671777 |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671775 |      
                  qemu_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671776 |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671778 |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671779 |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671789 |      
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671780 |      
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671781 |      
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671783 |      
                  raspberrypi2_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671782 |      
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671785 |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671784 |      
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671787 |      
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671786 |      
                     raspberrypi5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671788 |      
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671791 |      
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671790 |      
                 raspberrypicm5io | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671792 |      
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671794 |      
             raspberrypizero2w_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671793 |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671795 |      
                          rock4se | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671796 |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671797 |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671798 |      
                   rockpro64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671799 |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671800 |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671801 |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671802 |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671803 |      
               sipeed_licheepi_4a | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671804 |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671805 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671806 |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671807 |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671808 |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671809 |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671810 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671811 |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671812 |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671813 |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671814 |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671815 |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671816 | ORPH 
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671817 |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671818 |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671819 |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671820 |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671821 |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671822 | ORPH 
                    spike_riscv32 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671823 |      
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671824 |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671825 |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671826 |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671827 |      
               stm32f746_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671828 |      
               stm32f769_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671829 |      
               stm32h747_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671830 |      
                   stm32mp135f_dk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671831 | ORPH 
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671832 |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671833 |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671834 |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671835 |      
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671836 |      
                     ti_am62px_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671837 |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671838 |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671839 |      
                     ti_tda4vm_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671840 | ORPH 
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671841 | ORPH 
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671842 |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671843 |      
                   versal2_vek385 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671844 |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671845 |      
                    versal_vek280 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671846 |      
                    versal_vpk120 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671847 |      
                    versal_vpk180 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671848 |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671850 |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671849 |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671851 |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671852 |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671853 |      
                       zynq_zc702 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671854 |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671855 |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671856 |      
                zynqmp_kria_kd240 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671857 |      
                zynqmp_kria_kr260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671858 |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671859 |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671860 |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671861 |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14360671862 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
