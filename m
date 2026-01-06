Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A35ECD043D
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 06:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED753607D1;
	Tue,  6 Jan 2026 06:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id muSOKaBAvjNl; Tue,  6 Jan 2026 06:08:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2D116073E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767679690;
	bh=9TndLKMPBYS+cCzjxQ7+dSs52KzJ7KolY5N90vHdNhM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qjVD2rA+Nvuh9Lxn2q/esV3dK5OBvPLvAZPgMxdtHii/mYE1V/7hzFqyPfR9JWKEX
	 ys5deQc5UnGalNR7ZWWPpA1AH+n9H6OJs3jSj4EcAx3FtRFWMAnUywgSjIo9RjAiKy
	 5ayNLYuwKYph6MDGbcl22vFR3ceeEJCJ+QkFwuqVZLvYjZFro/NA4HjiANV+G/57h4
	 KCaGb5TWBEOt2ux3EpMyW4des4HDoPwkKTEJE07OIOKpqoXLiapJIaUvg7EFc2NgmR
	 BgspcMsMW2I06H+zGiyPYDgij6GYoWeYLqPmQ2PT0Tt4BC+std1VN6i+9fcQh+zMhh
	 yVNkNhKTQ/2ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2D116073E;
	Tue,  6 Jan 2026 06:08:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F006E7
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 06:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 658A340691
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 06:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHebfV8n5shE for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 06:08:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 40A3E40632
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40A3E40632
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40A3E40632
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 06:08:07 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-59b67388c9cso271731e87.2
 for <buildroot@buildroot.org>; Mon, 05 Jan 2026 22:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767679685; x=1768284485;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BSFmvewfr9xaSfKu2WhdYAdJNBfN7QvJKO5S81bYInQ=;
 b=My9896rZ9wnw/3al47wjqVVIvRpIFGISsOtT3KNczJqJkuYUveNKylK/KM6UJC/g90
 yNitAzbRJmrvq1FOiXz/E+0ciWddnSgU0VX2r0H35uDQ4Kk0qDXwhd5mKCSbl1ua6e49
 k6XAUQcDDqlT52+xMt2QzAp4yAM1dLUhbgQO3aOdfmbhmpofNtvdfuS3EljVvS7Ht1S/
 /nwKYY7y9/1bw+eOy9hQVjELY2+pEaJQUi4UDDaMEKN2fwC93VZbWsCLbWKnd+Venx2y
 mbLd+ko9OkMMacXnKJwxltAts+ESJ7oVPZw48EaUbjhChLvchSemTAfxTE0h24e2d1lB
 YBEQ==
X-Gm-Message-State: AOJu0Yy3RM0QMp1kbmGzNGc/GQedS3gHBUFan2tcnc/iB7t3xrxWmX1Q
 xbZBBxVnqFgNwD60b2b87Azq1dSpB3c97QujDqCIQIbX8wnBhO5oNCIoynLA4A==
X-Gm-Gg: AY/fxX5ns9LCLDMtFwckYYP9VwbNjajIR5yS37BBa2qZC1gNb3EEb9B/97WP0KadXhy
 vliQ0QLNIWcq/kBKhhZLv45DZiC3ApDKtMMfYo7pcoL0oqEUPZObdjkZ79K9kpW966+gecGn57e
 pxmVYLh6CIR3vW8agFpD+TnCBgG8EI6qENEGWeISTgYs3JvIb66CrC6f27S7eIULeu6lGQJJhNu
 FmM+ifVIDtdvca+GXt5ryT897S+a4MTqrSznv6xboW4Ih87bzyzLQL4WyhncS2VicbGIDSB1C01
 gSAuSlkAQhFbyFrq8IkQDFtJFghhH74NkIo3graYkoGNKDYppuqfo5KJt9NzG4r3MprA6cZHGeK
 YGcDQg78VPyeIed9DXZRr5sXjioOmAe6HoPO0DDej5mUwLc4zHwNxomozvtBXn5eSmuJIv6nGZ1
 n8fgX/tW07ECN7glbhKw==
X-Google-Smtp-Source: AGHT+IHjojl41180o4XVFEfu0OD7JUmkLcCIrTOg/vzO/YAIDdV2cBw7RxwfI1F8JJoGuHL8rqxjSg==
X-Received: by 2002:a05:600c:4e0b:b0:477:3e0b:c0e3 with SMTP id
 5b1f17b1804b1-47d7f0a2cf3mr17141445e9.32.1767673453196; 
 Mon, 05 Jan 2026 20:24:13 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7fb4c451sm8497005e9.5.2026.01.05.20.24.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 20:24:12 -0800 (PST)
Message-ID: <695c8e6c.050a0220.112f51.c060@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 06 Jan 2026 04:24:12 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767679685; x=1768284485; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=BSFmvewfr9xaSfKu2WhdYAdJNBfN7QvJKO5S81bYInQ=;
 b=G/vPz68jsvgsgIzTmpwQsbEUHxhgh8TjDag0V2fFVPdMEcNnobm2wAgxGt/uZpD0Rn
 LCHhkgbrnn2dud1bCO59jS51la543p3EQLDymyfSr0hW22ax634QyZm+QMjD6qjun1qx
 P5otijxMP2KDQPNkuYlugOyaj7T3eU0J3dn9RLb1RtfYhBHT8PlEuSnRA0gLZs2/hnZ7
 EQXAcn3Oed6x4G8Q1KoktWeB4HoiIft5fl0fOCNvkV49cVDgVZbdzzK3cm4yCCORouHu
 nVK9FJt79RW7QGCerivxAlBpow1YLF7HTFqDLOwGNBpXUybaAhLgC07WIqliQIrxXLKM
 DdNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G/vPz68j
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-05
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

Autobuild statistics for 2026-01-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 18  | 42  |  0  | 60  |
  2025.11.x  | 10  | 17  |  0  | 27  |
    master   | 57  | 141 |  3  | 201 |

Classification of failures by reason for master
-----------------------------------------------

                       cfm-0.3 | 8 
                   dash-0.5.13 | 8 
                 jasper-2.0.33 | 8 
                       unknown | 7 
                openobex-1.7.2 | 4 
                openssh-10.2p1 | 4 
                  brotli-1.2.0 | 3 
                   cvs-1.12.13 | 3 
                 dc3dd-7.2.641 | 3 
                  libsvg-0.1.4 | 3 
                    mpir-3.0.0 | 3 
uqmi-0a19b5b77140465c29e2af... | 3 
             berkeleydb-5.3.28 | 2 
              e2fsprogs-1.47.3 | 2 
            gdk-pixbuf-2.42.12 | 2 
            gettext-gnu-0.22.4 | 2 
           ghostscript-10.06.0 | 2 
              libopenssl-3.6.0 | 2 
     libphidget-2.1.9.20190409 | 2 
                libselinux-3.9 | 2 
                netdata-1.37.1 | 2 
               nfs-utils-2.8.4 | 2 
                   nqptp-1.2.4 | 2 
                openswan-3.0.0 | 2 
                   perl-5.42.0 | 2 
uhttpd-15346de8d3ba42200249... | 2 
          aardvark-dns-v1.17.0 | 1 
                 aichat-0.30.0 | 1 
am33x-cm3-fb484c5e54f2e31cf... | 1 
android-tools-4.2.2+git2013... | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
             batman-adv-2025.4 | 1 
                  cairo-1.18.4 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
                easydbus-0.1.0 | 1 
                   exim-4.99.1 | 1 
                    fcft-3.3.2 | 1 
                        ffmpeg | 1 
              fftw-quad-3.3.10 | 1 
flashbench-2e30b1968a661474... | 1 
glibc-2.42-3-gbc13db7393773... | 1 
                        gnutls | 1 
  gobject-introspection-1.84.0 | 1 
               graphene-1.10.8 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
             igt-gpu-tools-2.3 | 1 
                  iozone-3.508 | 1 
                 libcddb-1.3.2 | 1 
libdill-32d0e8b733416208e04... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
libfutils-c326ce0cc2a735438... | 1 
             libgphoto2-2.5.33 | 1 
           libmicrohttpd-1.0.2 | 1 
                libsoup3-3.6.5 | 1 
                  libva-2.23.0 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
                 lockdev-1.0.3 | 1 
                   lsof-4.99.4 | 1 
        ltp-testsuite-20250930 | 1 
                  luv-1.43.0-0 | 1 
                  nginx-1.26.3 | 1 
             ntfs-3g-2022.10.3 | 1 
           oath-toolkit-2.6.13 | 1 
                    olsr-0.9.8 | 1 
                parprouted-0.7 | 1 
      passt-2025_06_11.0293c6f | 1 
               pcsc-lite-2.1.0 | 1 
          pkcs11-helper-1.30.0 | 1 
               pulseaudio-17.0 | 1 
           python-bcrypt-5.0.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                   qemu-10.1.0 | 1 
                rocksdb-6.20.3 | 1 
                  rp-pppoe-4.0 | 1 
                 rpcbind-1.2.8 | 1 
          sane-airscan-0.99.33 | 1 
               syslog-ng-4.8.3 | 1 
               trousers-0.3.15 | 1 
ustream-ssl-5a81c108d20e247... | 1 
               valgrind-3.26.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/50e71c5892e6bbd9ea16387b900f11b33a2980c7 | ORPH
  aarch64    |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/3aff7f7aaa1d106612e1a6afb93b7408e42e2698 |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/6f0ad5822a249ea5810271603f945837b2b3ae90 | ORPH
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/b5cae19753a1f0467361598664cccf7e7341109e |     
microblazeel | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/94415ec9a98ffa8ffbd9f4236285c3cbae4f85ef |     
    arc      |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/f771f887412bb4fa9a3638e37f353d3b86828a81 |     
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/3aabe0d419d51dbba54e9847e4189cd8a697c730 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/acb95ae53a476b138deb7e5fcaa7117fc32f60bd | ORPH
    arc      |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/ffa7fb6226eab7810ea2937db865cc32cb836794 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/8c3943b4b0091bc954ea0c509d519c22c0e80fc4 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/ac88e63a4d931267725c4bb9eff3e9b5fdb9a18a |     
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/d4d9b7fed60c2d4ca3a6cd5895cac40fbac658ce |     
    i686     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/708adb663c106f871ea138f23f1cf993d4a9eef8 |     
  powerpc    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/82db4cd7dfb7900e4c8f00aaf651e0baddc8fe15 |     
   sh4aeb    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/5eafa19f3e77999a0cd3afd1749bb955aa1b054a |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/2de0d6598f8da53f04e225392e232cb8c75e6e4c |     
   s390x     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/9eaef8abdabfec704e9413ba3d5a457766a8d1df |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/c6e8c068e405347e27958695bf6c73d72bccbe9d |     
  sparc64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/a432535ffe3c86ced7a648eadd1c274db5501d31 |     
    or1k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/66fc3382263a9814deba3494771348b779ee86e9 |     
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e96dd29b247a1b54a05a31f3985e5669e93d174d | ORPH
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ffad9b14c26f6fa0e2cc1784761b5f6199d1ab9d | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2be72ec7c8c5bbfb6d7669992e0a1450b242b6ca | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/43bbb710165df1ce05c8025ea5ed9321dd4935b4 | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/62c66b1ff15c66c7dd826a5030cfaf88252e60e2 | ORPH
 microblaze  |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/a9201ed5b8169c35c1e3394fd176fdbb81876073 |     
  powerpc    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/a9438cfaaed9b82d18449f2f48a0289fd6a38a49 |     
 aarch64_be  |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/8e0d9977e5a9fa136c67cfb2333678e2bfeb53d5 |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/ef24619d287c5cea169957529f226a593b04ed9d |     
    arm      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/85481fbafa96129be6755176ae11cb262e593f8d |     
    or1k     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/0ca5bd20dab8ec8c77059a1ed3e5c41cdd581b27 |     
  mips64el   |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/ea2b852c306bf4519b3c6d9e7301e4ad8a5a4140 |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/0c37a47a227982a4e37be1871899f3cd62af7f03 |     
powerpc64le  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/bdd8d81199751bbfea4a5e1b11e74102947a78ad | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/2575202e9a5164a4068a943fb36445cd63e61f0c | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/e6f56dc326e81d334bbd464a035189556b268906 | ORPH
  aarch64    |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/ff4050b52ddab110d693a161d5f75b0416357477 | ORPH
  mips64el   |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/7e08c828f547ece4ef6eb3f288eef4f707ba5511 | ORPH
 microblaze  |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/d2c6e9e72023cef9bc5c89da6235a5b8ec1fdd7e |     
    arm      |          exim-4.99.1           | NOK | https://autobuild.buildroot.org/results/fd79884e54ba9cbda9c4c7d99017cc2419082fa9 |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/d02cae97a22175e02b9d1f383ba5756a1cc6640e | ORPH
  riscv64    |             ffmpeg             | TIM | https://autobuild.buildroot.org/results/fd03b110a8cc288d8ee8ca42df18b1aeceb1cbea |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/e028fea91439bf4f14c494d28ab55f3c91ae2c14 | ORPH
 microblaze  | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/3ab1b8196bafe7fa5163f7c25cf898555ead2956 | ORPH
   sparc     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a6ba827eac2a739dd43c332bc3528f3009b1c379 | ORPH
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/99fbd9596f3b9258ea7215c1c0b62fb38adad572 | ORPH
  mips64el   |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/3ab7ce8d80750f5c4f28d06fd8ab0e64400051c7 | ORPH
  mips64el   |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/ae242191dec16642f5ec2a4637a9db64dd3b1f87 | ORPH
    arc      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/bc8c67c37f810ba1b08d8c4e1163cc870e8d906f |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/fcec69e7093084a5ce8f02e5f90b82ab45ed1260 |     
  mips64el   | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/8487deec21f3f1c65e3e9d4dad79a913f6e468c9 |     
   mips64    |             gnutls             | TIM | https://autobuild.buildroot.org/results/f5b5635119cc3250b63f480bee8442d224f3d268 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3dc085b710169199173ac795d8077a556b7d8b8b | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/673074e3e67d0e4058451a72bd3ef7dba66e426f |     
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/beccdf7deb0016cb24e4936b8c6e9f12215a9ffd |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/096d6cc5be55a291e45c77154bef54c01708f784 |     
  sparc64    |       igt-gpu-tools-2.3        | NOK | https://autobuild.buildroot.org/results/ca48ba95b2750da7af81ddca1661a1514930a2e8 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/4464d90673ec3a2792d4cef89d88488f8647bdcd |     
   x86_64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/032123497cf671777b2921fcadbcde91e21decca |     
  sparc64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/9338da9a929b68f7a044f7aa9d7ffb912fd23967 |     
    arm      |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/a627e3c9e7494ff75c7a6d1a6eed373688da6e68 |     
microblazeel |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/713b57da8a692215ec1ce424fa5bb7b7e2ff3a9a |     
powerpc64le  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/e15dc481da0fb7db330aac82c95507f2e44db585 |     
   sparc     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/3fec5f701f7d4c375ad2f3d32e02abd59f3dd478 |     
microblazeel |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/e9de6d379d00398e6ead1f8be5040f42b7d32ca5 |     
    arm      |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/1ccf8d8d39229fb608abeec25f49b489747b0473 |     
  riscv32    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/1e1480108b0c36e314fca4497627c4057c024dd9 |     
   mipsel    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/cf1cc4658f6b664236a1f0c6613d0080e39475d9 |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/a5e4b0b7bdd0eabe0e49d3d5f458c12667c33cca | ORPH
    i686     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/5447bf2b2bfd23663a11c3fd23606d55858d8178 |     
microblazeel | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/b9916e7090a5eef2d9397d44f40b256af7b0db7f |     
  mips64el   |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/72094302ebabd40f4779d74a62959122919d7b2a |     
  riscv64    |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/d423c0eae99d1618432eb5b85387dc2aefee8782 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/17dc835cc834943c5d18fbddb453f9d571eee014 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/55501837db7952e477150f0ac690bf9a11881600 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/dbe6cb7ec215bf306a9ef8a14b7b2c0dedbe3c8e |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a335673edacd86c56eb63f94698100bc2db5a0f7 |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/79e884455dc24fe98061451ba5e4598efa79ad74 |     
   mips64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/fab4c5e599c24ddf605e089c52170bb602be6bea |     
   sh4eb     |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/53b06e6bcd2e62f2a13aeefb8665dd3131ad9990 |     
    i686     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/6f78f5c0e59a20f63e7b73dcaaace516800d9ac0 |     
  riscv32    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/c2b2253f08fb9ff8847a4262424c6c7de53ae3cc |     
powerpc64le  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/782d4fc7196810a07b743958a0d2fc29d1597ddf |     
 aarch64_be  |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/bfcad6a14a252fbb2a2ffe55c51586cf4c1c8411 |     
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e3f5c0b235f9df432e734313b830c204341e133e | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0385d19e9e835ecc76db61a829bf6a5617ec7622 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/bab79782833e9cec6f56a03f7bee60556bad530d | ORPH
  aarch64    |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/ed158a7f494ad773be7196bad029efe7147fdc2d | ORPH
   sparc     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/80c6b0e53709ad82aadaf39d9bdcef20c95e3c55 | ORPH
 powerpc64   |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/94df4bd3fd49e3807e476b1be867cff33f5bf7f9 |     
 aarch64_be  |          luv-1.43.0-0          | NOK | https://autobuild.buildroot.org/results/eee768ded1146e99c82cdfaaf95f461057eb3271 | ORPH
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/4b4870690ae87f8ae7907d568785595e26f03faa |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/22a23229a9f450f6c2af0c53ebef531695fed52d |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/7fa2750694507e2e6182f7eaa0702a77f20eb28c |     
powerpc64le  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/d7c49d9f002303e055d592bd5594cffbf754aaed |     
powerpc64le  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/85b43168444f5f38ab27fedbb1f8f6bfe04d86d1 |     
   mips64    |        nfs-utils-2.8.4         | NOK | https://autobuild.buildroot.org/results/8438f5a0cab061132f238212ba51f0a0ac9ab9b1 |     
    arm      |        nfs-utils-2.8.4         | NOK | https://autobuild.buildroot.org/results/fd649c0164f89df00751564a67a9b5f7e54cedf4 |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/c341a9eb5b3f00955d6fc8d7c278ed64ddf41c42 | ORPH
 aarch64_be  |          nqptp-1.2.4           | NOK | https://autobuild.buildroot.org/results/0c2f380658aeb9a6d1150d9d93142ee82c9ff9b4 |     
   xtensa    |          nqptp-1.2.4           | NOK | https://autobuild.buildroot.org/results/5b5eac85ca0221596ee12ea5e23acde46c6b7edb |     
    sh4      |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/34168c1dce1deef48eadcf938948c71b07db6855 | ORPH
 microblaze  |      oath-toolkit-2.6.13       | NOK | https://autobuild.buildroot.org/results/b86d7c1abc49197b4e9c25f02236bf1147277791 |     
loongarch64  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/c43501ad909b7efa8cafda43f1ac4e2911c13004 | ORPH
    mips     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/59800d05ef59edb8114ac50624083a7f359491a9 | ORPH
   mipsel    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/b75ece02fd7babe2b16f114ae19cf153438b34e7 | ORPH
    i586     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/f3da792c1522a7af28f01625e01cece0e4e5fcce | ORPH
    arm      |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/8d923b3dbfcb393fc47c9786d06b480689f28996 | ORPH
   x86_64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/d32515fdb80dadb25c564957c5b5f104a3849519 | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/f6a8cb5da140982eb3e76c7b0b0905e53bb30ef7 | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/a00637c552cbb88ee05de837599828eaca1e9978 | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/cc9965b75062e0a9f7f5460f78851d0feb2b8989 | ORPH
    or1k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/a54e0619026e8f23ad2ea36fca11e89604c921e1 | ORPH
 microblaze  |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/367bbef29c8512002e3edc7e08288c579091136f | ORPH
 aarch64_be  |         parprouted-0.7         | NOK | https://autobuild.buildroot.org/results/ffe2290e98d96e18629c9db7bcb162316106db2f | ORPH
  riscv32    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/80950c545ef032fc0066a5a468212fbdd5637ef5 | ORPH
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/a7d37bd74f12a79e4dc6d5857fe0c5d915ae0830 | ORPH
   mipsel    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/d128ebbd2807d4843e5f178eba54c308e9f3d442 |     
   armeb     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/2264ca6d0eada30fd78791fa1cd5d3edb62788ce |     
powerpc64le  |      pkcs11-helper-1.30.0      | NOK | https://autobuild.buildroot.org/results/971853992a13483c5fbafeb09a6d7c085ef1f394 | ORPH
  aarch64    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/bebf0389bade1be89c196ff04ece5037ecbaee23 | ORPH
   armeb     |      python-bcrypt-5.0.0       | NOK | https://autobuild.buildroot.org/results/143fb5214c53f2fca1f4b306205161c4018a96fb |     
 microblaze  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/7f56a804f1b53ff765ae8f6e6f562a50fcd7b729 |     
   mipsel    |          qemu-10.1.0           | NOK | https://autobuild.buildroot.org/results/ec2a986846ee988940d83a9bc3aae6ffd7478bb4 |     
 aarch64_be  |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/e812567ec2baf825396857020606220e85d7cce5 |     
    sh4      |          rp-pppoe-4.0          | NOK | https://autobuild.buildroot.org/results/d06c2603f9ceaa7870344b1d59f7afcc16b3441f | ORPH
  aarch64    |         rpcbind-1.2.8          | NOK | https://autobuild.buildroot.org/results/0a575ba4a15d1969e2b68f090bc9c8c293bc0f1d |     
   mips64    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/5a5882b6185a7a9de49c423375bc3c5c958b8b60 |     
    sh4      |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/848d169d9f14ff7c3e0b0cd66b737685dad32347 |     
   s390x     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/5e3d4acbf814e346c2e250bc9266f2cf6ad882a7 |     
    or1k     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/e71a5c70b5c09848607f226920806f28b9ebe3e3 | ORPH
   armeb     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/4754de9f75d8cc6998fe33eb65c73beba48cb426 | ORPH
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/dca7ddc7851f28925e6ba7fa0ab91e6ce0787e7d |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/b95ac4e8e72fc873e0d466cccc78973350f439d6 |     
  mips64el   |            unknown             | TIM | https://autobuild.buildroot.org/results/5774e66196ec4aa1994467ca039bfb05385afab8 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/3e17781cb2f05d849e2f8107507b1757f1ac30ab |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/12e6bc3384db931ab1e126610c3b8010998953b3 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/5c2aa68998d88cf6edc8cfa2143ccd488376d8e7 |     
    sh4a     |            unknown             | NOK | https://autobuild.buildroot.org/results/c257a2124010885e1e659f37015dea9b434ddd36 |     
   mips64    | uqmi-0a19b5b77140465c29e2af... | NOK | https://autobuild.buildroot.org/results/bc643c14c098a45cd52895c1e5e611abc519c736 | ORPH
   s390x     | uqmi-0a19b5b77140465c29e2af... | NOK | https://autobuild.buildroot.org/results/975b6b126d8754379f92e5f829c257695c9e69e9 | ORPH
   s390x     | uqmi-0a19b5b77140465c29e2af... | NOK | https://autobuild.buildroot.org/results/92293928888d784326f06d0f579bce502aef4b88 | ORPH
 aarch64_be  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/4e0cfc35b1d635e1b13f1359b610bfe241aeaf2f | ORPH
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/84cd2cb3864697496f028947d7cfc293aff64173 | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

               asterisk-22.5.2 | 1 
                  brotli-1.2.0 | 1 
                   cvs-1.12.13 | 1 
           dmraid-1.0.0.rc16-3 | 1 
               freeipmi-1.6.16 | 1 
            igd2-for-linux-2.2 | 1 
               libglib2-2.86.1 | 1 
              libopenssl-3.6.0 | 1 
                 lockdev-1.0.3 | 1 
              luabitop-1.0.2-1 | 1 
                    mpir-3.0.0 | 1 
                parprouted-0.7 | 1 
                   perl-5.40.3 | 1 
python-remi-2022.7.27-37-g1... | 1 
             strongswan-5.9.14 | 1 
               trousers-0.3.15 | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/e42c60d6715e5e5a7cc711784be5609247e03d7d |     
   arceb     |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/cf70e4107fedac6646dccbdb6a291dd444816e82 |     
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/fd4f9618340cce5a8a29f814b67021231b678b4e | ORPH
    mips     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/e989103cb75b4311c146ca7fae2582985753a6b2 |     
microblazeel |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/1ace77312e163b4a18408b309074cdee2fb74a20 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/d7a1801b8a6da7cc50c5752b12f23b3c5bad3624 |     
    m68k     |        libglib2-2.86.1         | NOK | https://autobuild.buildroot.org/results/218407afeae4b2b5a6b8621843283b7e3f74c046 |     
   arceb     |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/4fd3683ed6ac4a8f8284553c6d1625b16001fa3b | ORPH
    i686     |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/281f4d7c9c409ce0a81e08717a0f352be58fc501 | ORPH
  mips64el   |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/3b99f7cd8f4e9498f2006571e1e3838e53f16212 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8026ba0bff4458bb3d5f1ad5adb70d2ab1bb284e |     
 powerpc64   |         parprouted-0.7         | NOK | https://autobuild.buildroot.org/results/05f4ecbfd1a80f28278cd379cc5c62e7b4590419 | ORPH
   mips64    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/96bad2fb73982f599e40bb488795280c1479b216 |     
    m68k     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/1d63009050c8d11f5d8535ecc8b8545345a6f155 |     
powerpc64le  |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/bb28244402014a0191633f0e89d01b6075325062 |     
   s390x     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/6f9b65e299cde64dce1f273db0cc2ea99a51d311 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/dd64d74749743f5056e3443a95544bab05482479 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libxslt-1.1.45 | 12
                libxslt-1.1.45 | 7 
                       unknown | 3 
                 c-icap-0.5.10 | 1 
                   dante-1.4.4 | 1 
              erlang-26.2.5.15 | 1 
                espflash-3.2.0 | 1 
                    fcft-3.1.8 | 1 
                  ffmpeg-6.1.3 | 1 
  gobject-introspection-1.82.0 | 1 
libdill-32d0e8b733416208e04... | 1 
                 libmbus-0.8.0 | 1 
                  libnss-3.108 | 1 
            libxkbcommon-1.9.2 | 1 
              mariadb-10.11.15 | 1 
                    mpir-3.0.0 | 1 
                netdata-1.37.1 | 1 
                   perl-5.40.3 | 1 
procrank_linux-21c30ab4514a... | 1 
       riemann-c-client-1.10.5 | 1 
                  rp-pppoe-4.0 | 1 
                 rtptools-1.22 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/cb2aec94b33f1f1438be5a6482e54ba8c7c3d09a | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/e55f445d54090c739f0840825d5dbc19dd7ca865 | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/f09051b15e6c1f35e7dff3c1e18bd22c16654b20 |     
  sparc64    |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/c2ab6394e5f7f59de30f40abaea7b7cd823ae477 |     
    or1k     |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/41add9a1c97335312f7877602101fe69e34dd26f | ORPH
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/b3735d608357c2192741dfb72c5b8fbc98f7894b |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/11891065194f756e0a927bdf07b2935fe74e067a | ORPH
  sparc64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/65a221e0d455db91a0b634b560a55e3e36669e29 |     
    mips     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/847e325f95e7c39c4c4b4c39512871333d87ccd9 |     
 aarch64_be  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/e710eb6c8b3611b0b7bebba10972c338c6d1353c |     
  aarch64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/9bb6d7736657cd1df662ad3f1079e212b8b143e2 |     
   mipsel    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/317771353a1e42b64edb81a6b80798f2f93ce820 |     
   s390x     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/922e6364a219f44ccba90021234535da7b28c125 |     
microblazeel |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/35b563367c4746ab5db7a49bdc636818168b3933 |     
 powerpc64   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/75b6037aa35d60d87145066b4534e5fcee496091 |     
   armeb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/e09637c59d5b5dd5f9d47b86ae2b0f0ae00065ef |     
   mipsel    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/e90fda39c316e6a3f2383ce24e6a909d7c00abb8 |     
microblazeel |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/e2f0bddd68cd99e74092391057e798760c02b22d |     
    sh4      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/e1f089c5c2eb3c704494f955f516d947244ddf41 |     
microblazeel | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/e9914ad119cc888eeec876b05f39313ceea4fb69 |     
 powerpc64   |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/287018771231663945c2afb24fa000d958f94447 | ORPH
   s390x     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/1ca17b07f69665c6c8a57f766e2ddccaf1bd69d4 |     
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/de9310888c18b74407ff0dc9532c5b7ccf1cd801 |     
   s390x     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/c64dd6e5361a6c235033c57f144b283dff74d95c |     
  riscv64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/3e41f34b9693d87874e3099770569a9f5c7f12da |     
  riscv32    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/308dd4c8a6570a1b8ad6d6f5fc40a1756a3fba48 |     
 microblaze  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/8290876bc7e6fd272f5dbeaa50aa53bc5e5fb253 |     
  sparc64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/5c7494eb8923c2fd87970bd68c10f3e96c9149c3 |     
  aarch64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/a3267efa176b97757722dd68bdb06bd798252956 |     
  riscv64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/f6a23340bbe62fbe319e39e008ed52126c42b35d |     
 microblaze  |        mariadb-10.11.15        | NOK | https://autobuild.buildroot.org/results/f0bb86d06568b5cffaf10100dfa8005ecff09511 | ORPH
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9bc31a9ee7906ddbbd37bdc452be58827ad0ff47 |     
 powerpc64   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/6449f18ef91cec75086fad57da90b133d13c6756 |     
  powerpc    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/867f689ee36527e3dc0e5dec395177c37e39cd14 |     
    mips     | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/1d03451ddda38c28dadc4a44eab36d332db02d62 |     
   sparc     |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/30a3b4c5c032ae292b09d7faa793f45623e6654a | ORPH
  aarch64    |          rp-pppoe-4.0          | NOK | https://autobuild.buildroot.org/results/070ba2a98043d9a2ead98d18ed19236bc75cccb3 | ORPH
   arceb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/16721d887083541afd872a700f8bf45aa6dee547 | ORPH
    sh4a     |            unknown             | NOK | https://autobuild.buildroot.org/results/20e0d359bbf5e379eab80b8a77d3c7809d5c4cd4 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/256e33608624f772b450147c6352cfd6a24ffd8b |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/2a792a14ee71d053ae0ad8d321cbc67ab2ed60ae |     
    or1k     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/6cad82d76a4be0f7c77777f373e03051793d97b6 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
