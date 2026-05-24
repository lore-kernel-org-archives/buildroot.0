Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD99FCD4F54
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 03:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5930E60D7F;
	Sun, 24 May 2026 03:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxXwF1cshZ6z; Sun, 24 May 2026 03:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C927260D74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779592805;
	bh=2uUYZ3h0X1u9dzP5/fTu0Po7FcbC6XI8HilNfkj2uLI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bkYQpHiVpCKEKk338B3FUbbkIza/FMKMiqLOy50IfszWq4cApGy93Y3B+dUgFTkB/
	 V58klGySjTYOOTZHvrzgxvOaRTBNRTdK9SDL5PB4wnweQnYOZvLny3/uslRPIk4BBw
	 aOAftDQdCVyWm4N4OmG4ipEDd2b7Kno9JG53C9yVYjSbndhdkQ3oV6I6sW5xG02HRk
	 zo34pEQ//omTUJI7lZSPKUpmY4A+0W4iMiyPYfaCwC3EkJ3HzrdkOD/bJ6HE4EGYWc
	 rVskoEvuSaNimGpDm1OVHTtS0s9R7ZQmuvzKsoxuQzBSm2zopQphvMDcjDwFd5E44U
	 KQif/2iltV/Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C927260D74;
	Sun, 24 May 2026 03:20:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B6A19282
 for <buildroot@buildroot.org>; Sun, 24 May 2026 03:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7D2660D74
 for <buildroot@buildroot.org>; Sun, 24 May 2026 03:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOSF8JqKOHPA for <buildroot@buildroot.org>;
 Sun, 24 May 2026 03:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D22860BD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D22860BD8
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D22860BD8
 for <buildroot@buildroot.org>; Sun, 24 May 2026 03:20:01 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4904c1ce4c1so15699645e9.3
 for <buildroot@buildroot.org>; Sat, 23 May 2026 20:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779592799; x=1780197599;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jSBFSbBY1bukwYaAEFfhwhLVc4n0FlWuFYBJI+3NkfA=;
 b=WoSyg41xJpaLBS2qoNdZeAddJ/G3H4/eGCV9Z4dPmvHyX+aJnaPk42D7ILGF+OX0Tp
 PQ783uVTacq/sKB52Jcs+VyYM/2lQpyBJmucbSmGHHJthQkn0umW/i6NUoRMpR77/OKh
 +m98Bu63wNZw0sLkRvTd4tSZIq7z+TDiDEwRFXAAzTXV57VdnkbKjDpwEjrv6hiUHeKI
 Su3/jScEnCrRXPElQFuuR6z3AEf+A9hjdMrikoIcZh9j5lyMUxBxIGzbiAHYteJ+h2Mm
 RWHS0CHxLFtyDgmdJFJdHzlQMe5dTUFxHpUK9hevYDFo739CuBVTYNwhXQECJ8y+qOCn
 Bpww==
X-Gm-Message-State: AOJu0Yx+f19+/Ip2VYxU0kkVorPfYsJ+M+V/yisQ+wb6DgTp+s9HzvCH
 2vLwARVNrw5NyuTxhCdRieBI8cFmwNST6uxXLtRencTLWzcHHY1yk+bR4hiTXCOz
X-Gm-Gg: Acq92OEmNiCaVyykmpkWOoi2QG4G7xhXGrwpsmnvCOij0wx5ac8u1yTWfyQ3JaH86VO
 Ac2RklOHJrRo/IS4spMe0ienwkjz3lpQswxnah84Sxi30PWjv8UcF1dhYwMRoBtY5GAmtBpKyeg
 lggOo4iExCXt7pKT55P0UM6y0Xi3IlQPJMBXsFvWQpC1TtZUqR5NC3wFJh4ohWVB3O+Sy4P1KuK
 22dPZzLtWs+ICf+0Dm8ajSWYs/7TG53CpHXbdZ6yobsc+WZvJyi7sq6XOCb3itYxiD46ntxNCnU
 DMJQREzrHr/DqnWLxlR/olR8b+TxGGYYVpa/mP1hDtDtiPTl58STBuURjlM/lqfjRQMa185XcWi
 Ld5eRGA+YPud+SsGwAqV9r+gg7FidleOQCyxt67LWhoo6siaEU2nh2vVDJoM8lOIClZF+h7DnA7
 zw8Y1RyzwuyM1w5aB1thAQXseSzaG3Gw==
X-Received: by 2002:a05:600c:5254:b0:490:484b:bf41 with SMTP id
 5b1f17b1804b1-490484bbf7amr127431695e9.6.1779592798582; 
 Sat, 23 May 2026 20:19:58 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49045282201sm167960175e9.8.2026.05.23.20.19.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2026 20:19:58 -0700 (PDT)
Message-ID: <6a126e5e.4b72e539.1e0ac1.8a64@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 24 May 2026 03:19:57 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779592799; x=1780197599; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=jSBFSbBY1bukwYaAEFfhwhLVc4n0FlWuFYBJI+3NkfA=;
 b=p7cntIhfXmwt9yDkImOsSHsMEEC+Fns0EPQoh/EGlOaTDSHhSotEr7aVVBuOHHne2G
 OqiODOEJyh1/dQzdFT6zTnBnDuT+9Xx3AWKglGgawG3dVSd+6wDRHLb92YPnWV9vxpob
 ZJ8sMkmO4Tdi5P7SS05KZ5g8Z0KpXlizCp1axTqcMTqAB4HdwFcrpZQN4vxZ50KXD34W
 Z8X6IkrIet08NLGQ4Bfzsq+4K4s7zywJjpkKITomS0SB0hqMTKojFGXxyaPtujts3DBW
 lDrnlBK+rMZ3CsQohAqMtvS29Y5eXu0NExebdd32QNq7HCItQOUClvW1rzExkBYsbdVe
 MtxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=p7cntIhf
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-23
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

Autobuild statistics for 2026-05-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 16  | 18  |  0  | 34  |
  2026.02.x  |  9  | 15  |  0  | 24  |
    master   | 102 | 420 |  1  | 523 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 33
    host-gcc-bare-metal-15.2.0 | 27
               host-dracut-110 | 25
                       unknown | 16
               linux-pam-1.7.2 | 13
glibc-2.43-27-g4070d808bea1... | 12
odhcp6c-f19dd37fb467c9cf10c... | 10
                host-odb-2.4.0 | 7 
             util-linux-2.41.4 | 7 
            18xx-ti-utils-R8.8 | 6 
              host-guile-3.0.9 | 6 
                      lft-3.91 | 6 
                       mrp-1.2 | 6 
                  ntp-4.2.8p18 | 6 
  gobject-introspection-1.84.0 | 5 
    host-mender-artifact-4.2.0 | 5 
              host-pahole-1.28 | 5 
               libpthsem-2.0.8 | 5 
phidgetwebservice-2.1.9.201... | 5 
                 rtptools-1.22 | 5 
uhttpd-15346de8d3ba42200249... | 5 
ustream-ssl-5a81c108d20e247... | 5 
             dahdi-linux-3.3.0 | 4 
host-gcc-initial-arc-2024.1... | 4 
host-vboot-utils-7dfa482d6a... | 4 
                     kbd-2.9.0 | 4 
           libmicrohttpd-1.0.5 | 4 
              libopenssl-3.6.2 | 4 
                    lua-ev-1.5 | 4 
                   perl-5.42.2 | 4 
                   ptpd2-2.3.1 | 4 
                 sqlite-3.53.1 | 4 
                   dante-1.4.4 | 3 
firmware-utils-c42a3bc53da8... | 3 
                    gawk-5.4.0 | 3 
                 host-gdb-14.2 | 3 
            igd2-for-linux-2.2 | 3 
      libphidget-1.24.20260127 | 3 
                 libzlib-1.3.2 | 3 
          linux-5.10.254-cip72 | 3 
                   linux-7.0.9 | 3 
                    olsr-0.9.8 | 3 
                openssh-10.3p1 | 3 
      passt-2025_06_11.0293c6f | 3 
        util-linux-libs-2.41.4 | 3 
                  cairo-1.18.4 | 2 
                easydbus-0.1.0 | 2 
                 gnupg2-2.5.20 | 2 
               graphene-1.10.8 | 2 
                 host-gdb-15.2 | 2 
          host-xfsprogs-6.19.0 | 2 
                  iozone-3.508 | 2 
            jpeg-turbo-3.1.4.1 | 2 
                 libavif-1.4.1 | 2 
                  libbpf-1.6.2 | 2 
libdill-32d0e8b733416208e04... | 2 
         libhdhomerun-20210624 | 2 
                  libnfs-6.0.2 | 2 
     linux-5.10.254-cip72-rt32 | 2 
                   linux-tools | 2 
                  pdmenu-1.3.6 | 2 
            python-numpy-2.4.0 | 2 
           sane-backends-1.1.1 | 2 
       sp-oops-extract-0.0.7-1 | 2 
                  stunnel-5.78 | 2 
               tcf-agent-1.8.0 | 2 
           uboot-tools-2026.04 | 2 
          aardvark-dns-v1.17.0 | 1 
           alsa-utils-1.2.15.2 | 1 
               asterisk-22.8.2 | 1 
                   atop-2.12.1 | 1 
                 babeld-1.13.1 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                  bcusdk-0.0.5 | 1 
               collectd-5.12.0 | 1 
                diffutils-3.12 | 1 
            erofs-utils-1.8.10 | 1 
                flannel-0.26.0 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                     gdbm-1.26 | 1 
            gdk-pixbuf-2.42.12 | 1 
                        gnutls | 1 
                haproxy-2.6.27 | 1 
               harfbuzz-14.2.0 | 1 
            host-binutils-2.44 | 1 
          host-binutils-2.45.1 | 1 
              host-cmake-4.3.2 | 1 
           host-coreutils-9.10 | 1 
               host-efl-1.28.1 | 1 
host-google-breakpad-f49c2f... | 1 
              host-rust-1.95.0 | 1 
      host-uboot-tools-2026.04 | 1 
               host-zeek-4.1.1 | 1 
               host-zstd-1.5.7 | 1 
                   i2pd-2.59.0 | 1 
            igh-ethercat-1.6.8 | 1 
                   iotools-1.8 | 1 
               iptables-1.8.11 | 1 
                jemalloc-5.3.0 | 1 
     kvm-unit-tests-2025-06-05 | 1 
libdbi-88b8477d57153b9f736d... | 1 
               libdvbcsa-1.1.0 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libftdi1-v1.6rc1-2-g92d657b... | 1 
libfutils-c326ce0cc2a735438... | 1 
                 libiconv-1.19 | 1 
                 libmbus-0.9.0 | 1 
                libosip2-5.3.1 | 1 
                libressl-3.9.2 | 1 
              libsecret-0.20.5 | 1 
libuci-f3fc0b76040685829191... | 1 
                 libusb-1.0.29 | 1 
               libvorbis-1.3.7 | 1 
       linux-firmware-20260410 | 1 
                  lldpd-1.0.20 | 1 
                   lrzip-0.651 | 1 
               lrzsz-0.12.21rc | 1 
          lttng-modules-2.14.3 | 1 
make[2]: *** [Makefile:4678... | 1 
                 mbedtls-3.6.6 | 1 
                     mtd-2.3.1 | 1 
                    musl-1.2.6 | 1 
                 nethogs-0.8.8 | 1 
               nushell-0.108.0 | 1 
                openntpd-6.8p1 | 1 
                openocd-0.12.0 | 1 
                   openrc-0.56 | 1 
             parsec-tool-0.7.0 | 1 
        perl-xml-libxml-2.0134 | 1 
          pkcs11-helper-1.31.0 | 1 
               postgresql-18.4 | 1 
           python-brotli-1.2.0 | 1 
            python-iwlib-1.7.0 | 1 
                 rtl_433-25.02 | 1 
             superiotool-24.05 | 1 
                 systemd-258.7 | 1 
                    szip-2.1.1 | 1 
              tailscale-1.78.1 | 1 
toolchain-external-bootlin-... | 1 
                 uclibc-1.0.57 | 1 
               usbredir-0.14.0 | 1 
                     wine-11.0 | 1 
        wireless_tools-30.pre9 | 1 
                 xenomai-3.2.5 | 1 
                  zeromq-4.3.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/107ea6b16902b3eee969b691e471376a9b989603 |     
   mipsel    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/14598020e1a738ff3266742acbcda8270194230e |     
   s390x     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/767d9946e71543f9fece078406b468234750b794 |     
  sparc64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/de7a0addbe8edb2b965c8e12a9d4522d8a8011ca |     
    sh4      |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/ca9a68717ac1a82eaf87decb9a3e04d5d4e0d09c |     
loongarch64  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/948b057cde4e7cfc4bf91f603533d08f27dd89a3 |     
   armeb     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/5463929c7333f8742e8707dfd1cc4e0f2e1aa86b | ORPH
loongarch64  |      alsa-utils-1.2.15.2       | NOK | https://autobuild.buildroot.org/results/64abaabe5bfd1e5125e460cb5859e3189faaac94 |     
microblazeel |        asterisk-22.8.2         | NOK | https://autobuild.buildroot.org/results/345d734f628aa040b01455b326c8d9c86e82336b |     
    or1k     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/5ee9032ef2d66015ceaa4499d9fe1dc8487421dd |     
loongarch64  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/bbf92b46ca8229e699dab24d8d7aad7cc2ebb67b |     
    m68k     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/a9cc7e96a660b426c594eec0a6bdec2d0759835d |     
   sparc     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/d6bcae7e6ab970961a38092a34dabccdd6346a92 |     
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/b326b0965f701e0a49b3323ebdab70e6e19c1c69 |     
    arm      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/fd6ae1a75ea8bc413a1af03702f93ee0ba87f0b3 |     
powerpc64le  |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/2d0620a799a834121e2a04bce2e9b070e5b455b2 | ORPH
    mips     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/29f79531516e3c05d7bc6c4b9a6f4061a44b80d6 | ORPH
    mips     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3f02f39fbf7b0fecff32bf7d9631e9af9857db5c | ORPH
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c3dfb1e87c220290e327d5fc3b577969f8980d0f | ORPH
    hppa     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c2bedb09c4573dfceda0b8b53e905d4c2d2667ec | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/ae35bb76e979339e797c2c83a9ac2c59c756c2c5 | ORPH
   sh4eb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/33be06b29bc32254793c0c69a43994bb063fe274 | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/63817cac85bc0e30c47c084d9dc65ff466c4c946 | ORPH
loongarch64  |         diffutils-3.12         | NOK | https://autobuild.buildroot.org/results/51a0e2bb1e69724ca74d4c9e48560356b21119e8 | ORPH
   mips64    |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/21af0cedaf39cdd2980355b126eea6903796b724 |     
 aarch64_be  |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/743261296d607977a2aff7ca44b7d29c6cfda1c1 |     
    arc      |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/20a5f1d39b21fd220a10de13cfb2fd663927305c |     
  riscv64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/c62595990452c5376682b6343855c1fdb2c70598 |     
  aarch64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/79a7c7164ff9660e807681d2602c64a23a58ad49 |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/5cfae88c4badc01794ed6ac3aec54d3110c66a09 |     
   s390x     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/d59a4fbfe0de1a48133c5f90860fb0143944bb5a |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | https://autobuild.buildroot.org/results/f8568fc46f26652e1049ce473301d821392dfd26 |     
    m68k     |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/c35f7a839f6e1ff677fafbe2efdf623cf80709dc | ORPH
    i686     |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/e6bff954a978301d009aa4df7905f64d1e8b13a1 | ORPH
  mips64el   |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/a79084f2d60a742af4ff827820f3fbe4c0c7cdc1 | ORPH
microblazeel |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/5b34702a81c642952f4b84f8999f7e813414242d | ORPH
    m68k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/c9364f730c31b7c3037373f3307abaf6ede16191 | ORPH
  mips64el   | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/0757aeaf5095d2c4df09f59e5b6251608f462ceb |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/eca28b22b78f3484cc81b43db60309875aee26d0 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/e0cc681e13b44f9a3176b856650e626dbdae200d |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/a8e02242ca9a17fccc5d07705b4f1d8713bc75e0 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/76df16f878b098fdebfeb235c6c3a8583d09a165 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/6b6187d88ce1b1e7e441e47ff2444116446ccc97 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/deaad79c9ea3b4d2fdc8154716bc9f0c88aa9d97 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/9965658a1e6fce7851571c5ae9f5956df7d01ee1 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/4f0336d8e9243ad062d2eb7fadeb71377affdbae |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/68f19a0643de2f4e46f7a33e0ba717762893cda4 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/de6cd1695b849a3af568cbfa52032aff78f6b5ad |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/ee6180fd973c088f506927218ee04658e854880a |     
   armeb     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/41031b15c033e2c440c033cc6bb9bdae78e5103a |     
    i586     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/fd81676696684d2f10add09512001bc4055853e9 |     
powerpc64le  |             gnutls             | TIM | https://autobuild.buildroot.org/results/baf55546dda90770b8be3786242bd464828adc3b |     
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d5c32954ffb393f660265b93194e9e253b1757a6 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3c0e33a85a7af9480e9562175092f5a96b74714a | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/86ef2f27966297ed6972e9a528adcaba78e3dee5 | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/38336c6a2ec299b2351f7ac4d9b4a456f1e718d2 | ORPH
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ece2baac2201a475d561eefa8ab36f5ff4253225 | ORPH
 aarch64_be  |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/815923b239916208555ae081b7696c0b3d60e511 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/3e0ab45c9c6a8317303ca99c160960b36c2c5a8d | ORPH
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/0e9e12fe0d7494368b385b522031f8023c5376d8 |     
    or1k     |        harfbuzz-14.2.0         | NOK | https://autobuild.buildroot.org/results/1a8f4b07d001b0e10839c4a74c3ae87432c5c75a |     
  aarch64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/07aa4860690bb09ef4ac1d4ecbc6f63cd4f818c1 |     
   x86_64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/b4d7d16795bd6a61f3b08d258999f16a4ae7ccbb |     
   mips64    |        host-cmake-4.3.2        | NOK | https://autobuild.buildroot.org/results/30233313884d1bc284cc81d5582151f23e3dad0e |     
    i686     |      host-coreutils-9.10       | NOK | https://autobuild.buildroot.org/results/748d160cb75bcae95539d788d4007e7436a77e4b | ORPH
  sparc64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/b0af6e8fe495146e8c80b9d82eec86e0623cddc6 |     
  powerpc    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/dd52b1e216f0613a4c4824a8553a3af21dbcae8e |     
    m68k     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/241803079bd86f2df463cc1159de944a867ec021 |     
    hppa     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/1fd9f85b54f02a580d7b49fb04c0001d8e713e83 |     
 aarch64_be  |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/70afcb56d4ff430ac8e11139b7f052a956f25def |     
 aarch64_be  |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/214c11666f3dfe76e01706f7340215c2cb63a138 |     
   sh4aeb    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/30afef97c7cdba581cd5e846a66dcb0b2e2457b4 |     
 microblaze  |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/e46ba86ae53a89146d2f8efc391dc68e4082c2ab |     
loongarch64  |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/743a1adef802cb72613b2fcc90d8a1c28952a3b1 |     
   sparc     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/1a03afdab061f42c5c27ab64ac239d5f3f8d5290 |     
 microblaze  |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/a45f0236c4bf0ccebaaed3f6a66168c9b7e4a892 |     
   sparc     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/e0fd17175e00d00eaa29f8807a5777b9a4f5a5ee |     
  powerpc    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/037739939e08fd81954149a5cb87501934d6f4e1 |     
  sparc64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/13f01561122be1345966dd6c6a5ddf9bf533b9b9 |     
   mips64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/d72f51ef25220a9822435215774ff7387cebb240 |     
  mips64el   |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/c93fe763bdd8ae82739bad4f9de79e388ad20d7d |     
  powerpc    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/96591979371287f8c672abaeeca16f5e2fb130d2 |     
 microblaze  |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/8bb63ebadcb1ef0063771b8f3b01a479b1ebab05 |     
  sparc64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/4453a6bdbaccbdc1e1edd0bf616a61710e376488 |     
  sparc64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/b663fb625f6e153ed64ffba0d9f7d672181b3eb8 |     
   armeb     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/162005b771f5b8feb94a204b8a69c0537f70662c |     
  riscv64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/528cccf71d1de9d57ae84c90826b535cfd32d867 |     
  sparc64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/f907a7695a28ad14abe0bc57d4f310eed41f6fe1 |     
    mips     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/da47040ce46203f284552c1f1bc65272a3cbc82a |     
 aarch64_be  |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/5d458d56e87a47fd328cfcfe6d09381cc5e02be0 |     
   x86_64    |        host-efl-1.28.1         | NOK | https://autobuild.buildroot.org/results/4e8b4889f1171bcec89332390a583225826ad1e7 |     
 powerpc64   |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/628a33073505f26271eaa49d30d3ad9003db76fe |     
microblazeel |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/6e4a6ca0687cc3251dd4632357f5014321eee8f6 |     
microblazeel |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/e417ec7e0f3676efce5a85d8190b6675835e4bec |     
   s390x     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/c9ef2ba431df778f03949571d6aaaf737debb888 |     
  powerpc    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/441b289a8641aa11b1b8bff3320194945a31f936 |     
   x86_64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/b98be8500c9434cd8dc8801b4c6882eb0e3e0b1f |     
    arm      |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/fe0c9d9a3223bb35732990235dcf41d798406a65 |     
   xtensa    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/d815bc1035ea157e963c758f976c827af687be1a |     
    or1k     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/a1cb5545e5d68e47801e29e5343ecbe46b843500 |     
   armeb     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/6443350221399172abd36559a22befde3d67433f |     
  aarch64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/de3007bee9bb008b0b0a5e719c4d42323f181807 |     
   mips64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/398003d4e06c33231d5e1366dfda9bac7301fe39 |     
 powerpc64   |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/7578455c475f2e8d78f27527749387cbbb67aa62 |     
  powerpc    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/3097ac6c01ff5de433bfa4a6543a239ad2feec0d |     
   xtensa    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/1273fceb559c6291e1a6dc1dd2bf782092220a62 |     
loongarch64  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/5ec65c7c8c30732a1f536d4b69299c5c4c27c57a |     
  mips64el   |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/ac38678ad65a7ab0bb6aa18b34f60b2d1307ab31 |     
    mips     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/efdccd83f8b19ff90f9886a6196fb1b1fbcee0a8 |     
    or1k     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/915047e2a89dd2314ec7bff9d0fc46eef7fea74e |     
    arm      |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/d100b1f3398c1a3ed67c3d25af3f2bcf2599fcea |     
    arm      |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/a2cf16bb472bed2eded9ce808887d4bc32ea8c3b |     
    mips     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/47cd560d920791121f23759c99ef479eb9a15620 |     
   s390x     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/417e10849b28f10c5c16fb469cb18fa19c723004 |     
    or1k     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/9a434f648a9a08c3086bb84314b9a7513f5390ea |     
 aarch64_be  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/f7b1887c7d6d6ddc6d592393ed57dff5c7859243 |     
    arm      |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/f535363d09e1efc6218968e9c0cac3c5a7c21f64 |     
    mips     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/766c524e3ed869a55b81485cd3fdcab5d47dd299 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/a963f4689905ca575f14d24a5fd7c2f3debb9ad8 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/0d2ad16270d32dd266c9ab0b8246205abd43cdd1 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/6fdb2e21fad0fea9234c7dfb80f0f6ed1e395e30 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/dbde2bac36263870be37e06b251d3ae3de813ade |     
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/3214aaa6d6d3f1de6ab30f2fe2bcc4da6b15bf15 | ORPH
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/f9e53965f180d2d6fcf5c4a36e9b7ec09a952fc6 | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/3860a9bae08b0e5e1ec3d81f5c7893b19cdbdc45 | ORPH
    mips     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/69a0fc07c6751c9f7c22451c56f06f62797ec251 | ORPH
    mips     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/26dc02f6d2739e9dd6d75f13fe5369454bd7fc79 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/519c5a25044fc220c4d835f5349646e9cebe0be5 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8db55de99a2af44b3f2166f575fe823984319837 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8056821e6b95078fb922d1c77bdec49a4dd99c65 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/acf23167d7cc67b4ba601caba89128efd70e6b4b | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c0af8c9c213473f0db89551f0fdd4734d96fefec | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c9a48169b7d4508be0db49a02490e9f4b1214fa0 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1d38dabd9fa4ff7a6b028c452e54c0339f571df3 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bd3a98454e91f8454934fee5bf28dd3dc3625ace | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/86e35f7cc0b7de994879c7920057cd7a65a53d69 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/84ba7def47163293387aff00f5d803e7bdf7ba83 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/682485dadd07271f8921d65f000d43ea01322057 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/82fae34002af66ac671d0b13823b99d8dfdae2a9 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fe520a9fcb8533a5f37f611eb164cf1db581fb28 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7d7aadb193bbb317ee408a7dd053f4086a64116b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bd13a45c648966460b4bffac92611bc5daa255d1 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/94b90612e2c3c9e7bf442c7e8be042bc832c2ede | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/752aa144f0185d073a9dcbbdb2ffbaf822dd4dcd | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/297a152e70fcab739819b2bd034393797084eb24 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c3777e7a24f38042c7878a453397e206475cb4ea | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/574a7ec9fd7604512f43cf76425cdac9c31a4148 | ORPH
    hppa     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9aa7e77009de6188748d423c680e2dfc19d75121 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/95a77c96dc4cf5c87833020f602ad3c09c6521f3 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/856f429784c74764bc712b256201197b44e01971 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4042952e7551edc6869032ef317d94a1883d7f70 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/966ed93e28bdc262f89ad01862be60b20132364a | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7f12720cbdfa5ccb2e13a8b191dc04a19bcc12c6 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/146cec6913662c7cba3883531c905eb77b61f302 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ce4c0848fd77ace49e3ddf42cc0d680009f0c966 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b2f4432ebe020bffe2c29e6c6606edc0252a74e1 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/56b5c24be212e11c44a7fd0dfd00eaa945d1d3c5 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/284c200c2d99c2715d44e0bef565d28374b2190a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1f1181e1e5c9e4d23bbb6c2191f5d1a94b85139b | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/39be48036c8b3bffda5bc6ec4d5cd70c88dc8b4d | ORPH
    mips     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/b8047c8c22241a622315cc2518962629924cd707 |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/46c2930892a02763f5a4fd4aae3b955aa4330756 |     
  mips64el   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/2a6c33812cdb2263166ea56e6e413ceafe4f2b74 |     
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/2c5bd61ab4352103ed58bbcf182c86515c965156 |     
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/8e9cdcc69d8aa1107885ab5070c3af47704afb51 |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/b4b52f382eb8cd3753de2b108a0909136f92e257 |     
    mips     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/11bfb2c4d2f5556ecee5eb8a902f5c72d716a3d4 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/f2460d924fe63eeb7bdc8e05f1eb4b2a14ca632f |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/5200df12c236db8b3c0354bf6f4131ce99ca934c |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/c2f30936d554701bf946225bd5703939952c3f4f |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/a350e5498187b0f152d593bcee121277c6efbd7a |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/dbcb795417fb293c1998d2654fbf97cdc89677e7 |     
microblazeel |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/81342ae3816be980593f3aaf681f4d98063dc279 | ORPH
microblazeel |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/8a744f5c4a0deee9c6735e258054d53a78de4c77 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/b56952759e193f6ac3a36fd312fc7e1af637f86f | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/81fe5fcdae51d925012e994909ee4e77dec547e2 | ORPH
loongarch64  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/b5fb03bba20616758fba05485ca5cfb61d46d0c3 | ORPH
microblazeel |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/659ed65c21e000afe733ef941ba015b68ef0310d | ORPH
loongarch64  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/983708de42f4e044d052d87bf365f88b1511eb4c | ORPH
  mips64el   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/6d115e590a420831ba89ce0505009a4d0b4a3cfb |     
   s390x     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/3fd2677b77ee0cf19a540e2c89cccc6b4c9fc3a1 |     
    hppa     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/a8d1289b9212c7f420d1218726b544ea325c83d7 |     
    arm      |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/afd67afc3c5d0a2b30d547103abda5387b2e5d39 |     
    i586     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/4c3dbb9111fefda8cf76fbfca86021ee48631c7c |     
   armeb     |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/69778bba989c0df2b9ce1dd47137c0674de3f9f8 |     
loongarch64  |    host-uboot-tools-2026.04    | NOK | https://autobuild.buildroot.org/results/906f5f8bd70285f1a3db4db37a7170e943fcda40 | ORPH
   x86_64    | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/ffc67a1f191ea9b37008fb7be61fc296c3618d95 |     
   sh4eb     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/abf04411630f6504725eaca823d60e3ea494d9e5 |     
  powerpc    | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/359a9803a6b56b19fff5e5e7ff39656732570cfb |     
    or1k     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/f9970aa2f5edcde7fa42c910bb3e3399a36fa488 |     
    arm      |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/f879ed951f676f6bbabcca3afa7b80d6724c2514 | ORPH
   mips64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/45b78420c83ebcf8051cb385651c0f2cd0fbee1f | ORPH
powerpc64le  |        host-zeek-4.1.1         | NOK | https://autobuild.buildroot.org/results/4cbed4d62dac6ecf69a977dba6f5f9a2050f9630 |     
   s390x     |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/fdc4557853afb56f236fc7ff41b25f4514d06b00 |     
 microblaze  |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/367e05e79387cdc3894c6d64f6ecac5e8dea00cd |     
   mips64    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/851c94c9f360e94234337d07979d6149c843e6d3 |     
   x86_64    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/4a3627c5396b3ee4950d6e90ea43581bea1a3388 |     
   sparc     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/07779d9bc08772c76aec380a8f9f4c65680e0f81 |     
  mips64el   |       igh-ethercat-1.6.8       | NOK | https://autobuild.buildroot.org/results/344d51b185d602337da579add4e096a6423bb514 |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/babc46fcd671669d738540cffe323f35b1660aef |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/8e8187df7163af13104bcde72065e58cbbce3b64 |     
 microblaze  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/b6111f6583b82f86c9c68d8a31eb0a33530db4bb |     
loongarch64  |        iptables-1.8.11         | NOK | https://autobuild.buildroot.org/results/da61ba3b3797c382413889f0ae1442ce91b32d29 | ORPH
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/b442e92eca839de09b64e46e147edf10785858b0 |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/bc2bf4545dbbedf61bc065cb5ed79e2d0c0315ea |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/1a565fd5ad7492241eb877819c71db3d6b24126d |     
   xtensa    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/3ae84c12de79dfdec8ee74be20832470f5a3c8e0 | ORPH
   sparc     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/e68a4e328bf59dac0075b56cf2c076bda08815aa | ORPH
  powerpc    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/799d51f7e88bc218e17990baa8a73da8ea2d418d | ORPH
   armeb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/36b84cba38f93416bbb40b49fdb373f7f456f7c6 | ORPH
  riscv32    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/78134bf5d2b7e5f591e4ee195ed5defc837900e9 |     
 aarch64_be  |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/544e083b71f27d605ac0d2920e59c88cf66f0dff | ORPH
    i586     |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/3f27fcf641a85eaf0ef442a00a3975b7c87caad2 | ORPH
   s390x     |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/05c40d0560d8ab11468a3b1999bc7431e21a0804 | ORPH
   x86_64    |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/638d884277baba05284707f6f3593749fd7d1858 | ORPH
   armeb     |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/b8df0dbc779229d5995f20cc3ae47506545e85f3 | ORPH
  riscv32    |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/bd8e47cdf93d0db0cc42ce6d2eb00ea82af0a472 | ORPH
   armeb     |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/07a4bc005b3be460fb6058ff8b435096c51e3c66 |     
 microblaze  |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/61fba0c50859a0835ca163c00230065ffc474651 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/3d3af18edc9fa5b673f82cbda54391ce7a4ba0c7 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/39e1818e494126b611cd074de9a81dd517ab09f6 |     
   mipsel    | libdbi-88b8477d57153b9f736d... | NOK | https://autobuild.buildroot.org/results/1c58df922b157b77ed02f4299f90088d42b7c439 |     
   armeb     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/81a83ece958eac7f13daf9f934971549439ba4da |     
    or1k     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/5b6e01e4b9e7899d9d1eaf497ff55f826012fa67 |     
    m68k     |        libdvbcsa-1.1.0         | NOK | https://autobuild.buildroot.org/results/16ba59da4c1e3be9be851118a96654ba99023f29 |     
   s390x     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/e3426e8de26477c417d4662396ab3d907c160365 | ORPH
   sparc     | libftdi1-v1.6rc1-2-g92d657b... | NOK | https://autobuild.buildroot.org/results/5d15324ec6e06eb289930e93467d400538c0e52b |     
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/ed0a5a7b5979461ad25aa1b5a89bfaf5a601e128 |     
    or1k     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/20dbc3d7b7b57cb65cda8440a5b592ee6b5b69a2 |     
  sparc64    |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/6c9e7bf4ad1d9eb2897a6b4a5105c4162cf1db47 |     
  aarch64    |         libiconv-1.19          | NOK | https://autobuild.buildroot.org/results/1dbfc023c958bd9de409b05541d23f25fcf16c97 | ORPH
    mips     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/f3230d56825a0f32e8e8338f61f9f5deb4224279 | ORPH
 aarch64_be  |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/417ad42cd740682551a9fdd1cfcf88b086381136 |     
 powerpc64   |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/224258ee9880348c00ced35bba671e1ad182ce49 |     
microblazeel |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/b55e00f54be50712b6d43a1100d7a699fea22270 |     
    or1k     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/f40350a066b43378b1838af59b1ce39985410e3e |     
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/b88dc9e5e0554e30a17769487c412383710fd641 | ORPH
   sparc     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/959a9cd833796f1a5e9b4520d38eb5452ccf52b2 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/0b67aa3f0d41241590455cb9b003ea86403235b2 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/963cf3d2108b0100da3ef9341b94fc242c40190c | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/3ae72204b182b0ec4d43a4409467139b56e1f525 | ORPH
    arc      |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/12c5c09b3929d0d6557ed4e38286b1b539b2c6b1 | ORPH
   x86_64    |         libosip2-5.3.1         | NOK | https://autobuild.buildroot.org/results/483567d82ae86033c381cfc758209703bba935ec |     
  powerpc    |    libphidget-1.24.20260127    | NOK | https://autobuild.buildroot.org/results/977964a64279e3d29cfa6a1083af613b99ac8039 |     
  sparc64    |    libphidget-1.24.20260127    | NOK | https://autobuild.buildroot.org/results/d398b839e04e5d2bebfd779be1ba436604100663 |     
  sparc64    |    libphidget-1.24.20260127    | NOK | https://autobuild.buildroot.org/results/3fd67655754e8924b91739368bcd35414f3a9333 |     
   mips64    |        libpthsem-2.0.8         | NOK | https://autobuild.buildroot.org/results/62a7eca4331e07624d643d01efca289cfa099047 |     
   sh4aeb    |        libpthsem-2.0.8         | NOK | https://autobuild.buildroot.org/results/05475040ce0c70635a384c59225f0b273884a5f7 |     
microblazeel |        libpthsem-2.0.8         | NOK | https://autobuild.buildroot.org/results/9f682c22cc8dec765a945eb926ef1b6a12c88a3c |     
   mips64    |        libpthsem-2.0.8         | NOK | https://autobuild.buildroot.org/results/f2291592c751f0e1355713ddff6a04e25ce19e1e |     
loongarch64  |        libpthsem-2.0.8         | NOK | https://autobuild.buildroot.org/results/02825b7be629a520ee6de12c3c9ca87d6f79ffd4 |     
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/132f3f8aac7c51591cd7ca8d299663ca1be5da4f | ORPH
powerpc64le  |        libsecret-0.20.5        | NOK | https://autobuild.buildroot.org/results/cfb4fd71de636a271fce2e038ab873ef2299e0db | ORPH
    hppa     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/4bacd6c5652b5a0c047542632f59c072f360c52c |     
    arc      |         libusb-1.0.29          | NOK | https://autobuild.buildroot.org/results/9d641c272a59bd6b7a53427aab1d56126e61efae |     
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/a31062db8735389ef41a73de793e975d328fd385 |     
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/10b5e997a7b2c496bc9b8c4c5509115b27be6064 | ORPH
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/f9cde7b9546fc3022cc22932c8163d82df56ada2 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/c91ddc024f85b482b20949a2f28898f7e67b0650 | ORPH
  mips64el   |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/bbb9669fa370709ad5119439d28ad03c46d2f53e | ORPH
 aarch64_be  |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/7bffa2669833365fc7694a1a14401d455439c2f1 | ORPH
   mipsel    |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/16b41efeddc452888ca4145c866e74706a4f5a7b | ORPH
   s390x     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/e2c20e43b78260341140235472142079f59ef8a3 | ORPH
    hppa     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/15384291fbf200fb7bc54ea446a04cf63a8e4ede | ORPH
   xtensa    |          linux-7.0.9           | NOK | https://autobuild.buildroot.org/results/15c3dd6a371f2745396b1f8a7bc8772819b218ed | ORPH
  powerpc    |          linux-7.0.9           | NOK | https://autobuild.buildroot.org/results/1d8fcff61b7c7bd234934682d992dbee27c3cb4d | ORPH
loongarch64  |          linux-7.0.9           | NOK | https://autobuild.buildroot.org/results/ded5026869cff68e0c8e5ea840c3bd6e3f4c3707 | ORPH
    arm      |    linux-firmware-20260410     | NOK | https://autobuild.buildroot.org/results/0c4ebc2a1dd661758dc553cb0fde02c7a4a17136 |     
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/7abc842d73e669694ee483dfcfb62325d1466172 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/f8fc6b3d276762442769f6f0ab5e41107635ebd3 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/5b8a028000fd5a96ed2be8aeed38c5e9bbf4724e | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/13c8f4f80068db735c9fd0ee24d97036f3059fd6 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/7d992a4ed94684fc70db1c1d29b8c036ace0f830 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/39e76a33e53c83e33a2acc1876b5f02bbc4eb1ba | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/ac2227aa78701e4af64eeb49c7359a296a33c1d8 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/24662e1aba45a8473eeb444084bf303421fe8e43 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/93fc96829ddceef9d06bfe0dbae8d8085ff07935 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/719b4061ad5b3c9cc2fb2003f82ed4f7e22fde31 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/16f6249275384ab918b32d17f2d6904381d9fec6 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/5b29a382f0dd9c0b50da9b552e9e7bafd06028f7 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/5853132ef7a6fe9e6adcd8627635879356960e7e | ORPH
   sparc     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/c14d322161a2f8d843da3cf3b30671d3dae3ff61 | ORPH
    m68k     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/03873da61af38cc8c47c6b8a43a89dfb00fa7417 | ORPH
microblazeel |          lldpd-1.0.20          | NOK | https://autobuild.buildroot.org/results/9ee1fd7c5cb3c18a2692e7b0dfc3c8f0101ade75 | ORPH
 powerpc64   |          lrzip-0.651           | NOK | https://autobuild.buildroot.org/results/a09ff5e73c517d6578c42e3436b8957b8d90e5a1 |     
   x86_64    |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/ef928f72af3bbff18a46f9f0c1ad992d8e7f011d | ORPH
   s390x     |      lttng-modules-2.14.3      | NOK | https://autobuild.buildroot.org/results/244eb3a5878a00fee7ce239541a7ae20ae0ca0a2 |     
   sparc     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/9208e35d69c7eda270846b882bb3dc3be23a2b9e |     
   mips64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/fcec277e949d45fff0ae17db4c2a6464db53e88f |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/98b6d2bcb93004a04e0ed15eb0df45b601fbaa7d |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/e6b9d79b9cbfe6cd0140aa07068fe0a0adc4a6fd |     
    sh4a     | make[2]: *** [Makefile:4678... | NOK | https://autobuild.buildroot.org/results/162bf2911a461a1eba5d2afcb55feffd2fbfdb4a |     
  aarch64    |         mbedtls-3.6.6          | NOK | https://autobuild.buildroot.org/results/e4cbff1653371c46e5c812f10582693e25cad5ea |     
   armeb     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/d14c8f17aabf9ade1fdb59a7942f9979701eafde |     
   sparc     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/1fe9f2aa89cd9becd27e859745a9fab91d55fe4f |     
 powerpc64   |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/6e093c88ab78fb80bc3d349755bc853971708c9f |     
    i686     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/4165671c081ac0a70c7a95c85ee5ce32242900dc |     
  sparc64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/5fa972a337fa1ff14f6598615235886edaeb3f08 |     
 powerpc64   |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/e8a4bcb2a712f49527c59ed84ef5170569b2d6b7 |     
    mips     |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/076d5caf267f9494e4f1762c4f0d9f8bd756b0b8 |     
    i686     |           musl-1.2.6           | NOK | https://autobuild.buildroot.org/results/fc11569da7e38fcf2e91a1b345757ddcebb23b29 |     
    arc      |         nethogs-0.8.8          | NOK | https://autobuild.buildroot.org/results/754e5f31c220d69f3bf2e9f67f4ba081fda1533b |     
    or1k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a9d95026e14acdcd66653318c105dbe77e2c1d22 |     
  aarch64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/82f4e0c02a1e06084a30c8edab3c327481ceae3b |     
    hppa     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/2869ee634940b7f5e7e7ddbab99ca72eee87d87b |     
  mips64el   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3e340163684f131b745b22a5c524af472501f4b4 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/909dd23df9b2f042a9e6bbbefd12f6e25debf600 |     
loongarch64  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0ab80d58aa6c3908adfc2b79bfbad10fa4f5e6c6 |     
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/89b8f33bf39dc675cca5c7f6d182437e709a6a95 | ORPH
    or1k     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/f39d9fcc0827e80de861f6ed4bb8f4bc488cb438 |     
loongarch64  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/35adfa2dafd723eec6e372dd807bb8ce7326e0ac |     
   xtensa    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/7e3e4b6d92995f4b23b6f365c1c907c5fe26f9eb |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/c040c6de81dc5003ad694e7d53fb9579ad4b7657 |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/4fd5648c8b19c7e1958be1b1bb458c7462e55275 |     
  sparc64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/0a205316d8498d63d867f6ffa084fcdbb99ed380 |     
microblazeel | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/95407cda416ba6323444a46ce67cb53e6be745ce |     
   sh4aeb    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/4735d14a938edc0ae866fdcb970ad4ea7d48a4b4 |     
    hppa     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/2eac5009516de3cd9f5071cf473d3fee3dc6a401 |     
   xtensa    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/d09ac5227e2cb24c08c9ffe402d9244879702544 |     
   sh4aeb    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/5a6a9758fc98b85bb41000c02bce446941cab54f | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/ad813059094f17fc492c7e272d3895c27a12a00c | ORPH
   x86_64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/7c3b7e9a38fa07aaffca3ec806a3d1746c2892d8 | ORPH
microblazeel |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/dc763bf8779836aec7d587903c7f2d974240a55a | ORPH
    mips     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/66fd46241497f300be08aeadf04e31bae370f01f | ORPH
loongarch64  |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/4ee83fde03715ebfc011eefe327fe9d173832e7e |     
   mips64    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/4e6934d12b567c070ac8b20e75c42bd1c69676b3 | ORPH
   mips64    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/971bec40e1abf33daf1cdbf6afc155992bc56c94 | ORPH
    arm      |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/167eaf52f99186d19405b54152e1bf63c018d529 | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/6f65760262394b88e11b964aa86567657ccdd61e |     
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/be751dfa1fa4ab5492fe536a7e3097aa26918447 | ORPH
    mips     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/630332b32eb94f67159a21eda021b0230dc0bde6 | ORPH
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/ef02d709bcdb3585be50a1b8ac5519495673bced | ORPH
  sparc64    |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/2300fbaafc63df71e929e85bc19939583c7b292d |     
   xtensa    |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/8172d20c839b2d61e86746fdbefdcbd829fce6ee |     
   sparc     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/ccc61d24fac4c9620fb3d7797d6e762ef48e2610 |     
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/189518fa6f788ad33b4e298f0f1fa48a2cf4ebb3 |     
loongarch64  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/19ef2eeb6a4768b55eb68c93d5396e7fb0843475 |     
   armeb     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/b98cdb00791930a16e3b6d44b7c445393637b76f |     
microblazeel |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/2ca0e9cedc2a1172b631f1c4bd81c8a78f46cde6 |     
  aarch64    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/95a72189cde3d795436712966bdf1cf10904f09c |     
   mipsel    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/5957e600494560fbade39f2de03b63b364045244 |     
   mipsel    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/ca7b93d6b2f74f7ef6b697d9289f8a49771eb4be |     
microblazeel | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/a0794768050efe30720db7511d3aa809122b0979 |     
   sparc     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/a788d64f2cdb49142a4dcf11544b36d8a8aa0bb7 |     
   mipsel    |      pkcs11-helper-1.31.0      | NOK | https://autobuild.buildroot.org/results/4ee91cad51ea994345b007167e692b73f732eced | ORPH
    m68k     |        postgresql-18.4         | NOK | https://autobuild.buildroot.org/results/cd73575a4bb65e489e8eb0fd318a98f67328c5d9 |     
  mips64el   |          ptpd2-2.3.1           | NOK | https://autobuild.buildroot.org/results/8292d8259ffab7014f16dfd7ba7eb39b4946ddcb | ORPH
 microblaze  |          ptpd2-2.3.1           | NOK | https://autobuild.buildroot.org/results/05e6863f8aabf8d3195cfc20cfab36d30cd4741a | ORPH
  powerpc    |          ptpd2-2.3.1           | NOK | https://autobuild.buildroot.org/results/d0e3b1477a1051616a91070c09657bca977ea987 | ORPH
   armeb     |          ptpd2-2.3.1           | NOK | https://autobuild.buildroot.org/results/18f657d31bad3df7cd0f8c232214778e33c8bcd8 | ORPH
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/2858b732d33352e5e9c24dcb91b3c7dce472a577 |     
  powerpc    |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/f08fba8af1aec4d4d6065c86b8312ca544e438db |     
powerpc64le  |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/f0b4ad178e77905858fc26222b4b9eabdf659c6d |     
    i686     |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/66a5f0fdc38d19ad74c5c0304f6b3d46ff5dc026 |     
   armeb     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/888248da9e771fba873dd6866ec7be6242397296 |     
   x86_64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/22b852c8d0c04d9df47bfe31076c9098a2ac5978 | ORPH
   s390x     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/889526a85e67a592b9d020b4ed6bad41a8195d59 | ORPH
  sparc64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/7d0565acaa7582a6a2e0e45159881897b3cf4bef | ORPH
   sparc     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/89bbeada7857bba33c8833a2d0aac659250a7734 | ORPH
    mips     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/12ad728945fa6abf1f17d0208171f0d76ef702af | ORPH
 microblaze  |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/ae557afd4088c7ef505f72da050b79aed0d4b5dd |     
   mipsel    |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/71e8a8007f7d86404139867507b2c93ba997bc42 |     
 aarch64_be  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/31206d0c7362426d6dd8e0d6cf5c5491f609c2d5 |     
    or1k     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/f1e518732ce611cb9e7fcab25fe3e46939998562 |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/569635b61f69039da3d0f250725e5c28cf972da5 |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/1592c819eeeeea12114a46bf68b2ad3d1f9c62eb |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/32833b4c54b78da13635c75d6fc82c684d1f7027 |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/ebf568b27a35788277c226110827ac46647740bc |     
    arc      |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/48a65d59b88c8aaebf88bbedfcb7f907d06a0ff6 |     
   armeb     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/a10e25a2f011a4aa65e56ac4bcbecd2960ca3150 |     
    i686     |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/36babc022e02cc87f8bd228a1ed75a460ba376e8 |     
 aarch64_be  |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/a98e60d700e95d6bdd9ecbe7d3ef0aa27f77ecc0 |     
   sparc     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/96d9095e3dcf42a49ce6c89c1d956fb105e60b39 |     
  mips64el   |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/61c2db2f778a9a32739f26177ec0ad67eb460667 |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/508dc06ad281ff8126da16783c157e50c471566e |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/f7c012e616b7a7ef9dcfa92312ece16912a0ad78 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/c4e75da330de3bf56ba69360a698b372484da27d | ORPH
   mips64    |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/f1dd4f04cd4d4a00c841423c10209ae7d65ebc34 | ORPH
   x86_64    |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/338094003fd3a884480f2575aad28b6496822d6a | ORPH
  riscv32    |         uclibc-1.0.57          | NOK | https://autobuild.buildroot.org/results/1b6f2161b11390b6545bddbc39b444401c718ebb |     
 aarch64_be  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/2d9588ecc34583ceb39ada35fc5d1a29b6f27c69 | ORPH
   mips64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/49a7c28e7926f03eff332bc3c13fbc5a162e401f | ORPH
  aarch64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/751936119efd50c96e695fbe04d021fe5b7e7336 | ORPH
 powerpc64   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/cf91d12c61c88e745036db14bc7fde7657e7a7de | ORPH
   mips64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/bd7e281e3d94a1d06793a8fe82f6814c116db21e | ORPH
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/28875a0e2f65184632c9d0a12d415cde741bb8f2 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/efff0509e804b5cc7b51e68893627c959fd429be |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7ccfc268988b643135296419ab5d6389765b64de |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/25ece2edca9b09dc6e5ebcd7a5d4e528ead05e82 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/e65d1e0165444509b8c802b1c0b18f2094d9dec1 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b80398b86ac9709ffbde370c09cffd7ef1cc1d8d |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/904cd9451e4bbdaa6aa1d6c7e15ddc88cd30a1cb |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/0fe578145e3a87a42dc39b0b0a14aebf6fab6ffa |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/a9c79be241c9435984375142f4657bb3a07e7d77 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/e874d835b2caa1a7fa7afefd9b9d3c9e56a4d155 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/9d4b6b590cb452a080ea640af07d74aa78ddcb8a |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3039526741abf10cba6aea76d558c67e70561efa |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/8596171976e108cba8186535922d9b63406f95c3 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/52cd885289313fd5275d2a9296f2320941d77221 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/fd75b67c9888e1a208dc33fb95e8350337b7507d |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/158a7c0482f842c2a33a88adf40c85c6c12c2b8c |     
   x86_64    |        usbredir-0.14.0         | NOK | https://autobuild.buildroot.org/results/1bb66e41930173c216771c51d9019e739522b8ac | ORPH
   armeb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/04609671240f412c9f5a0caaa1269ca394c1d400 | ORPH
   s390x     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/9c3e4254358acfad4a82260bb50b1192a9156d9d | ORPH
    i686     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/eefb39a57834fdb8527ececbc544fcb29a506508 | ORPH
   sh4aeb    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/b8b647ae24ac148c5c7407f9fc59a5602f5dd422 | ORPH
  aarch64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/dd77679919a0d3646c71242fbb7c0b049bf424a6 | ORPH
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/9124752e70b43041fdefa10ef4dab982f4be0ad4 |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/ff83270c9597cf2c708c64492d76146478de28e7 |     
   sh4aeb    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/d2894c7491bce6aeda3c5e8fec8698356a1c6565 |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/ac09aa01fd6ede4ad9319a9e32765cccecbd31d4 |     
    arm      |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/2b22d89fbc9720442693668e379128c67f963449 |     
 microblaze  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/016834b7fbad79f4f61dca7406de2c2cf2408cd8 |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/406b841fb20a8332876a66218a2923de791d3bb8 |     
powerpc64le  |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/3cd0c3fee537d89d3cecb7dbdcfd4bc83b6e35b9 |     
    sh4      |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/682cbacdccdd6f432c55afcf74ebe35e928f1a66 |     
    i686     |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/16f26e40ee0cd909857f356f2a8472e125b05dc9 |     
    i686     |           wine-11.0            | NOK | https://autobuild.buildroot.org/results/f265fd6cde12a7ae8bb140a173b49d15aa46c3c5 |     
   mipsel    |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/734d19fc0044539068fa7ebcd63c9b45f61e7e7c |     
   x86_64    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/15b5650f5fe6d9474b7e7c34dc943ec192a15cb5 |     
  mips64el   |          zeromq-4.3.5          | NOK | https://autobuild.buildroot.org/results/60bc013765ccda60e855026844adcc60192b04f4 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

uhttpd-15346de8d3ba42200249... | 2 
                  cairo-1.18.4 | 1 
  distribution-registry-v3.0.0 | 1 
            gstreamer1-1.24.13 | 1 
                  host-bootgen | 1 
    host-gcc-bare-metal-15.2.0 | 1 
host-gobject-introspection-... | 1 
                   linux-tools | 1 
                 openmpi-4.1.8 | 1 
           uboot-tools-2025.10 | 1 
                       unknown | 1 
             util-linux-2.41.4 | 1 
        util-linux-libs-2.41.4 | 1 
                       zip-3.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/bbc6af734e03c2798a09a945b253c7dd7115a543 |     
    i586     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/99a2fb204da5c3c507f843cbef2981aafb45cf0a | ORPH
    or1k     |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/8f5b5b033960df9e553677a371872675dd37ac78 | ORPH
  riscv64    |          host-bootgen          | NOK | https://autobuild.buildroot.org/results/dee0b895795886ccfa7f0bd20c5aef9cd99f5f70 |     
    arc      |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/6488215aecf0d2a2eeb88551cd3e2b87c42179c3 |     
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fdfd77088b2d37d551e4a0a8c87e3c972174993a | ORPH
  riscv64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/3011c8e1c77ea9d261847a0e6ec80d0ceb4b4fe2 | ORPH
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/9a923f60457f06dd4931d6ba55cc013a780406e7 |     
    arm      |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/a61976040e65eca44109b239a11a2061d51ad6b8 | ORPH
 aarch64_be  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/4c86f372f1619ee947673c31d4741cc37db4e6d7 | ORPH
 microblaze  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/ad8977751e8e5d8ae238c94bb5566444663e9145 | ORPH
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/4ee451e01f7f29841a5a6ac58311121d67c5e047 |     
    or1k     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/e532ea792ac9f31c87c7ca6a947ccb55ff8c3b4b |     
   mips64    |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/73133868360e16b39b1410a8da76380d864b2044 |     
   armeb     |            zip-3.0             | NOK | https://autobuild.buildroot.org/results/333743dbcab2b4bb543439a120c4185edeb86405 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 4 
                  iozone-3.508 | 2 
cpuinfo-8a1772a0c5c447df2d1... | 1 
      docker-cli-buildx-0.16.1 | 1 
                  ffmpeg-6.1.5 | 1 
  gobject-introspection-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
                 libmbus-0.9.0 | 1 
               libucontext-1.2 | 1 
        ltp-testsuite-20250130 | 1 
package/linux-headers/linux... | 1 
python-remi-2022.7.27-37-g1... | 1 
        util-linux-libs-2.40.2 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/c2c5bc1ffcb69cf98eb35ad850315c50359d6212 |     
   x86_64    |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/67c2d133dc9413017e909b6c5b5abb8c04e640d3 | ORPH
   arceb     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/539887b750a98ea940d03de480e1339c4db44e2f |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/90ac33b9c4f2bf3679d34b76271a4274be606813 | ORPH
  mips64el   |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/50368dd8ca37d09fcbaeef79d33f9bd402255dee |     
 powerpc64   |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/e089568d8f3f932fb8cc01394c6c11ddd7b76e27 |     
   xtensa    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/aa8583110e5eb15d628517c4372198c1ba63ad1e |     
   mipsel    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/2ee74a7cb02216bc69d9a9c99a606d4c5dbe450e |     
    m68k     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/4624f64bfbd6fcc4bf0ccb483ae42fc3481e1b59 |     
    arm      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/471986f8f2f914d6f8eac01cc01221187f4da411 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/1762bab234b1b30bf7a0731f83a9c48017c140a1 |     
  powerpc    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/4dd93a1fce0c9b08297e4ec2ef37030159f2b6fd | ORPH
   sh4eb     |        libucontext-1.2         | NOK | https://autobuild.buildroot.org/results/df796ba1f3f7b96738f429ae262d5d233297e215 |     
 aarch64_be  |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/0a28df945f22b6872f14ecee064aba2f89b767bd |     
    mips     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/2ff7033bfc1dddc7eae4b9993024a9bae4834f88 |     
 powerpc64   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/ffa4d8363cf722241b090f43a2801ad8be3606d1 |     
    arm      |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/f47084213e11886cb7168cbbbc8f926a56522206 |     
    i686     |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/7e8846f2b9b2d2b9a44c7f7c7563954d6929c424 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
