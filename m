Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4675BCD5BB4
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 05:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1DB540E83;
	Tue, 26 May 2026 05:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NtW1HbMwMPUd; Tue, 26 May 2026 05:52:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC5FB40E5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779774758;
	bh=KSE93Sx9gKznvQhbpJWzbXfBWKx/Se+CrQDLC2/TKFo=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BNAJ8smvlFoYMzbcUvgi6//mZ1sW7sxBM1viUDi1EpmLtS6l6v4aDNuYOOcViVKpX
	 OfNlgY2yBUKkhC3s3GHB22+aPVjl9c28TLHRyqM6l1ICtjgn/1rD21cCemkKWzmYOh
	 d0qHI1rKAonRDLy9N0remnNciy8yf9IFJScAVxvfY+3swjftLRxbvwqlSnDwfuguPC
	 dJgvSJ6LteDXN5MesjgIy2Vly6Dw9agFBAzB0WqGNEuxBueF70mox6kC2vFnZL+a41
	 zPGTpnmC5k1SqghPFLLeUiml2QzWUpj71Ar7WViLPYVdUGqnvAF8w/m/n/mUbXe0N6
	 mUfZfmMqsnX+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC5FB40E5A;
	Tue, 26 May 2026 05:52:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D11769
 for <buildroot@buildroot.org>; Mon, 25 May 2026 03:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33AAC4114C
 for <buildroot@buildroot.org>; Mon, 25 May 2026 03:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6NIajRZcMPY for <buildroot@buildroot.org>;
 Mon, 25 May 2026 03:23:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F19974112B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F19974112B
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F19974112B
 for <buildroot@buildroot.org>; Mon, 25 May 2026 03:23:11 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-49041e84237so21570655e9.1
 for <buildroot@buildroot.org>; Sun, 24 May 2026 20:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779679390; x=1780284190;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rcdh0tDYT3C0tOdObclWcvmP1Es2tY6ascR7GlycMl8=;
 b=EuprchDKgH/3Mzzy09gGgs+0CjH0gsYPCcFuid1BQmrdT4f4ewlKMUBI3AQ5XcpUQQ
 82rEjjOUUZklJMaWw/OlFYtKMVS78pewR1bMOKkwMIRPtP9XyOcf6lr+cHgyALI5UsVq
 kqWis8lhQJZSbG43nZQ/Odc3lR+dFiZ0iw71QaxKa9FWvHIyKEbcxKUtivDwy/GxTWEq
 +SdjN1juA8Pb/yjFmj8amhcrp5gwxQQyiquZ2KT3r5VApttAORdJb70BGhw8I0/RyJvY
 UpCX9Qj12CZZL6anmiJcUbt84bJ0qbkppgC7wu3s45/8xPkuYYC7SWxHcoolsfpwzh09
 8qFQ==
X-Gm-Message-State: AOJu0Yx1HCSBIFdqHDBFyuNPxswF0LS6VpQaaxJ8BqlqPqXcSQ2roWKu
 ah36etHv4yW9McKyRwY7b8PG0qsCBQYEqveDvIGjViF48crD8TKOmMBecCsmLmgp
X-Gm-Gg: Acq92OFGjfh0UDduVz85sWELQ4PjGoMRkAC6Y1Ll2ado+4g/JpOpOeDypFpp5F5ynnG
 7qid1ai2IDASwyqOZlwtl9HwdppKbshJcJOEqvsQYYxjVhaWF9dm3wZofcyTIdzcUgTiHibtEJz
 k5ZjMLrllBouThvNGQG6EW+cuBcMyLu2exWfdLWQXfOTfikRAEl5PxHBHYWmhUk4hGYcuczzZZw
 DSMjAOzpcneBW0Wms/5F+HQufnuEvGGbBA/shY2PovkKIByZPfiqHL00h9p/rQKYVRBdmIwMDKO
 vcjRQC+A1aIf6b3ql11kMlkSLyllD+oZ79hCPua6S+NMxdUXRRGFdrU+YtdN0h5Q+d1tkZ48So3
 J8sGRYsCVoNzr6b77hrQ0gScKlxeCk3iUuW9m+Dxj/m8IGYfnxjoNlBixrPDqyACbiooHgO65Uz
 15HMvzV6Ng7t8i7ze9JbxB7u1CiE64YQ==
X-Received: by 2002:a05:600c:46cb:b0:48f:e044:927d with SMTP id
 5b1f17b1804b1-49042480f2dmr173995425e9.10.1779679388412; 
 Sun, 24 May 2026 20:23:08 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904561a160sm247487775e9.9.2026.05.24.20.23.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 20:23:07 -0700 (PDT)
Message-ID: <6a13c09b.5e46ca1c.22b42.8004@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Mon, 25 May 2026 03:23:07 -0000
X-Mailman-Approved-At: Tue, 26 May 2026 05:52:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779679390; x=1780284190; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Rcdh0tDYT3C0tOdObclWcvmP1Es2tY6ascR7GlycMl8=;
 b=gKfbzdkTXVtcXnAVg2s1mB1sfXeFB5PTpZg2mJsgcBOOcW31kfqdJxB4QBqpZlsFsy
 vECtuXSgQ5wScm4f2Q56rzzFxVJ9mib8oVBHSQpKRKX2eGC06XQ8iFBwkioQISvF0NHp
 5eVzQhmJxGHydzR6hnAfyEPxR92u5w5w4IAsZj3yJrEnCW36yegDAsPXqxrq9W0tg+Ln
 5Navifxm08G8Ey5x2VBewPBNpX6J3rFqDPAJB8g4MQEuX2ZTWelrZuq52Lz/ZQ0Opgr3
 U/f+Xa5pkyrKC6xBdNnmFxB1xe3MI0GBRzavoYtEpSI4UdqEt9Gx1al7LHC3kRKZFeK8
 Ijzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=gKfbzdkT
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-24
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

Autobuild statistics for 2026-05-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 11  | 16  |  0  | 27  |
  2026.02.x  |  3  |  8  |  0  | 11  |
    master   | 107 | 370 |  2  | 479 |

Classification of failures by reason for master
-----------------------------------------------

    host-gcc-bare-metal-15.2.0 | 31
host-gobject-introspection-... | 25
               host-dracut-110 | 14
glibc-2.43-27-g4070d808bea1... | 10
              host-pahole-1.28 | 10
odhcp6c-f19dd37fb467c9cf10c... | 10
             dahdi-linux-3.3.0 | 9 
             util-linux-2.41.4 | 8 
               linux-pam-1.7.2 | 7 
            18xx-ti-utils-R8.8 | 6 
                 host-gdb-14.2 | 6 
                host-odb-2.4.0 | 6 
host-vboot-utils-7dfa482d6a... | 6 
                   perl-5.42.2 | 6 
uhttpd-15346de8d3ba42200249... | 6 
                       mrp-1.2 | 5 
                openssh-10.3p1 | 5 
phidgetwebservice-2.1.9.201... | 5 
                       unknown | 5 
                   dante-1.4.4 | 4 
            gdk-pixbuf-2.42.12 | 4 
host-gcc-initial-arc-2024.1... | 4 
              host-guile-3.0.9 | 4 
            jpeg-turbo-3.1.4.1 | 4 
                      lft-3.91 | 4 
           libmicrohttpd-1.0.5 | 4 
                 sqlite-3.53.1 | 4 
           uboot-tools-2026.04 | 4 
  gobject-introspection-1.84.0 | 3 
libdill-32d0e8b733416208e04... | 3 
libesmtp-v1.1.0-14-g335ee8d... | 3 
                 libzlib-1.3.2 | 3 
                  ntp-4.2.8p18 | 3 
                openntpd-6.8p1 | 3 
      passt-2025_06_11.0293c6f | 3 
               tcf-agent-1.8.0 | 3 
              e2fsprogs-1.47.4 | 2 
                enscript-1.6.6 | 2 
            erofs-utils-1.8.10 | 2 
firmware-utils-c42a3bc53da8... | 2 
                 gnupg2-2.5.20 | 2 
          host-binutils-2.45.1 | 2 
    host-mender-artifact-4.2.0 | 2 
                host-mpc-1.4.1 | 2 
                 libavif-1.4.1 | 2 
              libcamera-v0.7.0 | 2 
              libopenssl-3.6.2 | 2 
            libxkbcommon-1.9.2 | 2 
          linux-5.10.254-cip72 | 2 
            minizip-zlib-1.3.1 | 2 
           oath-toolkit-2.6.14 | 2 
                  pdmenu-1.3.6 | 2 
            python-numpy-2.4.0 | 2 
       sp-oops-extract-0.0.7-1 | 2 
                  stunnel-5.78 | 2 
                 sudo-1.9.17p2 | 2 
                 systemd-258.7 | 2 
toolchain-external-bootlin-... | 2 
                tpm2-tss-4.1.3 | 2 
ustream-ssl-5a81c108d20e247... | 2 
           alsa-utils-1.2.15.2 | 1 
amazon-ecr-credential-helpe... | 1 
                 apache-2.4.67 | 1 
           at-spi2-core-2.58.2 | 1 
                   atop-2.12.1 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
             batman-adv-2025.4 | 1 
                  cairo-1.18.4 | 1 
                   ccrypt-1.11 | 1 
                 cdrkit-1.1.11 | 1 
              containerd-2.0.7 | 1 
                coreutils-9.10 | 1 
                  cppcms-2.0.1 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
      docker-cli-buildx-0.25.0 | 1 
docker-credential-acr-env-0... | 1 
                   exim-4.99.3 | 1 
                  ffmpeg-6.1.5 | 1 
              fftw-quad-3.3.10 | 1 
                      fio-3.41 | 1 
               freeipmi-1.6.16 | 1 
fs/cpio/cpio.mk:128: /home/... | 1 
                    gawk-5.4.0 | 1 
                   gdal-3.11.4 | 1 
                      gdb-15.2 | 1 
                   gupnp-1.6.9 | 1 
                   gvfs-1.57.2 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-15.2 | 1 
            host-go-src-1.26.3 | 1 
host-google-breakpad-f49c2f... | 1 
              host-rust-1.95.0 | 1 
         host-ti-cgt-pru-2.3.3 | 1 
                   imagemagick | 1 
                iproute2-7.0.0 | 1 
                  janet-1.41.2 | 1 
     kvm-unit-tests-2025-06-05 | 1 
      libabseil-cpp-20260107.1 | 1 
                 libcddb-1.3.2 | 1 
   libcdio-paranoia-10.2+2.0.2 | 1 
                libdrm-2.4.131 | 1 
libfutils-c326ce0cc2a735438... | 1 
                libgeos-3.14.1 | 1 
     libglib2-bootstrap-2.86.5 | 1 
                libglvnd-1.7.0 | 1 
         libhdhomerun-20210624 | 1 
                 libidn2-2.3.8 | 1 
                    libopenssl | 1 
      libphidget-1.24.20260127 | 1 
               libpthsem-2.0.8 | 1 
             libucontext-1.3.3 | 1 
            libunistring-1.4.2 | 1 
                 libusb-1.0.29 | 1 
                libxml2-2.15.3 | 1 
           libzenoh-pico-1.2.1 | 1 
                  linux-7.0.10 | 1 
                   linux-tools | 1 
                    lua-ev-1.5 | 1 
            lua-sdl2-2.0.5-6.0 | 1 
              luabitop-1.0.2-1 | 1 
                  luvi-v2.15.0 | 1 
       matchbox-keyboard-0.1.1 | 1 
             matchbox-lib-1.14 | 1 
               mosquitto-2.1.2 | 1 
                    ne10-1.2.1 | 1 
                    olsr-0.9.8 | 1 
                opencv4-4.13.0 | 1 
                opendoas-6.8.2 | 1 
              openjdk-21.0.4+7 | 1 
   openvmtools-11.3.5-18557794 | 1 
            optee-client-4.9.0 | 1 
package/mender-update-modul... | 1 
             parsec-tool-0.7.0 | 1 
                   ptpd2-2.3.1 | 1 
                   redis-8.6.2 | 1 
rtl8189fs-876e627a5b6a80217... | 1 
                   seatd-0.9.1 | 1 
         spice-protocol-0.14.4 | 1 
              syslog-ng-4.11.0 | 1 
uclibc-ng-test-132c6134d691... | 1 
ulog-0389d243352255f6182326... | 1 
               unixodbc-2.3.14 | 1 
        util-linux-libs-2.41.4 | 1 
                 weston-15.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/ac3fc04b5099c3c29b63c30f6c2972e6a76ff86e |     
powerpc64le  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/15177c0dda178145d6bc0d85b6c4e243510ea2eb |     
    or1k     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/4b804973854d0caeb937f1c6d9b23c3b34092294 |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/50a44021daca09585296395948cf08c11f699f90 |     
    mips     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/c401e6cdda94160aa40bfe11bf10b69023de291f |     
   s390x     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/40d306ac102925e178010a4235d672fb036eafac |     
loongarch64  |      alsa-utils-1.2.15.2       | NOK | https://autobuild.buildroot.org/results/43d4af773ac89d853e83aeab7a5c492d3456b584 |     
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/403230a2f07f50e1a95e6caf4c384173376a5a99 | ORPH
loongarch64  |         apache-2.4.67          | NOK | https://autobuild.buildroot.org/results/3bd67bfd9b1cb15ff3a642eb7076881a2df9bbc7 |     
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/36228f1a2979b7bc8248507ec3dc65688b5015c4 |     
   sparc     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/0b446ac81443842644acff1b4a6324d2d34acf75 |     
  mips64el   | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/89ea0c0952bc671a0412572bba9c0daa25229e05 |     
   xtensa    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/7eb501d04a4b05e7412fd0940d1578599482c7e0 |     
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/30576ba1a078bed10ccd180c8bb38123f9b5c533 |     
microblazeel |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/18cb6377526efa15abc6614530bb50aba1c6ba75 | ORPH
    arc      |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/30d4e1386691ee3473221c955b64377e161e3e8e |     
powerpc64le  |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/232b57418b5124c3a8558ad2263f40b101372ace |     
  sparc64    |         coreutils-9.10         | NOK | https://autobuild.buildroot.org/results/c5fec5879d7ee870d95169f39228dfa46146c961 | ORPH
    or1k     |          cppcms-2.0.1          | NOK | https://autobuild.buildroot.org/results/cf7b24d3c009ad2094c1c9cfe49d7dcb10c853b1 | ORPH
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/cf1a3378fa1136941f42da90832c9906ac026fbd |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7b433d7f7f05dc2fd3a719b29b959ad84343b9a7 | ORPH
  riscv64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a50456eab1ff3aaa712336fe68c219106bace921 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/113b4fb6ba7f9c54cdc73727fbc06a8dba96c391 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7b524c7225a4951cac10910be333a3fc78df832d | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/219fde349415a0177e7af1b62b37872e609ecfbe | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/73bf6476e7f7d5d7e84cdd04fa0cb3a571040902 | ORPH
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/466e3839230e547f6afa5536bff4660c6234d610 | ORPH
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/25b9089df33c839bb24142cd3ad7dc081ae3f06d | ORPH
  powerpc    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9b57e8706d0b51a7a64795ab6410c03b34c679d9 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/ed2b3a2ebfb40cb05f58fea7a892fe8756896236 | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/14c271c754a6add73b1b8f202ad471c7de90f093 | ORPH
    m68k     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/6d294a490173fae7ba41c2ddd67cda1395560724 | ORPH
microblazeel |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0a2f171dcd4651a3e219bbecc06e8a9eee00d6e6 | ORPH
powerpc64le  |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/8cf63f3e8623e0e51671d521048af3ffa20bd9e5 | ORPH
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/a5b46668510c5be44564038cab727d32ec63f428 | ORPH
   sparc     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/b4db9506a0039190ca5fc499c856b1bdab452982 | ORPH
   sparc     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/2e09e0e78d1b874de3a7dab2cca4553be5f1ad05 | ORPH
  mips64el   |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/f4dcc7e17f6dfd972ef3a8ff9184bcdb27f39ed4 | ORPH
  powerpc    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/ca7e3ba632a942ad8d81fdf4c8e6fe9e565aeb59 | ORPH
  mips64el   |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/9ef4abd10d85689486fabefb7fddf23a3fb751ca |     
  powerpc    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/2e14a75747da22076adb68df3a6c6401d3780564 |     
    arm      |          exim-4.99.3           | NOK | https://autobuild.buildroot.org/results/6173b2e47a61a42f34f93d5bc2cb0b0e297bb185 |     
    arc      |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/fabe8659cc9d8e0e6df04416b1471c4c23b491cb |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/95b07a19137e4dcb8179c8ff36528acb6518fa85 | ORPH
powerpc64le  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/90aba0ece493e51612a3222a9ecd086e7961a816 |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/02c0eb28b1d17d61b7ea7a37a72a4fce66d29d5c |     
    or1k     | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/4c7e273af5f6c7892ff2a055d2e614c5543e08d5 |     
  mips64el   |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/028b3af0bed2a0a0c215d77ede9f180ed3ac2a5a |     
  sparc64    | fs/cpio/cpio.mk:128: /home/... | NOK | https://autobuild.buildroot.org/results/40dbb173a83a08a28e2f70e979e180c64af0411e |     
    mips     |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/fd96be6a1ac03d8b41a691191985d125883d7f33 | ORPH
 microblaze  |          gdal-3.11.4           | NOK | https://autobuild.buildroot.org/results/c6653d82966c1fd627006311af8e6069b7af6dcf |     
 aarch64_be  |            gdb-15.2            | NOK | https://autobuild.buildroot.org/results/eaed585a5b32b453bc2e34ac03bbc338c13bc98f | ORPH
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/2ca6345bca6fdad1dea61c35783ebd2fa31ea80c | ORPH
    m68k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/97bcccdfe2e6cea74a186e0629244f1505bb3493 | ORPH
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/179e6fe6ce2e63ff7539ed6b9badde601ae9594e | ORPH
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/bd0cfcfe32bd659efcbd60cbfd7d0641523b0880 | ORPH
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/60907c1a34a30de26b6d3bc7a106b09857378012 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/9196e7c0ecdabae830d1b9f67d0530a619e269de |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/dc5aaff68fab08ccac78db99e0c2783270e9845f |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/cc28715ab5ae448d4f930b1e9c512d02f9e66610 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/4fc9dcbce7cf4bd601d8c2a30238cfd756a5c875 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/a02ca230c06ee5748ec93f70f8076cdacc92376e |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/61336937e112e5d1851827f466736040ab08100a |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/9c5f88548297582fb4a5317b3629c9d7730ddf0a |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/3380e447fd2ab9737337ac8eb4728ebf791a0496 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/bd387c343373358b5438833c83a9a44ffbc757a6 |     
powerpc64le  |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/f837f47876f1fcac260979fd0eb99e46e97c412a |     
   x86_64    |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/f2c4852c0bf15d4ad454b4a563f8930d6be087a5 |     
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f6d3ca85f5c39c7d1ae09986a90f5b68e3101f20 | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/289e44c502366782468dcdba8122c90d56e71e22 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/da33f4f30c70528b97eac6d3316282fb615a1a9c | ORPH
loongarch64  |          gupnp-1.6.9           | NOK | https://autobuild.buildroot.org/results/275ec3a6109a5d8bbe048e4d1c47ce5cd6280725 |     
  riscv64    |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/ddba146ec1334a6aaf098929f56e5a700a4c1088 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/8025ac1789c3925c3fed195d010f64e5e0ba5fc8 |     
  aarch64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/378af45147b2f261866c49b5e6dade5331463ffa |     
  aarch64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/4d3a427a9c15bf8f6fc367a77a0bded8a8dc10a4 |     
 powerpc64   |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/ab34ce99177fe5ce7a0cee115632e037924ae01d |     
  mips64el   |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/2380ead231c30b14c44eeb6e6d1f183bdecbcdfe |     
 powerpc64   |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/508b4b78366ab1f8e666b6ef1d99128644cd25b4 |     
microblazeel |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/0d7fbbfba9b4d2c6ab4d8fa8a11f2afddcc6aca8 |     
  aarch64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/c18f4e9b338e657868e8c1650b128c87381ce3a1 |     
  mips64el   |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/2938dd29d970f09f1a8607a4e35bb2c88de4bb4b |     
loongarch64  |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/7b65cc7e87ce242cec2a0eb6dc2827b6bd4b891f |     
  mips64el   |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/dc4db4d034c5de2bf7d662ff3cd64aa8526a1638 |     
    sh4      |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/5cf0e3d0872d567a6897755266141198d9c49a1a |     
 powerpc64   |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/a219ceca9a26894ec5ccc69148f4b0225a1fe583 |     
 microblaze  |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/8daa9c555f00065564c9af9d4643ec8af4198471 |     
    m68k     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/4ed652b7a3bc034bf88d8978e974fa7e4cd52ac5 |     
   x86_64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/186823d4534b8ff9b8ac34047aab667d6fa250b3 |     
  sparc64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/d82fdf1ed2ba91cf86e1be763c6309139e98075d |     
  riscv64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/ea864671fffdb0385184f2f4c4f6040517a332dc |     
  sparc64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/8ae94624143b476eab929a953a9f2a8c49c5fa87 |     
 microblaze  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/8dbfdd1991c2568145ea4c3f4f42d32cd6c00965 |     
   armeb     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/74bb8e64ad672b606eaf68b7cc026921d442ab75 |     
   xtensa    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/c9147ffb417dbaabfce86c93fdc72ad6a84f2357 |     
   mipsel    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/cd3d610285249a5df80df6e55310dfcd8d5bd547 |     
loongarch64  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/38db92594abdaa2380ebbcb7971eff726f623d6a |     
  aarch64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/b521d400ae564d243b633b367e84b7e77f61a132 |     
   sparc     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/ec047ed86b8ef96b45e6636389993ce124c207ee |     
   mips64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/363b596b8c479b221e41ee5bf661a7ecf3810bb1 |     
    m68k     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/21d82d7b7660d785de972351642eeab2297b8191 |     
   s390x     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/42f6d366186d507b30c890ba84ca3014bb80f25e |     
  powerpc    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/710944a0f3d22b8e70d4281b95b4777033af7aca |     
powerpc64le  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/e18c30530e4899f450a222a5813e51d62f9186af |     
 microblaze  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/e459eeea7b795d12c2ddc05f8d1724e4fe970b82 |     
    hppa     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/1b614254b48611b80b213dad423a0e879d6fe1e4 |     
   sparc     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/f02a2215827e87c33574c774437ef849af98feb9 |     
   s390x     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/df592955469766736fa982931971329debf0e8ec |     
   x86_64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/a5424e90a40273e78f2acd0ae46178cae3c0b03b |     
    arm      |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/9d203789f3eb25c6529671712cbfd5da4b03da55 |     
    mips     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/31e221163b808a3e5688e2df21635532d8e2fef1 |     
   sh4aeb    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/3a393e54b12694df4e23cc4cc89c6bc7094bbf22 |     
   s390x     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/abc81b1dfce3e35924d2ad22a2b60421f774d104 |     
   mips64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/b1d6795c7b595b463dce3b978440a3041bc8fb91 |     
    i686     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/6f57dab1acf403a09453f75078b09fb521993fe1 |     
    mips     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/c31e672d23d2832dd3c0074779756eb1085c8611 |     
    or1k     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/00c95bc11f11773079917b0cc36a05c8ee880949 |     
    hppa     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/f6d92af4586d1922257947d68d5ac40a7cc49aa5 |     
    mips     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/24275adffc1393af15844ad54f83fcd110b9cf35 |     
 aarch64_be  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/2bbf71a1bcaca000f7f8e0a90276a9326d58aa1e |     
 microblaze  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/1224aceaa4ecb5eb4c4c0187570f399200f3c8f9 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/60b5bcd2cda30ccbdc760a1918d4c9352bef0290 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/cdaa6caafb3950a12d58ddf77b13260e495db85b |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/5b1c22fb9c4e56f26b919ca8924352f0fd4cbe65 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/e136b0be400bc3ecd5d548d33fe23cf09eb0c8cc |     
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/3223fefbcc98ffb8b9d595026e263787ce969bb7 | ORPH
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/4da3478db56edea5a7606edf2452c48379d32bd3 | ORPH
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/695c88d47845818756feaebf0fdbb5b0f36e6544 | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c6c6d5e5d8251231a35507ac766200e1af0be2b9 | ORPH
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/b14c6bf0214289a6940f179b162b0e913c759a13 | ORPH
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/f3155bf4eb15c92150f0703ade1e8aa84f1c541f | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/62d64829998abc15bdadb67303bbf108e56ba31d | ORPH
    arm      |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/1dedfb20e2a8d720e22bef2c6bdb6f530e9c6056 |     
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/288d6ceeaf473ce6da614c502ae3a13c759ae2ca | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8089a929fe2da4f7286205183281ddaa9d630a7a | ORPH
    hppa     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b2565d4e0ace1a76ed4ceb84fec569f32d9b9606 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fa9f8b76085ea99d2ef1ec3e56a6a6ab23206640 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a52aed06b735924a7ef44d73a2d17331fc7fc2d8 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0eb201603e6984b01752d0a82fe427c86f883ca7 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e0b57697eaf6c7a22f8cffe72e8121cc5cb9b9ab | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/06d4a1a20d017fe219016090cfc3ae98b00bd848 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5858fcbc4b13fd9cfd0aa899fb3902980c9cd222 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d2c3cfea80ddc26e9a2d64c1668aac5816901941 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e98c46c7812c8c137bd5f032ab80cd24ba306b6d | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/73c610d6bdc37595bceac84ae3af3e69e160e5ea | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/65c825c62491468af8c70de8146e659eecac1fed | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fe5d5f426b4b360ffa86b781b337792fce72343f | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d8a22c808e5c66e07b0d005e046b9768437325b6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/16025f0618f140fbaf52132b7f7b724a7a00d678 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7bf3665293fae96b272d84a092e5d00dee97bd74 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8e85831a8f4c4f3f2e424cbff25266327efa156b | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e0096e913fb62ab749b85bd53b33852d33d32c04 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b9d7381c18ccc5992931204a7d819872212711b4 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/35e2bc86d1c42611f3566d954303e69081006f2d | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bf6aee34e4b303e66fe289691aa06eae65997b9c | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4b16ea06a2b1ccaa7b2857a75c2d5f18da382980 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a8d25920a1f4568141eab6739477ee2cee7490eb | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c7afdc46323e606ac7037bfe3195bf42a20b0df7 | ORPH
   mipsel    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/899869466f86bc0fb17859aef2a35ad97a47f162 |     
  mips64el   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/5eb210c236c4a5e27e9c425040f36bc5c41fd3a6 |     
   armeb     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/8b3f88bda5ee873d3d4bc8b1eef4a517a954368f |     
  mips64el   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/7001c94cc499747b14e1de30d00ee44209b37ad2 |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/ddd4552f07f395b699413846500a70b8b33c93cb |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/9f57c30bb46b629993d2da19c1185fc829e5bc48 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/8a61975bae23a6e0ab53eae3d0ef9af8e202dcfa |     
    m68k     |         host-mpc-1.4.1         | NOK | https://autobuild.buildroot.org/results/9e58e05f7f85b98eb0078ef4b2e4c319ab54d505 | ORPH
   mips64    |         host-mpc-1.4.1         | NOK | https://autobuild.buildroot.org/results/9234ce895f26cc44f1860234ac5d4a2718a35ad1 | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/cc704b4aadf78a118e2b91cae6dc8f16ae2d74e1 | ORPH
   mips64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/0b6ece8da31f9c7e25c13674b4ca514d60e5cf65 | ORPH
  riscv32    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/36f23007449e0a225dde0074358750e568c8cc6c | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/0532f8d763a8de87645913fec9f51f41f2f9b788 | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/68615937065b81e5309fafb71495694a50fafc82 | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/aee6397364d8a1f057ff1bbaf17799d7b65e43ff | ORPH
  riscv32    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/4f97389095edffc66af4cc22428b81447f48b3f4 |     
    mips     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/c05caea2946746dd73554e3b6779be18afca60d2 |     
    sh4      |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/9230a9bf3376e7583fdfbef2fccfff4b5c43cbee |     
    sh4a     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/fa9edfb9dac4468bdf6f0ee7bf0caa1d250b78a3 |     
   armeb     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/60d1b9fa3326f3a43dd1ebced1178aee0570ccb4 |     
   mipsel    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/65d5f4fb27547c8cc0cb5ecd92ce32654db8b27c |     
   s390x     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/2cb4fc958c9f573cc9de14e8927e4688e61b0862 |     
  sparc64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/53aa2277d66b30db6e176fc8798e906c8c483221 |     
   sparc     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/f8b60ea4ec1e369cd54501d23a1ed3a08bed46a8 |     
  riscv32    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/29842153b263716fe6efe268d108f6ba03b7e5bf |     
   x86_64    |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/0b4ba2dae45289e3635ad6d98054781bf5276b4d |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/b95b763eb437dcae98165c466e90631e5748bb2c |     
   x86_64    | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/d7ea0c9fb9be19cd7677ba15b09632bdeb9da597 |     
 aarch64_be  | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/52fcfc6ef4987d526784b5add6bdf02c563a1fb6 |     
   sh4aeb    | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/3a2e9955f9e8824040f8df56a966320c2bee2ac8 |     
   sh4aeb    | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/c30be122560d18590ef1ee2835da5f86bc5b923c |     
  powerpc    | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/6c76efa27c4ca7439a4242e4ce7207793a51612b |     
   armeb     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/bf68120d37e9120f5ca54829c35d968d24f242ee |     
    arm      |          imagemagick           | TIM | https://autobuild.buildroot.org/results/f0c607034e08bb06722a2410049414d94dc1a1ab |     
   s390x     |         iproute2-7.0.0         | NOK | https://autobuild.buildroot.org/results/57c00d7986deb202037b0d53ca131d7919074c88 |     
   xtensa    |          janet-1.41.2          | NOK | https://autobuild.buildroot.org/results/cce4924af06af3f35ebe8561341343d43a723970 |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/745b2019cc7a4ba9cb1a2f514dafa7cb2949c8ba |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/f3ebd9f4b3edf9652d6bb549829cff4185459dfc |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/c5235e804380a109777d344e8731c65b25003d87 |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/b9cc2b47e55c874f6ba582ea4a5b228c7f3c762d |     
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/85585da18951076f51f039c35143332492171a81 |     
powerpc64le  |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/280b53b1baeea5ccc60e991db99323bff2a18ce5 | ORPH
microblazeel |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/df18003b9c8268c821e227fcf4e1e5c6fbf291cc | ORPH
  aarch64    |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/53b01cfac8797b2934421a2e39c8f5792504927f | ORPH
  riscv64    |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/299127749e34ec253ba2a1d74a03c78893cfadb3 | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/a8100b54ad36349283bcb4416a3a6eba0743fb79 |     
   sparc     |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/f50661d2b5ddf1c9622f9e65854fa42444868321 |     
   sparc     |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/e057a34d79d34992a9a5fe74c01de3fb268c58d7 |     
  sparc64    |        libcamera-v0.7.0        | NOK | https://autobuild.buildroot.org/results/89f3f1d822c8cd506c6090bec580bc97a616d94c |     
  sparc64    |        libcamera-v0.7.0        | NOK | https://autobuild.buildroot.org/results/0c480aebe26ec84afc3041865f991a27fabb79a0 |     
    mips     |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/a980c4f3c15fd9fbe27290a2a7cc4b148f43ad7c |     
   mipsel    |  libcdio-paranoia-10.2+2.0.2   | NOK | https://autobuild.buildroot.org/results/35d35fbcb15ae6ed328a873787bd7aeda6d85b1c |     
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/6362bc67b4efd988210517506846601bf01eb66a |     
 aarch64_be  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/8cc6650708268e059a762e7099671c27ab85c8f0 |     
   x86_64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/dd11d6ed9309171b7cb713568a03d46ae3b6a1d1 |     
   sparc     |         libdrm-2.4.131         | NOK | https://autobuild.buildroot.org/results/0b8c0670e5770a8bc1ca99c966eb91dd5f924fad |     
  aarch64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/5492ce8964a611db2b7c444a562ff245aa32aa06 | ORPH
  powerpc    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/b86ad5ab5fe69ad444f476c1052a014cfe2476da | ORPH
  mips64el   | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/55d5737c76bc5eb342a9db94e0d71cceb072d9ac | ORPH
 microblaze  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/3fb308807b91bf4f5abfb7eb5836e4fea8995b32 |     
 microblaze  |         libgeos-3.14.1         | NOK | https://autobuild.buildroot.org/results/c52d7a5f998c59b6a8739e65fc6f6cea280e5ec1 |     
    m68k     |   libglib2-bootstrap-2.86.5    | NOK | https://autobuild.buildroot.org/results/17bba7be2aa4de393dd180dedaadf1fb6caa9d86 |     
    i686     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/cb395e00fa594d7424ff17138d57002a10172d91 | ORPH
   s390x     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/77e7f5ed88b94451c679974e5f20c1cc1b2c6671 |     
    or1k     |         libidn2-2.3.8          | NOK | https://autobuild.buildroot.org/results/0603a069848aec8f02412b296b6dd62fd3e7cf77 |     
   x86_64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/6fcf9c7327fad6f05c9fff13b24ede9a102231bc |     
    sh4      |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/805f0831cf463dbf07f3bb74c9b97a3c1d3ee92d |     
  sparc64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/cf74e7f47c400fbd79c74c6e2d974075ef33f53c |     
   armeb     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/8c36805bf61bbdf64edad50746d80552b4f6cc52 |     
  mips64el   |           libopenssl           | TIM | https://autobuild.buildroot.org/results/9c2f03a970baede09740f973201b047371f3ea53 |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/cc14ecc3703622f055ec0eef1e12235981cba668 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/d28dd208e491417899892494bf2d924ef1303549 | ORPH
  sparc64    |    libphidget-1.24.20260127    | NOK | https://autobuild.buildroot.org/results/cac9f02686308cdf9584eeb4d95ce9cb44264776 |     
 aarch64_be  |        libpthsem-2.0.8         | NOK | https://autobuild.buildroot.org/results/bd1d4f4b18d13e8c80f2199342ae8b9d890b6379 |     
    sh4a     |       libucontext-1.3.3        | NOK | https://autobuild.buildroot.org/results/c28dd31baec4bf52362101e58e8af768f5e3f0c4 |     
microblazeel |       libunistring-1.4.2       | NOK | https://autobuild.buildroot.org/results/2d331ebc9c8a7cd323150cdf099f919eb3e00a5b |     
    arc      |         libusb-1.0.29          | NOK | https://autobuild.buildroot.org/results/dc1512698da76cd2eb5eea43ff1983008bc01d59 |     
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/c7b9634155278290f63d43802d4e1e01a23633d2 |     
  riscv32    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/6faeb3cb0f53fddfd4e1617578b9de8028e264ba |     
   x86_64    |         libxml2-2.15.3         | NOK | https://autobuild.buildroot.org/results/dbe48993d4647cc4d1c2f4a6fbbc55fbea8f459b |     
 aarch64_be  |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/203061cea30b95b8f390ab66084dcbf0e05431c4 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/e1d60667a9822526f673718aba374b215c7b4f36 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/c8336ab0046c23da7b1fbffb818c4dc8ee71b05e | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/ac1083a779aeb897cfee6fba67e99a08965144fc | ORPH
    m68k     |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/ddc8f57b1bf7c3dc8a5fd2816f91eb2214aff0ad | ORPH
  mips64el   |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/c5a5760496f581be6de2bf7efd9eee144870e285 | ORPH
    i686     |          linux-7.0.10          | NOK | https://autobuild.buildroot.org/results/08f3ff29a0cd2ea7abb7018f6ae7f3375266cdf5 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/54792dec081ec2a3abfacb9f02e697409b1b99d9 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/3945b646ce8a87a152b25074bc166f7fabc07e19 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/1a2297d167a8f8c6dc3af52219ecc7a703a9cb61 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/c8ff67b620797652fd6f76e3dded7b96060f3a86 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/f1ad502dde83d46795d75199b576705a779acf2e | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/ffe8d524ab571546380a57cf7fd62c9595ad10a5 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/bd78c4fbccf8dcb5072fa017752906ce303c4ae4 | ORPH
  aarch64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/c6571f0c4cb7f510498fbfd06603d89472ac015e | ORPH
powerpc64le  |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/0c838ef69558bfbb53e5ce84c7997e4f60876c17 |     
   armeb     |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/ffb4cc98105994f1d83195a09d7209bfc4cded6e |     
    arm      |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/eff8b89654b175241a97897e95c663890d790bb1 |     
  aarch64    |          luvi-v2.15.0          | NOK | https://autobuild.buildroot.org/results/743c71b172c750396e953656febfc4bbe03fb887 | ORPH
    arm      |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/a5f3bc83799ac693fd6f650701d3b31c559fa05a | ORPH
   x86_64    |       matchbox-lib-1.14        | NOK | https://autobuild.buildroot.org/results/a05211fb95a255327f866a510850f7dcb0e9bf92 | ORPH
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/f68863537c79607f2a68623b61e84dac245feda1 |     
  sparc64    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/51d06d36008b5fc7941e7ec3ab615a64e098eef7 |     
    mips     |        mosquitto-2.1.2         | NOK | https://autobuild.buildroot.org/results/51f68cc2c55c6b2e975e728323294d502e999312 |     
 aarch64_be  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/46d2791c3c0256682d4a75a89288f263cceda861 |     
    i686     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/cd04f4e2e18a725c64942a018c4e8623b37f2a4e |     
   x86_64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/dc8ed6d19b090f27c228e6bdd7cd077044e842c1 |     
    i686     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/a26da3a49b730c3fd84413782f0acadb2c6375b8 |     
 aarch64_be  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/4111b2f06931f1cb66fd25c458584acd17cbc538 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/23de3dc6e391bf46e807cfbe165ea89232085843 |     
   s390x     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/cbc72f60391fe6c399db7cbf7eada41f067e9afc |     
    mips     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/cae3bf75566e68b2758f9197858f7251ef45f0c6 |     
  aarch64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5636f14e65991071b8e97484ee0e246451ce84e9 |     
   mips64    |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/ed9931788bc726708065683c8de1682572d593bb |     
 aarch64_be  |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/cc0a615f1edb541fe02f03770c079cfadcbe2384 |     
powerpc64le  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/329a34fc5f05859202038b8db0acf3407c03c941 |     
  powerpc    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/e531343970f9a31a3b92995abaafb873938e1d01 |     
 aarch64_be  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/1bd55b1423a7a00f49f4f7b82d1819053fc2c9ad |     
    or1k     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/d375ca24aabcdaa3743597c1f315c9d3f74c4c14 |     
   armeb     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/5a82fe04d2f04e4fb2817eaca455f57e6cad8f5c |     
  mips64el   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/aa12b5cf9aa881f98d522c551740dc3d4f25e540 |     
  mips64el   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/9e538f21d2123738e9c69f8ce9808197b3cfdb5e |     
    i686     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/148c1af95e55859f09bfb33df7f6d5f6853db305 |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/d739989da3bb6a3046955ddc43e83664f3dc0cd1 |     
loongarch64  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/55555029836ee4ecb79f27bd03f312c88e2fc3aa |     
    or1k     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/fcd3fe5e1e27c7920f1138f31609c487a28ed80e | ORPH
  aarch64    |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/39cd3422dedb9be602e074506ba631f9547ad815 |     
   xtensa    |         opendoas-6.8.2         | NOK | https://autobuild.buildroot.org/results/0d980386ccaaae9bed74ccd0f698b15f0482c654 |     
powerpc64le  |        openjdk-21.0.4+7        | NOK | https://autobuild.buildroot.org/results/dd4e8412bc809156a766fa5a5df84776292172e0 |     
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/191f82c7379d4bbee91d0a7bb9049f10150c7ef7 | ORPH
   mipsel    |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/e3a0053eb6aa5bcd0b3649f59a2bcd02b0764580 | ORPH
   sparc     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/e3462ee612c7b296d66fb4f6c6b1022a8923291c | ORPH
   mips64    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/8983487990b9f83d9ce832f4480e944317e4cefa | ORPH
    or1k     |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/922dd772bd087efc9a3a53ceb85f428d5248fae5 | ORPH
   mips64    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/852e18cc465f846aee6e3bbb0f3698e8eca1392c | ORPH
    mips     |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/549be2e1fda3727f99728cd9d9c1a04f189d43bb | ORPH
   mips64    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/ad06d1a633c8877ac82962db126879dbb42e477f | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/04a27a3325ed4548457afd6907b2743807509200 |     
    arc      |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/1c4e9117472d48feb88591ebd21d6aefbcba5c5f |     
   x86_64    | package/mender-update-modul... | NOK | https://autobuild.buildroot.org/results/a2e61e6b2a7b73d37011378f46d8fe68a7c76a66 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/81b2355b7308f0a56ade900b080cff5673b7164f |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/4ad4bf534a4440e87a6c1b0b3c7253e01c7074ea | ORPH
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/91b2d89f1e9572b738d47ea431a17cbf19be018c | ORPH
    or1k     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/518375091f16a9e93d0272012bc3e3b15e16cfc3 | ORPH
microblazeel |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/e5a7c0654d80b141b6b0e2c2de0603d502d844b5 |     
 powerpc64   |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/35f89353322f6d7c54a954e3bf7af8a470c822a8 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/fb520435004d5fde26f440e9e98da4c666e37fee |     
loongarch64  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/2a1fed5eee6c0a9b6e7318466c90275b651c6de5 |     
   x86_64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/61416fbaa4d4386b387331222cdc78390f34e892 |     
 microblaze  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/a4d59104a9e5fc75f9d07bfe80c35cab5a5b536c |     
  mips64el   |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/3b0ce89fb8e8eb35abd777177e7d101cd5b65ba3 |     
    or1k     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/813b0caf9c9b1c1c11c08a5f5ad7f920337401c8 |     
  aarch64    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/0a34de1ee51f4d667cffefc0b539afda5d5921e3 |     
    or1k     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/73966e4f5da8179455fa8240786bbd129a177db3 |     
 aarch64_be  | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/0df172be40455b45b1bb92948631b97a15fd1cc4 |     
    arm      | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/37c88db0684b2446936b0f42447dac3b4ab1ebff |     
   sparc     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/1cd3360df2ff68be0fc0c361bdaf562d3322aed5 |     
  mips64el   |          ptpd2-2.3.1           | NOK | https://autobuild.buildroot.org/results/c44d41464650541b234d9693f8ab681b56609928 | ORPH
   s390x     |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/6e8b0ecdf471657f3806fd1252d4f7d3d848a06f |     
    arm      |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/6f0f9bbb90c829494d89bc5433dfa524b5f5223c |     
  mips64el   |          redis-8.6.2           | NOK | https://autobuild.buildroot.org/results/ca0afda253fff9aa815cb70bea80bffc12a8f86f |     
 powerpc64   | rtl8189fs-876e627a5b6a80217... | NOK | https://autobuild.buildroot.org/results/fd6e2c5394f704b5037c3e642d4611a8edd53cfa |     
  riscv64    |          seatd-0.9.1           | NOK | https://autobuild.buildroot.org/results/3425e2d4823dba05821dfff0af3e96513b2faf1d | ORPH
 powerpc64   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/fbbf656b3be2f26cd2b7123e6973d6c7a3deb10d |     
   x86_64    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/2afffff45b7977be86b589c4f2d6479761995962 |     
    or1k     |     spice-protocol-0.14.4      | NOK | https://autobuild.buildroot.org/results/78d398a230f9485dcfe64dd74db1a4d776742fdf | ORPH
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/6626f8ea7932ecd644ca12195c97198f54d0516b |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/955580ef6a3574dc1173a2b2fff43d8865d1684b |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/f283dce43492bf9b9315a5f778abff8ceeadf311 |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/f6025d0154a5679ea0780b5691e5e82257ddeea6 |     
microblazeel |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/247a964f928ae8d440762df177b06eb8e5b52f02 |     
 microblaze  |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/16cba8afd07d5dc156f0fa246af9d28f8e438cf3 |     
    m68k     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/0a50e6ab20eb77528c786c952b64409273ce375c | ORPH
   sparc     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/ca6265972c2c2e5eeb2c71a34d840e959efa3efd | ORPH
 aarch64_be  |        syslog-ng-4.11.0        | NOK | https://autobuild.buildroot.org/results/6b3eb910ccdb67827f0c12cea0e3a63c5e6b68af |     
    arm      |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/6121f7e2d142cef5ff62362d4a8c92a34ec2add4 |     
powerpc64le  |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/242df5ea11000169211cd7bba479e370dee390c7 |     
microblazeel |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/af4557b89a0ad3246f06864f9da8d2b5f01513d4 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/a8d50da42a05e2f727f506b8600dbb6044baf482 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/ffe79b4f1491d5480fc787c0b69a700f859e842e |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/bf8c34f436d0fb3de597bd9d7c9d81d3ed604a22 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/198af599fb24a33e7e18b00a01ff1caf41bc1d5d | ORPH
   xtensa    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/912823043c71a381ad8a6f7fbaaff1bd7916a344 | ORPH
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/2d8b05ae010537b8fcb05ea2e69ba9ac11466a35 | ORPH
    mips     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/f30effa5462e34927b9811c897f2f7398afe3960 | ORPH
powerpc64le  |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/c90ad2a6573c26fac07e59aaa1f88360b667ec02 | ORPH
    arc      |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/70a5e31ecba9fa7beb09cb33da2481dfcc5eb748 | ORPH
   armeb     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/2283e4b7fa3ff984ffb13a40900ca6c8b19cdca7 | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/8ef759201e67f126d8f0cc3ef785e2bb8bc3c925 |     
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/34846272914fa0ee5ff66cd6ce641adfbfe0e09d | ORPH
    sh4a     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/fdf66c6b28b5d4195637ea26ea54bc4b18ba32d0 | ORPH
   armeb     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/7dc7ebd4007c7487c33d4467b0bb501643f39a55 | ORPH
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/b5d341e641f62baa74d3df519a8cdfdd8990d6f3 | ORPH
   armeb     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/aab938304cb284801650a72cbb064a528d89ba41 | ORPH
   s390x     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/583f52ea77bdd5d3c21cfc712010ad5b4e23dcda | ORPH
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/9e3e90bc10b365501851c1aeceb470c876244407 |     
   mips64    |        unixodbc-2.3.14         | NOK | https://autobuild.buildroot.org/results/c51466aa6b72856f79b9be00d91e5a049221a6a6 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/7ecb60449be64369ddf51aff92978743576a43c3 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/6cdd4ab8feb2ff3b3f089d99fcf6115b33716ce3 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/296557f27d6ea36fe6ac733dd0f4d4203ff8a828 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/52a3cff8b475a992052a875e3d28b0767dc52299 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f5b99cb47d531942f5d7a640b5dee4696c407571 |     
  powerpc    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/dede52d1b700240a8075d73416f5b78de6f239a4 | ORPH
  mips64el   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/29e9cd01aac5a20966c3449409286624ec87ef5d | ORPH
    i686     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/664acc0658a694183cea5bd4eee1f171f1e9cd19 |     
 aarch64_be  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/532e2a4bd17c170c90bdbc120b37e13c38a1cb7b |     
    m68k     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/7a571960ed259220dac4f6514688b28865ccf5fd |     
   mips64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/1be2300cdcc93e7678303b6fab1cb5e17dc87b4e |     
powerpc64le  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/c4e2462e08c9f00732826abf5eb2e294b49928cf |     
loongarch64  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/9dc4921694bc4f9349363d14bb74ec7ac0ac94a0 |     
 aarch64_be  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/858af153d6a248bd61a3b85a4a1882bee5c2b57a |     
loongarch64  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/896c64b96386d6ab18500e6297ad494bf1083179 |     
   x86_64    |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/e42fd1ec86e548efc29069928d0f8b2ade3c4966 |     
  mips64el   |         weston-15.0.0          | NOK | https://autobuild.buildroot.org/results/29ce1511944a28702fbee7cfb8c89b97f73aac1d |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

          aardvark-dns-v1.17.0 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
                  libbpf-1.6.2 | 1 
              libopenssl-3.6.2 | 1 
               linux-pam-1.7.2 | 1 
                    lua-ev-1.5 | 1 
                       mrp-1.2 | 1 
                openswan-3.0.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/28abb551b7fb317f048362673fd573f214299006 | ORPH
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/6dfba5dd33cce5971d7becc82c1790286d16ca83 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/07d29d8d1cbade0167712fe2be84c9236114495c |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/9af9c29443cb91049bce473c78b3f2c90bb77462 | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/c9de4f065a872214d319ebaa5275cce2ef05e862 | ORPH
   x86_64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/a76b2b668b2d5522c6c1a7e322985014436c22a2 |     
microblazeel |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/9779dc0b8cc6950de9b763042d75353cfe0c7fcd |     
   xtensa    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/5323271e195d05d7f504529808030590700bb2e5 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 5 
                   perl-5.40.4 | 2 
           libmicrohttpd-1.0.5 | 1 
                  libnss-3.108 | 1 
                    mosh-1.4.0 | 1 
                   openrc-0.56 | 1 
                 protobuf-29.3 | 1 
python-remi-2022.7.27-37-g1... | 1 
          python-tinyrpc-1.1.7 | 1 
                rocksdb-6.20.3 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/5bdce405197bab0ded26f003c2e57c8d0448e430 |     
   sparc     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/39a6f61b5b02c39c058fe1b0a8c092fd35e32e45 |     
    mips     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/1d8be23c019e816ea7b1f0f29fa8added7fe1c4e |     
   sh4aeb    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/248bb08c1d9e25f200af6d767e39d6da4f2884c8 |     
   mips64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/3df8593b8982af2bf97c710321e8e623cfa6f2f6 |     
  powerpc    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/27f305ffb4987dca8f985074b718c3baea6f9262 |     
    i686     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/8ae7a6e3cc42845642bf1be1252e4e1dbc73fccd |     
   mipsel    |           mosh-1.4.0           | NOK | https://autobuild.buildroot.org/results/77643411f9fa0d0eebfc4f576c76ee29911081ac |     
 microblaze  |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/78aa93f86cc0943635da66f693129054a8c8f06a |     
   mipsel    |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/7bcc486f81484f451c2d29af1064046c1f65cb34 |     
    mips     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/563c8de76d8897a065ccf6655e1d558222a6eb50 |     
    m68k     |         protobuf-29.3          | NOK | https://autobuild.buildroot.org/results/a17dd77d6ea5140936465579a2080e3bbc8e20e6 |     
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/b0275729e577ad8d7f0efd432987041066ca1364 |     
    arm      |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/f3fe8e688c8ad053fa2fe0fc49a41232ecf9d998 |     
   x86_64    |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/82cd401335ef8df4946450f93ddabfb51f182811 |     
   mips64    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/a151ce70b27a433e9bf04639627346fe27aa6c8a |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org         |   version    |   upstream   | orph?
-------------------------------+----------+-----------------------------------------------+--------------+--------------+-------
                  aardvark-dns |  DISTRO  | https://release-monitoring.org/project/242641 | v1.17.0      | 1.17.1       | ORPH
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.6        | ORPH
                        acpica |  DISTRO  | https://release-monitoring.org/project/000018 | 20251212     | 20260408     | ORPH
                      adsp-ldr |  DISTRO  | https://release-monitoring.org/project/388235 | 1.0.1        | 1.0.2        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/013117 | 3.37.2       | 50.0         |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2026.1       | ORPH
  amazon-ecr-credential-helper |  DISTRO  | https://release-monitoring.org/project/359761 | v0.10.1      | 0.12.0       | ORPH
                 android-tools |  GUESS   | https://release-monitoring.org/project/226905 | 4.2.2+git... | 35.0.2       |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/006170 | 13.0         | 14.0         |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 4.1.1        | 5.0.0        |     
                      argparse |  DISTRO  | https://release-monitoring.org/project/007317 | 0.7.1-1      | 0.7.2        |     
                         argus |  DISTRO  | https://release-monitoring.org/project/000107 | 3.0.8.2      | 5.0.2        | ORPH
                        assimp |  DISTRO  | https://release-monitoring.org/project/006988 | 6.0.2        | 6.0.5        | ORPH
                      asterisk |  DISTRO  | https://release-monitoring.org/project/009838 | 22.8.2       | 23.3.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/007841 | 2.58.2       | 2.60.4       |     
                         atftp |  DISTRO  | https://release-monitoring.org/project/015219 | 0.8.0        | 0.8.1        |     
                         audit |  DISTRO  | https://release-monitoring.org/project/015225 | 3.1.5        | 4.1.4        | ORPH
                      autoconf |  DISTRO  | https://release-monitoring.org/project/000141 | 2.72         | 2.73         | ORPH
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/000142 | 2023.02.20   | 2024.10.16   | ORPH
                      automake |  DISTRO  | https://release-monitoring.org/project/000144 | 1.16.5       | 1.18.1       | ORPH
                  b43-fwcutter |  DISTRO  | https://release-monitoring.org/project/000152 | 019          | 020          |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
                          bash |  DISTRO  | https://release-monitoring.org/project/000166 | 5.2.37       | 5.3          | ORPH
               bash-completion |  DISTRO  | https://release-monitoring.org/project/005667 | 2.11         | 2.17.0       | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/014740 | 2024.2       | 2026.1       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/019529 | 2025.4       | 2026.1       |     
                   bats-assert |  DISTRO  | https://release-monitoring.org/project/372274 | 2.2.0        | 2.2.4        |     
                  bcache-tools |  DISTRO  | https://release-monitoring.org/project/021397 | 1.0.8        | 1.1          | ORPH
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.15      | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/014923 | 9.18.49      | 9.20.23      |     
                      binutils |  DISTRO  | https://release-monitoring.org/project/007981 | 2.45.1       | 2.46.0       |     
                          bird |  DISTRO  | https://release-monitoring.org/project/000192 | 2.15.1       | 3.2.1        |     
                        blake3 |  DISTRO  | https://release-monitoring.org/project/369414 | 1.8.3        | 1.8.5        |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.86         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.86         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/000211 | 8.2.11       | 8.2.13       |     
                         boost |  DISTRO  | https://release-monitoring.org/project/006845 | 1.83.0       | 1.91.0-1     |     
                         botan |  DISTRO  | https://release-monitoring.org/project/000214 | 3.5.0        | 3.12.0       | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.5.0       | 7.7.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.24.2       | 0.25.1       |     
                        brltty |  DISTRO  | https://release-monitoring.org/project/000220 | 6.8          | 6.9.1        |     
                         broot |  DISTRO  | https://release-monitoring.org/project/141357 | 1.56.2       | 1.56.4       |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/000227 | 6.10         | 7.0          | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/006428 | 0.8.0        | 0.13.0       | ORPH
                       busybox |  DISTRO  | https://release-monitoring.org/project/000230 | 1.37.0       | 1.38.0       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/021325 | 0.5.14       | 0.6.4        | ORPH
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/021328 | 2.4.3        | 2.5.0        |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/007959 | 1.16.2       | 1.18.0       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/021403 | 2.0.0        | 2.0.1        |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/010888 | 0.0.25       | 0.311        | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/011515 | 0.10.4       | 1.4.0        |     
                        catch2 |  DISTRO  | https://release-monitoring.org/project/007680 | 3.14.0       | 3.15.0       |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/002612 | 1.5.2        | 1.7.1        | ORPH
                        cdrkit |  DISTRO  | https://release-monitoring.org/project/010520 | 1.1.11       | 1.1.11-5     |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/001717 | 3.9          | 3.10         | ORPH
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/000287 | 7.4          | 7.5          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/021726 | 0.16.1       | 0.19.0       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/020578 | 2.6.1        | 2.6.2        |     
                   cloudflared |  DISTRO  | https://release-monitoring.org/project/186920 | 2025.8.1     | 2026.5.0     |     
                        clpeak |  DISTRO  | https://release-monitoring.org/project/015180 | 1.1.5        | 2.0.9        |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/000306 | 4.3.2        | 4.3.3        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/000330 | 4.3.20.1     | 4.3.20.2     |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/021882 | 0.9.1        | 0.10.1       | ORPH
                      composer |  DISTRO  | https://release-monitoring.org/project/009710 | 2.5.8        | 2.9.8        |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/096793 | 2.1.8        | 2.2.1        |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/000338 | 1.4.8        | 1.4.9        | ORPH
                    containerd |  DISTRO  | https://release-monitoring.org/project/016460 | 2.0.7        | 2.3.1        |     
       containers-image-config |  DISTRO  | https://release-monitoring.org/project/378977 | v5.35.0      | 5.36.2       | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/000343 | 9.10         | 9.11         | ORPH
                   cpp-httplib |  DISTRO  | https://release-monitoring.org/project/274636 | 0.43.1       | 0.45.0       |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/021408 | 2.1          | 2.2          |     
                          crun |  DISTRO  | https://release-monitoring.org/project/096792 | 1.24         | 1.27.1       |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/005541 | 1.28.17      | 2.0.1        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/021335 | 3.5.0        | 5.0.1        |     
                          dado |  DISTRO  | https://release-monitoring.org/project/058442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/021412 | 3.3.0        | 3.4.0        | ORPH
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/010252 | 3.3.0        | 3.4.0        | ORPH
                           daq |  DISTRO  | https://release-monitoring.org/project/013264 | 2.0.7        | 3.0.27       |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.25       | 3.0.27       |     
                        davici |  DISTRO  | https://release-monitoring.org/project/021340 | 1.4          | 1.6          | ORPH
                          dbus |  DISTRO  | https://release-monitoring.org/project/005356 | 1.14.10      | 1.16.2       | ORPH
                      dbus-cxx |  DISTRO  | https://release-monitoring.org/project/242464 | 2.5.2        | 2.6.2        |     
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/000402 | 1.2.18       | 1.4.0        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/015086 | 7.2.641      | 7.3.1        | ORPH
                    dehydrated |  DISTRO  | https://release-monitoring.org/project/011312 | 0.7.1        | 0.7.2        |     
                         delve |  DISTRO  | https://release-monitoring.org/project/040149 | 1.22.1       | 1.26.3       |     
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/000421 | 0.26         | 0.28         | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/011429 | 10.2.4       | 10.3.2       |     
                      dhcpdump |  DISTRO  | https://release-monitoring.org/project/021415 | 1.9          | 1.10         | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/000431 | 1.3-20251001 | 1.3-20260107 | ORPH
                     ding-libs |  DISTRO  | https://release-monitoring.org/project/013710 | 0.6.2        | 0.7.0        |     
         distribution-registry |  DISTRO  | https://release-monitoring.org/project/378976 | v3.0.0       | 3.1.1        | ORPH
                          dlib |  DISTRO  | https://release-monitoring.org/project/018600 | 19.24.9      | 20.0.1       |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/021076 | 28.3.2       | 29.5.2       |     
             docker-cli-buildx |  DISTRO  | https://release-monitoring.org/project/325723 | 0.25.0       | 0.34.1       | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/006185 | 2.38.2       | 5.1.4        |     
         docker-credential-gcr |  DISTRO  | https://release-monitoring.org/project/377457 | v2.1.30      | 2.1.32       | ORPH
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/000447 | 28.3.2       | 29.5.2       |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/021342 | 2024.4       | 2026.1       |     
             double-conversion |  DISTRO  | https://release-monitoring.org/project/007454 | 3.3.1        | 3.4.0        |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/000456 | 2.3.21.1     | 2.4.4        |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/021418 | 0.5.21.1     | 2.4.3        |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/000457 | 1.16.1       | 1.17.0       | ORPH
                          dpdk |  DISTRO  | https://release-monitoring.org/project/000459 | 25.11        | 26.03        |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/010627 | 110          | 111          |     
                            dt |  DISTRO  | https://release-monitoring.org/project/021844 | 18.32        | 21.27        | ORPH
                      dump1090 |  DISTRO  | https://release-monitoring.org/project/231403 | 10.2         | 11.0         |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 1.2.3        | 1.2.4        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/017392 | 1.7          | 1.9.0        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/017770 | 3.1.7        | 3.2.6        |     
                         eigen |  DISTRO  | https://release-monitoring.org/project/000666 | 3.4.0        | 5.0.1        | ORPH
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/000667 | 24.07        | 26.04        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/005679 | 0.194        | 0.195        | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/006601 | 2.3.3        | 2.8.16       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/000698 | 0.25.4       | 0.27.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/000707 | 26.2.5.15    | 29.0         |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/017060 | 1.0.23       | 1.0.27       |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/009323 | 1.1.3        | 2.0.0        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/016913 | 1.11.10      | 1.11.12      |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/045375 | 1.0.23       | 1.0.31       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/008757 | 1.0.31       | 1.0.34       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/020220 | 1.0.17       | 1.0.20       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/009302 | 0.6.14       | 0.9.6        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/010576 | 1.0.54       | 1.0.60       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/009222 | 1.0.30       | 1.0.34       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/010455 | 1.1.21       | 1.1.26       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/008643 | 1.0.26       | 1.0.29       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/045378 | 1.0.16       | 1.0.23       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/009283 | 1.0.13       | 1.0.16       |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/063188 | 1.8.10       | 1.9.1        |     
                      espflash |  DISTRO  | https://release-monitoring.org/project/373490 | 4.0.1        | 4.4.0        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/005482 | 2.9.6.1      | 2.9.9.1      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/000767 | 2.6.3        | 2.6.6        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/094441 | 1.2.9        | 1.3.2        |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.23.3       | 0.23.4       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/012048 | 1.37.2       | 1.38.1       | ORPH
                        fbterm |  DISTRO  | https://release-monitoring.org/project/008331 | 1.7.0        | 1.8          | ORPH
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.3.2        | 3.3.3        | ORPH
                            fd |  DISTRO  | https://release-monitoring.org/project/373722 | 10.3.0       | 10.4.2       |     
                           feh |  DISTRO  | https://release-monitoring.org/project/000790 | 3.11.2       | 3.12.2       |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/005405 | 6.1.5        | 8.1.1        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                          ficl |  DISTRO  | https://release-monitoring.org/project/021430 | 3.065        | 3065         |     
                           fio |  DISTRO  | https://release-monitoring.org/project/000806 | 3.41         | 3.42         |     
                     firewalld |  DISTRO  | https://release-monitoring.org/project/009989 | 2.0.2        | 2.4.1        | ORPH
                       flannel |  DISTRO  | https://release-monitoring.org/project/007421 | 0.26.0       | 0.28.4       |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/021434 | 1.14         | 1.15         |     
                          fltk |  DISTRO  | https://release-monitoring.org/project/000823 | 1.3.7        | 1.4.5        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 4.2.0        | 5.0.6        |     
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/010437 | 2.4.7        | 2.5.4        |     
                       fmtools |  DISTRO  | https://release-monitoring.org/project/021435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/000826 | 4.7.0        | 7.2.0        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/000827 | 2.17.1       | 2.18.0       | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.26.0       | 1.27.0       | ORPH
                         fping |  DISTRO  | https://release-monitoring.org/project/000834 | 5.4          | 5.5          |     
                      freeipmi |  DISTRO  | https://release-monitoring.org/project/000848 | 1.6.16       | 1.6.17       |     
                       freerdp |  DISTRO  | https://release-monitoring.org/project/010442 | 2.11.8       | 3.26.0       | ORPH
                    freeswitch |  DISTRO  | https://release-monitoring.org/project/021436 | 1.10.12      | 1.11.0       |     
                           frr |  DISTRO  | https://release-monitoring.org/project/018555 | 10.5.3       | 10.6.1       |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.13         | 1.16         |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/021438 | 1.9.1        | 1.16.0       |     
                         fwupd |  DISTRO  | https://release-monitoring.org/project/005833 | 2.0.4        | 2.1.3        |     
                gcc-bare-metal |  DISTRO  | https://release-monitoring.org/project/006502 | 15.2.0       | 16.1.0       |     
                          gdal |  DISTRO  | https://release-monitoring.org/project/000881 | 3.11.4       | 3.13.0       |     
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/009533 | 2.42.12      | 2.44.6       | ORPH
                     genext2fs |  DISTRO  | https://release-monitoring.org/project/021440 | 1.5.0        | 1.6.2        |     
                        gensio |  DISTRO  | https://release-monitoring.org/project/067634 | 2.5.5        | 3.0.2        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/018420 | 3.2.0        | 3.2.1        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/000898 | 0.22.4       | 1.0          | ORPH
                  gettext-tiny |  DISTRO  | https://release-monitoring.org/project/021443 | 0.3.2        | 0.3.3        |     
                        gflags |  DISTRO  | https://release-monitoring.org/project/008735 | 2.2.2        | 2.3.0        |     
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/001157 | 10.07.0      | 10.07.1      |     
                     git-crypt |  DISTRO  | https://release-monitoring.org/project/017093 | 0.7.0        | 0.8.0        | ORPH
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/011337 | 15.5.0       | 19.0.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/021353 | 2.76.0       | 2.80.1       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/007960 | 2.76.0       | 2.88.0       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/001181 | 1.0.1        | 1.0.3        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/008732 | 0.7.0        | 0.7.1        |     
            gmrender-resurrect |  DISTRO  | https://release-monitoring.org/project/021445 | 0.3          | 0.3.1        |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/001223 | 1.84.0       | 1.86.0       | ORPH
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/021085 | 2.3.2        | 2.6.1        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/005410 | 6.2.0        | 7.8.1        | ORPH
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/001248 | 1.3.46       | 1.3.47       |     
                         grout |  DISTRO  | https://release-monitoring.org/project/375897 | 0.14.3       | 0.15.0       |     
                         grub2 |  DISTRO  | https://release-monitoring.org/project/001257 | 2.12         | 2.14         |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/013139 | 45.0         | 50.1         |     
                         gssdp |  DISTRO  | https://release-monitoring.org/project/001262 | 1.6.4        | 1.6.5        |     
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/021856 | 1.24.13      | 1.29.1       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/021846 | 0.13.1       | 2.2.0        |     
                gst1-interpipe |  DISTRO  | https://release-monitoring.org/project/021847 | v1.1.8       | 1.1.10       | ORPH
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/021848 | 1.24.13      | 1.28.3       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/021849 | 1.24.13      | 1.28.3       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/021850 | 1.24.13      | 1.28.3       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/021852 | 1.24.13      | 1.28.3       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/015187 | 1.24.13      | 1.29.1       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/003881 | 1.24.13      | 1.28.3       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/021853 | 1.24.13      | 1.28.3       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/021854 | v0.8.1       | 0.9.1        |     
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/021855 | 1.24.13      | 1.26.11      | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/001263 | 1.24.13      | 1.28.3       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.24.13      | 1.28.3       | ORPH
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/007724 | 5.18.0       | 5.20.0       |     
                         guile |  DISTRO  | https://release-monitoring.org/project/001277 | 3.0.9        | 3.0.11       |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/001281 | 1.6.9        | 1.6.10       |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/001282 | 0.14.4       | 0.14.5       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/001285 | 5.2.14       | 5.3.5        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/005496 | 1.57.2       | 1.60.0       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/001298 | 2.6.27       | 3.3.10       |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/011695 | 1.9.21       | 1.9.22       |     
                heirloom-mailx |  DISTRO  | https://release-monitoring.org/project/095708 | 12.5         | 14.9.25      |     
                       highway |  DISTRO  | https://release-monitoring.org/project/205809 | 1.3.0        | 1.4.0        |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/001327 | 3.17.10      | 3.26.4       | ORPH
                       htpdate |  DISTRO  | https://release-monitoring.org/project/132187 | 2.0.1        | 2.0.2        |     
                        hwdata |  DISTRO  | https://release-monitoring.org/project/005387 | 0.406        | 0.407        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/013501 | 2.12.2       | 2.13.0       |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/021355 | 2.59.0       | 2.60.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/016134 | 78.2         | 78.3         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/021670 | 2.9          | 2.14         | ORPH
                  igh-ethercat |  DISTRO  | https://release-monitoring.org/project/021674 | 1.6.8        | 1.6.9        |     
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/021676 | 1.12.5       | 1.12.6       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/008864 | 3.20.2.2     | 4.25.9.0     | ORPH
                        iozone |  DISTRO  | https://release-monitoring.org/project/021679 | 3.508        | 3.510        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/001391 | 3.1.9        | 3.2.2        | ORPH
                      iptables |  DISTRO  | https://release-monitoring.org/project/001394 | 1.8.11       | 1.8.13       | ORPH
                      jemalloc |  DISTRO  | https://release-monitoring.org/project/001441 | 5.3.0        | 5.3.1        |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/029701 | 3.6.3        | 3.7.0        | ORPH
                           joe |  DISTRO  | https://release-monitoring.org/project/001467 | 4.6          | 4.8          | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/001504 | 2.2.8        | 2.3.4        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.26.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.26.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.26.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.26.0       |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/021462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.2        | 3.5.6        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/012418 | 2.2.0        | 2.3.2        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/016901 | 0.13         | 0.14.1       | ORPH
                         lcms2 |  DISTRO  | https://release-monitoring.org/project/009815 | 2.19         | 2.19.1       |     
                          less |  DISTRO  | https://release-monitoring.org/project/001550 | 692          | 702          |     
                           lft |  DISTRO  | https://release-monitoring.org/project/021863 | 3.91         | 3.98         | ORPH
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 4.1.1        | 5.0.0        |     
                 libatomic_ops |  DISTRO  | https://release-monitoring.org/project/001561 | 7.8.4        | 7.10.0       | ORPH
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.6.2        | 1.7.0        |     
                     libcamera |  DISTRO  | https://release-monitoring.org/project/301902 | v0.7.0       | 0.7.1        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/001575 | 2.0.3        | 3.2.0        | ORPH
                       libcoap |  DISTRO  | https://release-monitoring.org/project/021471 | 4.3.5a       | 4.3.5b       |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/015531 | 2.10.18      | 2.10.19      | ORPH
                      libdecor |  DISTRO  | https://release-monitoring.org/project/312806 | 0.2.4        | 0.2.5        | ORPH
                        libdex |  DISTRO  | https://release-monitoring.org/project/328356 | 1.0.0        | 1.1.0        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/006308 | 1.18.0       | 1.18.2       | ORPH
                        libdrm |  DISTRO  | https://release-monitoring.org/project/001596 | 2.4.131      | 2.4.133      |     
                      libecoli |  DISTRO  | https://release-monitoring.org/project/375859 | 0.10.1       | 0.11.6       |     
                       libenca |  DISTRO  | https://release-monitoring.org/project/011686 | 1.19         | 1.22         | ORPH
                      libevdev |  DISTRO  | https://release-monitoring.org/project/020540 | 1.13.5       | 1.13.6       |     
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/012043 | 0.99.9.1     | 1.2304.0     |     
                        libffi |  DISTRO  | https://release-monitoring.org/project/001611 | 3.4.8        | 3.5.2        |     
                         libfm |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.1        | ORPH
                   libfm-extra |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.1        | ORPH
                       libgit2 |  DISTRO  | https://release-monitoring.org/project/001627 | 1.9.2        | 1.9.4        |     
                       libglew |  DISTRO  | https://release-monitoring.org/project/007878 | 2.2.0        | 2.3.1        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/010024 | 2.86.5       | 2.88.1       |     
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/001239 | 1.24.3       | 2.1.0        | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/020640 | 1.6.5        | 2.2.4        | ORPH
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/001563 | 2.2.2        | 2.2.3        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/012587 | 1.0.23       | 1.0.24       | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/311549 | 3.24.51      | 3.24.52      |     
                       libgtk4 |  DISTRO  | https://release-monitoring.org/project/013942 | 4.21.0       | 4.22.4       | ORPH
                  libhdhomerun |  DISTRO  | https://release-monitoring.org/project/018397 | 20210624     | 20260326     |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/001632 | 0.5.51       | 0.5.53       |     
                       libical |  DISTRO  | https://release-monitoring.org/project/001637 | 3.0.20       | 4.0.1        |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/021479 | 0.10.3       | 2.3.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/005781 | 1.31.1       | 1.31.2       | ORPH
                      libiscsi |  DISTRO  | https://release-monitoring.org/project/010862 | 1.20.0       | 1.20.3       | ORPH
                       libjcat |  DISTRO  | https://release-monitoring.org/project/229583 | 0.2.3        | 0.2.6        |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 2.0.5        | 2.0.11       | ORPH
                       libksba |  DISTRO  | https://release-monitoring.org/project/001649 | 1.7.0        | 1.8.0        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/021363 | 2.49         | 250          |     
                    liblogging |  DISTRO  | https://release-monitoring.org/project/001654 | 1.0.6        | 1.0.8        | ORPH
                        libmad |  DISTRO  | https://release-monitoring.org/project/021487 | 0.15.1b      | 0.16.4       | ORPH
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/007470 | 1.10.0       | 1.13.3       |     
                       libmbim |  DISTRO  | https://release-monitoring.org/project/007308 | 1.32.0       | 1.34.0       |     
                         libmd |  DISTRO  | https://release-monitoring.org/project/015525 | 1.1.0        | 1.2.0        |     
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.13.6       | 0.14.2       |     
                   libmediaart |  DISTRO  | https://release-monitoring.org/project/013148 | 1.9.6        | 1.9.7        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/016827 | 0.11alpha    | 1.11         |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/031639 | 3.7.10       | 4.2.14       |     
        libnetfilter_conntrack |  DISTRO  | https://release-monitoring.org/project/001675 | 1.0.9        | 1.1.1        |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/001681 | 1.3.0        | 1.3.1        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/001683 | 0.1.21       | 0.1.23       |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/075209 | 6.2.3        | 6.3.0        |     
                       libnspr |  DISTRO  | https://release-monitoring.org/project/007953 | 4.38.2       | 4.39         |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/002503 | 3.123.1      | 3.124        |     
                        libodb |  DISTRO  | https://release-monitoring.org/project/001687 | 2.4.0        | 2.5.0        | ORPH
                  libodb-boost |  DISTRO  | https://release-monitoring.org/project/001688 | 2.4.0        | 2.5.0        |     
                  libodb-mysql |  DISTRO  | https://release-monitoring.org/project/001689 | 2.4.0        | 2.5.0        |     
                  libodb-pgsql |  DISTRO  | https://release-monitoring.org/project/001690 | 2.4.0        | 2.5.0        | ORPH
                    libopenmpt |  DISTRO  | https://release-monitoring.org/project/141468 | 0.7.13       | 0.8.7        |     
                    libopenssl |  DISTRO  | https://release-monitoring.org/project/002566 | 3.6.2        | 4.0.0        | ORPH
                     libosmium |  DISTRO  | https://release-monitoring.org/project/007023 | 2.22.0       | 2.23.1       |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/010899 | 2023.8       | 2026.1       |     
                       libpeas |  DISTRO  | https://release-monitoring.org/project/006871 | 1.32.0       | 2.2.1        | ORPH
                    libphidget |  DISTRO  | https://release-monitoring.org/project/115726 | 1.24.2026... | 2.1.9.201... |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/021367 | 7.10.4       | 8.0.1        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/011042 | 1.6.0        | 1.6.1        | ORPH
                         libqb |  DISTRO  | https://release-monitoring.org/project/009399 | 2.0.8        | 2.0.9        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/007307 | 1.36.0       | 1.38.0       |     
                  libqrtr-glib |  DISTRO  | https://release-monitoring.org/project/192056 | 1.2.2        | 1.4.0        |     
                        libraw |  DISTRO  | https://release-monitoring.org/project/001709 | 0.21.4       | 0.22.1       |     
                       librelp |  DISTRO  | https://release-monitoring.org/project/001713 | 1.11.0       | 1.12.0       |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/012102 | 3.9.2        | 4.3.1        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/005420 | 2.50.9       | 2.62.2       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/010717 | 2.0.5        | 2.0.7        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/013150 | 0.20.5       | 0.21.7       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/001717 | 3.9          | 3.10         |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/001717 | 3.9          | 3.10         |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/001717 | 3.9          | 3.10         |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/007961 | 3.4.0        | 3.8.1        |     
                      libsigc2 |  DISTRO  | https://release-monitoring.org/project/311642 | 2.12.1       | 2.12.2       |     
                    libsigsegv |  DISTRO  | https://release-monitoring.org/project/001722 | 2.14         | 2.15         |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/007908 | 0.7.35       | 0.7.37       |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/004864 | 1.9.3        | 2.1.0        |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/018547 | 2.7.0        | 2.8.0        |     
                        libssh |  DISTRO  | https://release-monitoring.org/project/001729 | 0.11.4       | 0.12.0       | ORPH
                       libtool |  DISTRO  | https://release-monitoring.org/project/001741 | 2.4.6        | 2.5.4        | ORPH
                    libtorrent |  DISTRO  | https://release-monitoring.org/project/001742 | 0.15.3       | 0.16.12      | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/004166 | 1.2.20       | 2.0.12       |     
                 libtraceevent |  DISTRO  | https://release-monitoring.org/project/288159 | 1.8.7        | 1.9.0        |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/021371 | 0.8.2        | 0.9.4        |     
                   libucontext |  DISTRO  | https://release-monitoring.org/project/017085 | 1.3.3        | 1.5.1        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/001748 | 1.8.1        | 1.8.3        | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/021315 | 1.14.25      | 1.18.5       |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/015849 | 1.0.3        | 1.0.4        | ORPH
                       liburcu |  DISTRO  | https://release-monitoring.org/project/007134 | 0.15.5       | 0.15.6       |     
                        libusb |  DISTRO  | https://release-monitoring.org/project/001749 | 1.0.29       | 1.0.30       |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/001750 | 0.1.8        | 0.1.9        |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/009998 | 1.28.1       | 1.32.0       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/005097 | 8.18.0       | 8.18.2       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/013830 | 7.10.0       | 12.3.0       |     
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.16.0       | 2023.4.0     |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/001780 | 1.9.2        | 1.13.1       |     
            libxml-parser-perl |  DISTRO  | https://release-monitoring.org/project/003531 | 2.47         | 2.59         |     
                       libxmlb |  GUESS   | https://release-monitoring.org/project/179028 | 0.3.19       | 0.3.27       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/011129 | 5.2.0        | 5.6.1        | ORPH
                    libxmlsec1 |  DISTRO  | https://release-monitoring.org/project/005200 | 1.3.9        | 1.3.11       |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/018554 | 3.13.6       | 5.4.9        |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 1.2.1        | 1.9.0        |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 1.2.1        | 1.9.0        |     
                          lilv |  DISTRO  | https://release-monitoring.org/project/001818 | 0.24.12      | 0.26.4       |     
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20260410     | 20260519     |     
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/014535 | 1.6.0        | 1.7.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/012414 | 2025.10.13   | 2026.04.22   | ORPH
                  lksctp-tools |  DISTRO  | https://release-monitoring.org/project/021497 | 1.0.19       | 1.0.21       | ORPH
                         lldpd |  DISTRO  | https://release-monitoring.org/project/014019 | 1.0.20       | 1.0.22       | ORPH
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/010135 | 0.1.19       | 0.2.0        | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/001835 | 2.1.0        | 2.1.2        | ORPH
                       log4cpp |  DISTRO  | https://release-monitoring.org/project/021499 | 1.1.4        | 1.1.6        |     
                          lpac |  DISTRO  | https://release-monitoring.org/project/371628 | 2.2.1        | 2.3.0        |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/011671 | 1.0.1-1      | 1.2.2        |     
                         lrzip |  DISTRO  | https://release-monitoring.org/project/001842 | 0.651        | 0.660        |     
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/011649 | 0.9.5-1      | 0.9.6        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/000155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/007135 | 2.14.0       | 2.15.1       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/007141 | 2.14.3       | 2.15.1       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/007136 | 2.14.0       | 2.15.0       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/001847 | 5.1.5        | 5.5.0        |     
                  lua-argparse |  GUESS   | https://release-monitoring.org/project/007317 | 0.7.1-1      | 0.7.2        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/013887 | 0.15-0       | 0.17.2       |     
                      lua-zlib |  GUESS   | https://release-monitoring.org/project/380938 | 1.3-0        | 1.4          |     
                      luarocks |  DISTRO  | https://release-monitoring.org/project/001856 | 3.12.2       | 3.13.0       |     
                         lutok |  DISTRO  | https://release-monitoring.org/project/021509 | 0.4          | 0.6.2        | ORPH
                           luv |  DISTRO  | https://release-monitoring.org/project/021510 | 1.51.0-1     | 1.52.1-0     | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/005354 | 2.03.31      | 2.03.41      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/001860 | 6.0.6        | 7.0.0        |     
                          lzip |  DISTRO  | https://release-monitoring.org/project/001866 | 1.25         | 1.26         | ORPH
                         lzlib |  DISTRO  | https://release-monitoring.org/project/021513 | 0.4.1.53-4   | 0.4.3        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/145824 | 9.22         | 26.01        | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.8        | 1.7.9        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/001887 | 10.11.15     | 12.3.1       | ORPH
              matchbox-desktop |  DISTRO  | https://release-monitoring.org/project/235369 | 0.9.1        | 2.0          | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/001893 | 1.5.26       | 1.5.30       |     
                          mawk |  DISTRO  | https://release-monitoring.org/project/001953 | 1.3.4-202... | 1.3.4-202... |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/013824 | 3.6.6        | 4.1.0        |     
                        mbpoll |  DISTRO  | https://release-monitoring.org/project/368619 | 1.5.2        | 1.5.4        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/015518 | 20220418     | 20260511     |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/016553 | 0.1.6.5      | 0.1.8.2      |     
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/001966 | 8.00         | 8.10         |     
               mender-artifact |  DISTRO  | https://release-monitoring.org/project/020630 | 4.2.0        | 4.4.0        |     
                    menu-cache |  DISTRO  | https://release-monitoring.org/project/001968 | 1.1.0        | 1.1.1        | ORPH
                         meson |  DISTRO  | https://release-monitoring.org/project/006472 | 1.10.1       | 1.11.1       |     
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/021519 | 0.02         | 2.8.0        |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2024.06      | 2026.04.1    |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/010539 | 1.22.2       | 1.28.0       |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/001978 | 5.6.1        | 5.16.1       |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/021522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.2.1        |     
                  minizip-zlib |  DISTRO  | https://release-monitoring.org/project/005303 | 1.3.1        | 1.3.2        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/021100 | 2024.12      | 2026.05      |     
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/020836 | 0.11.6       | 0.30.0       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/068638 | 2.9.12       | 3.0.15       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/006360 | 6.12.0.182   | 6.14.1       |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/011578 | 4.0.0        | 4.0.1        |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/005348 | 0.40.0       | 0.41.0       |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/002028 | 4.0.48       | 4.0.49       | ORPH
                           mtr |  DISTRO  | https://release-monitoring.org/project/002029 | 0.95         | 0.96         | ORPH
                      multicat |  DISTRO  | https://release-monitoring.org/project/021734 | 2.3          | 2.4          | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/000424 | 0.9.8        | 0.14.3       |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/002034 | 1.23.9       | 1.27.2       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/002035 | 2.2.16       | 2.3.2        |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/013545 | 3.3.1        | 4.0.4        |     
                       mxt-app |  DISTRO  | https://release-monitoring.org/project/373381 | 1.45         | 1.46         |     
                          nasm |  DISTRO  | https://release-monitoring.org/project/002048 | 2.16.03      | 3.01         | ORPH
                           nbd |  DISTRO  | https://release-monitoring.org/project/002052 | 3.26.1       | 3.27.1       | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/006045 | 1.22         | 2.9.2        |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/002057 | 6.6-20251231 | 6.6-20260523 | ORPH
                         ndctl |  DISTRO  | https://release-monitoring.org/project/010381 | 83           | 84           |     
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/021531 | 1.0.7        | 1.0.8        | ORPH
                         neard |  DISTRO  | https://release-monitoring.org/project/021866 | 0.19         | 0.20         |     
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 2.3.1        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/002063 | 3.1.19       | 4.4.3        | ORPH
                      netavark |  DISTRO  | https://release-monitoring.org/project/242639 | v1.17.0      | 1.17.2       | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/021534 | 1.234        | 1.238        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/011046 | 1.37.1       | 2.10.3       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/021917 | 0.7.3        | 0.7.14       |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.4.5        | 2.8.2        |     
                       netsurf |  DISTRO  | https://release-monitoring.org/project/005386 | 3.10         | 3.11         | ORPH
                        nettle |  DISTRO  | https://release-monitoring.org/project/002073 | 3.10.2       | 4.0          | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/021197 | 1.56.0       | 1.56.1       | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/069977 | 1.12.0       | 1.12.5       |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.4        | 1.1.6        |     
               nftables-python |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.4        | 1.1.6        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/008651 | 1.68.1       | 1.69.0       | ORPH
                         nginx |  DISTRO  | https://release-monitoring.org/project/005413 | 1.28.3       | 1.31.1       | ORPH
                        ngircd |  DISTRO  | https://release-monitoring.org/project/002083 | 26.1         | 27           | ORPH
                           nnn |  DISTRO  | https://release-monitoring.org/project/017080 | 5.1          | 5.2          |     
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/008251 | 22.22.0      | 26.2.0       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/008251 | 22.22.0      | 26.2.0       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/021539 | 2.1.9        | 3.3.0        | ORPH
                          norm |  DISTRO  | https://release-monitoring.org/project/021540 | 1.5.8        | 1.5.9        | ORPH
                         nqptp |  DISTRO  | https://release-monitoring.org/project/293307 | 1.2.4        | 1.2.8        |     
                       ntfs-3g |  DISTRO  | https://release-monitoring.org/project/002504 | 2022.10.3    | 2026.2.25    | ORPH
                       nushell |  DISTRO  | https://release-monitoring.org/project/031106 | 0.108.0      | 0.113.0      | ORPH
                           nut |  DISTRO  | https://release-monitoring.org/project/002510 | 2.8.4        | 2.8.5        |     
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/002511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/021843 | 390.151      | 390.157      | ORPH
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 595.71.05    | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 580.95.05    | 595.71.05    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/009074 | 2.15         | 3.0-a.5      | ORPH
                           odb |  DISTRO  | https://release-monitoring.org/project/002531 | 2.4.0        | 2.5.0        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/016859 | 2.18         | 2.19         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/033334 | v14.4.1      | 14.5.2       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/021545 | 4.3.1        | 4.3.4        | ORPH
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/010861 | 2.1.9        | 2.1.11       |     
                     open-isns |  DISTRO  | https://release-monitoring.org/project/009393 | 0.102        | 0.103        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/016896 | v1.3.15      | 1.5.4        | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/008172 | 1.24.3       | 1.25.2       | ORPH
                      openblas |  DISTRO  | https://release-monitoring.org/project/002540 | 0.3.32       | 0.3.33       |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/021548 | 0.1.5        | 0.1.6        | ORPH
                       opencsd |  DISTRO  | https://release-monitoring.org/project/368613 | 1.8.1        | 1.8.2        |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/002549 | 2.0.36       | 2.0.37       | ORPH
                       openmpi |  DISTRO  | https://release-monitoring.org/project/002554 | 4.1.8        | 5.0.10       |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/011687 | 0.56         | 0.63.1       |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/021551 | 3.13.2       | 3.17.4       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/010998 | 11.3.5-18... | 13.1.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/059397 | 0.7.0        | 0.9.0        | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/002573 | 0.4.41       | 0.4.42       | ORPH
                   paho-mqtt-c |  DISTRO  | https://release-monitoring.org/project/021375 | 1.3.15       | 1.3.16       |     
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/021376 | 1.3.2        | 1.6.0        |     
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.28         | 1.31         |     
                          palo |  GUESS   | https://release-monitoring.org/project/389410 | 2.28         | 2.29         |     
                       pangomm |  DISTRO  | https://release-monitoring.org/project/007958 | 2.50.1       | 2.56.1       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/010309 | 0.7          | 0.65         | ORPH
                        parsec |  DISTRO  | https://release-monitoring.org/project/183223 | 1.4.1        | 1.5.0        |     
                        parted |  DISTRO  | https://release-monitoring.org/project/002596 | 3.6          | 3.7          |     
                         patch |  DISTRO  | https://release-monitoring.org/project/002597 | 2.7.6        | 2.8          | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/002598 | 0.13         | 0.18.0       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/002601 | 1.3.7        | 1.3.10       | ORPH
                       pcmanfm |  DISTRO  | https://release-monitoring.org/project/002607 | 1.3.2        | 1.4.0        |     
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/002611 | 2.1.0        | 2.4.1        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/021378 | 3.5          | 3.6          |     
                    perl-clone |  DISTRO  | https://release-monitoring.org/project/005875 | 0.47         | 0.50         |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/011930 | 2.33         | 3.07         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/002743 | 0.02         | 0.23         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/002748 | 0.33         | 0.41         |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/002785 | 6.98         | 6.99         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/002807 | 4.046        | 5.013        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/002811 | 1.643        | 1.647        |     
               perl-devel-size |  DISTRO  | https://release-monitoring.org/project/002835 | 0.85         | 0.87         |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/012660 | 2.77         | 2.84         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/002967 | 3.83         | 3.85         |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/002975 | 6.16         | 6.17         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/006175 | 12.50        | 13.58        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/006569 | 2.080        | 2.097        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/003024 | 6.81         | 6.83         |     
       perl-lwp-protocol-https |  DISTRO  | https://release-monitoring.org/project/003050 | 6.14         | 6.15         |     
               perl-mime-tools |  DISTRO  | https://release-monitoring.org/project/011809 | 5.515        | 5.517        |     
        perl-module-build-tiny |  DISTRO  | https://release-monitoring.org/project/011870 | 0.052        | 0.053        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/005966 | 9.42         | 9.45         |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/003147 | 1.53         | 1.54         |     
                    perl-plack |  DISTRO  | https://release-monitoring.org/project/006578 | 1.0051       | 1.0054       |     
                perl-role-tiny |  DISTRO  | https://release-monitoring.org/project/010665 | 2.002004     | 2.002005     |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/014338 | 0.52         | 0.61         |     
                 perl-sys-mmap |  DISTRO  | https://release-monitoring.org/project/005675 | 0.20         | 0.21         |     
           perl-time-parsedate |  DISTRO  | https://release-monitoring.org/project/003469 | 2015.103     | 2026.0219    |     
                 perl-timedate |  DISTRO  | https://release-monitoring.org/project/003463 | 2.33         | 2.35         |     
           perl-www-robotrules |  DISTRO  | https://release-monitoring.org/project/003506 | 6.02         | 6.03         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/003527 | 2.0134       | 2.0213       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/011010 | 5.1.27       | 5.1.28       |     
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/021742 | 1.4          | 1.5.0        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/013302 | 3.5.0        | 3.5.1        |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/057357 | 1.2.8        | 1.6.5        |     
        pipewire-media-session |  DISTRO  | https://release-monitoring.org/project/236416 | 0.4.2        | 0.4.3        | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/012753 | 2.3.0        | 2.5.1        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/003674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/005418 | 1.14.2       | 1.15.3       |     
                        podman |  DISTRO  | https://release-monitoring.org/project/093284 | v5.7.0       | 5.8.2        | ORPH
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 4.3          | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.9          | 3.10         | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/003682 | 126          | 127          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/003686 | 25.10.0      | 26.05.0      |     
                       postgis |  DISTRO  | https://release-monitoring.org/project/003694 | 3.6.2        | 3.6.3        |     
                         pound |  DISTRO  | https://release-monitoring.org/project/005436 | 4.17         | 4.22         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/010715 | 1.3.11       | 1.3.14       | ORPH
                          pppd |  DISTRO  | https://release-monitoring.org/project/003703 | 2.5.2        | 2.5.3        |     
                         procs |  DISTRO  | https://release-monitoring.org/project/076458 | 0.14.10      | 0.14.11      |     
                          proj |  DISTRO  | https://release-monitoring.org/project/009463 | 9.8.0        | 9.8.1        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/003709 | 0.11.14      | 13.0.5       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 34.1         | 35.0         |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/006499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/021825 | 6.0.1        | 6.5.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/003726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/003728 | 1.14         | 1.15         |     
                     pure-ftpd |  DISTRO  | https://release-monitoring.org/project/003731 | 1.0.53       | 1.0.54       |     
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/034074 | 3.1.16       | 3.1.17       |     
                 python-aiodns |  DISTRO  | https://release-monitoring.org/project/021245 | 4.0.0        | 4.0.4        |     
       python-aiohappyeyeballs |  DISTRO  | https://release-monitoring.org/project/373934 | 2.6.1        | 2.6.2        |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/003766 | 1.17.2       | 1.18.4       |     
               python-asyncssh |  DISTRO  | https://release-monitoring.org/project/017555 | 2.22.0       | 2.23.0       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/011984 | 2.17.0       | 2.18.0       |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/026271 | 3.0.1        | 3.0.2        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/029737 | 1.43.1       | 1.43.14      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/008748 | 1.43.1       | 1.43.14      |     
               python-cachelib |  DISTRO  | https://release-monitoring.org/project/101091 | 0.13.0       | 0.14.0       |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/007022 | 6.2.4        | 7.1.4        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/064102 | 5.9.0        | 6.1.1        |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/014813 | 2.1.7        | 2.2.0a2      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/007995 | 2026.4.22    | 2026.5.20    |     
                python-chardet |  DISTRO  | https://release-monitoring.org/project/003798 | 5.2.0        | 7.4.3        |     
     python-charset-normalizer |  DISTRO  | https://release-monitoring.org/project/055366 | 3.4.5        | 3.4.7        |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/003802 | 8.3.3        | 8.4.1        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/019734 | 1.1.30       | 2.0.3        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/005532 | 47.0.0       | 48.0.0       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/036699 | 3.1.3        | 3.2.5        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/021697 | 1.1.0        | 1.1.1        |     
              python-dbus-fast |  DISTRO  | https://release-monitoring.org/project/287975 | 4.0.4        | 5.0.6        |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/003819 | 5.2.1        | 5.3.1        |     
                 python-dotenv |  DISTRO  | https://release-monitoring.org/project/019788 | 1.2.1        | 1.2.2        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/008370 | 0.19.1       | 0.19.2       |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/015064 | 4.13.0       | 4.13.2       |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/011619 | 5.1.0        | 5.2.0        |     
   python-farama-notifications |  DISTRO  | https://release-monitoring.org/project/389426 | 0.0.4        | 0.0.6        |     
                python-fastapi |  DISTRO  | https://release-monitoring.org/project/047977 | 0.136.1      | 0.136.3      |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/085010 | 25.9.23      | 25.12.19     |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/007388 | 4.62.1       | 4.63.0       |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/006459 | 3.1.46       | 3.1.50       |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 16.1.0       | 16.3.0       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/013158 | 3.54.5       | 3.56.3       |     
            python-google-auth |  DISTRO  | https://release-monitoring.org/project/038039 | 2.49.1       | 2.53.0       |     
python-googleapis-common-pr... |  DISTRO  | https://release-monitoring.org/project/063943 | 1.74.0       | 1.75.0       |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/006870 | 3.5.0        | 3.5.1        |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/018429 | 1.76.0       | 1.80.0       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/030542 | 1.76.0       | 1.80.0       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/003882 | 23.0.0       | 26.0.0       |     
              python-gymnasium |  DISTRO  | https://release-monitoring.org/project/289852 | 1.2.3        | 1.3.0        |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/011771 | 2.4.1        | 2.4.3-1      |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/005487 | 3.11         | 3.16         |     
              python-installer |  DISTRO  | https://release-monitoring.org/project/197662 | 1.0.0        | 1.0.1        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/001399 | 9.8.0        | 9.13.0       |     
            python-iterable-io |  DISTRO  | https://release-monitoring.org/project/374467 | 1.0.1        | 1.0.4        |     
         python-jaraco-context |  DISTRO  | https://release-monitoring.org/project/062309 | 6.0.2        | 6.1.2        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/020165 | 4.4.0        | 4.5.0        |     
            python-jaraco-text |  DISTRO  | https://release-monitoring.org/project/023436 | 4.0.0        | 4.2.0        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/003893 | 0.19.2       | 0.20.0       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/016910 | 1.4.9        | 1.5.0        |     
                  python-librt |  DISTRO  | https://release-monitoring.org/project/388232 | 0.9.0        | 0.11.0       |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/012301 | 3.3.1        | 3.4.0        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/003914 | 6.0.2        | 6.1.1        |     
         python-magic-wormhole |  DISTRO  | https://release-monitoring.org/project/017278 | 0.23.0       | 0.24.0       |     
python-magic-wormhole-mailb... |  DISTRO  | https://release-monitoring.org/project/019823 | 0.6.0        | 0.8.0        |     
         python-markdown-it-py |  DISTRO  | https://release-monitoring.org/project/088959 | 4.0.0        | 4.2.0        |     
      python-matplotlib-inline |  GUESS   | https://release-monitoring.org/project/198324 | 0.2.1        | 0.2.2        |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/042653 | 1.11.2       | 1.13.3       |     
           python-mbstrdecoder |  DISTRO  | https://release-monitoring.org/project/021702 | 1.1.4        | 1.1.5        |     
        python-mdit-py-plugins |  DISTRO  | https://release-monitoring.org/project/149444 | 0.5.0        | 0.6.1        |     
                 python-memray |  DISTRO  | https://release-monitoring.org/project/267110 | 1.19.1       | 1.19.3       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/006189 | 3.2.0        | 3.2.1        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/012201 | 11.0.2       | 11.1.0       |     
                   python-mpd2 |  DISTRO  | https://release-monitoring.org/project/019721 | 3.1.1        | 3.1.2        |     
                 python-mpmath |  DISTRO  | https://release-monitoring.org/project/003930 | 1.3.0        | 1.4.1        |     
              python-multipart |  DISTRO  | https://release-monitoring.org/project/018463 | 0.0.22       | 0.0.29       |     
                   python-mypy |  DISTRO  | https://release-monitoring.org/project/008453 | 1.19.1       | 2.1.0        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/002509 | 2.4.0        | 2.4.6        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.1.5        | 2.0a0        |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/031737 | 3.11.5       | 3.11.9       |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/003954 | 4.0.0        | 5.0.0+rtd1   |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/016689 | 0.8.6        | 0.8.7        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/007974 | 12.0.0       | 12.2.0       |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/006529 | 26.1         | 26.1.1       |     
            python-poetry-core |  DISTRO  | https://release-monitoring.org/project/071155 | 2.3.2        | 2.4.1        |     
              python-propcache |  DISTRO  | https://release-monitoring.org/project/375192 | 0.4.1        | 0.5.2        |     
             python-proto-plus |  DISTRO  | https://release-monitoring.org/project/099887 | 1.27.2       | 1.28.0       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 34.1         | 35.0         |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/003979 | 2.9.11       | 2.9.12       |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/013384 | 3.0.1        | 3.0.4        |     
                python-pycrate |  DISTRO  | https://release-monitoring.org/project/185106 | 0.7.11       | 0.8.1        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/021582 | 20260313.1   | 20260818.1   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/039654 | 2.13.3       | 2.13.4       |     
          python-pydantic-core |  DISTRO  | https://release-monitoring.org/project/273695 | 2.46.3       | 2.47.0       |     
      python-pydantic-settings |  DISTRO  | https://release-monitoring.org/project/342182 | 2.14.0       | 2.14.1       |     
                  python-pyjwt |  DISTRO  | https://release-monitoring.org/project/005653 | 2.12.1       | 2.13.0       |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/021583 | 0.23.0       | 0.24.0       |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/017320 | 1.23.22      | 1.27.2.3     |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/007284 | 1.1.2        | 1.2.0        |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/005535 | 26.1.0       | 26.2.0       |     
             python-pypa-build |  DISTRO  | https://release-monitoring.org/project/132276 | 1.3.0        | 1.5.0        |     
                  python-pypng |  DISTRO  | https://release-monitoring.org/project/006706 | 0.20220715.0 | 0.20250521.0 |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/020104 | 5.15.6       | 5.15.11      |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/021589 | 1.2.13       | 1.2.14       |     
                  python-pysmi |  DISTRO  | https://release-monitoring.org/project/013209 | 1.6.2        | 2.0.0        |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/012027 | 7.1.22       | 7.1.27       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/006537 | 2026.1.post1 | 2026.2       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/004104 | 25.1.2       | 27.1.0       |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/005548 | 2026.4.4     | 2026.5.9     |     
               python-requests |  DISTRO  | https://release-monitoring.org/project/004004 | 2.33.1       | 2.34.2       |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/062048 | 0.10.0       | 0.13.0       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/019641 | 2.1.76       | 2.2.4        |     
            python-ruamel-yaml |  DISTRO  | https://release-monitoring.org/project/066067 | 0.19.0       | 0.19.1       |     
     python-sdbus-modemmanager |  DISTRO  | https://release-monitoring.org/project/378670 | 1.0.3        | 1.0.5        |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/005645 | 4.39.0       | 4.44.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/021603 | 2.58.0       | 2.60.0       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/004021 | 80.9.0       | 82.0.1       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/007874 | 9.2.2        | 10.0.5       |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/013626 | 4.19.25      | 6.15.3       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/012729 | 5.0.3        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/007203 | 0.6.1        | 0.7.3        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/021611 | 5.16.0       | 5.16.2       |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/027570 | 2.8.3        | 2.8.4        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/004034 | 2.0.49       | 2.0.50       |     
              python-starlette |  DISTRO  | https://release-monitoring.org/project/036570 | 1.0.0        | 1.1.0        |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/021613 | 1.3.4        | 1.3.5        |     
             python-telnetlib3 |  DISTRO  | https://release-monitoring.org/project/133741 | 4.0.2        | 4.0.4        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/021225 | 5.8.1        | 5.10.0       |     
                python-textual |  DISTRO  | https://release-monitoring.org/project/209284 | 8.2.5        | 8.2.7        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/021614 | 0.22.0       | 0.23.0       |     
                python-tomlkit |  DISTRO  | https://release-monitoring.org/project/019609 | 0.14.0       | 0.15.0       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/012211 | 5.14.3       | 5.15.0       |     
      python-trove-classifiers |  DISTRO  | https://release-monitoring.org/project/088298 | 2026.4.28.13 | 2026.5.22.10 |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/004071 | 25.5.0       | 26.4.0       |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/038819 | 4.5.1        | 4.5.2        |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/021617 | 1.3.4        | 2.0.0        |     
           python-types-psutil |  DISTRO  | https://release-monitoring.org/project/221807 | 7.2.2.202... | 7.2.2.202... |     
  python-types-python-dateutil |  DISTRO  | https://release-monitoring.org/project/147859 | 2.9.0.202... | 2.9.0.202... |     
       python-types-setuptools |  DISTRO  | https://release-monitoring.org/project/214295 | 82.0.0.20... | 82.0.0.20... |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/004076 | 5.12.0       | 5.12.1       |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/004078 | 2.6.3        | 2.7.0        |     
                python-uvicorn |  DISTRO  | https://release-monitoring.org/project/028526 | 0.46.0       | 0.48.0       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/008743 | 0.2.14       | 0.7.0        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/020617 | v3.1.1       | 3.3.3        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/006108 | 2.0.1        | 2.2.1        |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/011805 | 3.2.1        | 3.2.2        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/012895 | 1.23.0       | 1.24.2       |     
                   python-yatl |  DISTRO  | https://release-monitoring.org/project/050636 | 20230507.3   | 20260518.1   |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/012681 | 0.148.0      | 1.0.0        |     
           python-zipstream-ng |  DISTRO  | https://release-monitoring.org/project/215954 | 1.9.0        | 1.9.2        |     
                  python-zlmdb |  DISTRO  | https://release-monitoring.org/project/066674 | 23.1.1       | 25.12.3      |     
                    qbee-agent |  DISTRO  | https://release-monitoring.org/project/372328 | 2026.10      | 2026.19      |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/013607 | 10.2.0       | 11.0.0       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/021737 | 2.4.7        | 2.5.1        | ORPH
               qoriq-mc-binary |  DISTRO  | https://release-monitoring.org/project/377827 | 10.39.0      | 10.300.138   |     
                qoriq-mc-utils |  DISTRO  | https://release-monitoring.org/project/377824 | 10.39.0      | 10.40.0      |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/005542 | 10.5.0       | 12.3.2       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.1       |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.1       |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.1       |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.1       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.14      | 6.11.1       |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                       qt6mqtt |  DISTRO  | https://release-monitoring.org/project/242923 | 6.9.1        | 6.11.1       |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                         quota |  DISTRO  | https://release-monitoring.org/project/004145 | 4.10         | 4.11         |     
                     quotatool |  DISTRO  | https://release-monitoring.org/project/004146 | 1.6.4        | 1.8.0        | ORPH
                           qwt |  DISTRO  | https://release-monitoring.org/project/004147 | 6.1.6        | 6.3.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/013768 | 0.14.0       | 0.15.0       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/012105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/007426 | 1.9.3        | 1.9.4        |     
                     rdma-core |  DISTRO  | https://release-monitoring.org/project/012907 | 62.0         | 63.0         |     
                         redis |  DISTRO  | https://release-monitoring.org/project/004181 | 8.6.2        | 8.6.3        |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/021663 | 2.20250923   | 2.20260312   |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.7       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/001717 | 3.9          | 3.10         | ORPH
                         rhash |  DISTRO  | https://release-monitoring.org/project/013843 | 1.4.4        | 1.4.6        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/015461 | 14.1.1       | 15.1.0       |     
                        rlwrap |  DISTRO  | https://release-monitoring.org/project/004199 | 0.46.1       | 0.48         |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/015560 | 6.20.3       | 11.1.1       |     
                       rrdtool |  DISTRO  | https://release-monitoring.org/project/004214 | 1.9.0        | 1.10.2       |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/004218 | 8.2510.0     | 8.2604.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/059450 | 2.8          | 2.10         |     
                       rtl_433 |  DISTRO  | https://release-monitoring.org/project/014997 | 25.02        | 25.12        |     
                      rtorrent |  DISTRO  | https://release-monitoring.org/project/004221 | 0.15.3       | 0.16.12      | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/087994 | 9.0.4        | 9.1.0        |     
                          ruby |  DISTRO  | https://release-monitoring.org/project/004223 | 4.0.3        | 4.0.5        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/007462 | 1.3.0        | 1.4.2        |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/004751 | 0.42.5       | 45.2         |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/010714 | 2.33.1       | 2.42.1       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/005485 | 2.13.1.0     | 2.15.0.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/016547 | 2.4.0.0      | 2.4.1.2      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/016552 | 1.1.2.1      | 1.2.0.1      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/016551 | 2.6.2.1      | 2.6.4.1      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/016550 | 2.7.0.4      | 2.8.0.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/016549 | 2.3.0.4      | 2.3.1.2      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/016548 | 0.5.5.0      | 0.6.1.1      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/021385 | 3.9.1        | 08032024     |     
                  sane-airscan |  DISTRO  | https://release-monitoring.org/project/121086 | 0.99.36      | 0.99.37      |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/004760 | 1.1.1        | 1.4.0        |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/016338 | 2.1          | 2.2          |     
                         scons |  DISTRO  | https://release-monitoring.org/project/004770 | 4.8.1        | 4.10.1       |     
                   screenfetch |  DISTRO  | https://release-monitoring.org/project/005733 | 3.9.1        | 3.9.9        | ORPH
                        scrypt |  DISTRO  | https://release-monitoring.org/project/021238 | 1.3.2        | 1.3.3        |     
                     sdbus-cpp |  DISTRO  | https://release-monitoring.org/project/070626 | 2.2.1        | 2.3.1        |     
                           sdl |  DISTRO  | https://release-monitoring.org/project/004777 | 1.2.15       | 3.4.8        | ORPH
                    sdl2_image |  DISTRO  | https://release-monitoring.org/project/004781 | 2.8.4        | 3.4.4        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/004782 | 2.6.3        | 3.2.2        | ORPH
                      sdl2_net |  DISTRO  | https://release-monitoring.org/project/004783 | 2.2.0        | 2.4.0        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/004778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/010262 | 1.0.3        | 2.0.4        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/004787 | 1.10         | 1.12         |     
                         seatd |  DISTRO  | https://release-monitoring.org/project/234932 | 0.9.1        | 0.9.3        | ORPH
                       sedutil |  DISTRO  | https://release-monitoring.org/project/015203 | 1.20.0       | 1.49.13      |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/001717 | 3.9          | 3.10         |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.9          | 3.10         | ORPH
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.14.2       |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/021655 | 4.3.8        | 4.6.7        |     
                       setools |  DISTRO  | https://release-monitoring.org/project/008951 | 4.5.1        | 4.6.0        | ORPH
                        shadow |  DISTRO  | https://release-monitoring.org/project/004802 | 4.18.0       | 4.19.4       |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/021384 | 4.3.7        | 5.0.4        | ORPH
                      shapelib |  DISTRO  | https://release-monitoring.org/project/004804 | 1.6.2        | 1.6.3        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/005524 | 1.12         | 2.4          | ORPH
                   shellinabox |  DISTRO  | https://release-monitoring.org/project/009501 | 2.20         | 2.21         |     
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.1.0        | ORPH
                       siproxd |  DISTRO  | https://release-monitoring.org/project/179540 | 0.8.3        | 0.8.4        |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/005486 | 2.14.3.0     | 2.15.0.0     |     
                        skopeo |  DISTRO  | https://release-monitoring.org/project/009216 | 1.22.0       | 1.22.2       |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/096796 | 4.9.1        | 20201217     | ORPH
                      snagboot |  DISTRO  | https://release-monitoring.org/project/351979 | 2.5          | 2.6.1        |     
                        sngrep |  DISTRO  | https://release-monitoring.org/project/017075 | 1.8.2        | 1.8.3        | ORPH
                  snmpclitools |  DISTRO  | https://release-monitoring.org/project/031640 | 0.6.4        | 0.7.2        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/021318 | 3.6.3        | 3.6.5        |     
                        snooze |  DISTRO  | https://release-monitoring.org/project/376662 | 0.5          | 0.5.1        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/013263 | 3.11.1.0     | 3.12.2.0     |     
                      softhsm2 |  DISTRO  | https://release-monitoring.org/project/004850 | 2.6.1        | 2.7.0        | ORPH
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/010152 | 0.7          | 0.8          |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/005388 | 1.6.4        | 1.6.6        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/004871 | 0.15.2       | 0.16.0       | ORPH
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/014892 | 0.14.4       | 0.14.5       | ORPH
                   spirv-tools |  DISTRO  | https://release-monitoring.org/project/334920 | 1.4.341.0    | 1.4.350.0    | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/011213 | 4.5.5        | 4.16.0       |     
                        sratom |  DISTRO  | https://release-monitoring.org/project/014903 | 0.6.14       | 0.6.22       |     
                         sshfs |  DISTRO  | https://release-monitoring.org/project/011058 | 3.7.3        | 3.7.5        | ORPH
                          sslh |  DISTRO  | https://release-monitoring.org/project/006184 | 2.0.1        | 2.3.1        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/008127 | 1.20.7.1     | 1.23.7       | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/006861 | 6.7.1        | 7.0c         |     
                    stellarium |  DISTRO  | https://release-monitoring.org/project/004891 | 25.4         | 26.1         |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/012538 | 0.21.00      | 0.21.01      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/004899 | 6.0.5        | 6.0.6        |     
                   superiotool |  DISTRO  | https://release-monitoring.org/project/010128 | 24.05        | 26.03        |     
                      supertux |  DISTRO  | https://release-monitoring.org/project/004911 | 0.6.3        | 0.7.0-rev.1  |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/016289 | 4.2.5        | 4.3.0        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/010925 | 8.0.4        | 8.0.5        |     
                        swaybg |  DISTRO  | https://release-monitoring.org/project/020562 | 1.2.1        | 1.2.2        |     
                          swig |  DISTRO  | https://release-monitoring.org/project/004919 | 4.1.1        | 4.4.1        |     
                         swipl |  DISTRO  | https://release-monitoring.org/project/236197 | 9.2.9        | 10.1.5       |     
                      swupdate |  DISTRO  | https://release-monitoring.org/project/015714 | 2025.05      | 2025.12      |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/005718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/016898 | 0.29.3       | 0.41.4       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/021649 | 49.0         | 50.0         |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/034820 | 3.7.11       | 4.5.4        |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/004931 | 12.7.5       | 12.7.9       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/005440 | 258.7        | 260.1        |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/011774 | 233          | 235          | ORPH
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/021648 | 3.14         | 3.18         | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/001982 | 2.2.1        | 2.3          |     
                     tailscale |  DISTRO  | https://release-monitoring.org/project/141585 | 1.78.1       | 1.98.3       |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/009174 | 2.1.58       | 3.0.2        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/008217 | 2021.12.0    | 2023.0.0     |     
                     tcf-agent |  DISTRO  | https://release-monitoring.org/project/021833 | 1.8.0        | 1.11.0       |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/004941 | 8.6.15       | 9.0.3        | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/004942 | 1.2.4        | 1.2.5        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/004943 | 1.21         | 2.0          |     
                      tealdeer |  DISTRO  | https://release-monitoring.org/project/084521 | 1.6.1        | 1.8.1        |     
               tensorflow-lite |  DISTRO  | https://release-monitoring.org/project/016141 | 2.11.0       | 2.21.0       |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/004951 | 1.12.1       | 1.14.0       |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/014500 | 2.5.6        | 2.15.10      |     
                          time |  DISTRO  | https://release-monitoring.org/project/004971 | 1.9          | 1.10         |     
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/017545 | 2.24.0       | 2.27.1       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 4.1.0        | 5.1.2        |     
                     tinyproxy |  DISTRO  | https://release-monitoring.org/project/008699 | 1.11.2       | 1.11.3       | ORPH
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/014678 | 20240101     | 20260401     |     
                       tipidee |  DISTRO  | https://release-monitoring.org/project/373437 | 0.0.5.1      | 0.0.7.2      |     
                            tk |  DISTRO  | https://release-monitoring.org/project/011426 | 8.6.15       | 9.0.3        |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.3.1        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/004980 | 3.6a         | 3.6b         |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/021640 | 1.3.9.1      | 1.3.9.2      |     
                  tpm2-openssl |  DISTRO  | https://release-monitoring.org/project/242488 | 1.2.0        | 1.3.0        |     
                   tpm2-pkcs11 |  DISTRO  | https://release-monitoring.org/project/018777 | 1.9.1        | 1.10.0       |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/018790 | 0.2.1        | 0.3.0        |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/007873 | 3.3.3        | 3.4          |     
                          tree |  DISTRO  | https://release-monitoring.org/project/005006 | 2.2.1        | 2.3.2        |     
                        uclibc |  DISTRO  | https://release-monitoring.org/project/013815 | 1.0.57       | 1.0.58       |     
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.19         | ORPH
                           uhd |  DISTRO  | https://release-monitoring.org/project/012572 | 4.9.0.1      | 4.10.0.0     |     
                         ulogd |  DISTRO  | https://release-monitoring.org/project/005038 | 2.0.8        | 2.0.9        | ORPH
                       unbound |  DISTRO  | https://release-monitoring.org/project/005042 | 1.24.2       | 1.25.1       |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/013306 | 6.2.12       | 7.2.6        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/015848 | 1.9.7        | 1.9.17       | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/005056 | 0.99.19      | 1.91.2       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/013737 | 4.2.1        | 5.1.1        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/016012 | 0.14.0       | 0.15.0       | ORPH
                     ustreamer |  DISTRO  | https://release-monitoring.org/project/314869 | 6.52         | 6.56         |     
                      utf8proc |  DISTRO  | https://release-monitoring.org/project/007455 | 2.10.0       | 2.11.3       | ORPH
                        utfcpp |  DISTRO  | https://release-monitoring.org/project/020545 | 4.0.9        | 4.1.1        |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/008179 | 2.41.4       | 2.42.1       |     
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/008179 | 2.41.4       | 2.42.1       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/005065 | 0.56.18      | 0.56.19      | ORPH
                      valgrind |  DISTRO  | https://release-monitoring.org/project/013639 | 3.26.0       | 3.27.1       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/018452 | 1.0.2        | 1.1.0        | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/005069 | 2.6.5        | 2.8.1        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/005080 | 1.8.0        | 1.8.4        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/005092 | 9.1.2148     | 9.2.0530     |     
                          volk |  DISTRO  | https://release-monitoring.org/project/147733 | 3.2.0        | 3.3.0        |     
                           vte |  DISTRO  | https://release-monitoring.org/project/010895 | 0.66.2       | 0.84.0       | ORPH
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/088835 | 1.4.317      | 1.4.352      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.4.317      | 1.4.352      | ORPH
                    vulkan-sdk |  DISTRO  | https://release-monitoring.org/project/370476 | 1.4.313.0    | 1.4.350.0    | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.4.317      | 1.4.352      | ORPH
                       wavemon |  DISTRO  | https://release-monitoring.org/project/005120 | 0.9.5        | 0.9.7        | ORPH
                       wavpack |  DISTRO  | https://release-monitoring.org/project/005121 | 5.7.0        | 5.9.0        | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/010061 | 1.24.0       | 1.25.0       |     
                 wayland-utils |  DISTRO  | https://release-monitoring.org/project/129361 | 1.2.0        | 1.3.0        | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/005355 | 2.52.3       | 2.53.2       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/015929 | 1.3          | 2.1          | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/013745 | 15.0.0       | 15.0.1       |     
                         which |  DISTRO  | https://release-monitoring.org/project/005127 | 2.23         | 2.25         | ORPH
                          wine |  DISTRO  | https://release-monitoring.org/project/005134 | 11.0         | 11.9         |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.5.10       | 0.5.14       | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/005137 | 4.4.16       | 4.6.6        |     
                       wlroots |  DISTRO  | https://release-monitoring.org/project/018357 | 0.20.0       | 0.20.1       |     
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.10.0       | 4.0.0        |     
                    wpan-tools |  DISTRO  | https://release-monitoring.org/project/021835 | 0.9          | 0.10         | ORPH
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/017557 | 2.50.5       | 2.52.3       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.47.1       | 0.49.1       | ORPH
                        x11vnc |  DISTRO  | https://release-monitoring.org/project/010182 | 0.9.16       | 0.9.17       | ORPH
                        xapian |  DISTRO  | https://release-monitoring.org/project/015919 | 1.4.30       | 2.0.0        |     
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/000191 | 1.1.1        | 1.1.2        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/017160 | 1.0.9        | 1.1.1        | ORPH
                  xapp_fstobdf |  DISTRO  | https://release-monitoring.org/project/017156 | 1.0.7        | 1.0.8        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/015048 | 1.0.10       | 1.0.11       | ORPH
                      xapp_ico |  DISTRO  | https://release-monitoring.org/project/021722 | 1.0.6        | 1.0.7        | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/017161 | 1.0.6        | 1.0.7        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/015047 | 1.1.1        | 20250912     | ORPH
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/015043 | 1.2.3        | 1.2.4        | ORPH
                xapp_setxkbmap |  DISTRO  | https://release-monitoring.org/project/012314 | 1.3.4        | 1.3.5        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/015034 | 1.0.5        | 1.0.6        | ORPH
                    xapp_xcalc |  DISTRO  | https://release-monitoring.org/project/005164 | 1.1.2        | 1.1.3        | ORPH
                 xapp_xconsole |  DISTRO  | https://release-monitoring.org/project/015030 | 1.1.0        | 1.1.1        |     
                      xapp_xev |  DISTRO  | https://release-monitoring.org/project/015026 | 1.2.6        | 1.2.7        | ORPH
                      xapp_xfd |  DISTRO  | https://release-monitoring.org/project/015024 | 1.1.4        | 1.1.5        | ORPH
                    xapp_xkill |  DISTRO  | https://release-monitoring.org/project/014993 | 1.0.6        | 1.0.7        | ORPH
                   xapp_xrandr |  DISTRO  | https://release-monitoring.org/project/014957 | 1.5.3        | 1.5.4        | ORPH
                xdata_xbitmaps |  DISTRO  | https://release-monitoring.org/project/013645 | 1.1.3        | 1.1.4        | ORPH
                       xdotool |  DISTRO  | https://release-monitoring.org/project/008648 | 3.20211022.1 | 4.20260303.1 | ORPH
         xdriver_xf86-video-nv |  DISTRO  | https://release-monitoring.org/project/021711 | 2.1.23       | 2.1.24       | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/005181 | 4.14.6       | 4.21.1       |     
              xfont_font-alias |  DISTRO  | https://release-monitoring.org/project/015059 | 1.0.5        | 1.0.6        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/015055 | 1.4.1        | 1.4.2        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/005188 | 6.19.0       | 7.0.1        | ORPH
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/005191 | 2.38         | 2.47         | ORPH
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/005193 | 1.3.19       | 1.3.20       | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/001764 | 1.8.12       | 1.8.13       | ORPH
            xlib_libXcomposite |  DISTRO  | https://release-monitoring.org/project/001769 | 0.4.6        | 0.4.7        | ORPH
               xlib_libXdamage |  DISTRO  | https://release-monitoring.org/project/001771 | 1.1.6        | 1.1.7        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/001774 | 1.3.6        | 1.3.7        | ORPH
                    xlib_libXi |  DISTRO  | https://release-monitoring.org/project/001778 | 1.8.2        | 1.8.3        | ORPH
              xlib_libXinerama |  DISTRO  | https://release-monitoring.org/project/001779 | 1.1.5        | 1.1.6        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/001785 | 1.2.1        | 1.3.1        | ORPH
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/001788 | 1.5.4        | 1.5.5        | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/001796 | 1.0.14       | 1.0.15       | ORPH
              xlib_libXxf86dga |  DISTRO  | https://release-monitoring.org/project/001797 | 1.1.6        | 1.1.7        | ORPH
               xlib_libXxf86vm |  DISTRO  | https://release-monitoring.org/project/001799 | 1.1.6        | 1.1.7        | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/001613 | 1.1.8        | 1.1.9        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/001781 | 1.1.3        | 1.2.0        | ORPH
                xml-security-c |  DISTRO  | https://release-monitoring.org/project/005197 | 2.0.4        | 3.0.0        | ORPH
                         xmrig |  DISTRO  | https://release-monitoring.org/project/017499 | 6.25.0       | 6.26.0       |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/005269 | 6.14         | 6.15         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/007736 | 3.24         | 3.30         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/005272 | 401          | 410          | ORPH
                      xwayland |  DISTRO  | https://release-monitoring.org/project/180949 | 24.1.10      | 24.1.11      |     
                      yaml-cpp |  DISTRO  | https://release-monitoring.org/project/005284 | 0.8.0        | 0.9.0        | ORPH
                            yq |  DISTRO  | https://release-monitoring.org/project/303696 | 4.49.2       | 4.53.2       |     
                            z3 |  DISTRO  | https://release-monitoring.org/project/007812 | 4.15.2       | 4.16.0       |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/005492 | 7.2.13       | 7.4.10       |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.5.3        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 8.2.0        |     
                        zellij |  DISTRO  | https://release-monitoring.org/project/300087 | 0.44.2       | 0.44.3       |     
                           zfs |  DISTRO  | https://release-monitoring.org/project/011706 | 2.4.1        | 2.4.2        |     
                  zisofs-tools |  DISTRO  | https://release-monitoring.org/project/010520 | 1.1.11       | 1.1.11-5     | ORPH
                        zoxide |  DISTRO  | https://release-monitoring.org/project/098400 | 0.9.8        | 0.9.9        |     
                     zxing-cpp |  DISTRO  | https://release-monitoring.org/project/101246 | 2.3.0        | 3.0.2        |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                  aardvark-dns | CVE-2026-35406   | https://security-tracker.debian.org/tracker/CVE-2026-35406  
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                        assimp | CVE-2025-15538   | https://security-tracker.debian.org/tracker/CVE-2025-15538  
                      asterisk | CVE-2026-23738   | https://security-tracker.debian.org/tracker/CVE-2026-23738  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                         avahi | CVE-2026-34933   | https://security-tracker.debian.org/tracker/CVE-2026-34933  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2026-32883   | https://security-tracker.debian.org/tracker/CVE-2026-32883  
                         botan | CVE-2026-32877   | https://security-tracker.debian.org/tracker/CVE-2026-32877  
                         botan | CVE-2026-32884   | https://security-tracker.debian.org/tracker/CVE-2026-32884  
                         botan | CVE-2026-34582   | https://security-tracker.debian.org/tracker/CVE-2026-34582  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                     capnproto | CVE-2026-32239   | https://security-tracker.debian.org/tracker/CVE-2026-32239  
                     capnproto | CVE-2026-32240   | https://security-tracker.debian.org/tracker/CVE-2026-32240  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2025-54388   | https://security-tracker.debian.org/tracker/CVE-2025-54388  
                 docker-engine | CVE-2026-33997   | https://security-tracker.debian.org/tracker/CVE-2026-33997  
                 docker-engine | CVE-2026-34040   | https://security-tracker.debian.org/tracker/CVE-2026-34040  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-23943   | https://security-tracker.debian.org/tracker/CVE-2026-23943  
                        erlang | CVE-2026-23941   | https://security-tracker.debian.org/tracker/CVE-2026-23941  
                        erlang | CVE-2026-23942   | https://security-tracker.debian.org/tracker/CVE-2026-23942  
                        erlang | CVE-2026-28808   | https://security-tracker.debian.org/tracker/CVE-2026-28808  
                        erlang | CVE-2026-28810   | https://security-tracker.debian.org/tracker/CVE-2026-28810  
                        erlang | CVE-2026-32147   | https://security-tracker.debian.org/tracker/CVE-2026-32147  
                         exiv2 | CVE-2026-27631   | https://security-tracker.debian.org/tracker/CVE-2026-27631  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                     firewalld | CVE-2026-4948    | https://security-tracker.debian.org/tracker/CVE-2026-4948   
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                           frr | CVE-2026-37458   | https://security-tracker.debian.org/tracker/CVE-2026-37458  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                         glibc | CVE-2026-5435    | https://security-tracker.debian.org/tracker/CVE-2026-5435   
                         glibc | CVE-2026-6238    | https://security-tracker.debian.org/tracker/CVE-2026-6238   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                       libssh2 | CVE-2026-7598    | https://security-tracker.debian.org/tracker/CVE-2026-7598   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     llama-cpp | CVE-2026-27940   | https://security-tracker.debian.org/tracker/CVE-2026-27940  
                     llama-cpp | CVE-2026-34159   | https://security-tracker.debian.org/tracker/CVE-2026-34159  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-3494    | https://security-tracker.debian.org/tracker/CVE-2026-3494   
                       mbedtls | CVE-2025-66442   | https://security-tracker.debian.org/tracker/CVE-2025-66442  
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                      opendoas | CVE-2023-28339   | https://security-tracker.debian.org/tracker/CVE-2023-28339  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2026-33414   | https://security-tracker.debian.org/tracker/CVE-2026-33414  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42309   | https://security-tracker.debian.org/tracker/CVE-2026-42309  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-twisted | CVE-2026-42304   | https://security-tracker.debian.org/tracker/CVE-2026-42304  
                python-urllib3 | CVE-2026-44432   | https://security-tracker.debian.org/tracker/CVE-2026-44432  
                python-urllib3 | CVE-2026-44431   | https://security-tracker.debian.org/tracker/CVE-2026-44431  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                          runc | CVE-2025-31133   | https://security-tracker.debian.org/tracker/CVE-2025-31133  
                          runc | CVE-2025-52881   | https://security-tracker.debian.org/tracker/CVE-2025-52881  
                          runc | CVE-2025-52565   | https://security-tracker.debian.org/tracker/CVE-2025-52565  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                   timescaledb | CVE-2026-29089   | https://security-tracker.debian.org/tracker/CVE-2026-29089  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                       unbound | CVE-2026-41292   | https://security-tracker.debian.org/tracker/CVE-2026-41292  
                       unbound | CVE-2026-42534   | https://security-tracker.debian.org/tracker/CVE-2026-42534  
                       unbound | CVE-2026-33278   | https://security-tracker.debian.org/tracker/CVE-2026-33278  
                       unbound | CVE-2026-32792   | https://security-tracker.debian.org/tracker/CVE-2026-32792  
                       unbound | CVE-2026-44390   | https://security-tracker.debian.org/tracker/CVE-2026-44390  
                       unbound | CVE-2026-44608   | https://security-tracker.debian.org/tracker/CVE-2026-44608  
                       unbound | CVE-2026-42923   | https://security-tracker.debian.org/tracker/CVE-2026-42923  
                       unbound | CVE-2026-42960   | https://security-tracker.debian.org/tracker/CVE-2026-42960  
                       unbound | CVE-2026-42944   | https://security-tracker.debian.org/tracker/CVE-2026-42944  
                       unbound | CVE-2026-42959   | https://security-tracker.debian.org/tracker/CVE-2026-42959  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                           vim | CVE-2026-46483   | https://security-tracker.debian.org/tracker/CVE-2026-46483  
                           vim | CVE-2026-28419   | https://security-tracker.debian.org/tracker/CVE-2026-28419  
                           vim | CVE-2026-28422   | https://security-tracker.debian.org/tracker/CVE-2026-28422  
                           vim | CVE-2026-28418   | https://security-tracker.debian.org/tracker/CVE-2026-28418  
                           vim | CVE-2026-28421   | https://security-tracker.debian.org/tracker/CVE-2026-28421  
                           vim | CVE-2026-28420   | https://security-tracker.debian.org/tracker/CVE-2026-28420  
                           vim | CVE-2026-28417   | https://security-tracker.debian.org/tracker/CVE-2026-28417  
                           vim | CVE-2026-45130   | https://security-tracker.debian.org/tracker/CVE-2026-45130  
                           vim | CVE-2026-39881   | https://security-tracker.debian.org/tracker/CVE-2026-39881  
                           vim | CVE-2026-41411   | https://security-tracker.debian.org/tracker/CVE-2026-41411  
                           vim | CVE-2026-35177   | https://security-tracker.debian.org/tracker/CVE-2026-35177  
                           vim | CVE-2026-33412   | https://security-tracker.debian.org/tracker/CVE-2026-33412  
                           vim | CVE-2026-44656   | https://security-tracker.debian.org/tracker/CVE-2026-44656  
                           vim | CVE-2026-34982   | https://security-tracker.debian.org/tracker/CVE-2026-34982  
                           vim | CVE-2026-42307   | https://security-tracker.debian.org/tracker/CVE-2026-42307  
                           vim | CVE-2026-34714   | https://security-tracker.debian.org/tracker/CVE-2026-34714  
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-31142   | https://security-tracker.debian.org/tracker/CVE-2024-31142  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-27466   | https://security-tracker.debian.org/tracker/CVE-2025-27466  
                           xen | CVE-2025-58143   | https://security-tracker.debian.org/tracker/CVE-2025-58143  
                           xen | CVE-2025-58145   | https://security-tracker.debian.org/tracker/CVE-2025-58145  
                           xen | CVE-2025-58142   | https://security-tracker.debian.org/tracker/CVE-2025-58142  
                           xen | CVE-2025-58144   | https://security-tracker.debian.org/tracker/CVE-2025-58144  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  

CVEs for the '2026.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                  aardvark-dns | CVE-2026-35406   | https://security-tracker.debian.org/tracker/CVE-2026-35406  
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                        assimp | CVE-2025-15538   | https://security-tracker.debian.org/tracker/CVE-2025-15538  
                      asterisk | CVE-2026-23738   | https://security-tracker.debian.org/tracker/CVE-2026-23738  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                         avahi | CVE-2026-34933   | https://security-tracker.debian.org/tracker/CVE-2026-34933  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                          bind | CVE-2026-3592    | https://security-tracker.debian.org/tracker/CVE-2026-3592   
                          bind | CVE-2026-5946    | https://security-tracker.debian.org/tracker/CVE-2026-5946   
                          bind | CVE-2026-5950    | https://security-tracker.debian.org/tracker/CVE-2026-5950   
                          bind | CVE-2026-3039    | https://security-tracker.debian.org/tracker/CVE-2026-3039   
                      binutils | CVE-2025-8225    | https://security-tracker.debian.org/tracker/CVE-2025-8225   
                      binutils | CVE-2025-8224    | https://security-tracker.debian.org/tracker/CVE-2025-8224   
                      binutils | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
                      binutils | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
                      binutils | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
                      binutils | CVE-2025-69646   | https://security-tracker.debian.org/tracker/CVE-2025-69646  
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69645   | https://security-tracker.debian.org/tracker/CVE-2025-69645  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2026-32883   | https://security-tracker.debian.org/tracker/CVE-2026-32883  
                         botan | CVE-2026-32877   | https://security-tracker.debian.org/tracker/CVE-2026-32877  
                         botan | CVE-2026-32884   | https://security-tracker.debian.org/tracker/CVE-2026-32884  
                         botan | CVE-2026-34582   | https://security-tracker.debian.org/tracker/CVE-2026-34582  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                     capnproto | CVE-2026-32239   | https://security-tracker.debian.org/tracker/CVE-2026-32239  
                     capnproto | CVE-2026-32240   | https://security-tracker.debian.org/tracker/CVE-2026-32240  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2025-54388   | https://security-tracker.debian.org/tracker/CVE-2025-54388  
                 docker-engine | CVE-2026-33997   | https://security-tracker.debian.org/tracker/CVE-2026-33997  
                 docker-engine | CVE-2026-34040   | https://security-tracker.debian.org/tracker/CVE-2026-34040  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-23943   | https://security-tracker.debian.org/tracker/CVE-2026-23943  
                        erlang | CVE-2026-23941   | https://security-tracker.debian.org/tracker/CVE-2026-23941  
                        erlang | CVE-2026-23942   | https://security-tracker.debian.org/tracker/CVE-2026-23942  
                        erlang | CVE-2026-28808   | https://security-tracker.debian.org/tracker/CVE-2026-28808  
                        erlang | CVE-2026-28810   | https://security-tracker.debian.org/tracker/CVE-2026-28810  
                        erlang | CVE-2026-32147   | https://security-tracker.debian.org/tracker/CVE-2026-32147  
                         exiv2 | CVE-2026-27631   | https://security-tracker.debian.org/tracker/CVE-2026-27631  
                         expat | CVE-2026-45186   | https://security-tracker.debian.org/tracker/CVE-2026-45186  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                     firewalld | CVE-2026-4948    | https://security-tracker.debian.org/tracker/CVE-2026-4948   
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                           frr | CVE-2026-28532   | https://security-tracker.debian.org/tracker/CVE-2026-28532  
                           frr | CVE-2026-37458   | https://security-tracker.debian.org/tracker/CVE-2026-37458  
                           frr | CVE-2026-5107    | https://security-tracker.debian.org/tracker/CVE-2026-5107   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                         glibc | CVE-2026-5435    | https://security-tracker.debian.org/tracker/CVE-2026-5435   
                         glibc | CVE-2026-5450    | https://security-tracker.debian.org/tracker/CVE-2026-5450   
                         glibc | CVE-2026-6238    | https://security-tracker.debian.org/tracker/CVE-2026-6238   
                         glibc | CVE-2026-4437    | https://security-tracker.debian.org/tracker/CVE-2026-4437   
                         glibc | CVE-2026-4438    | https://security-tracker.debian.org/tracker/CVE-2026-4438   
                         glibc | CVE-2026-4046    | https://security-tracker.debian.org/tracker/CVE-2026-4046   
                         glibc | CVE-2026-5928    | https://security-tracker.debian.org/tracker/CVE-2026-5928   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                          grpc | CVE-2026-33186   | https://security-tracker.debian.org/tracker/CVE-2026-33186  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-42050   | https://security-tracker.debian.org/tracker/CVE-2026-42050  
                         janet | CVE-2026-2240    | https://security-tracker.debian.org/tracker/CVE-2026-2240   
                         janet | CVE-2026-2242    | https://security-tracker.debian.org/tracker/CVE-2026-2242   
                         janet | CVE-2026-2241    | https://security-tracker.debian.org/tracker/CVE-2026-2241   
                         janet | CVE-2026-2869    | https://security-tracker.debian.org/tracker/CVE-2026-2869   
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                      libfuse3 | CVE-2026-33150   | https://security-tracker.debian.org/tracker/CVE-2026-33150  
                      libfuse3 | CVE-2026-33179   | https://security-tracker.debian.org/tracker/CVE-2026-33179  
                     libgcrypt | CVE-2026-41989   | https://security-tracker.debian.org/tracker/CVE-2026-41989  
                     libgcrypt | CVE-2026-41990   | https://security-tracker.debian.org/tracker/CVE-2026-41990  
                       libheif | CVE-2026-32738   | https://security-tracker.debian.org/tracker/CVE-2026-32738  
                       libheif | CVE-2026-32740   | https://security-tracker.debian.org/tracker/CVE-2026-32740  
                       libheif | CVE-2026-32739   | https://security-tracker.debian.org/tracker/CVE-2026-32739  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                       libssh2 | CVE-2026-7598    | https://security-tracker.debian.org/tracker/CVE-2026-7598   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                  liburiparser | CVE-2026-44927   | https://security-tracker.debian.org/tracker/CVE-2026-44927  
                  liburiparser | CVE-2026-44928   | https://security-tracker.debian.org/tracker/CVE-2026-44928  
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     llama-cpp | CVE-2026-27940   | https://security-tracker.debian.org/tracker/CVE-2026-27940  
                     llama-cpp | CVE-2026-33298   | https://security-tracker.debian.org/tracker/CVE-2026-33298  
                     llama-cpp | CVE-2026-34159   | https://security-tracker.debian.org/tracker/CVE-2026-34159  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-3494    | https://security-tracker.debian.org/tracker/CVE-2026-3494   
                       mbedtls | CVE-2025-66442   | https://security-tracker.debian.org/tracker/CVE-2025-66442  
                     memcached | CVE-2026-47784   | https://security-tracker.debian.org/tracker/CVE-2026-47784  
                     memcached | CVE-2026-47783   | https://security-tracker.debian.org/tracker/CVE-2026-47783  
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nano | CVE-2026-6843    | https://security-tracker.debian.org/tracker/CVE-2026-6843   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2026-35387   | https://security-tracker.debian.org/tracker/CVE-2026-35387  
                       openssh | CVE-2026-35386   | https://security-tracker.debian.org/tracker/CVE-2026-35386  
                       openssh | CVE-2026-35388   | https://security-tracker.debian.org/tracker/CVE-2026-35388  
                       openssh | CVE-2026-35385   | https://security-tracker.debian.org/tracker/CVE-2026-35385  
                       openssh | CVE-2026-35414   | https://security-tracker.debian.org/tracker/CVE-2026-35414  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2026-33414   | https://security-tracker.debian.org/tracker/CVE-2026-33414  
                    postgresql | CVE-2026-6575    | https://security-tracker.debian.org/tracker/CVE-2026-6575   
                    postgresql | CVE-2026-6475    | https://security-tracker.debian.org/tracker/CVE-2026-6475   
                    postgresql | CVE-2026-6479    | https://security-tracker.debian.org/tracker/CVE-2026-6479   
                    postgresql | CVE-2026-6473    | https://security-tracker.debian.org/tracker/CVE-2026-6473   
                    postgresql | CVE-2026-6476    | https://security-tracker.debian.org/tracker/CVE-2026-6476   
                    postgresql | CVE-2026-6477    | https://security-tracker.debian.org/tracker/CVE-2026-6477   
                    postgresql | CVE-2026-6478    | https://security-tracker.debian.org/tracker/CVE-2026-6478   
                    postgresql | CVE-2026-6474    | https://security-tracker.debian.org/tracker/CVE-2026-6474   
                    postgresql | CVE-2026-6472    | https://security-tracker.debian.org/tracker/CVE-2026-6472   
                    postgresql | CVE-2026-6637    | https://security-tracker.debian.org/tracker/CVE-2026-6637   
                    postgresql | CVE-2026-6638    | https://security-tracker.debian.org/tracker/CVE-2026-6638   
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                         putty | CVE-2026-4115    | https://security-tracker.debian.org/tracker/CVE-2026-4115   
                python-aiohttp | CVE-2026-22815   | https://security-tracker.debian.org/tracker/CVE-2026-22815  
                python-aiohttp | CVE-2026-34516   | https://security-tracker.debian.org/tracker/CVE-2026-34516  
                python-aiohttp | CVE-2026-34514   | https://security-tracker.debian.org/tracker/CVE-2026-34514  
                python-aiohttp | CVE-2026-34519   | https://security-tracker.debian.org/tracker/CVE-2026-34519  
                python-aiohttp | CVE-2026-34520   | https://security-tracker.debian.org/tracker/CVE-2026-34520  
                python-aiohttp | CVE-2026-34513   | https://security-tracker.debian.org/tracker/CVE-2026-34513  
                python-aiohttp | CVE-2026-34517   | https://security-tracker.debian.org/tracker/CVE-2026-34517  
                python-aiohttp | CVE-2026-34525   | https://security-tracker.debian.org/tracker/CVE-2026-34525  
                python-aiohttp | CVE-2026-34518   | https://security-tracker.debian.org/tracker/CVE-2026-34518  
                python-aiohttp | CVE-2026-34515   | https://security-tracker.debian.org/tracker/CVE-2026-34515  
           python-cryptography | CVE-2026-26007   | https://security-tracker.debian.org/tracker/CVE-2026-26007  
           python-cryptography | CVE-2026-39892   | https://security-tracker.debian.org/tracker/CVE-2026-39892  
           python-cryptography | CVE-2026-34073   | https://security-tracker.debian.org/tracker/CVE-2026-34073  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
                   python-mako | CVE-2026-41205   | https://security-tracker.debian.org/tracker/CVE-2026-41205  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42309   | https://security-tracker.debian.org/tracker/CVE-2026-42309  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-twisted | CVE-2026-42304   | https://security-tracker.debian.org/tracker/CVE-2026-42304  
                python-urllib3 | CVE-2026-44432   | https://security-tracker.debian.org/tracker/CVE-2026-44432  
                python-urllib3 | CVE-2026-44431   | https://security-tracker.debian.org/tracker/CVE-2026-44431  
               python-werkzeug | CVE-2026-21860   | https://security-tracker.debian.org/tracker/CVE-2026-21860  
               python-werkzeug | CVE-2026-27199   | https://security-tracker.debian.org/tracker/CVE-2026-27199  
                       python3 | CVE-2026-3087    | https://security-tracker.debian.org/tracker/CVE-2026-3087   
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                         rsync | CVE-2026-29518   | https://security-tracker.debian.org/tracker/CVE-2026-29518  
                         rsync | CVE-2026-45232   | https://security-tracker.debian.org/tracker/CVE-2026-45232  
                         rsync | CVE-2026-43619   | https://security-tracker.debian.org/tracker/CVE-2026-43619  
                         rsync | CVE-2026-43617   | https://security-tracker.debian.org/tracker/CVE-2026-43617  
                         rsync | CVE-2026-43618   | https://security-tracker.debian.org/tracker/CVE-2026-43618  
                         rsync | CVE-2026-43620   | https://security-tracker.debian.org/tracker/CVE-2026-43620  
                          runc | CVE-2025-31133   | https://security-tracker.debian.org/tracker/CVE-2025-31133  
                          runc | CVE-2025-52881   | https://security-tracker.debian.org/tracker/CVE-2025-52881  
                          runc | CVE-2025-52565   | https://security-tracker.debian.org/tracker/CVE-2025-52565  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-53538   | https://security-tracker.debian.org/tracker/CVE-2025-53538  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                      suricata | CVE-2025-64344   | https://security-tracker.debian.org/tracker/CVE-2025-64344  
                      suricata | CVE-2025-64332   | https://security-tracker.debian.org/tracker/CVE-2025-64332  
                      suricata | CVE-2025-64333   | https://security-tracker.debian.org/tracker/CVE-2025-64333  
                      suricata | CVE-2025-64330   | https://security-tracker.debian.org/tracker/CVE-2025-64330  
                      suricata | CVE-2025-64331   | https://security-tracker.debian.org/tracker/CVE-2025-64331  
                      suricata | CVE-2025-59147   | https://security-tracker.debian.org/tracker/CVE-2025-59147  
                      suricata | CVE-2026-22264   | https://security-tracker.debian.org/tracker/CVE-2026-22264  
                      suricata | CVE-2026-22259   | https://security-tracker.debian.org/tracker/CVE-2026-22259  
                      suricata | CVE-2026-22262   | https://security-tracker.debian.org/tracker/CVE-2026-22262  
                      suricata | CVE-2026-22258   | https://security-tracker.debian.org/tracker/CVE-2026-22258  
                      suricata | CVE-2026-22261   | https://security-tracker.debian.org/tracker/CVE-2026-22261  
                      suricata | CVE-2026-31932   | https://security-tracker.debian.org/tracker/CVE-2026-31932  
                      suricata | CVE-2026-31935   | https://security-tracker.debian.org/tracker/CVE-2026-31935  
                      suricata | CVE-2026-31937   | https://security-tracker.debian.org/tracker/CVE-2026-31937  
                      suricata | CVE-2026-31933   | https://security-tracker.debian.org/tracker/CVE-2026-31933  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                   timescaledb | CVE-2026-29089   | https://security-tracker.debian.org/tracker/CVE-2026-29089  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2024-42040   | https://security-tracker.debian.org/tracker/CVE-2024-42040  
                   uboot-tools | CVE-2026-33243   | https://security-tracker.debian.org/tracker/CVE-2026-33243  
                       unbound | CVE-2026-41292   | https://security-tracker.debian.org/tracker/CVE-2026-41292  
                       unbound | CVE-2026-42534   | https://security-tracker.debian.org/tracker/CVE-2026-42534  
                       unbound | CVE-2026-33278   | https://security-tracker.debian.org/tracker/CVE-2026-33278  
                       unbound | CVE-2026-32792   | https://security-tracker.debian.org/tracker/CVE-2026-32792  
                       unbound | CVE-2026-44390   | https://security-tracker.debian.org/tracker/CVE-2026-44390  
                       unbound | CVE-2026-44608   | https://security-tracker.debian.org/tracker/CVE-2026-44608  
                       unbound | CVE-2026-42923   | https://security-tracker.debian.org/tracker/CVE-2026-42923  
                       unbound | CVE-2026-42960   | https://security-tracker.debian.org/tracker/CVE-2026-42960  
                       unbound | CVE-2026-42944   | https://security-tracker.debian.org/tracker/CVE-2026-42944  
                       unbound | CVE-2026-42959   | https://security-tracker.debian.org/tracker/CVE-2026-42959  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                           vim | CVE-2026-46483   | https://security-tracker.debian.org/tracker/CVE-2026-46483  
                           vim | CVE-2026-28419   | https://security-tracker.debian.org/tracker/CVE-2026-28419  
                           vim | CVE-2026-28422   | https://security-tracker.debian.org/tracker/CVE-2026-28422  
                           vim | CVE-2026-28418   | https://security-tracker.debian.org/tracker/CVE-2026-28418  
                           vim | CVE-2026-28421   | https://security-tracker.debian.org/tracker/CVE-2026-28421  
                           vim | CVE-2026-28420   | https://security-tracker.debian.org/tracker/CVE-2026-28420  
                           vim | CVE-2026-28417   | https://security-tracker.debian.org/tracker/CVE-2026-28417  
                           vim | CVE-2026-45130   | https://security-tracker.debian.org/tracker/CVE-2026-45130  
                           vim | CVE-2026-39881   | https://security-tracker.debian.org/tracker/CVE-2026-39881  
                           vim | CVE-2026-41411   | https://security-tracker.debian.org/tracker/CVE-2026-41411  
                           vim | CVE-2026-35177   | https://security-tracker.debian.org/tracker/CVE-2026-35177  
                           vim | CVE-2026-33412   | https://security-tracker.debian.org/tracker/CVE-2026-33412  
                           vim | CVE-2026-44656   | https://security-tracker.debian.org/tracker/CVE-2026-44656  
                           vim | CVE-2026-34982   | https://security-tracker.debian.org/tracker/CVE-2026-34982  
                           vim | CVE-2026-42307   | https://security-tracker.debian.org/tracker/CVE-2026-42307  
                           vim | CVE-2026-34714   | https://security-tracker.debian.org/tracker/CVE-2026-34714  
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-31142   | https://security-tracker.debian.org/tracker/CVE-2024-31142  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-27466   | https://security-tracker.debian.org/tracker/CVE-2025-27466  
                           xen | CVE-2025-58143   | https://security-tracker.debian.org/tracker/CVE-2025-58143  
                           xen | CVE-2025-58145   | https://security-tracker.debian.org/tracker/CVE-2025-58145  
                           xen | CVE-2025-58142   | https://security-tracker.debian.org/tracker/CVE-2025-58142  
                           xen | CVE-2025-58144   | https://security-tracker.debian.org/tracker/CVE-2025-58144  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  

CVEs for the '2025.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                        assimp | CVE-2025-15538   | https://security-tracker.debian.org/tracker/CVE-2025-15538  
                      asterisk | CVE-2026-23738   | https://security-tracker.debian.org/tracker/CVE-2026-23738  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                         avahi | CVE-2026-34933   | https://security-tracker.debian.org/tracker/CVE-2026-34933  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                          bind | CVE-2026-3592    | https://security-tracker.debian.org/tracker/CVE-2026-3592   
                          bind | CVE-2026-5946    | https://security-tracker.debian.org/tracker/CVE-2026-5946   
                          bind | CVE-2026-5950    | https://security-tracker.debian.org/tracker/CVE-2026-5950   
                          bind | CVE-2026-3039    | https://security-tracker.debian.org/tracker/CVE-2026-3039   
                      binutils | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
                      binutils | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
           binutils-bare-metal | CVE-2025-8225    | https://security-tracker.debian.org/tracker/CVE-2025-8225   
           binutils-bare-metal | CVE-2025-8224    | https://security-tracker.debian.org/tracker/CVE-2025-8224   
           binutils-bare-metal | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
           binutils-bare-metal | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
           binutils-bare-metal | CVE-2025-69646   | https://security-tracker.debian.org/tracker/CVE-2025-69646  
           binutils-bare-metal | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
           binutils-bare-metal | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
           binutils-bare-metal | CVE-2025-69645   | https://security-tracker.debian.org/tracker/CVE-2025-69645  
           binutils-bare-metal | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
           binutils-bare-metal | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
           binutils-bare-metal | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
           binutils-bare-metal | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
           binutils-bare-metal | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
           binutils-bare-metal | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2025-54605   | https://security-tracker.debian.org/tracker/CVE-2025-54605  
                       bitcoin | CVE-2025-54604   | https://security-tracker.debian.org/tracker/CVE-2025-54604  
                         botan | CVE-2026-32883   | https://security-tracker.debian.org/tracker/CVE-2026-32883  
                         botan | CVE-2026-32877   | https://security-tracker.debian.org/tracker/CVE-2026-32877  
                         botan | CVE-2026-32884   | https://security-tracker.debian.org/tracker/CVE-2026-32884  
                         botan | CVE-2026-34582   | https://security-tracker.debian.org/tracker/CVE-2026-34582  
                      bpftrace | CVE-2024-2313    | https://security-tracker.debian.org/tracker/CVE-2024-2313   
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                     capnproto | CVE-2026-32239   | https://security-tracker.debian.org/tracker/CVE-2026-32239  
                     capnproto | CVE-2026-32240   | https://security-tracker.debian.org/tracker/CVE-2026-32240  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2026-33997   | https://security-tracker.debian.org/tracker/CVE-2026-33997  
                 docker-engine | CVE-2026-34040   | https://security-tracker.debian.org/tracker/CVE-2026-34040  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-23943   | https://security-tracker.debian.org/tracker/CVE-2026-23943  
                        erlang | CVE-2026-23941   | https://security-tracker.debian.org/tracker/CVE-2026-23941  
                        erlang | CVE-2026-23942   | https://security-tracker.debian.org/tracker/CVE-2026-23942  
                        erlang | CVE-2026-28808   | https://security-tracker.debian.org/tracker/CVE-2026-28808  
                        erlang | CVE-2026-28810   | https://security-tracker.debian.org/tracker/CVE-2026-28810  
                        erlang | CVE-2026-32147   | https://security-tracker.debian.org/tracker/CVE-2026-32147  
                         exiv2 | CVE-2026-27631   | https://security-tracker.debian.org/tracker/CVE-2026-27631  
                         expat | CVE-2026-45186   | https://security-tracker.debian.org/tracker/CVE-2026-45186  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                     firewalld | CVE-2026-4948    | https://security-tracker.debian.org/tracker/CVE-2026-4948   
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                         forge | CVE-2025-66030   | https://security-tracker.debian.org/tracker/CVE-2025-66030  
                         forge | CVE-2025-66031   | https://security-tracker.debian.org/tracker/CVE-2025-66031  
                         forge | CVE-2025-12816   | https://security-tracker.debian.org/tracker/CVE-2025-12816  
                         forge | CVE-2026-33891   | https://security-tracker.debian.org/tracker/CVE-2026-33891  
                         forge | CVE-2026-33896   | https://security-tracker.debian.org/tracker/CVE-2026-33896  
                         forge | CVE-2026-33895   | https://security-tracker.debian.org/tracker/CVE-2026-33895  
                         forge | CVE-2026-33894   | https://security-tracker.debian.org/tracker/CVE-2026-33894  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                           frr | CVE-2025-61101   | https://security-tracker.debian.org/tracker/CVE-2025-61101  
                           frr | CVE-2025-61107   | https://security-tracker.debian.org/tracker/CVE-2025-61107  
                           frr | CVE-2025-61105   | https://security-tracker.debian.org/tracker/CVE-2025-61105  
                           frr | CVE-2025-61106   | https://security-tracker.debian.org/tracker/CVE-2025-61106  
                           frr | CVE-2025-61103   | https://security-tracker.debian.org/tracker/CVE-2025-61103  
                           frr | CVE-2025-61104   | https://security-tracker.debian.org/tracker/CVE-2025-61104  
                           frr | CVE-2025-61100   | https://security-tracker.debian.org/tracker/CVE-2025-61100  
                           frr | CVE-2025-61102   | https://security-tracker.debian.org/tracker/CVE-2025-61102  
                           frr | CVE-2025-61099   | https://security-tracker.debian.org/tracker/CVE-2025-61099  
                           frr | CVE-2026-28532   | https://security-tracker.debian.org/tracker/CVE-2026-28532  
                           frr | CVE-2026-37458   | https://security-tracker.debian.org/tracker/CVE-2026-37458  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                        giflib | CVE-2024-45993   | https://security-tracker.debian.org/tracker/CVE-2024-45993  
                        giflib | CVE-2026-26740   | https://security-tracker.debian.org/tracker/CVE-2026-26740  
                         glibc | CVE-2026-5435    | https://security-tracker.debian.org/tracker/CVE-2026-5435   
                         glibc | CVE-2026-5450    | https://security-tracker.debian.org/tracker/CVE-2026-5450   
                         glibc | CVE-2026-6238    | https://security-tracker.debian.org/tracker/CVE-2026-6238   
                         glibc | CVE-2026-4437    | https://security-tracker.debian.org/tracker/CVE-2026-4437   
                         glibc | CVE-2026-4438    | https://security-tracker.debian.org/tracker/CVE-2026-4438   
                         glibc | CVE-2026-4046    | https://security-tracker.debian.org/tracker/CVE-2026-4046   
                         glibc | CVE-2026-5928    | https://security-tracker.debian.org/tracker/CVE-2026-5928   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                        go-bin | CVE-2025-61727   | https://security-tracker.debian.org/tracker/CVE-2025-61727  
                        go-bin | CVE-2025-61729   | https://security-tracker.debian.org/tracker/CVE-2025-61729  
                        go-bin | CVE-2025-61732   | https://security-tracker.debian.org/tracker/CVE-2025-61732  
                        go-bin | CVE-2025-61726   | https://security-tracker.debian.org/tracker/CVE-2025-61726  
                        go-bin | CVE-2025-61724   | https://security-tracker.debian.org/tracker/CVE-2025-61724  
                        go-bin | CVE-2025-61731   | https://security-tracker.debian.org/tracker/CVE-2025-61731  
                        go-bin | CVE-2025-61730   | https://security-tracker.debian.org/tracker/CVE-2025-61730  
                        go-bin | CVE-2025-61728   | https://security-tracker.debian.org/tracker/CVE-2025-61728  
                        go-bin | CVE-2025-61723   | https://security-tracker.debian.org/tracker/CVE-2025-61723  
                        go-bin | CVE-2025-58188   | https://security-tracker.debian.org/tracker/CVE-2025-58188  
                        go-bin | CVE-2025-58187   | https://security-tracker.debian.org/tracker/CVE-2025-58187  
                        go-bin | CVE-2025-58189   | https://security-tracker.debian.org/tracker/CVE-2025-58189  
                        go-bin | CVE-2025-58185   | https://security-tracker.debian.org/tracker/CVE-2025-58185  
                        go-bin | CVE-2025-47912   | https://security-tracker.debian.org/tracker/CVE-2025-47912  
                        go-bin | CVE-2025-68119   | https://security-tracker.debian.org/tracker/CVE-2025-68119  
                        go-bin | CVE-2025-68121   | https://security-tracker.debian.org/tracker/CVE-2025-68121  
                        go-bin | CVE-2026-42499   | https://security-tracker.debian.org/tracker/CVE-2026-42499  
                        go-bin | CVE-2026-33811   | https://security-tracker.debian.org/tracker/CVE-2026-33811  
                        go-bin | CVE-2026-33814   | https://security-tracker.debian.org/tracker/CVE-2026-33814  
                        go-bin | CVE-2026-42501   | https://security-tracker.debian.org/tracker/CVE-2026-42501  
                        go-bin | CVE-2026-39817   | https://security-tracker.debian.org/tracker/CVE-2026-39817  
                        go-bin | CVE-2026-39836   | https://security-tracker.debian.org/tracker/CVE-2026-39836  
                        go-bin | CVE-2026-39819   | https://security-tracker.debian.org/tracker/CVE-2026-39819  
                        go-bin | CVE-2026-39823   | https://security-tracker.debian.org/tracker/CVE-2026-39823  
                        go-bin | CVE-2026-39820   | https://security-tracker.debian.org/tracker/CVE-2026-39820  
                        go-bin | CVE-2026-39825   | https://security-tracker.debian.org/tracker/CVE-2026-39825  
                        go-bin | CVE-2026-39826   | https://security-tracker.debian.org/tracker/CVE-2026-39826  
                        go-bin | CVE-2026-27140   | https://security-tracker.debian.org/tracker/CVE-2026-27140  
                        go-bin | CVE-2026-27139   | https://security-tracker.debian.org/tracker/CVE-2026-27139  
                        go-bin | CVE-2026-27144   | https://security-tracker.debian.org/tracker/CVE-2026-27144  
                        go-bin | CVE-2026-27142   | https://security-tracker.debian.org/tracker/CVE-2026-27142  
                        go-bin | CVE-2026-27143   | https://security-tracker.debian.org/tracker/CVE-2026-27143  
                        go-bin | CVE-2026-25679   | https://security-tracker.debian.org/tracker/CVE-2026-25679  
                        go-bin | CVE-2026-32280   | https://security-tracker.debian.org/tracker/CVE-2026-32280  
                        go-bin | CVE-2026-32283   | https://security-tracker.debian.org/tracker/CVE-2026-32283  
                        go-bin | CVE-2026-32282   | https://security-tracker.debian.org/tracker/CVE-2026-32282  
                        go-bin | CVE-2026-32289   | https://security-tracker.debian.org/tracker/CVE-2026-32289  
                        go-bin | CVE-2026-32288   | https://security-tracker.debian.org/tracker/CVE-2026-32288  
                        go-bin | CVE-2026-32281   | https://security-tracker.debian.org/tracker/CVE-2026-32281  
                        go-src | CVE-2025-61727   | https://security-tracker.debian.org/tracker/CVE-2025-61727  
                        go-src | CVE-2025-61729   | https://security-tracker.debian.org/tracker/CVE-2025-61729  
                        go-src | CVE-2025-61732   | https://security-tracker.debian.org/tracker/CVE-2025-61732  
                        go-src | CVE-2025-61726   | https://security-tracker.debian.org/tracker/CVE-2025-61726  
                        go-src | CVE-2025-61724   | https://security-tracker.debian.org/tracker/CVE-2025-61724  
                        go-src | CVE-2025-61731   | https://security-tracker.debian.org/tracker/CVE-2025-61731  
                        go-src | CVE-2025-61730   | https://security-tracker.debian.org/tracker/CVE-2025-61730  
                        go-src | CVE-2025-61728   | https://security-tracker.debian.org/tracker/CVE-2025-61728  
                        go-src | CVE-2025-61723   | https://security-tracker.debian.org/tracker/CVE-2025-61723  
                        go-src | CVE-2025-58188   | https://security-tracker.debian.org/tracker/CVE-2025-58188  
                        go-src | CVE-2025-58187   | https://security-tracker.debian.org/tracker/CVE-2025-58187  
                        go-src | CVE-2025-58189   | https://security-tracker.debian.org/tracker/CVE-2025-58189  
                        go-src | CVE-2025-58185   | https://security-tracker.debian.org/tracker/CVE-2025-58185  
                        go-src | CVE-2025-47912   | https://security-tracker.debian.org/tracker/CVE-2025-47912  
                        go-src | CVE-2025-68119   | https://security-tracker.debian.org/tracker/CVE-2025-68119  
                        go-src | CVE-2025-68121   | https://security-tracker.debian.org/tracker/CVE-2025-68121  
                        go-src | CVE-2026-42499   | https://security-tracker.debian.org/tracker/CVE-2026-42499  
                        go-src | CVE-2026-33811   | https://security-tracker.debian.org/tracker/CVE-2026-33811  
                        go-src | CVE-2026-33814   | https://security-tracker.debian.org/tracker/CVE-2026-33814  
                        go-src | CVE-2026-42501   | https://security-tracker.debian.org/tracker/CVE-2026-42501  
                        go-src | CVE-2026-39817   | https://security-tracker.debian.org/tracker/CVE-2026-39817  
                        go-src | CVE-2026-39836   | https://security-tracker.debian.org/tracker/CVE-2026-39836  
                        go-src | CVE-2026-39819   | https://security-tracker.debian.org/tracker/CVE-2026-39819  
                        go-src | CVE-2026-39823   | https://security-tracker.debian.org/tracker/CVE-2026-39823  
                        go-src | CVE-2026-39820   | https://security-tracker.debian.org/tracker/CVE-2026-39820  
                        go-src | CVE-2026-39825   | https://security-tracker.debian.org/tracker/CVE-2026-39825  
                        go-src | CVE-2026-39826   | https://security-tracker.debian.org/tracker/CVE-2026-39826  
                        go-src | CVE-2026-27140   | https://security-tracker.debian.org/tracker/CVE-2026-27140  
                        go-src | CVE-2026-27139   | https://security-tracker.debian.org/tracker/CVE-2026-27139  
                        go-src | CVE-2026-27144   | https://security-tracker.debian.org/tracker/CVE-2026-27144  
                        go-src | CVE-2026-27142   | https://security-tracker.debian.org/tracker/CVE-2026-27142  
                        go-src | CVE-2026-27143   | https://security-tracker.debian.org/tracker/CVE-2026-27143  
                        go-src | CVE-2026-25679   | https://security-tracker.debian.org/tracker/CVE-2026-25679  
                        go-src | CVE-2026-32280   | https://security-tracker.debian.org/tracker/CVE-2026-32280  
                        go-src | CVE-2026-32283   | https://security-tracker.debian.org/tracker/CVE-2026-32283  
                        go-src | CVE-2026-32282   | https://security-tracker.debian.org/tracker/CVE-2026-32282  
                        go-src | CVE-2026-32289   | https://security-tracker.debian.org/tracker/CVE-2026-32289  
                        go-src | CVE-2026-32288   | https://security-tracker.debian.org/tracker/CVE-2026-32288  
                        go-src | CVE-2026-32281   | https://security-tracker.debian.org/tracker/CVE-2026-32281  
                          grpc | CVE-2026-33186   | https://security-tracker.debian.org/tracker/CVE-2026-33186  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
                      harfbuzz | CVE-2026-22693   | https://security-tracker.debian.org/tracker/CVE-2026-22693  
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-42050   | https://security-tracker.debian.org/tracker/CVE-2026-42050  
                         janet | CVE-2026-2240    | https://security-tracker.debian.org/tracker/CVE-2026-2240   
                         janet | CVE-2026-2242    | https://security-tracker.debian.org/tracker/CVE-2026-2242   
                         janet | CVE-2026-2241    | https://security-tracker.debian.org/tracker/CVE-2026-2241   
                         janet | CVE-2026-2869    | https://security-tracker.debian.org/tracker/CVE-2026-2869   
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libbson | CVE-2024-6381    | https://security-tracker.debian.org/tracker/CVE-2024-6381   
                       libbson | CVE-2025-0755    | https://security-tracker.debian.org/tracker/CVE-2025-0755   
                       libcdio | CVE-2024-36600   | https://security-tracker.debian.org/tracker/CVE-2024-36600  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                  libfreeimage | CVE-2025-70968   | https://security-tracker.debian.org/tracker/CVE-2025-70968  
                  libfreeimage | CVE-2025-65803   | https://security-tracker.debian.org/tracker/CVE-2025-65803  
                     libgcrypt | CVE-2026-41989   | https://security-tracker.debian.org/tracker/CVE-2026-41989  
                      libglib2 | CVE-2025-14512   | https://security-tracker.debian.org/tracker/CVE-2025-14512  
                      libglib2 | CVE-2025-13601   | https://security-tracker.debian.org/tracker/CVE-2025-13601  
                      libglib2 | CVE-2025-14087   | https://security-tracker.debian.org/tracker/CVE-2025-14087  
                      libglib2 | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
            libglib2-bootstrap | CVE-2025-14512   | https://security-tracker.debian.org/tracker/CVE-2025-14512  
            libglib2-bootstrap | CVE-2025-13601   | https://security-tracker.debian.org/tracker/CVE-2025-13601  
            libglib2-bootstrap | CVE-2025-14087   | https://security-tracker.debian.org/tracker/CVE-2025-14087  
            libglib2-bootstrap | CVE-2025-6052    | https://security-tracker.debian.org/tracker/CVE-2025-6052   
            libglib2-bootstrap | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                       libheif | CVE-2026-32738   | https://security-tracker.debian.org/tracker/CVE-2026-32738  
                       libheif | CVE-2026-32740   | https://security-tracker.debian.org/tracker/CVE-2026-32740  
                       libheif | CVE-2026-32739   | https://security-tracker.debian.org/tracker/CVE-2026-32739  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                       libssh2 | CVE-2026-7598    | https://security-tracker.debian.org/tracker/CVE-2026-7598   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                  liburiparser | CVE-2026-44927   | https://security-tracker.debian.org/tracker/CVE-2026-44927  
                  liburiparser | CVE-2026-44928   | https://security-tracker.debian.org/tracker/CVE-2026-44928  
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                  libvncserver | CVE-2026-32854   | https://security-tracker.debian.org/tracker/CVE-2026-32854  
                  libvncserver | CVE-2026-32853   | https://security-tracker.debian.org/tracker/CVE-2026-32853  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-3494    | https://security-tracker.debian.org/tracker/CVE-2026-3494   
                       mbedtls | CVE-2025-66442   | https://security-tracker.debian.org/tracker/CVE-2025-66442  
                     memcached | CVE-2026-47784   | https://security-tracker.debian.org/tracker/CVE-2026-47784  
                     memcached | CVE-2026-47783   | https://security-tracker.debian.org/tracker/CVE-2026-47783  
                        mesa3d | CVE-2026-40393   | https://security-tracker.debian.org/tracker/CVE-2026-40393  
                mesa3d-headers | CVE-2026-40393   | https://security-tracker.debian.org/tracker/CVE-2026-40393  
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2026-35387   | https://security-tracker.debian.org/tracker/CVE-2026-35387  
                       openssh | CVE-2026-35386   | https://security-tracker.debian.org/tracker/CVE-2026-35386  
                       openssh | CVE-2026-35388   | https://security-tracker.debian.org/tracker/CVE-2026-35388  
                       openssh | CVE-2026-35385   | https://security-tracker.debian.org/tracker/CVE-2026-35385  
                       openssh | CVE-2026-35414   | https://security-tracker.debian.org/tracker/CVE-2026-35414  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2025-14179   | https://security-tracker.debian.org/tracker/CVE-2025-14179  
                           php | CVE-2026-7262    | https://security-tracker.debian.org/tracker/CVE-2026-7262   
                           php | CVE-2026-7258    | https://security-tracker.debian.org/tracker/CVE-2026-7258   
                           php | CVE-2026-7261    | https://security-tracker.debian.org/tracker/CVE-2026-7261   
                           php | CVE-2026-7259    | https://security-tracker.debian.org/tracker/CVE-2026-7259   
                           php | CVE-2026-6735    | https://security-tracker.debian.org/tracker/CVE-2026-6735   
                           php | CVE-2026-6722    | https://security-tracker.debian.org/tracker/CVE-2026-6722   
                           php | CVE-2026-7568    | https://security-tracker.debian.org/tracker/CVE-2026-7568   
                    postgresql | CVE-2026-6475    | https://security-tracker.debian.org/tracker/CVE-2026-6475   
                    postgresql | CVE-2026-6479    | https://security-tracker.debian.org/tracker/CVE-2026-6479   
                    postgresql | CVE-2026-6473    | https://security-tracker.debian.org/tracker/CVE-2026-6473   
                    postgresql | CVE-2026-6476    | https://security-tracker.debian.org/tracker/CVE-2026-6476   
                    postgresql | CVE-2026-6477    | https://security-tracker.debian.org/tracker/CVE-2026-6477   
                    postgresql | CVE-2026-6478    | https://security-tracker.debian.org/tracker/CVE-2026-6478   
                    postgresql | CVE-2026-6474    | https://security-tracker.debian.org/tracker/CVE-2026-6474   
                    postgresql | CVE-2026-6472    | https://security-tracker.debian.org/tracker/CVE-2026-6472   
                    postgresql | CVE-2026-6637    | https://security-tracker.debian.org/tracker/CVE-2026-6637   
                    postgresql | CVE-2026-6638    | https://security-tracker.debian.org/tracker/CVE-2026-6638   
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                      protobuf | CVE-2026-0994    | https://security-tracker.debian.org/tracker/CVE-2026-0994   
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2025-69228   | https://security-tracker.debian.org/tracker/CVE-2025-69228  
                python-aiohttp | CVE-2025-69230   | https://security-tracker.debian.org/tracker/CVE-2025-69230  
                python-aiohttp | CVE-2025-69227   | https://security-tracker.debian.org/tracker/CVE-2025-69227  
                python-aiohttp | CVE-2025-69229   | https://security-tracker.debian.org/tracker/CVE-2025-69229  
                python-aiohttp | CVE-2025-69226   | https://security-tracker.debian.org/tracker/CVE-2025-69226  
                python-aiohttp | CVE-2025-69223   | https://security-tracker.debian.org/tracker/CVE-2025-69223  
                python-aiohttp | CVE-2025-69224   | https://security-tracker.debian.org/tracker/CVE-2025-69224  
                python-aiohttp | CVE-2025-69225   | https://security-tracker.debian.org/tracker/CVE-2025-69225  
                python-aiohttp | CVE-2026-22815   | https://security-tracker.debian.org/tracker/CVE-2026-22815  
                python-aiohttp | CVE-2026-34516   | https://security-tracker.debian.org/tracker/CVE-2026-34516  
                python-aiohttp | CVE-2026-34514   | https://security-tracker.debian.org/tracker/CVE-2026-34514  
                python-aiohttp | CVE-2026-34519   | https://security-tracker.debian.org/tracker/CVE-2026-34519  
                python-aiohttp | CVE-2026-34520   | https://security-tracker.debian.org/tracker/CVE-2026-34520  
                python-aiohttp | CVE-2026-34513   | https://security-tracker.debian.org/tracker/CVE-2026-34513  
                python-aiohttp | CVE-2026-34517   | https://security-tracker.debian.org/tracker/CVE-2026-34517  
                python-aiohttp | CVE-2026-34525   | https://security-tracker.debian.org/tracker/CVE-2026-34525  
                python-aiohttp | CVE-2026-34518   | https://security-tracker.debian.org/tracker/CVE-2026-34518  
                python-aiohttp | CVE-2026-34515   | https://security-tracker.debian.org/tracker/CVE-2026-34515  
           python-cryptography | CVE-2026-26007   | https://security-tracker.debian.org/tracker/CVE-2026-26007  
           python-cryptography | CVE-2026-34073   | https://security-tracker.debian.org/tracker/CVE-2026-34073  
                 python-django | CVE-2026-5766    | https://security-tracker.debian.org/tracker/CVE-2026-5766   
                 python-django | CVE-2026-6907    | https://security-tracker.debian.org/tracker/CVE-2026-6907   
                 python-django | CVE-2026-35192   | https://security-tracker.debian.org/tracker/CVE-2026-35192  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
                   python-mako | CVE-2026-41205   | https://security-tracker.debian.org/tracker/CVE-2026-41205  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-tornado | CVE-2026-35536   | https://security-tracker.debian.org/tracker/CVE-2026-35536  
                python-tornado | CVE-2026-31958   | https://security-tracker.debian.org/tracker/CVE-2026-31958  
                python-twisted | CVE-2026-42304   | https://security-tracker.debian.org/tracker/CVE-2026-42304  
                python-urllib3 | CVE-2026-44432   | https://security-tracker.debian.org/tracker/CVE-2026-44432  
                python-urllib3 | CVE-2026-44431   | https://security-tracker.debian.org/tracker/CVE-2026-44431  
               python-werkzeug | CVE-2025-66221   | https://security-tracker.debian.org/tracker/CVE-2025-66221  
               python-werkzeug | CVE-2026-21860   | https://security-tracker.debian.org/tracker/CVE-2026-21860  
               python-werkzeug | CVE-2026-27199   | https://security-tracker.debian.org/tracker/CVE-2026-27199  
                       python3 | CVE-2025-13837   | https://security-tracker.debian.org/tracker/CVE-2025-13837  
                       python3 | CVE-2025-12781   | https://security-tracker.debian.org/tracker/CVE-2025-12781  
                       python3 | CVE-2025-12084   | https://security-tracker.debian.org/tracker/CVE-2025-12084  
                       python3 | CVE-2026-4519    | https://security-tracker.debian.org/tracker/CVE-2026-4519   
                       python3 | CVE-2026-3087    | https://security-tracker.debian.org/tracker/CVE-2026-3087   
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2025-54566   | https://security-tracker.debian.org/tracker/CVE-2025-54566  
                          qemu | CVE-2025-54567   | https://security-tracker.debian.org/tracker/CVE-2025-54567  
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                       qt6base | CVE-2025-5683    | https://security-tracker.debian.org/tracker/CVE-2025-5683   
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                         rsync | CVE-2026-29518   | https://security-tracker.debian.org/tracker/CVE-2026-29518  
                         rsync | CVE-2026-45232   | https://security-tracker.debian.org/tracker/CVE-2026-45232  
                         rsync | CVE-2026-43619   | https://security-tracker.debian.org/tracker/CVE-2026-43619  
                         rsync | CVE-2026-43617   | https://security-tracker.debian.org/tracker/CVE-2026-43617  
                         rsync | CVE-2026-43618   | https://security-tracker.debian.org/tracker/CVE-2026-43618  
                         rsync | CVE-2026-43620   | https://security-tracker.debian.org/tracker/CVE-2026-43620  
                          runc | CVE-2025-31133   | https://security-tracker.debian.org/tracker/CVE-2025-31133  
                          runc | CVE-2025-52881   | https://security-tracker.debian.org/tracker/CVE-2025-52881  
                          runc | CVE-2025-52565   | https://security-tracker.debian.org/tracker/CVE-2025-52565  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         squid | CVE-2026-33515   | https://security-tracker.debian.org/tracker/CVE-2026-33515  
                         squid | CVE-2026-33526   | https://security-tracker.debian.org/tracker/CVE-2026-33526  
                         squid | CVE-2026-32748   | https://security-tracker.debian.org/tracker/CVE-2026-32748  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-53538   | https://security-tracker.debian.org/tracker/CVE-2025-53538  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                      suricata | CVE-2025-64344   | https://security-tracker.debian.org/tracker/CVE-2025-64344  
                      suricata | CVE-2025-64332   | https://security-tracker.debian.org/tracker/CVE-2025-64332  
                      suricata | CVE-2025-64333   | https://security-tracker.debian.org/tracker/CVE-2025-64333  
                      suricata | CVE-2025-64330   | https://security-tracker.debian.org/tracker/CVE-2025-64330  
                      suricata | CVE-2025-64331   | https://security-tracker.debian.org/tracker/CVE-2025-64331  
                      suricata | CVE-2025-59147   | https://security-tracker.debian.org/tracker/CVE-2025-59147  
                      suricata | CVE-2026-22264   | https://security-tracker.debian.org/tracker/CVE-2026-22264  
                      suricata | CVE-2026-22259   | https://security-tracker.debian.org/tracker/CVE-2026-22259  
                      suricata | CVE-2026-22262   | https://security-tracker.debian.org/tracker/CVE-2026-22262  
                      suricata | CVE-2026-22258   | https://security-tracker.debian.org/tracker/CVE-2026-22258  
                      suricata | CVE-2026-22261   | https://security-tracker.debian.org/tracker/CVE-2026-22261  
                      suricata | CVE-2026-31932   | https://security-tracker.debian.org/tracker/CVE-2026-31932  
                      suricata | CVE-2026-31935   | https://security-tracker.debian.org/tracker/CVE-2026-31935  
                      suricata | CVE-2026-31937   | https://security-tracker.debian.org/tracker/CVE-2026-31937  
                      suricata | CVE-2026-31933   | https://security-tracker.debian.org/tracker/CVE-2026-31933  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40226   | https://security-tracker.debian.org/tracker/CVE-2026-40226  
                       systemd | CVE-2026-40225   | https://security-tracker.debian.org/tracker/CVE-2026-40225  
                       systemd | CVE-2026-29111   | https://security-tracker.debian.org/tracker/CVE-2026-29111  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                   uboot-tools | CVE-2024-42040   | https://security-tracker.debian.org/tracker/CVE-2024-42040  
                   uboot-tools | CVE-2024-57259   | https://security-tracker.debian.org/tracker/CVE-2024-57259  
                   uboot-tools | CVE-2024-57254   | https://security-tracker.debian.org/tracker/CVE-2024-57254  
                   uboot-tools | CVE-2024-57257   | https://security-tracker.debian.org/tracker/CVE-2024-57257  
                   uboot-tools | CVE-2024-57258   | https://security-tracker.debian.org/tracker/CVE-2024-57258  
                   uboot-tools | CVE-2024-57255   | https://security-tracker.debian.org/tracker/CVE-2024-57255  
                   uboot-tools | CVE-2024-57256   | https://security-tracker.debian.org/tracker/CVE-2024-57256  
                   uboot-tools | CVE-2026-33243   | https://security-tracker.debian.org/tracker/CVE-2026-33243  
                       unbound | CVE-2026-41292   | https://security-tracker.debian.org/tracker/CVE-2026-41292  
                       unbound | CVE-2026-42534   | https://security-tracker.debian.org/tracker/CVE-2026-42534  
                       unbound | CVE-2026-33278   | https://security-tracker.debian.org/tracker/CVE-2026-33278  
                       unbound | CVE-2026-32792   | https://security-tracker.debian.org/tracker/CVE-2026-32792  
                       unbound | CVE-2026-44390   | https://security-tracker.debian.org/tracker/CVE-2026-44390  
                       unbound | CVE-2026-44608   | https://security-tracker.debian.org/tracker/CVE-2026-44608  
                       unbound | CVE-2026-42923   | https://security-tracker.debian.org/tracker/CVE-2026-42923  
                       unbound | CVE-2026-42960   | https://security-tracker.debian.org/tracker/CVE-2026-42960  
                       unbound | CVE-2026-42944   | https://security-tracker.debian.org/tracker/CVE-2026-42944  
                       unbound | CVE-2026-42959   | https://security-tracker.debian.org/tracker/CVE-2026-42959  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
               util-linux-libs | CVE-2026-27456   | https://security-tracker.debian.org/tracker/CVE-2026-27456  
                           vim | CVE-2026-46483   | https://security-tracker.debian.org/tracker/CVE-2026-46483  
                           vim | CVE-2026-28419   | https://security-tracker.debian.org/tracker/CVE-2026-28419  
                           vim | CVE-2026-28422   | https://security-tracker.debian.org/tracker/CVE-2026-28422  
                           vim | CVE-2026-28418   | https://security-tracker.debian.org/tracker/CVE-2026-28418  
                           vim | CVE-2026-28421   | https://security-tracker.debian.org/tracker/CVE-2026-28421  
                           vim | CVE-2026-28420   | https://security-tracker.debian.org/tracker/CVE-2026-28420  
                           vim | CVE-2026-28417   | https://security-tracker.debian.org/tracker/CVE-2026-28417  
                           vim | CVE-2026-45130   | https://security-tracker.debian.org/tracker/CVE-2026-45130  
                           vim | CVE-2026-39881   | https://security-tracker.debian.org/tracker/CVE-2026-39881  
                           vim | CVE-2026-41411   | https://security-tracker.debian.org/tracker/CVE-2026-41411  
                           vim | CVE-2026-35177   | https://security-tracker.debian.org/tracker/CVE-2026-35177  
                           vim | CVE-2026-33412   | https://security-tracker.debian.org/tracker/CVE-2026-33412  
                           vim | CVE-2026-44656   | https://security-tracker.debian.org/tracker/CVE-2026-44656  
                           vim | CVE-2026-34982   | https://security-tracker.debian.org/tracker/CVE-2026-34982  
                           vim | CVE-2026-42307   | https://security-tracker.debian.org/tracker/CVE-2026-42307  
                           vim | CVE-2026-34714   | https://security-tracker.debian.org/tracker/CVE-2026-34714  
                     wireshark | CVE-2026-0962    | https://security-tracker.debian.org/tracker/CVE-2026-0962   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-31142   | https://security-tracker.debian.org/tracker/CVE-2024-31142  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-27466   | https://security-tracker.debian.org/tracker/CVE-2025-27466  
                           xen | CVE-2025-58143   | https://security-tracker.debian.org/tracker/CVE-2025-58143  
                           xen | CVE-2025-58145   | https://security-tracker.debian.org/tracker/CVE-2025-58145  
                           xen | CVE-2025-58142   | https://security-tracker.debian.org/tracker/CVE-2025-58142  
                           xen | CVE-2025-58144   | https://security-tracker.debian.org/tracker/CVE-2025-58144  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
